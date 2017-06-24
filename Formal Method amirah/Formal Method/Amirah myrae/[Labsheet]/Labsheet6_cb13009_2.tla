------------------------ MODULE Labsheet6_cb13009_2 ------------------------
EXTENDS Naturals, Sequences, TLC
VARIABLE Buf

Init == /\ Buf = << >>

\*The In Statement is included Buf that have append buf is equal to 1.
\*Moreover the length of buf is less than 10.
\*to check the In statment we put print so that is always true to show the buff is less than 10.

In == 
     \* /\(Len(Buf)=1 \/ Len (Buf) < 10)
       /\ Buf' = Append (Buf,<< 1 >>)
       /\ Len(Buf) < 10
        /\ Print(<<"In",Buf>>,TRUE)

\*The out stametnt is tho show that the buf is not equal to the sequences.
\*Then the buf' is equal to tail that contains the value of buf.
\*therefore the result always the show the value of buff tail.

Out == /\ Buf # << >>
       /\ Buf'= Tail(Buf)
       /\ Print(<<"Out",Buf>>,TRUE)

Next == In \/ Out

Spec == Init /\ [][Next]_<<Buf>>
LSpec == [] <> (Len(Buf)=0 \/ Len (Buf) = 10)
\*Specification of a bounded FIFO was Buffer is eventuallly often full or 
\*eventually often empty

----------------------------------------------------------------------------
THEOREM Spec => [][Init]_Buf

=============================================================================
\* Modification History
\* Last modified Tue Nov 18 09:54:37 SGT 2014 by FSK 10B
\* Created Tue Nov 18 08:52:13 SGT 2014 by FSK 10B
