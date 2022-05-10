//
//  Dish.swift
//  
//
//  Created by Johan Forsell on 2022-05-02.
//

import Vapor
import Fluent

final class Dish: Model, Content {
    static let schema = "dishes"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: .title)
    var title: String
    
    @Field(key: .desc)
    var description: String
    
    @Field(key: .videoId)
    var videoId: String
    
    @Children(for: \.$dish)
    var comments: [Comment]
    
    @Field(key: .ingredients)
    var ingredients: [String]
    
    @Field(key: .tags)
    var tags: [String]
    
    @Field(key: .ratings)
    var ratings: [Int]
    
    init() {}
    
    init(id: UUID? = nil, title: String, description: String, videoId: String, ingredients: [String], tags: [String], ratings: [Int]) {
        self.id = id
        self.title = title
        self.description = description
        self.videoId = videoId
        self.ingredients = ingredients
        self.tags = tags
        self.ratings = ratings
    }
}

// MARK: -- Dish model field keys

extension FieldKey {
    static let title: FieldKey = "title"
    static let desc: FieldKey = "description"
    static let videoId: FieldKey = "video_id"
    static let ingredients: FieldKey = "ingredients"
    static let tags: FieldKey = "tags"
    static let ratings: FieldKey = "ratings"
}

