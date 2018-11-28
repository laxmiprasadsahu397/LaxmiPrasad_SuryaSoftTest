//
//  AleartController.swift
//  LaxmiPrasad_SuryaSoft_Test
//
//  Created by LaxmiPrasad Sahu on 27/11/18.
//  Copyright © 2018 C1X. All rights reserved.
//

import UIKit


protocol AleartControllerProtocol {
    func updateTextFieldValue(text: String)
}
class AleartController {

    var delegate:AleartControllerProtocol?
    
    func showAlartController(viewController: UIViewController,title : String?, message :String?, placeholder:String?) {
        
        let alert = UIAlertController(title: title!, message: message!, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Submit", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            if textField.text != "" {
                self.delegate?.updateTextFieldValue(text: textField.text!)
            } else {
             self.delegate?.updateTextFieldValue(text: "")
            }
        }
        let cancelaction = UIAlertAction(title: "Cancel", style: .cancel) { (alertAction) in
            
        }
        alert.addTextField { (textField) in
            textField.placeholder = placeholder!
        }
        alert.addAction(action)
        alert.addAction(cancelaction)
        viewController.present(alert, animated: true, completion: nil)
    }
}
