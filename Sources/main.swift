// The Swift Programming Language
// https://docs.swift.org/swift-book
import Raylib
main()

func main(){
    let npc = NPC(index: 3)
    Raylib.setTraceLogLevel(TraceLogLevel.error)
    Raylib.initWindow(1600, 900, "Project Geopol")
    while !Raylib.windowShouldClose {
        Raylib.beginDrawing()
        Raylib.clearBackground(Color.blank)
        Raylib.drawText(npc.printabout(), 10, 10, 30, npc.getRGB())
        Raylib.endDrawing()
    }
}