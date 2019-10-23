//
//  ViewController.swift
//  ChildViewControllerDemo
//
//  Created by Hsiao, Wayne on 2019/10/23.
//  Copyright © 2019 Hsiao, Wayne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftContainerView: UIView!
    @IBOutlet weak var rightContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        setupUI()
    }

    func setupUI() {
        let animalList = AnimalListTableViewController.instance()
        let animalCart = AnimalCartTableViewController.instance()
        animalList.view.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        animalCart.view.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        addChild(animalList)
        animalList.didMove(toParent: self)
        animalList.view.translatesAutoresizingMaskIntoConstraints = false
        leftContainerView.addSubview(animalList.view)
        
        let views: [String: Any] = [
        "animalList": animalList.view!,
        "animalCart": animalCart.view!]
        let options: NSLayoutConstraint.FormatOptions = [.alignAllCenterX]
        var constraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[animalList]-0-|", options: options, metrics: nil, views: ["animalList": animalList.view!])
        constraint += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[animalList]-0-|", options: options, metrics: nil, views: views)
        
        animalCart.animalCartDelegate = animalList
        addChild(animalCart)
        animalCart.didMove(toParent: self)
        rightContainerView.addSubview(animalCart.view)
        
        animalCart.view.translatesAutoresizingMaskIntoConstraints = false
        var constraint2 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[animalCart]-0-|", options: options, metrics: nil, views: ["animalCart": animalCart.view!])
        constraint2 += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[animalCart]-0-|", options: options, metrics: nil, views: views)

        NSLayoutConstraint.activate(constraint)
        NSLayoutConstraint.activate(constraint2)
    }
}

