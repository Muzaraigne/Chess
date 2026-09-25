Class {
	#name : 'MyBlackPawn',
	#superclass : 'MyPawn',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyBlackPawn >> forwardCaptures [ 
	^ {square down right. square down left} select: [ :s |
		  s notNil and: [ s hasPiece and: [ s contents color ~= color ] ] ]
	
]

{ #category : 'path commands' }
MyBlackPawn >> initialize [ 
	super initialize .
	color := Color black.
]

{ #category : 'rendering' }
MyBlackPawn >> targetSquaresLegal: aBoolean [
    | count |
    count := self moving ifTrue: [ 1 ] ifFalse: [ 2 ].
    ^ ((self downFileLegal: aBoolean) first: count) , self forwardCaptures
]
