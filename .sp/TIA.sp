* TIA
.lib 'C:\synopsys\rf018.l'tt

VVDD VDD gnd! 1.8v 

.subckt opa vin1 vin2 vout1 vout2
VVDD VDD gnd! 1.8v
MN5 nd5 ng5 gnd gnd nch L=0.5u W=2u m=2
Vng5 ng5 gnd 0.55v 

MN1 nd1 vin1 nd5 gnd nch L=0.5u W=1u          
RF1 ns3 vin1 0.5k

MN2 nd2 ng2 nd1 gnd nch L=0.5u W=3.5u
Vng2 ng2 gnd 1.5v

MN3 VDD nd2 ns3 gnd nch L=0.5u W=0.5u  

MN4 vout1 ns3 nd6 gnd nch L=0.5u W=1u

RL2 ns3 gnd 30k
RL1 VDD nd2 0.0001k

MN7 nd7 vin2 nd5 gnd nch L=0.5u W=1u
RF2 ns9 vin2 0.5k

MN8 nd8 ng8 nd7 gnd nch L=0.5u W=3.5u
Vng8 ng8 gnd 1.5v

MN9 VDD nd8 ns9 gnd nch L=0.5u W=0.5u  
MN10 vout2 ns9 nd6 gnd nch L=0.5u W=1u
RL3 VDD nd8 0.0001k
RL4 ns9 gnd 30k

MN6 nd6 ng6 gnd gnd nch L=0.5u W=1u m=2
Vng6 ng6 gnd 0.6v 
.ends
**************************************
.subckt opaB vout1 vout2 V1 V2
VVDD VDD gnd! 1.8v
MN5 nd5 ng5 gnd gnd nch L=0.5u W=2u m=2
Vng5 ng5 gnd 0.55v 

MN1 nd1 vout1 nd5 gnd nch L=0.5u W=1u          
RF1 ns3 vout1 0.1k

MN2 nd2 ng2 nd1 gnd nch L=0.5u W=3.5u
Vng2 ng2 gnd 1.5v

MN3 VDD nd2 ns3 gnd nch L=0.5u W=0.5u  

MN4 V1 ns3 nd6 gnd nch L=0.5u W=1u

RL2 ns3 gnd 30k
RL1 VDD nd2 0.01k

MN7 nd7 vout2 nd5 gnd nch L=0.5u W=1u
RF2 ns9 vout2 0.1k

MN8 nd8 ng8 nd7 gnd nch L=0.5u W=3.5u
Vng8 ng8 gnd 1.5v

MN9 VDD nd8 ns9 gnd nch L=0.5u W=0.5u  
MN10 V2 ns9 nd6 gnd nch L=0.5u W=1u
RL3 VDD nd8 0.01k
RL4 ns9 gnd 30k

MN6 nd6 ng6 gnd gnd nch L=0.5u W=1u m=2
Vng6 ng6 gnd 0.55v 
.ends
******************************************************
Iin1 vin1 gnd! ac=0.02mA 
C1 vin1 gnd 0.009p  
C2 vin2 gnd 0.009p 
Xopa1 vin1 vin2 vout1 vout2 opa
Xopa2 vin1 vin2 vout1 vout2 opa
Xopa3 vin1 vin2 vout1 vout2 opa
Xopa4 vin1 vin2 vout1 vout2 opa
XopaB1 vout1 vout2 V1 V2 opaB

RB1 VDD vout1 100k
RB2 VDD vout2 100k

RL5 VDD V1 50K                       ***180.90.62.5.50
RL6 VDD V2 50K

.probe AC I1(MN1) V(vin1) V(vin2) V(vout1) V(vout2) vdb(vout1) vdb(vout2)
.probe dc i(MN1)
.ac dec 1000 1 10g
.MEAS ac gain max vdb(V1,vin1)
***.noise V(vin1)  Iin1 1000
.op
.option post
.end