//
//  ViewController.swift
//  Dicee with Auto Layout
//
//  Created by Nikola on 8/25/19.
//  Copyright © 2019 Nikola. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    var randomDiceIndex1 = 0
    var randomDiceIndex2 = 0
    
    let backroundView: UIImageView = {
        let backround = UIImageView(image: #imageLiteral(resourceName: "newbackground"))
        backround.contentMode = UIView.ContentMode.scaleAspectFill
        return backround
    }()
    
    let diceLogoContainer: UIView = {
        let dice = UIView()
        //        dice.backgroundColor = .red
        return dice
    }()
    
    let diceLogoImageView: UIImageView = {
        let diceImageView = UIImageView(image: #imageLiteral(resourceName: "diceeLogo"))
        diceImageView.contentMode = UIView.ContentMode.scaleAspectFit
        return diceImageView
    }()
    
    let dice1Container: UIView = {
        let dice = UIView()
        //        dice.backgroundColor = .blue
        return dice
    }()
    
    let dice1ImageView: UIImageView = {
        let dice1Image = UIImageView()
        dice1Image.contentMode = UIView.ContentMode.scaleAspectFit
        return dice1Image
    }()
    
    let dice2Container: UIView = {
        let dice = UIView()
        //        dice.backgroundColor = .green
        return dice
    }()
    
    let dice2ImageView: UIImageView = {
        let dice2Image = UIImageView()
        dice2Image.contentMode = UIView.ContentMode.scaleAspectFit
        return dice2Image
    }()
    
    let rollButtonContainer: UIView = {
        let rollContainer = UIView()
        //        rollContainer.backgroundColor = UIColor.yellow
        return rollContainer
    }()
    
    var rollButton: UIButton = {
        let roll = UIButton()
        roll.setTitleColor(.white, for: .normal)
        roll.setTitle("ROLL", for: .normal)
        roll.layer.cornerRadius = 15
        roll.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        roll.backgroundColor = UIColor.init(red: 245/255, green: 1, blue: 245/255, alpha: 0.1)
        //        roll.backgroundColor = UIColor.orange
        return roll
    }()
    
    
    func addActionToRollButton() {
        rollButton.addTarget(self, action: #selector(updateDiceImages), for: .touchUpInside)
    }
    
    
    @objc func updateDiceImages() {
        
        randomDiceIndex1 = Int.random(in: 0...5)
        randomDiceIndex2 = Int.random(in: 0...5)
        
        dice1ImageView.image = UIImage(named: diceArray[randomDiceIndex1])
        dice2ImageView.image = UIImage(named: diceArray[randomDiceIndex2])
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addActionToRollButton()
        updateDiceImages()
        addSubview()
        setupLayout()
    }
    
    
    func addSubview() {
        [backroundView, dice1Container, dice2Container].forEach { view.addSubview($0) }
        
        backroundView.addSubview(diceLogoContainer)
        backroundView.addSubview(rollButtonContainer)
        diceLogoContainer.addSubview(diceLogoImageView)
        dice1Container.addSubview(dice1ImageView)
        dice2Container.addSubview(dice2ImageView)
        backroundView.addSubview(rollButton)
        rollButtonContainer.addSubview(rollButton)
        view.addSubview(rollButton)
        
        [backroundView, diceLogoContainer, diceLogoImageView, dice1Container, dice1ImageView, dice2Container, dice2ImageView, rollButtonContainer, rollButton].forEach{ ($0).translatesAutoresizingMaskIntoConstraints = false }
        
    }
    
    
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            backroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            backroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            diceLogoContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            diceLogoContainer.centerXAnchor.constraint(equalTo: backroundView.centerXAnchor),
            diceLogoContainer.widthAnchor.constraint(equalTo: backroundView.widthAnchor, multiplier: 1/2),
            diceLogoContainer.heightAnchor.constraint(equalTo: backroundView.heightAnchor, multiplier: 1/6),
            
            diceLogoImageView.centerXAnchor.constraint(equalTo: diceLogoContainer.centerXAnchor),
            diceLogoImageView.centerYAnchor.constraint(equalTo: diceLogoContainer.centerYAnchor),
            diceLogoImageView.heightAnchor.constraint(equalTo: diceLogoContainer.heightAnchor),
            
            dice1Container.heightAnchor.constraint(equalTo: diceLogoContainer.heightAnchor),
            dice1Container.widthAnchor.constraint(equalTo: diceLogoContainer.heightAnchor),
            dice1Container.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -30),
            dice1Container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            dice1ImageView.centerXAnchor.constraint(equalTo: dice1Container.centerXAnchor),
            dice1ImageView.centerYAnchor.constraint(equalTo: dice1Container.centerYAnchor),
            dice1ImageView.heightAnchor.constraint(equalTo: dice1Container.heightAnchor),
            dice1ImageView.widthAnchor.constraint(equalTo: dice1Container.widthAnchor),
            
            dice2Container.heightAnchor.constraint(equalTo: dice1Container.heightAnchor),
            dice2Container.widthAnchor.constraint(equalTo: dice1Container.heightAnchor),
            dice2Container.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 30),
            dice2Container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            dice2ImageView.centerXAnchor.constraint(equalTo: dice2Container.centerXAnchor),
            dice2ImageView.centerYAnchor.constraint(equalTo: dice2Container.centerYAnchor),
            dice2ImageView.heightAnchor.constraint(equalTo: dice2Container.heightAnchor),
            dice2ImageView.widthAnchor.constraint(equalTo: dice2Container.widthAnchor),
            
            rollButtonContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollButtonContainer.bottomAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            rollButtonContainer.heightAnchor.constraint(equalToConstant: 60),
            rollButtonContainer.widthAnchor.constraint(equalToConstant: 120),
            
            rollButton.centerXAnchor.constraint(equalTo: rollButtonContainer.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: rollButtonContainer.centerYAnchor),
            rollButton.widthAnchor.constraint(equalTo: rollButtonContainer.widthAnchor),
            rollButton.heightAnchor.constraint(equalTo: rollButtonContainer.heightAnchor)
        ])
    }
}

