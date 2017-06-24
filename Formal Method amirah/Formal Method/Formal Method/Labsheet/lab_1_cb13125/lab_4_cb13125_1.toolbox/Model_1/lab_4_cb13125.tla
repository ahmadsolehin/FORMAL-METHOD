--------------------------- MODULE lab_4_cb13125 ---------------------------
EXTENDS lab_1_cb13125

LSpec == HC /\ WF_hr(HCnxt)

AlwaysTick == []<><<HCnxt>>_hr

AllTimes ==\A n \in(1..12):[]<>(hr=n)
New == (hr = 1) => <>(hr = 2) (*true resuly*)
New1 == (hr = 1) => []<>(hr = 2) (*true result*)
New2 == (hr = 1) => <>[](hr = 2) (*false result*)
New3 == (hr = 1) => [](hr = 2) (*false result*)

TypeInvariance ==[]HCini

-------------------------------------------------
THEOREM LSpec => AlwaysTick /\ AllTimes /\ TypeInvariance /\ New /\ New1 /\ New2 /\ New3

=============================================================================
\* Modification History
\* Last modified Tue Apr 15 10:04:08 SGT 2014 by student
\* Created Tue Apr 15 08:19:46 SGT 2014 by student
