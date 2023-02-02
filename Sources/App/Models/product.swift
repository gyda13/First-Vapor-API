//
//  Product.swift
//  
//
//  Created by gyda almohaimeed on 05/07/1444 AH.
//

import Fluent
import Vapor

final class Product: Model, Content {
    static let schema = "products"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "actual_price")
    var actual_price: Double
    
    @Field(key: "profit_price")
    var profit_price: Double
    
    
    @Field(key: "work_price")
    var work_price: Double
    
//    @Field(key: "total_price")
//    var total_price: Double

    
    
    @Field(key: "quantity")
    var quantity: Int
    
    
    init() {}
    
    
    init(id: UUID? = nil, name: String, actual_price: Double, profit_price: Double, work_price: Double,  total_price: Double, quantity: Int) {
        
        self.id = id
        self.name = name
        self.actual_price = actual_price
        self.profit_price = profit_price
        self.work_price = work_price
       // self.total_price = total_price
        self.quantity = quantity
        
    }
    
}
