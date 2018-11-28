//
//  UserListProtocol.swift
//  LaxmiPrasad_SuryaSoft_Test
//
//  Created by LaxmiPrasad Sahu on 27/11/18.
//  Copyright © 2018 C1X. All rights reserved.
//

import Foundation
import UIKit

protocol UserListViewProtocol: class {
    var presenter: UserListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
        func showUserList(with userData: UserListResponse)
        func showError()
        func showLoading()
        func hideLoading()
        func showNetWorkError()
    func didRetrieveUserData(_ userItemList: [Item])
}

protocol UserListWireFrameProtocol: class {
    static func createUserListModule(window: UIWindow)
    // PRESENTER -> WIREFRAME
}

protocol UserListPresenterProtocol: class {
    var view: UserListViewProtocol? { get set }
    var interactor: UserListInteractorInputProtocol? { get set }
    var wireFrame: UserListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
        func userTappedSubmit(withEmail email: String)
}

protocol UserListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
        func didRetrieveUserData(_ userData: UserListResponse)
        func onError()
     func didRetrieveUserData(_ userItemList: [Item])
}

protocol UserListInteractorInputProtocol: class {
    var presenter: UserListInteractorOutputProtocol? { get set }
    var localDatamanager: UserListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: UserListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
        func retrieveUserList(withEmail email: String)
}

protocol UserListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: UserListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
        func retrieveUserList(withEmail email: String)
}

protocol UserListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
        func onUserRetrieved(_ userData: UserListResponse)
        func onError()
}

protocol UserListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
        func retrieveUserList() -> [Item]
    //    func saveUserList(id: Int, title: String, imageUrl: String, thumbImageUrl: String) throws
}
