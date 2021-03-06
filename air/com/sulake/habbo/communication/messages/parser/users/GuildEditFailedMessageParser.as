//com.sulake.habbo.communication.messages.parser.users.GuildEditFailedMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuildEditFailedMessageParser implements IMessageParser {

        public static const INSUFFICIENT_SUBSCRIPTION_LEVEL:int;

        private var _reason:int;

        public function GuildEditFailedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get reason():int;


    }
}//package com.sulake.habbo.communication.messages.parser.users

