EESchema Schematic File Version 4
LIBS:MagLev-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_UNO_R3 A101
U 1 1 5C9AFA0D
P 2875 2800
F 0 "A101" H 2125 3850 50  0000 C CNN
F 1 "Arduino_UNO_R3" H 2325 3775 50  0000 C CNN
F 2 "Modules:Arduino_UNO_R3_WithMountingHoles" H 3025 1750 50  0001 L CNN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 2675 3850 50  0001 C CNN
	1    2875 2800
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LMV321 U101
U 1 1 5C9B05A7
P 5625 2475
F 0 "U101" H 5675 2175 50  0000 L CNN
F 1 "LMV321" H 5675 2275 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 5625 2475 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/lmv324.pdf" H 5625 2475 50  0001 C CNN
	1    5625 2475
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV102
U 1 1 5C9B08E2
P 5125 2000
F 0 "RV102" H 5055 2046 50  0000 R CNN
F 1 "10k" H 5055 1955 50  0000 R CNN
F 2 "Custom:Potentiometer_P120PK-Y25BR10K" H 5125 2000 50  0001 C CNN
F 3 "~" H 5125 2000 50  0001 C CNN
	1    5125 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5C9B0A0C
P 5125 2325
F 0 "#PWR0101" H 5125 2075 50  0001 C CNN
F 1 "GND" H 5130 2152 50  0000 C CNN
F 2 "" H 5125 2325 50  0001 C CNN
F 3 "" H 5125 2325 50  0001 C CNN
	1    5125 2325
	1    0    0    -1  
$EndComp
Wire Wire Line
	5125 2150 5125 2325
$Comp
L power:+5V #PWR0102
U 1 1 5C9B0A4E
P 5125 1825
F 0 "#PWR0102" H 5125 1675 50  0001 C CNN
F 1 "+5V" H 5140 1998 50  0000 C CNN
F 2 "" H 5125 1825 50  0001 C CNN
F 3 "" H 5125 1825 50  0001 C CNN
	1    5125 1825
	1    0    0    -1  
$EndComp
Wire Wire Line
	5125 1825 5125 1850
$Comp
L Connector_Generic:Conn_01x03 J101
U 1 1 5C9B0C72
P 4625 1575
F 0 "J101" V 4591 1387 50  0000 R CNN
F 1 "Conn_01x03" V 4725 1800 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 4625 1575 50  0001 C CNN
F 3 "~" H 4625 1575 50  0001 C CNN
	1    4625 1575
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0103
U 1 1 5C9B0D33
P 4975 1775
F 0 "#PWR0103" H 4975 1625 50  0001 C CNN
F 1 "+5V" H 4990 1948 50  0000 C CNN
F 2 "" H 4975 1775 50  0001 C CNN
F 3 "" H 4975 1775 50  0001 C CNN
	1    4975 1775
	1    0    0    -1  
$EndComp
Wire Wire Line
	4975 1775 4975 1875
Wire Wire Line
	4975 1875 4725 1875
Wire Wire Line
	4725 1875 4725 1775
$Comp
L power:GND #PWR0104
U 1 1 5C9B0DA8
P 4325 1775
F 0 "#PWR0104" H 4325 1525 50  0001 C CNN
F 1 "GND" H 4330 1602 50  0000 C CNN
F 2 "" H 4325 1775 50  0001 C CNN
F 3 "" H 4325 1775 50  0001 C CNN
	1    4325 1775
	1    0    0    -1  
$EndComp
Wire Wire Line
	4325 1775 4525 1775
Wire Wire Line
	4625 1775 4625 2575
$Comp
L Device:R R101
U 1 1 5C9B0ADD
P 4775 2575
F 0 "R101" V 4568 2575 50  0000 C CNN
F 1 "1k" V 4659 2575 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 4705 2575 50  0001 C CNN
F 3 "~" H 4775 2575 50  0001 C CNN
	1    4775 2575
	0    1    1    0   
$EndComp
Wire Wire Line
	4925 2575 5125 2575
$Comp
L Device:R R102
U 1 1 5C9B1413
P 5400 3175
F 0 "R102" V 5193 3175 50  0000 C CNN
F 1 "1k" V 5284 3175 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 5330 3175 50  0001 C CNN
F 3 "~" H 5400 3175 50  0001 C CNN
	1    5400 3175
	0    1    1    0   
