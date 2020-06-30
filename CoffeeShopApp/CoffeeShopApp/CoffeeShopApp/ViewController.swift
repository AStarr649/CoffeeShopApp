//
//  ViewController.swift
//  CoffeeShopApp
//
//  Created by Student on 6/18/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var order = ["Order:"]
    var prices = [0.00]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        orderList.text = "Your Order: "
    }
    
    @IBOutlet weak var orderList: UILabel!
    @IBOutlet weak var cupStack: UIStackView!
    @IBOutlet weak var milkSwitch: UISwitch!
    @IBOutlet weak var iceSwitch: UISwitch!
    @IBOutlet weak var sugarSwitch: UISwitch!
    @IBOutlet weak var decafSwitch: UISwitch!

    @IBAction func addCup(_ sender: UIButton) {
        var message = ""
        var price = 0.00
        let cupImage = UIImageView(image: UIImage(named: "RedCoffeeCup"))
        cupImage.contentMode = .scaleAspectFit

        UIView.animate(withDuration: 0.75, animations: {
            self.cupStack.addArrangedSubview(cupImage)
            self.cupStack.layoutIfNeeded()
        })
        if iceSwitch.isOn{
            message += "Glaceon"
            price += 0.65
        }
        else{
            message += "Flareon"
            price += 0.55
        }
        if milkSwitch.isOn{
            message += ", Milk"
            price += 0.10
        }
        if sugarSwitch.isOn{
            message += ", Sugar"
            price += 0.05
        }
        if decafSwitch.isOn{
            message += ", Decaf"
            price += 0.10
        }
        _ = order.count + 1
        order.append(message)
        prices.append(price)
        for index in 0 ... order.count - 1{
            message = order[index] + String(format: "$%.2f", price)
            orderList.text!.append(message)
        }
    }
    
    @IBAction func removeCup(_ sender: UIButton) {
        var message = ""
        let lastAddedCup = self.cupStack.arrangedSubviews.last
        if let cup = lastAddedCup
        {
            UIView.animate(withDuration: 0.25, animations: {
                self.cupStack.removeArrangedSubview(cup)
                cup.removeFromSuperview()
                self.cupStack.layoutIfNeeded()
            })
        }
        let lastIndex = order.count - 1
        order.remove(at: lastIndex)
        prices.remove(at: lastIndex)
        orderList.text = ""
        for index in 0 ... order.count - 1{
            message = order[index] + String(format: " $%.2f", prices[index])
            orderList.text?.append(message)
        }
    }
    
    @IBAction func doneSale(_ sender: UIButton) {
        var gTotal = 0.00
        for index in prices{
            gTotal += index
        }
        orderList.text = "Your final total is: "
        orderList.text = String(format: " $%.2f", gTotal)
        }
        
    }
