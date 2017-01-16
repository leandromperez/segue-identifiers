//
//  ViewController.swift
//  SeguesProject
//
//  Created by Leandro Perez on 1/13/17.
//  Copyright © 2017 Leandro Perez. All rights reserved.
//

import UIKit


class A: UIViewController , SourceForB, SourceForC, SourceForD{

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        segue.prepare(sender:sender)
    }
    
    func prepare(for segue: UIStoryboardSegue, from sender: Any?, toB vc: B) {
        vc.element = self.randomElement
    }
    
    func prepare(for segue: UIStoryboardSegue, from sender: Any?, toC vc: C) {
        vc.element1 = self.randomElement
        vc.element2 = self.randomElement
        vc.opCode = .Op1
    }
    
    func prepare(for segue: UIStoryboardSegue, from sender: Any?, toD vc: D) {
        
        if segue.identifier == "View"{
            vc.status = "View mode"
        }
        else if segue.identifier == "Edit"{
            vc.status = "Edit mode"
        }
        else{ fatalError()}
    }

    var randomElement : Element! {
        get{
            return Element(name: "#\(arc4random())")
        }
    }
    
    @IBAction func unwindToA(unwindSegue: UIStoryboardSegue){
        print("unwind")
    }

}
