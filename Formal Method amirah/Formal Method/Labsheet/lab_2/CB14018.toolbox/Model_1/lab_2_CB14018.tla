--------------------------- MODULE lab_2_CB14018 ---------------------------
EXTENDS Naturals
VARIABLE hr
HCini == hr \in (1 .. 11)
\*HCnxt == hr' = IF hr < 11 THEN hr + 1 ELSE 1
\*HC == HCini /\ [][HCnxt]_hr
\*THEOREM HC => []HCini
=============================================================================
\* Modification History
\* Last modified Tue Oct 13 09:55:54 SGT 2015 by fskkpump
\* Created Tue Oct 13 08:50:06 SGT 2015 by fskkpump

Inv == hr >= 1 /\ hr <= 12
HC == Inv /\ HCini /\ [] [HCnxt]_hr
THEOREM HC => []HCini /\ Inv
HCnxt3 ==  /\ hr < 12
          /\ hr' = hr+1