$EndComp
$Comp
L Device:R_POT RV104
U 1 1 5C9B1467
P 6025 3175
F 0 "RV104" V 5911 3175 50  0000 C CNN
F 1 "10k" V 5820 3175 50  0000 C CNN
F 2 "Custom:Potentiometer_P120PK-Y25BR10K" H 6025 3175 50  0001 C CNN
F 3 "~" H 6025 3175 50  0001 C CNN
	1    6025 3175
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5550 3175 5875 3175
Wire Wire Line
	5125 2575 5125 3175
Wire Wire Line
	5125 3175 5250 3175
Connection ~ 5125 2575
Wire Wire Line
	5125 2575 5325 2575
Wire Wire Line
	6025 3025 6025 2475
Wire Wire Line
	6025 2475 5925 2475
NoConn ~ 6175 3175
$Comp
L power:GND #PWR0105
U 1 1 5C9B1804
P 5525 2775
F 0 "#PWR0105" H 5525 2525 50  0001 C CNN
F 1 "GND" H 5530 2602 50  0000 C CNN
F 2 "" H 5525 2775 50  0001 C CNN
F 3 "" H 5525 2775 50  0001 C CNN
	1    5525 2775
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 5C9B181D
P 5525 2175
F 0 "#PWR0106" H 5525 2025 50  0001 C CNN
F 1 "+5V" H 5540 2348 50  0000 C CNN
F 2 "" H 5525 2175 50  0001 C CNN
F 3 "" H 5525 2175 50  0001 C CNN
	1    5525 2175
	1    0    0    -1  
$EndComp
Wire Wire Line
	5275 2000 5325 2000
Wire Wire Line
	5325 2000 5325 2375
Text Label 3375 2800 0    50   ~ 0
A0
Text Label 5325 2000 0    50   ~ 0
A0
Text Label 4475 2575 2    50   ~ 0
A1
Wire Wire Line
	4475 2575 4625 2575
Connection ~ 4625 2575
Text Label 6025 2475 0    50   ~ 0
A2
Text Label 3375 2900 0    50   ~ 0
A1
Text Label 3375 3000 0    50   ~ 0
A2
$Comp
L Custom:DRV8872DDAR U102
U 1 1 5C9B285B
P 7700 2000
F 0 "U102" H 7700 2375 50  0000 C CNN
F 1 "DRV8872DDAR" H 7700 2284 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-8-1EP_3.9x4.9mm_Pitch1.27mm" H 7700 2000 50  0001 C CNN
F 3 "" H 7700 2000 50  0001 C CNN
	1    7700 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5C9B2943
P 6800 1850
F 0 "#PWR0107" H 6800 1600 50  0001 C CNN
F 1 "GND" H 6805 1677 50  0000 C CNN
F 2 "" H 6800 1850 50  0001 C CNN
F 3 "" H 6800 1850 50  0001 C CNN
	1    6800 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 1850 7250 1850
Text Label 7250 2050 2    50   ~ 0
IN1
Text Label 7250 1950 2    50   ~ 0
IN2
Text Label 7250 2150 2    50   ~ 0
nFault
$Comp
L Motor:Motor_DC M101
U 1 1 5C9B2D79
P 9000 2050
F 0 "M101" H 9158 2046 50  0000 L CNN
F 1 "Motor_DC" H 9158 1955 50  0000 L CNN
F 2 "Custom:TerminalBlock_Phoenix_PT-1,5-2-3.5-H_1x02_P3.50mm_Horizontal" H 9000 1960 50  0001 C CNN
F 3 "~" H 9000 1960 50  0001 C CNN
	1    9000 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 1850 9000 1850
Wire Wire Line
	9000 2350 8500 2350
Wire Wire Line
	8500 2350 8500 2050
Wire Wire Line
	8500 2050 8150 2050
$Comp
L Connector:Screw_Terminal_01x02 J102
U 1 1 5C9B357A
P 10100 1700
F 0 "J102" H 10180 1692 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 10180 1601 50  0000 L CNN
F 2 "Custom:TerminalBlock_Phoenix_PT-1,5-2-3.5-H_1x02_P3.50mm_Horizontal" H 10100 1700 50  0001 C CNN
F 3 "~" H 10100 1700 50  0001 C CNN
	1    10100 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0108
