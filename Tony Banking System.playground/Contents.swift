import UIKit

/*
 Classroom Coding Challenge*: Simple Banking System*
 You are tasked with creating a simple banking system with Swift. The system should support the following features:
 *         Create Customer Accounts: Create customer accounts with the following details:
     * Customer Name
     * Account Number
     * Initial Balance
 *         Support Different Account Types: Implement three types of accounts - Savings, Checking, and Business. Each account type may have specific features.
 *         Deposit and Withdraw: Allow customers to deposit and withdraw money from their accounts. Make sure to handle overdraft for checking accounts and minimum balance for savings accounts.
 *         Calculate Interest: For savings accounts, calculate and add monthly interest to the balance.
 *         List All Accounts: Implement a function to list all customer accounts.
 *         Transfer Funds: Implement a fund transfer feature to transfer money between two customer accounts.
 *         Calculate Total Bank Balance: Calculate the total balance of all accounts in the bank.
 Your task is to design and implement the Swift code to achieve these functionalities. You should use classes and inheritance to model accounts, use structs or enums for the account types, apply generics for flexible account management, and employ Swift collections to store and manage customer accounts. Additionally, make use of control statements for account operations, optionals for error handling, protocols and extensions for code organization.

 Plus points if you add more features by yourself
 */
enum BankErrors: Error {
    case invalidAmount
    case insufficientFunds
    
    func Money()->String{
        switch self{
        case .invalidAmount:
            return "invalid amount"
        case .insufficientFunds:
            return "insufficeint Funds"
        }
    }
}
enum accountTypes:CaseIterable{
    case checkingAccount
    case savingAccount
    case businessAccount
    
    func types()->String{
        switch self{
        case .checkingAccount:
            return "checking Account"
        case .savingAccount:
            return "Saving Account"
        case .businessAccount:
            return "Business Account"
        }
    }
}
class BankMainAccount{
    var customerFirstName:String
    var customerLastName:String
    var accountNumber:String
    var intialBalance:Double
    var activeAccout:Bool = false
    
    init(customerFirstName: String, customerLastName: String, accountNumber: String, Balance: Double) {
        self.customerFirstName = customerFirstName
        self.customerLastName = customerLastName
        self.accountNumber = accountNumber
        self.intialBalance = Balance
    }
    //checking for intiail values
    func checkingMinBalance(){
        if(intialBalance < 0.01){
            print("not enough, account need atleast $0.01")
        }
        else{
            activeAccout.toggle()}
    }
    //change of last name
    func changeLastName(lastName: String){
        self.customerLastName = lastName
    }//change of firstname
    func changeFirstName(firstName: String){
        self.customerFirstName = firstName
        
    }
}
//checking account can overdrafts and interst
    struct CheckingAccount{
        var customerFirstName:String
        var customerLastName:String
        var accountNumber:String
        var intialBalance:Double = 0
        var newBalance:Double = 0
        var activeAccout:Bool = false
        var accounttype = accountTypes.checkingAccount
        
        init(customerFirstName: String, customerLastName: String, accountNumber: String, intialBalance: Double) {
            self.customerFirstName = customerFirstName
            self.customerLastName = customerLastName
            self.accountNumber = accountNumber
            self.intialBalance = intialBalance
        }
        //add to balance
        mutating func addBalance(addNumber: Double){
        intialBalance = intialBalance + addNumber
        print("New Balance: $\(intialBalance)")
    }//subtract balance
        mutating func subtractBalance(subNumber:Double){
        newBalance = intialBalance - subNumber
        //check on the balance to be sure it doesn't go to below -10000
        if(newBalance < (-10000)){
            print("Insuffienct Funds")
            print("Balance: $\(intialBalance)")
        }
        else{
            self.intialBalance = intialBalance - subNumber
            print("New Balance: $\(intialBalance)")
        }
    }//add interst
        mutating func addInterst(){
            intialBalance =  intialBalance + intialBalance*0.07
            print("New Balance: $\(intialBalance)")
        }
        mutating func checkingMinBalance(){
            if(intialBalance < 0.01){
                print("not enough, account need atleast $0.01")
            }
            else{
                activeAccout.toggle()}
        }
    
}//saving account no overdrafts allowed but incur interst
struct SavingAccount{
    var customerFirstName:String
    var customerLastName:String
    var accountNumber:String
    var intialBalance:Double
    var activeAccout:Bool = false
    var newBalance:Double = 0
    var accounttype = accountTypes.savingAccount
    
