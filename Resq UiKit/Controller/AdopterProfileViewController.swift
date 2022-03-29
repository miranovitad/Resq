//
//  AdopterProfileViewController.swift
//  Resq UiKit
//
//  Created by Refa Satya Pramudhito on 19/07/21.
//

import UIKit

class AdopterProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            //Harus ada disetiap Cell makanya diluar
            let cellNotification = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
        // if disini
        if indexPath.row == 0 {
        cellNotification.tableViewLabel.text = "Notification"
            cellNotification.tableViewLogo.image = UIImage(systemName: "bell.fill")
            
        }
        else if indexPath.row == 1{
            cellNotification.tableViewLabel.text = "Account"
            cellNotification.tableViewLogo.image = UIImage(systemName: "person.circle.fill")
        }
        else if indexPath.row == 2{
            cellNotification.tableViewLabel.text = "Help"
            cellNotification.tableViewLogo.image = UIImage(systemName: "questionmark.circle.fill")
        }
        else if indexPath.row == 3{
            cellNotification.tableViewLabel.text = "About"
            cellNotification.tableViewLogo.image = UIImage(systemName: "info.circle.fill")
        }
            return cellNotification
        
//        } else (punya XIB sendiri)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Pindah Halaman
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: "Notification", bundle: nil)
            guard let Settings = storyboard.instantiateViewController(withIdentifier: "NotificationViewController") as? NotificationViewController else {fatalError("Failed on getting the Page")}
                    tableView.deselectRow(at: indexPath, animated: true)
                    self.navigationController?.pushViewController(Settings, animated: true)
//            self.present(Settings, animated: true, completion: nil)
        }
        else if indexPath.row == 1 {
            let storyboard = UIStoryboard(name: "Account", bundle: nil)
            guard let Settings = storyboard.instantiateViewController(withIdentifier: "AccountViewController") as? AccountViewController else
            {fatalError("Failed on getting the Page")}
                    tableView.deselectRow(at: indexPath, animated: true)
                    self.navigationController?.pushViewController(Settings, animated: true)
//            self.present(Settings, animated: true, completion: nil)
        }
        else if indexPath.row == 2 {
            let storyboard = UIStoryboard(name: "Help", bundle: nil)
            guard let Settings = storyboard.instantiateViewController(withIdentifier: "HelpViewController") as? HelpViewController else {fatalError("Failed on getting the Page")}
                    tableView.deselectRow(at: indexPath, animated: true)
                    self.navigationController?.pushViewController(Settings, animated: true)
//            self.present(Settings, animated: true, completion: nil)
        }
        else if indexPath.row == 3 {
            let storyboard = UIStoryboard(name: "AboutUs", bundle: nil)
            guard let Settings = storyboard.instantiateViewController(withIdentifier: "AboutUsViewController") as? AboutUsViewController else {fatalError("Failed on getting the Page")}
                    tableView.deselectRow(at: indexPath, animated: true)
                    self.navigationController?.pushViewController(Settings, animated: true)
//            self.present(Settings, animated: true, completion: nil)
        }
    }
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableViewCell")
        // Do any additional setup after loading the view.
    }
}

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 4
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 1{
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "Hello World!"
//        return cell
//        }
//
//
//}
