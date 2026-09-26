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
    | count target |
    count := self moving ifTrue: [ 1 ] ifFalse: [ 2 ].
	target := (self downFileLegal: aBoolean ) takeFirst: count.
    ^( target select: [ :s | s hasPiece not ] ), self forwardCaptures
]
