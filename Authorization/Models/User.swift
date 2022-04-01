//
//  User.swift
//  Authorization
//
//  Created by mac on 31.03.2022.
//

import CoreText


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
                descriptionOfYourself: """
Увлекаюсь активными видами спорта а так-же в данный момент
изучением языка программирования: Swift.
До этого работал в сфере вертолета строения - слесарь😉
Теперь готов взрывать
IT отрасль!😁
"""
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let descriptionOfYourself: String
}


