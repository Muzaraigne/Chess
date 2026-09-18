Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testDiagonalsEat [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'b5' put: (pawn := MyPawn white).
	pawn moving: true.

	"Rooks don't jump above pieces"
	"But they eat pieces of the other color"
	"Let's put a black obstacle on g4, blocking the f rank"
	board at: 'a6' put: MyPawn black.
	board at: 'c6' put: MyPawn white.

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( a6 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTest >> testFirstMoves [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'a2' put: (pawn := MyPawn white).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( a3 a4 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTest >> testFirstMovesWithOponentObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'a2' put: (pawn := MyPawn white).

	"Rooks don't jump above pieces"
	"But they eat pieces of the other color"
	"Let's put a black obstacle on g4, blocking the f rank"
	board at: 'a4' put: MyPawn black.

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( a3 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTest >> testFirstMovesWithSameColorObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'a2' put: (pawn := MyPawn white).

	"Rooks don't jump above pieces"
	"But they eat pieces of the other color"
	"Let's put a black obstacle on g4, blocking the f rank"
	board at: 'a4' put: MyPawn white.

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( a3 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTest >> testId [

	self assert: MyPawn new id equals: 'P'
]

{ #category : 'tests' }
MyPawnTest >> testMovesWithOponentObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'a5' put: (pawn := MyPawn white).
	pawn moving: true.

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
MyPawnTest >> testMovesWithSameColorObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'a5' put: (pawn := MyPawn white).
	pawn moving: true.
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

{ #category : 'tests' }
MyPawnTest >> testPromotion [
	| pawn board promotedPiece |
	board := MyChessBoard empty.
	board initializePieces.
	pawn := (board at: 'a2') contents.
	self assert: pawn notNil.
	board at: 'a8' put: pawn.
	self assert: pawn isEligibleForPromotion.
	pawn promoteTo: MyQueen.
	promotedPiece := (board at: 'a8') contents.
   self assert: promotedPiece class equals: MyQueen.
]
