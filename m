Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2C20680B4C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 11:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235689AbjA3KvC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 05:51:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233324AbjA3Ku6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 05:50:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1EE22E0E7
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 02:50:56 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2A828CC;
        Mon, 30 Jan 2023 11:50:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675075855;
        bh=4dAqR0m1dxxSildWdH/gOfq8k+CQQiw4as+TPpIPlww=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y2Z7GOOPjiZht05mkD0PacYQXmg7/ad5VAE/TCcgqlAM7Z/iP4ixvAYjGu0wzTtD6
         C3pso7kJ5QnOHTHQhu3nmvawYyg2HV8IheWnvnAXZZrAJe2hIwpSB+gGLN4+TfubdS
         tICDUOm1w3PBVAESxpP4Srz6RJIE+HzpgRJxwJHg=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 1/3] usb: gadget: uvc: Rename uvc_control_ep
Date:   Mon, 30 Jan 2023 10:50:43 +0000
Message-Id: <20230130105045.120886-2-dan.scally@ideasonboard.com>
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

The f_uvc code defines an endpoint named "uvc_control_ep" but it
is configured with a non-zero endpoint address and has its
bmAttributes flagged as USB_ENDPOINT_XFER_INT - this cannot be the
VideoControl interface's control endpoint, as the default endpoint
0 is used for that purpose. This is instead the optional interrupt
endpoint that can be contained by a VideoControl interface. There
is also a Class-specific VC Interrupt Endpoint Descriptor and a
SuperSpeed companion descriptor that are also for the VC interface's
interrupt endpoint but are named as though they are for the control
endpoint.

Rename the variables to make that clear.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2 (Laurent):

	- Also renamed the companion descriptors to the endpoint descriptor.

 drivers/usb/gadget/function/f_uvc.c | 40 ++++++++++++++---------------
 drivers/usb/gadget/function/uvc.h   |  2 +-
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 32f2c1645467..a673001f5271 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -83,7 +83,7 @@ static struct usb_interface_descriptor uvc_control_intf = {
 	.iInterface		= 0,
 };
 
-static struct usb_endpoint_descriptor uvc_control_ep = {
+static struct usb_endpoint_descriptor uvc_interrupt_ep = {
 	.bLength		= USB_DT_ENDPOINT_SIZE,
 	.bDescriptorType	= USB_DT_ENDPOINT,
 	.bEndpointAddress	= USB_DIR_IN,
@@ -92,8 +92,8 @@ static struct usb_endpoint_descriptor uvc_control_ep = {
 	.bInterval		= 8,
 };
 
-static struct usb_ss_ep_comp_descriptor uvc_ss_control_comp = {
-	.bLength		= sizeof(uvc_ss_control_comp),
+static struct usb_ss_ep_comp_descriptor uvc_ss_interrupt_comp = {
+	.bLength		= sizeof(uvc_ss_interrupt_comp),
 	.bDescriptorType	= USB_DT_SS_ENDPOINT_COMP,
 	/* The following 3 values can be tweaked if necessary. */
 	.bMaxBurst		= 0,
@@ -101,7 +101,7 @@ static struct usb_ss_ep_comp_descriptor uvc_ss_control_comp = {
 	.wBytesPerInterval	= cpu_to_le16(UVC_STATUS_MAX_PACKET_SIZE),
 };
 
-static struct uvc_control_endpoint_descriptor uvc_control_cs_ep = {
+static struct uvc_control_endpoint_descriptor uvc_interrupt_cs_ep = {
 	.bLength		= UVC_DT_CONTROL_ENDPOINT_SIZE,
 	.bDescriptorType	= USB_DT_CS_ENDPOINT,
 	.bDescriptorSubType	= UVC_EP_INTERRUPT,
@@ -300,14 +300,14 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
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
@@ -385,7 +385,7 @@ uvc_function_disable(struct usb_function *f)
 	uvc->state = UVC_STATE_DISCONNECTED;
 
 	usb_ep_disable(uvc->video.ep);
-	usb_ep_disable(uvc->control_ep);
+	usb_ep_disable(uvc->interrupt_ep);
 }
 
 /* --------------------------------------------------------------------------
@@ -521,9 +521,9 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	 * uvc_iad
 	 * uvc_control_intf
 	 * Class-specific UVC control descriptors
-	 * uvc_control_ep
-	 * uvc_control_cs_ep
-	 * uvc_ss_control_comp (for SS only)
+	 * uvc_interrupt_ep
+	 * uvc_interrupt_cs_ep
+	 * uvc_ss_interrupt_comp (for SS only)
 	 * uvc_streaming_intf_alt0
 	 * Class-specific UVC streaming descriptors
 	 * uvc_{fs|hs}_streaming
@@ -533,11 +533,11 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	control_size = 0;
 	streaming_size = 0;
 	bytes = uvc_iad.bLength + uvc_control_intf.bLength
-	      + uvc_control_ep.bLength + uvc_control_cs_ep.bLength
+	      + uvc_interrupt_ep.bLength + uvc_interrupt_cs_ep.bLength
 	      + uvc_streaming_intf_alt0.bLength;
 
 	if (speed == USB_SPEED_SUPER) {
-		bytes += uvc_ss_control_comp.bLength;
+		bytes += uvc_ss_interrupt_comp.bLength;
 		n_desc = 6;
 	} else {
 		n_desc = 5;
@@ -579,11 +579,11 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	uvc_control_header->bInCollection = 1;
 	uvc_control_header->baInterfaceNr[0] = uvc->streaming_intf;
 
-	UVC_COPY_DESCRIPTOR(mem, dst, &uvc_control_ep);
+	UVC_COPY_DESCRIPTOR(mem, dst, &uvc_interrupt_ep);
 	if (speed == USB_SPEED_SUPER)
-		UVC_COPY_DESCRIPTOR(mem, dst, &uvc_ss_control_comp);
+		UVC_COPY_DESCRIPTOR(mem, dst, &uvc_ss_interrupt_comp);
 
-	UVC_COPY_DESCRIPTOR(mem, dst, &uvc_control_cs_ep);
+	UVC_COPY_DESCRIPTOR(mem, dst, &uvc_interrupt_cs_ep);
 	UVC_COPY_DESCRIPTOR(mem, dst, &uvc_streaming_intf_alt0);
 
 	uvc_streaming_header = mem;
@@ -666,12 +666,12 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
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

