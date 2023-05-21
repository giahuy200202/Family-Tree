/*------------ PARENT -------------*/

/* Queen - Prince Philip */

parent(queen,prince_charles).
parent(prince_philip,prince_charles).

parent(queen,prince_andrew).
parent(prince_philip,prince_andrew).

parent(queen,princess_anne).
parent(prince_philip,princess_anne).

parent(queen,prince_edward).
parent(prince_philip,prince_edward).


/* Diana - Prince Charles */

parent(diana,prince_william).
parent(prince_charles,prince_william).

parent(diana,prince_harry).
parent(prince_charles,prince_harry).

/* Kate Middleton - Prince William */

parent(kate_middleton,prince_george).
parent(prince_william,prince_george).

parent(kate_middleton,princess_charlotte).
parent(prince_william,princess_charlotte).

parent(kate_middleton,prince_louis).
parent(prince_william,prince_louis).


/* Prince Harry - Meghan Markle */

parent(prince_harry,archie_harrison).
parent(meghan_markle,archie_harrison).


/* Prince Andrew - Sarah Ferguson */

parent(prince_andrew,princess_eugenie).
parent(sarah_ferguson,princess_eugenie).

parent(prince_andrew,princess_beatrice).
parent(sarah_ferguson,princess_beatrice).


/* Mark Phillips - Princess Anne */

parent(mark_phillips,peter_phillips).
parent(princess_anne,peter_phillips).

parent(mark_phillips,zara_tindall).
parent(princess_anne,zara_tindall).


/* Prince Edward - Sophie Rhys-Jones */

parent(prince_edward,lady_louise_windsor).
parent(sophie_rhys_jones,lady_louise_windsor).

parent(prince_edward,james_viscount_severn).
parent(sophie_rhys_jones,james_viscount_severn).


/*------------ MALE -------------*/

male(prince_philip).
male(prince_charles).
male(prince_william).
male(prince_harry).
male(prince_george).
male(prince_louis).
male(archie_harrison).
male(prince_andrew).
male(mark_phillips).
male(timothy_laurence).
male(peter_phillips).
male(mike_tindall).
male(prince_edward).
male(james_viscount_severn).


/*------------ FEMALE -------------*/
female(queen).
female(diana).
female(camilla_parker_bowles).
female(kate_middleton).
female(meghan_markle).
female(princess_charlotte).
female(sarah_ferguson).
female(princess_eugenie).
female(princess_beatrice).
female(princess_beatrice).
female(princess_anne).
female(autumn_phillips).
female(zara_tindall).
female(sophie_rhys_jones).
female(lady_louise_windsor).


/*------------ MARRIED -------------*/

married(queen,prince_philip).
married(prince_philip,queen).

married(diana,prince_charles).
married(prince_charles,diana).

married(prince_charles,camilla_parker_bowles).
married(camilla_parker_bowles,prince_charles).

married(kate_middleton,prince_william).
married(prince_william,kate_middleton).

married(prince_harry,meghan_markle).
married(meghan_markle,prince_harry).

married(prince_andrew,sarah_ferguson).
married(sarah_ferguson,prince_andrew).

married(mark_phillips,princess_anne).
married(princess_anne,mark_phillips).

married(princess_anne,timothy_laurence).
married(timothy_laurence,princess_anne).

married(peter_phillips,autumn_phillips).
married(autumn_phillips,peter_phillips).

married(zara_tindall,mike_tindall).
married(mike_tindall,zara_tindall).

married(prince_edward,sophie_rhys_jones).
married(sophie_rhys_jones,prince_edward).

/*------------ DIVORCED ------------*/

divorced(diana,prince_charles).
divorced(prince_charles,diana).

divorced(mark_phillips,princess_anne).
divorced(princess_anne,mark_phillips).

/*------------ FATHER ------------*/

father(Parent,Child):-
    male(Parent),
    parent(Parent,Child).

/*------------ MOTHER ------------*/

mother(Parent,Child):-
    female(Parent),
    parent(Parent,Child).

/*------------ CHILD ------------*/

child(Child,Parent):-
    parent(Parent,Child).

/*------------ SON ------------*/

son(Child,Parent):-
    child(Child,Parent),
    male(Child).

/*------------ DAUGHTER ------------*/

daughter(Child,Parent):-
    child(Child,Parent),
    female(Child).

/*------------ GRANDPARENT ------------*/

grandparent(GP,GC):-
    parent(GP,Parent),
    parent(Parent,GC).

/*------------ GRANDMOTHER ------------*/

grandmother(GM,GC):-
    grandparent(GM,GC),
    female(GM).

/*------------ GRANDFATHER------------*/

grandfather(GF,GC):-
    grandparent(GF,GC),
    male(GF).

/*------------ GRANDCHILD------------*/

grandchild(GC,GP):-
    child(GC,Parent),
    child(Parent,GP).

/*------------ GRANDSON------------*/

grandson(GS,GP):-
    male(GS),
    grandchild(GS,GP).

/*------------ GRANDDAUGHTER------------*/

granddaughter(GD,GP):-
    female(GD),
    grandchild(GD,GP).

/*------------ SPOUSE ------------*/

spouse(Husband,Wife):-
    male(Husband),
    female(Wife),
    married(Husband,Wife),
    not(divorced(Husband,Wife)).


/*------------ HUSBAND ------------*/

husband(Person,Wife):-
    female(Wife),
    married(Person,Wife),
    not(divorced(Person,Wife)).

/*------------ WIFE ------------*/

wife(Person,Husband):-
    male(Husband),
    married(Person,Husband),
    not(divorced(Person,Husband)).

/*------------ SIBLING ------------*/

sibling(Person1,Person2):-
    father(Parent,Person1),
    father(Parent,Person2),
    Person1\=Person2.

/*------------ BROTHER ------------*/

brother(Person,Sibling):-
    male(Person),
    sibling(Person,Sibling).

/*------------ SISTER ------------*/

sister(Person,Sibling):-
    female(Person),
    sibling(Person,Sibling).

/*------------ AUNT ------------*/

aunt(Aunt,Child):-
    female(Aunt),
    parent(X,Child),
    sibling(X,Aunt).

/*------------ UNCLE ------------*/

uncle(Uncle,Child):-
    male(Uncle),
    parent(X,Child),
    sibling(X,Uncle).

/*------------ NEPHEW ------------*/

nephew(Child,Sibling):-
    male(Child),
    parent(Parent,Child),
    sibling(Parent,Sibling).


/*------------ NIECE ------------*/

niece(Child,Sibling):-
    female(Child),
    parent(Parent,Child),
    sibling(Parent,Sibling).

/*---------- FIRST COUSIN ----------*/

firstCousin(Person,Child):-
    parent(Parent_Person,Person),
    parent(Parent_Child,Child),
    sibling(Parent_Person,Parent_Child).
