//
//  CreateIngredients.swift
//  
//
//  Created by Johan Forsell on 2022-06-12.
//

import Fluent

struct CreateIngredients: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Ingredient.schema)
            .id()
            .field(.ingredientName, .string, .required)
            .field(.user, .uuid, .references(User.schema, "id"))
            .field(.volume, .double, .required)
            .field(.unit, .custom(MeasuringUnit.self), .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(Ingredient.schema).delete()
    }
    

}
