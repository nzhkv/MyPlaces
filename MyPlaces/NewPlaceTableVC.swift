//
//  NewPlaceTableVC.swift
//  MyPlaces
//
//  Created by Nikolay Zhukov on 16.04.2023.
//

import UIKit

class NewPlaceTableVC: UITableViewController {
    
    var newPlace = Place()
    var imageIsChanged = false

    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var imageOfPlace: UIImageView!
    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var type: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.newPlace.savePlaces()
        }
        saveBtn.isEnabled = false
        placeName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let cameraIcon = UIImage(named: "camera")
            let photoIcon = UIImage(named: "photo")
            let alertSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(sourse: .camera)
            }
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(sourse: .photoLibrary)
            }
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            photo.setValue(photoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            alertSheet.addAction(camera)
            alertSheet.addAction(photo)
            alertSheet.addAction(cancel)
            present(alertSheet, animated: true)
        } else {
            view.endEditing(true )
        }
    }
    
//    func saveNewPlace() {
//        var image: UIImage?
//        if imageIsChanged {
//            image = imageOfPlace.image
//        } else {
//            image = UIImage(named: "imagePlaceholder")
//        }
//        newPlace = Place(name: placeName.text!,
//                         location: location.text,
//                         type: type.text,
//                         image: image,
//                         restImage: nil)
//    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}

extension NewPlaceTableVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged() {
        if placeName.text?.isEmpty == false {
            saveBtn.isEnabled = true
        } else {
            saveBtn.isEnabled = false
        }
    }
}

extension NewPlaceTableVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(sourse: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourse) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = sourse
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageOfPlace.image = info[.editedImage] as? UIImage
        imageOfPlace.contentMode = .scaleAspectFill
        imageOfPlace.clipsToBounds = true
        imageIsChanged = true
        dismiss(animated: true)
    }
}
