--------------------------- MODULE Lab_2_CB14018 ---------------------------
EXTENDS Naturals
VARIABLE hr
HCini == hr \in (1..11)

\*HCnxt == hr' = IF hr # 11 THEN hr + 1 ELSE 1
\* HC == HCini /\ [] [HCnxt]_hr

\* Number of states found is 24, 2 times greater than number of distinct states(12). 
\* The number are different(22, 11) from the past but same result which is states found is 2 times greater than distinct states.

HCnxt2 == hr' = (hr % 12) + 1
HC2 == HCini /\ [][HCnxt2]_hr
\* Yes,it changes and both result is zero.

Inv == hr >= 1 /\ hr <=12

\*THEOREM HC2 => []HCini
\*THEOREM HC2 => []HCini /\ Inv

HCnxt3 == /\ hr < 12 
          /\ hr' = hr+1
          
\*THEOREM HC2 => [] HCini
THEOREM HC2 => [] HCini /\ Inv

\*for question 21, I change ("HCnxt2 == hr' = (hr % 13) + 1") and current status states that it is not running and have 1 error in model checking result.

=============================================================================
\* Modification History
\* Last modified Wed Oct 14 19:15:47 SGT 2015 by User
\* Created Wed Oct 14 19:14:45 SGT 2015 by User
