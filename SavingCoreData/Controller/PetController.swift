//
//  PetController.swift
//  SavingCoreData
//
//  Created by Hoang Anh Tuan on 3/11/19.
//  Copyright © 2019 Hoang Anh Tuan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PetController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let cellId = "cellID"
    var index = Int()
    var pets =  NSSet()
    var people = [People]()
    var petArr = [Pet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        
        petArr = pets.allObjects as! [Pet]
    }
    
    func setUpNavigation(){
        collectionView.register(PetCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .blue
        navigationItem.title = "Pet"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(handleAddPet))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do {
            people = try context.fetch(People.fetchRequest())
        } catch let err as NSError {
            print("Cant not fetch people: ",err)
        }
    }
    
    @objc func handleAddPet(){
        let alert:UIAlertController = UIAlertController(title: "New Pet", message: nil, preferredStyle: .alert)
        alert.addTextField { (typetf) in
            typetf.placeholder = "Enter pet's type..."
        }
        alert.addTextField { (nametf) in
            nametf.placeholder = "Enter pet's name..."
        }
        let cancelButton:UIAlertAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let okButton:UIAlertAction = UIAlertAction(title: "OK", style: .default) { (_ ) in
            let typePettf = alert.textFields![0] as UITextField
            let namePettf = alert.textFields![1] as UITextField
            
            self.addnewPet(petType: typePettf.text ?? "", petName: namePettf.text ?? "")
        }
        
        alert.addAction(cancelButton)
        alert.addAction(okButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func addnewPet(petType: String, petName: String){
        let pet = Pet(entity: Pet.entity(), insertInto: self.context)
        pet.type = petType
        pet.name = petName
        pet.owner = self.people[self.index]
        self.appDelegate.saveContext()
        self.petArr.append(pet)
        let index = IndexPath(row:self.petArr.count - 1, section:0)
        self.collectionView?.insertItems(at: [index])
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return petArr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PetCell
        cell.typeLB.text = petArr[indexPath.item].type
        cell.nameLB.text = petArr[indexPath.item].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 60)/2
        return CGSize(width: width, height: 100)
    }
}
