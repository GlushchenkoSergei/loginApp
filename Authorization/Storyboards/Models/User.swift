//
//  User.swift
//  Authorization
//
//  Created by mac on 31.03.2022.
//


struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "User",
            password: "1234",
            person: Person(
                name: "Sergey",
                surname: "Glushchenko",
                age: DateOfBirthday(date: 03, month: 08, year: 1993),
                descriptionOfYourself: """
Увлекаюсь активными видами спорта а так-же в данный момент
изучением языка программирования: Swift. До этого работал
 в сфере вертолета строения - слесарь;) Который взорвет IT отрасль!😁
"""
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let age: DateOfBirthday
    let descriptionOfYourself: String
}

struct DateOfBirthday {
    let date: Int
    let month: Int
    let year: Int
}

