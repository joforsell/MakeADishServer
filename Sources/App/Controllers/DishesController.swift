//
//  DishesController.swift
//  
//
//  Created by Johan Forsell on 2022-05-02.
//

import Fluent
import Vapor

struct DishesController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let dishes = routes.grouped("dishes")
        dishes.get(use: index)
        dishes.post("add", use: addDishHandler)
        dishes.get(":dishID", "comments", use: getCommentsHandler)
    }
    
    func index(req: Request) async throws -> [Dish] {
        try await Dish.query(on: req.db).all()
    }
    
    func addDishHandler(_ req: Request) async throws -> Dish {
        let data = try req.content.decode(CreateDishData.self)
        let dish = Dish(title: data.title, description: data.description, videoUrlString: data.videoUrlString, ingredients: data.ingredients ?? [], tags: data.tags ?? [], ratings: data.ratings ?? [])
        try await dish.save(on: req.db)
        return dish
    }
    
    func getCommentsHandler(_ req: Request) async throws -> [Comment] {
        guard let commentQuery = try await Dish.find(req.parameters.get("dishID"), on: req.db).get() else { return [] }
        let comments = try await commentQuery.$comments.get(on: req.db)
        return comments
    }
}

struct CreateDishData: Content {
    let title: String
    let description: String
    let videoUrlString: String
    let ingredients: [String]?
    let tags: [String]?
    let ratings: [Int]?
}
