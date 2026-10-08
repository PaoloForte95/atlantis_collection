(define
	(problem pfile01)
	(:domain domain_htn)
	(:objects
		mat1 mat2 - material
		home1 load9 load10 dump1 dump2 - location
		robot1 robot2 - robot
	)
	(:init
		(free load9)
		(free load10)
		(free dump1)
		(free dump2)
		(at robot1 home1)
		(at robot2 home1)
		(at mat1 load9)
		(at mat2 load10)
	)
	(:goal
		(and
			(at mat1 dump1)
			(at mat2 dump2)
		)
	)
)
