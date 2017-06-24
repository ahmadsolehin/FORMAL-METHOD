---------------------------- MODULE Lab1_CB12042 ----------------------------

EXTENDS Naturals
VARIABLE hr,min
HCini == /\ hr\in (1..12)
         /\ min \in(1..60)
HCnxt == /\hr'= IF hr # 12 THEN hr + 1 ELSE 1 
         /\ min' = IF min # 60 THEN min + 1 ELSE 1
HC == HCini /\ [][HCnxt]_<<hr,min>>
HCnxt2 == /\hr' = (hr%12) + 1
            /\hr' = (hr%60) + 1
HC2 == HCini/\ [] [HCnxt2]_<<hr,min>>
-----------------------------------------------------------------------------
THEOREM HC => HCini
=============================================================================



\* Modification History
\* Last modified Tue Mar 18 09:35:47 SGT 2014 by student
\* Created Tue Mar 18 08:27:26 SGT 2014 by student
