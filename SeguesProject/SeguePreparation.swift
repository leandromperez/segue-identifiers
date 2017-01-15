//
//  SeguesMapping.swift
//  Routes
//
//  Created by Leandro Perez on 1/5/17.
//  Copyright © 2017 Leandro Perez. All rights reserved.
//

import Foundation
import UIKit


extension UIStoryboardSegue {
    /**
     Call this function to start a double dispatch between the destination and source of this segue.
     - Precondition: The segue.destination UIViewController must implement prepareAsDestination( segue: UIStoryboardSegue, sender: Any?)
     - Parameter sender : the UIControl that triggers the segue
     
     **Example**
     ```
     //The SourceVC
     override func prepare(for segue: UIStoryboardSegue, sender: Any?)
     {
     segue.prepare(sender: sender)
     }
     
     //Prepare segue to DestinationVC
     func prepare( segue: UIStoryboardSegue, to destination: DestinationVC, from sender: Any?) {
     ...
     }
     
     ```
     ```
     //The DestinationVC
     
     override func prepareAsDestination(segue: UIStoryboardSegue, sender: Any?) {
     
        let sourceVC = segue.source as! SourceVC
        source.prepare(segue: segue, to: self, from: sender)
     }
     
     
     ```
     */
    
    func prepare(sender : Any?) {
        guard let destination = self.destination as? SegueDestination else{ fatalError("Destination \(self.destination) does not conform to SegueDestination protocol")}
        destination.prepareAsDestination(segue: self, sender: sender)
    }
}

extension UINavigationController : SegueDestination
{
    func prepareAsDestination( segue: UIStoryboardSegue, sender: Any?){
        guard let destination = self.topViewController as? SegueDestination
            else{ fatalError("Top view contoroller must conform to protocol SegueDestination")}
        
        destination.prepareAsDestination(segue: segue, sender: sender)
    }
}

protocol SegueDestination
{
    func prepareAsDestination( segue: UIStoryboardSegue, sender: Any?)
}
