
import Raylib


class Player{
    var faction: Factions
    var x: Float32 = Float32(Raylib.getScreenWidth()) / 2.0
    var y: Float32 = Float32(Raylib.getScreenHeight()) / 2.0
    var targetx: Float32 = -1
    var targety: Float32 = -1
    var targetted: Int
    var scheduledeath: Bool
    var scheduleshootings: Bool = false
    var canShoot: Bool = false
    var weapon: Weapons = Weapons()
    func setName(name: String, nameshort: String) {
        self.faction.name = name
        self.faction.nameshort = nameshort
    }
    init(){
        faction = Factions(index: -2)
        self.targetted = -1
        scheduledeath = false
    }
    func controlLoop(camera: inout Camera2D){
        if(self.scheduleshootings == true){
            let result = self.weapon.fireWeapon(targetx: self.targetx, targety: self.targety, startx: self.x, starty: self.y)
            if(result == false){
                self.scheduleshootings = false
                self.scheduledeath = true
            }
        }
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
        // if(Raylib.isKeyPressed(KeyboardKey.space)){
        //     scheduleshooting = true
        // }
        if(Raylib.isKeyPressed(KeyboardKey.space)){
            if(self.canShoot == true){
                self.scheduleshootings = true
            }
            //self.weapon.fireWeapon(targetx: Float32(Raylib.getMouseX()), targety: Float32(Raylib.getMouseY()), startx: self.x, starty: self.y)
        }
        if(Raylib.isKeyPressed(KeyboardKey.p)){
            self.scheduledeath = true
            //self.weapon.fireWeapon(targetx: Float32(Raylib.getMouseX()), targety: Float32(Raylib.getMouseY()), startx: self.x, starty: self.y)
        }
        camera.target.x = Float(self.x) - (Float(Raylib.getScreenWidth()) / 2.0)
        camera.target.y = Float(self.y) - (Float(Raylib.getScreenHeight()) / 2.0)  
    }

    
}