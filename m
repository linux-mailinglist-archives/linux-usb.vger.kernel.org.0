Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8E32758FD
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 15:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgIWNoU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 09:44:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:33198 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbgIWNoS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 09:44:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600868655;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=4MkCnxprN0Wp2xxSH9di7m6bGYaZJPoL1At3UWd9ysE=;
        b=o9fZ1GD+IA9PEhwpX+orTd1/pckpACwkHoNHgjjBQXD9JlWGLP8ABf6TL7cYkrD33Dg+kS
        56G8u3KmCu6Uts9TRsgLat5GP05Ag4V9c5hz/tzJMrjAWCM5YlEVcIckRYwtreR8053ujK
        SSrR/C75OUpN7+jjWCeUzcTkuZPUa74=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1E194B1AD;
        Wed, 23 Sep 2020 13:44:53 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     himadrispandya@gmail.com, gregKH@linuxfoundation.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 01/14] Revert "USB: core: hub.c: use usb_control_msg_send() in a few places"
Date:   Wed, 23 Sep 2020 15:43:35 +0200
Message-Id: <20200923134348.23862-2-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200923134348.23862-1-oneukum@suse.com>
References: <20200923134348.23862-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit d6a499249543356002a1efbb26254c7272e62f4c.
Control messages are needed in contexts when memory allocations
are restricted, such as handling device resets and runtime PM.

For this reason the control message API internally uses GFP_NOIO.
This is a band aid introduced because when we recognized the issue,
the call chains were highly convoluted. Continuing this trend
is not a good idea.

So I am shooting the whole kennel here.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/hub.c | 99 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 59 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5742ddeb0455..5b768b80d1ee 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -410,8 +410,8 @@ static int get_hub_descriptor(struct usb_device *hdev,
  */
 static int clear_hub_feature(struct usb_device *hdev, int feature)
 {
-	return usb_control_msg_send(hdev, 0, USB_REQ_CLEAR_FEATURE, USB_RT_HUB,
-				    feature, 0, NULL, 0, 1000);
+	return usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
+		USB_REQ_CLEAR_FEATURE, USB_RT_HUB, feature, 0, NULL, 0, 1000);
 }
 
 /*
@@ -419,8 +419,9 @@ static int clear_hub_feature(struct usb_device *hdev, int feature)
  */
 int usb_clear_port_feature(struct usb_device *hdev, int port1, int feature)
 {
-	return usb_control_msg_send(hdev, 0, USB_REQ_CLEAR_FEATURE, USB_RT_PORT,
-				    feature, port1, NULL, 0, 1000);
+	return usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
+		USB_REQ_CLEAR_FEATURE, USB_RT_PORT, feature, port1,
+		NULL, 0, 1000);
 }
 
 /*
@@ -428,8 +429,9 @@ int usb_clear_port_feature(struct usb_device *hdev, int port1, int feature)
  */
 static int set_port_feature(struct usb_device *hdev, int port1, int feature)
 {
-	return usb_control_msg_send(hdev, 0, USB_REQ_SET_FEATURE, USB_RT_PORT,
-				    feature, port1, NULL, 0, 1000);
+	return usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
+		USB_REQ_SET_FEATURE, USB_RT_PORT, feature, port1,
+		NULL, 0, 1000);
 }
 
 static char *to_led_name(int selector)
@@ -753,14 +755,15 @@ hub_clear_tt_buffer(struct usb_device *hdev, u16 devinfo, u16 tt)
 	/* Need to clear both directions for control ep */
 	if (((devinfo >> 11) & USB_ENDPOINT_XFERTYPE_MASK) ==
 			USB_ENDPOINT_XFER_CONTROL) {
-		int status = usb_control_msg_send(hdev, 0,
-						  HUB_CLEAR_TT_BUFFER, USB_RT_PORT,
-						  devinfo ^ 0x8000, tt, NULL, 0, 1000);
+		int status = usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
+				HUB_CLEAR_TT_BUFFER, USB_RT_PORT,
+				devinfo ^ 0x8000, tt, NULL, 0, 1000);
 		if (status)
 			return status;
 	}
-	return usb_control_msg_send(hdev, 0, HUB_CLEAR_TT_BUFFER, USB_RT_PORT,
-				    devinfo, tt, NULL, 0, 1000);
+	return usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
+			       HUB_CLEAR_TT_BUFFER, USB_RT_PORT, devinfo,
+			       tt, NULL, 0, 1000);
 }
 
 /*
@@ -1046,10 +1049,11 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 	 */
 	if (type != HUB_RESUME) {
 		if (hdev->parent && hub_is_superspeed(hdev)) {
-			ret = usb_control_msg_send(hdev, 0, HUB_SET_DEPTH, USB_RT_HUB,
-						   hdev->level - 1, 0, NULL, 0,
-						   USB_CTRL_SET_TIMEOUT);
-			if (ret)
+			ret = usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
+					HUB_SET_DEPTH, USB_RT_HUB,
+					hdev->level - 1, 0, NULL, 0,
+					USB_CTRL_SET_TIMEOUT);
+			if (ret < 0)
 				dev_err(hub->intfdev,
 						"set hub depth failed\n");
 		}
