Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71B746E478
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 09:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235092AbhLIIrD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 03:47:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235074AbhLIIrA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 03:47:00 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1B7C061A72
        for <linux-usb@vger.kernel.org>; Thu,  9 Dec 2021 00:43:26 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mvF1R-0003qy-1k; Thu, 09 Dec 2021 09:43:25 +0100
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1mvF1Q-00BCfe-2b; Thu, 09 Dec 2021 09:43:24 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de
Subject: [PATCH v5 2/7] media: uvcvideo: move uvc_format_desc to common header
Date:   Thu,  9 Dec 2021 09:43:17 +0100
Message-Id: <20211209084322.2662616-3-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211209084322.2662616-1-m.grzeschik@pengutronix.de>
References: <20211209084322.2662616-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The uvc_format_desc, GUID defines and the uvc_format_by_guid helper is
also useful for the uvc gadget stack. This patch moves them to a common
header.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: -
v2 -> v3: -
v3 -> v4: -
v4 -> v5: -

 drivers/media/usb/uvc/uvc_ctrl.c   |   1 +
 drivers/media/usb/uvc/uvc_driver.c | 201 +----------------
 drivers/media/usb/uvc/uvcvideo.h   | 141 ------------
 include/media/v4l2-uvc.h           | 351 +++++++++++++++++++++++++++++
 4 files changed, 353 insertions(+), 341 deletions(-)
 create mode 100644 include/media/v4l2-uvc.h

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 30bfe9069a1fb4..20d1555cc174d0 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -18,6 +18,7 @@
 #include <linux/workqueue.h>
 #include <linux/atomic.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-uvc.h>
 
 #include "uvcvideo.h"
 
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index cdb92da0f56afd..57e489f9df9e4b 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -20,6 +20,7 @@
 
 #include <media/v4l2-common.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-uvc.h>
 
 #include "uvcvideo.h"
 
@@ -34,193 +35,6 @@ static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_dbg_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
 
