
icon:
	@pnpm tauri icon public/juic.png
start:
	@pnpm tauri dev
build:
	@TAURI_PRIVATE_KEY=~/.tauri/vess.key TAURI_KEY_PASSWORD=1988 pnpm tauri build
opz:
	@upx --ultra-brute src-tauri/target/release/bundle/macos/Juic.app/Contents/macOS/juic
cp:
	@cp -R src-tauri/target/release/bundle/macos/Juic.app /Applications
sync:
	@wget https://github.com/juicity/juicity/releases/download/v0.1.3/juicity-macos-x86_64.zip
	@unzip -d src-tauri/bin juicity-macos-x86_64.zip
	@mv src-tauri/bin/juicity-client src-tauri/bin/juicity-client-x86_64-apple-darwin
	@rm -rf src-tauri/bin/juicity-server
	@rm -rf juicity-macos-x86_64.zip

.PHONY: icon build opz sync
