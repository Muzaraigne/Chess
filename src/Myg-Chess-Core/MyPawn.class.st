Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#instVars : [
		'moving'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'constants' }
MyPawn class >> black [ 
	^ MyBlackPawn new.
]

{ #category : 'constants' }
MyPawn class >> white [ 
	^ MyWhitePawn new.
]

{ #category : 'rendering' }
MyPawn >> doubleMove [

 ^ (self isWhite
		   ifTrue: [ { square up . square up up} ]
		   ifFalse: [ { square down . square down down } ]) 
	select: [ :s | s notNil and: [ s hasPiece not ] ]

]

{ #category : 'as yet unclassified' }
MyPawn >> forwardCaptures [

self subclassResponsibility 
]

{ #category : 'path commands' }
MyPawn >> handlePromotion [
    | choice |
    choice := UIManager default 
        chooseFrom: #('Reine' 'Tour' 'Fou' 'Cavalier') 
        values: { MyQueen new . MyRook new  . MyBishop new . MyKnight new }
        title: 'Choisissez la pièce pour la promotion :'.
    self promoteTo: choice .
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'path commands' }
MyPawn >> initialize [ 
super initialize .
moving := false.
]

{ #category : 'testing' }
MyPawn >> isEligibleForPromotion [
    ^ self isWhite 
        ifTrue: [ square file = $8 ]
        ifFalse: [ square file = $1 ]
]

{ #category : 'path commands' }
MyPawn >> moveTo: aSquare [
super moveTo: aSquare.
moving := true.
self isEligibleForPromotion ifTrue: [ self handlePromotion ]
]

{ #category : 'accessing' }
MyPawn >> moving [

	^ moving
]

{ #category : 'accessing' }
MyPawn >> moving: anObject [

	moving := anObject
]

{ #category : 'as yet unclassified' }
MyPawn >> promoteTo: aPieceClass [
| newPiece targetSquare |
targetSquare := self square.
newPiece := self isWhite 
	ifTrue: [ aPieceClass  color: Color white ]
	ifFalse: [ aPieceClass color: Color black].
	targetSquare contents: newPiece.
	newPiece square: targetSquare .


]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	self subclassResponsibility
]