-/* ------------------------------------------------------------------------
- * Video formats
- */
-
-static struct uvc_format_desc uvc_fmts[] = {
-	{
-		.name		= "YUV 4:2:2 (YUYV)",
-		.guid		= UVC_GUID_FORMAT_YUY2,
-		.fcc		= V4L2_PIX_FMT_YUYV,
-	},
-	{
-		.name		= "YUV 4:2:2 (YUYV)",
-		.guid		= UVC_GUID_FORMAT_YUY2_ISIGHT,
-		.fcc		= V4L2_PIX_FMT_YUYV,
-	},
-	{
-		.name		= "YUV 4:2:0 (NV12)",
-		.guid		= UVC_GUID_FORMAT_NV12,
-		.fcc		= V4L2_PIX_FMT_NV12,
-	},
-	{
-		.name		= "MJPEG",
-		.guid		= UVC_GUID_FORMAT_MJPEG,
-		.fcc		= V4L2_PIX_FMT_MJPEG,
-	},
-	{
-		.name		= "YVU 4:2:0 (YV12)",
-		.guid		= UVC_GUID_FORMAT_YV12,
-		.fcc		= V4L2_PIX_FMT_YVU420,
-	},
-	{
-		.name		= "YUV 4:2:0 (I420)",
-		.guid		= UVC_GUID_FORMAT_I420,
-		.fcc		= V4L2_PIX_FMT_YUV420,
-	},
-	{
-		.name		= "YUV 4:2:0 (M420)",
-		.guid		= UVC_GUID_FORMAT_M420,
-		.fcc		= V4L2_PIX_FMT_M420,
-	},
-	{
-		.name		= "YUV 4:2:2 (UYVY)",
-		.guid		= UVC_GUID_FORMAT_UYVY,
-		.fcc		= V4L2_PIX_FMT_UYVY,
-	},
-	{
-		.name		= "Greyscale 8-bit (Y800)",
-		.guid		= UVC_GUID_FORMAT_Y800,
-		.fcc		= V4L2_PIX_FMT_GREY,
-	},
-	{
-		.name		= "Greyscale 8-bit (Y8  )",
-		.guid		= UVC_GUID_FORMAT_Y8,
-		.fcc		= V4L2_PIX_FMT_GREY,
-	},
-	{
-		.name		= "Greyscale 8-bit (D3DFMT_L8)",
-		.guid		= UVC_GUID_FORMAT_D3DFMT_L8,
-		.fcc		= V4L2_PIX_FMT_GREY,
-	},
-	{
-		.name		= "IR 8-bit (L8_IR)",
-		.guid		= UVC_GUID_FORMAT_KSMEDIA_L8_IR,
-		.fcc		= V4L2_PIX_FMT_GREY,
-	},
-	{
-		.name		= "Greyscale 10-bit (Y10 )",
-		.guid		= UVC_GUID_FORMAT_Y10,
-		.fcc		= V4L2_PIX_FMT_Y10,
-	},
-	{
-		.name		= "Greyscale 12-bit (Y12 )",
-		.guid		= UVC_GUID_FORMAT_Y12,
-		.fcc		= V4L2_PIX_FMT_Y12,
-	},
-	{
-		.name		= "Greyscale 16-bit (Y16 )",
-		.guid		= UVC_GUID_FORMAT_Y16,
-		.fcc		= V4L2_PIX_FMT_Y16,
-	},
-	{
-		.name		= "BGGR Bayer (BY8 )",
-		.guid		= UVC_GUID_FORMAT_BY8,
-		.fcc		= V4L2_PIX_FMT_SBGGR8,
-	},
-	{
-		.name		= "BGGR Bayer (BA81)",
-		.guid		= UVC_GUID_FORMAT_BA81,
-		.fcc		= V4L2_PIX_FMT_SBGGR8,
-	},
-	{
-		.name		= "GBRG Bayer (GBRG)",
-		.guid		= UVC_GUID_FORMAT_GBRG,
-		.fcc		= V4L2_PIX_FMT_SGBRG8,
-	},
-	{
-		.name		= "GRBG Bayer (GRBG)",
-		.guid		= UVC_GUID_FORMAT_GRBG,
-		.fcc		= V4L2_PIX_FMT_SGRBG8,
-	},
-	{
-		.name		= "RGGB Bayer (RGGB)",
-		.guid		= UVC_GUID_FORMAT_RGGB,
-		.fcc		= V4L2_PIX_FMT_SRGGB8,
-	},
-	{
-		.name		= "RGB565",
-		.guid		= UVC_GUID_FORMAT_RGBP,
-		.fcc		= V4L2_PIX_FMT_RGB565,
-	},
-	{
-		.name		= "BGR 8:8:8 (BGR3)",
-		.guid		= UVC_GUID_FORMAT_BGR3,
-		.fcc		= V4L2_PIX_FMT_BGR24,
-	},
-	{
-		.name		= "H.264",
-		.guid		= UVC_GUID_FORMAT_H264,
-		.fcc		= V4L2_PIX_FMT_H264,
-	},
-	{
-		.name		= "Greyscale 8 L/R (Y8I)",
-		.guid		= UVC_GUID_FORMAT_Y8I,
-		.fcc		= V4L2_PIX_FMT_Y8I,
-	},
-	{
-		.name		= "Greyscale 12 L/R (Y12I)",
-		.guid		= UVC_GUID_FORMAT_Y12I,
-		.fcc		= V4L2_PIX_FMT_Y12I,
-	},
-	{
-		.name		= "Depth data 16-bit (Z16)",
-		.guid		= UVC_GUID_FORMAT_Z16,
-		.fcc		= V4L2_PIX_FMT_Z16,
-	},
-	{
-		.name		= "Bayer 10-bit (SRGGB10P)",
-		.guid		= UVC_GUID_FORMAT_RW10,
-		.fcc		= V4L2_PIX_FMT_SRGGB10P,
-	},
-	{
-		.name		= "Bayer 16-bit (SBGGR16)",
-		.guid		= UVC_GUID_FORMAT_BG16,
-		.fcc		= V4L2_PIX_FMT_SBGGR16,
-	},
-	{
-		.name		= "Bayer 16-bit (SGBRG16)",
-		.guid		= UVC_GUID_FORMAT_GB16,
-		.fcc		= V4L2_PIX_FMT_SGBRG16,
-	},
-	{
-		.name		= "Bayer 16-bit (SRGGB16)",
-		.guid		= UVC_GUID_FORMAT_RG16,
-		.fcc		= V4L2_PIX_FMT_SRGGB16,
-	},
-	{
-		.name		= "Bayer 16-bit (SGRBG16)",
-		.guid		= UVC_GUID_FORMAT_GR16,
-		.fcc		= V4L2_PIX_FMT_SGRBG16,
-	},
-	{
-		.name		= "Depth data 16-bit (Z16)",
-		.guid		= UVC_GUID_FORMAT_INVZ,
-		.fcc		= V4L2_PIX_FMT_Z16,
-	},
-	{
-		.name		= "Greyscale 10-bit (Y10 )",
-		.guid		= UVC_GUID_FORMAT_INVI,
-		.fcc		= V4L2_PIX_FMT_Y10,
-	},
-	{
-		.name		= "IR:Depth 26-bit (INZI)",
-		.guid		= UVC_GUID_FORMAT_INZI,
-		.fcc		= V4L2_PIX_FMT_INZI,
-	},
-	{
-		.name		= "4-bit Depth Confidence (Packed)",
-		.guid		= UVC_GUID_FORMAT_CNF4,
-		.fcc		= V4L2_PIX_FMT_CNF4,
-	},
-	{
-		.name		= "HEVC",
-		.guid		= UVC_GUID_FORMAT_HEVC,
-		.fcc		= V4L2_PIX_FMT_HEVC,
-	},
-};
-
 /* ------------------------------------------------------------------------
  * Utility functions
  */
