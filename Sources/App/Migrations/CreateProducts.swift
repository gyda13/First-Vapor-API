//
//  CreateProducts.swift
//  
//
//  Created by gyda almohaimeed on 05/07/1444 AH.
//


// opject relational mapping
import Fluent


// fluent migration can handel database migrations which can include tabel, changing existing tabls or adding seed data
struct CreateProducts: Migration {
    
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        // create the tabel
        return database.schema("products")
            .id()
            .field("name", .string, .required)
            .field("actual_price", .double, .required)
            .field("profit_price", .double, .required)
            .field("work_price", .double, .required)
         //   .field("total_price", .double, .required)
            .field("quantity", .int, .required)
            .create()
        
        
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("products").delete()
    }
    
    
}
