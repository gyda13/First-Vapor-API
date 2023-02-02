//
//  ProductController.swift
//  
//
//  Created by gyda almohaimeed on 05/07/1444 AH.
//

import Fluent
import Vapor

struct ProductController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let products = routes.grouped("products")
        products.get(use: index)
        products.post(use: create)
        products.put(use: update)
        products.group(":productID") { product in
            product.delete(use: delete)
        }
                       
        }
    
    // GET request routes
    func index(req: Request) throws -> EventLoopFuture<[Product]> {
        return Product.query(on: req.db).all()
    }
    
    // POST request routes
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let products = try req.content.decode(Product.self)
        return products.save(on: req.db).transform(to: .ok)
    }
    
    // PUT request /products routes
    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let products = try req.content.decode(Product.self)
        
        return Product.find(products.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.name = products.name
                $0.actual_price = products.actual_price
                $0.profit_price = products.profit_price
                $0.work_price = products.work_price
                $0.quantity = products.quantity
                return $0.update(on: req.db).transform(to: .ok)
            }
    }
    
    // DELETE Request /products/id (UUID) routes
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Product.find(req.parameters.get("productID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db)}
            .transform(to: .ok)
        
    }
    
}
