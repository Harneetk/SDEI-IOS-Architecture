/* 
Copyright (c) 2018 smartData

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
import UIKit

final class User: Codable {
	var name : String?
	var email : String?
	var userId : String?
	var password : String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case email = "email"
        case userId = "id"
        case password = "password"
    }
    
    init(name: String, email: String, userId: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
        self.userId = userId
    }
    
    required init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            email = try values.decodeIfPresent(String.self, forKey: .email)
            password = try values.decodeIfPresent(String.self, forKey: .password)
            userId = try values.decodeIfPresent(String.self, forKey: .userId)
    }

///**
//    Returns an array of models based on given dictionary.
//
//    Sample usage:
//    let user = User.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
//
//    - parameter array:  Array from JSON dictionary.
//
//    - returns: Array of User Instances.
//*/
//    public class func modelsFromDictionaryArray(array:Array<Dictionary<String,Any>>) -> [User]
//    {
//        var models:[User] = []
//        for item in array
//        {
//            if let model = User(dictionary: item) {
//                models.append(model)
//            }
//        }
//        return models
//    }
//
///**
//    Constructs the object based on the given dictionary.
//
//    Sample usage:
//    let user = User(someDictionaryFromJSON)
//
//    - parameter dictionary:  Dictionary<String,Any> from JSON.
//
//    - returns: User Instance.
//*/
//    required public init?(dictionary: Dictionary<String,Any>) {
//
//        name = dictionary["name"] as? String ?? ""
//        email = dictionary["email"] as? String ?? ""
//        id = dictionary["id"] as? Int ?? 0
//        pasword = dictionary["pasword"] as? String ?? ""
//    }
//
//
///**
//    Returns the dictionary representation for the current instance.
//
//    - returns: NSDictionary.
//*/
//    public func dictionaryRepresentation() -> Dictionary<String,Any> {
//
//        var dictionary = Dictionary<String,Any>()
//
//        dictionary["name"] = self.name
//        dictionary["email"] = self.email
//        dictionary["id"] = self.id
//        dictionary["pasword"] = self.pasword
//
//        return dictionary
//    }

}
