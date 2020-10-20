﻿package com.sulake.habbo.session
{
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomModerationSettings;

    public interface IRoomSession 
    {
        function get roomId():int;
        function get _Str_17752():String;
        function get state():String;
        function start():Boolean;
        function _Str_17917(_arg_1:String, _arg_2:int=0):void;
        function _Str_22140(_arg_1:String):void;
        function _Str_21231(_arg_1:String, _arg_2:int=0):void;
        function sendWhisperMessage(_arg_1:String, _arg_2:String, _arg_3:int=0):void;
        function sendChatTypingMessage(_arg_1:Boolean):void;
        function sendAvatarExpressionMessage(_arg_1:int):void;
        function sendSignMessage(_arg_1:int):void;
        function sendDanceMessage(_arg_1:int):void;
        function sendChangePostureMessage(_arg_1:int):void;
        function sendCreditFurniRedeemMessage(_arg_1:int):void;
        function sendPresentOpenMessage(_arg_1:int):void;
        function sendOpenPetPackageMessage(_arg_1:int, _arg_2:String):void;
        function sendRoomDimmerGetPresetsMessage():void;
        function sendRoomDimmerSavePresetMessage(_arg_1:int, _arg_2:int, _arg_3:uint, _arg_4:int, _arg_5:Boolean):void;
        function sendRoomDimmerChangeStateMessage():void;
        function sendConversionPoint(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String=null, _arg_5:int=0):void;
        function sendPollStartMessage(_arg_1:int):void;
        function sendPollRejectMessage(_arg_1:int):void;
		function votePoll(counter:int):void;
        function sendPollAnswerMessage(_arg_1:int, _arg_2:int, _arg_3:Array):void;
        function sendPeerUsersClassificationMessage(_arg_1:String):void;
        function sendRoomUsersClassificationMessage(_arg_1:String):void;
        function sendVisitFlatMessage(_arg_1:int):void;
        function sendVisitUserMessage(_arg_1:String):void;
        function ambassadorAlert(_arg_1:int):void;
        function kickUser(_arg_1:int):void;
        function banUserWithDuration(_arg_1:int, _arg_2:String):void;
        function muteUser(userId:int, minutes:int):void;
        function assignRights(_arg_1:int):void;
        function removeRights(_arg_1:int):void;
        function letUserIn(_arg_1:String, _arg_2:Boolean):void;
        function pickUpPet(_arg_1:int):void;
        function mountPet(_arg_1:int):void;
        function togglePetRidingPermission(_arg_1:int):void;
        function dismountPet(_arg_1:int):void;
        function removeSaddleFromPet(_arg_1:int):void;
        function requestPetCommands(_arg_1:int):void;
        function useProductForPet(_arg_1:int, _arg_2:int):void;
        function plantSeed(_arg_1:int):void;
        function quit():void;
        function changeQueue(_arg_1:int):void;
        function sendUpdateClothingChangeFurniture(_arg_1:int, _arg_2:String, _arg_3:String):void;
        function receivedChatWithTrackingId(_arg_1:int):void;
        function get ownUserRoomId():int;
        function set ownUserRoomId(_arg_1:int):void;
        function get isRoomOwner():Boolean;
        function set isRoomOwner(_arg_1:Boolean):void;
        function set roomControllerLevel(_arg_1:int):void;
        function get roomControllerLevel():int;
        function get isGuildRoom():Boolean;
        function set isGuildRoom(_arg_1:Boolean):void;
        function get isNoobRoom():Boolean;
        function set doorMode(_arg_1:int):void;
        function get tradeMode():int;
        function get isPrivateRoom():Boolean;
        function set tradeMode(_arg_1:int):void;
        function get userDataManager():UserDataManager;
        function get isSpectatorMode():Boolean;
        function set isSpectatorMode(_arg_1:Boolean):void;
        function get arePetsAllowed():Boolean;
        function set arePetsAllowed(_arg_1:Boolean):void;
        function get areBotsAllowed():Boolean;
        function get isUserDecorating():Boolean;
        function set isUserDecorating(_arg_1:Boolean):void;
        function get isGameSession():Boolean;
        function get roomModerationSettings():RoomModerationSettings;
        function set roomModerationSettings(_arg_1:RoomModerationSettings):void;
        function get _Str_16924():Boolean;
        function set _Str_16924(_arg_1:Boolean):void;
        function _Str_19090(_arg_1:int):void;
        function _Str_21562(_arg_1:int):void;
        function _Str_21305(_arg_1:int):void;
        function _Str_19996():void;
    }
}
