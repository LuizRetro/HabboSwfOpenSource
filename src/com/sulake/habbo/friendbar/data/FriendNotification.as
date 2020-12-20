﻿package com.sulake.habbo.friendbar.data
{
    public class FriendNotification implements IFriendNotification 
    {
        public static const TYPE_MESSENGER:int = -1;
        public static const TYPE_ROOM_EVENT:int = 0;
        public static const TYPE_ACHIEVEMENT:int = 1;
        public static const TYPE_QUEST:int = 2;
        public static const _Str_5815:int = 3;
        public static const _Str_9572:int = 4;
        public static const _Str_6669:int = 5;

        private var _typeCode:int = -1;
        private var _message:String;
        private var _viewOnce:Boolean;

        public function FriendNotification(k:int, _arg_2:String, _arg_3:Boolean)
        {
            this._typeCode = k;
            this._message = _arg_2;
            this._viewOnce = _arg_3;
        }

        public static function _Str_23838(k:int):String
        {
            switch (k)
            {
                case TYPE_MESSENGER:
                    return "instant_message";
                case TYPE_ROOM_EVENT:
                    return "room_event";
                case TYPE_ACHIEVEMENT:
                    return "achievement";
                case TYPE_QUEST:
                    return "quest";
                case _Str_5815:
                    return "playing_game";
                case _Str_9572:
                    return "finished_game";
                case _Str_6669:
                    return "game_invite";
            }
            return "unknown";
        }


        public function get _Str_3293():int
        {
            return this._typeCode;
        }

        public function set _Str_3293(k:int):void
        {
            this._typeCode = k;
        }

        public function get message():String
        {
            return this._message;
        }

        public function set message(k:String):void
        {
            this._message = k;
        }

        public function get _Str_6239():Boolean
        {
            return this._viewOnce;
        }

        public function set _Str_6239(k:Boolean):void
        {
            this._viewOnce = k;
        }
    }
}
