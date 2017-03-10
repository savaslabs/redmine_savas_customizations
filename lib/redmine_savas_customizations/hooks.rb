module RedmineSavasCustomizations
  class RedmineSavasCustomizationsHookListener < Redmine::Hook::ViewListener
    def view_layouts_base_html_head(context)
      "<script type=\"text/javascript\">var _prum=[['id','58a5fee9f4bab5dc6c7b23c6'],['mark','firstbyte',(new Date()).getTime()]];(function(){var s=document.getElementsByTagName('script')[0],p=document.createElement('script');p.async='async';p.src='//rum-static.pingdom.net/prum.min.js';s.parentNode.insertBefore(p,s)})();</script>"
      ;
    end
  end
end
