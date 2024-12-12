
import Raylib
main()

func main(){
    Raylib.setTraceLogLevel(TraceLogLevel.error)
    Raylib.initWindow(1600, 900, "Project Geopol")
    let player: Player = Player()
    let npc = NPC(index: 0)
    let npc1 = NPC(index: 1)

    var camera = Camera2D(offset: Vector2.init(x: 0, y: 0), target: Vector2.init(x: 10, y: 10), rotation: 0, zoom: 1)
    while !Raylib.windowShouldClose {
        Raylib.beginDrawing()
        Raylib.drawFPS(10, 10)
        Raylib.clearBackground(Color.blank)
        Raylib.beginMode2D(camera)
        player.controlLoop(camera: &camera)
        npc.controlLoop(player: player)
        npc1.controlLoop(player: player)
        Raylib.endMode2D()
        Raylib.endDrawing()
    }
}