//
//  AnimalCategoryTableViewController.swift
//  ChildViewControllerDemo
//
//  Created by Hsiao, Wayne on 2019/10/23.
//  Copyright © 2019 Hsiao, Wayne. All rights reserved.
//

import UIKit

protocol AnimalCategoryTableViewControllerDataSource: class {
    func animal() -> Animal
}

struct AnimalFactory {
    static func instanceWith(name: String) -> Animal? {
        return Animal(rawValue: name)
    }
}

class AnimalCategoryTableViewController: UITableViewController {
    
    weak var animalDataSource: AnimalCategoryTableViewControllerDataSource!
    lazy var animalChanged: (String) -> Void = { [weak self] (animal: String) in
        self?.tableView.reloadData()
    }
    
    var animals = [Animal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let notificationName = Notification.Name("AnimalChaged")
        NotificationCenter.default.addObserver(self, selector: #selector(animalSelected), name: notificationName, object: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let animal = animals[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = animal.symbol
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let index = indexPath.row
        animals.remove(at: index)
        refreshTable()
    }
    
    @objc func animalSelected() {
        animals.append(animalDataSource.animal())
        refreshTable()
    }
    
    func refreshTable() {
        tableView.reloadData()
        guard !animals.isEmpty else {
            return
        }
        let indexPath = IndexPath(row: animals.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
}

extension AnimalCategoryTableViewController {
    static func instance() -> AnimalCategoryTableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "AnimalCategoryTableViewController") as! AnimalCategoryTableViewController
    }
}
