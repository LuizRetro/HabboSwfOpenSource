﻿package com.sulake.habbo.communication.messages.outgoing.game.score
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetWeeklyGameRewardWinnersComposer implements IMessageComposer
    {
        private var _data:Array;

        public function GetWeeklyGameRewardWinnersComposer(k:int)
        {
            this._data = [];
            super();
            this._data.push(k);
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
            this._data = null;
        }
    }
}