U 1 1 5C9B3724
P 9900 1700
F 0 "#PWR0108" H 9900 1550 50  0001 C CNN
F 1 "+12V" H 9915 1873 50  0000 C CNN
F 2 "" H 9900 1700 50  0001 C CNN
F 3 "" H 9900 1700 50  0001 C CNN
	1    9900 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5C9B38C3
P 7700 2300
F 0 "#PWR0109" H 7700 2050 50  0001 C CNN
F 1 "GND" H 7705 2127 50  0000 C CNN
F 2 "" H 7700 2300 50  0001 C CNN
F 3 "" H 7700 2300 50  0001 C CNN
	1    7700 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5C9B393C
P 9900 1800
F 0 "#PWR0110" H 9900 1550 50  0001 C CNN
F 1 "GND" H 9905 1627 50  0000 C CNN
F 2 "" H 9900 1800 50  0001 C CNN
F 3 "" H 9900 1800 50  0001 C CNN
	1    9900 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0111
U 1 1 5C9B3B27
P 8275 2150
F 0 "#PWR0111" H 8275 2000 50  0001 C CNN
F 1 "+12V" H 8290 2323 50  0000 C CNN
F 2 "" H 8275 2150 50  0001 C CNN
F 3 "" H 8275 2150 50  0001 C CNN
	1    8275 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2150 8275 2150
$Comp
L power:GND #PWR0112
U 1 1 5C9B3D47
P 8625 1950
F 0 "#PWR0112" H 8625 1700 50  0001 C CNN
F 1 "GND" H 8630 1777 50  0000 C CNN
F 2 "" H 8625 1950 50  0001 C CNN
F 3 "" H 8625 1950 50  0001 C CNN
	1    8625 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 1950 8625 1950
Text Label 2375 2500 2    50   ~ 0
IN1
Text Label 2375 2700 2    50   ~ 0
IN2
$Comp
L Device:R_POT RV101
U 1 1 5C9B462D
P 4625 4350
F 0 "RV101" H 4555 4396 50  0000 R CNN
F 1 "10k" H 4555 4305 50  0000 R CNN
F 2 "Custom:Potentiometer_P120PK-Y25BR10K" H 4625 4350 50  0001 C CNN
F 3 "~" H 4625 4350 50  0001 C CNN
	1    4625 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0113
U 1 1 5C9B46F8
P 4625 4125
F 0 "#PWR0113" H 4625 3975 50  0001 C CNN
F 1 "+5V" H 4640 4298 50  0000 C CNN
F 2 "" H 4625 4125 50  0001 C CNN
F 3 "" H 4625 4125 50  0001 C CNN
	1    4625 4125
	1    0    0    -1  
$EndComp
Wire Wire Line
	4625 4200 4625 4125
$Comp
L power:GND #PWR0114
U 1 1 5C9B496F
P 4625 4550
F 0 "#PWR0114" H 4625 4300 50  0001 C CNN
F 1 "GND" H 4630 4377 50  0000 C CNN
F 2 "" H 4625 4550 50  0001 C CNN
F 3 "" H 4625 4550 50  0001 C CNN
	1    4625 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4625 4550 4625 4500
Text Label 4775 4350 0    50   ~ 0
POT_1
$Comp
L Device:R_POT RV103
U 1 1 5C9B4CD0
P 5300 4350
F 0 "RV103" H 5230 4396 50  0000 R CNN
F 1 "10k" H 5230 4305 50  0000 R CNN
F 2 "Custom:Potentiometer_P120PK-Y25BR10K" H 5300 4350 50  0001 C CNN
F 3 "~" H 5300 4350 50  0001 C CNN
	1    5300 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0115
U 1 1 5C9B4CD6
P 5300 4125
F 0 "#PWR0115" H 5300 3975 50  0001 C CNN
F 1 "+5V" H 5315 4298 50  0000 C CNN
F 2 "" H 5300 4125 50  0001 C CNN
F 3 "" H 5300 4125 50  0001 C CNN
	1    5300 4125
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4200 5300 4125
$Comp
L power:GND #PWR0116
U 1 1 5C9B4CDD
P 5300 4550
F 0 "#PWR0116" H 5300 4300 50  0001 C CNN
F 1 "GND" H 5305 4377 50  0000 C CNN
F 2 "" H 5300 4550 50  0001 C CNN
F 3 "" H 5300 4550 50  0001 C CNN
	1    5300 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4550 5300 4500
