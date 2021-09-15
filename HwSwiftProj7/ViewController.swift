//
//  ViewController.swift
//  HwSwiftProj7
//
//  Created by Alex Wibowo on 15/9/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url : String
        
        if navigationController?.tabBarItem.tag == 0 {
            url = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            url = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
                
        
        if let url = URL(string: url) {
            if let data = try? Data(contentsOf: url) {
                parse(data: data)
            }
         }
        
    }
    
    
    
    func parse(data: Data){
        let decoder = JSONDecoder()
        if let decoded = try? decoder.decode(Petitions.self, from: data) {
            petitions = decoded.results
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetitionCell", for: indexPath)
        cell.textLabel?.text = petitions[indexPath.row].title
        cell.detailTextLabel?.text = petitions[indexPath.row].body
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let petitionDetail = PetitionDetailViewController()
        petitionDetail.petition = petitions[indexPath.row]
        
        navigationController?.pushViewController(petitionDetail, animated: true)
    }


}

