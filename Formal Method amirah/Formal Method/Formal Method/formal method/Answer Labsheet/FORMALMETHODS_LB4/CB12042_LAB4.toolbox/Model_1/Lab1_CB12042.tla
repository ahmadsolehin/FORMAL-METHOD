---------------------------- MODULE Lab1_CB12042 ----------------------------

EXTENDS Naturals
VARIABLE hr,min
HCini == /\ hr\in (1..12) \* hour declaration
         /\ min \in(1..60)\* minute declaration
HCnxt == /\hr'= IF hr # 12 THEN hr + 1 ELSE 1 \* process hour
         /\ min' = IF min # 60 THEN min + 1 ELSE 1 \* process minute
HC == HCini /\ [][HCnxt]_<<hr,min>> \*combination hours and minute
HCnxt2 == /\hr' = (hr%12) + 1 \*modules operation hour
          /\hr' = (hr%60) + 1\*modules operation minute
HC2 == HCini/\ [] [HCnxt2]_<<hr,min>> \*combination hours and minute
-----------------------------------------------------------------------------
THEOREM HC => HCini
=============================================================================



\* Modification History
\* Last modified Tue Mar 18 09:50:04 SGT 2014 by student
\* Created Tue Mar 18 08:27:26 SGT 2014 by student
