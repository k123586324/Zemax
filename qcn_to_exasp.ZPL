DECLARE CF_array,DOUBLE,2,14,14
# n=0
CF_array(1,1) = 1
# n=1
CF_array(2,1) = -5
CF_array(2,2) = 6
# n=2
CF_array(3,1) = 15
CF_array(3,2) = -42
CF_array(3,3) = 28
# n=3
CF_array(4,1) = -35
CF_array(4,2) = 168
CF_array(4,3) = -252
CF_array(4,4) = 120
# n=4
CF_array(5,1) = 70
CF_array(5,2) = -504
CF_array(5,3) = 1260
CF_array(5,4) = -1320
CF_array(5,5) = 495
# n=5
CF_array(6,1) = -126
CF_array(6,2) = 1260
CF_array(6,3) = -4620
CF_array(6,4) = 7920
CF_array(6,5) = -6435
CF_array(6,6) = 2002
# n=6
CF_array(7,1) = 210
CF_array(7,2) = -2772
CF_array(7,3) = 13860
CF_array(7,4) = -34320
CF_array(7,5) = 45045
CF_array(7,6) = -30030
CF_array(7,7) = 8008
# n=7
CF_array(8,1) = -330
CF_array(8,2) = 5544
CF_array(8,3) = -36036
CF_array(8,4) = 120120
CF_array(8,5) = -225225
CF_array(8,6) = 240240
CF_array(8,7) = -136136
CF_array(8,8) = 31824
# n=8
CF_array(9,1) = 495
CF_array(9,2) = -10296
CF_array(9,3) = 84084
CF_array(9,4) = -360360
CF_array(9,5) = 900900
CF_array(9,6) = -1361360
CF_array(9,7) = 1225224
CF_array(9,8) = -604656
CF_array(9,9) = 125970
# n=9
CF_array(10,1) = -715
CF_array(10,2) = 18018
CF_array(10,3) = -180180
CF_array(10,4) = 960960
CF_array(10,5) = -3063060
CF_array(10,6) = 6126120
CF_array(10,7) = -7759752
CF_array(10,8) = 6046560
CF_array(10,9) = -2645370
CF_array(10,10) = 497420
# n=10
CF_array(11,1) = 1001
CF_array(11,2) = -30030
CF_array(11,3) = 360360
CF_array(11,4) = -2333760
CF_array(11,5) = 9189180
CF_array(11,6) = -23279256
CF_array(11,7) = 38798760
CF_array(11,8) = -42325920
CF_array(11,9) = 29099070
CF_array(11,10) = -11440660
CF_array(11,11) = 1961256
# n=11
CF_array(12,1) = -1365
CF_array(12,2) = 48048
CF_array(12,3) = -680680
CF_array(12,4) = 5250960
CF_array(12,5) = -24942060
CF_array(12,6) = 77597520
CF_array(12,7) = -162954792
CF_array(12,8) = 232792560
CF_array(12,9) = -223092870
CF_array(12,10) = 137287920
CF_array(12,11) = -49031400
CF_array(12,12) = 7726160
# n=12
CF_array(13,1) = 1820
CF_array(13,2) = -74256
CF_array(13,3) = 1225224
CF_array(13,4) = -11085360
CF_array(13,5) = 62355150
CF_array(13,6) = -232792560
CF_array(13,7) = 597500904
CF_array(13,8) = -1070845776
CF_array(13,9) = 1338557220
CF_array(13,10) = -1144066000
CF_array(13,11) = 637408200
CF_array(13,12) = -208606320
CF_array(13,13) = 30421755
# n=13
CF_array(14,1) = -2380
CF_array(14,2) = 111384
CF_array(14,3) = -2116296
CF_array(14,4) = 22170720
CF_array(14,5) = -145495350
CF_array(14,6) = 640179540
CF_array(14,7) = -1963217256
CF_array(14,8) = 4283383104
CF_array(14,9) = -6692786100
CF_array(14,10) = 7436429000
CF_array(14,11) = -5736673800
CF_array(14,12) = 2920488480
CF_array(14,13) = -882230895
CF_array(14,14) = 119759850

DECLARE qcn_array,DOUBLE,1,15
DECLARE exasp_array,DOUBLE,1,15
n = NSUR()
FOR I = 0, n, 1
dummy = SPRO(I,0) 
K$ = $buffer()
IF K$ $== "QED_TYPE"

FOR y = 1, 15, 1
qcn_array(y)=SPRX(I,10,y+14)
NEXT

exasp_array(1)=qcn_array(1)

FOR k = 2, 15, 1
exasp_array(k)=0
FOR l = 2, 15, 1
exasp_array(k)=exasp_array(k)+qcn_array(l)*CF_array(l-1,k-1)
NEXT
NEXT

SURP I,0,"XASPHERE"
SURP I,10,15,13
SURP I,10,exasp_array(1),14
SURP I,10,0,15
FOR m = 16, 29, 1
SURP I,10,exasp_array(m-14),m
NEXT

ENDIF
NEXT
