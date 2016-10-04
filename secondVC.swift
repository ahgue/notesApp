//
//  secondVC.swift
//  notesApp
//
//  Created by Alex Salgado on 9/8/16.
//  Copyright © 2016 Alex Salgado. All rights reserved.
//
import Foundation
import UIKit

class secondVC: UIViewController {

    @IBOutlet weak var myTitle: UITextField!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var myTitles: UILabel!

    var titleString : String?
    var contentString : String?
    var SecondTitle : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  self.myTitles.text = titleString
          self.myTitle.text = SecondTitle
          self.content.text = contentString

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveButton(_ sender: UIButton) {
        // Save data to file
        let fileName = myTitle.text
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: true)
        let fileURL = documentDirectory.appendingPathComponent(fileName!).appendingPathExtension("strings")
        print("File path: \(fileURL)")

        // Write to a file on disk
        let outString = content.text
        do {
            try outString?.write(to: fileURL, atomically: true, encoding: .utf8)
            print("outString es \(outString)")
        } catch let error as NSError {
            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }
        
        // Reading from a file on disk
        var inString = ""
        do {
            inString = try String(contentsOf: fileURL)
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
        print("Contents of file: \(inString)")
        print("Read from file: \(fileName!)")
 

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
