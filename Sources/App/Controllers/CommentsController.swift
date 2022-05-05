//
//  CommentsController.swift
//  
//
//  Created by Johan Forsell on 2022-05-03.
//

import Fluent
import Vapor

struct CommentsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let comments = routes.grouped("comments")
        comments.post("add", use: addCommentsHandler)
        
        func addCommentsHandler(_ req: Request) async throws -> Comment {
            let data = try req.content.decode(CreateCommentData.self)
            let comment = Comment(text: data.text, dishID: data.dishID, timePosted: data.timePosted, lastEdited: data.lastEdited)
            try await comment.save(on: req.db)
            return comment
        }
    }
}

struct CreateCommentData: Content {
    let text: String
    let dishID: UUID
    let timePosted: Date
    let lastEdited: Date
}
