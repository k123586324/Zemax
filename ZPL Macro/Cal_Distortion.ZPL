surface=NSUR()   #surface number
step=32  #sampling
wave=PWAV()   #wavelength number

#DELETEMFO ALL
#UPDATE ALL
#INSERTMFO
#SETOPERAND 1, 11, "RAID"
#SETOPERAND 2,3,PWAV()
FOR i, 1,(step+1), 1  
hy=((i-1)/step)
RAYTRACE 0, hy, 0, 0, wave
yf = RAYY(surface)
RAYTRACE 0, hy, 0, 0, wave
C = OCOD("RAID")
ya = OPEV(C,1,wave, 0, hy, 0, 0)
#ya = (ASIN(RAYM(1)))*180/(2*ACOS(0))
#SETOPERAND 2,5,hy
#UPDATE ALL
#ya=OPER(2, 10)
FORMAT 10.10
print hy,",",ya,",",yf
NEXT
#DELETEMFO ALL
#UPDATE ALL


