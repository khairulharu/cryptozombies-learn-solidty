pragma solidity >=0.5.0 <0.6.0;

import "./zombiefeeding.sol";

contract ZombieHelper is ZombieFeeding {
    //modifier basiccly kayak validator gitu buat function, yang bisa di reusable simple kayak di bwah buat ngechek level zombiesnya
    //kalau gak makai modifier mau gak mau harus nambah kayak rrquire di setiap function, sebenarnya di sini masih bisa di smplicty di bagian ngecheck owner
    //cuman sampai kode ini di buat apakah bisa lebih dari satu modifier di satu function
  modifier aboveLevel(uint _level, uint _zombieId) {
    require(zombies[_zombieId].level >= _level);
    _;
  }

  function changeName(uint _zombieId, string calldata _newName) external aboveLevel(2, _zombieId) {
    //ini duplikat sebenarnya di changeDna juga ngecheck ownernya berdasarkan zombie id nya, itu kalau di liat buatin modifier aja kan wkwkw
    require(msg.sender == zombieToOwner[_zombieId]);
    zombies[_zombieId].name = _newName;
  }

  function changeDna(uint _zombieId, uint _newDna) external aboveLevel(20, _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]);
    zombies[_zombieId].dna = _newDna;
  }

  // view function gunanya ketika gak ada transaksi yang berjalan di function tersebut simple kayak cuman read data gitu, karena view function gak make gas sama sekali
  // tapi percuma kalau view function di panggil atau di pakai di function yang nge treat transaction soalnya tetep makai gas, seperti itulah penjelasn otak gua, 
  function getZombiesByOwner(address _owner) external view returns(uint[] memory) {
    // Start here
  }