//
//  DynamicTableController.swift
//  TestJosue
//
//  Created by Josue on 30/07/21.
//

import UIKit
import Alamofire

class DynamicTableController: UIViewController {
    
    @IBOutlet weak var dymanicTableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var userInfo: UserInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        getDatasNetwork()
    }
    
    func registerCell() {
        dymanicTableView.register(UINib(nibName: "GraphCell", bundle: .main), forCellReuseIdentifier: "GraphCell")
    }
    
    func getDatasNetwork() {
        self.loadingIndicator.startAnimating()
        AF.request("https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld").responseJSON { response in
            self.loadingIndicator.stopAnimating()
            if response.response?.statusCode == 200 {
                self.userInfo = UserInfo(data: response.value as? [String:Any])
                self.dymanicTableView.reloadData()
            }else {
                self.view.makeToast(NSLocalizedString("ERROR_SERVICE", comment: ""))
            }
            
        }
    }
    
}

extension DynamicTableController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfo?.questions.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GraphCell", for: indexPath) as? GraphCell{
            cell.textLabel?.text = userInfo?.questions[indexPath.row].text
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