@@ -2325,10 +2329,13 @@ static int usb_enumerate_device_otg(struct usb_device *udev)
 		/* enable HNP before suspend, it's simpler */
 		if (port1 == bus->otg_port) {
 			bus->b_hnp_enable = 1;
-			err = usb_control_msg_send(udev, 0, USB_REQ_SET_FEATURE, 0,
-						   USB_DEVICE_B_HNP_ENABLE, 0,
-						   NULL, 0, USB_CTRL_SET_TIMEOUT);
-			if (err) {
+			err = usb_control_msg(udev,
+				usb_sndctrlpipe(udev, 0),
+				USB_REQ_SET_FEATURE, 0,
+				USB_DEVICE_B_HNP_ENABLE,
+				0, NULL, 0,
+				USB_CTRL_SET_TIMEOUT);
+			if (err < 0) {
 				/*
 				 * OTG MESSAGE: report errors here,
 				 * customize to match your product.
@@ -2340,10 +2347,13 @@ static int usb_enumerate_device_otg(struct usb_device *udev)
 		} else if (desc->bLength == sizeof
 				(struct usb_otg_descriptor)) {
 			/* Set a_alt_hnp_support for legacy otg device */
-			err = usb_control_msg_send(udev, 0, USB_REQ_SET_FEATURE, 0,
-						   USB_DEVICE_A_ALT_HNP_SUPPORT, 0,
-						   NULL, 0, USB_CTRL_SET_TIMEOUT);
-			if (err)
+			err = usb_control_msg(udev,
+				usb_sndctrlpipe(udev, 0),
+				USB_REQ_SET_FEATURE, 0,
+				USB_DEVICE_A_ALT_HNP_SUPPORT,
+				0, NULL, 0,
+				USB_CTRL_SET_TIMEOUT);
+			if (err < 0)
 				dev_err(&udev->dev,
 					"set a_alt_hnp_support failed: %d\n",
 					err);
@@ -3111,8 +3121,10 @@ int usb_disable_ltm(struct usb_device *udev)
 	if (!udev->actconfig)
 		return 0;
 
-	return usb_control_msg_send(udev, 0, USB_REQ_CLEAR_FEATURE, USB_RECIP_DEVICE,
-				    USB_DEVICE_LTM_ENABLE, 0, NULL, 0, USB_CTRL_SET_TIMEOUT);
+	return usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
+			USB_REQ_CLEAR_FEATURE, USB_RECIP_DEVICE,
+			USB_DEVICE_LTM_ENABLE, 0, NULL, 0,
+			USB_CTRL_SET_TIMEOUT);
 }
 EXPORT_SYMBOL_GPL(usb_disable_ltm);
 
@@ -3131,8 +3143,10 @@ void usb_enable_ltm(struct usb_device *udev)
 	if (!udev->actconfig)
 		return;
 
-	usb_control_msg_send(udev, 0, USB_REQ_SET_FEATURE, USB_RECIP_DEVICE,
-			     USB_DEVICE_LTM_ENABLE, 0, NULL, 0, USB_CTRL_SET_TIMEOUT);
+	usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
+			USB_REQ_SET_FEATURE, USB_RECIP_DEVICE,
+			USB_DEVICE_LTM_ENABLE, 0, NULL, 0,
+			USB_CTRL_SET_TIMEOUT);
 }
 EXPORT_SYMBOL_GPL(usb_enable_ltm);
 
@@ -3149,14 +3163,17 @@ EXPORT_SYMBOL_GPL(usb_enable_ltm);
 static int usb_enable_remote_wakeup(struct usb_device *udev)
 {
 	if (udev->speed < USB_SPEED_SUPER)
-		return usb_control_msg_send(udev, 0, USB_REQ_SET_FEATURE, USB_RECIP_DEVICE,
-					    USB_DEVICE_REMOTE_WAKEUP, 0,
-					    NULL, 0, USB_CTRL_SET_TIMEOUT);
+		return usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
+				USB_REQ_SET_FEATURE, USB_RECIP_DEVICE,
+				USB_DEVICE_REMOTE_WAKEUP, 0, NULL, 0,
+				USB_CTRL_SET_TIMEOUT);
 	else
-		return usb_control_msg_send(udev, 0, USB_REQ_SET_FEATURE, USB_RECIP_INTERFACE,
-					    USB_INTRF_FUNC_SUSPEND,
-					    USB_INTRF_FUNC_SUSPEND_RW | USB_INTRF_FUNC_SUSPEND_LP,
-					    NULL, 0, USB_CTRL_SET_TIMEOUT);
+		return usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
+				USB_REQ_SET_FEATURE, USB_RECIP_INTERFACE,
+				USB_INTRF_FUNC_SUSPEND,
+				USB_INTRF_FUNC_SUSPEND_RW |
+					USB_INTRF_FUNC_SUSPEND_LP,
+				NULL, 0, USB_CTRL_SET_TIMEOUT);
 }
 
 /*
@@ -3172,13 +3189,15 @@ static int usb_enable_remote_wakeup(struct usb_device *udev)
 static int usb_disable_remote_wakeup(struct usb_device *udev)
 {
 	if (udev->speed < USB_SPEED_SUPER)
-		return usb_control_msg_send(udev, 0, USB_REQ_CLEAR_FEATURE, USB_RECIP_DEVICE,
-					    USB_DEVICE_REMOTE_WAKEUP, 0, NULL, 0,
-					    USB_CTRL_SET_TIMEOUT);
+		return usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
+				USB_REQ_CLEAR_FEATURE, USB_RECIP_DEVICE,
+				USB_DEVICE_REMOTE_WAKEUP, 0, NULL, 0,
+				USB_CTRL_SET_TIMEOUT);
 	else
-		return usb_control_msg_send(udev, 0, USB_REQ_SET_FEATURE, USB_RECIP_INTERFACE,
-					    USB_INTRF_FUNC_SUSPEND, 0, NULL, 0,
-					    USB_CTRL_SET_TIMEOUT);
+		return usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
+				USB_REQ_SET_FEATURE, USB_RECIP_INTERFACE,
+				USB_INTRF_FUNC_SUSPEND,	0, NULL, 0,
+				USB_CTRL_SET_TIMEOUT);
 }
 
 /* Count of wakeup-enabled devices at or below udev */
-- 
2.16.4