Text Label 5450 4350 0    50   ~ 0
POT_2
$Comp
L Device:R_POT RV105
U 1 1 5C9B4FDB
P 5975 4350
F 0 "RV105" H 5905 4396 50  0000 R CNN
F 1 "10k" H 5905 4305 50  0000 R CNN
F 2 "Custom:Potentiometer_P120PK-Y25BR10K" H 5975 4350 50  0001 C CNN
F 3 "~" H 5975 4350 50  0001 C CNN
	1    5975 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0117
U 1 1 5C9B4FE1
P 5975 4125
F 0 "#PWR0117" H 5975 3975 50  0001 C CNN
F 1 "+5V" H 5990 4298 50  0000 C CNN
F 2 "" H 5975 4125 50  0001 C CNN
F 3 "" H 5975 4125 50  0001 C CNN
	1    5975 4125
	1    0    0    -1  
$EndComp
Wire Wire Line
	5975 4200 5975 4125
$Comp
L power:GND #PWR0118
U 1 1 5C9B4FE8
P 5975 4550
F 0 "#PWR0118" H 5975 4300 50  0001 C CNN
F 1 "GND" H 5980 4377 50  0000 C CNN
F 2 "" H 5975 4550 50  0001 C CNN
F 3 "" H 5975 4550 50  0001 C CNN
	1    5975 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5975 4550 5975 4500
Text Label 6125 4350 0    50   ~ 0
POT_3
Text Label 3375 3100 0    50   ~ 0
POT_1
Text Label 3375 3200 0    50   ~ 0
POT_2
Text Label 3375 3300 0    50   ~ 0
POT_3
Text Label 2375 2600 2    50   ~ 0
nFault
$Comp
L power:GND #PWR0119
U 1 1 5C9B6605
P 2875 3975
F 0 "#PWR0119" H 2875 3725 50  0001 C CNN
F 1 "GND" H 2880 3802 50  0000 C CNN
F 2 "" H 2875 3975 50  0001 C CNN
F 3 "" H 2875 3975 50  0001 C CNN
	1    2875 3975
	1    0    0    -1  
$EndComp
Wire Wire Line
	2775 3900 2775 3975
Wire Wire Line
	2775 3975 2875 3975
Wire Wire Line
	2875 3900 2875 3975
Connection ~ 2875 3975
Wire Wire Line
	2975 3900 2975 3975
Wire Wire Line
	2975 3975 2875 3975
$Comp
L power:+12V #PWR0120
U 1 1 5C9BA3A7
P 2775 1650
F 0 "#PWR0120" H 2775 1500 50  0001 C CNN
F 1 "+12V" H 2790 1823 50  0000 C CNN
F 2 "" H 2775 1650 50  0001 C CNN
F 3 "" H 2775 1650 50  0001 C CNN
	1    2775 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2775 1650 2775 1800
$Comp
L power:+5V #PWR0121
U 1 1 5C9BA999
P 3075 1650
F 0 "#PWR0121" H 3075 1500 50  0001 C CNN
F 1 "+5V" H 3090 1823 50  0000 C CNN
F 2 "" H 3075 1650 50  0001 C CNN
F 3 "" H 3075 1650 50  0001 C CNN
	1    3075 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3075 1800 3075 1650
Text Notes 4250 3950 0    50   ~ 0
P Value
Text Notes 4900 3950 0    50   ~ 0
I Value
Text Notes 5625 3950 0    50   ~ 0
D Value
$Comp
L Connector:Conn_01x10_Male J103
U 1 1 5C9E806E
P 925 2125
F 0 "J103" H 1031 2703 50  0000 C CNN
F 1 "Conn_01x10_Male" H 1031 2612 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 925 2125 50  0001 C CNN
F 3 "~" H 925 2125 50  0001 C CNN
	1    925  2125
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Male J104
U 1 1 5C9E8171
P 925 3225
F 0 "J104" H 1031 3703 50  0000 C CNN
F 1 "Conn_01x08_Male" H 1031 3612 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 925 3225 50  0001 C CNN
F 3 "~" H 925 3225 50  0001 C CNN
	1    925  3225
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Male J105
U 1 1 5C9E81FB
P 950 4600
F 0 "J105" H 1056 5078 50  0000 C CNN
F 1 "Conn_01x08_Male" H 1056 4987 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 950 4600 50  0001 C CNN
F 3 "~" H 950 4600 50  0001 C CNN
	1    950  4600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J106
