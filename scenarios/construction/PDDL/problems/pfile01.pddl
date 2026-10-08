(define
	(problem pfile01)
	(:domain domain_htn)
	(:objects
		mat1 - material
		home1 load9 dump1 - location
		robot1 - robot
	)
	(:init
		(free load9)
		(free dump1)
		(at robot1 home1)
		(at mat1 load9)
	)
	(:goal
		(and
			(at mat1 dump1)
		)
	)
)
