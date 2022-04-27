male(rahman).
male(rafiq).
male(rejaul).
male(akif).
male(riaz).
male(shahid).
male(manik).
male(akash).
male(karim).
male(ahan).
male(shumon).
male(alif).
male(noor).
male(faiaz).
male(noman).
male(mahbub).
male(maruf).
male(sadiq).
male(zaman).
male(mashfi).
male(sharif).



female(rojina).
female(shahana).
female(laila).
female(mita).
female(morium).
female(orin).
female(saida).
female(jhuma).
female(nadia).
female(kashfia).
female(nishat).
female(laboni).
female(nusrat).
female(jyoti).
female(anika).
female(dia).
female(sadiqa).
female(ria).



father(rahman,rafiq).
father(rahman,rejaul).
father(rafiq,akif).
father(rafiq,riaz).
father(rejaul,shahid).
father(akif,manik).
father(akif,akash).
father(riaz,karim).
father(shahid,ahan).
father(ahan,faiaz).
father(manik,shumon).
father(manik,nishat).
father(akash,alif).
father(karim,noor).
father(alif,noman).
father(noor,mahbub).
father(faiaz,maruf).
father(noman,sadiq).
father(maruf,mashfi).
father(mahbub,zaman).
father(sadiq,sharif).

mother(rojina,rafiq).
mother(rojina,rejaul).
mother(shahana,akif).
mother(shahana,riaz).
mother(laila,shahid).
mother(mita,akash).
mother(mita,manik).
mother(morium,karim).
mother(orin,ahan).
mother(saida,nishat).
mother(jhuma,alif).
mother(nadia,noor).
mother(kashfia,faiaz).
mother(laboni,noman).
mother(nusrat,mahbub).
mother(jyoti,maruf).
mother(anika,sadiq).
mother(dia,zaman).
mother(sadiqa,mashfi).
mother(ria,sharif).


parent(X,Y):-
    father(X,Y);
    mother(X,Y).

child(X,Y):-
    father(Y,X);
    mother(Y,X).

sibling(X,Y):-
    parent(M,X),
    parent(M,Y).

grandparent(X,Y):-
    parent(X,Z),
    parent(Z,Y).

greatgrandparent(X,Y):-
    parent(X,M),
    parent(M,N),
    parent(N,Y).

greatgreatgrandparent(X,Y):-
    parent(X,M),
    parent(M,N),
    parent(N,P),
    parent(P,Y).

greatgreatgreatgrandparent(X,Y):-
    parent(X,M),
    parent(M,N),
    parent(N,P),
    parent(P,Q),
    parent(Q,Y).

greatgreatgreatgreatgrandparent(X,Y):-
    parent(X,M),
    parent(M,N),
    parent(N,P),
    parent(P,Q),
    parent(Q,Z),
    parent(Z,Y).


firstcousin(X,Y):-
    parent(M,X),
    parent(N,Y),
    parent(Z,M),
    parent(Z,N),
    not(M=@=N).

secondcousin(X,Y):-
    parent(M,X),
    parent(N,Y),
    parent(P,M),
    parent(Q,N),
    parent(Z,P),
    parent(Z,Q),
    not(M=@=N),
    not(P=@=Q).

thirdcousin(X,Y):-
    parent(M,X),
    parent(N,Y),
    parent(P,M),
    parent(Q,N),
    parent(R,P),
    parent(S,Q),
    parent(Z,R),
    parent(Z,S),
    not(M=@=N),
    not(P=@=Q).


firstcousinonceremoved(X,Y):-
    parent(M,X),
    parent(Z,M),
    grandparent(N,Y),
    parent(Z,N),
    not(M=@=N).

secondcousinonceremoved(X,Y):-
    grandparent(M,X),
    parent(Z,M),
    greatgrandparent(N,Y),
    parent(Z,N),
    not(M=@=N).

thirdcousinonceremoved(X,Y):-
    greatgrandparent(M,X),
    parent(Z,M),
    greatgreatgrandparent(N,Y),
    parent(Z,N),
    not(M=@=N).


firstcousintwiceremoved(X,Y):-
    parent(M,X),
    parent(Z,M),
    greatgrandparent(N,Y),
    parent(Z,N),
    not(M=@=N).

secondcousintwiceremoved(X,Y):-
    parent(M,X),
    parent(P,M),
    parent(Z,P),
    greatgrandparent(N,Y),
    parent(Q,N),
    parent(Z,Q),
    not(M=@=N),
    not(P=@=Q).

thirdcousintwiceremoved(X,Y):-
    grandparent(M,X),
    parent(P,M),
    parent(Z,P),
    greatgreatgrandparent(N,Y),
    parent(Q,N),
    parent(Z,Q),
    not(M=@=N),
    not(P=@=Q).
