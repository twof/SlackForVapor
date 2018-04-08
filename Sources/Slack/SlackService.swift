import Vapor

public protocol SlackProvider: Service {
    var verificationToken: String { get }
    var slackBotToken: String { get }
    func send(message: String, to channel: String, on request: Request) throws -> Future<SendMessageResponse>
    func openIM(with userId: String, on request: Request) throws -> Future<OpenIMResponse>
}

public struct Slack: SlackProvider {
    public let verificationToken: String
    public let slackBotToken: String
    
    public init(verificationToken: String, slackBotToken: String) {
        self.verificationToken = verificationToken
        self.slackBotToken = slackBotToken
    }
    
    public func send(message: String, to channel: String, on request: Request) throws -> Future<SendMessageResponse> {
        let client = try request.make(Client.self)
        
        let sendMessageParams = SendMessageParams(
            token: slackBotToken,
            channel: channel,
            text: message,
            asUser: true
        )
        
        return client
            .post("https://slack.com/api/chat.postMessage", content: sendMessageParams)
            .flatMap(to: SendMessageResponse.self) { response in
                return try response.content.decode(SendMessageResponse.self)
            }
    }
    
    public func openIM(with userId: String, on request: Request) throws -> Future<OpenIMResponse> {
        let client = try request.make(Client.self)
        
        let params = OpenIMParams(token: slackBotToken, userId: userId)
        
        return client
            .post("https://slack.com/api/im.open", content: params)
            .flatMap(to: OpenIMResponse.self) { response in
                return try response.content.decode(OpenIMResponse.self)
            }
    }
}

