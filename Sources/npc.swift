
import Raylib


class NPC {
    var faction: Factions
    var x: Float32 = 0
    var y: Float32 = 0
    var isAlive: Bool
    var isTargetted: Bool
    var speedunique: Float32
    var limitunique: Float32
    init(faction: Factions, x: Float32, y: Float32){
        self.faction = faction
        self.y = y
        self.x = x
        self.isAlive = true
        self.isTargetted = false
        self.speedunique = Float32.random(in: 0...40)
        self.limitunique = Float32.random(in: 100...300)
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
            if abs(player.x - self.x) <= 400 + limitunique && abs(player.y - self.y) <= 400 + limitunique { 
                if abs(player.x - self.x) <= 100 + limitunique && abs(player.y - self.y) <= 100 + limitunique {
                    print("Range!")
                } else {
                    if player.x < self.x {
                        self.x -= (500 + speedunique) * Float32(Raylib.getFrameTime())
                    } else if player.x > self.x {
                        self.x += (500 + speedunique) * Float32(Raylib.getFrameTime())
                    }
                    if player.y < self.y {
                        self.y -= (500 + speedunique) * Float32(Raylib.getFrameTime())
                    } else if player.y > self.y {
                        self.y += (500 + speedunique) * Float32(Raylib.getFrameTime())
                    }
                }
            }

        }
    }
}