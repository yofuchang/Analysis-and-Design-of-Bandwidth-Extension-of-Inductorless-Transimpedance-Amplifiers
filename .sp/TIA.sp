* TIA
.lib 'C:\synopsys\rf018.l'tt

VVDD VDD gnd! 1.8v 

.subckt opa vin1 vin2 vout1 vout2
VVDD VDD gnd! 1.8v
MN5 nd5 ng5 gnd gnd nch L=0.5u W=1.5u m=2
Vng5 ng5 gnd 0.775v 

MN1 nd1 vin1 nd5 gnd nch L=0.5u W=30u          
RF1 ns3 vin1 0.001k

MN2 nd2 ng2 nd1 gnd nch L=0.5u W=4u
Vng2 ng2 gnd 1.5v

MN3 VDD nd2 ns3 gnd nch L=0.5u W=0.5u  

MN4 vout1 ns3 nd6 gnd nch L=0.5u W=30u

RL2 ns3 gnd 80k
RL1 VDD nd2 0.01k

MN7 nd7 vin2 nd5 gnd nch L=0.5u W=30u
RF2 ns9 vin2 0.001k

MN8 nd8 ng8 nd7 gnd nch L=0.5u W=4u
Vng8 ng8 gnd 1.5v

MN9 VDD nd8 ns9 gnd nch L=0.5u W=0.5u  
MN10 vout2 ns9 nd6 gnd nch L=0.5u W=30u
RL3 VDD nd8 0.01k
RL4 ns9 gnd 80k

MN6 nd6 ng6 gnd gnd nch L=0.5u W=1.5u m=2
Vng6 ng6 gnd 0.775v 
.ends



Iin1 vin1 gnd! ac=0.02mA 
C1 vin1 gnd 0.05p  
C2 vin2 gnd 0.05p 
Xopa1 vin1 vin2 vout1 vout2 opa


RB1 VDD vout1 25k
RB2 VDD vout2 25k
.probe AC I1(MN1) V(vin1) V(vin2) V(vout1) V(vout2) vdb(vout1) vdb(vout2)


.ac dec 1000 1 10g

.noise V(vin1)  Iin1 1000
.op
.option post acout=0
.MEAS ac gain max vdb(vout1,vin1)
.end