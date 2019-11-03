Class {
	#name : #MTLinearRegressionTest,
	#superclass : #TestCase,
	#category : #Matoy
}

{ #category : #accessing }
MTLinearRegressionTest >> data [ 
	^ {4@3. 5@8. 6@20. 7@30. 10@12}
	
]

{ #category : #accessing }
MTLinearRegressionTest >> data2x [
	^ {1.47 . 1.50 . 1.52 . 1.55 . 1.57 . 1.60 . 1.63 . 1.65 . 1.68 . 1.70 . 1.73 . 1.75 . 1.78 . 1.80 . 1.83}
	
]

{ #category : #accessing }
MTLinearRegressionTest >> data2y [
	^ {52.21 . 53.12 . 54.48 . 55.84 . 57.20 . 58.57 . 59.93 . 61.29 . 63.11 . 64.47 . 66.28 . 68.10 . 69.92 . 72.19 . 74.46}
	
]

{ #category : #tests }
MTLinearRegressionTest >> testForXsAndYs [
	
	| l | 
	l := MTLinearizer new 
			forXs: (self data collect: [ :each | each x ]) 
			andYs: (self data collect: [ :each | each y ]).
	self assert: l data equals: self data
]

{ #category : #tests }
MTLinearRegressionTest >> testIntercept [
	
	| l | 
	l := MTLinearizer new for: self data.
	self assert: l slope equals: 434 / 106.
	self assert: l intercept equals: 174 / 106
]

{ #category : #tests }
MTLinearRegressionTest >> testLinearizer [
	
	| l | 
	l := MTLinearizer new for: self data.
	self assert: (l yForX: 4) equals: 565/53 
]

{ #category : #tests }
MTLinearRegressionTest >> testLinearizer2 [
	
	| l | 
	l := MTLinearizer new forXs: self data2x andYs: self data2y.
	self assert: l slope equals: 61.272186542107434.
	self assert: l intercept equals: -39.061955918841036
]

{ #category : #tests }
MTLinearRegressionTest >> testLinearizerSum2 [
	
	| l | 
	l := MTLinearizer new data: self data.
	l compute.
	self assert: l sumX2 equals: 226
	
]

{ #category : #tests }
MTLinearRegressionTest >> testLinearizerSumXY [
	
	| l | 
	l := MTLinearizer new data: self data.
	l compute.
	self assert: l sumXY equals: 502
	
]

{ #category : #tests }
MTLinearRegressionTest >> testSlope [
	
	| l | 
	l := MTLinearizer new for: self data.
	self assert: l slope equals: 434 / 106

]

{ #category : #tests }
MTLinearRegressionTest >> testSumX [
	
	| l | 
	l := MTLinearizer new data: self data.
	l compute.
	self assert: l sumX equals: 32.
	
]

{ #category : #tests }
MTLinearRegressionTest >> testSumY [
	
	| l | 
	l := MTLinearizer new data: self data.
	l compute.
	self assert: l sumY equals: 73.
	
]

{ #category : #tests }
MTLinearRegressionTest >> testXMean [
	
	| l | 
	l := MTLinearizer new data: self data.
	l compute. 
	self assert: l xMean equals: 32/5.
	
]

{ #category : #tests }
MTLinearRegressionTest >> testYMean [
	
	| l | 
	l := MTLinearizer new data: self data.
	l compute. 
	self assert: l yMean equals: 73/5.
	
]

{ #category : #tests }
MTLinearRegressionTest >> testxFory [
	
	| l | 
	l := MTLinearizer new for: self data.
	self assert: (l xForY: 61) equals: 104/3
]

{ #category : #tests }
MTLinearRegressionTest >> testyForX [
	
	| l | 
	l := MTLinearizer new for: self data.
	self assert: (l yForX: 4) equals: 565/53 
]
