//
//  ViewController.swift
//  camera
//
//  Created by Liellison Menezes on 22/09/19.
//  Copyright © 2019 Liellison Menezes. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imagemView: UIImageView!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func CameraButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagepicker = UIImagePickerController()
            imagepicker.delegate = self
            imagepicker.allowsEditing = true
            imagepicker.sourceType = UIImagePickerController.SourceType.camera
            self.present(imagepicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func GaleriaButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let galeria = UIImagePickerController()
            galeria.delegate = self
            galeria.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(galeria, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        
        dismiss(animated: true)
        imagemView.image = image
        self.image = image
    }
}

