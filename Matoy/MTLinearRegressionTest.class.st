Class {
	#name : #MTLinearRegressionTest,
	#superclass : #TestCase,
	#category : #Matoy
}

{ #category : #accessing }
MTLinearRegressionTest >> data [ 
	^ {4@3. 5@8. 6@20. 7@30. 10@12}
	
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
	self assert: l slope equals: 434 / 106.
	self assert: l intercept equals: 174 / 106
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
