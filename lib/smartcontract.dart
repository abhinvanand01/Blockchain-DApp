import 'package:http/http.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:web3dart/web3dart.dart';
import 'location.dart';
class SmartContract {
  late Client httpClient;
  late String details;
  late Web3Client ethClient;
  var idx = BigInt.from(0);
  bool data = false;
  String productID = '-1';
  var myAddress = "0x41f8c02E5f58f61D86Ff130E7DA44b416a859093";

  //initialising State
  SmartContract() {
    httpClient = Client();
    ethClient = Web3Client(
        "https://rinkeby.infura.io/v3/316e13b64fb54f9a9b7a4c31d595ae38",
        httpClient);
  }

  // Solidity Function Calls
  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0x2b641f0E1E8E06EECCCd074aEa1B19dBE632CE24";
    final contract = DeployedContract(ContractAbi.fromJson(abi, 'SupplyChain'),
        EthereumAddress.fromHex(contractAddress));
    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic>args) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<String> submit(String functionName, List<dynamic> args) async {
    EthPrivateKey credentials = EthPrivateKey.fromHex(
        "05199551efae332068dbe395e3a673befd1a98d44d1835ae04a2d2818ca95cdb");
    DeployedContract contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.sendTransaction(credentials,
        Transaction.callContract(
            contract: contract, function: ethFunction, parameters: args),
        chainId: 4);
    return result;
  }

  Future<void> newItem(String productName, String desc,String uname) async
  {
    String today = date();
    String newLocation = await Location.getLocation();
     await submit(
        'newItem', [productName, today, desc,uname, newLocation]);
    print("Success");
  }

  Future<void> addState(int productID) async {
    String lastLocation = await Location.getLocation();
    var bigID = BigInt.from(productID);
    await submit("addState", [bigID, lastLocation]);
  }

  Future<String> getProductID() async
  {
    List<dynamic> result = await query('getProductID', []);
    return result[0].toString();
  }

  static List<String> allData = ["hello", "hello", "hello", "hello", "HEllo"];

  getFormattedData(int productID) async {
    String data = await searchProduct(productID);
    print(data);
    int j = 0;
    String temp = "";
    for (int i = 1; i < data.length; i++) {
      if (data[i] == ':') {
        allData[j] = temp;
        j++;
        temp = "";
      }
      else
        temp = temp + data[i];
    }
    allData[4] = temp;
    print(allData[4]);
    return allData;
  }

  Future<String> searchProduct(int productID) async {
    var bigID = BigInt.from(productID);
    List<dynamic> result = await query("searchProduct", [bigID]);
    return result[0].toString();
  }

  Future<String> getState(int productID) async
  {
    var p = BigInt.from(productID);
    List<dynamic> result = await query("getState", [p]);
    print(result[0].toString());
    return result[0].toString();
  }


  String date() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }
}


