Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37B2642A7A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 15:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbiLEOiM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 09:38:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbiLEOiK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 09:38:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85DFEC753
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 06:38:09 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85320589;
        Mon,  5 Dec 2022 15:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670251087;
        bh=lIb6Y9z0mV5ts1vXngiUBxzZUtOO/7Uc4svs5jIi+IU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Cy7QKR6rxB2QDoW3RJJgioJWcGF6irGazZNlo8gTc8oJuFDC6+3w0XwEqkNn/eZhs
         NhgG+df9/LPLcaqBUkJsJ/tFzEcrjdcxYC6DDDLWUP+2nC32uOIFAOuLJg9FVt4Gx4
         wyerTzWoojxh4lBtNhgvPZXzypLs5FhWEOF2NSNI=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 1/3] usb: gadget: uvc: Rename uvc_control_ep
Date:   Mon,  5 Dec 2022 14:37:56 +0000
Message-Id: <20221205143758.1096914-2-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205143758.1096914-1-dan.scally@ideasonboard.com>
References: <20221205143758.1096914-1-dan.scally@ideasonboard.com>
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

The f_uvc code defines an endpoint named "uvc_control_ep" but it
is configured with a non-zero endpoint address and has its
bmAttributes flagged as USB_ENDPOINT_XFER_INT - this cannot be the
VideoControl interface's control endpoint, as the default endpoint
0 is used for that purpose. This is instead the optional interrupt
endpoint that can be contained by a VideoControl interface.

Rename the variables to make that clear.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/usb/gadget/function/f_uvc.c | 24 ++++++++++++------------
 drivers/usb/gadget/function/uvc.h   |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 6e196e06181e..49b7231742d6 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -86,7 +86,7 @@ static struct usb_interface_descriptor uvc_control_intf = {
 	.iInterface		= 0,
 };
 
-static struct usb_endpoint_descriptor uvc_control_ep = {
+static struct usb_endpoint_descriptor uvc_interrupt_ep = {
 	.bLength		= USB_DT_ENDPOINT_SIZE,
 	.bDescriptorType	= USB_DT_ENDPOINT,
 	.bEndpointAddress	= USB_DIR_IN,
@@ -290,14 +290,14 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
 		if (alt)
 			return -EINVAL;
 
-		uvcg_info(f, "reset UVC Control\n");
-		usb_ep_disable(uvc->control_ep);
+		uvcg_info(f, "reset UVC interrupt endpoint\n");
+		usb_ep_disable(uvc->interrupt_ep);
 
-		if (!uvc->control_ep->desc)
-			if (config_ep_by_speed(cdev->gadget, f, uvc->control_ep))
+		if (!uvc->interrupt_ep->desc)
+			if (config_ep_by_speed(cdev->gadget, f, uvc->interrupt_ep))
 				return -EINVAL;
 
-		usb_ep_enable(uvc->control_ep);
+		usb_ep_enable(uvc->interrupt_ep);
 
 		if (uvc->state == UVC_STATE_DISCONNECTED) {
 			memset(&v4l2_event, 0, sizeof(v4l2_event));
@@ -375,7 +375,7 @@ uvc_function_disable(struct usb_function *f)
 	uvc->state = UVC_STATE_DISCONNECTED;
 
 	usb_ep_disable(uvc->video.ep);
-	usb_ep_disable(uvc->control_ep);
+	usb_ep_disable(uvc->interrupt_ep);
 }
 
 /* --------------------------------------------------------------------------
@@ -511,7 +511,7 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	 * uvc_iad
 	 * uvc_control_intf
 	 * Class-specific UVC control descriptors
-	 * uvc_control_ep
+	 * uvc_interrupt_ep
 	 * uvc_control_cs_ep
 	 * uvc_ss_control_comp (for SS only)
 	 * uvc_streaming_intf_alt0
@@ -523,7 +523,7 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	control_size = 0;
 	streaming_size = 0;
 	bytes = uvc_iad.bLength + uvc_control_intf.bLength
-	      + uvc_control_ep.bLength + uvc_control_cs_ep.bLength
+	      + uvc_interrupt_ep.bLength + uvc_control_cs_ep.bLength
 	      + uvc_streaming_intf_alt0.bLength;
 
 	if (speed == USB_SPEED_SUPER) {
@@ -569,7 +569,7 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	uvc_control_header->bInCollection = 1;
 	uvc_control_header->baInterfaceNr[0] = uvc->streaming_intf;
 
-	UVC_COPY_DESCRIPTOR(mem, dst, &uvc_control_ep);
+	UVC_COPY_DESCRIPTOR(mem, dst, &uvc_interrupt_ep);
 	if (speed == USB_SPEED_SUPER)
 		UVC_COPY_DESCRIPTOR(mem, dst, &uvc_ss_control_comp);
 
@@ -656,12 +656,12 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 			    (opts->streaming_maxburst + 1));
 
 	/* Allocate endpoints. */
-	ep = usb_ep_autoconfig(cdev->gadget, &uvc_control_ep);
+	ep = usb_ep_autoconfig(cdev->gadget, &uvc_interrupt_ep);
 	if (!ep) {
 		uvcg_info(f, "Unable to allocate control EP\n");
 		goto error;
 	}
-	uvc->control_ep = ep;
+	uvc->interrupt_ep = ep;
 
 	if (gadget_is_superspeed(c->cdev->gadget))
 		ep = usb_ep_autoconfig_ss(cdev->gadget, &uvc_ss_streaming_ep,
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 40226b1f7e14..48b71e04c2b1 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -146,7 +146,7 @@ struct uvc_device {
 	} desc;
 
 	unsigned int control_intf;
-	struct usb_ep *control_ep;
+	struct usb_ep *interrupt_ep;
 	struct usb_request *control_req;
 	void *control_buf;
 
-- 
2.34.1

