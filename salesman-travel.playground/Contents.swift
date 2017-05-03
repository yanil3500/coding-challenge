import UIKit

//A traveling salesman has to visit clients. He got each client's address e.g. "432 Main Long Road St. Louisville OH 43071" as a list.
//
//The basic zipcode format usually consists of two capital letters followed by a white space and five digits. The list of clients to visit was given as a string of all addresses, each separated from the others by a comma, e.g. :
//
//"123 Main Street St. Louisville OH 43071,432 Main Long Road St. Louisville OH 43071,786 High Street Pollocksville NY 56432".
//
//To ease his travel he wants to group the list by zipcode.
//
//Task
//
//The function travel will take two parameters r (list of all clients' addresses) and zipcode and returns a string in the following format:
//
//zipcode:street and town,street and town,.../house number,house number,...
//
//The street numbers must be in the same order as the streets where they belong.
//
//If a given zipcode doesn't exist in the list of clients' addresses return "zipcode:/"
//
//Examples
//r = "123 Main Street St. Louisville OH 43071,432 Main Long Road St. Louisville OH 43071,786 High Street Pollocksville NY 56432"
//
//travel(r, "OH 43071") --> "OH 43071:Main Street St. Louisville,Main Long Road St. Louisville/123,432"
//          SW 43098
//travel(r, "NY 56432") --> "NY 56432:High Street Pollocksville/786"
//
//travel(r, "NY 5643") --> "NY 5643:/"


func travel(_ r: String, zipcode: String) -> String {
    var zips = [String]()
    var addresses = [String]()
    guard zipcode.characters.count == 8 else { return "\(zipcode):/)" }
    r.components(separatedBy: ",").filter { (address) -> Bool in
        return address.contains(zipcode)
        }.joined(separator: " ").components(separatedBy: zipcode).map { (address) -> String in
            address.trimmingCharacters(in: .whitespacesAndNewlines)
        }.filter { (str) -> Bool in
            return str != ""
        }.forEach { (address) in
            print(address)
            zips.append(address.components(separatedBy: " ").first!)
            addresses.append((address.components(separatedBy:" ").dropFirst()).joined(separator: " "))
    }
    
    return "\(zipcode):\(addresses.joined(separator: ","))/\(zips.joined(separator: ","))"
}


//Test Case
var a = travel(["123 Main Street St. Louisville OH 43071,432 Main Long Road St. Louisville OH 43071,786 High Street Pollocksville NY 56432,",
                "54 Holy Grail Street Niagara Town ZP 32908,3200 Main Rd. Bern AE 56210,1 Gordon St. Atlanta RE 13000,",
                "10 Pussy Cat Rd. Chicago EX 34342,10 Gordon St. Atlanta RE 13000,58 Gordon Road Atlanta RE 13000,",
                "22 Tokyo Av. Tedmondville SW 43098,674 Paris bd. Abbeville AA 45521,10 Surta Alley Goodtown GG 30654,",
                "45 Holy Grail Al. Niagara Town ZP 32908,320 Main Al. Bern AE 56210,14 Gordon Park Atlanta RE 13000,",
                "100 Pussy Cat Rd. Chicago EX 34342,2 Gordon St. Atlanta RE 13000,5 Gordon Road Atlanta RE 13000,",
                "2200 Tokyo Av. Tedmondville SW 43098,67 Paris St. Abbeville AA 45521,11 Surta Avenue Goodtown GG 30654,",
                "45 Holy Grail Al. Niagara Town ZP 32918,320 Main Al. Bern AE 56215,14 Gordon Park Atlanta RE 13200,",
                "100 Pussy Cat Rd. Chicago EX 34345,2 Gordon St. Atlanta RE 13222,5 Gordon Road Atlanta RE 13001,",
                "2200 Tokyo Av. Tedmondville SW 43198,67 Paris St. Abbeville AA 45522,11 Surta Avenue Goodville GG 30655,",
                "2222 Tokyo Av. Tedmondville SW 43198,670 Paris St. Abbeville AA 45522,114 Surta Avenue Goodville GG 30655,",
                "2 Holy Grail Street Niagara Town ZP 32908,3 Main Rd. Bern AE 56210,77 Gordon St. Atlanta RE 13000"
    ].joined(), zipcode: "AA 45522")


print(a)






