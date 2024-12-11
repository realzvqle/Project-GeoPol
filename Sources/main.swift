
import Raylib
main()

func main(){
    Raylib.setTraceLogLevel(TraceLogLevel.error)
    Raylib.initWindow(1600, 900, "Project Geopol")
    let player: Player = Player()
    let npc = NPC(index: 1)

    while !Raylib.windowShouldClose {
        Raylib.beginDrawing()
        Raylib.clearBackground(Color.blank)
        player.controlLoop()
        Raylib.drawFPS(10, 10)
        npc.controlLoop(player: player)
        Raylib.endDrawing()
    }
}