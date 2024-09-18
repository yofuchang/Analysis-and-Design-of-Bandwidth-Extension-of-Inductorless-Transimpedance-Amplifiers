* TIA
.lib 'C:\synopsys\rf018.l'tt
VVDD VDD gnd! 1.8v 


.subckt opa vin1 vin2 vout1 vout2

VVDD VDD gnd! 1.8v 
MN5 nd5 ng5 gnd gnd nch L=0.2u W=4u m=2
Vng5 ng5 gnd 0.74v

MN1 nd1 vin1 nd5 gnd nch L=0.2u W=40u 
MN2 nd2 ng2 nd1 gnd nch L=0.2u W=40u
Vng2 ng2 gnd 1.7v
RL1 VDD nd2 0.1k
MN3 VDD nd2 ns3 gnd nch L=0.2u W=0.5u
RL2 ns3 gnd 325k
Rf1 vin1 ns3 0.5k
MN4 vout1 ns3 nd6 gnd nch L=0.2u W=30u




MN7 nd7 vin2 nd5 gnd nch L=0.2u W=40u 
MN8 nd8 ng8 nd7 gnd nch L=0.2u W=40u
Vng8 ng8 gnd 1.7v
RL3 VDD nd8 0.1k
MN9 VDD nd8 ns9 gnd nch L=0.2u W=0.5u
RL4 ns9 gnd 325k
Rf2 ns9 vin2 0.5k
MN10 vout2 ns9 nd6 gnd nch L=0.2u W=30u


MN6 nd6 ng6 gnd gnd nch L=0.2u W=4u m=2
Vng6 ng6 gnd 0.72v 
.ends

**********************************************************

.subckt opaB vout1 vout2 V1 V2
VVDD VDD gnd! 1.8v 
MN5 nd5 ng5 gnd gnd nch L=0.5u W=10u m=2
Vng5 ng5 gnd 0.65v

MN1 nd1 vout1 nd5 gnd nch L=0.5u W=40u 
MN2 nd2 ng2 nd1 gnd nch L=0.5u W=10u
Vng2 ng2 gnd 1.5v
RL1 VDD nd2 0.1k
MN3 VDD nd2 ns3 gnd nch L=0.5u W=2u
RL2 ns3 gnd  10k
Rf1 vout1 ns3 0.1k
MN4 V1 ns3 nd6 gnd nch L=0.5u W=100u




MN7 nd7 vout2 nd5 gnd nch L=0.5u W=10u 
MN8 nd8 ng8 nd7 gnd nch L=0.5u W=2u
Vng8 ng8 gnd 1.75v
RL3 VDD nd8 1k
MN9 VDD nd8 ns9 gnd nch L=0.5u W=0.5u
RL4 ns9 gnd  50k
Rf2 vout2 ns9 0.1k
MN10 V2 ns9 nd6 gnd nch L=0.5u W=70u


MN6 nd6 ng6 gnd gnd nch L=0.5u W=20u m=2
Vng6 ng6 gnd 0.65v 


.ends



**********************************************************


Iin1 vin1 gnd! ac=0.02mA 
C1 vin1 gnd 0.01p  
C2 vin2 gnd 0.01p 
Xopa1 vin1 vin2 vout1 vout2 opa
XopaB1 vout1 vout2 V1 V2 opaB

RB1 VDD vout1 5k
RB2 VDD vout2 5k

RL5 VDD V1 5K
RL6 VDD V2 5K

.probe AC I1(MN1) V(vin1) V(vin2) V(vout1) V(vout2) vdb(vout1) vdb(vout2)
*****.noise V(vin1)  Iin1 1000
.MEAS ac gain max vdb(V1,vin1)

.option post acout=0

.ac dec 1000 1 10g

.op
.end