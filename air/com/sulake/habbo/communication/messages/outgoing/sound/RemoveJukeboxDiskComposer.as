//com.sulake.habbo.communication.messages.outgoing.sound.RemoveJukeboxDiskComposer

package com.sulake.habbo.communication.messages.outgoing.sound{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class RemoveJukeboxDiskComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function RemoveJukeboxDiskComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.sound

