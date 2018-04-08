import Vapor

public struct OpenIMParams: Content {
    public static var defaultMediaType: MediaType = .urlEncodedForm
    
    public let token: String
    public let userId: String
    
    public init(token: String, userId: String) {
        self.token = token
        self.userId = userId
    }
    
    enum CodingKeys: String, CodingKey {
        case token
        case userId = "user"
    }
}
