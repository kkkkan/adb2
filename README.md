# adb2
複数台のandroidデバイスが接続されている時にすべてのデバイスにadb ～コマンドを実行するためのバッチおよびbashスクリプト。

 - adb2.bat : Windows用
 - adb2    : macOS用


## 環境構築
### Windows
- adb2.batをダウンロードし、任意の場所に置きます。
- コマンドプロンプトでadbコマンドを実行できるようadbにpathを通しておきます。
- adb2.batにもpathを通しておきます。
- PCにUSBデバッグをONにしたandroidデバイスを接続します。

### Mac
- adb2をダウンロードし、任意の場所に置きます。
- `sudo chmod 755 adb2`でadb2に実行可能にします。
- terminalでadbコマンドを実行できるようadbにpathを通しておきます。
- adb2にもpathを通しておきます。
- PCにUSBデバッグをONにしたandroidデバイスを接続します。


## 使い方
実行したいadbコマンドの、「adb」代わりに「adb2」と置き換えてほかの部分はそのままで実行します。 <Br>
そうすることで、 PCに接続されているすべてのandroidデバイスすべてに対して順にadbコマンドが実行されます。<Br>


例 : PCに接続されているすべてのandroidデバイスにapp.apkを上書きインストールしたい場合

 ```bat
 adb2 install -r app.apk
 ```
 ## オリジナルコマンド
 以下のコマンドで、接続されている端末のシリアル番号と機種名を一覧表示します。 
 ```bat
 adb2 show
 ```
 出力

 ```bat
 Active code page: 65001
 接続されている端末一覧
 
 a1b2c3d4e56 : CPH1983 
 emulator-5554 : Android
 ```

 ## 注意点
 - -sオプションを含んだコマンドは実行できません。
 ### Windowsのみ
 - 実行したいadbコマンドは、(adbを除いた)コマンドとオプションを含め9個以内のものにしてください。
 
 ## 動作確認環境
 ### Windows
 ```
 エディション	Windows 10 Home
バージョン	20H2
インストール日	‎2022/‎01/‎04
OS ビルド	19042.1466
エクスペリエンス	Windows Feature Experience Pack 120.2212.3920.0
```
 ### Mac
 
 - OS : macOS 12.2.1 (21D62)
 - チップ : Apple M1
 - ターミナル　 : zsh
 - zch バージョン : 
 ```
 zsh 5.8 (x86_64-apple-darwin21.0)
 ```
 - bash バージョン : 
 ```
 GNU bash, version 3.2.57(1)-release (arm64-apple-darwin21)
 Copyright (C) 2007 Free Software Foundation, Inc.
 ```


