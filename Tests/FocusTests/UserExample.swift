//
//  UserExample.swift
//  swiftz
//
//  Created by Maxwell Swadling on 9/06/2014.
//  Copyright (c) 2014-2016 Maxwell Swadling. All rights reserved.
//

import Focus
#if SWIFT_PACKAGE
	import Operadics
#endif

// A user example
// an example of why we need SYB, Generics or macros
open class User {
	let name : String
	let age : Int
	let tweets : [String]
	let attr : String
	
	public init(_ n : String, _ a : Int, _ t : [String], _ r : String) {
		name = n
		age = a
		tweets = t
		attr = r
	}
	
	// lens example
	open class func luserName() -> Lens<User, User, String, String> {
		return Lens { user in IxStore(user.name) { User($0, user.age, user.tweets, user.attr) } }
	}
}

public func ==(lhs : User, rhs : User) -> Bool {
	return lhs.name == rhs.name && lhs.age == rhs.age && lhs.tweets == rhs.tweets && lhs.attr == rhs.attr
}
