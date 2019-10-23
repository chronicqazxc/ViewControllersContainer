//
//  AnimalTableViewController.swift
//  ChildViewControllerDemo
//
//  Created by Hsiao, Wayne on 2019/10/23.
//  Copyright © 2019 Hsiao, Wayne. All rights reserved.
//

import UIKit

class AnimalTableViewController: UITableViewController {
    
    let animals = [
        Animal.Cat,
        Animal.Dog,
        Animal.Human
    ]
    
    var selectedAnimal: Animal!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        selectedAnimal = animals.first
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return animals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = animals[indexPath.row].rawValue
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedAnimal = animals[indexPath.row]
        let notificationName = Notification.Name("AnimalChaged")
        NotificationCenter.default.post(name: notificationName, object: nil)
    }

}

extension AnimalTableViewController {
    static func instance() -> AnimalTableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "AnimalTableViewController") as! AnimalTableViewController
    }
}

extension AnimalTableViewController: AnimalCategoryTableViewControllerDataSource {
    func animal() -> Animal {
        return selectedAnimal
    }
}
