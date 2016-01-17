//
//  FactoryMethod.swift
//  
//
//  Created by Akira Hirakawa on 19/12/15.
//
//

import Foundation

class Person {

    var name: String

    init(name aName: String) {
        name = aName
    }
//    init(firstName: String) {
//    }
//
//    init(firstName: String, lastName: String) {
//    }
//
//    init(firstName: String, middleName: String, lastName: String) {
//    }
}

class PersonBuilder {

    var name: String = ""

    func addFirstName() -> Self {
        name += "First"
        return self
    }

    func addMiddleName() -> Self {
        name += "Middle"
        return self
    }

    func addLastName() -> Self {
        name += "Last"
        return self
    }

    func getPerson() -> Person {
        let person = Person(name: name)
        return person
    }
}

let builder = PersonBuilder()
var person = builder.addFirstName().addLastName().getPerson()
print(person.name)

class PersonDirector {
    class func createPersonWithFullName() -> Person {
        let builder = PersonBuilder()
        let person = builder.addFirstName().addMiddleName().addLastName().getPerson()
        return person
    }
}

person = PersonDirector.createPersonWithFullName()
print(person.name)
