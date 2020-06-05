﻿package com.sulake.core.window
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.window.utils.IEventQueue;
    import com.sulake.core.window.utils.IEventProcessor;
    import com.sulake.core.window.graphics.IWindowRenderer;
    import flash.display.Stage;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.core.window.utils.EventProcessorState;
    import com.sulake.core.localization.ICoreLocalizationManager;
    import flash.display.DisplayObjectContainer;
    import com.sulake.core.window.services.IInternalWindowServices;
    import com.sulake.core.window.utils.IWindowParser;
    import com.sulake.core.assets.IResourceManager;
    import com.sulake.core.window.components.IDesktopWindow;
    import com.sulake.core.window.components.SubstituteParentController;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.core.window.services.ServiceManager;
    import com.sulake.core.window.utils.WindowParser;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.DesktopController;
    import flash.events.Event;
    import com.sulake.core.window.utils.MouseEventQueue;
    import com.sulake.core.window.utils.MouseEventProcessor;
    import com.sulake.core.window.utils.tablet.TabletEventQueue;
    import com.sulake.core.window.utils.tablet.TabletEventProcessor;
    import com.sulake.core.window.graphics.IGraphicContextHost;
    import flash.display.DisplayObject;
    import com.sulake.core.localization.ILocalizable;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.enum.WindowState;
    import __AS3__.vec.*;

    public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver 
    {
        public static const INPUT_MODE_MOUSE:uint = 0;
        public static const INPUT_MODE_TOUCH:uint = 1;
        public static const ERROR_UNKNOWN:int = 0;
        public static const ERROR_INVALID_WINDOW:int = 1;
        public static const ERROR_WINDOW_NOT_FOUND:int = 2;
        public static const ERROR_WINDOW_ALREADY_EXISTS:int = 3;
        public static const ERROR_UNKNOWN_WINDOW_TYPE:int = 4;
        public static const ERROR_DURING_EVENT_HANDLING:int = 5;
        public static var inputEventQueue:IEventQueue;
        private static var inputEventProcessor:IEventProcessor;
        private static var inputModeFlag:uint = INPUT_MODE_MOUSE;//0
        private static var _renderer:IWindowRenderer;
        private static var stage:Stage;

        public var inputEventTrackers:Vector.<IInputEventTracker>;
        private var _linkEventTrackers:Vector.<ILinkEventTracker>;
        private var _eventProcessorState:EventProcessorState;
        protected var _Str_2312:ICoreLocalizationManager;
        protected var _Str_2417:DisplayObjectContainer;
        protected var _Str_24909:Boolean = true;
        protected var _Str_1984:Error;
        protected var _Str_16327:int = -1;
        protected var _Str_11208:IInternalWindowServices;
        protected var _Str_14601:IWindowParser;
        protected var _Str_18011:IWindowFactory;
        protected var _widgetFactory:IWidgetFactory;
        protected var _Str_5526:IResourceManager;
        protected var _Str_2867:IDesktopWindow;
        protected var _Str_13721:SubstituteParentController;
        private var _disposed:Boolean = false;
        private var _Str_4816:Boolean = false;
        private var _Str_21204:Boolean = false;
        private var _name:String;
        private var _configurationManager:IHabboConfigurationManager;

        public function WindowContext(k:String, _arg_2:IWindowRenderer, _arg_3:IWindowFactory, _arg_4:IWidgetFactory, _arg_5:IResourceManager, _arg_6:ICoreLocalizationManager, _arg_7:IHabboConfigurationManager, _arg_8:DisplayObjectContainer, _arg_9:Rectangle, _arg_10:Vector.<ILinkEventTracker>)
        {
            this._name = k;
            _renderer = _arg_2;
            this._Str_2312 = _arg_6;
            this._configurationManager = _arg_7;
            this._Str_2417 = _arg_8;
            this._Str_11208 = new ServiceManager(this, _arg_8);
            this._Str_18011 = _arg_3;
            this._widgetFactory = _arg_4;
            this._Str_5526 = _arg_5;
            this._Str_14601 = new WindowParser(this);
            this.inputEventTrackers = new Vector.<IInputEventTracker>(0);
            this._linkEventTrackers = _arg_10;
            if (!stage)
            {
                if ((this._Str_2417 is Stage))
                {
                    stage = (this._Str_2417 as Stage);
                }
                else
                {
                    if (this._Str_2417.stage)
                    {
                        stage = this._Str_2417.stage;
                    }
                }
            }
            Classes.init();
            if (_arg_9 == null)
            {
                _arg_9 = new Rectangle(0, 0, 800, 600);
            }
            this._Str_2867 = new DesktopController(("_CONTEXT_DESKTOP_" + this._name), this, _arg_9);
            this._Str_2867.limits.maxWidth = _arg_9.width;
            this._Str_2867.limits.maxHeight = _arg_9.height;
            this._Str_2417.addChild(this._Str_2867.getDisplayObject());
            this._Str_2417.doubleClickEnabled = true;
            this._Str_2417.addEventListener(Event.RESIZE, this._Str_21888);
            this._eventProcessorState = new EventProcessorState(_renderer, this._Str_2867, this._Str_2867, null, this.inputEventTrackers);
            _Str_9993 = INPUT_MODE_MOUSE;
            this._Str_13721 = new SubstituteParentController(this);
        }

        public static function get _Str_9993():uint
        {
            return inputModeFlag;
        }

        public static function set _Str_9993(k:uint):void
        {
            if (inputEventQueue)
            {
                if ((inputEventQueue is IDisposable))
                {
                    IDisposable(inputEventQueue).dispose();
                }
            }
            if (inputEventProcessor)
            {
                if ((inputEventProcessor is IDisposable))
                {
                    IDisposable(inputEventProcessor).dispose();
                }
            }
            switch (k)
            {
                case INPUT_MODE_MOUSE:
                    inputEventQueue = new MouseEventQueue(stage);
                    inputEventProcessor = new MouseEventProcessor();
                    try
                    {
                    }
                    catch(e:Error)
                    {
                    }
                    return;
                case INPUT_MODE_TOUCH:
                    inputEventQueue = new TabletEventQueue(stage);
                    inputEventProcessor = new TabletEventProcessor();
                    try
                    {
                    }
                    catch(e:Error)
                    {
                    }
                    return;
                default:
                    _Str_9993 = INPUT_MODE_MOUSE;
                    throw (new Error(("Unknown input mode " + k)));
            }
        }


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._disposed = true;
                this._Str_2417.removeEventListener(Event.RESIZE, this._Str_21888);
                this._Str_2417.removeChild((IGraphicContextHost(this._Str_2867).getGraphicContext(true) as DisplayObject));
                this._Str_2867.destroy();
                this._Str_2867 = null;
                this._Str_13721.destroy();
                this._Str_13721 = null;
                if ((this._Str_11208 is IDisposable))
                {
                    IDisposable(this._Str_11208).dispose();
                }
                this._Str_11208 = null;
                this._Str_14601.dispose();
                this._Str_14601 = null;
                _renderer = null;
                this._Str_2312 = null;
                this._Str_2417 = null;
                this._Str_18011 = null;
                this._widgetFactory = null;
                this._Str_5526 = null;
            }
        }

        public function getLastError():Error
        {
            return this._Str_1984;
        }

        public function getLastErrorCode():int
        {
            return this._Str_16327;
        }

        public function handleError(k:int, _arg_2:Error):void
        {
            this._Str_1984 = _arg_2;
            this._Str_16327 = k;
            if (this._Str_24909)
            {
                throw (_arg_2);
            }
        }

        public function flushError():void
        {
            this._Str_1984 = null;
            this._Str_16327 = -1;
        }

        public function getWindowServices():IInternalWindowServices
        {
            return this._Str_11208;
        }

        public function getWindowParser():IWindowParser
        {
            return this._Str_14601;
        }

        public function getWindowFactory():IWindowFactory
        {
            return this._Str_18011;
        }

        public function getDesktopWindow():IDesktopWindow
        {
            return this._Str_2867;
        }

        public function findWindowByName(k:String):IWindow
        {
            return this._Str_2867.findChildByName(k);
        }

        public function findWindowByTag(k:String):IWindow
        {
            return this._Str_2867.findChildByTag(k);
        }

        public function groupChildrenWithTag(k:String, _arg_2:Array, _arg_3:int=0):uint
        {
            return this._Str_2867.groupChildrenWithTag(k, _arg_2, _arg_3);
        }

        public function registerLocalizationListener(k:String, _arg_2:IWindow):void
        {
            this._Str_2312.registerListener(k, (_arg_2 as ILocalizable));
        }

        public function removeLocalizationListener(k:String, _arg_2:IWindow):void
        {
            this._Str_2312.removeListener(k, (_arg_2 as ILocalizable));
        }

        public function create(k:String, _arg_2:String, _arg_3:uint, _arg_4:uint, _arg_5:uint, _arg_6:Rectangle, _arg_7:Function, _arg_8:IWindow, _arg_9:uint, _arg_10:Array=null, _arg_11:String="", _arg_12:Array=null):IWindow
        {
            var _local_13:IWindow;
            var _local_14:Class = Classes._Str_23901(_arg_3);
            if (_local_14 == null)
            {
                this.handleError(WindowContext.ERROR_UNKNOWN_WINDOW_TYPE, new Error((('Failed to solve implementation for window "' + k) + '"!')));
                return null;
            }
            if (_arg_8 == null)
            {
                if ((_arg_5 & WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT))
                {
                    _arg_8 = this._Str_13721;
                }
            }
            _local_13 = new _local_14(k, _arg_3, _arg_4, _arg_5, this, _arg_6, ((_arg_8 != null) ? _arg_8 : (this._Str_2867)), _arg_7, _arg_10, _arg_12, _arg_9);
            _local_13.dynamicStyle = _arg_11;
            if (((_arg_2) && (_arg_2.length)))
            {
                _local_13.caption = _arg_2;
            }
            return _local_13;
        }

        public function destroy(k:IWindow):Boolean
        {
            if (k == this._Str_2867)
            {
                this._Str_2867 = null;
            }
            if (k.state != WindowState.DISPOSED)
            {
                k.destroy();
            }
            return true;
        }

        public function invalidate(k:IWindow, _arg_2:Rectangle, _arg_3:uint):void
        {
            if (!this.disposed)
            {
                _renderer._Str_18389(k, _arg_2, _arg_3);
            }
        }

        public function update(k:uint):void
        {
			try
			{
            var _local_2:Error;
            this._Str_4816 = true;
            if (this._Str_1984)
            {
                _local_2 = this._Str_1984;
                this._Str_1984 = null;
                throw (_local_2);
            }
            inputEventProcessor.process(this._eventProcessorState, inputEventQueue);
			}
			catch (error: Error)
			{
				Habbo.trackLoginStep("Error Updating WindowContext " + this._name + ": " + error.message + " | " + error.getStackTrace());
			}
            this._Str_4816 = false;
        }

        public function render(k:uint):void
        {
			try
			{
				this._Str_21204 = true;
				_renderer.render();
				this._Str_21204 = false;
			}
			catch (error: Error)
			{
				Habbo.trackLoginStep("Error Updating WindowContext " + this._name + ": " + error.message + " | " + error.getStackTrace());
			}
			this._Str_21204 = false;
        }

        private function _Str_21888(k:Event):void
        {
            var _local_2:int;
            var _local_3:int;
            if (((!(this._Str_2867 == null)) && (!(this._Str_2867.disposed))))
            {
                if ((this._Str_2417 is Stage))
                {
                    _local_2 = Stage(this._Str_2417).stageWidth;
                    _local_3 = Stage(this._Str_2417).stageHeight;
                }
                else
                {
                    _local_2 = this._Str_2417.width;
                    _local_3 = this._Str_2417.height;
                }
                if (((_local_2 >= 10) && (_local_3 >= 10)))
                {
                    this._Str_2867.limits.maxWidth = _local_2;
                    this._Str_2867.limits.maxHeight = _local_3;
                    this._Str_2867.width = _local_2;
                    this._Str_2867.height = _local_3;
                }
            }
        }

        public function addMouseEventTracker(k:IInputEventTracker):void
        {
            if (this.inputEventTrackers.indexOf(k) < 0)
            {
                this.inputEventTrackers.push(k);
            }
        }

        public function removeMouseEventTracker(k:IInputEventTracker):void
        {
            var _local_2:int = this.inputEventTrackers.indexOf(k);
            if (_local_2 > -1)
            {
                this.inputEventTrackers.splice(_local_2, 1);
            }
        }

        public function getResourceManager():IResourceManager
        {
            return this._Str_5526;
        }

        public function _Str_23058():IWidgetFactory
        {
            return this._widgetFactory;
        }

        public function get linkEventTrackers():Vector.<ILinkEventTracker>
        {
            return this._linkEventTrackers;
        }
    }
}
