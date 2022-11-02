Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D02B26165E8
	for <lists+linux-usb@lfdr.de>; Wed,  2 Nov 2022 16:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbiKBPSs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Nov 2022 11:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbiKBPSi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Nov 2022 11:18:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F83F01E
        for <linux-usb@vger.kernel.org>; Wed,  2 Nov 2022 08:18:23 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB6BF15D1;
        Wed,  2 Nov 2022 16:18:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667402298;
        bh=Z9YN4ql9pb1ydGQ6sQfrn9jZPCKcv6/S/4DyWVYuY10=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J2G/WIoQrm7aqFQ8TTteU7c0OokbKCVJdSN6n+62Sxf5fo9VPKJdkvzIlNb+fXL7F
         mvIujK5I67y4vAAlGel5Yf0OEQF2lhxFdYlAZEB8roZL60jBpbTewATiu6012KRgdI
         rd3Dsc8GY+S3XeYEel4NnwzWxXZVIAdPxGhPRdtY=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 4/4] usb: gadget: uvc: Copy XU descriptors during .bind()
Date:   Wed,  2 Nov 2022 15:17:55 +0000
Message-Id: <20221102151755.1022841-5-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102151755.1022841-1-dan.scally@ideasonboard.com>
References: <20221102151755.1022841-1-dan.scally@ideasonboard.com>
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

I don't especially like UVC_COPY_XU_DESCRIPTOR(), but the need to vary the array
size for baSourceID and bmControls plus the requirement for the struct to be
copied to consecutive bytes of memory constrained it a bit. An alternative might
be to replace baSourceID, bControlSize, bmControls and iExtension in struct
uvcg_extension_unit_descriptor with a single flexible array member (called data[]
or something). That would allow the copy to be a much more straight forward
memcpy(mem, desc, desc->bLength); - but the cost would be reallocating the entire
struct each time the baSourceID or bmControls attributes was changed. That might
be a better method, but I thought I'd stick with this for this submission at least
on the grounds that it's less confusing.

 drivers/usb/gadget/function/f_uvc.c | 35 +++++++++++++++++++++++++++++
 drivers/usb/gadget/function/uvc.h   |  1 +
 2 files changed, 36 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index eca5f36dfa74..e0a308f1355c 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -464,6 +464,25 @@ uvc_register_video(struct uvc_device *uvc)
 		} \
 	} while (0)
 
+#define UVC_COPY_XU_DESCRIPTOR(mem, dst, desc)					\
+	do {									\
+		*(dst)++ = mem;							\
+		memcpy(mem, desc, 22); /* bLength to bNrInPins */		\
+		mem += 22;							\
+										\
+		memcpy(mem, desc->baSourceID, desc->bNrInPins);			\
+		mem += desc->bNrInPins;						\
+										\
+		memcpy(mem, &desc->bControlSize, 1);				\
+		mem++;								\
+										\
+		memcpy(mem, desc->bmControls, desc->bControlSize);		\
+		mem += desc->bControlSize;					\
+										\
+		memcpy(mem, &desc->iExtension, 1);				\
+		mem++;								\
+	} while (0)
+
 static struct usb_descriptor_header **
 uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 {
@@ -475,6 +494,7 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	const struct usb_descriptor_header * const *src;
 	struct usb_descriptor_header **dst;
 	struct usb_descriptor_header **hdr;
+	struct uvcg_extension *xu;
 	unsigned int control_size;
 	unsigned int streaming_size;
 	unsigned int n_desc;
@@ -539,6 +559,13 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
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
@@ -565,6 +592,13 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	uvc_control_header = mem;
 	UVC_COPY_DESCRIPTORS(mem, dst,
 		(const struct usb_descriptor_header **)uvc_control_desc);
+
+	list_for_each_entry(xu, uvc->desc.extension_units, list) {
+		struct uvcg_extension_unit_descriptor *desc = &xu->desc;
+
+		UVC_COPY_XU_DESCRIPTOR(mem, dst, desc);
+	}
+
 	uvc_control_header->wTotalLength = cpu_to_le16(control_size);
 	uvc_control_header->bInCollection = 1;
 	uvc_control_header->baInterfaceNr[0] = uvc->streaming_intf;
@@ -988,6 +1022,7 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
 	uvc->desc.fs_streaming = opts->fs_streaming;
 	uvc->desc.hs_streaming = opts->hs_streaming;
 	uvc->desc.ss_streaming = opts->ss_streaming;
+	uvc->desc.extension_units = &opts->extension_units;
 
 	streaming = config_group_find_item(&opts->func_inst.group, "streaming");
 	if (!streaming)
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

