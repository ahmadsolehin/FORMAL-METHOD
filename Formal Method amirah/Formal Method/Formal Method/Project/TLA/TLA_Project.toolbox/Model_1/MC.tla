---- MODULE MC ----
EXTENDS TLA_Project, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
p1, p2
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d1
----

\* MV CONSTANT definitions Producers
const_13993617420297000 == 
{p1, p2}
----

\* MV CONSTANT definitions DataSet
const_13993617420398000 == 
{d1}
----

\* CONSTANT definitions @modelParameterConstants:0BufferSize
const_13993617420499000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:2Consumers
const_139936174205910000 == 
{c1, c2}
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_139936174206911000 ==
Spec
----
=============================================================================
\* Modification History
\* Created Tue May 06 15:35:42 SGT 2014 by David Keong
