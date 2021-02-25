//
//  SecondViewController.swift
//  TwoViewControllers
//
//  Created by Kate Baumstein on 2/22/21.
//

import UIKit



protocol SendDataProtocol {
    func sendPenneFavoriteInformationToFirstController(isFavorited: Bool)
}


class SecondViewController: UIViewController, SendDataToSecondViewProtocol {
   
    var delegate: SendDataProtocol? = nil
    @IBOutlet var favoritePenneButton: UIButton!
    var isPenneFavorited2 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(isPenneFavorited2 == false){
            favoritePenneButton.setImage( UIImage(systemName: "squareshape"), for: .normal)
            favoritePenneButton.setTitle( "Add to Favorites", for: .normal)
            favoritePenneButton.backgroundColor = #colorLiteral(red: 0, green: 0.9372810721, blue: 0, alpha: 1)
            isPenneFavorited2 = false
        }
        else {
            favoritePenneButton.setImage( UIImage(systemName: "checkmark.square"), for: .normal)
            favoritePenneButton.setTitle("Added to favorites", for: .normal)
            favoritePenneButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            isPenneFavorited2 = true
        }
        //favoritePenneButton2
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
    */

    
    @IBAction func secondMethod(sender: UIButton) {
        print("CLICKING IN SECOND VIEW CONTROLLER ")
    }
    
    @IBAction func clickFavoriteButton(sender: UIButton){
        if(isPenneFavorited2){
  //      if(favoritePenneButton.currentImage ==  UIImage(systemName: "checkmark.square")){
            favoritePenneButton.setImage( UIImage(systemName: "squareshape"), for: .normal)
            favoritePenneButton.setTitle( "Add to Favorites", for: .normal)
            favoritePenneButton.backgroundColor = #colorLiteral(red: 0, green: 0.9372810721, blue: 0, alpha: 1)
            isPenneFavorited2 = false
        }
    else{
     //   else if (favoritePenneButton.currentImage ==  UIImage(systemName: "squareshape")){
            favoritePenneButton.setImage( UIImage(systemName: "checkmark.square"), for: .normal)
            favoritePenneButton.setTitle("Added to favorites", for: .normal)
            favoritePenneButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            isPenneFavorited2 = true
        }
        
        if self.delegate != nil {
            print("HERE 2")
            self.delegate?.sendPenneFavoriteInformationToFirstController(isFavorited: isPenneFavorited2)
            //dismiss(animated: true, completion: nil)
        }
        
        
        
    }
    
    func sendPenneFavoriteInformationToSecondController(isFavorited: Bool) {
        if(isFavorited == true){
            favoritePenneButton.setImage( UIImage(systemName: "checkmark.square"), for: .normal)
            favoritePenneButton.setTitle("Added to favorites", for: .normal)
            favoritePenneButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            isPenneFavorited2 = true
        }
        else {
            favoritePenneButton.setImage( UIImage(systemName: "squareshape"), for: .normal)
            favoritePenneButton.setTitle( "Add to Favorites", for: .normal)
            favoritePenneButton.backgroundColor = #colorLiteral(red: 0, green: 0.9372810721, blue: 0, alpha: 1)
            isPenneFavorited2 = false
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "penneRecipeSegue" {
                let firstVC: ViewController = segue.destination as! ViewController
                //firstVC.isPenneFavorited = isPenneFavorited
                firstVC.favoritePenneButton.backgroundColor = #colorLiteral(red: 0.003587165615, green: 0.01698361151, blue: 0.005612873472, alpha: 1)
                firstVC.delegate = self
        }
    }
    
    
    
    
    
}
