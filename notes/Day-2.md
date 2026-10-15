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
API is a middleware between client and server to communicate using Set of rules.It handle Request/Response task.\
** Common HTTP methods: **
- GET — Get information.
- POST — Create or submit information.
- PUT — Update information.
- PATCH - Apply Partial Modification  
- DELETE — Delete information.\
Each HTTP Request consist of
 * URL — Where to send the request.
 * HTTP Method — What action to perform (GET, POST, PUT, DELETE).
 * Headers — Additional information (Accept,Authorization and connection)
  Accept meand what format the client will accept, Authorization carries a token to Authenticate a Request and Connection keeping the connection open for reuse rather than closing it immediately after a response.
 * Parameters — Extra values used to specify or filter the requested data.
 * Body — Data sent with the request, usually for methods like POST or PUT
Each HTTP Response Consist of
 * Status line- Request Succeeded/Failed. 2** - OK, 4** - messed up somewhere and 5** - server broken.
 * Response Header -Content type,number of lines and all other info
 * Response Body - the actual data is present here which server is sending
Stateless means Every Request/Response is independent from previous/any commuincation. the server does not automatically remember the previous request when processing a new request.so in each request you should include relevant necessary information.
