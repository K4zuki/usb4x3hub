---
title: 【改訂】 USB4x3HUBの本
abstract: Windows/Mac/XBOX/PS4でキーボードとマウス（ともう一つ）を切り替えて共有できる基板
circle: KY技研
author: "@_K4ZUKI_"
date: C92/2017-Aug
comiket: "C92"
year: "2017"
publisher: キンコーズオンラインで印刷製本
docrevision: "2.0"

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
front: images/USB4x3HUB-block.png
listingTemplate: '---**$$listingTitle$$ $$i$$$$titleDelim$$ $$t$$**---'
---

# まえがき {.unnumbered}
このドキュメントは、USB機器を最大４台のホストマシンで共有するガジェット
_**USB4x3HUB**_ のソフトウェア・ハードウェアを解説する本です。

_**USB4x3HUBプロジェクト**_ は、筆者がWindowsマシンとLinuxマシン間で **USBの**
キーボードやマウスを共有できないことに不便を感じたことに端を発する
（けど当初のことを思い出せない）プロジェクトです。

この本は、_**USB4x3HUB**_ の概要及び基本的な動作の説明、ファームウェアの説明、
そしてタカチケース用パネルの寸法図を載せても『薄い本」といえる程度にまとめる
予定です。

## 免責事項 {-}

+-----------------------------------------------------------+
| この本の内容によって読者に生じたいかなる不利益についても\ |
| 筆者は一切責任を取りません。                              |
+-----------------------------------------------------------+

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

