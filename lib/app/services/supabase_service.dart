import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase の初期化と匿名ログインを担う。
/// URL / Anon Key は --dart-define で注入し、ソースに埋め込まない。
class SupabaseService {
  static const _url = String.fromEnvironment('SUPABASE_URL');
  static const _publishableKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  /// アプリ起動時に1度だけ呼ぶ。
  static Future<void> initialize() async {
    // assert はリリースビルドで消えるため、StateError で確実に検知する
    if (_url.isEmpty) {
      throw StateError('SUPABASE_URL が未設定です。--dart-define で渡してください。');
    }
    if (_publishableKey.isEmpty) {
      throw StateError('SUPABASE_ANON_KEY が未設定です。--dart-define で渡してください。');
    }

    await Supabase.initialize(
      url: _url,
      publishableKey: _publishableKey,
    );

    await _signInAnonymouslyIfNeeded();
  }

  /// 未ログイン時のみ匿名ログインする。
  /// 匿名ユーザーとして記録を始め、後でApple/Googleアカウントにリンクしてデータを引き継ぐ。
  static Future<void> _signInAnonymouslyIfNeeded() async {
    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      return;
    }

    try {
      await Supabase.instance.client.auth.signInAnonymously();
    } catch (e) {
      // 匿名ログイン失敗はオフライン時にも起こりうる。
      // ローカル記録は続けられるため、ここではログのみ。
      debugPrint('匿名ログイン失敗: $e');
    }
  }

  /// アプリ全体から参照するクライアントのショートカット。
  static SupabaseClient get client {
    return Supabase.instance.client;
  }
}