U 1 1 5C9E834B
P 950 5550
F 0 "J106" H 1056 5928 50  0000 C CNN
F 1 "Conn_01x06_Male" H 1056 5837 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 950 5550 50  0001 C CNN
F 3 "~" H 950 5550 50  0001 C CNN
	1    950  5550
	1    0    0    -1  
$EndComp
Text Label 1125 1725 0    50   ~ 0
P_32
Text Label 1125 1825 0    50   ~ 0
P_31
Text Label 1125 1925 0    50   ~ 0
P_30
$Comp
L power:GND #PWR0122
U 1 1 5C9E86CE
P 1425 2025
F 0 "#PWR0122" H 1425 1775 50  0001 C CNN
F 1 "GND" H 1430 1852 50  0000 C CNN
F 2 "" H 1425 2025 50  0001 C CNN
F 3 "" H 1425 2025 50  0001 C CNN
	1    1425 2025
	1    0    0    -1  
$EndComp
Wire Wire Line
	1125 2025 1425 2025
Text Label 1125 2125 0    50   ~ 0
P_28
Text Label 1125 2225 0    50   ~ 0
P_27
Text Label 1125 2325 0    50   ~ 0
P_26
Text Label 1125 2425 0    50   ~ 0
P_25
Text Label 1125 2525 0    50   ~ 0
P_24
Text Label 1125 2625 0    50   ~ 0
P_23
Text Label 1125 2925 0    50   ~ 0
P_22
Text Label 1125 3025 0    50   ~ 0
P_21
Text Label 1125 3125 0    50   ~ 0
P_20
Text Label 1125 3225 0    50   ~ 0
P_19
Text Label 1125 3425 0    50   ~ 0
P_17
Text Label 1125 3525 0    50   ~ 0
P_16
Text Label 1125 3625 0    50   ~ 0
P_15
Text Label 1150 4300 0    50   ~ 0
P_1
Text Label 1150 4400 0    50   ~ 0
P_2
Text Label 1150 4500 0    50   ~ 0
P_3
Text Label 1150 4600 0    50   ~ 0
P_4
Text Label 1150 5350 0    50   ~ 0
P_9
Text Label 1150 5450 0    50   ~ 0
P_10
Text Label 1150 5550 0    50   ~ 0
P_11
Text Label 1150 5650 0    50   ~ 0
P_12
Text Label 1150 5750 0    50   ~ 0
P_13
Text Label 1150 5850 0    50   ~ 0
P_14
Text Label 2075 2200 2    50   ~ 0
P_15
Wire Wire Line
	2075 2200 2375 2200
Text Label 2075 2300 2    50   ~ 0
P_16
Text Label 2075 2400 2    50   ~ 0
P_17
Text Label 2075 2500 2    50   ~ 0
P_18
Text Label 2075 2600 2    50   ~ 0
P_19
Text Label 2075 2700 2    50   ~ 0
P_20
Text Label 2075 2800 2    50   ~ 0
P_21
Text Label 2075 2900 2    50   ~ 0
P_22
Text Label 2075 3000 2    50   ~ 0
P_23
Text Label 2075 3100 2    50   ~ 0
P_24
Text Label 2075 3200 2    50   ~ 0
P_25
Text Label 2075 3300 2    50   ~ 0
P_26
Text Label 2075 3400 2    50   ~ 0
P_27
Text Label 2075 3500 2    50   ~ 0
P_28
$Comp
L power:GND #PWR0123
U 1 1 5C9EB354
P 1450 4800
F 0 "#PWR0123" H 1450 4550 50  0001 C CNN
F 1 "GND" H 1455 4627 50  0000 C CNN
F 2 "" H 1450 4800 50  0001 C CNN
F 3 "" H 1450 4800 50  0001 C CNN
	1    1450 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 4800 1325 4800
Wire Wire Line
	1150 4900 1325 4900
Wire Wire Line
	1325 4900 1325 4800
Connection ~ 1325 4800
Wire Wire Line
	1325 4800 1450 4800
$Comp
L power:+12V #PWR0124
U 1 1 5C9EC861
P 1600 5050
F 0 "#PWR0124" H 1600 4900 50  0001 C CNN
F 1 "+12V" H 1615 5223 50  0000 C CNN
F 2 "" H 1600 5050 50  0001 C CNN
F 3 "" H 1600 5050 50  0001 C CNN
	1    1600 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 5000 1150 5050
Wire Wire Line
	1150 5050 1600 5050
