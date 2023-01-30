Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12846680B4F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 11:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235815AbjA3KvF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 05:51:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235596AbjA3KvA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 05:51:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C552FCFA
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 02:50:59 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD69FE68;
        Mon, 30 Jan 2023 11:50:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675075856;
        bh=Pr5vYeTHiulL0pXq90FQ8/gB3wzhi+Eweb0uk9ZnFpA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qRWT7sv65Wx9ekCJz0BoYo9Yj/Zdhy8xCX/AntFBRbrAXOOkYLZh6euiHKAPux3K2
         hqPVjcsuXsoZGN9TRxvoBDNNBFXg5pvn16TO4QcuIVpmj8PvUObJp/FfGWfkw7N9Sz
         VtI+STg//c1jNhHLOd+YJLouZ+okyrQQdNcyviUk=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 3/3] usb: gadget: uvc: Disable interrupt endpoint by default
Date:   Mon, 30 Jan 2023 10:50:45 +0000
Message-Id: <20230130105045.120886-4-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130105045.120886-1-dan.scally@ideasonboard.com>
References: <20230130105045.120886-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The f_uvc code includes an interrupt endpoint against the VideoControl
interface. According to section 2.4.2 of the UVC specification however
this endpoint is optional in at least some cases:

"This endpoint is optional, but may be mandatory under certain
conditions"

The conditions enumerated are whether...

1. The device supports hardware triggers
2. The device implements any AutoUpdate controls
3. The device implements any Asynchronous controls

