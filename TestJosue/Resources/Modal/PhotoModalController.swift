//
//  PhotoModalController.swift
//  TestJosue
//
//  Created by Cloud on 30/07/21.
//

import UIKit

class PhotoModalController: UIViewController {

    @IBOutlet weak var imgPhoto: UIImageView!
    
    var image: UIImage? {
        didSet{
            imgPhoto.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapView(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
}
