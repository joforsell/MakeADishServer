//
//  CreateUsers.swift
//  
//
//  Created by Johan Forsell on 2022-05-02.
//

import Fluent

struct CreateUsers: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(DBSchemas.users)
            .id()
            .field(.username, .string, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(DBSchemas.users).delete()
    }
    

}
