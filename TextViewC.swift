//
//  TextViewC.swift
//  notesApp
//
//  Created by Alex Salgado on 9/9/16.
//  Copyright © 2016 Alex Salgado. All rights reserved.
//

import UIKit

class TextViewC: UIViewController {

    @IBOutlet weak var myTitle : UITextField!
    @IBOutlet weak var content : UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
