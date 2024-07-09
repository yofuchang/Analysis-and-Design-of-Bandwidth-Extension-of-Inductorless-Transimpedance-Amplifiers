* CMOS
.lib 'C:\synopsys\rf018.l'tt

VVDD VDD gnd! 1.8v 

.subckt opa vin1 vin2 vout1 vout2
VVDD VDD gnd! 1.8v
MN5 nd5 ng5 gnd gnd nch L=0.5u W=0.5u  m=2  ***Vnd5 nd5 gnd 0.3v 
Vng5 ng5 gnd 0.7v 

MN1 nd1 vin1 nd5 gnd nch L=0.5u W=5.5u          ***Vnd1 nd1 gnd 0.45v          
RF1 ns3 vin1 0.5k

MN2 nd2 ng2 nd1 gnd nch L=0.5u W=0.5u         ***Vnd2 nd2 gnd 1.6v 
Vng2 ng2 gnd 1.4v

MN3 VDD nd2 ns3  gnd nch L=5u W=0.5u  

MN4 vout1 ns3 nd6 gnd nch L=0.5u W=2.5u   ***Vnd4 nd4 gnd 1.5v

RL2 ns3 gnd 1009k
RL1 VDD nd2 0.1k
*******************************

MN7 nd7 vin2 nd5 gnd nch L=0.5u W=5.5u          ***Vnd1 nd1 gnd 0.45v 
RF2 ns9 vin2 0.5k

MN8 nd8 ng8 nd7 gnd nch L=0.5u W=0.5u  ***Vnd2 nd2 gnd 1.6v
Vng8 ng8 gnd 1.4v

MN9 VDD nd8 ns9  gnd nch L=5u W=0.5u  
MN10 vout2 ns9 nd6 gnd nch L=0.5u W=2.5u  ***Vnd4 nd4 gnd 1.5v
RL3 VDD nd8 0.1k 
RL4 ns9 gnd 1009k

***************************************
MN6 nd6 ng6 gnd gnd nch L=0.5u W=0.5u m=2   ***Vnd6 nd6 gnd 0.3v 
Vng6 ng6 gnd 0.6v 
.ends
***************************************


Iin1 vin1 gnd!  ac=0.02mA 
C1 vin1 gnd 0.25p  
C2 vin2 gnd 0.25p 
Xopa1 vin1 vin2 vout1 vout2 opa
Xopa2 vin1 vin2 vout1 vout2 opa
Xopa3 vin1 vin2 vout1 vout2 opa



RB1 VDD vout1  59.523k
RB2 VDD vout2  59.523k

.dc vout1 0.5u 10u 0.1u
.dc vout2 0.5u 10u 0.1u
.dc vout3 0.5u 10u 0.1u
.probe AC I1(MN1) V(<vin1> <vin2> <vout1> <vout2> ) vdb(vout1) vdb(vout2) vdb(vout3)
.ac dec 1000 1 10g
.op
.option post

* Measure average power consumption
.measure TRAN AVG_POWER AVG I(VVDD)*V(VDD) FROM=0 TO=1n
.measure TRAN TOTAL_POWER INTEG I(VVDD)*V(VDD) FROM=0 TO=1n

.end

