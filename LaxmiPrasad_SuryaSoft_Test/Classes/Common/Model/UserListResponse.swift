//
//  UserListResponse.swift
//  LaxmiPrasad_SuryaSoft_Test
//
//  Created by LaxmiPrasad Sahu on 27/11/18.
//  Copyright © 2018 C1X. All rights reserved.
//

import Foundation

class UserListResponse: Codable {
    let items: [Item]?
    
    init(items: [Item]?) {
        self.items = items
    }
}

class Item: Codable {
    let emailID, lastName: String?
    let imageURL: String?
    let firstName: String?
    
    enum CodingKeys: String, CodingKey {
        case emailID = "emailId"
        case lastName
        case imageURL = "imageUrl"
        case firstName
    }
    
    init(emailID: String?, lastName: String?, imageURL: String?, firstName: String?) {
        self.emailID = emailID
        self.lastName = lastName
        self.imageURL = imageURL
        self.firstName = firstName
    }
}
