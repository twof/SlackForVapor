# Slack For Vapor

This package contains a service for interacting with Slack as a bot, and a few helper models that you can use to accept and send data to Slack.

## `SlashCommand`

`SlashCommand` is a model that can encapsulate the POST body you recieve from Slack when you rig up your server to accept slash commands.

```swift
router.post(SlashCommand.self, at: "queue") { (req, slashCommand) in
  // Do what you need to do with incoming information
}
```

You can return a `String` if you want, or if you want a little more control, you can return a `SlashCommandResponse`

```swift
router.post(SlashCommand.self, at: "queue") { (req, slashCommand) -> Future<SlashCommandResponse> in
  // Do what you need to do with incoming information
  
  return SlashCommandResponse(responseType: .ephemeral, text: "Your slash command works!")
}
```
The default response type is `.ephemeral`.

## Bot Client

Registering your client
```swift
if let verificationToken = Environment.get("SLACK_VERIFICATION_TOKEN"),
    let botToken = Environment.get("SLACK_BOT_TOKEN") {
    let slackService = Slack(verificationToken: verificationToken, slackBotToken: botToken)
    services.register(slackService, as: SlackProvider.self)
}
```

Creating a client
```swift
let slackClient = try req.make(SlackProvider.self)
```

Opening up IM channels
```swift
return try slackClient.openIM(with: userId, on: req)
```

Sending messages to a chat
```swift
return try slackClient.send(message: "The restroom is ready for you", to: channelId, on: req)
```
