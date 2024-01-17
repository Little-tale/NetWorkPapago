//
//  LanguageViewController.swift
//  NetWorkPapago
//
//  Created by Jae hyung Kim on 1/17/24.
//


import UIKit

let papagoCan = PapagoCanTrans()

class LanguageViewController: UIViewController {
    @IBOutlet var backGroundView: UIView!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         navigationItem.title = "Traslate from"
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)
        ]
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        backGroundView.backgroundColor = .darkGray
        setNavi()
        
        
    }


}
extension LanguageViewController {
    func setNavi() {
        let cancleButton = UIBarButtonItem(image: UIImage(systemName: "x.circle"), style: .plain, target: self, action: #selector(returnView))
        navigationItem.leftBarButtonItem = cancleButton
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    @objc func returnView() {
        dismiss(animated: true)
    }
}

extension LanguageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return papagoCan.can.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        
        print(PapagoLanguageOf.allCases[indexPath.row].rawValue)
        let item = PapagoLanguageOf.allCases[indexPath.row].rawValue
        
        
        
        cell.textLabel?.text = papagoCan.can[item]
        

        
        return cell
    }
    
    
}
