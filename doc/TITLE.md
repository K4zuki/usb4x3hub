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
...

\newpage
# まえがき {.unnumbered}
このドキュメントは、USB機器を最大４台のホストマシンで共有するガジェット
_**USB4x3HUB**_ のソフトウェア・ハードウェアを解説する本です。

_**USB4x3HUBプロジェクト**_ は、筆者がWindowsマシンとLinuxマシン間で **USBの**
キーボードやマウスを共有できないことに不便を感じたことに端を発する
（けど当初のことを思い出せない）プロジェクトです。

初期のプロトタイプ - といっても最近まで稼働していた - はArduino形状の**mbed
 LPC1768**拡張基板にArduino用タッチシールド[^001]とUSBバススイッチIC[^002]を
つなげ、市販のUSBハブを分解したものと秋月電子のUSBミニBコネクタDIP化キット[^004]を
接続しただけの、簡素で手抜き感があるものでした。しかしながら今時はマイクロ
USB｛ケーブル, コネクタ｝が主流になってきたようなので、昨年より再設計を行い、
TI社の3ポートUSBハブIC[^003]とUSBスイッチIC及びスイッチ入力・USB入出力コネクタ・
それらをコントロールするmbed互換マイクロコントローラを1枚の基板に収めたものを
考案しました。

<!--  -->
[^001]: TODO: タッチシールドのURL
[^002]: TODO: バススイッチICのURL
[^003]: TODO: USBハブICのURL
[^004]: TODO: 秋月キットのURL
