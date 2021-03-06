﻿package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RemoveItemMessageComposer implements IMessageComposer
    {
        private var _objectId:int;

        public function RemoveItemMessageComposer(k:int)
        {
            this._objectId = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._objectId];
        }
    }
}
