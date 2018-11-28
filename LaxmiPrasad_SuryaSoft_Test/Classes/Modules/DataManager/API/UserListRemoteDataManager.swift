//
//  UserListRemoteDataManager.swift
//  LaxmiPrasad_SuryaSoft_Test
//
//  Created by LaxmiPrasad Sahu on 27/11/18.
//  Copyright © 2018 C1X. All rights reserved.
//

import Foundation

class UserListRemoteDataManager: UserListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: UserListRemoteDataManagerOutputProtocol?
    
    func retrieveUserList(withEmail email: String) {
        var param = [String:Any]()
        param["emailId"] = email
        let endpoint = "http://surya-interview.appspot.com/list"
        guard let endpointUrl = URL(string: endpoint) else {
            return
        }
        do {
            let data = try JSONSerialization.data(withJSONObject: param, options: [])
            var request = URLRequest(url: endpointUrl)
            request.httpMethod = "POST"
            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error -> Void in
                
                print(String(data: data!, encoding: .utf8) ?? "")
                let userListResponse = try? JSONDecoder().decode(UserListResponse.self, from: data!)
                guard userListResponse != nil else {
                    self.remoteRequestHandler?.onError()
                    return
                }
                UserDataHandler.insertUserResponseIntoUserListResponseEntity(userListResponse)
                self.remoteRequestHandler?.onUserRetrieved(userListResponse!)
            })
            task.resume()
            
            
        }catch{
        }
    }
}
