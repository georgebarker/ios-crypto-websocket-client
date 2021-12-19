# iOS Crypto WebSocket Client

A work-in-progress sample iOS app using WebSockets to provide live prices for cryptocurrencies in a list and detailed view.  

## To do list
- [X] Create list view with test data
- [X] Hook up to WebSocket API
- [ ] Format for the correct tick size ($250.5 -> $250.50), requires tick size from the API because there are cryptocurrencies with a tick size > 2
- [ ] Use the data from the WebSocket API to populate the list
- [ ] Create detailed view with test data
- [ ] Loading list on first time behaviour
- [ ] Reloading list behaviour (swipe down to reload, loading indicator)
- [ ] Handle error from the network
- [ ] List search (Swipe down to reveal search, like in the iOS settings app)
- [ ] Filtering and sorting
- [ ] Last updated timestamp
- [ ] Use the WebSocket server over wss (WebSocket Secure) and remove the exception for non-secure on localhost in Info.plist

## Screenshots
### List view with test data
![List view with test data](screenshots/ListViewScreenshot.png)
