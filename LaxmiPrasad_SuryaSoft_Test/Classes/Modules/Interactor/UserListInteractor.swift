//
//  UserListInteractor.swift
//  LaxmiPrasad_SuryaSoft_Test
//
//  Created by LaxmiPrasad Sahu on 27/11/18.
//  Copyright © 2018 C1X. All rights reserved.
//

import Foundation

class UserListInteractor: UserListInteractorInputProtocol {
    
    weak var presenter: UserListInteractorOutputProtocol?
    var localDatamanager: UserListLocalDataManagerInputProtocol?
    var remoteDatamanager: UserListRemoteDataManagerInputProtocol?
    
    func retrieveUserList(withEmail email: String) {
        let userData = self.localDatamanager?.retrieveUserList()
        if userData!.count > 0 {
          self.presenter?.didRetrieveUserData(userData!)
        } else {
        self.remoteDatamanager?.retrieveUserList(withEmail: email)
        }
    }
}
extension UserListInteractor: UserListRemoteDataManagerOutputProtocol {
    func onUserRetrieved(_ userData: UserListResponse) {
       self.presenter?.didRetrieveUserData(userData)
    }
    
    func onError() {
      self.presenter?.onError()
    }    
    
}
