package snow.modules.server;

import snow.api.Debug.*;
import snow.types.Types;
import timestamp.Timestamp; // TODO: this dependency is not supported for java target

@:allow(snow.Snow)
class Runtime extends snow.core.native.Runtime {

    function new(_app:snow.Snow) {

        super(_app);
        timestamp_start = timestamp();
        name = 'server';

        app.config.runtime = {}

        _debug('server / init ok');

    } //new

    override function ready() {

        _debug('server / ready');

    } //ready

    override function run() : Bool {

        _debug('server / run');

        return run_loop();

    } //run

    override function shutdown(?_immediate:Bool=false) {

        _debug('server / shutdown');

    } //shutdown

    override function window_grab(enable:Bool) : Bool {
        return false;
    } //window_grab

    public inline function window_swap() {
        // Instead of swapping we sleep some time to give
        // other processes time to execute
        Sys.sleep(0.01);

    } //window_swap

    override function window_fullscreen(enable:Bool, ?true_fullscreen:Bool=false) : Bool {
        return false;
    } //window_fullscreen

    override inline public function window_width() :Int return window_w;
    override inline public function window_height() :Int return window_h;

    var window_dpr = 1.0;
    override function window_device_pixel_ratio() : Float return 1.0;

    static var timestamp_start : Float = 0.0;
    inline public static function timestamp() : Float {

        return Timestamp.now() - timestamp_start;

    } //timestamp

    function run_loop() {

        var _done = true;

        _debug('server / running main loop');

        while(!app.shutting_down) {

            loop(0);

        }

        return _done;

    } //run_loop

    function loop(_) {

        app.dispatch_event(se_tick);

        if(!app.has_shutdown) {
            window_swap();
        }

    } //loop

    var window_w : Int = 0;
    var window_h : Int = 0;

    inline function to_pixels(_value:Float) : Int {
        return Math.floor(window_dpr * _value);
    }

} //Runtime

typedef WindowHandle = Int;

typedef RuntimeConfig = {

    //:todo: potential sdl runtime config

} //RuntimeConfig
