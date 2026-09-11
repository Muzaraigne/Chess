Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTests >> testId [

	self assert: MyPawn new id equals: 'P'
]

{ #category : 'tests' }
MyPawnTests >> testMovesWithOponentObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'a5' put: (pawn := MyPawn white).

	"Rooks don't jump above pieces"
	"But they eat pieces of the other color"
	"Let's put a black obstacle on g4, blocking the f rank"
	board at: 'a6' put: MyPawn black.

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#() collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testMovesWithSameColorObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'a5' put: (pawn := MyPawn white).

	"Rooks don't jump above pieces"
	"But they eat pieces of the other color"
	"Let's put a black obstacle on g4, blocking the f rank"
	board at: 'a6' put: MyPawn white .

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#() collect: [ :name |
				 board at: name ])
]
