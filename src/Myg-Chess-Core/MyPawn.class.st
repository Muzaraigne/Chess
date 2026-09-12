Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#instVars : [
		'moving'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyPawn >> doubleMove [

 ^ (self isWhite
		   ifTrue: [ { square up . square up up} ]
		   ifFalse: [ { square down . square down down } ]) 
	select: [ :s | s notNil and: [ s hasPiece not ] ]

]

{ #category : 'as yet unclassified' }
MyPawn >> forwardCaptures [

	^ (self isWhite
		   ifTrue: [
				   {
					   square up left.
					   square up right } ]
		   ifFalse: [
				   {
					   square down right.
					   square down left } ]) select: [ :s |
		  s notNil and: [ s hasPiece and: [ s contents color ~= color ] ] ]
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

{ #category : 'path commands' }
MyPawn >> moveTo: aSquare [
super moveTo: aSquare.
moving := true.
]

{ #category : 'accessing' }
MyPawn >> moving [

	^ moving
]

{ #category : 'accessing' }
MyPawn >> moving: anObject [

	moving := anObject
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	^ (self moving 
		ifTrue: [ (self isWhite
		               ifTrue: [ { square up } ]
		               ifFalse: [ { square down } ]) 
							select: [ :s | s notNil and: [ s hasPiece not ] ] ]
		ifFalse: [ self doubleMove]) , self forwardCaptures
]
