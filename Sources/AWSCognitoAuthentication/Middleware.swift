import Vapor

/// Middleware for outputting all http requests and their responses
final class AWSCognitoAccessMiddleware<Authenticatable: AWSCognitoAuthenticatable> : Middleware, ServiceType {
    static func makeService() throws -> Self {
        return try .init()
    }
    
    init() { }
    
    func respond(to request: Request, chainingTo next: Responder) throws -> EventLoopFuture<Response> {
        _ = try Authenticatable.authenticateAccessToken(request)
        return try next.respond(to: request)
    }
}
