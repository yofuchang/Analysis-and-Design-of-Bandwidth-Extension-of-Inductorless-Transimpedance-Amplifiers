* CMOS
.lib 'C:\synopsys\rf018.l'tt

VVDD VDD gnd! 1.8v  

.subckt opa vin1 vin2 vout1 vout2
vvdd vdd gnd! 1.8v
mn5 nd5 ng5 gnd gnd nch l=0.5u w=0.5u  m=2  ***vnd5 nd5 gnd 0.3v 
vng5 ng5 gnd 0.7v 

mn1 nd1 vin1 nd5 gnd nch l=0.5u w=5.5u          ***vnd1 nd1 gnd 0.45v          
rf1 ns3 vin1 0.5k

mn2 nd2 ng2 nd1 gnd nch l=0.5u w=0.5u         ***vnd2 nd2 gnd 1.6v 
vng2 ng2 gnd 1.4v

mn3 vdd nd2 ns3  gnd nch l=5u w=0.5u  

mn4 vout1 ns3 nd6 gnd nch l=0.5u w=2.5u   ***vnd4 nd4 gnd 1.5v

rl2 ns3 gnd 1009k
rl1 vdd nd2 0.1k
*******************************

mn7 nd7 vin2 nd5 gnd nch l=0.5u w=5.5u          ***vnd1 nd1 gnd 0.45v 
rf2 ns9 vin2 0.5k

mn8 nd8 ng8 nd7 gnd nch l=0.5u w=0.5u  ***vnd2 nd2 gnd 1.6v
vng8 ng8 gnd 1.4v

mn9 vdd nd8 ns9  gnd nch l=5u w=0.5u  
mn10 vout2 ns9 nd6 gnd nch l=0.5u w=2.5u  ***vnd4 nd4 gnd 1.5v
rl3 vdd nd8 0.1k 
rl4 ns9 gnd 1009k

***************************************
mn6 nd6 ng6 gnd gnd nch l=0.5u w=0.5u m=2   ***vnd6 nd6 gnd 0.3v 
vng6 ng6 gnd 0.6v 
.ends
***************************************

iin1 vin1 gnd! ac=0.02ma
c1 vin1 gnd 0.25p  
c2 vin2 gnd 0.25p 
xopa1 vin1 vin2 vout1 vout2 opa
xopa2 vin1 vin2 vout1 vout2 opa
xopa3 vin1 vin2 vout1 vout2 opa

rb1 vdd vout1  59.523k
rb2 vdd vout2  59.523k

.probe AC V(vin1) V(vin2) V(vout1) V(vout2)

.ac dec 1000 1 10g
.noise V(vout1,vout2) V(vin1,vin2) dec 1000 1 10g

.op
.option post

.measure TRAN AVG_POWER AVG I(VVDD)*V(VDD) FROM=0 TO=1n
.measure TRAN TOTAL_POWER INTEG I(VVDD)*V(VDD) FROM=0 TO=1n

.end


