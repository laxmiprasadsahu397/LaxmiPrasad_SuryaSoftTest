//
//  UserListView.swift
//  LaxmiPrasad_SuryaSoft_Test
//
//  Created by LaxmiPrasad Sahu on 27/11/18.
//  Copyright © 2018 C1X. All rights reserved.
//

import UIKit

class UserListView: UIViewController {

    @IBOutlet weak var userInfoTableView: UITableView!
    var presenter: UserListPresenterProtocol?
    var userList: Array<Item>? {
        didSet {
            DispatchQueue.main.async {
            self.userInfoTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userInfoTableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if let emailId = UserDefaults.standard.string(forKey: "IsEmailAvailable")  {
          self.presenter?.userTappedSubmit(withEmail: emailId)
        } else {
            let aleart = AleartController()
            aleart.delegate = self
            aleart.showAlartController(viewController: self, title: "Please enter your email address", message: "", placeholder: "Email")
        }
    }

}
extension UserListView: UITableViewDataSource {
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = userList?.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell
        cell?.lbl_name.text = self.userList?[indexPath.row].firstName
        cell?.lbl_emailId.text = self.userList?[indexPath.row].emailID
        if let imageUrlString = self.userList?[indexPath.row].imageURL {
            
        if let url = URL(string: imageUrlString) {
            DispatchQueue.global().async {
        let data = try? Data(contentsOf: url)
                if data != nil {
            DispatchQueue.main.async {
        cell?.img_Profile.image = UIImage(data: data!)
            }
                }
           }
         }
        }
        
        return cell!
    }
}
extension UserListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
extension UserListView: AleartControllerProtocol{
    func updateTextFieldValue(text: String) {
        guard text != "" else {
         return
        }
        guard ValidateEmail().isValid(text) else {
            return
        }
        UserDefaults.standard.set(text, forKey: "IsEmailAvailable")
        self.presenter?.userTappedSubmit(withEmail: text)
    }
    
}
extension UserListView: UserListViewProtocol{
    
    func didRetrieveUserData(_ userItemList: [Item]) {
      self.userList = userItemList
    }
    func showUserList(with userData: UserListResponse) {
        guard let userList = userData.items else { return  }
     self.userList = userList
    }

    func showError() {
        
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func showNetWorkError() {
        
    }
    
}
