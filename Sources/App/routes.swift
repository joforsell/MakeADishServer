import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    app.post("user", "add") { req -> HTTPStatus in
        let user = try req.content.decode(User.self)
        try await user.save(on: req.db)
        return .created
    }
    
    try app.register(collection: DishesController())
    
    try app.register(collection: CommentsController())
}
