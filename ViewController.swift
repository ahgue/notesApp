//
//  ViewController.swift
//  notesApp
//
//  Created by Alex Salgado on 9/8/16.
//  Copyright © 2016 Alex Salgado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var myTableView : UITableView!
    let fileManager = FileManager.default
    
    @IBAction func newNote(_ sender: UIButton) {
        let mtv : secondVC = secondVC(nibName: "secondVC", bundle: nil)
        navigationController?.pushViewController(mtv, animated: true)
    }
   
    //var titles : NSDictionary = uploadData()
 
    
    var easyArray : NSDictionary = ["POIU" : ["123", "456","789","poiu","prueba3","prueba4"]]

    override func viewWillAppear(_ animated: Bool) {
        self.myTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      //  let titles = uploadData()
        self.myTableView.dataSource = self
        self.myTableView.delegate   = self
        
    
        // Do any additional setup after loading the view, typically from a nib.
        
        
                
        //end of parsing

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController : UITableViewDelegate{
   
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)  //deselect row when click on it
        
        let sectionName: String = self.easyArray.allKeys[indexPath.section] as! String
        let cellTitle : String  = (self.easyArray[sectionName] as! [String]) [(indexPath as NSIndexPath).row]
        
        //getting file.strings
        let mtv : secondVC = secondVC(nibName: "secondVC", bundle: nil)

        
        do {
            // get the documents folder url
            let documentDirectoryURL = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first
            let path = URL(fileURLWithPath: documentDirectoryURL!).appendingPathComponent(cellTitle).appendingPathExtension("strings")
            do {
                
                let text = try NSString(contentsOf: path, encoding: String.Encoding.utf8.rawValue) as String
                self.myTableView.reloadData()
                mtv.contentString = text
                
                
           /*     do {
                    // writing to disk
                    try text.write(to: fileDestinationUrl, atomically: false, encoding: String.Encoding.utf8)
                    //easyArray1?.append(mtv.SecondTitle!)
                    
                    // saving was successful. any code posterior code goes here
                    // reading from disk
                    do {
                        let mytext = try String(contentsOf: fileDestinationUrl)
                        print(mytext)   // "some text\n"
                    } catch let error as NSError {
                        print("error loading contentsOf url \(fileDestinationUrl)")
                        print(error.localizedDescription)
                    }
                } catch let error as NSError {
                    print("error writing to url \(fileDestinationUrl)")
                    print(error.localizedDescription)
                }*/
            } catch let error as NSError {
                print("error appendingPathComponent to documentDirectoryURL")
                print(error.localizedDescription)
            }
        }
        
        /*let bundle = Bundle.main
        let path   = bundle.path(forResource: cellTitle, ofType: "strings")
        let data : Data   = try! Data (contentsOf: URL(fileURLWithPath: path!))
        let text : String? = String(data: data, encoding: String.Encoding.utf8)
        */
        
        
       /* if let dir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first{
            let path = URL(fileURLWithPath: dir).appendingPathComponent(cellTitle).appendingPathExtension("strings")
            //reading
            //let data : Data     = try! Data(contentsOf: (fileURLWithPath: path))
            //let text : String?  = String(data: data, encoding: String.Encoding.utf8)
            //reading
            do {
                let text = try NSString(contentsOf: path, encoding: String.Encoding.utf8.rawValue) as String
                mtv.contentString = text
            }
            catch {/* error handling here */}
        }*/
           /* do {
                
                let data = try? Data(contentsOf: path)
                if data != nil {
                    do {
                        let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                        if let dictionary = object as? [String: AnyObject] {
                            readJSONObject(dictionary)
                        }
                    } catch {
                        print("error serializing JSON: \(error)")
                    }
                }else {
                    let jsonFilePath = Utilities.getFilePath("menu.json")
                    let fileManager = FileManager.default
                }
            }*/

        
        
    
        
       // print(text! + "IDENTIFICANCIA")
        
        //end searching for file
        
        
        
       // let mtv : secondVC = secondVC(nibName: "secondVC", bundle: nil)
        
       //mtv.titleString = cellTitle
        //mtv.contentString = text
        mtv.SecondTitle = cellTitle
    
        
       navigationController?.pushViewController(mtv, animated: true)
        
        
        
        
    }
    
    
    
    
}


extension ViewController : UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return easyArray.allKeys.count
        
        //checando aver si sale con json
       // return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections : String = easyArray.allKeys[section] as! String
        let array = easyArray[sections]
        return (array! as AnyObject).count
 
       // let titles = easyArray1?.count
       // return titles!
        
        //checando aver si sale con json
        //return (titles?.count)!
        //return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customMenuCell", for: indexPath) as! customTVC
        
        let sections : String = easyArray.allKeys[indexPath.section] as! String
        let array = easyArray[sections] as! [String]
        
        cell.titleLabel.text    = array[indexPath.row]
        
        let sectionName: String = self.easyArray.allKeys[indexPath.section] as! String
        let cellTitle : String  = (self.easyArray[sectionName] as! [String]) [(indexPath as NSIndexPath).row]
        do {
            // get the documents folder url
            let documentDirectoryURL = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first
            let path = URL(fileURLWithPath: documentDirectoryURL!).appendingPathComponent(cellTitle).appendingPathExtension("strings")
            do {
                // create the destination url for the text file to be saved
                //let fileDestinationUrl =  URL(fileURLWithPath: documentDirectoryURL!).appendingPathComponent(cellTitle).appendingPathExtension("strings")
                
                let text = try NSString(contentsOf: path, encoding: String.Encoding.utf8.rawValue) as String
                cell.overview.text = text
                
            } catch let error as NSError {
                print("error appendingPathComponent to documentDirectoryURL")
                print(error.localizedDescription)
            }
        }
        
        
        ///////    esto es para el Arreglo dinamico cell.titleLabel.text = easyArray1?[indexPath.row]
        
     //   let sections: String = titles[indexPath.row] spam de json
       // cell.titleLabel.text = sections.name
            return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let sectionName: String = self.easyArray.allKeys[indexPath.section] as! String
            let cellTitle : String  = (self.easyArray[sectionName] as! [String]) [(indexPath as NSIndexPath).row]
            
            do {
                // get the documents folder url
                let documentDirectoryURL = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first
                let path = URL(fileURLWithPath: documentDirectoryURL!).appendingPathComponent(cellTitle).appendingPathExtension("strings")
                try fileManager.removeItem(at: path)
                self.myTableView.reloadData()
            }
                catch{print("error")}
        }
    }
    
}