@@ -240,19 +54,6 @@ struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
 	return NULL;
 }
 
-static struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
-{
-	unsigned int len = ARRAY_SIZE(uvc_fmts);
-	unsigned int i;
-
-	for (i = 0; i < len; ++i) {
-		if (memcmp(guid, uvc_fmts[i].guid, 16) == 0)
-			return &uvc_fmts[i];
-	}
-
-	return NULL;
-}
-
 static enum v4l2_colorspace uvc_colorspace(const u8 primaries)
 {
 	static const enum v4l2_colorspace colorprimaries[] = {
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a61cd0a459e88d..7ed229516dbbfb 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -41,141 +41,6 @@
 #define UVC_EXT_GPIO_UNIT		0x7ffe
 #define UVC_EXT_GPIO_UNIT_ID		0x100
 
-/* ------------------------------------------------------------------------
- * GUIDs
- */
-#define UVC_GUID_UVC_CAMERA \
-	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
-	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01}
-#define UVC_GUID_UVC_OUTPUT \
-	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
-	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02}
-#define UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT \
-	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
-	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03}
-#define UVC_GUID_UVC_PROCESSING \
-	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
-	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01}
-#define UVC_GUID_UVC_SELECTOR \
-	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
-	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02}
-#define UVC_GUID_EXT_GPIO_CONTROLLER \
-	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
-	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
-
-#define UVC_GUID_FORMAT_MJPEG \
-	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_YUY2 \
-	{ 'Y',  'U',  'Y',  '2', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_YUY2_ISIGHT \
-	{ 'Y',  'U',  'Y',  '2', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0x00, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_NV12 \
-	{ 'N',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_YV12 \
-	{ 'Y',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_I420 \
-	{ 'I',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_UYVY \
-	{ 'U',  'Y',  'V',  'Y', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Y800 \
-	{ 'Y',  '8',  '0',  '0', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Y8 \
-	{ 'Y',  '8',  ' ',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Y10 \
-	{ 'Y',  '1',  '0',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Y12 \
-	{ 'Y',  '1',  '2',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Y16 \
-	{ 'Y',  '1',  '6',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_BY8 \
-	{ 'B',  'Y',  '8',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_BA81 \
-	{ 'B',  'A',  '8',  '1', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_GBRG \
-	{ 'G',  'B',  'R',  'G', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_GRBG \
-	{ 'G',  'R',  'B',  'G', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_RGGB \
-	{ 'R',  'G',  'G',  'B', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_BG16 \
-	{ 'B',  'G',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_GB16 \
-	{ 'G',  'B',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_RG16 \
-	{ 'R',  'G',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_GR16 \
-	{ 'G',  'R',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_RGBP \
-	{ 'R',  'G',  'B',  'P', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_BGR3 \
-	{ 0x7d, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
-	 0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
-#define UVC_GUID_FORMAT_M420 \
-	{ 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-
-#define UVC_GUID_FORMAT_H264 \
-	{ 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Y8I \
-	{ 'Y',  '8',  'I',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Y12I \
-	{ 'Y',  '1',  '2',  'I', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_Z16 \
-	{ 'Z',  '1',  '6',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_RW10 \
-	{ 'R',  'W',  '1',  '0', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_INVZ \
-	{ 'I',  'N',  'V',  'Z', 0x90, 0x2d, 0x58, 0x4a, \
-	 0x92, 0x0b, 0x77, 0x3f, 0x1f, 0x2c, 0x55, 0x6b}
-#define UVC_GUID_FORMAT_INZI \
-	{ 'I',  'N',  'Z',  'I', 0x66, 0x1a, 0x42, 0xa2, \
-	 0x90, 0x65, 0xd0, 0x18, 0x14, 0xa8, 0xef, 0x8a}
-#define UVC_GUID_FORMAT_INVI \
-	{ 'I',  'N',  'V',  'I', 0xdb, 0x57, 0x49, 0x5e, \
-	 0x8e, 0x3f, 0xf4, 0x79, 0x53, 0x2b, 0x94, 0x6f}
-#define UVC_GUID_FORMAT_CNF4 \
-	{ 'C',  ' ',  ' ',  ' ', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-
-#define UVC_GUID_FORMAT_D3DFMT_L8 \
-	{0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-#define UVC_GUID_FORMAT_KSMEDIA_L8_IR \
-	{0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-
-#define UVC_GUID_FORMAT_HEVC \
-	{ 'H',  'E',  'V',  'C', 0x00, 0x00, 0x10, 0x00, \
-	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-
-
 /* ------------------------------------------------------------------------
  * Driver specific constants.
  */
@@ -280,12 +145,6 @@ struct uvc_control {
 	struct uvc_fh *handle;	/* File handle that last changed the control. */
 };
 
-struct uvc_format_desc {
-	char *name;
-	u8 guid[16];
-	u32 fcc;
-};
-
 /* The term 'entity' refers to both UVC units and UVC terminals.
  *
  * The type field is either the terminal type (wTerminalType in the terminal
diff --git a/include/media/v4l2-uvc.h b/include/media/v4l2-uvc.h
new file mode 100644
index 00000000000000..f1b21e1ec7a1a9
--- /dev/null
+++ b/include/media/v4l2-uvc.h
@@ -0,0 +1,351 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  v4l2 uvc internal API header
+ *
+ *  Some commonly needed functions for uvc drivers
+ */
+
+#ifndef __LINUX_V4L2_UVC_H
+#define __LINUX_V4L2_UVC_H
+
+/* ------------------------------------------------------------------------
+ * GUIDs
+ */
+#define UVC_GUID_UVC_CAMERA \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01}
+#define UVC_GUID_UVC_OUTPUT \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02}
+#define UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03}
+#define UVC_GUID_UVC_PROCESSING \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01}
+#define UVC_GUID_UVC_SELECTOR \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02}
+#define UVC_GUID_EXT_GPIO_CONTROLLER \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
+
+#define UVC_GUID_FORMAT_MJPEG \
+	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_YUY2 \
+	{ 'Y',  'U',  'Y',  '2', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_YUY2_ISIGHT \
+	{ 'Y',  'U',  'Y',  '2', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0x00, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_NV12 \
+	{ 'N',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_YV12 \
+	{ 'Y',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_I420 \
+	{ 'I',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_UYVY \
+	{ 'U',  'Y',  'V',  'Y', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y800 \
+	{ 'Y',  '8',  '0',  '0', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y8 \
+	{ 'Y',  '8',  ' ',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y10 \
+	{ 'Y',  '1',  '0',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y12 \
+	{ 'Y',  '1',  '2',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y16 \
+	{ 'Y',  '1',  '6',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_BY8 \
+	{ 'B',  'Y',  '8',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_BA81 \
+	{ 'B',  'A',  '8',  '1', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_GBRG \
+	{ 'G',  'B',  'R',  'G', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_GRBG \
+	{ 'G',  'R',  'B',  'G', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_RGGB \
+	{ 'R',  'G',  'G',  'B', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_BG16 \
+	{ 'B',  'G',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_GB16 \
+	{ 'G',  'B',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_RG16 \
+	{ 'R',  'G',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_GR16 \
+	{ 'G',  'R',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_RGBP \
+	{ 'R',  'G',  'B',  'P', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_BGR3 \
+	{ 0x7d, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
+	 0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
+#define UVC_GUID_FORMAT_M420 \
+	{ 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+
+#define UVC_GUID_FORMAT_H264 \
+	{ 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y8I \
+	{ 'Y',  '8',  'I',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y12I \
+	{ 'Y',  '1',  '2',  'I', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Z16 \
+	{ 'Z',  '1',  '6',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_RW10 \
+	{ 'R',  'W',  '1',  '0', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_INVZ \
+	{ 'I',  'N',  'V',  'Z', 0x90, 0x2d, 0x58, 0x4a, \
+	 0x92, 0x0b, 0x77, 0x3f, 0x1f, 0x2c, 0x55, 0x6b}
+#define UVC_GUID_FORMAT_INZI \
+	{ 'I',  'N',  'Z',  'I', 0x66, 0x1a, 0x42, 0xa2, \
+	 0x90, 0x65, 0xd0, 0x18, 0x14, 0xa8, 0xef, 0x8a}
+#define UVC_GUID_FORMAT_INVI \
+	{ 'I',  'N',  'V',  'I', 0xdb, 0x57, 0x49, 0x5e, \
+	 0x8e, 0x3f, 0xf4, 0x79, 0x53, 0x2b, 0x94, 0x6f}
+#define UVC_GUID_FORMAT_CNF4 \
+	{ 'C',  ' ',  ' ',  ' ', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+
+#define UVC_GUID_FORMAT_D3DFMT_L8 \
+	{0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_KSMEDIA_L8_IR \
+	{0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+
+#define UVC_GUID_FORMAT_HEVC \
+	{ 'H',  'E',  'V',  'C', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+
+/* ------------------------------------------------------------------------
+ * Video formats
+ */
+
+struct uvc_format_desc {
+	char *name;
+	u8 guid[16];
+	u32 fcc;
+};
+
+static struct uvc_format_desc uvc_fmts[] = {
+	{
+		.name		= "YUV 4:2:2 (YUYV)",
+		.guid		= UVC_GUID_FORMAT_YUY2,
+		.fcc		= V4L2_PIX_FMT_YUYV,
+	},
+	{
+		.name		= "YUV 4:2:2 (YUYV)",
+		.guid		= UVC_GUID_FORMAT_YUY2_ISIGHT,
+		.fcc		= V4L2_PIX_FMT_YUYV,
+	},
+	{
+		.name		= "YUV 4:2:0 (NV12)",
+		.guid		= UVC_GUID_FORMAT_NV12,
+		.fcc		= V4L2_PIX_FMT_NV12,
+	},
+	{
+		.name		= "MJPEG",
+		.guid		= UVC_GUID_FORMAT_MJPEG,
+		.fcc		= V4L2_PIX_FMT_MJPEG,
+	},
+	{
+		.name		= "YVU 4:2:0 (YV12)",
+		.guid		= UVC_GUID_FORMAT_YV12,
+		.fcc		= V4L2_PIX_FMT_YVU420,
+	},
+	{
+		.name		= "YUV 4:2:0 (I420)",
+		.guid		= UVC_GUID_FORMAT_I420,
+		.fcc		= V4L2_PIX_FMT_YUV420,
+	},
+	{
+		.name		= "YUV 4:2:0 (M420)",
+		.guid		= UVC_GUID_FORMAT_M420,
+		.fcc		= V4L2_PIX_FMT_M420,
+	},
+	{
+		.name		= "YUV 4:2:2 (UYVY)",
+		.guid		= UVC_GUID_FORMAT_UYVY,
+		.fcc		= V4L2_PIX_FMT_UYVY,
+	},
+	{
+		.name		= "Greyscale 8-bit (Y800)",
+		.guid		= UVC_GUID_FORMAT_Y800,
+		.fcc		= V4L2_PIX_FMT_GREY,
+	},
+	{
+		.name		= "Greyscale 8-bit (Y8  )",
+		.guid		= UVC_GUID_FORMAT_Y8,
+		.fcc		= V4L2_PIX_FMT_GREY,
+	},
+	{
+		.name		= "Greyscale 8-bit (D3DFMT_L8)",
+		.guid		= UVC_GUID_FORMAT_D3DFMT_L8,
+		.fcc		= V4L2_PIX_FMT_GREY,
+	},
+	{
+		.name		= "IR 8-bit (L8_IR)",
+		.guid		= UVC_GUID_FORMAT_KSMEDIA_L8_IR,
+		.fcc		= V4L2_PIX_FMT_GREY,
+	},
+	{
+		.name		= "Greyscale 10-bit (Y10 )",
+		.guid		= UVC_GUID_FORMAT_Y10,
+		.fcc		= V4L2_PIX_FMT_Y10,
+	},
+	{
+		.name		= "Greyscale 12-bit (Y12 )",
+		.guid		= UVC_GUID_FORMAT_Y12,
+		.fcc		= V4L2_PIX_FMT_Y12,
+	},
+	{
+		.name		= "Greyscale 16-bit (Y16 )",
+		.guid		= UVC_GUID_FORMAT_Y16,
+		.fcc		= V4L2_PIX_FMT_Y16,
+	},
+	{
+		.name		= "BGGR Bayer (BY8 )",
+		.guid		= UVC_GUID_FORMAT_BY8,
+		.fcc		= V4L2_PIX_FMT_SBGGR8,
+	},
+	{
+		.name		= "BGGR Bayer (BA81)",
+		.guid		= UVC_GUID_FORMAT_BA81,
+		.fcc		= V4L2_PIX_FMT_SBGGR8,
+	},
+	{
+		.name		= "GBRG Bayer (GBRG)",
+		.guid		= UVC_GUID_FORMAT_GBRG,
+		.fcc		= V4L2_PIX_FMT_SGBRG8,
+	},
+	{
+		.name		= "GRBG Bayer (GRBG)",
+		.guid		= UVC_GUID_FORMAT_GRBG,
+		.fcc		= V4L2_PIX_FMT_SGRBG8,
+	},
+	{
+		.name		= "RGGB Bayer (RGGB)",
+		.guid		= UVC_GUID_FORMAT_RGGB,
+		.fcc		= V4L2_PIX_FMT_SRGGB8,
+	},
+	{
+		.name		= "RGB565",
+		.guid		= UVC_GUID_FORMAT_RGBP,
+		.fcc		= V4L2_PIX_FMT_RGB565,
+	},
+	{
+		.name		= "BGR 8:8:8 (BGR3)",
+		.guid		= UVC_GUID_FORMAT_BGR3,
+		.fcc		= V4L2_PIX_FMT_BGR24,
+	},
+	{
+		.name		= "H.264",
+		.guid		= UVC_GUID_FORMAT_H264,
+		.fcc		= V4L2_PIX_FMT_H264,
+	},
+	{
+		.name		= "Greyscale 8 L/R (Y8I)",
+		.guid		= UVC_GUID_FORMAT_Y8I,
+		.fcc		= V4L2_PIX_FMT_Y8I,
+	},
+	{
+		.name		= "Greyscale 12 L/R (Y12I)",
+		.guid		= UVC_GUID_FORMAT_Y12I,
+		.fcc		= V4L2_PIX_FMT_Y12I,
+	},
+	{
+		.name		= "Depth data 16-bit (Z16)",
+		.guid		= UVC_GUID_FORMAT_Z16,
+		.fcc		= V4L2_PIX_FMT_Z16,
+	},
+	{
+		.name		= "Bayer 10-bit (SRGGB10P)",
+		.guid		= UVC_GUID_FORMAT_RW10,
+		.fcc		= V4L2_PIX_FMT_SRGGB10P,
+	},
+	{
+		.name		= "Bayer 16-bit (SBGGR16)",
+		.guid		= UVC_GUID_FORMAT_BG16,
+		.fcc		= V4L2_PIX_FMT_SBGGR16,
+	},
+	{
+		.name		= "Bayer 16-bit (SGBRG16)",
+		.guid		= UVC_GUID_FORMAT_GB16,
+		.fcc		= V4L2_PIX_FMT_SGBRG16,
+	},
+	{
+		.name		= "Bayer 16-bit (SRGGB16)",
+		.guid		= UVC_GUID_FORMAT_RG16,
+		.fcc		= V4L2_PIX_FMT_SRGGB16,
+	},
+	{
+		.name		= "Bayer 16-bit (SGRBG16)",
+		.guid		= UVC_GUID_FORMAT_GR16,
+		.fcc		= V4L2_PIX_FMT_SGRBG16,
+	},
+	{
+		.name		= "Depth data 16-bit (Z16)",
+		.guid		= UVC_GUID_FORMAT_INVZ,
+		.fcc		= V4L2_PIX_FMT_Z16,
+	},
+	{
+		.name		= "Greyscale 10-bit (Y10 )",
+		.guid		= UVC_GUID_FORMAT_INVI,
+		.fcc		= V4L2_PIX_FMT_Y10,
+	},
+	{
+		.name		= "IR:Depth 26-bit (INZI)",
+		.guid		= UVC_GUID_FORMAT_INZI,
+		.fcc		= V4L2_PIX_FMT_INZI,
+	},
+	{
+		.name		= "4-bit Depth Confidence (Packed)",
+		.guid		= UVC_GUID_FORMAT_CNF4,
+		.fcc		= V4L2_PIX_FMT_CNF4,
+	},
+	{
+		.name		= "HEVC",
+		.guid		= UVC_GUID_FORMAT_HEVC,
+		.fcc		= V4L2_PIX_FMT_HEVC,
+	},
+};
+
+static inline struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
+{
+	unsigned int len = ARRAY_SIZE(uvc_fmts);
+	unsigned int i;
+
+	for (i = 0; i < len; ++i) {
+		if (memcmp(guid, uvc_fmts[i].guid, 16) == 0)
+			return &uvc_fmts[i];
+	}
+
+	return NULL;
+}
+
+#endif /* __LINUX_V4L2_UVC_H */
-- 
2.30.2

