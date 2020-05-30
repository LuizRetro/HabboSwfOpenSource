﻿package com.sulake.habbo.communication.messages.parser.room.session
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CantConnectMessageParser implements IMessageParser
    {
        public static const REASON_FULL:int = 1;
        public static const REASON_CLOSED:int = 2;
        public static const REASON_QUEUE_ERROR:int = 3;
        public static const REASON_BANNED:int = 4;

        private var _reason:int = 0;
        private var _parameter:String = "";


        public function flush():Boolean
        {
            this._reason = 0;
            this._parameter = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._reason = k.readInteger();
            if (this._reason == 3)
            {
                this._parameter = k.readString();
            }
            else
            {
                this._parameter = "";
            }
            return true;
        }

        public function get reason():int
        {
            return this._reason;
        }

        public function get parameter():String
        {
            return this._parameter;
        }
    }
}
