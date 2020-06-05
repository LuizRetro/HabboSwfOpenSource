﻿package com.sulake.habbo.navigator
{
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.ITextWindow;
    import flash.geom.Point;
    import com.sulake.core.window.IWindow;
    import flash.ui.Keyboard;

    public class TextFieldManager 
    {
        private var _navigator:IHabboTransitionalNavigator;
        private var _input:ITextFieldWindow;
        private var _includeInfo:Boolean;
        private var _infoText:String = "";
        private var _maxTextLen:int;
        private var _onEnter:Function;
        private var _invalidText:String = "";
        private var _errorPopup:IWindowContainer;
        private var _orgTextBackground:Boolean;
        private var _orgTextBackgroundColor:uint;

        public function TextFieldManager(k:IHabboTransitionalNavigator, _arg_2:ITextFieldWindow, _arg_3:int=1000, _arg_4:Function=null, _arg_5:String=null)
        {
            this._navigator = k;
            this._input = _arg_2;
            this._maxTextLen = _arg_3;
            _arg_2.maxChars = _arg_3;
            this._onEnter = _arg_4;
            if (_arg_5 != null)
            {
                this._includeInfo = true;
                this._infoText = _arg_5;
                this._input.text = _arg_5;
            }
            Util._Str_6937(this._input, this.onInputClick);
            this._input.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN, this.checkEnterPress);
            this._input.addEventListener(WindowEvent.WINDOW_EVENT_CHANGE, this.checkMaxLen);
            this._orgTextBackground = this._input.textBackground;
            this._orgTextBackgroundColor = this._input.textBackgroundColor;
        }

        public function dispose():void
        {
            if (this._input)
            {
                this._input.dispose();
                this._input = null;
            }
            if (this._errorPopup)
            {
                this._errorPopup.dispose();
                this._errorPopup = null;
            }
            this._navigator = null;
        }

        public function _Str_22184(k:String):Boolean
        {
            if (!this.isInputValid())
            {
                this.displayError(k);
                return false;
            }
            this.restoreBackground();
            return true;
        }

        public function restoreBackground():void
        {
            this._input.textBackground = this._orgTextBackground;
            this._input.textBackgroundColor = this._orgTextBackgroundColor;
        }

        public function displayError(k:String):void
        {
            this._input.textBackground = true;
            this._input.textBackgroundColor = 4294021019;
            if (this._errorPopup == null)
            {
                this._errorPopup = IWindowContainer(this._navigator.getXmlWindow("nav_error_popup"));
                this._navigator.refreshButton(this._errorPopup, "popup_arrow_down", true, null, 0);
                IWindowContainer(this._input.parent).addChild(this._errorPopup);
            }
            var _local_2:ITextWindow = ITextWindow(this._errorPopup.findChildByName("error_text"));
            _local_2.text = k;
            _local_2.width = (_local_2.textWidth + 5);
            this._errorPopup.findChildByName("border").width = (_local_2.width + 15);
            this._errorPopup.width = (_local_2.width + 15);
            var _local_3:Point = new Point();
            this._input.getLocalPosition(_local_3);
            this._errorPopup.x = _local_3.x;
            this._errorPopup.y = ((_local_3.y - this._errorPopup.height) + 3);
            var _local_4:IWindow = this._errorPopup.findChildByName("popup_arrow_down");
            _local_4.x = ((this._errorPopup.width / 2) - (_local_4.width / 2));
            this._errorPopup.x = (this._errorPopup.x + ((this._input.width - this._errorPopup.width) / 2));
            this._errorPopup.visible = true;
        }

        public function goBackToInitialState():void
        {
            this.clearErrors();
            if (this._infoText != null)
            {
                this._input.text = this._infoText;
                this._includeInfo = true;
            }
            else
            {
                this._input.text = "";
                this._includeInfo = false;
            }
        }

        public function getText():String
        {
            if (this._includeInfo)
            {
                return this._invalidText;
            }
            return this._input.text;
        }

        public function setText(k:String):void
        {
            this._includeInfo = false;
            this._input.text = k;
        }

        public function clearErrors():void
        {
            this.restoreBackground();
            if (this._errorPopup != null)
            {
                this._errorPopup.visible = false;
            }
        }

        public function get input():ITextFieldWindow
        {
            return this._input;
        }

        private function isInputValid():Boolean
        {
            return (!(this._includeInfo)) && (Util.trim(this.getText()).length > 2);
        }

        private function onInputClick(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowEvent.WINDOW_EVENT_FOCUSED)
            {
                return;
            }
            if (!this._includeInfo)
            {
                return;
            }
            this._input.text = this._invalidText;
            this._includeInfo = false;
            this.restoreBackground();
        }

        private function checkEnterPress(k:WindowKeyboardEvent):void
        {
            if (k.charCode == Keyboard.ENTER)
            {
                if (this._onEnter != null)
                {
                    this._onEnter();
                }
            }
        }

        private function checkMaxLen(k:WindowEvent):void
        {
            var _local_2:String = this._input.text;
            if (_local_2.length > this._maxTextLen)
            {
                this._input.text = _local_2.substring(0, this._maxTextLen);
            }
        }
    }
}
