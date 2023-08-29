VERSION := "v0.2.1"

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
	@wget https://github.com/juicity/juicity/releases/download/$(VERSION)/juicity-macos-x86_64.zip
	@unzip -d src-tauri/bin juicity-macos-x86_64.zip
	@mv src-tauri/bin/juicity-client src-tauri/bin/juicity-client-x86_64-apple-darwin
	@rm -rf src-tauri/bin/juicity-server
	@rm -rf juicity-macos-x86_64.zip
sync-win:
	@wget https://github.com/juicity/juicity/releases/download/$(VERSION)/juicity-windows-x86_64.zip
	@unzip -d src-tauri/bin juicity-windows-x86_64.zip
	@mv src-tauri/bin/juicity-client.exe src-tauri/bin/juicity-client-x86_64-pc-windows-msvc.exe
	@rm -rf src-tauri/bin/juicity-server.exe
	@rm -rf juicity-windows-x86_64.zip
sync-linux:
	@wget https://github.com/juicity/juicity/releases/download/$(VERSION)/juicity-linux-x86_64.zip
	@unzip -d src-tauri/bin juicity-linux-x86_64.zip
	@mv src-tauri/bin/juicity-client src-tauri/bin/juicity-client-x86_64-unknown-linux-gnu
	@rm -rf src-tauri/bin/juicity-server.service
	@rm -rf src-tauri/bin/juicity-client.service
	@rm -rf src-tauri/bin/example-server.json
	@rm -rf src-tauri/bin/example-client.json
	@rm -rf src-tauri/bin/juicity-server
	@rm -rf juicity-linux-x86_64.zip

.PHONY: icon build opz sync
