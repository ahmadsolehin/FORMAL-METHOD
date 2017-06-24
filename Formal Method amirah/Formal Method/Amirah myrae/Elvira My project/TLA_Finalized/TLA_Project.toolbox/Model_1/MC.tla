---- MODULE MC ----
EXTENDS TLA_Project, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d1
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
pe1, pe2
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
p1, p2
----

\* MV CONSTANT definitions Data
const_13999736676032000 == 
{d1}
----

\* MV CONSTANT definitions PersonEats
const_13999736676133000 == 
{pe1, pe2}
----

\* MV CONSTANT definitions PersonMakes
const_13999736676234000 == 
{p1, p2}
----

\* CONSTANT definitions @modelParameterConstants:0Buffer
const_13999736676345000 == 
2
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_13999736676456000 ==
Spec
----
=============================================================================
\* Modification History
\* Created Tue May 13 17:34:27 SGT 2014 by David Keong
