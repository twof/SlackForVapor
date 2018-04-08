import Vapor

public protocol SlackProvider: Service {
    var verificationToken: String { get }
    var slackBotToken: String { get }
    func send(message: String, to channel: String, on request: Request) throws -> Future<Response>
    func openIM(with userId: String, on request: Request) throws -> Future<Response>
}

public struct Slack: SlackProvider {
    public let verificationToken: String
    public let slackBotToken: String
    
    public func send(message: String, to channel: String, on request: Request) throws -> Future<Response> {
        <#code#>
    }
    
    public func openIM(with userId: String, on request: Request) throws -> Future<Response> {
        let client = try request.make(Client.self)
        
        let params = OpenIMParams(token: slackBotToken, userId: userId)
        
        return client.post("https://slack.com/api/im.open", content: params)
    }
}

