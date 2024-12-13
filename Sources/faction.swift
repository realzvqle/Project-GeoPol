import Raylib


class Factions {
    let namechoice = ["Consolan Republic", "Kingdom of Najidert", "Sovienian Union", 
                                         "Murri Revolutionary Forces", "Murican Empire", "Brotian State"]
    let namechoiceshort = ["Consola", "Najidert", "Sovienia", 
                                             "Murri", "Murica", "Brotia"]
    var hostility: Bool
    var isBandit: Bool
    var isPlayer: Bool
    var respect: UInt8
    var name: String
    var nameshort: String
    init(index: Int){
        if(index == -1){
            self.isBandit = true
        } else {
            self.isBandit = false
        }
        if(index == -2){
            self.isPlayer = true
        } else {
            self.isPlayer = false
        }
        if(self.isBandit == true){
            self.respect = 0;
            self.name = "The Bandits"
            self.nameshort = "Bandits"
            self.hostility = true
        } else if(self.isPlayer == true){
            self.respect = 255;
            self.name = "Mokovian Republic"
            self.nameshort = "Mokovia"
            self.hostility = false
        } else {
            self.name = self.namechoice[index]
            self.nameshort = self.namechoiceshort[index]
            self.respect = 127
            if self.respect < 20 {
                self.hostility = true
            } else {
                self.hostility = false
            }
        }
    }
    func getRGB() -> Color {
        if(self.hostility == true){
            return Color.red
        } else if(self.isPlayer == true){
            return Color.blue
        } else {
            let red = 255 - self.respect
            let green = self.respect 
            let blue: UInt8 = 0 
            return Color.init(r: red, g: green, b: blue, a: 255)
        }
    }
    
}