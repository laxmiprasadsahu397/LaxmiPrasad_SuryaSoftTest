//
//  UserListPrsenter.swift
//  LaxmiPrasad_SuryaSoft_Test
//
//  Created by LaxmiPrasad Sahu on 27/11/18.
//  Copyright © 2018 C1X. All rights reserved.
//

import Foundation

class UserListPresenter: UserListPresenterProtocol {
    func userTappedSubmit(withEmail email: String) {
        if  Reachability()?.connection != .none {
            self.view?.showLoading()
            self.interactor?.retrieveUserList(withEmail: email)
        } else {
            self.view?.showNetWorkError()
        }
    }
    
    weak var view: UserListViewProtocol?
    var interactor: UserListInteractorInputProtocol?
    var wireFrame: UserListWireFrameProtocol?
}
extension UserListPresenter: UserListInteractorOutputProtocol{
    func didRetrieveUserData(_ userItemList: [Item]) {
        self.view?.didRetrieveUserData(userItemList)
    }
    
    func didRetrieveUserData(_ userData: UserListResponse) {
      self.view?.showUserList(with: userData)
    }
    
    func onError() {
     self.view?.showError()
    }
    
}
