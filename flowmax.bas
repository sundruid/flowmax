CLS
LOCATE 9, 29
PRINT "FLOWMAX  v2.5 1994"
LOCATE 10, 17
PRINT "Flowrate Calculator for Volumeter Calculations"
LOCATE 11, 22
PRINT "Ken Webster"
FOR X = 1 TO 20000
NEXT X
       
'Data entry for calculations

CLS
PRINT
PRINT

15 :

PRINT
PRINT
PRINT
PRINT
INPUT "BAROMETRIC PRESSURE in mm of Hg  >", HB
PRINT
INPUT "MANOMETER PRESSURE in inches W.C.  >", HV
PRINT
INPUT "GAS TEMPERATURE in degrees Celsius  >", TA
PRINT
INPUT "TEMPERATURE AT REFERENCE STANDARD CONDITIONS (0 or 21.1 Celsius)  >", TS
PRINT
INPUT "COLLECTED VOLUME SETPOINT in cc  >", CV
PRINT
INPUT "CONVERSION FACTOR  >", CF
PRINT

Flowrate:

INPUT "MAXIMUM EXPECTED FLOW RATE @ 100% (cc)  >", FR
IF FR = 0 THEN GOTO Flowrate
PRINT
INPUT "SETPOINT IN %  >", SP

'formula for K calculations

K = ((TS + 273.15) / (TA + 273.15)) * ((HB + (HV * 1.865)) / 760)
CLS
PRINT
PRINT TAB(30); "K="; K
PRINT
PRINT

110 :

INPUT "ELAPSED TIME  >", T
IF T = 0 GOTO 110
PRINT

a = CV / (T * 60) * 60 * K * CF        'Formula for Flow Calculations
IF SP = 0 THEN GOTO datascreen
SSP = (SP / 100) * FR
er = (((SSP - a) / FR) * 100) * -1      'Error calculations

datascreen:

CLS
PRINT
PRINT "K="; K; TAB(20); "Elapsed Time="; T; TAB(50); "Flow Rate, cc/m="; a
PRINT
PRINT TAB(51); "Last Flow Rate="; z
PRINT
PRINT USING "                                                         % Error= ###.##"; er
PRINT
PRINT "                                                        Setpoint= "; SP; " %"
PRINT
PRINT "                                                   Max Flow Rate= "; FR; " cc"
PRINT
       
        z = a                           'Remember last flow run
     
PRINT
PRINT
PRINT
PRINT TAB(22); HB; " Hg"; TAB(42); HV; " Manometer"
PRINT
PRINT TAB(22); TA; " øC (gas)"; TAB(42); CF; " CF"
PRINT
PRINT TAB(22); TS; " øC Ref"; TAB(42); CV; " cc"

LOCATE 23, 10

PRINT "To make CHANGES press 1, to EXIT press 2, REPEAT press Enter"
INPUT "              To change SETPOINT, press 3;  MAX FLOW, press 4   >", a

CLS
       
selection:

IF a = 1 THEN GOTO 15
IF a = 2 THEN GOTO 160
IF a = 0 THEN GOTO 110
IF a = 3 THEN GOTO setpoint
IF a = 4 THEN GOTO maxflow
       
        'mini subroutines

setpoint:

PRINT "Setpoint in %";
INPUT SP
GOTO datascreen

maxflow:
PRINT "Max Flow Rate in cc";
INPUT FR
GOTO datascreen

160     END

