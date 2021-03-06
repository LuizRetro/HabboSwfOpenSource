﻿package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.QuizResultsMessageParser;

    public class QuizResultsMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function QuizResultsMessageEvent(k:Function)
        {
            super(k, QuizResultsMessageParser);
        }

        public function getParser():QuizResultsMessageParser
        {
            return _parser as QuizResultsMessageParser;
        }
    }
}
