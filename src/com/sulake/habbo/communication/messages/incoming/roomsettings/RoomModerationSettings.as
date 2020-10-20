﻿package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomModerationSettings
    {
        public static const _Str_10707:int = 0;
        public static const _Str_5047:int = 1;
        public static const _Str_11537:int = 2;

        private var _Str_10533:int;
        private var _Str_9800:int;
        private var _whoCanBan:int;

        public function RoomModerationSettings(k:IMessageDataWrapper)
        {
            this._Str_10533 = k.readInteger();
            this._Str_9800 = k.readInteger();
            this._whoCanBan = k.readInteger();
        }

        public function get _Str_7688():int
        {
            return this._Str_10533;
        }

        public function get _Str_6332():int
        {
            return this._Str_9800;
        }

        public function get whoCanBan():int
        {
            return this._whoCanBan;
        }
    }
}
