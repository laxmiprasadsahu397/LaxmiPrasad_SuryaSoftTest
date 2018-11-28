//
//  UserListWireFrame.swift
//  LaxmiPrasad_SuryaSoft_Test
//
//  Created by LaxmiPrasad Sahu on 27/11/18.
//  Copyright © 2018 C1X. All rights reserved.
//

import Foundation
import UIKit

class UserListWireFrame: UserListWireFrameProtocol {
    
    class func createUserListModule(window: UIWindow) {
         let navController = registrationStoryboard.instantiateViewController(withIdentifier: "UserListID")
        if let view = navController as? UserListView {
            let rootWireframe = RootWireframe()
            let presenter: UserListPresenterProtocol & UserListInteractorOutputProtocol = UserListPresenter()
            let interactor: UserListInteractorInputProtocol & UserListRemoteDataManagerOutputProtocol = UserListInteractor()
            let localDataManager: UserListLocalDataManagerInputProtocol = UserListLocalDataManager()
            let remoteDataManager: UserListRemoteDataManagerInputProtocol = UserListRemoteDataManager()
            let wireFrame: UserListWireFrameProtocol = UserListWireFrame()
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            let navigation = rootWireframe.navigationControllerFromWindow(window: window)
            navigation.setViewControllers([view], animated: true)
            window.rootViewController = navigation
        }
    }
    
    static var registrationStoryboard: UIStoryboard {
        return UIStoryboard(name: "UserList", bundle: Bundle.main)
    }
}
