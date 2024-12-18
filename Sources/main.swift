
import Raylib
main()

func main(){
    Raylib.setTraceLogLevel(TraceLogLevel.error)
    Raylib.initWindow(1600, 900, "Project Geopol")
    var player: Player = Player()
    let bandit: Factions = Factions(index: -1)

    //let npc = NPC(faction: bandit)
    let consola: Factions = Factions(index: 0)
    //let npc1 = NPC(faction: consola)
    
    var camera = Camera2D(offset: Vector2.init(x: 0, y: 0), target: Vector2.init(x: 10, y: 10), rotation: 0, zoom: 1)
    while !Raylib.windowShouldClose {
        Raylib.beginDrawing()
        Raylib.drawFPS(10, 10)
        Raylib.clearBackground(Color.blank)
        Raylib.beginMode2D(camera)
        player.controlLoop(camera: &camera)
        //npc.controlLoop(player: player)
        //npc1.controlLoop(player: player)
        bandit.controlLoop(player: &player)

        Raylib.endMode2D()
        Raylib.endDrawing()
    }
}