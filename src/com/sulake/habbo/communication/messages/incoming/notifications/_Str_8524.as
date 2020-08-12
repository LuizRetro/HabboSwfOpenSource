﻿package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.GoToBreedingNestFailureParser;

    public class _Str_8524 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8524(k:Function)
        {
            super(k, GoToBreedingNestFailureParser);
        }

        public function getParser():GoToBreedingNestFailureParser
        {
            return _parser as GoToBreedingNestFailureParser;
        }
    }
}
