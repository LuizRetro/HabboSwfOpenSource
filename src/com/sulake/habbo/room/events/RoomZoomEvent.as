﻿package com.sulake.habbo.room.events
{
    public class RoomZoomEvent extends RoomEngineEvent 
    {
        public static const ROOM_ZOOM:String = "REE_ROOM_ZOOM";

        private var _level:Number = 1;
        private var _forceFlip:Boolean = false;

        public function RoomZoomEvent(roomId:int, level:Number, _arg_3:*=false, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(ROOM_ZOOM, roomId, _arg_4, _arg_5);
            this._level = level;
            this._forceFlip = _arg_3;
        }

        public function get level():Number
        {
            return this._level;
        }

        public function get isFlipForced():Boolean
        {
            return this._forceFlip;
        }
    }
}
