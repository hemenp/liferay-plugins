<%--
/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>

<%@ page import="com.liferay.portal.kernel.language.LanguageUtil" %><%@ page import="com.liferay.portal.kernel.util.Constants" %><%@ page import="com.liferay.portal.kernel.util.GetterUtil" %><%@ page import="com.liferay.portal.kernel.util.ParamUtil" %><%@ page import="com.liferay.portal.kernel.util.StringBundler" %><%@ page import="com.liferay.portal.kernel.util.StringPool" %><%@ page import="com.liferay.portal.kernel.util.Validator" %><%@ page import="com.liferay.portlet.PortletPreferencesFactoryUtil" %><%@ page import="javax.portlet.PortletPreferences" %>

<portlet:defineObjects />

<%
PortletPreferences preferences = renderRequest.getPreferences();

String portletResource = ParamUtil.getString(request, "portletResource");

if (Validator.isNotNull(portletResource)) {
	preferences = PortletPreferencesFactoryUtil.getPortletSetup(request, portletResource);
}

boolean autoplay = GetterUtil.getBoolean(preferences.getValue("autoplay", "false"));
boolean enableFullscreen = GetterUtil.getBoolean(preferences.getValue("enableFullscreen", "false"));
String height = preferences.getValue("height", "360");
String playerColor = preferences.getValue("playerColor", StringPool.BLANK);
boolean showByline = GetterUtil.getBoolean(preferences.getValue("showByline", "true"));
boolean showPortrait = GetterUtil.getBoolean(preferences.getValue("showPortrait", "true"));
boolean showTitle = GetterUtil.getBoolean(preferences.getValue("showTitle", "true"));
String url = preferences.getValue("url", StringPool.BLANK);
String width = preferences.getValue("width", "480");

String id = url.replaceAll(".*vimeo\\.com\\/([0-9]+).*", "$1");

String enableFullscreenBinary = enableFullscreen ? "1" : "0";
String playerColorHex = playerColor.replaceAll("#", "").toLowerCase();
String presetSize = width + "x" + height;
String showBylineBinary = showByline ? "1" : "0";
String showPortraitBinary = showPortrait ? "1" : "0";
String showTitleBinary = showTitle ? "1" : "0";
%>

<%!
private static final String _SWF_URL = "http://vimeo.com/moogaloop.swf";

private static final String _WATCH_URL = "http://vimeo.com/";
%>