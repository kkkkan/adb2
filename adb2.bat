@echo off

@rem "コメントに日本語を含めたら、remがうまく動かなかったのでダブルクォーテーションで囲む"
@rem
@rem
@rem "adbにpathが通っている環境でadb～とコマンドを実行する代わりにadb2 ～とすると、"
@rem "接続されているすべてのandroidデバイスにadb ～コマンドを実行します。"
@rem "特定のデバイスではなくすべてのデバイスに同じことをしたいときに、"
@rem "-sオプションを用いたりや接続を1台ずつにして順に実行する手間を省くためのバッチです。"
@rem
@rem "例 : adb2 install -r app.apk で接続されているすべてのandroid デバイスにapp.apkを上書きインストールをする。"
@rem 
@rem "注意① -sオプションを含んだコマンドは実行できません。"
@rem "注意② 実行したいadbコマンドは、コマンドとオプションを含め9個以内のものにしてください。"





chcp 65001
@rem "chcp 65001->文字コードがUTF-8だと指定している。"
@rem "日本語版 Windows のコマンドプロンプトは Shift-JIS の文字コードを前提として動作させるせいで、"
@rem "-sオプションが渡された時のエラー出力の日本語が文字化けしたので。"
@rem "https://nayutari.com/batch-utf8"



@rem "まず、-sオプションが渡されていないかチェック"
@rem "adbコマンドは、-sオプションが重なると後勝ちになってしまうようなので意図しない動きになってしまう。"
@rem "また、想定している用途的に-sオプションが来るのはおかしい。"


set TRUE_FALSE=FALSE


@rem "batはANDやORがないので一つずつチェック"
@rem "引数の数がそこまでない時にif %6==-s set ～などとすると、値の存在していない変数と文字列を比べているからか"
@rem "setの使い方が間違っていると怒られるのでダブルクォーテーションで囲んでから比べる。"
if "%1"=="-s" set TRUE_FALSE=TRUE
if "%2"=="-s" set TRUE_FALSE=TRUE
if "%3"=="-s" set TRUE_FALSE=TRUE
if "%4"=="-s" set TRUE_FALSE=TRUE
if "%5"=="-s" set TRUE_FALSE=TRUE
if "%6"=="-s" set TRUE_FALSE=TRUE
if "%7"=="-s" set TRUE_FALSE=TRUE
if "%8"=="-s" set TRUE_FALSE=TRUE
if "%9"=="-s" set TRUE_FALSE=TRUE


if %TRUE_FALSE%==TRUE (
  @rem "-sオプションが渡されていたら"

  echo -sオプションを含んだコマンドは実行できません。

  @rem "処理はここで終了。"

  @rem "exit /b -> 終了するが、コマンドプロンプト画面は閉じない。" 
  @rem "ただのexitやexit -1などにすると、コマンドプロンプト画面が閉じてしまう。"

  exit /b
)






@rem "adb devicesを実行して、接続されているデバイスを取得して1台ずつ実行する"
@rem "deviceのidは各行の1つ目"
for /f "usebackq" %%a in (`adb devices`) do (

@rem "batファイルは()ブロック内の環境変数展開のタイミングが()に入った瞬間なので、"
@rem "()内で%%aを一度変数に入れるとうまく動かないので注意"

  if not %%a==List (
    @rem "1行目はList of devices attached なので、%%a==Listは除外"
    @rem
    @rem "()ブロックの中で動的にecho on / offの切り替えは展開のタイミング関係で?無理そうだったので表示したいものだけ直にecho"
    @rem
    echo adb -s %%a %1 %2 %3 %4 %5 %6 %7 %8 %9
    adb -s %%a %1 %2 %3 %4 %5 %6 %7 %8 %9
  )
)


