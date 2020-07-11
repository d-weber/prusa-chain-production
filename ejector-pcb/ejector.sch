EESchema Schematic File Version 4
EELAYER 30 0
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
L ejector:A4988 U2
U 1 1 5EF850D1
P 7950 3850
F 0 "U2" H 8350 4115 50  0000 C CNN
F 1 "A4988" H 8350 4024 50  0000 C CNN
F 2 "ejector:A4988" H 7950 3850 50  0001 C CNN
F 3 "" H 7950 3850 50  0001 C CNN
	1    7950 3850
	1    0    0    -1  
$EndComp
$Comp
L ejector:A4988 U3
U 1 1 5EF85FF5
P 7950 5150
F 0 "U3" H 8350 5415 50  0000 C CNN
F 1 "A4988" H 8350 5324 50  0000 C CNN
F 2 "ejector:A4988" H 7950 5150 50  0001 C CNN
F 3 "" H 7950 5150 50  0001 C CNN
	1    7950 5150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male M1
U 1 1 5EF8A314
P 9600 4250
F 0 "M1" H 9572 4132 50  0000 R CNN
F 1 "Conn_01x04_Male" H 9572 4223 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 9600 4250 50  0001 C CNN
F 3 "~" H 9600 4250 50  0001 C CNN
	1    9600 4250
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x04_Male M2
U 1 1 5EF8C1CB
P 9600 5550
F 0 "M2" H 9572 5432 50  0000 R CNN
F 1 "Conn_01x04_Male" H 9572 5523 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 9600 5550 50  0001 C CNN
F 3 "~" H 9600 5550 50  0001 C CNN
	1    9600 5550
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Male LED1
U 1 1 5EF97AF1
P 1350 1400
F 0 "LED1" H 1458 1581 50  0000 C CNN
F 1 "Conn_01x02_Female" H 1458 1490 50  0000 C CNN
F 2 "Connector_Molex:Molex_SL_171971-0002_1x02_P2.54mm_Vertical" H 1350 1400 50  0001 C CNN
F 3 "~" H 1350 1400 50  0001 C CNN
	1    1350 1400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male FAN1
U 1 1 5EF99612
P 1350 3950
F 0 "FAN1" H 1458 4231 50  0000 C CNN
F 1 "Conn_01x02_Female" H 1458 4140 50  0000 C CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 1350 3950 50  0001 C CNN
F 3 "~" H 1350 3950 50  0001 C CNN
	1    1350 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5EF9ED62
P 4550 3150
F 0 "#PWR0101" H 4550 2900 50  0001 C CNN
F 1 "GND" V 4555 3022 50  0000 R CNN
F 2 "" H 4550 3150 50  0001 C CNN
F 3 "" H 4550 3150 50  0001 C CNN
	1    4550 3150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5EF9FBA9
P 5800 3000
F 0 "#PWR0102" H 5800 2750 50  0001 C CNN
F 1 "GND" V 5805 2872 50  0000 R CNN
F 2 "" H 5800 3000 50  0001 C CNN
F 3 "" H 5800 3000 50  0001 C CNN
	1    5800 3000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5EFA0851
P 9350 3950
F 0 "#PWR0103" H 9350 3700 50  0001 C CNN
F 1 "GND" V 9355 3822 50  0000 R CNN
F 2 "" H 9350 3950 50  0001 C CNN
F 3 "" H 9350 3950 50  0001 C CNN
	1    9350 3950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5EFA151B
P 9300 1550
F 0 "#PWR0104" H 9300 1300 50  0001 C CNN
F 1 "GND" V 9305 1422 50  0000 R CNN
F 2 "" H 9300 1550 50  0001 C CNN
F 3 "" H 9300 1550 50  0001 C CNN
	1    9300 1550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5EFA1E5B
P 1750 3850
F 0 "#PWR0105" H 1750 3600 50  0001 C CNN
F 1 "GND" V 1755 3722 50  0000 R CNN
F 2 "" H 1750 3850 50  0001 C CNN
F 3 "" H 1750 3850 50  0001 C CNN
	1    1750 3850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5EFA31C7
