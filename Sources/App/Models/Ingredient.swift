//
//  Ingredient.swift
//  
//
//  Created by Johan Forsell on 2022-06-12.
//

import Vapor
import Fluent

final class Ingredient: Model, Content {
    static let schema = "ingredients"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: .dish)
    var dish: Dish
    
    @Field(key: .ingredientName)
    var name: String
    
    @Field(key: .volume)
    var volume: Double
    
    @Field(key: .unit)
    var unit: MeasuringUnit
}

// MARK: -- Ingredient model field keys

extension FieldKey {
    static let ingredientName: FieldKey = "ingredient_name"
    static let volume: FieldKey = "volume"
    static let unit: FieldKey = "unit"
}
