Class {
	#name : 'MyWhitePawn',
	#superclass : 'MyPawn',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyWhitePawn >> forwardCaptures [ 
	^ {square up right. square up left} select: [ :s |
		  s notNil and: [ s hasPiece and: [ s contents color ~= color ] ] ]
	
]

{ #category : 'path commands' }
MyWhitePawn >> initialize [ 
	super initialize .
	color := Color white.
]

{ #category : 'rendering' }
MyWhitePawn >> targetSquaresLegal: aBoolean [
    | count targetLegal |
    count := self moving ifTrue: [ 1 ] ifFalse: [ 2 ].
    targetLegal := (self upFileLegal: aBoolean) takeFirst: count .
    
    ^ self forwardCaptures , (targetLegal do:[ :s | s hasPiece])
]