P 1750 1400
F 0 "#PWR0106" H 1750 1150 50  0001 C CNN
F 1 "GND" V 1755 1272 50  0000 R CNN
F 2 "" H 1750 1400 50  0001 C CNN
F 3 "" H 1750 1400 50  0001 C CNN
	1    1750 1400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5EFA39ED
P 3500 2400
F 0 "#PWR0107" H 3500 2150 50  0001 C CNN
F 1 "GND" V 3505 2272 50  0000 R CNN
F 2 "" H 3500 2400 50  0001 C CNN
F 3 "" H 3500 2400 50  0001 C CNN
	1    3500 2400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5EFA45EC
P 3600 4850
F 0 "#PWR0108" H 3600 4600 50  0001 C CNN
F 1 "GND" V 3605 4722 50  0000 R CNN
F 2 "" H 3600 4850 50  0001 C CNN
F 3 "" H 3600 4850 50  0001 C CNN
	1    3600 4850
	0    -1   -1   0   
$EndComp
NoConn ~ 1550 4050
Wire Wire Line
	1550 1400 1750 1400
Wire Wire Line
	1550 1500 2150 1500
Wire Wire Line
	1550 3950 2100 3950
Wire Wire Line
	1550 3850 1750 3850
$Comp
L power:+24V #PWR0109
U 1 1 5EFB2640
P 9300 1650
F 0 "#PWR0109" H 9300 1500 50  0001 C CNN
F 1 "+24V" V 9315 1778 50  0000 L CNN
F 2 "" H 9300 1650 50  0001 C CNN
F 3 "" H 9300 1650 50  0001 C CNN
	1    9300 1650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9300 1650 9450 1650
Wire Wire Line
	9300 1550 9450 1550
$Comp
L power:+12V #PWR0112
U 1 1 5EFB5F81
P 2900 1600
F 0 "#PWR0112" H 2900 1450 50  0001 C CNN
F 1 "+12V" V 2915 1728 50  0000 L CNN
F 2 "" H 2900 1600 50  0001 C CNN
F 3 "" H 2900 1600 50  0001 C CNN
	1    2900 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 1600 2850 1600
$Comp
L power:+12V #PWR0113
U 1 1 5EFB6CEF
P 2900 4050
F 0 "#PWR0113" H 2900 3900 50  0001 C CNN
F 1 "+12V" V 2915 4178 50  0000 L CNN
F 2 "" H 2900 4050 50  0001 C CNN
F 3 "" H 2900 4050 50  0001 C CNN
	1    2900 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 4050 2850 4050
$Comp
L Connector:Conn_01x03_Male FAN2
U 1 1 5EFB8B2D
P 1350 4450
F 0 "FAN2" H 1458 4731 50  0000 C CNN
F 1 "Conn_01x02_Female" H 1458 4640 50  0000 C CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 1350 4450 50  0001 C CNN
F 3 "~" H 1350 4450 50  0001 C CNN
	1    1350 4450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male LED2
U 1 1 5EFB9922
P 1350 1800
F 0 "LED2" H 1458 1981 50  0000 C CNN
F 1 "Conn_01x02_Female" H 1458 1890 50  0000 C CNN
F 2 "Connector_Molex:Molex_SL_171971-0002_1x02_P2.54mm_Vertical" H 1350 1800 50  0001 C CNN
F 3 "~" H 1350 1800 50  0001 C CNN
	1    1350 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5EFBA28F
P 1750 1800
F 0 "#PWR0114" H 1750 1550 50  0001 C CNN
F 1 "GND" V 1755 1672 50  0000 R CNN
F 2 "" H 1750 1800 50  0001 C CNN
F 3 "" H 1750 1800 50  0001 C CNN
	1    1750 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1550 1800 1750 1800
Wire Wire Line
	1550 1900 2150 1900
Wire Wire Line
	2850 1600 2850 2000
