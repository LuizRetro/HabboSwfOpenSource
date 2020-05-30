﻿package com.sulake.habbo.communication.messages.parser.notifications
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ClubGiftNotificationParser implements IMessageParser
    {
        private var _numGifts:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._numGifts = k.readInteger();
            return true;
        }

        public function get numGifts():int
        {
            return this._numGifts;
        }
    }
}
