"
A little linear regression finders:

It find 
	y := a x + b
such that 

a = (Sig(y) * Sig (x2) - Sig(x) * Sig (xy))	/ n * Sig (x2) - Sig(x)^2
	
b = (n(Sig xy) - Sigx * Sigy ) / n Sig(x2) - Sig(x)^2
"
Class {
	#name : #MTLinearizer,
	#superclass : #Object,
	#instVars : [
		'data',
		'sumX',
		'sumY',
		'xMean',
		'yMean',
		'sumX2',
		'sumXY'
	],
	#category : #Matoy
}

{ #category : #internals }
MTLinearizer >> compute [
	| size | 
	data do: [ :each | 
		sumX := each x + sumX.
		sumY := each y + sumY.
		sumX2 := sumX2 + each x squared.
		sumXY := sumXY + (each x * each y)
		].
	size := data size. 
	xMean := sumX / size.
	yMean := sumY / size
]

{ #category : #accessing }
MTLinearizer >> data [
	^ data
]

{ #category : #accessing }
MTLinearizer >> data: aCollection [ 
	data := aCollection
]

{ #category : #api }
MTLinearizer >> for: aCollectionOfPoints [

	data := aCollectionOfPoints.
	self compute
]

{ #category : #api }
MTLinearizer >> forXs: aCollectionOfXs andYs: aCollectionOfYs [
	
	data := aCollectionOfXs with: aCollectionOfYs collect: [ :x :y | x@y ].
	self compute
]

{ #category : #initialize }
MTLinearizer >> initialize [ 
	super initialize. 
	sumX := 0.
	sumY := 0.
	sumXY := 0.
	sumX2 := 0.
	xMean := 0.
	yMean := 0
]

{ #category : #api }
MTLinearizer >> intercept [

	^ (data size * sumXY - (sumX * sumY)) / (data size * sumX2 - sumX squared)
]

{ #category : #api }
MTLinearizer >> slope [

	^ (sumY * sumX2 - (sumX * sumXY)) / (data size * sumX2 - sumX squared)
]

{ #category : #internals }
MTLinearizer >> sumX [
	^ sumX
]

{ #category : #internals }
MTLinearizer >> sumX2 [
	^ sumX2
]

{ #category : #internals }
MTLinearizer >> sumXY [
	^ sumXY
]

{ #category : #internals }
MTLinearizer >> sumY [
	^ sumY
]

{ #category : #internals }
MTLinearizer >> xMean [
	^ xMean
]

{ #category : #internals }
MTLinearizer >> yMean [
	^ yMean
]