Wire Wire Line
	2850 2000 2800 2000
Connection ~ 2850 1600
Wire Wire Line
	2850 1600 2900 1600
$Comp
L power:GND #PWR0115
U 1 1 5EFBCD82
P 1750 4350
F 0 "#PWR0115" H 1750 4100 50  0001 C CNN
F 1 "GND" V 1755 4222 50  0000 R CNN
F 2 "" H 1750 4350 50  0001 C CNN
F 3 "" H 1750 4350 50  0001 C CNN
	1    1750 4350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1550 4350 1750 4350
Wire Wire Line
	2200 4350 2100 4350
Wire Wire Line
	2100 4350 2100 4450
Wire Wire Line
	2100 4450 1550 4450
Wire Wire Line
	2850 4050 2850 4450
Wire Wire Line
	2850 4450 2800 4450
Connection ~ 2850 4050
Wire Wire Line
	2850 4050 2900 4050
Wire Wire Line
	2950 4850 2800 4850
Wire Wire Line
	2950 2400 2800 2400
$Comp
L power:+24V #PWR0116
U 1 1 5EFBF85C
P 9350 3650
F 0 "#PWR0116" H 9350 3500 50  0001 C CNN
F 1 "+24V" V 9365 3778 50  0000 L CNN
F 2 "" H 9350 3650 50  0001 C CNN
F 3 "" H 9350 3650 50  0001 C CNN
	1    9350 3650
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0119
U 1 1 5EFC3758
P 5800 3200
F 0 "#PWR0119" H 5800 3050 50  0001 C CNN
F 1 "+5V" V 5815 3328 50  0000 L CNN
F 2 "" H 5800 3200 50  0001 C CNN
F 3 "" H 5800 3200 50  0001 C CNN
	1    5800 3200
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0120
U 1 1 5EFC3E62
P 8950 5750
F 0 "#PWR0120" H 8950 5600 50  0001 C CNN
F 1 "+5V" V 8965 5878 50  0000 L CNN
F 2 "" H 8950 5750 50  0001 C CNN
F 3 "" H 8950 5750 50  0001 C CNN
	1    8950 5750
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0121
U 1 1 5EFC4B5D
P 8950 4450
F 0 "#PWR0121" H 8950 4300 50  0001 C CNN
F 1 "+5V" V 8965 4578 50  0000 L CNN
F 2 "" H 8950 4450 50  0001 C CNN
F 3 "" H 8950 4450 50  0001 C CNN
	1    8950 4450
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5EFC541A
P 8950 4550
F 0 "#PWR0122" H 8950 4300 50  0001 C CNN
F 1 "GND" V 8955 4422 50  0000 R CNN
F 2 "" H 8950 4550 50  0001 C CNN
F 3 "" H 8950 4550 50  0001 C CNN
	1    8950 4550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 5EFC5A1E
P 8950 5850
F 0 "#PWR0123" H 8950 5600 50  0001 C CNN
F 1 "GND" V 8955 5722 50  0000 R CNN
F 2 "" H 8950 5850 50  0001 C CNN
F 3 "" H 8950 5850 50  0001 C CNN
	1    8950 5850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8950 5750 8750 5750
Wire Wire Line
	8750 5850 8950 5850
Wire Wire Line
	9400 5350 8750 5350
Wire Wire Line
	8750 5450 9400 5450
Wire Wire Line
	9400 5550 8750 5550
Wire Wire Line
	8750 5650 9400 5650
Wire Wire Line
	9400 4350 8750 4350
Wire Wire Line
	8750 4250 9400 4250
Wire Wire Line
	9400 4150 8750 4150
Wire Wire Line
	8750 4050 9400 4050
Wire Wire Line
	8950 4450 8750 4450
Wire Wire Line
	8750 4550 8950 4550
Wire Wire Line
	5800 3200 5600 3200
Wire Wire Line
	5600 3000 5800 3000
NoConn ~ 5600 3100
Wire Wire Line
	4850 3100 4750 3100