    init(customerFirstName: String, customerLastName: String, accountNumber: String, Balance: Double) {
        self.customerFirstName = customerFirstName
        self.customerLastName = customerLastName
        self.accountNumber = accountNumber
        self.intialBalance = Balance
    }
    //add to balance
    mutating func addBalance(addNumber: Double){
    intialBalance = intialBalance + addNumber
    print("New Balance: $\(intialBalance)")
    }//subtract balance
    mutating func subtractBalance(subNumber:Double){
        newBalance = intialBalance - subNumber
    //check on the balance to be sure it doesn't go to below zero
        if(newBalance < 0){
            print(BankErrors.insufficientFunds)
            print("Balance: $\(intialBalance)")
        }
        else{
            self.intialBalance = intialBalance - subNumber
            print("New Balance: $\(intialBalance)")
        }
    }//add interst
    mutating func addInterst(){
        intialBalance =  intialBalance + intialBalance*0.07
        print("New Balance: $\(intialBalance)")
    }
    mutating func checkingMinBalance(){
        if(intialBalance < 0.01){
            print("not enough, account need atleast $0.01")
        }
        else{
            activeAccout.toggle()}
    }

}
struct BusinessAccount{
    var customerFirstName:String
    var customerLastName:String
    var accountNumber:String
    var intialBalance:Double
    var activeAccout:Bool = false
    var newBalance:Double = 0
    var accountType = accountTypes.businessAccount
    
    init(customerFirstName: String, customerLastName: String, accountNumber: String, Balance: Double) {
        self.customerFirstName = customerFirstName
        self.customerLastName = customerLastName
        self.accountNumber = accountNumber
        self.intialBalance = Balance
    }
    //add to balance
    mutating func addBalance(addNumber: Double){
    intialBalance = intialBalance + addNumber
    print("New Balance: $\(intialBalance)")
    }
    //subtract balance
    mutating func subtractBalance(subNumber:Double){
    newBalance = intialBalance - subNumber
    //check on the balance to be sure it doesn't go to below -100
    if(newBalance < (-100)){
        print(BankErrors.insufficientFunds)
        print("Balance: $\(intialBalance)")
    }
    else{
        self.intialBalance = intialBalance - subNumber
        print("New Balance: $\(intialBalance)")
    }
}//add interst
    mutating func addInterst(){
        intialBalance =  intialBalance + intialBalance*0.07
        print("New Balance: $\(intialBalance)")
    }
    mutating func checkingMinBalance(){
        if(intialBalance < 0.01){
            print("not enough, account need atleast $0.01")
        }
        else{
            activeAccout.toggle()}
    }


}
//add a way to check if business account is active
extension BusinessAccount{
    func activeOrNot(Ac:BusinessAccount){
        if Ac.activeAccout{
            print("Business Account is active")
        }
        else{
            print("Business Account is inactive")
        }
    }
}
 
