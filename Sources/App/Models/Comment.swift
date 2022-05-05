//
//  Comment.swift
//  
//
//  Created by Johan Forsell on 2022-05-03.
//

import Vapor
import Fluent

final class Comment: Model, Content {
    static let schema = "comments"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: .text)
    var text: String
    @Parent(key: .dish)
    var dish: Dish
    @Field(key: .timePosted)
    var timePosted: Date
    @Field(key: .lastEdited)
    var lastEdited: Date
    
    init() {}
    
    init(id: UUID? = nil, text: String, dishID: Dish.IDValue, timePosted: Date, lastEdited: Date) {
        self.id = id
        self.text = text
        self.$dish.id = dishID
        self.timePosted = timePosted
        self.lastEdited = lastEdited
    }
}

// MARK: -- Comment model field keys

extension FieldKey {
    static let text: FieldKey = "text"
    static let dish: FieldKey = "dish"
    static let timePosted: FieldKey = "time_posted"
    static let lastEdited: FieldKey = "last_edited"
}
