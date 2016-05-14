# iPhone Software Engineering Assignment <del>1</del> 2 
## RMIT Course: COSC2471 Semester 1 2016
## Fraud Bank, the iOS app 

#### Basic useful feature list:

* Users can login
* Users can manager multiple bank accounts under the same user/pass combo 
* Minimal UI to keep everything lean and bold


#### Data Structures

* Repositories
* Singleton Service
* Core Data as an "ORM"<sup>(well it tries to be one)</sup>


Not relevant anymore

<del>
~~

All models are hashable, to avoid duplicates as much as possible as they are stored in (Hash) Sets:+1:

i.e they implement the Swift "Hashable" interface. Example

```swift
import Foundation

class BankAccount: Hashable {
var id: CUnsignedLong

var balance: Double

var friendlyName: String

//The id of the user that owns this account
var owner: CUnsignedLong

init(id: CUnsignedLong, balance: Double, ownerId: CUnsignedLong, friendName: String) {
self.id = id
self.balance = balance
self.owner = ownerId
self.friendlyName = friendName
}


var hashValue: Int {
get {
return self.id.hashValue
}
}
}


func ==(lhs: BankAccount, rhs: BankAccount) -> Bool {
return lhs.id == rhs.id
}
});
```

</del>