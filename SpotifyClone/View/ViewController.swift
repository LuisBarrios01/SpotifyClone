//
//  ViewController.swift
//  SpotifyClone
//
//  Created by MAC37 on 18/05/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTappedLogin(_ sender: Any) {
        let email = textFieldEmail.text!
        let password = textFieldPassword.text!
        
        login(email: email, password: password)
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            authResult, error in
            
            //si sucede error porque no haya un usuario con esos datos
            //pasar a registrarlos, sin embargo, no es recomendable porque por
            //cualquier error puede llamar a la función registro
            if error != nil {
                self.register(email: email, password: password)
            } else {
                
            }
            
        }
    }
    
    func register(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) {
            authResult, error in
            //todo esta bien si es vacio
            if error == nil {
                
            }
        }
    }
    
}

