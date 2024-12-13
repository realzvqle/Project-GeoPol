
import Raylib


class NPC {
    var faction: Factions
    var x: Float32 = 90.0
    var y: Float32 = 90.0
    
    init(index: Int){
        faction = Factions(index: index)
    }
    func printabout() -> String {
        return  """
                Name is \(self.faction.name) (short name is \(self.faction.nameshort))
                Is a Bandit? \(self.faction.isBandit)
                Hostilie? \(self.faction.hostility)
                Mutual Respect? \(self.faction.respect)
                """
    }
    func controlLoop(player: Player) {
        Raylib.drawText(self.faction.nameshort, Int32(self.x), Int32(self.y) - 40, 20, self.faction.getRGB())

        Raylib.drawCircle(Int32(self.x), Int32(self.y), 20, self.faction.getRGB())
        if(self.faction.hostility == true){
            if abs(player.x - self.x) <= 400 && abs(player.y - self.y) <= 400 { 
                if abs(player.x - self.x) <= 100 && abs(player.y - self.y) <= 100 {
                    print("Range!")
                } else {
                    if player.x < self.x {
                        self.x -= 400 * Float32(Raylib.getFrameTime())
                    } else if player.x > self.x {
                        self.x += 400 * Float32(Raylib.getFrameTime())
                    }
                    if player.y < self.y {
                        self.y -= 400 * Float32(Raylib.getFrameTime())
                    } else if player.y > self.y {
                        self.y += 400 * Float32(Raylib.getFrameTime())
                    }
                }
            }

        }
    }
}