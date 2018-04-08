import Vapor

public struct SendMessageParams: Content {
    public static var defaultMediaType: MediaType = .urlEncodedForm
    
    public let token: String
    public let channel: String
    public let text: String
    public let asUser: Bool
    
    public init(token: String, channel: String, text: String, asUser: Bool) {
        self.token = token
        self.channel = channel
        self.text = text
        self.asUser = asUser
    }
    
    enum CodingKeys: String, CodingKey {
        case token
        case channel
        case text
        case asUser = "as_user"
    }
}
