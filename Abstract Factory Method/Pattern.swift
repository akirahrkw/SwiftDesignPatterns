//
//  Pattern.swift
//
//
//  Created by Akira Hirakawa on 19/12/15.
//
//

import Foundation

/// Country
protocol Country {
    func name() -> String

    func code() -> Int
}

class Japan: Country {

    func name() -> String {
        return "Japan"
    }

    func code() -> Int {
        return 81
    }
}

class Singapore: Country {

    func name() -> String {
        return "Singapore"
    }

    func code() -> Int {
        return 65
    }
}

/// Person
protocol Person {
    
    func name() -> String
}

class Akira: Person {
    func name() -> String {
        return "Akira"
    }
}

class John: Person {
    func name() -> String {
        return "John"
    }
}

/// Factory
protocol CountryFactory {

    func createCountry() -> Country

    func createPerson() -> Person
}

class BaseFactory {

    class func createFactory(key: String) -> CountryFactory {
        if key == "Japan" {
            return JapanFactory()
        } else {
            return SingaporeFactory()
        }
    }
}

class JapanFactory: BaseFactory, CountryFactory {

    func createCountry() -> Country {
        return Japan()
    }

    func createPerson() -> Person {
        return Akira()
    }
}

class SingaporeFactory: BaseFactory, CountryFactory {

    func createCountry() -> Country {
        return Singapore()
    }

    func createPerson() -> Person {
        return John()
    }
}

// Japan Factory
var factory = BaseFactory.createFactory("Japan")
print(factory.createPerson().name())
print(factory.createCountry().name())

// Singapore Factory
factory = BaseFactory.createFactory("Singapore")
print(factory.createPerson().name())
print(factory.createCountry().name())
