//
//  UserListPrsenter.swift
//  AB
//
//  Created by LaxmiPrasad Sahu on 27/11/18.
//  Copyright © 2018 C1X. All rights reserved.
//

import Foundation

class UserListPresenter: UserListPresenterProtocol {
    
    weak var view: UserListViewProtocol?
    var interactor: UserListInteractorInputProtocol?
    var wireFrame: UserListWireFrameProtocol?
}
extension UserListPresenter: UserListInteractorOutputProtocol{
    
}
