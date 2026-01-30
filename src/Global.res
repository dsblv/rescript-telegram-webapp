/**
 A reference to global Telegram.WebApp object.

 Assumes `<script src="https://telegram.org/js/telegram-web-app.js?59"></script>`
 is connectede beforehand.
 */
@scope(("window", "Telegram")) @val
external telegramWebApp: WebApp.t = "WebApp"
