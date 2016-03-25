package snow.modules.server;

import snow.api.Debug.*;
import snow.api.buffers.Uint8Array;
import snow.api.buffers.ArrayBufferView;
import snow.core.native.io.IO.FileSeek;
import snow.types.Types.FileHandle;

typedef FileHandle = {
    @:optional var input : sys.io.FileInput;
    @:optional var output : sys.io.FileOutput;
}

class IO extends snow.core.native.io.IO {

    override public function app_path_prefs() {

        return './config';

    } //app_path_prefs

//File

    override public function file_handle(_path:String, ?_mode:String="rb") : FileHandle {

        if (_mode == 'w' || _mode == 'wb') {
            var inp = sys.io.File.write(_path, (_mode == 'wb'));
            return { output: inp };
        } else {
            var inp = sys.io.File.read(_path, (_mode == 'rb'));
            return { input: inp };
        }

    } //file_handle

    override public function file_read(file:FileHandle , dest:ArrayBufferView, size:Int, maxnum:Int) : Int {
        assertnull(file);

        if (file.input == null) return -1;
        var rd = file.input.readBytes(dest.buffer, dest.byteOffset, size);
        return rd;
    } //file_read

    override public function file_write(file:FileHandle, src:ArrayBufferView, size:Int, num:Int) : Int {
        assertnull(file);
        if (file.output == null) return -1;
        var rd = file.output.writeBytes(src.buffer, src.byteOffset, size);
        return rd;
    } //file_write

    override public function file_seek(file:FileHandle, offset:Int, whence:Int) : Int {
        assertnull(file);

        var c = switch(whence) {
            case FileSeek.set: sys.io.FileSeek.SeekBegin;
            case FileSeek.cur: sys.io.FileSeek.SeekCur;
            case FileSeek.end: sys.io.FileSeek.SeekEnd;
            default: return -1;
        }
        if (file.output != null) file.output.seek(offset, c);
        if (file.input != null) file.input.seek(offset, c);
        return 0;
    } //file_seek

    override public function file_tell(file:FileHandle) : Int {
        assertnull(file);
        if (file.output != null) return file.output.tell();
        if (file.input != null) return file.input.tell();
        return 0;
    } //file_tell

    override public function file_close(file:FileHandle) : Int {
        assertnull(file);
        if (file.output != null) file.output.close();
        return 0;
    } //file_close


} //IO