As all of those things are implementation dependent, this endpoint
might be unnecessary for some users. Further to that it is unusable
in the current implementation as there is no mechanism within the
UVC gadget driver that allows data to be sent over that endpoint.
Disable the interrupt endpoint by default, but check whether the
user has asked for it to be enabled in configfs and continue to
generate it if so.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3 (Laurent):

	- Switched to enable_interrupt_ep. This has the effect of suppressing the
	endpoint by default, which is a change from the existing behaviour. Given
	the endpoint is at present completely unusable though this seems safe.
	- Some formatting (line wraps and indentation)

 drivers/usb/gadget/function/f_uvc.c | 60 ++++++++++++++++++-----------
 drivers/usb/gadget/function/uvc.h   |  1 +
 2 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index a673001f5271..5250805153c7 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -76,7 +76,7 @@ static struct usb_interface_descriptor uvc_control_intf = {
 	.bDescriptorType	= USB_DT_INTERFACE,
 	.bInterfaceNumber	= UVC_INTF_VIDEO_CONTROL,
 	.bAlternateSetting	= 0,
-	.bNumEndpoints		= 1,
+	.bNumEndpoints		= 0,
 	.bInterfaceClass	= USB_CLASS_VIDEO,
 	.bInterfaceSubClass	= UVC_SC_VIDEOCONTROL,
 	.bInterfaceProtocol	= 0x00,
@@ -300,14 +300,17 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
 		if (alt)
 			return -EINVAL;
 
-		uvcg_info(f, "reset UVC interrupt endpoint\n");
-		usb_ep_disable(uvc->interrupt_ep);
+		if (uvc->enable_interrupt_ep) {
+			uvcg_info(f, "reset UVC interrupt endpoint\n");
+			usb_ep_disable(uvc->interrupt_ep);
 
-		if (!uvc->interrupt_ep->desc)
-			if (config_ep_by_speed(cdev->gadget, f, uvc->interrupt_ep))
-				return -EINVAL;
+			if (!uvc->interrupt_ep->desc)
+				if (config_ep_by_speed(cdev->gadget, f,
+						       uvc->interrupt_ep))
+					return -EINVAL;
 
-		usb_ep_enable(uvc->interrupt_ep);
+			usb_ep_enable(uvc->interrupt_ep);
+		}
 
 		if (uvc->state == UVC_STATE_DISCONNECTED) {
 			memset(&v4l2_event, 0, sizeof(v4l2_event));
@@ -385,7 +388,8 @@ uvc_function_disable(struct usb_function *f)
 	uvc->state = UVC_STATE_DISCONNECTED;
 
 	usb_ep_disable(uvc->video.ep);
-	usb_ep_disable(uvc->interrupt_ep);
+	if (uvc->enable_interrupt_ep)
+		usb_ep_disable(uvc->interrupt_ep);
 }
 
 /* --------------------------------------------------------------------------
@@ -533,14 +537,17 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	control_size = 0;
 	streaming_size = 0;
 	bytes = uvc_iad.bLength + uvc_control_intf.bLength
-	      + uvc_interrupt_ep.bLength + uvc_interrupt_cs_ep.bLength
 	      + uvc_streaming_intf_alt0.bLength;
 
-	if (speed == USB_SPEED_SUPER) {
-		bytes += uvc_ss_interrupt_comp.bLength;
-		n_desc = 6;
-	} else {
-		n_desc = 5;
+	n_desc = 3;
+	if (uvc->enable_interrupt_ep) {
+		bytes += uvc_interrupt_ep.bLength + uvc_interrupt_cs_ep.bLength;
+		n_desc += 2;
+
+		if (speed == USB_SPEED_SUPER) {
+			bytes += uvc_ss_interrupt_comp.bLength;
+			n_desc += 1;
+		}
 	}
 
 	for (src = (const struct usb_descriptor_header **)uvc_control_desc;
@@ -579,11 +586,14 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	uvc_control_header->bInCollection = 1;
 	uvc_control_header->baInterfaceNr[0] = uvc->streaming_intf;
 
-	UVC_COPY_DESCRIPTOR(mem, dst, &uvc_interrupt_ep);
-	if (speed == USB_SPEED_SUPER)
-		UVC_COPY_DESCRIPTOR(mem, dst, &uvc_ss_interrupt_comp);
+	if (uvc->enable_interrupt_ep) {
+		UVC_COPY_DESCRIPTOR(mem, dst, &uvc_interrupt_ep);
+		if (speed == USB_SPEED_SUPER)
+			UVC_COPY_DESCRIPTOR(mem, dst, &uvc_ss_interrupt_comp);
+
+		UVC_COPY_DESCRIPTOR(mem, dst, &uvc_interrupt_cs_ep);
+	}
 
-	UVC_COPY_DESCRIPTOR(mem, dst, &uvc_interrupt_cs_ep);
 	UVC_COPY_DESCRIPTOR(mem, dst, &uvc_streaming_intf_alt0);
 
 	uvc_streaming_header = mem;
@@ -666,12 +676,16 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 			    (opts->streaming_maxburst + 1));
 
 	/* Allocate endpoints. */
-	ep = usb_ep_autoconfig(cdev->gadget, &uvc_interrupt_ep);
-	if (!ep) {
-		uvcg_info(f, "Unable to allocate control EP\n");
-		goto error;
+	if (opts->enable_interrupt_ep) {
+		ep = usb_ep_autoconfig(cdev->gadget, &uvc_interrupt_ep);
+		if (!ep) {
+			uvcg_info(f, "Unable to allocate interrupt EP\n");
+			goto error;
+		}
+		uvc->interrupt_ep = ep;
+		uvc_control_intf.bNumEndpoints = 1;
 	}
-	uvc->interrupt_ep = ep;
+	uvc->enable_interrupt_ep = opts->enable_interrupt_ep;
 
 	if (gadget_is_superspeed(c->cdev->gadget))
 		ep = usb_ep_autoconfig_ss(cdev->gadget, &uvc_ss_streaming_ep,
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 48b71e04c2b1..daf226610f49 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -149,6 +149,7 @@ struct uvc_device {
 	struct usb_ep *interrupt_ep;
 	struct usb_request *control_req;
 	void *control_buf;
+	bool enable_interrupt_ep;
 
 	unsigned int streaming_intf;
 
-- 
2.34.1