Wire Wire Line
	4750 3100 4750 3150
Wire Wire Line
	4750 3200 4850 3200
Wire Wire Line
	4750 3150 4550 3150
Connection ~ 4750 3150
Wire Wire Line
	4750 3150 4750 3200
NoConn ~ 4850 2900
NoConn ~ 4850 3000
NoConn ~ 5600 2900
$Comp
L Relay:G6K-2 K1
U 1 1 5EF8E97F
P 2500 2000
F 0 "K1" V 3267 2000 50  0000 C CNN
F 1 "AZ850-x" V 3176 2000 50  0000 C CNN
F 2 "Relay_THT:Relay_DPDT_Panasonic_JW2" H 3050 2050 50  0001 C CNN
F 3 "http://www.azettler.com/pdfs/az850.pdf" H 2500 2000 50  0001 C CNN
	1    2500 2000
	0    -1   -1   0   
$EndComp
$Comp
L Relay:G6K-2 K2
U 1 1 5EF9653D
P 2500 4450
F 0 "K2" V 3267 4450 50  0000 C CNN
F 1 "AZ850-x" V 3176 4450 50  0000 C CNN
F 2 "Relay_THT:Relay_DPDT_Panasonic_JW2" H 3050 4500 50  0001 C CNN
F 3 "http://www.azettler.com/pdfs/az850.pdf" H 2500 4450 50  0001 C CNN
	1    2500 4450
	0    -1   -1   0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5F114DA1
P 4850 4750
F 0 "H1" V 4804 4900 50  0000 L CNN
F 1 "MountingHole_Pad" V 4895 4900 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad" H 4850 4750 50  0001 C CNN
F 3 "~" H 4850 4750 50  0001 C CNN
	1    4850 4750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 5F11659C
P 4650 4850
F 0 "#PWR0134" H 4650 4600 50  0001 C CNN
F 1 "GND" V 4655 4722 50  0000 R CNN
F 2 "" H 4650 4850 50  0001 C CNN
F 3 "" H 4650 4850 50  0001 C CNN
	1    4650 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 4750 4650 4750
Wire Wire Line
	4650 4750 4650 4850
Wire Wire Line
	4650 4950 4750 4950
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5F12589A
P 4850 4950
F 0 "H2" V 4804 5100 50  0000 L CNN
F 1 "MountingHole_Pad" V 4895 5100 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad" H 4850 4950 50  0001 C CNN
F 3 "~" H 4850 4950 50  0001 C CNN
	1    4850 4950
	0    1    1    0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5F078C3D
P 9650 1550
F 0 "J1" H 9730 1542 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 9730 1451 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 9650 1550 50  0001 C CNN
F 3 "~" H 9650 1550 50  0001 C CNN
	1    9650 1550
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U4
U 1 1 5F07AFA2
P 9550 2450
F 0 "U4" H 9550 2692 50  0000 C CNN
F 1 "MC7800AE" H 9550 2601 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 9575 2300 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 9550 2400 50  0001 C CNN
	1    9550 2450
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N2219 Q1
U 1 1 5F07BD34
P 3150 2500
F 0 "Q1" V 3569 2500 50  0000 C CNN
F 1 "2N2222" V 3478 2500 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-18-3" V 3387 2500 50  0000 C CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 3150 2500 50  0001 L CNN
	1    3150 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP C1
U 1 1 5F07D5DA
P 8950 2600
F 0 "C1" H 9068 2646 50  0000 L CNN
F 1 "0.33u" H 9068 2555 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 8988 2450 50  0001 C CNN
F 3 "~" H 8950 2600 50  0001 C CNN
	1    8950 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 5F07E20D
P 9000 3800
F 0 "C2" H 9118 3846 50  0000 L CNN
F 1 "100u" H 9118 3755 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 9038 3650 50  0001 C CNN
F 3 "~" H 9000 3800 50  0001 C CNN
	1    9000 3800
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR0110
U 1 1 5F08D23E
P 8700 2450
F 0 "#PWR0110" H 8700 2300 50  0001 C CNN
F 1 "+24V" V 8715 2578 50  0000 L CNN
F 2 "" H 8700 2450 50  0001 C CNN
F 3 "" H 8700 2450 50  0001 C CNN
	1    8700 2450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5F08FB19
