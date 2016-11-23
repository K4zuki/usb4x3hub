---
title: USB4x3HUBの本
abstract: Windows/Mac/XBOX/PS4でキーボードとマウス（ともう一つ）を切り替えて共有できる基板
circle: KY技研
author: "@_K4ZUKI_"
date: C91/2016-Dec
comiket: "C91"
year: "2016"
publisher: 秋葉原キンコーズで印刷製本予定
docrevision: "1.0"

documentclass: book
papersize: b5paper
mainfont: RictyDiminished-Regular
sansfont: RictyDiminished-Regular
monofont: RictyDiminished-Regular
mainlang: Japanese
CJKoptions: BoldFont=RictyDiminished-Bold,
  ItalicFont=RictyDiminished-Oblique,
  BoldItalicFont=RictyDiminished-BoldOblique
CJKmainfont: RictyDiminished-Regular
CJKsansfont: RictyDiminished-Regular
CJKmonofont: RictyDiminished-Regular
geometry: top=30truemm,bottom=30truemm,left=20truemm,right=20truemm
keywords: keyword
secPrefix: Chapter
linkcolor: black
urlcolor: black
citecolor: black
chapter: true
listings: true
codeBlockCaptions: true
listingTitle: 'List'
listingTemplate: '---**$$listingTitle$$ $$i$$$$titleDelim$$ $$t$$**---'
---

\newpage
# まえがき {.unnumbered}
このドキュメントは、USB機器を最大４台のホストマシンで共有するガジェット
_**USB4x3HUB**_ のソフトウェア・ハードウェアを解説する本です。

_**USB4x3HUBプロジェクト**_ は、筆者がWindowsマシンとLinuxマシン間で **USBの**
キーボードやマウスを共有できないことに不便を感じたことに端を発する
（けど当初のことを思い出せない）プロジェクトです。

この本は、_**USB4x3HUB**_ の概要及び基本的な動作の説明、ファームウェアの説明、
そしてタカチケース用パネルの寸法図を載せても『薄い本」といえる程度にまとめる
予定です。

# USB4x3HUBの概要

_**USB4x3HUB**_ の初期のプロトタイプ -- といっても最近まで稼働していた --
はArduino形状の**mbed LPC1768**拡張基板にArduino用タッチシールド[^001]と
USBバススイッチIC[^002]をつなげ、市販のUSBハブを分解したものと秋月電子の
USBミニBコネクタDIP化キット[^004]を接続しただけの、簡素で手抜き感があるもの
でした。しかしながら近年はマイクロUSB｛ケーブル, コネクタ｝が主流になってきた
ようなので、2015年より再設計を行い、TI社の3ポートUSBハブIC[^003]と
フェアチャイルド社のUSBスイッチIC、及びスイッチ入力・USB入出力コネクタ、
それらをコントロールするmbed互換マイクロコントローラを1枚の基板に収めたものを
考案しました。

基板外形は57.5x73.0mmの縦長で、タカチの
ケース^[MX2-8-7 http://www.marutsu.co.jp/pc/i/35612/ など(650円程度)]に
ピッタリ収まる予定です。このケースはパネル分離タイプなのでパネルを自作する
こともできます。

## 基本的な動作

基板上のタクトスイッチを押すとスイッチと同色のLEDが点灯します。同時にUSBバス
接続が _必ず_ 一旦切断されたあとスイッチに対応したホストコネクタと再接続
されます。

+---------------------------------------------------------------------------+
| USBハブ側につながっているものがキーボードやマウスなら問題は少ないと       |
| 思いますが、USBメモリに突然の切断は良くないので気をつける必要があります。 |
+---------------------------------------------------------------------------+

## ファームウェア

先述の動作を淡々と実装します。LPC812マイクロコントローラの16ピンタイプを
使っていますが、[mbed.org](mbed.org)上では20ピンタイプ[^005]を
ターゲットにします。外形は異なりますがバイナリに互換性があるので20ピン用に
コンパイルされたものでも16ピン版で実行できます。

![回路図(マイコン部分を拡大)](images/USB4x3HUB_r04_LPC812.png)

\newpage
`../mbed/main.cpp`{.listingtable .cpp}

## エンクロージャ
### 市販のケースを購入しパネルだけ自作する
先述のケース"MX2-8-7??(??は色コード)"を使用します。ケースに付属して
いるタッピングネジを使うか、M3のタップを立てるなどもよく行われているようです。
#### パネルの穴あけ加工
前後のパネルにUSBコネクタの穴を空けます。デバイス側は穴が大きめで比較的
簡単です。ホスト側はUSBコネクタとLEDつきスイッチ（後述）、パネル用DCジャック
を取り付けるためにけっこう密に穴あけしなければなりません。図面例は付録を
参照してください。
#### 追加で必要になる部品
LEDつきスイッチ・DCジャック・端子台は秋月、ケースは千石（取り寄せ）かマルツ
（秋葉原本店なら *運が良ければ* 店頭にある）で購入できます。

LEDつきスイッチはLED色が3種類しかないので赤を4個使用するつもりで
リストに挙げてあります。

DCジャックは2品種候補があります。違いは固定用ナットの位置です。
基板上には端子台のパターンが用意してありますが、おそらくDCジャックと干渉
してしまいます。回避するにはDCジャックをパネル内側ナットタイプにして
M8ネジ用のスペーサを追加するなどの工夫をするか、端子台の使用を諦めて
ケーブルを基板に直接はんだづけし、DCジャックを外ナットタイプにする
しかありません。

いっぽう端子台も2品種候補にあげてあります。
違いは部品の高さと端子ピッチです。端子台の基板パターンは5.08ミリピッチ
ですが、より低背の端子台は2.54ミリピッチなので、DCジャック用のパターンを
使用します。また、固定用ダボが付いているのでダボを削る加工が必要です。

`Out/case1.tmd`{.include}

#### 基板の加工
### 全部自作する
#### アクリル加工
#### 追加で必要になる部品
# 付録
## 回路図
\newpage
`images/USB4x3HUB_r04_sch.png`{.rotate .caption="回路図" .angle=90}{}

\newpage
## 基板図
\newpage
![基板外観図](images/USB4x3HUB_r04-a30fd1f.png){}

\newpage
## 基板寸法とパネル寸法の例
\newpage
`images/USB4x3HUB_r04-a30fd1f_meas.png`{.rotate .caption="寸法図" .angle=90}{}

<!--  -->
[^001]: https://www.switch-science.com/catalog/1966/
[^002]: https://www.fairchildsemi.com/datasheets/FS/FSUSB74.pdf
[^003]: http://www.ti.com/lit/ds/symlink/tusb2036.pdf
[^004]: http://akizukidenshi.com/catalog/g/gK-05258/
[^005]: https://developer.mbed.org/platforms/NXP-LPC800-MAX/
