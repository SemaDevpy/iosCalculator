//
//  ViewController.swift
//  calculator
//
//  Created by Syimyk on 9/23/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var firstNumber = ""
    var secondNumber = ""
    var sign = ""
    var signTappedOrNot = false
    var globalResult = 0
    var globalDoubleResult = 0.0
    var posOrNeg = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func digitsTapped(_ sender: UIButton) {
        
        let numberFromUser = sender.currentTitle!
        
        if signTappedOrNot == false{
            if firstNumber.count != 8{
                firstNumber.append(numberFromUser)
                label.text = firstNumber
            }
        }else{
            if secondNumber.count != 8{
                secondNumber.append(numberFromUser)
                label.text = secondNumber
            }
        }
    }
    
    @IBAction func signTapped(_ sender: UIButton) {
        signTappedOrNot = true
    }
    
    
    @IBAction func acTapped(_ sender: UIButton) {
        globalResult = 0
        globalDoubleResult = 0.0
        firstNumber = ""
        secondNumber = ""
        sign = ""
        label.text = "\(globalResult)"
    }
    
    
    @IBAction func minusTapped(_ sender: UIButton) {
        sign = sender.currentTitle!
    }
    
    @IBAction func plusTapped(_ sender: UIButton) {
        sign = sender.currentTitle!
    }
    
    @IBAction func timesTapped(_ sender: UIButton) {
        sign = sender.currentTitle!
    }
    
    @IBAction func divideTapped(_ sender: UIButton) {
        sign = sender.currentTitle!
    }
    
    @IBAction func plusOrMinusTapped(_ sender: UIButton) {
        if signTappedOrNot == false{
            if firstNumber.contains("-"){
                firstNumber.removeFirst()
                label.text = firstNumber
            }else if firstNumber == "",secondNumber == ""{
                if globalResult != 0{
                    if globalResult > 0{
                        globalResult = (0 - globalResult)
                        label.text = "\(globalResult)"
                    }else if globalResult < 0{
                        globalResult = (0 - globalResult)
                        label.text = "\(globalResult)"
                    }
                }
                if globalDoubleResult != 0{
                    if globalDoubleResult > 0{
                        globalDoubleResult = (0 - globalDoubleResult)
                        label.text = "\(globalDoubleResult)"
                    }else if globalDoubleResult < 0{
                        globalDoubleResult = (0 - globalDoubleResult)
                        label.text = "\(globalDoubleResult)"
                    }
                }
            }else{
                firstNumber.insert("-", at: firstNumber.startIndex)
                label.text = firstNumber
            }
        }else{
            if secondNumber.contains("-"){
                secondNumber.removeFirst()
                label.text = secondNumber
            }else{
                secondNumber.insert("-", at: secondNumber.startIndex)
                label.text = secondNumber
            }
        }
    }
    
    @IBAction func percentTapped(_ sender: UIButton) {
        sign = sender.currentTitle!
    }
    
    
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if firstNumber.contains(".") || secondNumber.contains(".") || globalDoubleResult != 0.0{
            if sign == "+"{
                if let safeFirstNumber = Double(firstNumber), let safeSecondNumber = Double(secondNumber){
                    globalDoubleResult = safeFirstNumber + safeSecondNumber
                    label.text = "\(globalDoubleResult)"
                }
                if firstNumber == ""{
                    if let safeNumber = Double(secondNumber){
                        globalDoubleResult = globalDoubleResult + safeNumber
                        label.text = "\(globalDoubleResult)"
                    }
                    
                }
                
                
            }else if sign == "-"{
                if let safeFirstNumber = Double(firstNumber), let safeSecondNumber = Double(secondNumber){
                    globalDoubleResult = safeFirstNumber - safeSecondNumber
                    label.text = "\(globalDoubleResult)"
                }
                if firstNumber == ""{
                    if let safeNumber = Double(secondNumber){
                        globalDoubleResult = globalDoubleResult - safeNumber
                        label.text = "\(globalDoubleResult)"
                    }
                    
                }
            }else if sign == "×"{
                if let safeFirstNumber = Double(firstNumber), let safeSecondNumber = Double(secondNumber){
                    globalDoubleResult = safeFirstNumber * safeSecondNumber
                    label.text = "\(globalDoubleResult)"
                }
                if firstNumber == ""{
                    if let safeNumber = Double(secondNumber){
                        globalDoubleResult = globalDoubleResult * safeNumber
                        label.text = "\(globalDoubleResult)"
                    }
                    
                }
                
            }else if sign == "/"{
                if let safeFirstNumber = Double(firstNumber), let safeSecondNumber = Double(secondNumber){
                    globalDoubleResult = safeFirstNumber / safeSecondNumber
                    let strRes = String(globalDoubleResult)
                    if strRes.hasSuffix(".0"){
                        label.text = "\(Int(globalDoubleResult))"
                    }else{
                        label.text = "\(globalDoubleResult)"
                    }
                    
                }
                if firstNumber == ""{
                    if let safeNumber = Double(secondNumber){
                        globalDoubleResult = globalDoubleResult / safeNumber
                        label.text = "\(globalDoubleResult)"
                    }
                    
                }
            }else if sign == "%"{
                if let safeFirstNumber = Double(firstNumber){
                    globalDoubleResult = safeFirstNumber / Double(100)
                    label.text = "\(globalDoubleResult)"
                }
                if firstNumber == ""{
                    globalDoubleResult = Double(globalDoubleResult) / Double(100)
                    label.text = "\(globalDoubleResult)"
                    
                    
                }
                
            }
            
        }else{
            if sign == "+"{
                if let safeFirstNumber = Int(firstNumber), let safeSecondNumber = Int(secondNumber){
                    globalResult = safeFirstNumber + safeSecondNumber
                    label.text = "\(globalResult)"
                }
                if firstNumber == ""{
                    if let safeNumber = Int(secondNumber){
                        globalResult = globalResult + safeNumber
                        label.text = "\(globalResult)"
                    }
                    
                }
                
                
            }else if sign == "-"{
                if let safeFirstNumber = Int(firstNumber), let safeSecondNumber = Int(secondNumber){
                    globalResult = safeFirstNumber - safeSecondNumber
                    label.text = "\(globalResult)"
                }
                if firstNumber == ""{
                    if let safeNumber = Int(secondNumber){
                        globalResult = globalResult - safeNumber
                        label.text = "\(globalResult)"
                    }
                    
                }
            }else if sign == "×"{
                if let safeFirstNumber = Int(firstNumber), let safeSecondNumber = Int(secondNumber){
                    globalResult = safeFirstNumber * safeSecondNumber
                    label.text = "\(globalResult)"
                }
                if firstNumber == ""{
                    if let safeNumber = Int(secondNumber){
                        globalResult = globalResult * safeNumber
                        label.text = "\(globalResult)"
                    }
                    
                }
                
            }else if sign == "/"{
                if let safeFirstNumber = Double(firstNumber), let safeSecondNumber = Double(secondNumber){
                    globalDoubleResult = safeFirstNumber / safeSecondNumber
                    let strRes = String(globalDoubleResult)
                    if strRes.hasSuffix(".0"){
                        label.text = "\(Int(globalDoubleResult))"
                    }else{
                        label.text = "\(globalDoubleResult)"
                    }
                    
                }
                if firstNumber == ""{
                    if let safeNumber = Double(secondNumber){
                        globalDoubleResult = globalDoubleResult / safeNumber
                        label.text = "\(globalDoubleResult)"
                    }
                    
                }
                
            }else if sign == "%"{
                if let safeFirstNumber = Double(firstNumber){
                    globalDoubleResult = Double(safeFirstNumber) / Double(100)
                    label.text = "\(globalDoubleResult)"
                }
                if firstNumber == ""{
                    globalDoubleResult = Double(globalDoubleResult) / Double(100)
                    label.text = "\(globalDoubleResult)"
                    
                    
                }
                
            }
            
        }
        firstNumber = ""
        secondNumber = ""
        signTappedOrNot = false
    }
    
    
    
}

