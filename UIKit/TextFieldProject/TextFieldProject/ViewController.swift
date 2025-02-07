//
//  ViewController.swift
//  TextFieldProject
//
//  Created by mayank gour on 23/01/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var textFieldOne: UITextField!
    
    @IBOutlet weak private var textFieldTwo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureTapGesture()
        // Do any additional setup after loading the view.
    }
    
    private func configureTextFields()
    {
        textFieldOne.delegate = self
        textFieldTwo.delegate = self
        textFieldTwo.isSecureTextEntry = true
    }
    private func configureTapGesture()
    {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        tapGesture.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapGesture)
    }
    @objc func handleTap()
    {
//        print("Tapped...")
        view.endEditing(true)
    }
    @IBAction func didLoginTapped(_ sender: Any) {
        print(textFieldOne.text! + " " + textFieldTwo.text!)
        view.endEditing(false)
    }
    
}

extension ViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // when return of keyboard is called this function is triggered
        if textField == textFieldOne {
            textFieldTwo.becomeFirstResponder()
            textFieldOne.resignFirstResponder()
        }
        else if textField == textFieldTwo {
            textFieldTwo.resignFirstResponder()
        }
        
        guard let textValue = textField.text, !textValue.isEmpty else {
            print("No value")
            return true }
        print(textValue)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // whenever there is end of editing the textField this function calls
        print(textField.text!)
        textField.resignFirstResponder()
    }
}

