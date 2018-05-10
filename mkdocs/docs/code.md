# Code Highlighting

Of course you need syntax highlighting!

### Python

``` python
import tensorflow as tf
```
### JavaScript

``` javascript
window.location.href = 'https://www.mkdocs.com/';
```

### JSON

``` json
{
  "name": "mkdocs-material",
  "version": "0.2.4",
  "description": "A Material Design theme for MkDocs",
  "homepage": "http://squidfunk.github.io/mkdocs-material/",
  "authors": [
    "squidfunk <martin.donath@squidfunk.com>"
  ],
  "license": "MIT",
  "main": "Gulpfile.js",
  "scripts": {
    "start": "./node_modules/.bin/gulp watch --mkdocs",
    "build": "./node_modules/.bin/gulp build --production"
  }
  ...
}
```

### Java

``` java
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
public void postMail( String recipients[ ], String subject, String message , String from) throws MessagingException {
    boolean debug = false;
    Properties props = new Properties();
    props.put("mail.smtp.host", "smtp.example.com");
    Session session = Session.getDefaultInstance(props, null);
    session.setDebug(debug);
    Message msg = new MimeMessage(session);
    InternetAddress addressFrom = new InternetAddress(from);
    msg.setFrom(addressFrom);
    InternetAddress[] addressTo = new InternetAddress[recipients.length];
    for (int i = 0; i < recipients.length; i++) {
        addressTo[i] = new InternetAddress(recipients[i]);
    }
    msg.setRecipients(Message.RecipientType.TO, addressTo);
    msg.addHeader("MyHeaderName", "myHeaderValue");
    msg.setSubject(subject);
    msg.setContent(message, "text/plain");
    Transport.send(msg);
}
```