Wire Wire Line
	2375 2500 2075 2500
Wire Wire Line
	2375 2600 2075 2600
Wire Wire Line
	2375 2700 2075 2700
Wire Wire Line
	2375 2800 2075 2800
Wire Wire Line
	2075 2900 2375 2900
Wire Wire Line
	2375 3000 2075 3000
Wire Wire Line
	2075 3100 2375 3100
Wire Wire Line
	2375 3200 2075 3200
Wire Wire Line
	2075 3300 2375 3300
Wire Wire Line
	2075 3400 2375 3400
Wire Wire Line
	2375 3500 2075 3500
Wire Wire Line
	2075 2400 2375 2400
Wire Wire Line
	2375 2300 2075 2300
Text Label 3650 2800 0    50   ~ 0
P_9
Text Label 3650 2900 0    50   ~ 0
P_10
Text Label 3650 3000 0    50   ~ 0
P_11
Text Label 3650 3100 0    50   ~ 0
P_12
Text Label 3650 3200 0    50   ~ 0
P_13
Text Label 3650 3300 0    50   ~ 0
P_14
Wire Wire Line
	3650 2800 3375 2800
Wire Wire Line
	3375 2900 3650 2900
Wire Wire Line
	3650 3000 3375 3000
Wire Wire Line
	3375 3100 3650 3100
Wire Wire Line
	3650 3200 3375 3200
Wire Wire Line
	3375 3300 3650 3300
Text Label 3650 3500 0    50   ~ 0
P_31
Text Label 3650 3600 0    50   ~ 0
P_32
Wire Wire Line
	3650 3500 3375 3500
Wire Wire Line
	3375 3600 3650 3600
Text Label 3650 2600 0    50   ~ 0
P_30
Wire Wire Line
	3650 2600 3375 2600
Text Label 3650 2400 0    50   ~ 0
P_2
Wire Wire Line
	3650 2400 3375 2400
Text Label 3650 2200 0    50   ~ 0
P_3
Wire Wire Line
	3375 2200 3650 2200
Text Label 2975 1800 1    50   ~ 0
P_4
Text Label 1125 3325 0    50   ~ 0
P_18
$Comp
L power:+5V #PWR?
U 1 1 5CA094CC
P 1425 4700
F 0 "#PWR?" H 1425 4550 50  0001 C CNN
F 1 "+5V" H 1440 4873 50  0000 C CNN
F 2 "" H 1425 4700 50  0001 C CNN
F 3 "" H 1425 4700 50  0001 C CNN
	1    1425 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 4700 1425 4700
Wire Notes Line
	4200 1400 6450 1400
Wire Notes Line
	6450 1400 6450 3400
Wire Notes Line
	6450 3400 4200 3400
Wire Notes Line
	4200 3400 4200 1400
Text Notes 4225 1375 0    50   ~ 0
Sensor Inverting Amplifier
Wire Notes Line
	6625 1400 9525 1400
Wire Notes Line
	9525 1400 9525 2625
Wire Notes Line
	9525 2625 6625 2625
Wire Notes Line
	6625 2625 6625 1400
Text Notes 6625 1375 0    50   ~ 0
Magnet Driver
Wire Notes Line
	4200 3725 6400 3725
Wire Notes Line
	6400 3725 6400 4975
Wire Notes Line
	6400 4975 4200 4975
Wire Notes Line
	4200 4975 4200 3725
Text Notes 4200 3700 0    50   ~ 0
Analog Adjustment Knobs
Wire Notes Line
	625  1400 1550 1400
Wire Notes Line
	1550 1400 1550 5975
Wire Notes Line
	1550 5975 625  5975
Wire Notes Line
	625  5975 625  1400
Text Notes 625  1375 0    50   ~ 0
Breakout Pins
Wire Notes Line
	9700 1400 11075 1400
Wire Notes Line
	11075 1400 11075 2100
Wire Notes Line
	11075 2100 9700 2100
Wire Notes Line
	9700 2100 9700 1400
Text Notes 9700 1350 0    50   ~ 0
Power Terminal
Wire Notes Line
	1825 1400 3975 1400
Wire Notes Line
	3975 1400 3975 4300
Wire Notes Line
	3975 4300 1825 4300
Wire Notes Line
	1825 4300 1825 1400
Text Notes 1825 1350 0    50   ~ 0
Arduino Microcontroller
$EndSCHEMATC
