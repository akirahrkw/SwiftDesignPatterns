//
//  FactoryMethod.swift
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

    func createCountry() -> Country
}

class Akira: Person {

    func name() -> String {
        return "Akira"
    }

    func createCountry() -> Country {
        return Japan()
    }
}

class John: Person {

    func name() -> String {
        return "John"
    }

    func createCountry() -> Country {
        return Singapore()
    }
}

var person: Person? = nil
person = Akira()
print(person!.createCountry().name())

person = John()
print(person!.createCountry().name())
