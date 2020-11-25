//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Yeliz Keçeci on 24.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!

    var images: [UIImage] = [
        UIImage(named: "mutluluk")!,
        UIImage(named: "manzara")!,
        UIImage(named: "love")!,
        UIImage(named: "tree")!
    ]
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePicture))
        imageView.addGestureRecognizer(gestureRecognizer)
        imageView.layer.cornerRadius = 10.0
    }

    @objc func changePicture(){
        
        if selectedIndex >= (images.count - 1){
            selectedIndex = 0
            selectImage(at:selectedIndex)
        }
        else {
            selectedIndex += 1
            selectImage(at:selectedIndex)
        }
    }
    
    func selectImage(at index: Int) {
        imageView.image = images[index]
        myLabel.text = "Manzara"
    }
    
    @IBAction func backClicked(_ sender: Any) {
        
        if selectedIndex == 0 {
            selectedIndex = images.count
        }
        
        selectedIndex -= 1
        imageView.image = images[selectedIndex]
        
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        
        selectedIndex += 1
        imageView.image = images[selectedIndex % images.count]
        
    }
}

