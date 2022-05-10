//
//  CreateDishes.swift
//  
//
//  Created by Johan Forsell on 2022-05-02.
//

import Fluent

struct CreateDishes: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(DBSchemas.dishes)
            .id()
            .field(.title, .string, .required)
            .field(.desc, .string, .required)
            .field(.videoId, .string, .required)
            .field(.ingredients, .array(of: .string))
            .field(.tags, .array(of: .string))
            .field(.ratings, .array(of: .int))
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(DBSchemas.dishes).delete()
    }
}
