//
//  UserListProtocol.swift
//  AB
//
//  Created by LaxmiPrasad Sahu on 27/11/18.
//  Copyright © 2018 C1X. All rights reserved.
//

import Foundation
import UIKit

protocol UserListViewProtocol: class {
    var presenter: UserListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    //    func showPosts(with posts: [PostModel])
    //    func showError()
    //    func showLoading()
    //    func hideLoading()
}

protocol UserListWireFrameProtocol: class {
    static func createUserListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    //func presentPostDetailScreen(from view: PostListViewProtocol, forPost post: PostModel)
}

protocol UserListPresenterProtocol: class {
    var view: UserListViewProtocol? { get set }
    var interactor: UserListInteractorInputProtocol? { get set }
    var wireFrame: UserListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    //    func viewDidLoad()
    //    func showPostDetail(forPost post: PostModel)
}

protocol UserListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    //    func didRetrievePosts(_ posts: [PostModel])
    //    func onError()
}

protocol UserListInteractorInputProtocol: class {
    var presenter: UserListInteractorOutputProtocol? { get set }
    var localDatamanager: UserListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: UserListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    //    func retrievePostList()
}

protocol UserListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol UserListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: UserListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    //    func retrievePostList()
}

protocol UserListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    //    func onPostsRetrieved(_ posts: [PostModel])
    //    func onError()
}

protocol UserListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    //    func retrievePostList() throws -> [Post]
    //    func savePost(id: Int, title: String, imageUrl: String, thumbImageUrl: String) throws
}
