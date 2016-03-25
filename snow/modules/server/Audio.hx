package snow.modules.server;

import snow.api.Debug.*;
import snow.types.Types;
import snow.api.Promise;
import snow.api.buffers.Uint8Array;
import snow.api.buffers.Float32Array;
import snow.systems.audio.AudioSource;
import snow.systems.audio.AudioInstance;

import snow.core.native.audio.NativeAudioData;

@:allow(snow.systems.audio.Audio)
class Audio implements snow.modules.interfaces.Audio {

    var app: snow.Snow;
    var active: Bool = false;

    function new(_app:snow.Snow) {

        app = _app;

        _debug('init');
        active = true;

    } //new

    function onevent(event:SystemEvent) {

    } //onevent

    function shutdown() {
    } //shutdown

    public function suspend() {
    } //suspend

    public function resume() {
    } //resume


    public function play(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle return null;
    public function loop(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle return null;
    public function pause(_handle:AudioHandle) : Void {}
    public function unpause(_handle:AudioHandle) : Void {}
    public function stop(_handle:AudioHandle) : Void {}

    public function volume(_handle:AudioHandle, _volume:Float) : Void {}
    public function pan(_handle:AudioHandle, _pan:Float) : Void {}
    public function pitch(_handle:AudioHandle, _pitch:Float) : Void {}
    public function position(_handle:AudioHandle, _time:Float) : Void {}

    public function volume_of(_handle:AudioHandle) : Float return 0.0;
    public function pan_of(_handle:AudioHandle) : Float return 0.0;
    public function pitch_of(_handle:AudioHandle) : Float return 0.0;
    public function position_of(_handle:AudioHandle) : Float return 0.0;
    public function state_of(_handle:AudioHandle) : AudioState return AudioState.as_stopped;
    public function loop_of(_handle:AudioHandle) : Bool return false;
    public function instance_of(_handle:AudioHandle) : AudioInstance return null;

//data API

        /** Promises an AudioData instance from the given path */
    public function data_from_load(_path:String, ?_is_stream:Bool=false, ?_format:AudioFormatType) : Promise {

        return NativeAudioData.data_from_load(app, _path, _is_stream, _format);

    } //data_from_load

        /** Promises an AudioData instance from the given bytes */
    public function data_from_bytes(_id:String, _bytes:Uint8Array, ?_format:AudioFormatType) : Promise {

        return NativeAudioData.data_from_bytes(app, _id, _bytes, _format);

    } //data_from_bytes

} //Audio
