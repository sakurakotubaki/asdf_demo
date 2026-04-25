.PHONY: test test-all test-watch test-coverage test-coverage-html

# すべてのテストを実行
test:
	flutter test

# test の分かりやすい別名
test-all: test

# ファイル変更を監視しながらテストを実行
test-watch:
	flutter test --watch

# カバレッジ付きですべてのテストを実行
test-coverage:
	flutter test --coverage

# HTMLカバレッジレポートを生成
test-coverage-html: test-coverage
	genhtml coverage/lcov.info -o coverage/html
