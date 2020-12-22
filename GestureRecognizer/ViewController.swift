//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Yeliz Keçeci on 24.11.2020.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var imageTitleTextField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var imagePicker = UIImagePickerController()
    
    var images: [Image] = [
        Image(title : "mutluluk", image: UIImage(named: "mutluluk")!),
        Image(title : "manzara", image: UIImage(named: "manzara")!),
        Image(title : "love", image: UIImage(named: "love")!),
        Image(title : "tree", image: UIImage(named: "tree")!)
    ]
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePicture))
        imageView.addGestureRecognizer(gestureRecognizer)
        imageView.layer.cornerRadius = 10.0
        
        label.layer.borderWidth = 2.0
        label.layer.cornerRadius = 8
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
        imageView.image = images[index].image
        myLabel.text = images[index].title.capitalized
    }
    
    @IBAction func backClicked(_ sender: Any) {
        
        if selectedIndex == 0 {
            selectedIndex = images.count - 1
            
        } else {
            selectedIndex -= 1
        }
        
        imageView.image = images[selectedIndex].image
        myLabel.text = images[selectedIndex].title
        
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        
        selectedIndex = ((selectedIndex + 1) % images.count )
        print(selectedIndex)
        imageView.image = images[selectedIndex].image
        myLabel.text = images[selectedIndex].title
        
    }
    
    @IBAction func addPhotoClicked(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage,
           let newTitle = imageTitleTextField.text {
            images.append(Image(title: newTitle, image: image))
            dismiss(animated: true, completion: nil)
            imageTitleTextField.text = ""
        }
        
    }
    
}

