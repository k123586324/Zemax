surface=5   #surface number
step=32  #sampling
wave=1   #wavelength number
field=1 #0=0.0F 1=1.0F

RAYTRACE 0, field, 0, 0, wave
center = OPTH(surface)

#RAYTRACE 0, field, 0, 0, wave
#center = OPTH(surface)
#FOR i, 1, step, 1
#RAYTRACE 0, field, 0, ((i-1)/step-1), wave
#yf = RAYY(surface)
#answer = (OPTH(surface)-center)/(WAVL(wave)/1000)
#FORMAT 10.10
#print answer,",",yf,",",((i-1)/step-1)
#NEXT
#FOR i, 1, (step+1), 1
#RAYTRACE 0, field, 0, (i-1)/step, wave
#yf = RAYY(surface)
#answer = (OPTH(surface)-center)/(WAVL(wave)/1000)
#FORMAT 10.10
#print answer,",",yf,",",(i-1)/step
#NEXT

FOR x, 1,step, 1
   FOR i, (step+1),1, -1      
      RAYTRACE 0, field, ((x-1)/step-1), ((i-1)/step), wave
      xf = RAYX(surface)
      yf = RAYY(surface)
      semi_r=MAGN((x-1)/step-1,(i-1)/steP)
      IF (semi_r<=1)
         answer = (OPTH(surface)-center)/(WAVL(wave)/1000)
      ELSE
         answer=0       
      ENDIF
      FORMAT 10.10
      print answer,",",xf,",",yf,",",((x-1)/step-1),",",((i-1)/step)
   NEXT

   FOR i, step, 1, -1      
      RAYTRACE 0, field, ((x-1)/step-1), ((i-1)/step-1), wave
      xf = RAYX(surface)
      yf = RAYY(surface)
      semi_r=MAGN((x-1)/step-1,(i-1)/step-1)
      IF (semi_r<=1)
         answer = (OPTH(surface)-center)/(WAVL(wave)/1000)
      ELSE
         answer=0
      ENDIF
      FORMAT 10.10
      print answer,",",xf,",",yf,",",((x-1)/step-1),",",((i-1)/step-1)
   NEXT
NEXT

FOR x, 1,(step+1), 1
   FOR i, (step+1),1, -1      
      RAYTRACE 0, field, ((x-1)/step), ((i-1)/step), wave
      xf = RAYX(surface)
      yf = RAYY(surface)  
      semi_r=MAGN((x-1)/step,(i-1)/step)
      IF (semi_r<=1)
         answer = (OPTH(surface)-center)/(WAVL(wave)/1000)
      ELSE
         answer=0
      ENDIF
      FORMAT 10.10
      print answer,",",xf,",",yf,",",((x-1)/step),",",(i-1)/step
   NEXT

   FOR i, step, 1, -1      
      RAYTRACE 0, field, ((x-1)/step), ((i-1)/step-1), wave
      xf = RAYX(surface)
      yf = RAYY(surface)
      semi_r=MAGN((x-1)/step,(i-1)/step-1)
      IF (semi_r<=1)
         answer = (OPTH(surface)-center)/(WAVL(wave)/1000)
      ELSE
         answer=0
      ENDIF
      FORMAT 10.10
      print answer,",",xf,",",yf,",",((x-1)/step),",",((i-1)/step-1)
   NEXT
NEXT
