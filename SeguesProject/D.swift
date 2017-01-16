//
//  D.swift
//  SeguesProject
//
//  Created by Leandro Perez on 1/13/17.
//  Copyright © 2017 Leandro Perez. All rights reserved.
//

import UIKit

protocol SourceForD{
    func prepare(for segue: UIStoryboardSegue, from sender: Any?, toD vc: D)
}


class D: UIViewController {
    
    var status : String!
    
    @IBOutlet weak var statusLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(self.status != nil)
        
        self.statusLabel.text = self.status
    }
}

extension D : SegueDestination{
    
    func prepareAsDestination( segue: UIStoryboardSegue, sender: Any?){
        
        let sourceForD = segue.source as! SourceForD
        sourceForD.prepare(for: segue, from: sender, toD: self)
    }
}
