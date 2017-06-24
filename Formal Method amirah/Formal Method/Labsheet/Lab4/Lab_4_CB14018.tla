--------------------------- MODULE Lab_4_CB14018 ---------------------------
EXTENDS Lab_2_CB14018
(*Conjoin the specification HC with the Week Fairness condition*)
LSpec == HC2 /\ WF_hr(HCnxt)

(*Define some Liveness and Fairness properties that LSpec satisfies.*)
(*Asserts that infinitely many <<HCnxt>>_hr steps occur.*)
AlwaysTick == []<><<HCnxt2>>_hr

(*Asserts that, for each time n in 1..12, hr infinitely often equals n.*)
AllTimes == \A n\in (1..12):[]<>(hr = n)

TypeInvariance == []HCini
(*The temporal formula asserting that HCini is always true.*)
(*It is stated in this way to show another way of telling TLC to check an invariant.*)

New == (hr = 2) => (hr = 2)(*True Result*)
New1 == (hr = 1) => []<>(hr = 2)(*True Result*)
New2 == (hr = 1) => <>[](hr = 2)(*False Result*)
New3 == (hr = 1) => [](hr = 2)(*False Result*)

HCini2 == hr \in (1..12)
New4 == []((hr = 1) => [](hr>2))
\*[](New5 <hr = 1> => []<hr>2>)

=============================================================================

(*LSpec- is a liveness specification, combining 3 temporal properties*)
THEOREM LSpec => AlwaysTick /\ AllTimes /\ TypeInvariance /\ New /\ New1 /\ New2 /\ New3 /\ New4

\*Q5= It will appear that invariant HCini is violated. This is because HCini have 11 steps for hr not 10
\*Q7= No it is not true statement because property new is violated by the initial state: hr = 1 
\*Q8= When the value of hr eventually have value 2 it will do not have error and it same from before
\*Q8.1= When hr is equal to 1 it always have value 2 because the actual value of hr is 2 not 1
\*Q8.2= Yes the property of infinitely often true because if we add new property it will always true and only sometimes it error
\*Q8.3= Yes the property of eventually often true because it will always become true and no error will occur
\*Q10= It show that when hr equal to 1 but it actually implies hr have a value of more than 2

\* Modification History
\* Last modified Wed Nov 04 00:45:33 SGT 2015 by User
\* Last modified Tue Oct 27 09:58:38 SGT 2015 by fskkpump
\* Created Tue Oct 27 08:23:19 SGT 2015 by fskkpump
