//
//  B.swift
//  SeguesProject
//
//  Created by Leandro Perez on 1/13/17.
//  Copyright © 2017 Leandro Perez. All rights reserved.
//

import UIKit

protocol SourceForB{
    func prepare(for segue: UIStoryboardSegue, from sender: Any?, toB vc: B)
}

class B: UIViewController {
    var element : Element!
   
    @IBOutlet weak var elementTitle : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(self.element != nil)
        
        self.elementTitle.text = element.name
    }

}

extension B : SegueDestination{
    
    func prepareAsDestination( segue: UIStoryboardSegue, sender: Any?){
        
        let sourceForB = segue.source as! SourceForB
        sourceForB.prepare(for: segue, from: sender, toB: self)
    }
}
