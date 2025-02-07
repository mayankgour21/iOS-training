//
//  ViewController.swift
//  DatePicker
//
//  Created by mayank gour on 24/01/25.
//

import UIKit

class ViewController: UIViewController {

    
    private var datePicker : UIDatePicker?
    @IBOutlet weak private var dateTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatePicker()
        // Do any additional setup after loading the view.
    }
    private func configureDatePicker()
    {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        view.addSubview(datePicker!)
        datePicker!.date = Date()
        dateTimeLabel.text = "Pick a Date"
        datePicker!.locale = .current
        datePicker!.preferredDatePickerStyle = .wheels
        datePicker!.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }
    
    @objc
    func datePickerValueChanged()
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let date = dateFormatter.string(from: datePicker!.date)
        dateTimeLabel?.text = date
    }
    @IBSegueAction func changeToCustomViewController(_ coder: NSCoder) -> UIViewController? {
        
        return <#UIViewController(coder: coder)#>
    }
    func customDatePicker()
    {
        
    }
    @IBAction func changeDatePickerStyle(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: datePicker!.preferredDatePickerStyle = .wheels
        case 1: datePicker!.preferredDatePickerStyle = .compact
        case 2: datePicker!.preferredDatePickerStyle = .inline
        case 3: customDatePicker()
        default: break
        }
    }
    
}

