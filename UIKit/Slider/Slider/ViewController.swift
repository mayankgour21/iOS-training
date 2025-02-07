//
//  ViewController.swift
//  Slider
//
//  Created by mayank gour on 24/01/25.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak private var sliderTextField: UITextField!
    
    @IBOutlet weak private var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
    }
    
    private func configure()
    {
//        sliderTextField.inputAccessoryView = slider
        sliderTextField.placeholder = "Move Slider"
        sliderTextField.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap))
        view.addGestureRecognizer(tapGesture)
//        slider.addTarget(self, action: #selector(slideValue), for: .valueChanged)
    }
    
    @objc
    func onTap()
    {
        view.endEditing(false)
    }
//    @objc
//    func slideValue()
//    {
//        sliderTextField.text = String(format: "%.2f", slider.value)
//    }
//    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if let text = textField.text, !text.isEmpty
        {
            guard let value = Int(text) else
            {
                print("Not a integer")
                return true
            }
            
            if value >= 1 && value <= 10
            {
                print("Value changes from \(Int(slider.value)) to \(value)")
                slider.value = Float(value)
            }
            else
            {
                print("Not between the range of 1 to 10, input value is : \(value)")
            }
        }
        else
        {
            print("Empty Value")
        }
        textField.resignFirstResponder()
        return true
    }

    @IBAction func sliderBar(_ sender: Any) {
        sliderTextField.text = String(Int(slider.value))
    }
    
}

