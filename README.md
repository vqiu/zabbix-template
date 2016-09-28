## zabbix-template

- Huawei-9303 目录

 &emsp;&emsp; 为 zabbix-3 系列为`华为交换机 9303` 制作的模块文件，该模版文件中对应关系为：
 
|  NO   |       Interface Name      |   Download  Key   |    Upload Key     |           Upload OID        |     Download OID         |
|:-----:| ------------------------- | ----------------- | ----------------- | --------------------------- | ------------------------ |
|	1	|	GigabitEthernet3/0/0	|	ifInOctets.7	|	ifOutOctets.7	|	.1.3.6.1.2.1.2.2.1.10.7	  |	.1.3.6.1.2.1.2.2.1.16.7	 |
|	2	|	GigabitEthernet3/0/1	|	ifInOctets.8	|	ifOutOctets.8	|	.1.3.6.1.2.1.2.2.1.10.8	  |	.1.3.6.1.2.1.2.2.1.16.8	 |
|	3	|	GigabitEthernet3/0/2	|	ifInOctets.9	|	ifOutOctets.9	|	.1.3.6.1.2.1.2.2.1.10.9	  |	.1.3.6.1.2.1.2.2.1.16.9	 |
|	4	|	GigabitEthernet3/0/3	|	ifInOctets.10	|	ifOutOctets.10	|	.1.3.6.1.2.1.2.2.1.10.10  |	.1.3.6.1.2.1.2.2.1.16.10 |
|	5	|	GigabitEthernet3/0/4	|	ifInOctets.11	|	ifOutOctets.11	|	.1.3.6.1.2.1.2.2.1.10.11  |	.1.3.6.1.2.1.2.2.1.16.11 |
|	6	|	GigabitEthernet3/0/5	|	ifInOctets.12	|	ifOutOctets.12	|	.1.3.6.1.2.1.2.2.1.10.12  |	.1.3.6.1.2.1.2.2.1.16.12 |
|	7	|	GigabitEthernet3/0/6	|	ifInOctets.13	|	ifOutOctets.13	|	.1.3.6.1.2.1.2.2.1.10.13  |	.1.3.6.1.2.1.2.2.1.16.13 |
|	8	|	GigabitEthernet3/0/7	|	ifInOctets.14	|	ifOutOctets.14	|	.1.3.6.1.2.1.2.2.1.10.14  |	.1.3.6.1.2.1.2.2.1.16.14 |
|	9	|	GigabitEthernet3/0/8	|	ifInOctets.15	|	ifOutOctets.15	|	.1.3.6.1.2.1.2.2.1.10.15  |	.1.3.6.1.2.1.2.2.1.16.15 |
|	10	|	GigabitEthernet3/0/9	|	ifInOctets.16	|	ifOutOctets.16	|	.1.3.6.1.2.1.2.2.1.10.16  |	.1.3.6.1.2.1.2.2.1.16.16 |
|	11	|	GigabitEthernet3/0/10	|	ifInOctets.17	|	ifOutOctets.17	|	.1.3.6.1.2.1.2.2.1.10.17  |	.1.3.6.1.2.1.2.2.1.16.17 |
|	12	|	GigabitEthernet3/0/11	|	ifInOctets.18	|	ifOutOctets.18	|	.1.3.6.1.2.1.2.2.1.10.18  |	.1.3.6.1.2.1.2.2.1.16.18 |
|	13	|	GigabitEthernet3/0/12	|	ifInOctets.19	|	ifOutOctets.19	|	.1.3.6.1.2.1.2.2.1.10.19  |	.1.3.6.1.2.1.2.2.1.16.19 |
|	14	|	GigabitEthernet3/0/13	|	ifInOctets.20	|	ifOutOctets.20	|	.1.3.6.1.2.1.2.2.1.10.20  |	.1.3.6.1.2.1.2.2.1.16.20 |
|	15	|	GigabitEthernet3/0/14	|	ifInOctets.21	|	ifOutOctets.21	|	.1.3.6.1.2.1.2.2.1.10.21  |	.1.3.6.1.2.1.2.2.1.16.21 |
|	16	|	GigabitEthernet3/0/15	|	ifInOctets.22	|	ifOutOctets.22	|	.1.3.6.1.2.1.2.2.1.10.22  |	.1.3.6.1.2.1.2.2.1.16.22 |
|	17	|	GigabitEthernet3/0/16	|	ifInOctets.23	|	ifOutOctets.23	|	.1.3.6.1.2.1.2.2.1.10.23  |	.1.3.6.1.2.1.2.2.1.16.23 |
|	18	|	GigabitEthernet3/0/17	|	ifInOctets.24	|	ifOutOctets.24	|	.1.3.6.1.2.1.2.2.1.10.24  |	.1.3.6.1.2.1.2.2.1.16.24 |
|	19	|	GigabitEthernet3/0/18	|	ifInOctets.25	|	ifOutOctets.25	|	.1.3.6.1.2.1.2.2.1.10.25  |	.1.3.6.1.2.1.2.2.1.16.25 |
|	20	|	GigabitEthernet3/0/19	|	ifInOctets.26	|	ifOutOctets.26	|	.1.3.6.1.2.1.2.2.1.10.26  |	.1.3.6.1.2.1.2.2.1.16.26 |
|	21	|	GigabitEthernet3/0/20	|	ifInOctets.27	|	ifOutOctets.27	|	.1.3.6.1.2.1.2.2.1.10.27  |	.1.3.6.1.2.1.2.2.1.16.27 |
|	22	|	GigabitEthernet3/0/21	|	ifInOctets.28	|	ifOutOctets.28	|	.1.3.6.1.2.1.2.2.1.10.28  |	.1.3.6.1.2.1.2.2.1.16.28 |
|	23	|	GigabitEthernet3/0/22	|	ifInOctets.29	|	ifOutOctets.29	|	.1.3.6.1.2.1.2.2.1.10.29  |	.1.3.6.1.2.1.2.2.1.16.29 |
|	24	|	GigabitEthernet3/0/23	|	ifInOctets.30	|	ifOutOctets.30	|	.1.3.6.1.2.1.2.2.1.10.30  |	.1.3.6.1.2.1.2.2.1.16.30 |
|	25	|	GigabitEthernet3/0/24	|	ifInOctets.31	|	ifOutOctets.31	|	.1.3.6.1.2.1.2.2.1.10.31  |	.1.3.6.1.2.1.2.2.1.16.31 |
|	26	|	GigabitEthernet3/0/25	|	ifInOctets.32	|	ifOutOctets.32	|	.1.3.6.1.2.1.2.2.1.10.32  |	.1.3.6.1.2.1.2.2.1.16.32 |
|	27	|	GigabitEthernet3/0/26	|	ifInOctets.33	|	ifOutOctets.33	|	.1.3.6.1.2.1.2.2.1.10.33  |	.1.3.6.1.2.1.2.2.1.16.33 |
|	28	|	GigabitEthernet3/0/27	|	ifInOctets.34	|	ifOutOctets.34	|	.1.3.6.1.2.1.2.2.1.10.34  |	.1.3.6.1.2.1.2.2.1.16.34 |
|	29	|	GigabitEthernet3/0/28	|	ifInOctets.35	|	ifOutOctets.35	|	.1.3.6.1.2.1.2.2.1.10.35  |	.1.3.6.1.2.1.2.2.1.16.35 |
|	30	|	GigabitEthernet3/0/29	|	ifInOctets.36	|	ifOutOctets.36	|	.1.3.6.1.2.1.2.2.1.10.36  |	.1.3.6.1.2.1.2.2.1.16.36 |
|	31	|	GigabitEthernet3/0/30	|	ifInOctets.37	|	ifOutOctets.37	|	.1.3.6.1.2.1.2.2.1.10.37  |	.1.3.6.1.2.1.2.2.1.16.37 |
|	32	|	GigabitEthernet3/0/31	|	ifInOctets.38	|	ifOutOctets.38	|	.1.3.6.1.2.1.2.2.1.10.38  |	.1.3.6.1.2.1.2.2.1.16.38 |
|	33	|	GigabitEthernet3/0/32	|	ifInOctets.39	|	ifOutOctets.39	|	.1.3.6.1.2.1.2.2.1.10.39  |	.1.3.6.1.2.1.2.2.1.16.39 |
|	34	|	GigabitEthernet3/0/33	|	ifInOctets.40	|	ifOutOctets.40	|	.1.3.6.1.2.1.2.2.1.10.40  |	.1.3.6.1.2.1.2.2.1.16.40 |
|	35	|	GigabitEthernet3/0/34	|	ifInOctets.41	|	ifOutOctets.41	|	.1.3.6.1.2.1.2.2.1.10.41  |	.1.3.6.1.2.1.2.2.1.16.41 |
|	36	|	GigabitEthernet3/0/35	|	ifInOctets.42	|	ifOutOctets.42	|	.1.3.6.1.2.1.2.2.1.10.42  |	.1.3.6.1.2.1.2.2.1.16.42 |
|	37	|	GigabitEthernet3/0/36	|	ifInOctets.43	|	ifOutOctets.43	|	.1.3.6.1.2.1.2.2.1.10.43  |	.1.3.6.1.2.1.2.2.1.16.43 |
|	38	|	GigabitEthernet3/0/37	|	ifInOctets.44	|	ifOutOctets.44	|	.1.3.6.1.2.1.2.2.1.10.44  |	.1.3.6.1.2.1.2.2.1.16.44 |
|	39	|	GigabitEthernet3/0/38	|	ifInOctets.45	|	ifOutOctets.45	|	.1.3.6.1.2.1.2.2.1.10.45  |	.1.3.6.1.2.1.2.2.1.16.45 |
|	40	|	GigabitEthernet3/0/39	|	ifInOctets.46	|	ifOutOctets.46	|	.1.3.6.1.2.1.2.2.1.10.46  |	.1.3.6.1.2.1.2.2.1.16.46 |
|	41	|	GigabitEthernet3/0/40	|	ifInOctets.47	|	ifOutOctets.47	|	.1.3.6.1.2.1.2.2.1.10.47  |	.1.3.6.1.2.1.2.2.1.16.47 |
|	42	|	GigabitEthernet3/0/41	|	ifInOctets.48	|	ifOutOctets.48	|	.1.3.6.1.2.1.2.2.1.10.48  |	.1.3.6.1.2.1.2.2.1.16.48 |
|	43	|	GigabitEthernet3/0/42	|	ifInOctets.49	|	ifOutOctets.49	|	.1.3.6.1.2.1.2.2.1.10.49  |	.1.3.6.1.2.1.2.2.1.16.49 |
|	44	|	GigabitEthernet3/0/43	|	ifInOctets.50	|	ifOutOctets.50	|	.1.3.6.1.2.1.2.2.1.10.50  |	.1.3.6.1.2.1.2.2.1.16.50 |
|	45	|	GigabitEthernet3/0/44	|	ifInOctets.51	|	ifOutOctets.51	|	.1.3.6.1.2.1.2.2.1.10.51  |	.1.3.6.1.2.1.2.2.1.16.51 |
|	46	|	GigabitEthernet3/0/45	|	ifInOctets.52	|	ifOutOctets.52	|	.1.3.6.1.2.1.2.2.1.10.52  |	.1.3.6.1.2.1.2.2.1.16.52 |
|	47	|	GigabitEthernet3/0/46	|	ifInOctets.53	|	ifOutOctets.53	|	.1.3.6.1.2.1.2.2.1.10.53  |	.1.3.6.1.2.1.2.2.1.16.53 |
|	48	|	GigabitEthernet3/0/47	|	ifInOctets.54	|	ifOutOctets.54	|	.1.3.6.1.2.1.2.2.1.10.54  |	.1.3.6.1.2.1.2.2.1.16.54 |
|	49	|	XGigabitEthernet1/0/0	|	ifInOctets.55	|	ifOutOctets.55	|	.1.3.6.1.2.1.2.2.1.10.55  |	.1.3.6.1.2.1.2.2.1.16.55 |
|	50	|	XGigabitEthernet1/0/1	|	ifInOctets.56	|	ifOutOctets.56	|	.1.3.6.1.2.1.2.2.1.10.56  |	.1.3.6.1.2.1.2.2.1.16.56 |
|	51	|	XGigabitEthernet1/0/2	|	ifInOctets.57	|	ifOutOctets.57	|	.1.3.6.1.2.1.2.2.1.10.57  |	.1.3.6.1.2.1.2.2.1.16.57 |
|	52	|	XGigabitEthernet1/0/3	|	ifInOctets.58	|	ifOutOctets.58	|	.1.3.6.1.2.1.2.2.1.10.58  |	.1.3.6.1.2.1.2.2.1.16.58 |
|	53	|	XGigabitEthernet1/0/4	|	ifInOctets.59	|	ifOutOctets.59	|	.1.3.6.1.2.1.2.2.1.10.59  |	.1.3.6.1.2.1.2.2.1.16.59 |
|	54	|	XGigabitEthernet1/0/5	|	ifInOctets.60	|	ifOutOctets.60	|	.1.3.6.1.2.1.2.2.1.10.60  |	.1.3.6.1.2.1.2.2.1.16.60 |
|	55	|	XGigabitEthernet1/0/6	|	ifInOctets.61	|	ifOutOctets.61	|	.1.3.6.1.2.1.2.2.1.10.61  |	.1.3.6.1.2.1.2.2.1.16.61 |
|	56	|	XGigabitEthernet1/0/7	|	ifInOctets.62	|	ifOutOctets.62	|	.1.3.6.1.2.1.2.2.1.10.62  |	.1.3.6.1.2.1.2.2.1.16.62 |
|	57	|	XGigabitEthernet1/0/8	|	ifInOctets.63	|	ifOutOctets.63	|	.1.3.6.1.2.1.2.2.1.10.63  |	.1.3.6.1.2.1.2.2.1.16.63 |
|	58	|	XGigabitEthernet1/0/9	|	ifInOctets.64	|	ifOutOctets.64	|	.1.3.6.1.2.1.2.2.1.10.64  |	.1.3.6.1.2.1.2.2.1.16.64 |
|	59	|	XGigabitEthernet1/0/10	|	ifInOctets.65	|	ifOutOctets.65	|	.1.3.6.1.2.1.2.2.1.10.65  |	.1.3.6.1.2.1.2.2.1.16.65 |
|	60	|	XGigabitEthernet1/0/11	|	ifInOctets.66	|	ifOutOctets.66	|	.1.3.6.1.2.1.2.2.1.10.66  |	.1.3.6.1.2.1.2.2.1.16.66 |
|	61	|	XGigabitEthernet1/0/12	|	ifInOctets.67	|	ifOutOctets.67	|	.1.3.6.1.2.1.2.2.1.10.67  |	.1.3.6.1.2.1.2.2.1.16.67 |
|	62	|	XGigabitEthernet1/0/13	|	ifInOctets.68	|	ifOutOctets.68	|	.1.3.6.1.2.1.2.2.1.10.68  |	.1.3.6.1.2.1.2.2.1.16.68 |
|	63	|	XGigabitEthernet1/0/14	|	ifInOctets.69	|	ifOutOctets.69	|	.1.3.6.1.2.1.2.2.1.10.69  |	.1.3.6.1.2.1.2.2.1.16.69 |
|	64	|	XGigabitEthernet1/0/15	|	ifInOctets.70	|	ifOutOctets.70	|	.1.3.6.1.2.1.2.2.1.10.70  |	.1.3.6.1.2.1.2.2.1.16.70 |
|	65	|	XGigabitEthernet1/0/16	|	ifInOctets.71	|	ifOutOctets.71	|	.1.3.6.1.2.1.2.2.1.10.71  |	.1.3.6.1.2.1.2.2.1.16.71 |
|	66	|	XGigabitEthernet1/0/17	|	ifInOctets.72	|	ifOutOctets.72	|	.1.3.6.1.2.1.2.2.1.10.72  |	.1.3.6.1.2.1.2.2.1.16.72 |
|	67	|	XGigabitEthernet1/0/18	|	ifInOctets.73	|	ifOutOctets.73	|	.1.3.6.1.2.1.2.2.1.10.73  |	.1.3.6.1.2.1.2.2.1.16.73 |
|	68	|	XGigabitEthernet1/0/19	|	ifInOctets.74	|	ifOutOctets.74	|	.1.3.6.1.2.1.2.2.1.10.74  |	.1.3.6.1.2.1.2.2.1.16.74 |
|	69	|	XGigabitEthernet1/0/20	|	ifInOctets.75	|	ifOutOctets.75	|	.1.3.6.1.2.1.2.2.1.10.75  |	.1.3.6.1.2.1.2.2.1.16.75 |
|	70	|	XGigabitEthernet1/0/21	|	ifInOctets.76	|	ifOutOctets.76	|	.1.3.6.1.2.1.2.2.1.10.76  |	.1.3.6.1.2.1.2.2.1.16.76 |
|	71	|	XGigabitEthernet1/0/22	|	ifInOctets.77	|	ifOutOctets.77	|	.1.3.6.1.2.1.2.2.1.10.77  |	.1.3.6.1.2.1.2.2.1.16.77 |
|	72	|	XGigabitEthernet1/0/23	|	ifInOctets.78	|	ifOutOctets.78	|	.1.3.6.1.2.1.2.2.1.10.78  |	.1.3.6.1.2.1.2.2.1.16.78 |
|	73	|	XGigabitEthernet1/0/24	|	ifInOctets.79	|	ifOutOctets.79	|	.1.3.6.1.2.1.2.2.1.10.79  |	.1.3.6.1.2.1.2.2.1.16.79 |
|	74	|	XGigabitEthernet1/0/25	|	ifInOctets.80	|	ifOutOctets.80	|	.1.3.6.1.2.1.2.2.1.10.80  |	.1.3.6.1.2.1.2.2.1.16.80 |
|	75	|	XGigabitEthernet1/0/26	|	ifInOctets.81	|	ifOutOctets.81	|	.1.3.6.1.2.1.2.2.1.10.81  |	.1.3.6.1.2.1.2.2.1.16.81 |
|	76	|	XGigabitEthernet1/0/27	|	ifInOctets.82	|	ifOutOctets.82	|	.1.3.6.1.2.1.2.2.1.10.82  |	.1.3.6.1.2.1.2.2.1.16.82 |
|	77	|	XGigabitEthernet1/0/28	|	ifInOctets.83	|	ifOutOctets.83	|	.1.3.6.1.2.1.2.2.1.10.83  |	.1.3.6.1.2.1.2.2.1.16.83 |
|	78	|	XGigabitEthernet1/0/29	|	ifInOctets.84	|	ifOutOctets.84	|	.1.3.6.1.2.1.2.2.1.10.84  |	.1.3.6.1.2.1.2.2.1.16.84 |
|	79	|	XGigabitEthernet1/0/30	|	ifInOctets.85	|	ifOutOctets.85	|	.1.3.6.1.2.1.2.2.1.10.85  |	.1.3.6.1.2.1.2.2.1.16.85 |
|	80	|	XGigabitEthernet1/0/31	|	ifInOctets.86	|	ifOutOctets.86	|	.1.3.6.1.2.1.2.2.1.10.86  |	.1.3.6.1.2.1.2.2.1.16.86 |
|	81	|	XGigabitEthernet1/0/32	|	ifInOctets.87	|	ifOutOctets.87	|	.1.3.6.1.2.1.2.2.1.10.87  |	.1.3.6.1.2.1.2.2.1.16.87 |
|	82	|	XGigabitEthernet1/0/33	|	ifInOctets.88	|	ifOutOctets.88	|	.1.3.6.1.2.1.2.2.1.10.88  |	.1.3.6.1.2.1.2.2.1.16.88 |
|	83	|	XGigabitEthernet1/0/34	|	ifInOctets.89	|	ifOutOctets.89	|	.1.3.6.1.2.1.2.2.1.10.89  |	.1.3.6.1.2.1.2.2.1.16.89 |
|	84	|	XGigabitEthernet1/0/35	|	ifInOctets.90	|	ifOutOctets.90	|	.1.3.6.1.2.1.2.2.1.10.90  |	.1.3.6.1.2.1.2.2.1.16.90 |
|	85	|	XGigabitEthernet1/0/36	|	ifInOctets.91	|	ifOutOctets.91	|	.1.3.6.1.2.1.2.2.1.10.91  |	.1.3.6.1.2.1.2.2.1.16.91 |
|	86	|	XGigabitEthernet1/0/37	|	ifInOctets.92	|	ifOutOctets.92	|	.1.3.6.1.2.1.2.2.1.10.92  |	.1.3.6.1.2.1.2.2.1.16.92 |
|	87	|	XGigabitEthernet1/0/38	|	ifInOctets.93	|	ifOutOctets.93	|	.1.3.6.1.2.1.2.2.1.10.93  |	.1.3.6.1.2.1.2.2.1.16.93 |
|	88	|	XGigabitEthernet1/0/39	|	ifInOctets.94	|	ifOutOctets.94	|	.1.3.6.1.2.1.2.2.1.10.94  |	.1.3.6.1.2.1.2.2.1.16.94 |

> 每部交换机对应的可能会略有差别，按正确的对应值修改即可。

 
