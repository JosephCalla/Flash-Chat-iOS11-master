import UIKit
import Firebase

 class ChatViewController: UIViewController , UITableViewDelegate ,UITableViewDataSource , UITextFieldDelegate {
  
    
    //Declarar variables de instancia aquí.

    
    // Hemos pre-vinculado el IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Set yourself as the delegate and datasource here:
        messageTableView.delegate = self
        messageTableView.dataSource = self
        //TODO: Set yourself as the delegate of the text field here:
        messageTextfield.delegate = self
        
        //TODO: Set the tapGesture here:
    
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)

        //TODO: Register your MessageCell.xib file here:
        
        //El objeto UINib almacena en cache es necesario por que estoy usan el Cell en otro que es MessageCell.xib
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        //Llamamo nuestro metodo personalizada acerca de las celdas
        configureTableView()
    }
    
    //MARK: - TableView DataSource Methods
    
   
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        // el "as!" sirve de donde es nuestra fuente (clase)
        let messageArray = ["Hola","Como","Heljfioqejfioejfiejfiwjfioejwfiojeoiefjeiowfjefwejfiojeifjioejwijwefiwjefioewjfheruhtuhuthruhrlo de nuevo ,Bro! "]
        
        cell.messageBody.text = messageArray[indexPath.row]
        return cell
    }
    //numberOfRowInSection - numeros de filas en las secciones
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
        //TODO: Declare tableViewTapped here:
    func tableViewTapped(){
        
    }
    
    
    //TODO: Declare configureTableView here:
    //esto configura el table view
    func configureTableView(){
        //ahora vamos que sea mas alto cada celda
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120.0
        //ahora debemos llamarlo esta funcion porque esto deberia de ejecutarse
        //antes de la ejecucion de la app
    }
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    

    //TODO: Declare textFieldDidBeginEditing here:
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.4, animations:{
            self.heightConstraint.constant = 380
            self.view.layoutIfNeeded()
            
        })
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.4) {
            self.heightConstraint.constant = 308
            self.view.layoutIfNeeded()
        }
    }
    
    //TODO: Declare textFieldDidEndEditing here:
  
    
    //MARK: - Send & Recieve from Firebase
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        
        //TODO: Send the message to Firebase and save it in our database
        
        
    }
    
    //TODO: Create the retrieveMessages method here:
@IBAction func logOutPressed(_ sender: AnyObject) {
        
        //TODO: Log out the user and send them back to WelcomeViewController
        do {
            try Auth.auth ().signOut()
            // Esto siver para regresar al inicio es un codigo eficiente
           navigationController?.popToRootViewController(animated: true)
            
        } catch{
            print("Hubo un problema para salir de su cuenta")
        }
    }
}

