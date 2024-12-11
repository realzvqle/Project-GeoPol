
import Raylib


class NPC {
    var hostility: Bool
    var isBandit: Bool
    var respect: UInt8
    var name: String
    var nameshort: String
    var x: Float32 = 90.0
    var y: Float32 = 90.0
    private let namechoice = ["Consolan Republic", "Kingdom of Najidert", "Sovienian Union", 
                                         "Murri Revolutionary Forces", "Murican Empire", "Brotian State"]
    private let namechoiceshort = ["Consola", "Najidert", "Sovienia", 
                                             "Murri", "Murica", "Brotia"]

    
    init(index: Int){
        if(index == 0){
            self.isBandit = true
        } else {
            self.isBandit = false
        }
        if(self.isBandit == true){
            self.respect = 0;
            self.name = "The Bandits"
            self.nameshort = "Bandits"
            self.hostility = true
        }
        else {
            self.name = self.namechoice[index]
            self.nameshort = self.namechoiceshort[index]
            self.respect = UInt8.random(in: 1...255)
            if self.respect < 20 {
                self.hostility = true
            } else {
                self.hostility = false
            }
        }
    }
    func printabout() -> String {
        return  """
                Name is \(self.name) (short name is \(self.nameshort))
                Is a Bandit? \(self.isBandit)
                Hostilie? \(self.hostility)
                Mutual Respect? \(self.respect)
                """
    }
    func getRGB() -> Color {
        if(self.hostility == true){
            return Color.red
        } else {
            let red = 255 - self.respect
            let green = self.respect 
            let blue: UInt8 = 0 
            return Color.init(r: red, g: green, b: blue, a: 255)
        }
    }
    func controlLoop(player: Player) {
        Raylib.drawText(self.nameshort, Int32(self.x), Int32(self.y) - 40, 20, self.getRGB())

        Raylib.drawCircle(Int32(self.x), Int32(self.y), 20, self.getRGB())
        if(self.hostility == true){
            if(abs(player.x - self.x) <= 400 || abs(player.y - self.y) <= 400) {
                if player.x <= self.x {
                    self.x -= 400 * Float32(Raylib.getFrameTime())
                } else if player.x >= self.x {
                    self.x += 400 * Float32(Raylib.getFrameTime())
                } 
                if player.y >= self.y {
                    self.y += 400 * Float32(Raylib.getFrameTime())
                } else if player.y <= self.y {
                    self.y -= 400 * Float32(Raylib.getFrameTime())
                }
            }
        }
    }
}