P 8700 2850
F 0 "#PWR0111" H 8700 2600 50  0001 C CNN
F 1 "GND" V 8705 2722 50  0000 R CNN
F 2 "" H 8700 2850 50  0001 C CNN
F 3 "" H 8700 2850 50  0001 C CNN
	1    8700 2850
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR0117
U 1 1 5F0912B3
P 10100 2450
F 0 "#PWR0117" H 10100 2300 50  0001 C CNN
F 1 "+12V" V 10115 2578 50  0000 L CNN
F 2 "" H 10100 2450 50  0001 C CNN
F 3 "" H 10100 2450 50  0001 C CNN
	1    10100 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	8700 2450 8950 2450
Connection ~ 8950 2450
Wire Wire Line
	8950 2450 9250 2450
Wire Wire Line
	8700 2850 8950 2850
Wire Wire Line
	9550 2850 9550 2750
Wire Wire Line
	8950 2750 8950 2850
Connection ~ 8950 2850
Wire Wire Line
	8950 2850 9550 2850
Wire Wire Line
	9850 2450 10100 2450
$Comp
L Transistor_BJT:2N2219 Q2
U 1 1 5F09F045
P 3150 4950
F 0 "Q2" V 3569 4950 50  0000 C CNN
F 1 "2N2222" V 3478 4950 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-18-3" V 3387 4950 50  0000 C CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 3150 4950 50  0001 L CNN
	1    3150 4950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3350 2400 3500 2400
Wire Wire Line
	3350 4850 3600 4850
$Comp
L power:+5V #PWR0118
U 1 1 5F0A5A47
P 2000 4850
F 0 "#PWR0118" H 2000 4700 50  0001 C CNN
F 1 "+5V" V 2015 4978 50  0000 L CNN
F 2 "" H 2000 4850 50  0001 C CNN
F 3 "" H 2000 4850 50  0001 C CNN
	1    2000 4850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 4850 2200 4850
Wire Wire Line
	8750 3950 9000 3950
Connection ~ 9000 3950
Wire Wire Line
	9000 3950 9350 3950
Wire Wire Line
	9350 3650 9000 3650
Wire Wire Line
	8850 3650 8850 3850
Wire Wire Line
	8850 3850 8750 3850
Connection ~ 9000 3650
Wire Wire Line
	9000 3650 8850 3650
$Comp
L power:GND #PWR0124
U 1 1 5F0C362A
P 9350 5250
F 0 "#PWR0124" H 9350 5000 50  0001 C CNN
F 1 "GND" V 9355 5122 50  0000 R CNN
F 2 "" H 9350 5250 50  0001 C CNN
F 3 "" H 9350 5250 50  0001 C CNN
	1    9350 5250
	0    -1   -1   0   
$EndComp
$Comp
L power:+24V #PWR0125
U 1 1 5F0C3630
P 9350 4950
F 0 "#PWR0125" H 9350 4800 50  0001 C CNN
F 1 "+24V" V 9365 5078 50  0000 L CNN
F 2 "" H 9350 4950 50  0001 C CNN
F 3 "" H 9350 4950 50  0001 C CNN
	1    9350 4950
	0    1    1    0   
$EndComp
$Comp
L Device:CP C3
U 1 1 5F0C3636
P 9000 5100
F 0 "C3" H 9118 5146 50  0000 L CNN
F 1 "100u" H 9118 5055 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 9038 4950 50  0001 C CNN
F 3 "~" H 9000 5100 50  0001 C CNN
	1    9000 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 5250 9000 5250
Connection ~ 9000 5250
Wire Wire Line
	9000 5250 9350 5250
Wire Wire Line
	9350 4950 9000 4950
