﻿package com.sulake.habbo.groups
{
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.users.IGuildData;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class GuildSettingsCtrl 
    {
        public static const TYPE_REGULAR:int = 0;
        public static const TYPE_EXCLUSIVE:int = 1;
        public static const TYPE_CLOSED:int = 2;
        public static const TYPE_LARGE:int = 3;
        public static const TYPE_LARGE_CLOSED:int = 4;
        public static const RIGHTS_MEMBERS:int = 0;
        public static const RIGHTS_ADMINS:int = 1;

        private var _data:GuildSettingsData;
        private var _guildSelector:ISelectorWindow;
        private var _guildRegular:IRadioButtonWindow;
        private var _guildExclusive:IRadioButtonWindow;
        private var _guildClosed:IRadioButtonWindow;
        private var _membersHaveRights:ICheckBoxWindow;


        public function prepare(k:IWindowContainer):void
        {
            var _local_2:IWindowContainer = (k.findChildByName("step_cont_5") as IWindowContainer);
            this._guildSelector = (_local_2.findChildByName("group_type_selector") as ISelectorWindow);
            this._guildRegular = (_local_2.findChildByName("rb_type_regular") as IRadioButtonWindow);
            this._guildRegular.procedure = this._Str_25413;
            this._guildExclusive = (_local_2.findChildByName("rb_type_exclusive") as IRadioButtonWindow);
            this._guildExclusive.procedure = this._Str_22719;
            this._guildClosed = (_local_2.findChildByName("rb_type_private") as IRadioButtonWindow);
            this._guildClosed.procedure = this._Str_22569;
            this._membersHaveRights = (_local_2.findChildByName("cb_member_rights") as ICheckBoxWindow);
            this._membersHaveRights.procedure = this._Str_25398;
        }

        public function refresh(k:IGuildData):void
        {
            this._data = new GuildSettingsData(k);
            switch (this._data._Str_4830)
            {
                case TYPE_REGULAR:
                    this._guildSelector.setSelected(this._guildRegular);
                    break;
                case TYPE_EXCLUSIVE:
                    this._guildSelector.setSelected(this._guildExclusive);
                    break;
                case TYPE_CLOSED:
                    this._guildSelector.setSelected(this._guildClosed);
                    break;
                default:
                    this._guildSelector.setSelected(this._guildRegular);
            }
            if (this._data._Str_7959 == GuildSettingsCtrl.RIGHTS_MEMBERS)
            {
                this._membersHaveRights.select();
            }
            else
            {
                this._membersHaveRights.unselect();
            }
            this._guildSelector.invalidate();
        }

        private function _Str_25413(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_SELECT)
            {
                this._data._Str_4830 = TYPE_REGULAR;
            }
        }

        private function _Str_22719(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_SELECT)
            {
                this._data._Str_4830 = TYPE_EXCLUSIVE;
            }
        }

        private function _Str_22569(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_SELECT)
            {
                this._data._Str_4830 = TYPE_CLOSED;
            }
        }

        private function _Str_25398(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_SELECT)
            {
                this._data._Str_7959 = GuildSettingsCtrl.RIGHTS_MEMBERS;
            }
            if (k.type == WindowEvent.WINDOW_EVENT_UNSELECT)
            {
                this._data._Str_7959 = GuildSettingsCtrl.RIGHTS_ADMINS;
            }
        }

        public function _Str_15948():void
        {
            if (((!(this._data == null)) && (this._data._Str_22472)))
            {
                this._data._Str_15948();
            }
        }

        public function get _Str_4830():int
        {
            return this._data._Str_4830;
        }

        public function get _Str_7959():int
        {
            return this._data._Str_7959;
        }

        public function get isInitialized():Boolean
        {
            return !(this._data == null);
        }
    }
}

