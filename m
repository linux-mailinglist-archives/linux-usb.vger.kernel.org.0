Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF62F6809AB
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 10:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236497AbjA3JhT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 04:37:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236363AbjA3JhA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 04:37:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07EC2FCD9
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 01:36:26 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4CB7E68;
        Mon, 30 Jan 2023 10:35:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675071304;
        bh=QYBftZwbivgbIVf8Zad9f80Eo9svBQlkOxUos4eorrs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=olrA5f7ZymCqf+8lp6Rs5J05fwSqWtKqWJYHEPmTUhl2mHzBEHw9zJkvRv2jqY4tn
         mTZjP0hSQLwSAMFt1/qHTeC/gGfgWUWN8sar9NBxvYoTguxs6IEmgB1XiWnQmn+btk
         zRpuN1ZvHP6w3ckj7SB1LFE/Xyq5/zGI/dCqD06g=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 04/11] usb: gadget: uvc: Copy XU descriptors during .bind()
Date:   Mon, 30 Jan 2023 09:34:36 +0000
Message-Id: <20230130093443.25644-5-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130093443.25644-1-dan.scally@ideasonboard.com>
References: <20230130093443.25644-1-dan.scally@ideasonboard.com>
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

Now that extension unit support is available through configfs we need
to copy the descriptors for the XUs during uvc_function_bind() so that
they're exposed to the usb subsystem.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Laurent - I didn't add your tag because having switched it to a function I actually
decided I preferred it this way and switched it back; too many pointers to
pointers of things made it less easy to follow I think, but if you disagree let me
know and I'll go ahead.

Changes in v3:
	- Dropped a local variable.

Changes in v2:

	- none

 drivers/usb/gadget/function/f_uvc.c | 33 +++++++++++++++++++++++++++++
 drivers/usb/gadget/function/uvc.h   |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 64a9e35ff075..ca548974e5a0 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -474,6 +474,25 @@ uvc_register_video(struct uvc_device *uvc)
 		} \
 	} while (0)
 
+#define UVC_COPY_XU_DESCRIPTOR(mem, dst, desc)					\
+	do {									\
+		*(dst)++ = mem;							\
+		memcpy(mem, desc, 22); /* bLength to bNrInPins */		\
+		mem += 22;							\
+										\
+		memcpy(mem, (desc)->baSourceID, (desc)->bNrInPins);		\
+		mem += (desc)->bNrInPins;					\
+										\
+		memcpy(mem, &(desc)->bControlSize, 1);				\
+		mem++;								\
+										\
+		memcpy(mem, (desc)->bmControls, (desc)->bControlSize);		\
+		mem += (desc)->bControlSize;					\
+										\
+		memcpy(mem, &(desc)->iExtension, 1);				\
+		mem++;								\
+	} while (0)
+
 static struct usb_descriptor_header **
 uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 {
@@ -485,6 +504,7 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	const struct usb_descriptor_header * const *src;
 	struct usb_descriptor_header **dst;
 	struct usb_descriptor_header **hdr;
+	struct uvcg_extension *xu;
 	unsigned int control_size;
 	unsigned int streaming_size;
 	unsigned int n_desc;
@@ -549,6 +569,13 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 		bytes += (*src)->bLength;
 		n_desc++;
 	}
+
+	list_for_each_entry(xu, uvc->desc.extension_units, list) {
+		control_size += xu->desc.bLength;
+		bytes += xu->desc.bLength;
+		n_desc++;
+	}
+
 	for (src = (const struct usb_descriptor_header **)uvc_streaming_cls;
 	     *src; ++src) {
 		streaming_size += (*src)->bLength;
@@ -575,6 +602,10 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	uvc_control_header = mem;
 	UVC_COPY_DESCRIPTORS(mem, dst,
 		(const struct usb_descriptor_header **)uvc_control_desc);
+
+	list_for_each_entry(xu, uvc->desc.extension_units, list)
+		UVC_COPY_XU_DESCRIPTOR(mem, dst, &xu->desc);
+
 	uvc_control_header->wTotalLength = cpu_to_le16(control_size);
 	uvc_control_header->bInCollection = 1;
 	uvc_control_header->baInterfaceNr[0] = uvc->streaming_intf;
@@ -1020,6 +1051,8 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
 		return ERR_PTR(-EBUSY);
 	}
 
+	uvc->desc.extension_units = &opts->extension_units;
+
 	++opts->refcnt;
 	mutex_unlock(&opts->lock);
 
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 40226b1f7e14..f1a016d20bb6 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -143,6 +143,7 @@ struct uvc_device {
 		const struct uvc_descriptor_header * const *fs_streaming;
 		const struct uvc_descriptor_header * const *hs_streaming;
 		const struct uvc_descriptor_header * const *ss_streaming;
+		struct list_head *extension_units;
 	} desc;
 
 	unsigned int control_intf;
-- 
2.34.1