Wire Wire Line
	8850 4950 8850 5150
Wire Wire Line
	8850 5150 8750 5150
Connection ~ 9000 4950
Wire Wire Line
	9000 4950 8850 4950
Text Label 3150 5300 2    50   ~ 0
FAN_EN
Text Label 3150 2800 2    50   ~ 0
LED_EN
Wire Wire Line
	3150 2800 3150 2700
Wire Wire Line
	3150 5300 3150 5150
NoConn ~ 1550 4550
NoConn ~ 2200 1700
NoConn ~ 2200 2100
Wire Wire Line
	2150 1500 2150 1900
Connection ~ 2150 1500
Wire Wire Line
	2150 1500 2200 1500
Connection ~ 2150 1900
Wire Wire Line
	2150 1900 2200 1900
Wire Wire Line
	2100 4350 2100 3950
Connection ~ 2100 4350
Connection ~ 2100 3950
Wire Wire Line
	2100 3950 2200 3950
NoConn ~ 2200 4150
NoConn ~ 2200 4550
$Comp
L power:+5V #PWR0126
U 1 1 5F13EE0D
P 2000 2400
F 0 "#PWR0126" H 2000 2250 50  0001 C CNN
F 1 "+5V" V 2015 2528 50  0000 L CNN
F 2 "" H 2000 2400 50  0001 C CNN
F 3 "" H 2000 2400 50  0001 C CNN
	1    2000 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 2400 2200 2400
Connection ~ 4650 4850
Wire Wire Line
	4650 4850 4650 4950
Text Label 5600 3700 0    50   ~ 0
SCLK
Text Label 5600 3800 0    50   ~ 0
MISO
Text Label 5600 3900 0    50   ~ 0
MOSI
Text Label 7950 4050 2    50   ~ 0
SCLK
Text Label 7950 5350 2    50   ~ 0
SCLK
Text Label 7950 4250 2    50   ~ 0
MISO
Text Label 7950 5550 2    50   ~ 0
MISO
Text Label 7950 3950 2    50   ~ 0
MOSI
Text Label 7950 5250 2    50   ~ 0
MOSI
Text Label 7950 3850 2    50   ~ 0
M1_EN
Text Label 7950 4150 2    50   ~ 0
M1_CS
Text Label 7950 4450 2    50   ~ 0
M1_STEP
Text Label 7950 4550 2    50   ~ 0
M1_DIR
Text Label 7950 5150 2    50   ~ 0
M2_EN
Text Label 7950 5450 2    50   ~ 0
M2_CS
Text Label 7950 5750 2    50   ~ 0
M2_STEP
Text Label 7950 5850 2    50   ~ 0
M2_DIR
$Comp
L ejector:Arduino_pro_micro U1
U 1 1 5EF831D5
P 4850 2900
F 0 "U1" H 5225 3165 50  0000 C CNN
F 1 "Arduino_pro_micro" H 5225 3074 50  0000 C CNN
F 2 "ejector:ARDUINOPROMICRO" H 4850 2900 50  0001 C CNN
F 3 "" H 4850 2900 50  0001 C CNN
	1    4850 2900
	1    0    0    -1  
$EndComp
Text Label 5600 3600 0    50   ~ 0
LED_EN
Text Label 5600 3500 0    50   ~ 0
FAN_EN
Text Label 4850 3300 2    50   ~ 0
M2_EN
Text Label 4850 3400 2    50   ~ 0
M2_CS
Text Label 4850 3500 2    50   ~ 0
M2_STEP
Text Label 4850 3600 2    50   ~ 0
M2_DIR
Text Label 4850 3700 2    50   ~ 0
M1_EN
Text Label 4850 3800 2    50   ~ 0
M1_CS
Text Label 4850 3900 2    50   ~ 0
M1_STEP
Text Label 4850 4000 2    50   ~ 0
M1_DIR
NoConn ~ 5600 3400
NoConn ~ 5600 3300
NoConn ~ 5600 4000
$EndSCHEMATC
