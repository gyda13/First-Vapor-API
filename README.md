# First-Vapor-API
server-side Swift web framework a backend for CRUD iOS App

## Why Vapor?
Vapor is an open-source web framework written in Swift. 
It’s built on top of Apple’s SwiftNIO library to provide a powerful, asynchronous framework. 
Vapor allows you to build back-end applications for iOS apps, front-end web sites and stand-alone server applications.


## Technologies
- Vapor4
- PostgreSQL

## Tools
- Docker
- Postman
- DBeaver


## Product Controller
- GET 
```swift
    // GET request routes
    func index(req: Request) throws -> EventLoopFuture<[Product]> {
        return Product.query(on: req.db).all()
    }
 ```
 
  - POST
 ```swift
 
  // POST request routes
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let products = try req.content.decode(Product.self)
        return products.save(on: req.db).transform(to: .ok)
    }
  ```  
  
  - PUT
  ```swift
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
```
  - DELETE
  ```swift
  // DELETE Request /products/id (UUID) routes
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Product.find(req.parameters.get("productID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db)}
            .transform(to: .ok)
        
    }
```




## What is next?
now am going to build a CRUD iOS App using this API
</br> https://github.com/gyda13/Crud-Vapor-App


## Resources
- https://docs.vapor.codes
- https://www.kodeco.com/books/server-side-swift-with-vapor/v3.0
- https://www.youtube.com/playlist?list=PLMRqhzcHGw1Z7xNnqS_yUNm1k9dvq-HbM

## Community
- discord - http://vapor.team/



