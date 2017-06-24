------------------------------ MODULE Project2 ------------------------------

EXTENDS Naturals, Sequences, TLC

CONSTANTS Producers, Consumers, BufferSize, Data 

ASSUME /\ Producers # {}                     
       /\ Consumers # {}                      
       /\ Producers \intersect Consumers = {} 
       /\ BufferSize > 0                     
       /\ Data # {}                           

-------------------------------------------------
VARIABLE buffer, waitingThreads

Participants == Producers \union Consumers

RunningThreads == Participants \ waitingThreads

TypeInvariant == /\ buffer \in Seq(Data)
                 /\ Len(buffer) \in (0..BufferSize)
                 /\ waitingThreads \subseteq Participants
           
Notify == IF waitingThreads # {} THEN (\E x \in waitingThreads : waitingThreads' = waitingThreads \ {x} ) ELSE UNCHANGED waitingThreads
          

Wait(t) == waitingThreads' = waitingThreads \union {t}

----------------------------------------------------

Init ==  buffer = << >> /\ waitingThreads = {}

Put(t,m) == IF Len(buffer) < BufferSize THEN /\ buffer' = Append(buffer, m) /\ Notify  
            ELSE /\ Wait(t) /\ UNCHANGED buffer 
            
Get(t) == IF Len(buffer) > 0 THEN /\ buffer' = Tail(buffer) /\ Notify 
          ELSE /\ Wait(t) /\ UNCHANGED buffer
          
Next == \E t \in RunningThreads : \/ (t \in Producers /\ \E m \in Data : Put(t, m) /\ Print(<<"Put", buffer, waitingThreads>>,TRUE) ) \/ (t \in Consumers  /\ Get(t) /\ Print(<<"GET", buffer, waitingThreads>>,TRUE) )

Prog == Init /\ [][Next]_<<buffer, waitingThreads>>

-------------------------------------------------------

NoDeadlock == [](RunningThreads # {} )

THEOREM Prog => []TypeInvariant /\ NoDeadlock

=============================================================================
\* Modification History
\* Last modified Wed Dec 18 21:09:56 SGT 2013 by RedX
\* Created Sun Dec 15 11:34:10 SGT 2013 by RedX
