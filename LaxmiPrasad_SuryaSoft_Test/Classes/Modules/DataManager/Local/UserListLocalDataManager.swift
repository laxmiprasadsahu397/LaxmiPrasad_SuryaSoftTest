//
//  UserListLocalDataManager.swift
//  LaxmiPrasad_SuryaSoft_Test
//
//  Created by LaxmiPrasad Sahu on 27/11/18.
//  Copyright © 2018 C1X. All rights reserved.
//

import Foundation

class UserListLocalDataManager: UserListLocalDataManagerInputProtocol {
    func retrieveUserList() -> [Item] {
        var userList = [Item]()
        let userEntituData = UserDataHandler.fetchAllFromUserEntity()
        if userEntituData.count > 0 {
            for item in userEntituData {
                userList.append(Item.init(emailID: item.emailId, lastName: item.lastName, imageURL: item.imageUrl, firstName: item.firstName))
            }
        }
      return userList
    }
    
    
}
