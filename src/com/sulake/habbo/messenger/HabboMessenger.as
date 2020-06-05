﻿package com.sulake.habbo.messenger
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.friendlist.IHabboFriendsList;
    import com.sulake.habbo.sound.IHabboSoundManager;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.help.IHabboHelp;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_5567;
    import com.sulake.habbo.communication.messages.incoming.preferences.AccountPreferencesEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_11459;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_11571;
    import com.sulake.habbo.messenger.events.MiniMailMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_8206;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_4851;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_8339;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_4696;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.sound.HabboSoundTypesEnum;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_6189;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_5791;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_7091;
    import com.sulake.habbo.messenger.events.ActiveConversationEvent;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendlist.IFriend;
    import __AS3__.vec.*;

    public class HabboMessenger extends Component implements IHabboMessenger 
    {
        private var _windowManager:IHabboWindowManager;
        private var _communicationManager:IHabboCommunicationManager;
        private var _localizationManager:IHabboLocalizationManager;
        private var _friendsList:IHabboFriendsList;
        private var _soundManager:IHabboSoundManager;
        private var _tracking:IHabboTracking;
        private var _miniMailUnseenCount:int = 0;
        private var _sessionDataManager:ISessionDataManager;
        private var _help:IHabboHelp;
        private var _mainView:MainView;
        private var _messageEvents:Vector.<IMessageEvent>;
        private var _roomInvitesIgnored:Boolean = false;

        public function HabboMessenger(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDHabboSoundManager(), function (k:IHabboSoundManager):void
            {
                _soundManager = k;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localizationManager = k;
            }), new ComponentDependency(new IIDHabboFriendList(), function (k:IHabboFriendsList):void
            {
                _friendsList = k;
            }), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }), new ComponentDependency(new IIDHabboTracking(), function (k:IHabboTracking):void
            {
                _tracking = k;
            }), new ComponentDependency(new IIDHabboHelp(), function (k:IHabboHelp):void
            {
                _help = k;
            })]));
        }

        override protected function initComponent():void
        {
            this._messageEvents = new Vector.<IMessageEvent>(0);
            this.addMessageEvent(new _Str_5567(this._Str_19006));
            this.addMessageEvent(new AccountPreferencesEvent(this.onAccountPreferences));
            if (getBoolean("client.minimail.embed.enabled"))
            {
                this.addMessageEvent(new _Str_11459(this.onMiniMailMessage));
                this.addMessageEvent(new _Str_11571(this.onMiniMailUnreadCount));
            }
        }

        private function addMessageEvent(k:IMessageEvent):void
        {
            this._messageEvents.push(this._communicationManager.addHabboConnectionMessageEvent(k));
        }

        override public function dispose():void
        {
            var k:IMessageEvent;
            if (disposed)
            {
                return;
            }
            if (((!(this._messageEvents == null)) && (!(this._communicationManager == null))))
            {
                for each (k in this._messageEvents)
                {
                    this._communicationManager.removeHabboConnectionMessageEvent(k);
                }
            }
            super.dispose();
        }

        private function onMiniMailMessage(k:IMessageEvent):void
        {
            this._miniMailUnseenCount++;
            this._Str_17105();
            events.dispatchEvent(new MiniMailMessageEvent(MiniMailMessageEvent.MMME_NEW, this._miniMailUnseenCount));
        }

        private function onMiniMailUnreadCount(k:IMessageEvent):void
        {
            this._miniMailUnseenCount = (k.parser as _Str_8206)._Str_22745;
            events.dispatchEvent(new MiniMailMessageEvent(MiniMailMessageEvent.MMME_UNREAD, this._miniMailUnseenCount));
        }

        private function onAccountPreferences(k:AccountPreferencesEvent):void
        {
            this._roomInvitesIgnored = k.getParser().roomInvitesIgnored;
        }

        public function getRoomInvitesIgnored():Boolean
        {
            return this._roomInvitesIgnored;
        }

        public function setRoomInvitesIgnored(k:Boolean):void
        {
            this._roomInvitesIgnored = k;
        }

        private function _Str_19006(k:IMessageEvent):void
        {
            this._mainView = new MainView(this);
            this.addMessageEvent(new _Str_4851(this._Str_18650));
            this.addMessageEvent(new _Str_8339(this.onInstantMessageError));
            this.addMessageEvent(new _Str_4696(this._Str_10457));
        }

        public function startConversation(k:int):void
        {
            if (this._mainView != null)
            {
                this._mainView.startConversation(k);
                this._mainView.show();
            }
        }

        public function getUnseenMiniMailMessageCount():int
        {
            return this._miniMailUnseenCount;
        }

        public function setFollowingAllowed(k:int, _arg_2:Boolean):void
        {
            if (this._mainView != null)
            {
                this._mainView.setFollowingAllowed(k, _arg_2);
            }
        }

        public function setOnlineStatus(k:int, _arg_2:Boolean):void
        {
            if (this._mainView != null)
            {
                this._mainView.setOnlineStatus(k, _arg_2);
            }
        }

        public function send(k:IMessageComposer):void
        {
            this._communicationManager.connection.send(k);
        }

        public function _Str_24965():void
        {
            if (this._soundManager != null)
            {
                this._soundManager.playSound(HabboSoundTypesEnum.MESSAGE_SENT);
            }
        }

        public function isOpen():Boolean
        {
            return (!(this._mainView == null)) && (this._mainView.isOpen);
        }

        public function toggleMessenger():void
        {
            if (this._mainView != null)
            {
                this._mainView.toggle();
            }
        }

        public function getText(k:String):String
        {
            return this._localizationManager.getLocalization(k, k);
        }

        private function _Str_18650(k:_Str_4851):void
        {
            var _local_2:_Str_6189 = k.getParser();
            Logger.log(((("Received console msg: " + _local_2._Str_3460) + ", ") + _local_2.senderId));
            if (this._mainView != null)
            {
                this._mainView.addConsoleMessage(_local_2.senderId, _local_2._Str_3460, _local_2._Str_17201, _local_2.extraData);
                if (!this._mainView.isOpen)
                {
                    this._Str_17105();
                }
            }
        }

        private function _Str_10457(k:_Str_4696):void
        {
            var _local_2:_Str_5791 = k.getParser();
            if (this._mainView != null)
            {
                this._mainView.addRoomInvite(_local_2.senderId, _local_2._Str_3460);
                if (!this._mainView.isOpen)
                {
                    this._Str_17105();
                }
            }
        }

        private function _Str_17105():void
        {
            if (this._soundManager != null)
            {
                this._soundManager.playSound(HabboSoundTypesEnum.MESSAGE_RECEIVED);
            }
        }

        private function onInstantMessageError(k:IMessageEvent):void
        {
            var _local_2:_Str_7091 = (k as _Str_8339).getParser();
            if (this._mainView != null)
            {
                this._mainView.onInstantMessageError(_local_2.userId, _local_2.errorCode, _local_2.message);
            }
        }

        public function _Str_23234(k:int):void
        {
            events.dispatchEvent(new ActiveConversationEvent(ActiveConversationEvent.ACCE_CHANGED, k));
        }

        public function getXmlWindow(k:String):IWindow
        {
            var _local_2:IAsset = assets.getAssetByName((k + "_xml"));
            var _local_3:XmlAsset = XmlAsset(_local_2);
            return this._windowManager.buildFromXML(XML(_local_3.content));
        }

        public function trackGoogle(k:String, _arg_2:String, _arg_3:int=-1):void
        {
            if (this._tracking)
            {
                this._tracking.trackGoogle(k, _arg_2, _arg_3);
            }
        }

        internal function getFriend(k:int):IFriend
        {
            return this._friendsList.getFriend(k);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localizationManager;
        }

        internal function _Str_6694(k:int):void
        {
            this._help._Str_19984(k);
        }

        public function closeConversation(k:int):void
        {
            this._mainView.hideConversation(k);
        }

        public function get hasfriendsListInitialized():Boolean
        {
            return this._friendsList.hasfriendsListInitialized;
        }
    }
}
