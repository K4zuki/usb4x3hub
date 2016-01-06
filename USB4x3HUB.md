# BOM list for `r0.3` schematic:
| #  | Parts               | AKIZUKI   | DIGIKEY                 | NOT_COMPONENT | Qty | Value                          |
|:--:|:--------------------|:----------|:------------------------|:--------------|:----|:-------------------------------|
| 1  | C1-3, C13, C20      |           | 490-3261-1-ND           |               | 5   | 0.1u/1005                      |
| 2  | C4, C21             |           | 490-5858-1-ND           |               | 2   | 18p/1005                       |
| 3  | C5-10, C12, C14-19  |           | 490-9962-1-ND           |               | 13  | 4.7u/2012                      |
| 4  | CON1-4              |           | WM17143CT-ND            |               | 4   | USB uAB                        |
| 5  | IC1                 |           | 296-27129-1-ND          |               | 1   |                                |
| 6  | IC2                 |           | FSUSB74MPXCT-ND         |               | 1   | FSUSB74MPX                     |
| 7  | IC3-5               |           | 296-35520-1-ND          |               | 3   |                                |
| 8  | IC6                 |           | AZ1117EH-3.3TRG1DICT-ND |               | 1   | 3.3V                           |
| 9  | IC7-9               |           | AZ1117EH-5.0TRG1DICT-ND |               | 3   | 5V                             |
| 10 | IC10                |           | 296-18203-1-ND          |               | 1   | IC\_TTL\_SINGLE\_74\_139\_FLAT |
| 11 | LED1                | (I-06419) | 754-1128-1-ND           |               | 1   | RD                             |
| 12 | LED2                | (I-06424) | 754-1794-1-ND           |               | 1   | BL                             |
| 13 | LED3                | (I-06423) | 754-1131-1-ND           |               | 1   | GR                             |
| 14 | LED4                | (I-06420) | 754-1135-1-ND           |               | 1   | YL                             |
| 15 | Q1                  |           | 1253-1227-1-ND          |               | 1   | 48M/3225                       |
| 16 | R1, R2, R27-30      |           | P1.00KLCT-ND            |               | 6   | 1k/1005                        |
| 17 | R3-8, R16-23        |           | P33.0LCT-ND             |               | 14  | 33/1005                        |
| 18 | R9-14               |           | P15.0KLCT-ND            |               | 6   | 15k/1005                       |
| 19 | R15                 |           | P1.50KLCT-ND            |               | 1   | 1.5k/1005                      |
| 20 | R24-26, R31-38      |           | P10.0KLCT-ND            |               | 11  | 10k/1005                       |
| 21 | TP1, TP2            |           | 36-5019CT-ND            |               | 2   | TP_4020                        |
| 22 | U1                  |           | 568-10436-5-ND          |               | 1   | LPC812M101JDH16                |
| 23 | C11                 | P-05002   |                         |               | 1   | 100u                           |
| 24 | CON5-7              | C-07674   |                         |               | 3   | USB A                          |
| 25 | J1                  | C-01604   |                         |               | 1   | 2.5/5.5                        |
| 26 | SW1                 | P-08213   |                         |               | 1   | RD                             |
| 27 | SW2                 | P-08214   |                         |               | 1   | BL                             |
| 28 | SW3                 | P-08215   |                         |               | 1   | GR                             |
| 29 | SW4                 | P-08216   |                         |               | 1   | YL                             |
| 30 | X1                  | C-05336   |                         |               | 1   | 1x6                            |
| 31 | **NOT MOUNTED**     |           |                         |               |     |                                |
| 32 | X2, X3              |           |                         |               | 2   | NM,1x2                         |
| 33 | **NOT COMPONENT**   |           |                         |               |     |                                |
| 34 | ICON1               |           |                         | YES           | 1   |                                |
| 35 | PCB1                |           |                         | YES           | 1   | PCB\_DP\_SQUARE-7X7            |
| 36 | TP100, TP101, TP102 |           |                         | YES           | 3   |                                |

