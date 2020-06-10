﻿package com.sulake.habbo.navigator
{
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.navigator.domain.NavigatorData;
    import com.sulake.habbo.navigator.mainview.ITransitionalMainViewCtrl;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.habbo.navigator.inroom.RoomInfoViewCtrl;
    import com.sulake.habbo.navigator.roomsettings.RoomCreateViewCtrl;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.navigator.inroom.RoomEventViewCtrl;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.navigator.mainview.OfficialRoomEntryManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.navigator.inroom.RoomEventInfoCtrl;
    import com.sulake.habbo.navigator.roomsettings.RoomFilterCtrl;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.navigator.roomsettings.EnforceCategoryCtrl;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import com.sulake.habbo.tracking.IHabboTracking;
    import flash.utils.Dictionary;

    public interface IHabboTransitionalNavigator extends IHabboNavigator 
    {
        function get assets():IAssetLibrary;
        function get windowManager():IHabboWindowManager;
        function get data():NavigatorData;
        function get mainViewCtrl():ITransitionalMainViewCtrl;
        function get tabs():Tabs;
        function get roomInfoViewCtrl():RoomInfoViewCtrl;
        function get roomCreateViewCtrl():RoomCreateViewCtrl;
        function get communication():IHabboCommunicationManager;
        function get roomSettingsCtrl():RoomSettingsCtrl;
        function get sessionData():ISessionDataManager;
        function get passwordInput():GuestRoomPasswordInput;
        function get doorbell():GuestRoomDoorbell;
        function get roomEventViewCtrl():RoomEventViewCtrl;
        function get localization():IHabboLocalizationManager;
        function get officialRoomEntryManager():OfficialRoomEntryManager;
        function get toolbar():IHabboToolbar;
        function get habboHelp():IHabboHelp;
        function get roomEventInfoCtrl():RoomEventInfoCtrl;
        function get roomFilterCtrl():RoomFilterCtrl;
        function get roomSessionManager():IRoomSessionManager;
        function get enforceCategoryCtrl():EnforceCategoryCtrl;
        function send(_arg_1:IMessageComposer, _arg_2:Boolean=false):void;
        function getXmlWindow(_arg_1:String, _arg_2:uint=1):IWindow;
        function getText(_arg_1:String):String;
        function registerParameter(_arg_1:String, _arg_2:String, _arg_3:String):String;
        function getButton(_arg_1:String, _arg_2:String, _arg_3:Function, _arg_4:int=0, _arg_5:int=0, _arg_6:int=0):IBitmapWrapperWindow;
        function refreshButton(_arg_1:IWindowContainer, _arg_2:String, _arg_3:Boolean, _arg_4:Function, _arg_5:int, _arg_6:String=null):void;
        function getButtonImage(_arg_1:String, _arg_2:String="_png"):BitmapData;
        function openCatalogClubPage(_arg_1:String):void;
        function openCatalogRoomAdsPage():void;
        function openCatalogRoomAdsExtendPage(_arg_1:String, _arg_2:String, _arg_3:Date, _arg_4:int):void;
        function showFavouriteRooms():void;
        function showHistoryRooms():void;
        function showFrequentRooms():void;
        function get tracking():IHabboTracking;
        function goToMainView():void;
        function goToRoom(_arg_1:int, _arg_2:Boolean, _arg_3:String="", _arg_4:int=-1):void;
        function isPerkAllowed(_arg_1:String):Boolean;
        function trackGoogle(_arg_1:String, _arg_2:String, _arg_3:int=-1):void;
        function get isDoorModeOverriddenInCurrentRoom():Boolean;
        function _Str_4051(_arg_1:String, _arg_2:String, _arg_3:String="", _arg_4:int=0):void;
        function getBoolean(_arg_1:String):Boolean;
        function getInteger(_arg_1:String, _arg_2:int):int;
        function getProperty(_arg_1:String, _arg_2:Dictionary=null):String;
    }
}