基板外形は57.0x73.0mmの縦長で、タカチの
ケース^[MX2-8-7、http://www.marutsu.co.jp/pc/i/125226/ など(650円程度)] に
ピッタリ収まります。このケースはパネル分離タイプなのでパネルを自作する
こともできます^[http://www.takachi-el.co.jp/data/pdf/2016-06-041_47-50.pdf]。

## 基本的な動作

基板上のタクトスイッチを押すとスイッチと同色のLEDが点灯します。同時にUSBバス
接続が _必ず_ 一旦切断されたあとスイッチに対応したホストコネクタと再接続
されます。

+---------------------------------------------------------------------------+
| USBハブ側につながっているものがキーボードやマウスなら問題は少ないと       |
| 思いますが、USBメモリを接続した際は突然の切断に気をつける必要があります。 |
+---------------------------------------------------------------------------+

基板上のスイッチは、DCジャックに近い方から赤青緑黄の順で
実装されています。

# 組み立てる前に：追加部品の購入
後述するケースの選定にかかわらず必要な部品があります：CON５〜７の
USB-Aコネクタです。`r0.4`と`r0.5`で部品が異なります。基板設計ライブラリの
フットプリントは同一ですが、`r0.5`のコネクタは _USBケーブルを指す向きが逆_
になっています。

```table
---
caption: 追加部品リスト
markdown: True
---
Ref,Manuf,Part,DIGIKEY,MOUSER,適用
CON 5-7,Wurth Electronics,614104150121,732-5962-1-ND,710-614104150121,`r0.5`
CON 5-7,aitendo,UAF-99 ,NA,NA,`r0.4`
```

# 組み立てる
## ファームウェアをコンパイルする

次のページに全文を掲載しますが、かなりシンプルな実装です。
LPC812マイクロコントローラの16ピンタイプを
使いますが、[mbed.org](mbed.org)上では20ピンタイプ[^005]を
ターゲットにします。外形は異なりますがバイナリに互換性があるので20ピン用に
コンパイルされたものでも16ピン版で実行できます。

書込みはFTDIケーブルなどのUSB−UART変換ケーブルとLPC21ISP、あるいはmbed LPC1768と
**_イカ醤油ポッポ焼き_** (TM~(誰の？)~)で行います。

![回路図(マイコン部分を拡大)](images/USB4x3HUB_r04_LPC812.png)

\\newpage
```listingtable
source: ../mbed/main.cpp
class: cpp
tex: False
---
```

\\newpage
## エンクロージャ（ケース）を用意する
エンクロージャ（ケース）は、頒布しません。代わりにアイデアを３点提示します。
いずれもアクリル（など）の加工が必要です。TechShopやDMM.Makeなどの工作室
を利用するなどして適宜合わせこんで自作してください。

### アイデア１：市販のケースを購入し工夫する（１）
タカチのケース"MX2-8-7??(??は色コード)"を使用します。ケースは上下の
パーツとパネルで構成されています。パネル部品の固定にはケースに付属している
タッピングネジを使うか、M3のタップを立てるなどもよく行われているようです。
筆者はその手の加工は苦手なのでアクリル加工と付属タッピングネジで
済ませました。

+--------------------------------------------------------------+
| 付録に基板及びパネルの寸法図を載せますので参考にしてください |
+--------------------------------------------------------------+

#### パネルの穴あけ加工
前後のパネルにUSBコネクタの穴を空けます。付属品のパネルにがんばって
穴あけをするか、アクリル加工サービスなどを利用するか、メーカーに加工を
依頼するなどで用意します。

デバイス（ハブ）側は穴が大きめで比較的加工が簡単です。ホスト側は
USBコネクタとLEDつきスイッチ（後述）、パネル用DCジャックを取り付けるために
けっこう密に穴あけしなければなりません。図面例は付録を参照してください。

#### 追加で必要になる部品

```table
---
caption: 部品表
markdown: True
width:
    - 0.35
    - 0.35
    - 0.1
    - 0.1
    - 0.1
---
部品,型番,個数,入手先,URL
ケース,MX-2-8-7BB,1,マルツ,[125226](http://www.marutsu.co.jp/pc/i/125226/)
"LEDつきスイッチ",PB01-11A-LR-N-3M,4,秋月,[P-04073](http://akizukidenshi.com/catalog/g/gP-04073/)
"DCジャック","MJ-22（外ナット）",1,秋月,[C-06647](http://akizukidenshi.com/catalog/g/gC-06647/)
"DCジャック","MJ-14（内ナット）",1,秋月,[C-06342](http://akizukidenshi.com/catalog/g/gC-06342/)
"ACアダプタ9V/0.65A",GF06-US09065A,1,秋月,[M-03681](http://akizukidenshi.com/catalog/g/gM-03681/)
端子台2P,TB111-2-2-U-1-1,1,秋月,[P-01306](http://akizukidenshi.com/catalog/g/gP-01306/)
端子台2P,"MPT0.5/2-2.54/1725656",1,秋月,[P-08450](http://akizukidenshi.com/catalog/g/gP-08450/)
```

LEDつきスイッチ・DCジャック・端子台は秋月、ケースは千石（取り寄せ）かマルツ
（秋葉原本店なら *運が良ければ* 店頭にある）で購入できます。

**LEDつきスイッチ**は、(半)透明アクリルパネルを自力で用意できれば普通のパネル用
押しボタンスイッチを使ってもいいと思います。リストに挙げたLEDつきスイッチは
LED色が3種類しかないので赤を4個使用するつもりで考えてあります。このスイッチの
取り付け穴はパネル厚さで変える必要があるようです。外観がそっくりな
デジキー取扱品のデータシート[^006]
によると以下のようになっています。

| パネル厚さt[mm] | 取付穴径d[mm] |
|:---------------:|:-------------:|
|    1.0 - 2.0    |   8.0 - 8.2   |
|    2.0 - 2.5    |   8.2 - 8.4   |
|    2.5 - 3.0    |   8.4 - 8.6   |

基板の設計上パネル厚さは _1.0~2.0ミリ_ を推奨します。

**DCジャック**は`r0.4`までパネルタイプを使用する設計でしたが、ケース内で
端子台と干渉してケーブルの取り回しが悪いことが判明したので、USBホスト側の
コネクタを移動して基板実装タイプを取り付けられるようにしました。

<!-- TODO: 端子台の搭載図または写真 -->

#### 基板の加工
この本とともに頒布予定の基板には、すでにLEDが実装済みです。先述の通り
パネル加工の方針によっては基板のLEDを取り除くべきです。

### アイデア２：市販のケースを購入し工夫する（２）
デバイス側を少し削るとタカチのYM-90という
メタルシャーシも使えそうです。千石・マルツ・共立などで買える定番品です。
MX2-8-7よりもUSB面の幅に余裕があるのでパネル用DCジャックと端子台を
つけて配線するのは簡単そうです。パネル用ボタンスイッチを取り付けるのは
無理なので蓋に穴を開ける方針で、コネクタ面の穴あけはよりシビアになると
考えられるのでメーカに加工を依頼するのが最短と思われます。

### アイデア３：アクリル板を切り出して組み合わせる
アクリルレーザ加工で６面全てとそれらのジョイントのためにブロックスペーサ
を入手して組み合わせるという手も
考えられます^[https://gist.github.com/K4zuki/fb18026aae4fe79f22a7cca4114dfed6]。
アクリルを例にしていますが材料はなんでもいいと思います。

#### アクリル加工
６面分切ります。DCジャック側側面板はジャック用の角穴、DCジャックのない側の
側面板はファームウェア書込みピンヘッダの穴（予め書き込んでおけば穴あけ不要）、
底面版は四隅のネジ穴だけ、天板は基板上のボタンを押すためのシャフト穴、
前後パネルはUSB用を各々開け、 _いい感じに_ 組み合わせます。

#### 追加で必要になる部品

```table
---
caption: 部品表
markdown: True
width:
    - 0.3
    - 0.2
    - 0.1
    - 0.3
    - 0.1
---
部品,型番,個数,入手先,URL
ACアダプタ9V/0.65A,GF06-US09065A,1,秋月 ,[M-03681](http://akizukidenshi.com/catalog/g/gM-03681/)
基板用DCジャック,2DC0005D100,1,秋月,[C-01604](http://akizukidenshi.com/catalog/g/gC-01604/)
自作アクリルケース,,1 set,アクリル加工サービスなど,
```

ほぼ全て秋月のみで揃います。

# 付録
\\newpage
## 回路図
\\newpage
`images/USB4x3HUB_r04_sch.png`{.rotate .caption="回路図" .angle=90}{}

\\newpage
## 基板図

\\newpage
![基板外観図](images/USB4x3HUB_r04-a30fd1f.png){}

\\newpage
## 基板寸法とパネル寸法の例
基板外形、DCジャックなどの開口部の位置寸法とMX2-8-7のパネル寸法図面を
兼ねています。

\\newpage
`images/USB4x3HUB_r04-a30fd1f_meas.png`{.rotate .caption="寸法図" .angle=90}{}

# 更新履歴 {.unnumbered}
## Revision 1.0(C91) {.unnumbered}
- 最初の発行。やばみ
- 新基板落ちた（未発送@12月24日）
- それでも本だけだしておく暴挙（）
- キンコーズでオンライン注文の予定だけど落ちるかも（）

## Revision 2.0(C92) {.unnumbered}
- 改訂。やばみ
- 表紙絵にはいらすとやさんのフリー素材を使用、ポンチ絵感ある
- `r0.4`に関連する記述を削除
- C91に間に合わなかった例の新基板（`r0.4`）は部品選定バグありだったので結果オーライ（）
<!--  -->
[^001]: https://www.switch-science.com/catalog/1966/
[^002]: https://www.fairchildsemi.com/datasheets/FS/FSUSB74.pdf
[^003]: http://www.ti.com/lit/ds/symlink/tusb2036.pdf
[^004]: http://akizukidenshi.com/catalog/g/gK-05258/
[^005]: https://developer.mbed.org/platforms/NXP-LPC800-MAX/
[^006]: https://www.e-switch.com/system/asset/product_line/data_sheet/37/LP1.pdf
