Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBAE395333
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 00:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbhE3Wce (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 May 2021 18:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbhE3Wcd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 May 2021 18:32:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94CA7C06174A
        for <linux-usb@vger.kernel.org>; Sun, 30 May 2021 15:30:54 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lnTxM-000136-R4; Mon, 31 May 2021 00:30:52 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lnTxM-0004XQ-Fk; Mon, 31 May 2021 00:30:52 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        caleb.connolly@ideasonboard.com, paul.elder@ideasonboard.com,
        balbi@kernel.org, kernel@pengutronix.de
Subject: [PATCH v2 3/3] usb: gadget: uvc: decrease the interrupt load to a quarter
Date:   Mon, 31 May 2021 00:30:41 +0200
Message-Id: <20210530223041.15320-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210530223041.15320-1-m.grzeschik@pengutronix.de>
References: <20210530223041.15320-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With usb3 we handle much more requests. It only enables the interrupt on
every quarter of the allocated requests. This patch decreases the
interrupt load.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/uvc.h       |  2 ++
 drivers/usb/gadget/function/uvc_video.c | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index c1f06d9df5820..5a76e9351b530 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -101,6 +101,8 @@ struct uvc_video {
 	struct list_head req_free;
 	spinlock_t req_lock;
 
+	int req_int_count;
+
 	void (*encode) (struct usb_request *req, struct uvc_video *video,
 			struct uvc_buffer *buf);
 
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 240d361a45a44..66754687ce217 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -357,6 +357,16 @@ static void uvcg_video_pump(struct work_struct *work)
 
 		video->encode(req, video, buf);
 
+		if (list_empty(&video->req_free) ||
+		    (buf->state == UVC_BUF_STATE_DONE) ||
+		    (!(video->req_int_count %
+		       DIV_ROUND_UP(video->uvc_num_requests, 4)))) {
+			video->req_int_count = 0;
+			req->no_interrupt = 0;
+		} else {
+			req->no_interrupt = 1;
+		}
+
 		/* Queue the USB request */
 		ret = uvcg_video_ep_queue(video, req);
 		spin_unlock_irqrestore(&queue->irqlock, flags);
@@ -365,6 +375,7 @@ static void uvcg_video_pump(struct work_struct *work)
 			uvcg_queue_cancel(queue, 0);
 			break;
 		}
+		video->req_int_count++;
 	}
 
 	spin_lock_irqsave(&video->req_lock, flags);
@@ -437,6 +448,7 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	video->width = 320;
 	video->height = 240;
 	video->imagesize = 320 * 240 * 2;
+	video->req_int_count = 0;
 
 	/* Initialize the video buffers queue. */
 	uvcg_queue_init(uvc->v4l2_dev.dev, &video->queue, V4L2_BUF_TYPE_VIDEO_OUTPUT,
-- 
2.29.2

