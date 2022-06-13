//
//  User.swift
//  
//
//  Created by Johan Forsell on 2022-05-02.
//

import Vapor
import Fluent

final class User: Model, Content {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: .username)
    var username: String
    
    @Children(for: \.$user)
    var comments: [Comment]
    
    init() {}
    
    init(id: UUID? = nil, username: String) {
        self.id = id
        self.username = username
    }
}

// MARK: -- User model field keys

extension FieldKey {
    static let username: FieldKey = "username"
}

