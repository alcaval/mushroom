//
//  NewSetaViewController.swift
//  mushroom
//
//  Created by Mushroom on 24/11/2020.
//  Copyright © 2020 Mushroom. All rights reserved.
//

import UIKit
import CoreData

class NewSetaViewController: UIViewController {

    @IBOutlet weak var nombreSeta: UITextField!
    @IBOutlet weak var imagenEsporada: UIButton!
    @IBOutlet weak var viewNegra: UIView!
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var viewForma: UIView!
    @IBOutlet weak var viewTacto: UIView!
    @IBOutlet weak var viewOlor: UIView!
    @IBOutlet weak var clasifLabel: UILabel!
    @IBOutlet weak var talloSuperior: UILabel!
    @IBOutlet weak var talloInferior: UILabel!
    @IBOutlet weak var olorSeta: UILabel!
    @IBOutlet weak var Clasificacion: UISegmentedControl!
    @IBOutlet weak var Anillos: UISegmentedControl!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var usuario: User!
    
    var setaUsed: Mushroom!
    
//MARK: Olor
    @IBAction func seleccionarOlor(_ sender: Any) {
        viewOlor.isHidden = false;
        viewNegra.isHidden = false;
    }
    @IBAction func olorPescado(_ sender: UIButton) {
        cambiarOlor(olor: "Pescado")
    }
    @IBAction func olorPicante(_ sender: UIButton) {
        cambiarOlor(olor: "Picante")
    }
    @IBAction func olorRancio(_ sender: UIButton) {
        cambiarOlor(olor: "Rancio")
    }
    @IBAction func olorAnis(_ sender: UIButton) {
        cambiarOlor(olor: "Anis")
    }
    @IBAction func olorBasura(_ sender: UIButton) {
        cambiarOlor(olor: "Basura")
    }
    @IBAction func olorAlmendra(_ sender: UIButton) {
        cambiarOlor(olor: "Almendra")
    }
    @IBAction func olorHollin(_ sender: UIButton) {
        cambiarOlor(olor: "Hollin")
    }
    @IBAction func olorDesconocido(_ sender: UIButton) {
        cambiarOlor(olor: "Desconocido")
    }
    @IBAction func olorNada(_ sender: UIButton) {
        cambiarOlor(olor: "Nada")
    }
    func cambiarOlor(olor:String){
        olorSeta.text = olor
        viewOlor.isHidden = true;
        viewNegra.isHidden = true;
    }
    
//MARK: Tallo superior
    @IBAction func seleccionarTalloSuperior(_ sender: UIButton) {
        viewForma.isHidden = false;
        viewNegra.isHidden = false;
    }
    @IBAction func superiorMarron(_ sender: UIButton) {
        cambiarColorSuperior(superior:"Marron")
    }
    @IBAction func superiorNegro(_ sender: UIButton) {
        cambiarColorSuperior(superior:"Blanco")
    }
    @IBAction func superiorAmarillo(_ sender: UIButton) {
        cambiarColorSuperior(superior:"Amarillo")
    }
    @IBAction func superiorOtro(_ sender: UIButton) {
        cambiarColorSuperior(superior:"Otro")
    }
    func cambiarColorSuperior(superior:String){
        talloSuperior.text = superior;
        viewForma.isHidden = true;
        viewNegra.isHidden = true;
    }
    
//MARK: Tallo inferior
    @IBAction func seleccionarTalloInferior(_ sender: UIButton) {
        viewTacto.isHidden = false;
        viewNegra.isHidden = false;
    }
    @IBAction func inferiorFibroso(_ sender: UIButton) {
        cambiarTactoInferior(tacto:"Fibroso")
    }
    @IBAction func inferiorEscamado(_ sender: UIButton) {
        cambiarTactoInferior(tacto:"Escamado")
    }
    @IBAction func inferiorSuave(_ sender: UIButton) {
        cambiarTactoInferior(tacto:"Suave")
    }
    @IBAction func inferiorSedoso(_ sender: UIButton) {
        cambiarTactoInferior(tacto:"Sedoso")
    }
    func cambiarTactoInferior(tacto:String){
        talloInferior.text = tacto
        viewTacto.isHidden = true;
        viewNegra.isHidden = true;
    }
    
//MARK: Colores Esporada
    var colorEsporada = "brown"
    @IBAction func seleccionarColor(_ sender: UIButton) {
        viewColor.isHidden = false;
        viewNegra.isHidden = false;
    }
    @IBAction func esporadaBuff(_ sender: UIButton) {
        colorEsporada = "buff"
        cambiarEsporada(esporada: "esporada-buff")
    }
    @IBAction func esporadaBlanca(_ sender: UIButton) {
        colorEsporada = "white"
        cambiarEsporada(esporada: "esporada-blanco")
    }
    @IBAction func esporadaAmarilla(_ sender: UIButton) {
        colorEsporada = "yellow"
        cambiarEsporada(esporada: "esporada-amarillo")
    }
    @IBAction func esporadaVerde(_ sender: UIButton) {
        colorEsporada = "green"
        cambiarEsporada(esporada: "esporada-verde")
    }
    @IBAction func esporadaChocolate(_ sender: UIButton) {
        colorEsporada = "chocolate"
        cambiarEsporada(esporada: "esporada-chocolate")
    }
    @IBAction func esporadaMorada(_ sender: UIButton) {
        colorEsporada = "purple"
        cambiarEsporada(esporada: "esporada-morado")
    }
    @IBAction func esporadaNaranja(_ sender: UIButton) {
        colorEsporada = "orange"
        cambiarEsporada(esporada: "esporada-naranja")
    }
    @IBAction func esporadaNegra(_ sender: UIButton) {
        colorEsporada = "black"
        cambiarEsporada(esporada: "esporada-negro")
    }
    @IBAction func esporadaMarron(_ sender: UIButton) {
        colorEsporada = "brown"
        cambiarEsporada(esporada: "esporada-marron")
    }
    func cambiarEsporada(esporada:String){
        imagenEsporada.imageView?.image = UIImage(named: esporada);
        viewColor.isHidden = true;
        viewNegra.isHidden = true;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTacto.isHidden = true;
        viewOlor.isHidden = true;
        viewColor.isHidden = true;
        viewForma.isHidden = true;
        viewNegra.isHidden = true;
        // Do any additional setup after loading the view.
        
        #if LPS1
        Clasificacion.isHidden = false
        clasifLabel.isHidden = false
        #endif
        
        #if LPS2
        Clasificacion.isHidden = true
        clasifLabel.isHidden = true
        #endif
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func cancelarBtn(_ sender: Any) { dismiss(animated: true, completion: nil) }
    
    @IBAction func AñadirBtn(_ sender: Any) {
        if nombreSeta.text == ""{
            let alertControl = UIAlertController(title: "Nombre vacio", message: "Debes indicar un nombre para la seta.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Okey", style: .default)
            
            alertControl.addAction(ok)
            self.present(alertControl, animated: true, completion: nil)
        } else if(talloSuperior.text == "Nada"){
            let alertControl = UIAlertController(title: "Indica la color del tallo superior", message: "Debes indicar un color para el tallo superior.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Okey", style: .default)
            
            alertControl.addAction(ok)
            self.present(alertControl, animated: true, completion: nil)
        }else if(talloInferior.text == "Nada"){
            
            let alertControl = UIAlertController(title: "Indica el tacto del tallo inferior", message: "Debes indicar el tacto que tiene el tallo inferior.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Okey", style: .default)
            
            alertControl.addAction(ok)
            self.present(alertControl, animated: true, completion: nil)
            
        }else {
            let anillos = Anillos.titleForSegment(at: Anillos.selectedSegmentIndex)
            let clasificacion = Clasificacion.titleForSegment(at: Clasificacion.selectedSegmentIndex)
            let seta = Mushroom(context: self.context)
            seta.name = nombreSeta.text
            seta.lower = talloInferior.text
            seta.odor = olorSeta.text
            seta.upper = talloSuperior.text
            seta.spore = colorEsporada
            switch anillos{
                case "0": seta.rings = 0;
                case "1": seta.rings = 1;
                case "2": seta.rings = 2;
                default: seta.rings = 0;
            }
            
            setaUsed = seta
            #if LPS1
            switch clasificacion{
                case "Comestible": seta.type = true;
                case "Venenosa": seta.type = false;
                default: seta.type = false;
            }
            #endif
            #if LPS2
            seta.type = calcType()
            #endif
            usuario.addToSetas(seta)
            try! self.context.save()
        }
        dismiss(animated: true, completion: nil)
        
    }

    func calcType() -> Bool
    {
        var odor_e = 0.0
        var odor_p = 0.0
        if(setaUsed.odor == "Almendra")
        {
            odor_e = 5.25
            odor_p = -5.25
        }else if(setaUsed.odor == "Hollin")
        {
            odor_e = -1.08
            odor_p = 1.08
        }else if(setaUsed.odor == "Pescado")
        {
            odor_e = -1.21
            odor_p = 1.21
        }else if(setaUsed.odor == "Anis")
        {
            odor_e = 5.21
            odor_p = -5.21
        }else if(setaUsed.odor == "Nada")
        {
            odor_e = 5.06
            odor_p = -5.06
        }else if(setaUsed.odor == "Rancio")
        {
            odor_e = -1.59
            odor_p = 1.59
        }
        
        var pArriba_e = 0.0
        var pArriba_p = 0.0
        var pAbajo_e = 0.0
        var pAbajo_p = 0.0
        
        if(setaUsed.upper == "Fibroso")
        {
            pArriba_e = 0.53
            pArriba_p = -0.53
        }else if(setaUsed.upper == "Sedoso")
        {
            pArriba_e = -2.36
            pArriba_p = 2.36
        }
        
        if(setaUsed.lower == "Marron")
        {
            pAbajo_e = 0.42
            pAbajo_p = -0.42
        }else if(setaUsed.lower == "Blanco")
        {
            pAbajo_e = -0.95
            pAbajo_p = 0.95
        }else if(setaUsed.lower == "Amarillo")
        {
            pAbajo_e = -2.52
            pAbajo_p = 2.52
        }
        
        var ring_e = 0.0
        var ring_p = 0.0
        if(setaUsed.rings == 2)
        {
            ring_e = 4.83
            ring_p = -4.83
        }
        
        var color_e = 0.0
        var color_p = 0.0
        if(setaUsed.spore == "esporada-negro"){
            color_e = 0.82
            color_p = -0.82
        } else if(setaUsed.spore == "esporada-marron"){
            color_e = 0.78
            color_p = -0.78
        } else if(setaUsed.spore == "esporada-verde"){
            color_e = -10.04
            color_p = 10.04
        } else if(setaUsed.spore == "esporada-blanco"){
            color_e = -2.77
            color_p = 2.77
        }
        
        let e = -1.51 + odor_e + pAbajo_e + pArriba_e + ring_e + color_e
        let p = 1.51 + odor_p + pAbajo_p + pArriba_p + ring_p + color_p
        
        return e > p
    }
    
}
