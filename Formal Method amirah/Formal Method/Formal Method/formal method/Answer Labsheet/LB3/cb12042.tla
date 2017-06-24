------------------------------ MODULE cb12042 ------------------------------
EXTENDS Naturals, Sequences, TLC
VARIABLE Buf

Init == /\ Buf = <<>> \* Initial value

In ==  /\ Buf' = Append (Buf, <<1>>) \* The value is enter
       /\ Len (Buf) < 3
       /\ Print (<<"In", Buf>>,TRUE) \* The value is print
     
Out == /\ Buf # <<>> \* The value is out
        /\Buf' = Tail(Buf) 
       /\ Print (<<"Out", Buf>>,TRUE) \* The value is print
       
Next == In \/ Out \*Display both in and out
HC == /\ Init /\ [] [Next]_<<Buf>>
--------------------------------------------------- 
THEOREM HC => []Init

=============================================================================
\* Modification History
\* Last modified Tue Apr 01 09:59:27 SGT 2014 by student
\* Created Tue Apr 01 08:12:14 SGT 2014 by student
