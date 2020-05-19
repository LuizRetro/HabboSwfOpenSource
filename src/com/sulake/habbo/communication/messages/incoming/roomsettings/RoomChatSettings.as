﻿package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomChatSettings 
    {
        public static const _Str_19408:int = 0;
        public static const _Str_12787:int = 1;
        public static const _Str_16907:int = 0;
        public static const _Str_12581:int = 1;
        public static const _Str_16484:int = 2;
        public static const _Str_18404:int = 0;
        public static const _Str_17874:int = 1;
        public static const _Str_16469:int = 2;
        public static const _Str_21099:int = 0;
        public static const _Str_20763:int = 1;
        public static const _Str_22060:int = 2;

        private var _mode:int = 0;
        private var _bubbleWidth:int = 1;
        private var _scrollSpeed:int = 1;
        private var _floodSensitivity:int = 1;
        private var _fullHearRange:int = 14;

        public function RoomChatSettings(k:IMessageDataWrapper)
        {
            this._mode = k.readInteger();
            this._bubbleWidth = k.readInteger();
            this._scrollSpeed = k.readInteger();
            this._fullHearRange = k.readInteger();
            this._floodSensitivity = k.readInteger();
        }

        public function get mode():int
        {
            return this._mode;
        }

        public function get bubbleWidth():int
        {
            return this._bubbleWidth;
        }

        public function get scrollSpeed():int
        {
            return this._scrollSpeed;
        }

        public function get fullHearRange():int
        {
            return this._fullHearRange;
        }

        public function get floodSensitivity():int
        {
            return this._floodSensitivity;
        }
    }
}
