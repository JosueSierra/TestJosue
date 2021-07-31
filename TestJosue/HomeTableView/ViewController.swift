//
//  ViewController.swift
//  TestJosue
//
//  Created by Josue on 30/07/21.
//

import UIKit
import Toast_Swift

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var titlesText = [NSLocalizedString("DESCRIPTION_ROW_2", comment: ""),
                      NSLocalizedString("DESCRIPTION_ROW_3", comment: "") ]
    var actionSheet:  UIAlertController!
    var photoPicker: UIImagePickerController!
    var tmpImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupAlert()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .camera
    }
    
    func registerCells() {
        tableView.register(UINib.init(nibName: "TextFieldCell", bundle: .main), forCellReuseIdentifier: "TextFieldCell")
        tableView.register(UINib.init(nibName: "GenericCell", bundle: .main), forCellReuseIdentifier: "GenericCell")
    }
    
    func setupAlert() {
        var tmpTitleButton =  NSLocalizedString("TAKE_PHOTO", comment: "")
        if tmpImage != nil { tmpTitleButton = NSLocalizedString("TAKE_PHOTO_AGAIN", comment: "") }
        
        actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cameraOption = UIAlertAction(title: NSLocalizedString("VIEW_PHOTO", comment: ""), style: .default) { _ in
            if self.tmpImage == nil {
                self.view.makeToast(NSLocalizedString("EMPTY_IMAGE", comment: ""))
            }else {
                self.modalShowPhoto()
            }
        }
        let galleryOption = UIAlertAction(title: tmpTitleButton, style: .default) { _ in
            self.present(self.photoPicker, animated: true, completion: nil)
        }
        
        let cancelOption = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        actionSheet.addAction(cameraOption)
        actionSheet.addAction(galleryOption)
        actionSheet.addAction(cancelOption)
    }
    
    func modalShowPhoto() {
        let alert = PhotoModalController(nibName: "ShowPhotoModal", bundle: .main)
        alert.modalPresentationStyle = .overFullScreen
        
        self.present(alert, animated: false) {
            alert.image = self.tmpImage
        }
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as? TextFieldCell {
                cell.txtName.delegate = self
                return cell
                
            }
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GenericCell", for: indexPath) as? GenericCell {
            cell.setData(text: titlesText[indexPath.row])
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            setupAlert()
            switch indexPath.row {
            case 0:
                present(actionSheet, animated: true, completion: nil)
            case 1:
                self.performSegue(withIdentifier: "SEGUE_DETAIL_ROW_3", sender: nil)
            default:
                break
            }
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string.rangeOfCharacter(from: NSCharacterSet.letters) != nil || string == " " {
            return true
        }else {
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .done {
            textField.resignFirstResponder()
        }
        return true
    }
}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        tmpImage = image
        self.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}

