Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 088C168C300
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 17:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbjBFQUH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 11:20:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjBFQTj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 11:19:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBB99767
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 08:19:12 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B63C9CCE;
        Mon,  6 Feb 2023 17:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675700306;
        bh=Rpaju6xaCS80YsaJRwsX5h+RE72vEiTQHEKHYMX1pp8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pR7m9pbMYA5Msqs8M8FFPDKcWlisb6loX6V2UC4t6WaJ5CgAsxTVbuca5K/9Gc0uU
         c8uQlU0HqoRiuBPTki5zkDApg27wtT1Mv9C6qUxEcW0j1ZmTtMymwWxtlbJztAFGqQ
         SdoKzk4It1zbbyVrUam4wfvRxAOKDmIxX73Enxgs=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v5 04/11] usb: gadget: uvc: Copy XU descriptors during .bind()
Date:   Mon,  6 Feb 2023 16:17:55 +0000
Message-Id: <20230206161802.892954-5-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206161802.892954-1-dan.scally@ideasonboard.com>
References: <20230206161802.892954-1-dan.scally@ideasonboard.com>
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Laurent - I didn't add your tag because having switched it to a function I actually
decided I preferred it this way and switched it back; too many pointers to
pointers of things made it less easy to follow I think, but if you disagree let me
know and I'll go ahead.

Changes in v5:

	- None

Changes in v4:

	- None

Changes in v3:
	- Dropped a local variable.

Changes in v2:

	- none

 drivers/usb/gadget/function/f_uvc.c | 33 +++++++++++++++++++++++++++++
 drivers/usb/gadget/function/uvc.h   |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 443333471b4d..f6fd5decdcb7 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -478,6 +478,25 @@ uvc_register_video(struct uvc_device *uvc)
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
@@ -489,6 +508,7 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	const struct usb_descriptor_header * const *src;
 	struct usb_descriptor_header **dst;
 	struct usb_descriptor_header **hdr;
+	struct uvcg_extension *xu;
 	unsigned int control_size;
 	unsigned int streaming_size;
 	unsigned int n_desc;
@@ -556,6 +576,13 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
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
@@ -582,6 +609,10 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
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
@@ -1025,6 +1056,8 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
 		return ERR_PTR(-EBUSY);
 	}
 
+	uvc->desc.extension_units = &opts->extension_units;
+
 	++opts->refcnt;
 	mutex_unlock(&opts->lock);
 
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index daf226610f49..100475b1363e 100644
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