func addnumGeneric<N:Numeric>(n1:N, n2:N)->N{
    let results = n1 + n2
    return results
    
}
//just a func to transfer money
func accountMainTransfer(AccountNumberFrom:String, AccountNumberTo:String, amount:Double ){
    for value in accountMainLedger{
        if value.accountNumber == AccountNumberFrom{
            
            value.intialBalance = value.intialBalance - amount
            print("New Balance From account \(value.accountNumber): $\(value.intialBalance)")
        }
    }
    for value in accountMainLedger{
        if value.accountNumber == AccountNumberTo{
            value.intialBalance == addnumGeneric(n1: value.intialBalance, n2: amount)
            print("New Balance To account \(value.accountNumber): $\(value.intialBalance)")
        }
    }
}//just a func to transfer money
func accountCheckingTransfer(AccountNumberFrom:String, AccountNumberTo:String, amount:Double ){
    for var value in accountCheckingLedger{
        if value.accountNumber == AccountNumberFrom{
            value.intialBalance = value.intialBalance - amount
            print("New Balance From account \(value.accountNumber): $\(value.intialBalance)")
        }
    }
    for value in accountCheckingLedger{
        if value.accountNumber == AccountNumberTo{
            value.intialBalance == addnumGeneric(n1: value.intialBalance, n2: amount)
            print("New Balance To account \(value.accountNumber): $\(value.intialBalance)")
        }
    }
}//just a func to transfer money
func accountSavingTransfer(AccountNumberFrom:String, AccountNumberTo:String, amount:Double ){
    for var value in accountSavingLedger{
        if value.accountNumber == AccountNumberFrom{
            value.intialBalance = value.intialBalance - amount
            print("New Balance From account \(value.accountNumber): $\(value.intialBalance)")
        }
    }
    for value in accountSavingLedger{
        if value.accountNumber == AccountNumberTo{
            value.intialBalance == addnumGeneric(n1: value.intialBalance, n2: amount)
            print("New Balance To account \(value.accountNumber): $\(value.intialBalance)")
        }
    }
}//just a func to transfer money
func accountBusinessTransfer(AccountNumberFrom:String, AccountNumberTo:String, amount:Double ){
    for value in accountBusinessLedger{
        if value.accountNumber == AccountNumberFrom{
        
            print("New Balance From account \(value.accountNumber): $\(value.intialBalance)")
        }
    }
    for value in accountBusinessLedger{
        if value.accountNumber == AccountNumberTo{
            value.intialBalance == addnumGeneric(n1: value.intialBalance, n2: amount)
        }
    }
}
//TransferAccount feature
func TransferAccount(AccountNumberFrom:String, AccountNumberTo:String, amount:Double ){
    accountMainTransfer(AccountNumberFrom: AccountNumberFrom, AccountNumberTo: AccountNumberTo, amount: amount)
    accountSavingTransfer(AccountNumberFrom: AccountNumberFrom, AccountNumberTo: AccountNumberTo, amount: amount)
    accountCheckingTransfer(AccountNumberFrom: AccountNumberFrom, AccountNumberTo: AccountNumberTo, amount: amount)
    accountBusinessTransfer(AccountNumberFrom: AccountNumberFrom, AccountNumberTo: AccountNumberTo, amount: amount)
}
//this will give you total amount in inidivial bank accounts
func TotalAmount(firstName: String, lastName:String){
    var mainValue:Double = 0
    var checkingValue:Double = 0
    var saveValue:Double = 0
    var businessValue:Double = 0
    var total:Double = 0
    
    for value in accountMainLedger{
        if value.customerFirstName == firstName{
            if value.customerLastName == lastName{
                mainValue = value.intialBalance
                print("Main balance: $\(mainValue)")
                total = total + mainValue
            }
        }
    }
    
    for value in accountCheckingLedger{
        if value.customerFirstName == firstName{
            if value.customerLastName == lastName{
                checkingValue = value.intialBalance
                print("Checking balance: $\(checkingValue)")
                total = total + checkingValue
            }
        }
    }
    for value in accountSavingLedger{
        if value.customerFirstName == firstName{
            if value.customerLastName == lastName{
                saveValue = value.intialBalance
                print("Saving balance: $\(saveValue)")
                total = total + saveValue
            }
        }
    }
    for value in accountBusinessLedger{
        if value.customerFirstName == firstName{
            if value.customerLastName == lastName{
                businessValue = value.intialBalance
                print("Business balance: $\(businessValue)")
                total = total + businessValue
            }
        }
    }
    print("Total amount in account: $\(total)")
}
func TotalAmountBank(){
    var mainValue:Double = 0
    var checkingValue:Double = 0
    var saveValue:Double = 0
    var businessValue:Double = 0
    var total:Double = 0
    
    for value in accountMainLedger{
                mainValue = value.intialBalance
                print("Main balance: $\(mainValue)")
                total = total + mainValue
    }
    for value in accountCheckingLedger{
                checkingValue = value.intialBalance
                print("Checking balance: $\(checkingValue)")
                total = total + checkingValue
    }
    for value in accountSavingLedger{
                saveValue = value.intialBalance
                print("Saving balance: $\(saveValue)")
                total = total + saveValue
    }
    for value in accountBusinessLedger{
                businessValue = value.intialBalance
                print("Business balance: $\(businessValue)")
                total = total + businessValue
    }
    print("Total amount in  Bank accounts: $\(total)")
}
//func that list all the account
func Fullinformation(firstName: String, lastName:String){
    for value in accountMainLedger{
        if value.customerFirstName == firstName{
            if value.customerLastName == lastName{
                
                if(value.activeAccout){
                    print("Main account is active")
                    print("Name: \(value.customerFirstName) \(value.customerLastName)")
                    print("Main balance: $\(value.intialBalance)")
                    print("Main account Number: \(value.accountNumber)")
                }else{
                    print("Main account is inactive")
                }
              
            }
        }
    }
    for value in accountCheckingLedger{
        if value.customerFirstName == firstName{
            if value.customerLastName == lastName{
              
                if(value.activeAccout){
                    print("\(value.accounttype) is active")
                    print("Name: \(value.customerFirstName) \(value.customerLastName)")
                    print("Checking balance: $\(value.intialBalance)")
                    print("c\(value.accounttype)Number: \(value.accountNumber)")
                }else{
                    print("\(value.accounttype) is inactive")
                }
            }
        }
    }
    for value in accountSavingLedger{
        if value.customerFirstName == firstName{
            if value.customerLastName == lastName{
                
                if(value.activeAccout){
                    print("\(value.accounttype)is active")
                    print("Name: \(value.customerFirstName) \(value.customerLastName)")
                    print("Saving balance: $\(value.intialBalance)")
                    print("\(value.accounttype) Number: \(value.accountNumber)")
                }else{
                    print("\(value.accounttype) is inactive")
                }
            }
        }
    }
    for value in accountBusinessLedger{
        if value.customerFirstName == firstName{
            if value.customerLastName == lastName{
                if(value.activeAccout){
                    print("account is active")
                    print("Name: \(value.customerFirstName) \(value.customerLastName)")
                    print("Business balance: $\(value.intialBalance)")
                    print("\(value.accountType) Number: \(value.accountNumber)")
                }else{
                    print("Business account is inactive")
                }
            }
        }
    }
}
//checking for if the classes work 1 checking 2 saving 3 business
var Ba1 = BankMainAccount(customerFirstName: "Tony", customerLastName: "Lieu", accountNumber: "1234", Balance: 100.02)
//Ba1.checkingMinBalance()
print(Ba1.activeAccout)
var Ba2 = BankMainAccount(customerFirstName: "Tom", customerLastName: "Lieu", accountNumber:"2356", Balance: 200)
Ba2.checkingMinBalance()
var c1 = CheckingAccount(customerFirstName: "Tony", customerLastName: "Lieu", accountNumber: "2345", intialBalance: 100)
c1.checkingMinBalance()
//c1.subtractBalance(subNumber: 101)//this is demostrating subtraction
var s1 = SavingAccount(customerFirstName: "Tony", customerLastName: "Lieu", accountNumber: "4567", Balance: 100)
s1.checkingMinBalance()
var b1 = BusinessAccount(customerFirstName: "Tony", customerLastName: "Lieu", accountNumber: "6789", Balance: 100)
b1.checkingMinBalance()
//this is where the accounts will be stored
var accountMainLedger:Array<BankMainAccount> = []
var accountCheckingLedger:Array<CheckingAccount> = []
var accountSavingLedger:Array<SavingAccount> = []
var accountBusinessLedger:Array<BusinessAccount> = []
accountMainLedger.append(Ba1)
accountMainLedger.append(Ba2)
accountCheckingLedger.append(c1)
accountSavingLedger.append(s1)
accountBusinessLedger.append(b1)
for value in accountMainLedger{
    print("Name: \(value.customerFirstName) \(value.customerLastName)")
    print("Main Account Number: \(value.accountNumber)")
    print("Main Account balance: $\(value.intialBalance)")
}
TransferAccount(AccountNumberFrom: "1234", AccountNumberTo: "6789", amount: 10)
//TotalAmount(firstName: "Tony", lastName: "Lieu")
//Fullinformation(firstName: "Tony", lastName: "Lieu")
TotalAmountBank()
TotalAmount(firstName: "Tom", lastName: "Lieu")
b1.activeOrNot(Ac: b1)
