//
//  CreateComments.swift
//  
//
//  Created by Johan Forsell on 2022-05-03.
//

import Fluent

struct CreateComments: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Comment.schema)
            .id()
            .field(.text, .string, .required)
            .field(.dish, .uuid, .references(Dish.schema, "id"))
            .field(.user, .uuid, .references(User.schema, "id"))
            .field(.timePosted, .datetime, .required)
            .field(.lastEdited, .datetime, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(Comment.schema).delete()
    }
}
