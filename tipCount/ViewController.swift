//
//  ViewController.swift
//  tipCount
//
//  Created by 黃毓皓 on 2016/10/26.
//  Copyright © 2016年 ice elson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputMoney: UITextField!
    @IBOutlet weak var tipPercent: UISlider!
    @IBOutlet weak var totalTip: UILabel!
    @IBOutlet weak var tipPerShow: UILabel!
    @IBOutlet weak var allCost: UILabel!
    @IBOutlet weak var perCost: UILabel!
    @IBOutlet weak var peopleCount: UITextField!
    
    var CrossTotal:Float = 0 //存取totoal 的值
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipPercent.maximumValue = 0.30
        tipPercent.minimumValue = 0.10
       
        tipPercent.setValue(0.2, animated: false)
        
        let i = tipPercent.value  //i maybe is 0.156785494
        
        let test = NSString(format:"%.2f",i)//will get decimal point 2 ex:0.15
        
        tipPerShow.text = String(Int((Float(test as String))!*100)) + "%" // "15%"›
    }

    @IBAction func tipChange(_ sender: UISlider) {
        if inputMoney.text != nil && inputMoney.text != ""{
        let i = tipPercent.value
        let test = NSString(format:"%.2f",i)
        tipPerShow.text = String(Int((Float(test as String))!*100)) + "%"
        
            
            let total = (Float(inputMoney.text!)! * Float(test as String)!)
            totalTip.text = "小費:" + String(total)
            allCost.text = "總共費用(已包括小費):" + String(total + Float(inputMoney.text!)!)
            
            if peopleCount.text != nil && peopleCount.text != "" {
                
                var total2:Float = 0
                total2 = total
                perCost.text = "平均每人總費用:" + String((total2 + Float(inputMoney.text!)!)/Float(peopleCount.text!)!)
            }
        }else{
            print("error")
        }
    }
    
    @IBAction func editPeople(_ sender: UITextField) {
        
        if peopleCount.text != nil && peopleCount.text != "" && inputMoney.text != nil && inputMoney.text != "" {
            
            var total:Float = 0
            total = CrossTotal
            perCost.text = "平均每人總費用:" + String((total + Float(inputMoney.text!)!)/Float(peopleCount.text!)!)
        }
    }
    @IBAction func editEnd(_ sender: UITextField) {
        if inputMoney.text != nil && inputMoney.text != "" {
        let i = tipPercent.value
        let test = NSString(format:"%.2f",i)
        let good = Float(test as String)
        
        
       let total = (Float(inputMoney.text!)! * good!)
        
        let final = NSString(format:"%.2f",total)
        
        totalTip.text = "小費:" + (final as String)
       allCost.text = "總共費用(已包括小費):" + String(total + Float(inputMoney.text!)!)
            
            CrossTotal = total
            if peopleCount.text != nil && peopleCount.text != "" {
                perCost.text = "平均每人總費用:" + String((total + Float(inputMoney.text!)!)/Float(peopleCount.text!)!)
            }
        
        }else{
            print("wrong")
        }
    }
    



}

