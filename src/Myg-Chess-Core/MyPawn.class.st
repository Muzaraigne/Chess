Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [
	| forwardCaptures candidates |


candidates := (self isWhite 
    ifTrue: [ { square up } ] 
    ifFalse: [ { square down } ]) 
        select: [ :s | s notNil and: [ s hasPiece not ] ].

"2. Diagonales (doivent contenir un ennemi)"
forwardCaptures := (self isWhite 
    ifTrue: [ { (square up left ) . (square up right ) } ] 
    ifFalse: [ { (square down right) . (square down left) } ]) 
        select: [ :s | s notNil and: [ s hasPiece and: [ s contents color ~= color ] ] ].


^ candidates , forwardCaptures
]
