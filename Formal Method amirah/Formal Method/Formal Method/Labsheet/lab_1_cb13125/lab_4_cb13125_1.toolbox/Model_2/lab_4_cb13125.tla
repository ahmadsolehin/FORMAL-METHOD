--------------------------- MODULE lab_4_cb13125 ---------------------------
EXTENDS lab_1_cb13125

LSpec == HC /\ WF_hr(HCnxt)

AlwaysTick == []<><<HCnxt>>_hr

AllTimes ==\A n \in (1..12):[]<>(hr=n)

TypeInvariance ==[]HCini

-------------------------------------------------
THEOREM LSpec => AlwaysTick /\ AllTimes /\ TypeInvariance

=============================================================================
\* Modification History
\* Last modified Tue Apr 15 08:40:02 SGT 2014 by student
\* Created Tue Apr 15 08:19:46 SGT 2014 by student
