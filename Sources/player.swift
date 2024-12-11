
import Raylib


class Player{
    var name: String
    var nameshort: String
    var x: Float32 = Float32(Raylib.getScreenWidth()) / 2.0
    var y: Float32 = Float32(Raylib.getScreenHeight()) / 2.0
    func setName(name: String, nameshort: String) {
        self.name = name
        self.nameshort = nameshort
        
    }
    init(){
        self.name = "Republic of Mokasia"
        self.nameshort = "Mokasia"
    }
    func controlLoop(camera: inout Camera2D){
        Raylib.drawText(self.nameshort, Int32(self.x), Int32(self.y) - 40, 20, Color.blue)
        Raylib.drawCircle(Int32(self.x), Int32(self.y), 20, Color.blue)
        if Raylib.isKeyDown(KeyboardKey.w) {
            self.y -= 600 * Raylib.getFrameTime()
        }
        if Raylib.isKeyDown(KeyboardKey.s) {
            self.y += 600 * Raylib.getFrameTime()
        }
        if Raylib.isKeyDown(KeyboardKey.a) {
            self.x -= 600 * Raylib.getFrameTime()
        }
        if Raylib.isKeyDown(KeyboardKey.d) {
            self.x += 600 * Raylib.getFrameTime()
        }
        camera.target.x = Float(self.x) - (Float(Raylib.getScreenWidth()) / 2.0)
        camera.target.y = Float(self.y) - (Float(Raylib.getScreenHeight()) / 2.0)
        
    }
}