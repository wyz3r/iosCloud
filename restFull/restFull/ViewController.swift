//
//  ViewController.swift
//  restFull
//
//  Created by Leo on 10/02/16.
//  Copyright © 2016 leonel islas gonzalez . All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    
    @IBOutlet weak var busqueda: UITextField!
    
    @IBOutlet weak var campo: UITextView!
    func sincrono (libro: String)
    {
        let url = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(libro)"
        let urls = NSURL(string :url)
        if (urls != nil )
        {
            
            
            let datos:NSData? = NSData(contentsOfURL: urls!)
            print(datos!)
            let texto = NSString(data:datos!, encoding: NSUTF8StringEncoding)
            campo.text = texto! as String
            

        }
        else
        {   //codigo para crear un alert
            let alerta = UIAlertController(title: "Error", message: "No encontrado", preferredStyle: UIAlertControllerStyle.Alert)
            alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            presentViewController(alerta, animated: true, completion: nil)
            //codigo para crear un alert
            print("error")
            
            
        }
       
        print("cadena de \(libro)")
       
    }
    
   
    

    @IBAction func texEnding (sender: UITextField)
    {
        
            sender.resignFirstResponder()//desaparecer el teclado al dar enter
        
    }
    
    @IBAction func busqueda (sender: UITextField)
    {
        print("entra la cadena \(busqueda.text!)")
       
        sincrono(busqueda.text!)
        
        

    }
    
    @IBAction func tabvakcground (sender: UIControl)
    {
        busqueda.resignFirstResponder()
        campo.resignFirstResponder()
    }
    
    
    func truefalse () ->Bool
    {
        
        return true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
 
    
  
    @IBAction func limpiarPantalla(sender: AnyObject) {
        campo.text = " "
        busqueda.text = " "
    }
   
   

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "tablon2")
        self.view.insertSubview(backgroundImage, atIndex: 0)
        self.view.backgroundColor = UIColor.whiteColor();
        
        busqueda.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

