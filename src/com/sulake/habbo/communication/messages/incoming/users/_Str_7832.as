﻿package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GuildEditFailedMessageParser;

    public class _Str_7832 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7832(k:Function)
        {
            super(k, GuildEditFailedMessageParser);
        }

        public function get reason():int
        {
            return GuildEditFailedMessageParser(_parser).reason;
        }
    }
}
