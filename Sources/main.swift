// The Swift Programming Language
// https://docs.swift.org/swift-book
import Raylib
main()

func main(){
    Raylib.setTraceLogLevel(TraceLogLevel.error)
    Raylib.initWindow(1600, 900, "Project Geopol")
    while !Raylib.windowShouldClose {
        Raylib.beginDrawing()
        Raylib.clearBackground(Color.blank)
        Raylib.endDrawing()
    }
}