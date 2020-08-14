﻿package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._Str_7083;

    public class ChatReviewSessionStartedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function ChatReviewSessionStartedMessageEvent(k:Function)
        {
            super(k, _Str_7083);
        }

        public function getParser():_Str_7083
        {
            return _parser as _Str_7083;
        }
    }
}