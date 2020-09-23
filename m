Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3A22758F8
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 15:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgIWNoV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 09:44:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:33444 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726632AbgIWNoT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 09:44:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600868657;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=4phvKJ0SZ2JhYuDOrybT7FClnROMhg12sNuEuEf1yK0=;
        b=eJ81hEHgbXpojNbe3Kx9GDvdPxG2RSK71WpUiM5FjDJph6G9t/FJBwSlN5+mwdW6uUaRDZ
        OpBvQ1b/AcIEBvZkVXjohFjIA9afChi4xmtOSau7PYcMayYa3g5U4PjlYQIuBUT+Al5hNO
        Bubabj5UKpOEhcEk3J6X4hNxB1rBKUo=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7EDACADEE;
        Wed, 23 Sep 2020 13:44:54 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     himadrispandya@gmail.com, gregKH@linuxfoundation.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 08/14] USB: correct API of usb_control_msg_send/recv
Date:   Wed, 23 Sep 2020 15:43:42 +0200
Message-Id: <20200923134348.23862-9-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200923134348.23862-1-oneukum@suse.com>
References: <20200923134348.23862-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

They need to specify how memory is to be allocated,
as control messages need to work in contexts that require GFP_NOIO.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/message.c | 25 ++++++++++++++++---------
 include/linux/usb.h        |  6 ++++--
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 1580694e3b95..f4107b9e8c38 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -174,6 +174,7 @@ EXPORT_SYMBOL_GPL(usb_control_msg);
  * @size: length in bytes of the data to send
  * @timeout: time in msecs to wait for the message to complete before timing
  *	out (if 0 the wait is forever)
+ * @memflags: the flags for memory allocation for buffers
  *
  * Context: !in_interrupt ()
  *
@@ -196,7 +197,8 @@ EXPORT_SYMBOL_GPL(usb_control_msg);
  */
 int usb_control_msg_send(struct usb_device *dev, __u8 endpoint, __u8 request,
 			 __u8 requesttype, __u16 value, __u16 index,
-			 const void *driver_data, __u16 size, int timeout)
+			 const void *driver_data, __u16 size, int timeout,
+			 gfp_t memflags)
 {
 	unsigned int pipe = usb_sndctrlpipe(dev, endpoint);
 	int ret;
@@ -206,7 +208,7 @@ int usb_control_msg_send(struct usb_device *dev, __u8 endpoint, __u8 request,
 		return -EINVAL;
 
 	if (size) {
-		data = kmemdup(driver_data, size, GFP_KERNEL);
+		data = kmemdup(driver_data, size, memflags);
 		if (!data)
 			return -ENOMEM;
 	}
@@ -235,6 +237,7 @@ EXPORT_SYMBOL_GPL(usb_control_msg_send);
  * @size: length in bytes of the data to be received
  * @timeout: time in msecs to wait for the message to complete before timing
  *	out (if 0 the wait is forever)
+ * @memflags: the flags for memory allocation for buffers
  *
  * Context: !in_interrupt ()
  *
@@ -263,7 +266,8 @@ EXPORT_SYMBOL_GPL(usb_control_msg_send);
  */
 int usb_control_msg_recv(struct usb_device *dev, __u8 endpoint, __u8 request,
 			 __u8 requesttype, __u16 value, __u16 index,
-			 void *driver_data, __u16 size, int timeout)
+			 void *driver_data, __u16 size, int timeout,
+			 gfp_t memflags)
 {
 	unsigned int pipe = usb_rcvctrlpipe(dev, endpoint);
 	int ret;
@@ -272,7 +276,7 @@ int usb_control_msg_recv(struct usb_device *dev, __u8 endpoint, __u8 request,
 	if (!size || !driver_data || usb_pipe_type_check(dev, pipe))
 		return -EINVAL;
 
-	data = kmalloc(size, GFP_KERNEL);
+	data = kmalloc(size, memflags);
 	if (!data)
 		return -ENOMEM;
 
@@ -1085,7 +1089,8 @@ int usb_set_isoch_delay(struct usb_device *dev)
 			USB_REQ_SET_ISOCH_DELAY,
 			USB_DIR_OUT | USB_TYPE_STANDARD | USB_RECIP_DEVICE,
 			dev->hub_delay, 0, NULL, 0,
-			USB_CTRL_SET_TIMEOUT);
+			USB_CTRL_SET_TIMEOUT,
+			GFP_NOIO);
 }
 
 /**
@@ -1206,7 +1211,7 @@ int usb_clear_halt(struct usb_device *dev, int pipe)
 	result = usb_control_msg_send(dev, 0,
 				      USB_REQ_CLEAR_FEATURE, USB_RECIP_ENDPOINT,
 				      USB_ENDPOINT_HALT, endp, NULL, 0,
-				      USB_CTRL_SET_TIMEOUT);
+				      USB_CTRL_SET_TIMEOUT, GFP_NOIO);
 
 	/* don't un-halt or force to DATA0 except on success */
 	if (result)
@@ -1574,7 +1579,8 @@ int usb_set_interface(struct usb_device *dev, int interface, int alternate)
 		ret = usb_control_msg_send(dev, 0,
 					   USB_REQ_SET_INTERFACE,
 					   USB_RECIP_INTERFACE, alternate,
-					   interface, NULL, 0, 5000);
+					   interface, NULL, 0, 5000,
+					   GFP_NOIO);
 
 	/* 9.4.10 says devices don't need this and are free to STALL the
 	 * request if the interface only has one alternate setting.
@@ -1710,7 +1716,8 @@ int usb_reset_configuration(struct usb_device *dev)
 	}
 	retval = usb_control_msg_send(dev, 0, USB_REQ_SET_CONFIGURATION, 0,
 				      config->desc.bConfigurationValue, 0,
-				      NULL, 0, USB_CTRL_SET_TIMEOUT);
+				      NULL, 0, USB_CTRL_SET_TIMEOUT,
+				      GFP_NOIO);
 	if (retval) {
 		usb_hcd_alloc_bandwidth(dev, NULL, NULL, NULL);
 		usb_enable_lpm(dev);
@@ -2098,7 +2105,7 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 
 	ret = usb_control_msg_send(dev, 0, USB_REQ_SET_CONFIGURATION, 0,
 				   configuration, 0, NULL, 0,
-				   USB_CTRL_SET_TIMEOUT);
+				   USB_CTRL_SET_TIMEOUT, GFP_NOIO);
 	if (ret && cp) {
 		/*
 		 * All the old state is gone, so what else can we do?
diff --git a/include/linux/usb.h b/include/linux/usb.h
index a5460f08126e..7d72c4e0713c 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1804,10 +1804,12 @@ extern int usb_bulk_msg(struct usb_device *usb_dev, unsigned int pipe,
 /* wrappers around usb_control_msg() for the most common standard requests */
 int usb_control_msg_send(struct usb_device *dev, __u8 endpoint, __u8 request,
 			 __u8 requesttype, __u16 value, __u16 index,
-			 const void *data, __u16 size, int timeout);
+			 const void *data, __u16 size, int timeout,
+			 gfp_t memflags);
 int usb_control_msg_recv(struct usb_device *dev, __u8 endpoint, __u8 request,
 			 __u8 requesttype, __u16 value, __u16 index,
-			 void *data, __u16 size, int timeout);
+			 void *data, __u16 size, int timeout,
+			 gfp_t memflags);
 extern int usb_get_descriptor(struct usb_device *dev, unsigned char desctype,
 	unsigned char descindex, void *buf, int size);
 extern int usb_get_status(struct usb_device *dev,
-- 
2.16.4

