
import Raylib


class Player{
    var faction: Factions
    var x: Float32 = Float32(Raylib.getScreenWidth()) / 2.0
    var y: Float32 = Float32(Raylib.getScreenHeight()) / 2.0
    func setName(name: String, nameshort: String) {
        self.faction.name = name
        self.faction.nameshort = nameshort
    }
    init(){
        faction = Factions(index: -2)
    }
    func controlLoop(camera: inout Camera2D){
        Raylib.drawText(self.faction.nameshort, Int32(self.x), Int32(self.y) - 40, 20, self.faction.getRGB())
        Raylib.drawCircle(Int32(self.x), Int32(self.y), 20, self.faction.getRGB())
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