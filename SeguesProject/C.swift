//
//  C.swift
//  SeguesProject
//
//  Created by Leandro Perez on 1/13/17.
//  Copyright © 2017 Leandro Perez. All rights reserved.
//

import UIKit

protocol SourceForC{
    func prepare(for segue: UIStoryboardSegue, from sender: Any?, toC vc: C)
}


class C: UIViewController {
    var element1 : Element!
    var element2 : Element!
    var opCode : OpCode!
    
    @IBOutlet weak var element1Name : UILabel!
    @IBOutlet weak var element2Name : UILabel!
    @IBOutlet weak var opCodeLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(self.element1 != nil)
        assert(self.element2 != nil)
        assert(self.opCode != nil)
        
        self.element1Name.text = self.element1.name
        self.element2Name.text = self.element2.name
        self.opCodeLabel.text = self.opCode.rawValue
    }
}

extension C : SegueDestination{

    func prepareAsDestination( segue: UIStoryboardSegue, sender: Any?){
        
        let sourceForC = segue.source as! SourceForC
        sourceForC.prepare(for: segue, from: sender, toC: self)
    }
}
