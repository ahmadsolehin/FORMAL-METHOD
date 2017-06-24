------------------------------ MODULE cb12042 ------------------------------
EXTENDS Naturals, Sequences, TLC
VARIABLE Buf

Init == /\ Buf = <<>>

In ==  /\ Buf' = Append (Buf, <<1>>)
       /\ Len (Buf) < 3
       /\ Print (<<"In", Buf>>,TRUE)
     
Out == /\ Buf # <<>> 
        /\Buf' = Tail(Buf) 
       /\ Print (<<"Out", Buf>>,TRUE)
       
Next == In \/ Out
HC == /\ Init /\ [] [Next]_<<Buf>>
--------------------------------------------------- 
THEOREM HC => []Init

=============================================================================
\* Modification History
\* Last modified Tue Apr 01 09:55:36 SGT 2014 by student
\* Created Tue Apr 01 08:12:14 SGT 2014 by student
