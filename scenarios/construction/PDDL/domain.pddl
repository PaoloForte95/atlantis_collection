(define (domain domain_htn)
	(:requirements :strips :typing :negative-preconditions :universal-preconditions)
	(:types
		material - locatable
		robot - locatable
		location - object
		locatable - object
	)
	(:predicates
		(in ?arg0 - material ?arg1 - robot)
		(at ?arg0 - locatable ?arg1 - location)
		(free ?arg0 - location)
		(on ?arg0 - material ?arg1 - material ?arg2 - location)
	)

	(:action drive
		:parameters (?v - robot ?l1 - location ?l2 - location)
		:precondition
			(and
				(at ?v ?l1)
				(free ?l2)
			)
		:effect
			(and
				(not (at ?v ?l1))
				(at ?v ?l2)
				(free ?l1)
				(not (free ?l2))
			)
	)


	(:action load
		:parameters (?v - robot ?l - location ?m - material)
		:precondition
			(and
				(at ?v ?l)
				(at ?m ?l)
				(forall (?m2 - material)
					(not (on ?m2 ?m ?l))
				)
				(forall (?m - material)
					(not (in ?m ?v))
				)
			)
		:effect
			(and
				(in ?m ?v)
				(not (at ?m ?l))
			)
	)

	(:action dump
		:parameters (?v - robot ?l - location ?m - material)
		:precondition
			(and
				(at ?v ?l)
				(in ?m ?v)
				(forall (?m2 - material)
					(not (at ?m2 ?l))
				)
			)
		:effect
			(and
				(not (in ?m ?v))
				(at ?m ?l)
			)
	)

	(:action stack
		:parameters (?v - robot ?l - location ?m1 - material ?m2 - material)
		:precondition
			(and
				(at ?v ?l)
				(in ?m1 ?v)
				(at ?m2 ?l)
			)
		:effect
			(and
				(not (in ?m1 ?v))
				(at ?m1 ?l)
				(on ?m1 ?m2 ?l)
			)
	)

	(:action unstack
		:parameters (?v - robot ?l - location ?m1 - material ?m2 - material)
		:precondition
			(and
				(at ?v ?l)
				(at ?m2 ?l)
				(at ?m1 ?l)
				(forall (?m3 - material)
					(not (on ?m3 ?m1 ?l))
				)
				(on ?m1 ?m2 ?l)
			)
		:effect
			(and
				(not (on ?m1 ?m2 ?l))
				(in ?m1 ?v)
				(not (at ?m1 ?l))
			)
	)
)
