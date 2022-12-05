Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0FF642ACE
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 15:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbiLEO6b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 09:58:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232008AbiLEO6V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 09:58:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B32DFD9
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 06:58:19 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0D3D3D7;
        Mon,  5 Dec 2022 15:58:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670252298;
        bh=V8tryI6MfILDJ/MgC4oeROdYCSA4ShfFz13n8nJbXLY=;
        h=From:To:Cc:Subject:Date:From;
        b=ZVdVK2iQeWCvq8+h+jlSl74F6L0N5aRu9tJeC/7GNBzylNl7RIkB2rD8J5brZ3NGM
         sxeq2j3jKJjyzQ1q3fkiumX6d6RKOQL1dWyfPK67KPI2OT8Hk62T0n9e96QPRQiNpk
         fADpqronlgDpw/rtXysiTDLr4Ua4QW/dc2ICUdxQ=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH] usb: gadget: uvc: Rename bmInterfaceFlags -> bmInterlaceFlags
Date:   Mon,  5 Dec 2022 14:58:07 +0000
Message-Id: <20221205145807.1099062-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

In the specification documents for the Uncompressed and MJPEG USB
Video Payloads, the field name is bmInterlaceFlags - it has been
misnamed within the kernel.

Although renaming the field does break the kernel's interface to
userspace it should be low-risk in this instance. The field is read
only and hardcoded to 0, so there was never any value in anyone
reading it. A search of our uvc-gadget application and all the major
forks that I could find for it did not reveal any users either.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/usb/gadget/function/uvc_configfs.c | 12 ++++++------
 include/uapi/linux/usb/video.h             |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 644d87eee164..fbeac2d765c0 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1565,7 +1565,7 @@ UVCG_UNCOMPRESSED_ATTR(b_bits_per_pixel, bBitsPerPixel, 8);
 UVCG_UNCOMPRESSED_ATTR(b_default_frame_index, bDefaultFrameIndex, 8);
 UVCG_UNCOMPRESSED_ATTR_RO(b_aspect_ratio_x, bAspectRatioX, 8);
 UVCG_UNCOMPRESSED_ATTR_RO(b_aspect_ratio_y, bAspectRatioY, 8);
-UVCG_UNCOMPRESSED_ATTR_RO(bm_interface_flags, bmInterfaceFlags, 8);
+UVCG_UNCOMPRESSED_ATTR_RO(bm_interlace_flags, bmInterlaceFlags, 8);
 
 #undef UVCG_UNCOMPRESSED_ATTR
 #undef UVCG_UNCOMPRESSED_ATTR_RO
@@ -1594,7 +1594,7 @@ static struct configfs_attribute *uvcg_uncompressed_attrs[] = {
 	&uvcg_uncompressed_attr_b_default_frame_index,
 	&uvcg_uncompressed_attr_b_aspect_ratio_x,
 	&uvcg_uncompressed_attr_b_aspect_ratio_y,
-	&uvcg_uncompressed_attr_bm_interface_flags,
+	&uvcg_uncompressed_attr_bm_interlace_flags,
 	&uvcg_uncompressed_attr_bma_controls,
 	NULL,
 };
@@ -1627,7 +1627,7 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
 	h->desc.bDefaultFrameIndex	= 1;
 	h->desc.bAspectRatioX		= 0;
 	h->desc.bAspectRatioY		= 0;
-	h->desc.bmInterfaceFlags	= 0;
+	h->desc.bmInterlaceFlags	= 0;
 	h->desc.bCopyProtect		= 0;
 
 	INIT_LIST_HEAD(&h->fmt.frames);
@@ -1753,7 +1753,7 @@ UVCG_MJPEG_ATTR(b_default_frame_index, bDefaultFrameIndex, 8);
 UVCG_MJPEG_ATTR_RO(bm_flags, bmFlags, 8);
 UVCG_MJPEG_ATTR_RO(b_aspect_ratio_x, bAspectRatioX, 8);
 UVCG_MJPEG_ATTR_RO(b_aspect_ratio_y, bAspectRatioY, 8);
-UVCG_MJPEG_ATTR_RO(bm_interface_flags, bmInterfaceFlags, 8);
+UVCG_MJPEG_ATTR_RO(bm_interlace_flags, bmInterlaceFlags, 8);
 
 #undef UVCG_MJPEG_ATTR
 #undef UVCG_MJPEG_ATTR_RO
@@ -1781,7 +1781,7 @@ static struct configfs_attribute *uvcg_mjpeg_attrs[] = {
 	&uvcg_mjpeg_attr_bm_flags,
 	&uvcg_mjpeg_attr_b_aspect_ratio_x,
 	&uvcg_mjpeg_attr_b_aspect_ratio_y,
-	&uvcg_mjpeg_attr_bm_interface_flags,
+	&uvcg_mjpeg_attr_bm_interlace_flags,
 	&uvcg_mjpeg_attr_bma_controls,
 	NULL,
 };
@@ -1808,7 +1808,7 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
 	h->desc.bDefaultFrameIndex	= 1;
 	h->desc.bAspectRatioX		= 0;
 	h->desc.bAspectRatioY		= 0;
-	h->desc.bmInterfaceFlags	= 0;
+	h->desc.bmInterlaceFlags	= 0;
 	h->desc.bCopyProtect		= 0;
 
 	INIT_LIST_HEAD(&h->fmt.frames);
diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
index bfdae12cdacf..6e8e572c2980 100644
--- a/include/uapi/linux/usb/video.h
+++ b/include/uapi/linux/usb/video.h
@@ -466,7 +466,7 @@ struct uvc_format_uncompressed {
 	__u8  bDefaultFrameIndex;
 	__u8  bAspectRatioX;
 	__u8  bAspectRatioY;
-	__u8  bmInterfaceFlags;
+	__u8  bmInterlaceFlags;
 	__u8  bCopyProtect;
 } __attribute__((__packed__));
 
@@ -522,7 +522,7 @@ struct uvc_format_mjpeg {
 	__u8  bDefaultFrameIndex;
 	__u8  bAspectRatioX;
 	__u8  bAspectRatioY;
-	__u8  bmInterfaceFlags;
+	__u8  bmInterlaceFlags;
 	__u8  bCopyProtect;
 } __attribute__((__packed__));
 
-- 
2.34.1

