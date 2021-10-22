Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5BA74374C4
	for <lists+linux-usb@lfdr.de>; Fri, 22 Oct 2021 11:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbhJVJeu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Oct 2021 05:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232385AbhJVJeo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Oct 2021 05:34:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A25C061764
        for <linux-usb@vger.kernel.org>; Fri, 22 Oct 2021 02:32:27 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mdquX-0007Jm-OD; Fri, 22 Oct 2021 11:32:25 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mdquX-0006uT-6w; Fri, 22 Oct 2021 11:32:25 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: [PATCH 2/2] usb: gadget: uvc: implement dwPresentationTime and scrSourceClock
Date:   Fri, 22 Oct 2021 11:32:23 +0200
Message-Id: <20211022093223.26493-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211022093223.26493-1-m.grzeschik@pengutronix.de>
References: <20211022093223.26493-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Michael Olbrich <m.olbrich@pengutronix.de>

This patch adds the fields UVC_STREAM_PTS and UVC_STREAM_SCR to the uvc
header, in case this data is available. It also enables the copy of the
timestamp to the vb2_v4l2_buffer by setting V4L2_BUF_FLAG_TIMESTAMP_COPY
in the queue.timestamp_flags.

Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
 drivers/usb/gadget/function/uvc.h       |  2 +-
 drivers/usb/gadget/function/uvc_queue.c |  2 +-
 drivers/usb/gadget/function/uvc_video.c | 35 ++++++++++++++++++++++---
 3 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index b05de36e2c605..c3607a32b9862 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -68,7 +68,7 @@ extern unsigned int uvc_gadget_trace_param;
 #define UVC_MAX_REQUEST_SIZE			64
 #define UVC_MAX_EVENTS				4
 
-#define UVCG_REQUEST_HEADER_LEN			2
+#define UVCG_REQUEST_HEADER_LEN			12
 
 /* ------------------------------------------------------------------------
  * Structures
diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index 7d00ad7c154c2..d852ac9e47e72 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -142,7 +142,7 @@ int uvcg_queue_init(struct uvc_video_queue *queue, struct device *dev, enum v4l2
 		queue->queue.mem_ops = &vb2_vmalloc_memops;
 	}
 
-	queue->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC
+	queue->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY
 				     | V4L2_BUF_FLAG_TSTAMP_SRC_EOF;
 	queue->queue.dev = dev;
 
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 2a9ab54bb3dc3..7f59a0c474020 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -12,6 +12,7 @@
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 #include <linux/usb/video.h>
+#include <asm/unaligned.h>
 
 #include <media/v4l2-dev.h>
 
@@ -27,13 +28,41 @@ static int
 uvc_video_encode_header(struct uvc_video *video, struct uvc_buffer *buf,
 		u8 *data, int len)
 {
-	data[0] = UVCG_REQUEST_HEADER_LEN;
+	struct uvc_device *uvc = container_of(video, struct uvc_device, video);
+	struct usb_composite_dev *cdev = uvc->func.config->cdev;
+	struct timespec64 ts = ns_to_timespec64(buf->buf.vb2_buf.timestamp);
+	int pos = 2;
+
 	data[1] = UVC_STREAM_EOH | video->fid;
 
-	if (buf->bytesused - video->queue.buf_used <= len - UVCG_REQUEST_HEADER_LEN)
+	if (video->queue.buf_used == 0 && ts.tv_sec) {
+		/* dwClockFrequency is 48 MHz */
+		u32 pts = ((u64)ts.tv_sec * USEC_PER_SEC + ts.tv_nsec / NSEC_PER_USEC) * 48;
+
+		data[1] |= UVC_STREAM_PTS;
+		put_unaligned_le32(pts, &data[pos]);
+		pos += 4;
+	}
+
+	if (cdev->gadget->ops->get_frame) {
+		u32 sof, stc;
+
+		sof = usb_gadget_frame_number(cdev->gadget);
+		ktime_get_ts64(&ts);
+		stc = ((u64)ts.tv_sec * USEC_PER_SEC + ts.tv_nsec / NSEC_PER_USEC) * 48;
+
+		data[1] |= UVC_STREAM_SCR;
+		put_unaligned_le32(stc, &data[pos]);
+		put_unaligned_le16(sof, &data[pos+4]);
+		pos += 6;
+	}
+
+	data[0] = pos;
+
+	if (buf->bytesused - video->queue.buf_used <= len - pos)
 		data[1] |= UVC_STREAM_EOF;
 
-	return UVCG_REQUEST_HEADER_LEN;
+	return pos;
 }
 
 static int
-- 
2.30.2

