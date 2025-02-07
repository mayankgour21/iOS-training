//
//  ViewController.swift
//  Contacts_TableView
//
//  Created by mayank gour on 28/01/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var names = [
        "Mayank Gour","Nakul Gour","Naman Patel","Aman Gour","Mouly Tiwari","Mayank Gour","Nakul Gour","Naman Patel","Aman Gour","Mouly Tiwari"
    ]
    var images = [
        UIImage(named: "luka"),
        UIImage(named: "lebron"),
        UIImage(named: "kevin"),
        UIImage(named: "steph"),
        UIImage(named: "kobe"),
        UIImage(named: "luka"),
        UIImage(named: "lebron"),
        UIImage(named: "kevin"),
        UIImage(named: "steph"),
        UIImage(named: "kobe")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier:CustomTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension ViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell with row \(indexPath.row) tapped...")
    }
}

extension ViewController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell",for:indexPath) as! CustomTableViewCell
        cell.labelViewCell.text = names[indexPath.row]
        cell.imageViewCell.image = images[indexPath.row]
        return cell
    }
}

