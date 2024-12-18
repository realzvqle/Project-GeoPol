import Raylib


class Factions {
    let namechoice = ["Consolan Republic", "Kingdom of Najidert", "Sovienian Union", 
                                         "Murri Revolutionary Forces", "Murican Empire", "Brotian State"]
    let namechoiceshort = ["Consola", "Najidert", "Sovienia", 
                                             "Murri", "Murica", "Brotia"]

    var npc: [NPC] = []
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
        
        for _ in 0..<1 {
            npc.append(NPC(faction: self, x: Float32.random(in: 0.0...Float32(Raylib.getScreenWidth())), y: Float32.random(in: 0.0...Float32(Raylib.getScreenHeight()))))
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

    func controlLoop(player: inout Player){
        for index in npc.indices {
            if(npc[index].isAlive != false){
                npc[index].controlLoop(player: player)
            }
            if(Float32(abs(Float32(Raylib.getMouseX()) - npc[index].x)) <= 30 && Float32(abs(Float32(Raylib.getMouseY()) - npc[index].y)) <= 30){
                if(Raylib.isMouseButtonPressed(MouseButton.left)){
                    // npc[index].isAlive = false
                    // print("clicked!")
                    player.targetted = index
                    player.canShoot = true
                }
                print("In Range!")
            }
            if(player.targetted == -1){
                player.canShoot = false
                continue;
            }
            if(index == player.targetted){
                Raylib.drawRectangleLines(Int32(npc[index].x) - 30, Int32(npc[index].y) - 30, 60, 60, self.getRGB())
            }
            
            if(player.scheduledeath == true){
                npc[player.targetted].isAlive = false
                player.scheduledeath = false
                player.targetted = -1
            }
            if(Raylib.isKeyPressed(KeyboardKey.space)){
                player.scheduleshootings = true
                player.targetx = npc[player.targetted].x
                player.targety = npc[player.targetted].y
            }
        }
    }
    
}