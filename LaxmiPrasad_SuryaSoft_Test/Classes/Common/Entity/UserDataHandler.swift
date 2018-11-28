//
//  UserDataHandler.swift
//  LaxmiPrasad_SuryaSoft_Test
//
//  Created by LaxmiPrasad Sahu on 27/11/18.
//  Copyright © 2018 C1X. All rights reserved.
//

import Foundation
import CoreData

class UserDataHandler: BAManagedObject {
    
    class func addOrUpdateUserResponseEntity(WithEmailId email: String?, fname: String?, lname: String?, imageURL: String?)
    {
        var userEntity = fetchUserEntity(WithEmailId: email)
        if userEntity == nil
        {
            userEntity = NSEntityDescription.insertNewObject(forEntityName: "UserListEntity", into: BAManagedObject.getContext()) as? UserListEntity
            
        }
        userEntity?.emailId = email
        userEntity?.firstName = fname
        userEntity?.lastName = lname
        userEntity?.imageUrl = imageURL
        
        BAManagedObject.saveContext()
        
    }
    
    class func fetchUserEntity(WithEmailId emailId: String?) -> UserListEntity?
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserListEntity")
        let predicate = NSPredicate(format:"emailId = %d",emailId!)
        fetchRequest.predicate = predicate
        var userEntities : [UserListEntity]?
        do
        {
            userEntities = try super.getContext().fetch(fetchRequest) as? [UserListEntity]
        }
        catch
        {
            
        }
        if userEntities!.count > 0
        {
            return userEntities?[0]
        }
        
        return nil
        
    }
    
    class func insertUserResponseIntoUserListResponseEntity(_ userResponse : UserListResponse?)
    {
        guard let userItem = userResponse?.items else { return  }
        
        for item in userItem {
        UserDataHandler.addOrUpdateUserResponseEntity(WithEmailId: item.emailID, fname: item.firstName, lname: item.lastName, imageURL: item.imageURL)
        }
    }
    
    class func fetchAllFromUserEntity() -> [UserListEntity] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserListEntity")
        
        do {
            let uesrList = try super.getContext().fetch(fetchRequest) as! [UserListEntity]
            return uesrList
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
        
    }
}
