DECLARE
	@car vector(2)	= '[1,0]'
	,@bus vector(2)	= '[1,0]'
	,@queen vector(2)	= '[0,1]'
SELECT 
	 [Car vs Bus]	= VECTOR_DISTANCE('cosine',@car,@bus)
	,[Car Vs Queen] = VECTOR_DISTANCE('cosine',@car,@queen)
	,[Bus Vs Queen] = VECTOR_DISTANCE('cosine',@bus,@queen)