// Map 심화 과정
// 사용자의 가방을 뜻하는 Map 1개 와
// 생선가게 Map 하나를 만들고
// 생선가게에서 사용자의 가방으로 생선을 옮기는 작업을 하는
// 코드를 짜시오.
// 도미5 참치3 연어7 광어 13이 있을 때,
// 사용자가 참치를 3개 사면 -> 상점은 참치 0
// 그 이상의 것을 사고자 헀을 땐, 못산다 하는 print를 반환하게

class FishShop {
  late Map _fishList;
  late Player player;

  FishShop([Map<String, int>? givenValue]) {
    _fishList = givenValue ?? {};
  }

  Map get getCurrentFishList => _fishList;

  set buyFish(String fishName) => {
    if (_fishList.containsKey(fishName))
      {
        if (_fishList[fishName] > 0)
          {
            _fishList[fishName] -= 1,
            player.AddFish = fishName,
            print("$fishName을 구매 성공했습니다."),
          }
        else
          print("$fishName 재고가 부족합니다."),
      }
    else
      {print("해당 생선은 판매하지 않습니다.")},
  };

  void registerPlayer(Player p) {
    player = p;
  }
}

class Player {
  late Map _fishbag;
  late FishShop fishshop;

  Player(this.fishshop) {
    _fishbag = {};
  }

  Map get getFishbag => _fishbag;

  set AddFish(givenName) => _fishbag[givenName] == null
      ? _fishbag[givenName] = 1
      : _fishbag[givenName] += 1;
}

void main() {
  var fishshop = FishShop({"도미": 5, "참치": 3, "연어": 7, "광어": 13});

  var player = Player(fishshop);

  fishshop.registerPlayer(player);
  print(fishshop.getCurrentFishList);

  fishshop.buyFish = "숭어";

  fishshop.buyFish = "도미";
  print(player.getFishbag);

  print(fishshop.getCurrentFishList);
}
