//
//  UserListInteractor.swift
//  AB
//
//  Created by LaxmiPrasad Sahu on 27/11/18.
//  Copyright © 2018 C1X. All rights reserved.
//

import Foundation

class UserListInteractor: UserListInteractorInputProtocol {
    
    weak var presenter: UserListInteractorOutputProtocol?
    var localDatamanager: UserListLocalDataManagerInputProtocol?
    var remoteDatamanager: UserListRemoteDataManagerInputProtocol?
}
extension UserListInteractor: UserListRemoteDataManagerOutputProtocol {
    
}
