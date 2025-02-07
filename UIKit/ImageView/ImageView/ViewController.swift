//
//  ViewController.swift
//  ImageView
//
//  Created by mayank gour on 27/01/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    var img : UIImage = UIImage(named: "kobe_bryant")!
    var img1 : UIImage = UIImage(named: "chef")!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = img
        imageView.contentMode = .scaleToFill
//        imageView.animationImages = [img1,img]
//        imageView.animationDuration = 2
//        imageView.startAnimating()
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapChangeImage))
        
        imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func onTapChangeImage() {
        switch imageView.image {
        case img : imageView.image = img1
        case img1 : imageView.image = img
        default: break
        }
    }

}

