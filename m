Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCBB3B5A57
	for <lists+linux-usb@lfdr.de>; Mon, 28 Jun 2021 10:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232333AbhF1ISn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Jun 2021 04:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232103AbhF1ISk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Jun 2021 04:18:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A2CC061766
        for <linux-usb@vger.kernel.org>; Mon, 28 Jun 2021 01:16:15 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lxmRB-0006TK-IT; Mon, 28 Jun 2021 10:16:13 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lxmRB-0004Dj-4L; Mon, 28 Jun 2021 10:16:13 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, caleb.connolly@ideasonboard.com,
        paul.elder@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v2 5/5] usb: gadget: uvc: decrease the interrupt load to a quarter
Date:   Mon, 28 Jun 2021 10:16:00 +0200
Message-Id: <20210628081600.14525-6-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210628081600.14525-1-m.grzeschik@pengutronix.de>
References: <20210628081600.14525-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With usb3 we handle many more requests. Decrease the interrupt load by
only enabling the interrupt every quarter of the allocated requests.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

--
v1 -> v2:
    - edited patch description
    - removed extra parantheses
    - added a comment for the logic
    - using unsigned int instead of int
    - reinitializing req_int_count in uvcg_video_enable

---
 drivers/usb/gadget/function/uvc.h       |  2 ++
 drivers/usb/gadget/function/uvc_video.c | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 36b78f8b3cd4c..255a61bd6a6a8 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -101,6 +101,8 @@ struct uvc_video {
 	struct list_head req_free;
 	spinlock_t req_lock;
 
+	unsigned int req_int_count;
+
 	void (*encode) (struct usb_request *req, struct uvc_video *video,
 			struct uvc_buffer *buf);
 
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 9910c2dc6168f..a1eec38280425 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -362,6 +362,19 @@ static void uvcg_video_pump(struct work_struct *work)
 
 		video->encode(req, video, buf);
 
+		/* With usb3 we have more requests. This will decrease the
+		 * interrupt load to a quarter but also catches the corner
+		 * cases, which needs to be handled */
+		if (list_empty(&video->req_free) ||
+		    buf->state == UVC_BUF_STATE_DONE ||
+		    !(video->req_int_count %
+		       DIV_ROUND_UP(video->uvc_num_requests, 4))) {
+			video->req_int_count = 0;
+			req->no_interrupt = 0;
+		} else {
+			req->no_interrupt = 1;
+		}
+
 		/* Queue the USB request */
 		ret = uvcg_video_ep_queue(video, req);
 		spin_unlock_irqrestore(&queue->irqlock, flags);
@@ -370,6 +383,7 @@ static void uvcg_video_pump(struct work_struct *work)
 			uvcg_queue_cancel(queue, 0);
 			break;
 		}
+		video->req_int_count++;
 	}
 
 	spin_lock_irqsave(&video->req_lock, flags);
@@ -418,6 +432,8 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 		video->encode = video->queue.use_sg ?
 			uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
 
+	video->req_int_count = 0;
+
 	schedule_work(&video->pump);
 
 	return ret;
-- 
2.30.2

