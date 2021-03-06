﻿package com.sulake.habbo.communication.messages.incoming.talent
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.talent.TalentLevelUpMessageParser;

    public class TalentLevelUpEvent extends MessageEvent implements IMessageEvent 
    {
        public function TalentLevelUpEvent(k:Function)
        {
            super(k, TalentLevelUpMessageParser);
        }

        public function getParser():TalentLevelUpMessageParser
        {
            return _parser as TalentLevelUpMessageParser;
        }
    }
}
