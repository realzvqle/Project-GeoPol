
import Raylib


class Weapons{
    var x: Float32 = -1
    var y: Float32 = -1
    var targetx: Float32 = -1
    var targety: Float32 = -1
    //var targetreached: Bool = false
    var initweapon: Bool = false

    init(){
        return;
    }
    func fireWeapon(targetx: Float32, targety: Float32, startx: Float32, starty: Float32) -> Bool{
        if(self.initweapon == false){
            self.x = startx
            self.y = starty
            self.initweapon = true
        }
        if targetx < self.x {
            self.x -= (700) * Float32(Raylib.getFrameTime())
        } else if targetx > self.x {
            self.x += (700) * Float32(Raylib.getFrameTime())
        } 
        if targety < self.y {
            self.y -= (700) * Float32(Raylib.getFrameTime())
        } else if targety > self.y {
            self.y += (700) * Float32(Raylib.getFrameTime())
        }
        Raylib.drawRectangle(Int32(self.x), Int32(self.y), 20, 20, Color.white)
        if(abs(self.x - targetx) <= 30 && abs(self.y - targety) <= 30){
            self.initweapon = false
            return false
        } else {
            return true
        }
    }
}