# BOM list for `r0.1` schematic:
| Part                   | Value             | Qty | Vendor  | Description                                    | Link / DigiKey number                  |
|:-----------------------|:------------------|:----|:--------|:-----------------------------------------------|:---------------------------------------|
| **AKIZUKI**            |                   |     |         |                                                |                                        |
| C5/6/7                 | 0.1uF             | 3   | AKIZUKI | 1608metric MLCC                                | [P-05650][r01_P-05650]^[490-1524-1-ND] |
| C8/9/10/11/12/14/15/16 | 10uF              | 8   | AKIZUKI | 1608metric MLCC                                | [P-07768][r01_P-07768]                 |
| CON5/6/7               | C-07674           | 3   | AKIZUKI | THROUGH-HOLE USB A connector                   | [C-07674][r01_C-07674]                 |
| J1                     | C-01604           | 1   | AKIZUKI | 2.1/5.5mm DC jack                              | [C-01604][r01_C-01604]                 |
| SW1                    | P-08213 (RED)     | 1   | AKIZUKI | 2p tact switch                                 | [P-08213][r01_C-08213]                 |
| SW2                    | P-08214 (BLUE)    | 1   | AKIZUKI | 2p tact switch                                 | [P-08214][r01_C-08214]                 |
| SW3                    | P-08215 (GREEN)   | 1   | AKIZUKI | 2p tact switch                                 | [P-08215][r01_C-08215]                 |
| SW4                    | P-08216 (YELLOW)  | 1   | AKIZUKI | 2p tact switch                                 | [P-08216][r01_C-08216]                 |
| X1                     | C-01669           | 1   | AKIZUKI | 2.54 x 6p Pin-header                           | [C-01669][r01_C-01669]                 |
| X2/3                   | C-08593           | 2   | AKIZUKI | 2.54 x 2p Pin-header                           | [C-08593][r01_C-08593]                 |
| **DigiKey**            |                   |     |         |                                                |                                        |
| C1/2/3/4/13            | 0.1uF             | 5   | DigiKey | 1005metric MLCC                                | 490-3261-1-ND                          |
| CON1/2/3/4             | 47589-0001        | 4   | DigiKey | MOLEX USB microAB Connector                    | WM17143CT-ND                           |
| IC1                    | TUSB2036          | 1   | DigiKey | 2 or 3-port USB2.0 HUB IC                      | 296-27129-1-ND                         |
| IC2                    | FSUSB74           | 1   | DigiKey | USB 1 to 4 Multiplexer                         | FSUSB74MPX-ND                          |
| IC3/4/5                | TPS2041C          | 3   | DigiKey | USB current switch                             | 296-35520-1-ND                         |
| IC6                    | AZ1117EH-5.0TRG1  | 1   | DigiKey | LDO for ICs 5.0V                               | AZ1117EH-5.0TRG1DICT-ND                |
| IC7                    | AZ1117EH-3.3TRG1  | 1   | DigiKey | LDO for ICs 3.3V                               | AZ1117EH-3.3TRG1DICT-ND                |
| Q1                     | 6MHz              | 1   | DigiKey | Oscillator                                     | CTX974CT-ND                            |
| R1/2                   | 100ohm            | 2   | DigiKey | 1005metric SMD resistor                        | P100JCT-ND                             |
| R3-8/16-23             | 33ohm             | 14  | DigiKey | 1005metric SMD resistor                        | P33DDCT-ND                             |
| R15                    | 1.5k              | 1   | DigiKey | 1005metric SMD resistor                        | P1.5KDCCT-ND                           |
| R9/10/11/12/13/14      | 15k               | 6   | DigiKey | 1005metric SMD resistor                        | P15KDECT-ND                            |
| U1                     | LPC812M101JTB16   | 1   | DigiKey | LPC812 XSON16 package                          | 568-11574-1-ND                         |
| **Not-Components**     |                   |     |         |                                                |                                        |
| PCB1                   | PCB_DP_SQUARE-7X7 | (1) | -       | Dangerous Prototypes Standard Square PCB sizes | -                                      |
| U$1                    | ICON_OSHW         | (1) | -       | Open Source HardWare icon                      | -                                      |

[r01_P-05650]: http://akizukidenshi.com/catalog/g/gP-05650/
[r01_P-07768]: http://akizukidenshi.com/catalog/g/gP-07768/
[r01_C-07674]: http://akizukidenshi.com/catalog/g/gC-07674/
[r01_C-01604]: http://akizukidenshi.com/catalog/g/gC-01604/
[r01_C-08213]: http://akizukidenshi.com/catalog/g/gP-08213/
[r01_C-08214]: http://akizukidenshi.com/catalog/g/gP-08214/
[r01_C-08215]: http://akizukidenshi.com/catalog/g/gP-08215/
[r01_C-08216]: http://akizukidenshi.com/catalog/g/gP-08216/
[r01_C-01669]: http://akizukidenshi.com/catalog/g/gC-01669/
[r01_C-08593]: http://akizukidenshi.com/catalog/g/gC-08593/

[r02-TUSB2077A]: 296-37871-1-ND
[r02-1175-1018-ND]: 1175-1018-ND^[C-03238]
[r02-296-18203-1-ND]: 296-18203-1-ND
