## HTTP
HTTP = HyperText Transfer Protocol
It is a set of rules that allows your browser and a web server to communicate with each other.

html
The root element. The other HTML elements are placed inside it.  
head
Contains information about the page, such as its title, character encoding and links to CSS files. Most of its content is not displayed directly on the page.  
title
Sets the name displayed in the browser tab.  
body Contains the content visitors see, such as headings, paragraphs, images, links and buttons. 
Tag tell the browser what kind of element to create.Some elements, such as "img" and "br", do not need closing tags.  
opening and closing tag forms the element. target="_blank" -- To open the destination in a new tab.

## API
API is a middleware between client and server to communicate using Set of rules.It handle Request/Response task.

**Common HTTP methods:**
- GET — Get information.
- POST — Create or submit information.
- PUT — Update information.
- PATCH - Apply Partial Modification  
- DELETE — Delete information.

Each HTTP Request consist of-
 * URL — Where to send the request.
 * HTTP Method — What action to perform (GET, POST, PUT, DELETE).
 * Headers — Additional information (Accept,Authorization and connection)
  Accept means what format the client will accept, Authorization carries a token to Authenticate a Request and Connection keeping the connection open for reuse rather than closing it immediately after a response.
 * Parameters — Extra values used to specify or filter the requested data.
 * Body — Data sent with the request, usually for methods like POST or PUT

Each HTTP Response Consist of
 * Status line- Request Succeeded/Failed. 2** - OK, 4** - messed up somewhere and 5** - server broken.
 * Response Header -Content type,cache control(the response is allowed to save in cache or not ) ,number of lines and all other info
 * Response Body - the actual data is present here which server is sending

Stateless means Every Request/Response is independent from previous/any commuincation.
The server does not automatically remember the previous request when processing a new request.so in each request you should include relevant necessary information.\

**Difference between API and REST-API.** API is a broader 
- API is a general way for components to communicate, whereas a REST API is a type of API that follows REST architectural Constraints.\
- Both of them is used to communicate but differ in their archiutectural style.
- RestApi strictly uses resource based url and HTTP method for performing the action. where as general api uses different designs and communication methods.
* 6 Architectural Constarints *
  - client-server.
  - stateless
  - cachable
  - uniform interface (Resources are accessed using consistent and standard way)
    Think of it like traffic rules. No matter where is you are destination but you must follow traffic rules.
  - Layered System (client communicate through intermediateries like proxies,gateways or load balancer.)
  - code on demand.

Express checks two things to decide which function to execute:  // It is part of node.js
1. HTTP method — What type of request is it? (GET, POST, etc.)
2. URL path — Which endpoint is the client requesting? (/hello, /about, etc.)\
Node.js: Allows us to run JavaScript outside the browser, such as on a server.\
Express.js: A Node.js framework used to create web servers and APIs easily.\
When a client sends a request, Express matches the HTTP method and URL path with the defined route and executes the corresponding function.req contains information about the incoming request, while res is used to send a response back to the client.res.json() sends data in JSON format, while res.send() sends a response such as text.app.listen(PORT) starts the server and allows it to receive requests.\
<img width="1012" height="727" alt="image" src="https://github.com/user-attachments/assets/6f7b9be6-f4c5-4846-8ce3-80cf30019fda" />

# Spotify example
Spotify has a Web API at api.spotify.com
It gives you data about music, artists, albums, tracks, and playlists.
It returns data in JSON format.\
If i want to test how api work request response then i can use web api like spotify,but we need premium.but still from my understanding -Every request needs an OAuth token for authentication, which proves you have permission to access the data. Using Spotify's built-in Console, he shows how to visually build a query by searching for Beyoncé as an artist (using the parameters q=Beyoncé and type=artist), how the console live-updates the cURL command as you type, and how the response comes back as JSON containing her artist ID, follower count, genres, and images. He then demonstrates the chaining pattern: taking that artist ID and plugging it into a new endpoint (/v1/artists/{id}/albums) to fetch all of her albums, and from an album ID you could go further to get its tracks.\
cURL lets you try different API requests just to see what comes back.\
The pipe takes the result of the first command and gives it to the second command.Take what cURL got, and pass it to JQ to make it look nice.\

The long URL	Where you are sending the request (api.spotify.com/v1/search) consist of url ,
q=Beyonce ---->	The search word\
type=artist --->	Only return artists\
-H	"Header" —> extra information sent with the request\
Authorization: Bearer ...----->	The secret token that proves who you are\
The command is telling Spotify: "Search for Beyoncé as an artist, and here is my secret token.
Twilio is a company that gives you APIs to:
- Send text messages (SMS)
- Make phone calls
- Send emails
  
You use one command and a text message is sent. You don't need to know how phone networks work — Twilio handles it.
>curl -X POST "https://api.twilio.com/2010-04-01/Accounts/ACa24....../Messages.json" -H "Content-Type: application/x-www-form-urlencoded" -d "To=%2..........51" -d "From=%..........4" -d "Body=sms_2fa" -u "ACa2413e42fd99..........e5ff:ad594eb39f3f8.........fb2cef1673e"\
With this command i sent a message 
<img width="1465" height="271" alt="Screenshot 2026-10-16 175923" src="https://github.com/user-attachments/assets/3359a84d-df76-4a27-a593-59fa61ab0611" />
curl -X GET "https://api.twilio.com/2010-04-01/Accounts/ACa2413e42fd9.......a87d86e5ff/Messages.json" -u "ACa2413e42fd99...........d86e5ff:ad594.......e9d9fb2cef1673e" | jq
This command is used to get message logs.
| jq -
