Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53683430D00
	for <lists+linux-usb@lfdr.de>; Mon, 18 Oct 2021 02:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344815AbhJRAN4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 17 Oct 2021 20:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232246AbhJRANz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 17 Oct 2021 20:13:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62131C06161C
        for <linux-usb@vger.kernel.org>; Sun, 17 Oct 2021 17:11:45 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mcGFi-0000ag-TO; Mon, 18 Oct 2021 02:11:42 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mcGFi-0007uI-Gc; Mon, 18 Oct 2021 02:11:42 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de
Subject: [PATCH] usb: gadget: uvc: consistently use define for headerlen
Date:   Mon, 18 Oct 2021 02:11:39 +0200
Message-Id: <20211018001139.29284-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017215017.18392-2-m.grzeschik@pengutronix.de>
References: <20211017215017.18392-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The uvc request headerlen of 2 was defined as UVCG_REQUEST_HEADER_LEN
in commit e81e7f9a0eb9 ("usb: gadget: uvc: add scatter gather support").
We missed to use it consistently. This patch fixes that.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v3: - fixed wrong use of define
    - added missing use of define in uvc_video_encode_header
v4: - fixed headersize in struct uvc_request to also use the define

 drivers/usb/gadget/function/uvc.h       | 4 +++-
 drivers/usb/gadget/function/uvc_video.c | 6 +++---
 drivers/usb/gadget/function/uvc_video.h | 2 --
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 9d5f17b551bbd..c3607a32b9862 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -68,6 +68,8 @@ extern unsigned int uvc_gadget_trace_param;
 #define UVC_MAX_REQUEST_SIZE			64
 #define UVC_MAX_EVENTS				4
 
+#define UVCG_REQUEST_HEADER_LEN			2
+
 /* ------------------------------------------------------------------------
  * Structures
  */
@@ -76,7 +78,7 @@ struct uvc_request {
 	u8 *req_buffer;
 	struct uvc_video *video;
 	struct sg_table sgt;
-	u8 header[2];
+	u8 header[UVCG_REQUEST_HEADER_LEN];
 };
 
 struct uvc_video {
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 1bfca3cb42f9b..7bc865eab27b3 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -33,7 +33,7 @@ uvc_video_encode_header(struct uvc_video *video, struct uvc_buffer *buf,
 	if (buf->bytesused - video->queue.buf_used <= len - UVCG_REQUEST_HEADER_LEN)
 		data[1] |= UVC_STREAM_EOF;
 
-	return 2;
+	return UVCG_REQUEST_HEADER_LEN;
 }
 
 static int
@@ -307,8 +307,8 @@ uvc_video_alloc_requests(struct uvc_video *video)
 		list_add_tail(&video->ureq[i].req->list, &video->req_free);
 		/* req_size/PAGE_SIZE + 1 for overruns and + 1 for header */
 		sg_alloc_table(&video->ureq[i].sgt,
-			       DIV_ROUND_UP(req_size - 2, PAGE_SIZE) + 2,
-			       GFP_KERNEL);
+			       DIV_ROUND_UP(req_size - UVCG_REQUEST_HEADER_LEN,
+					    PAGE_SIZE) + 2, GFP_KERNEL);
 	}
 
 	video->req_size = req_size;
diff --git a/drivers/usb/gadget/function/uvc_video.h b/drivers/usb/gadget/function/uvc_video.h
index 9bf19475f6f9a..03adeefa343b7 100644
--- a/drivers/usb/gadget/function/uvc_video.h
+++ b/drivers/usb/gadget/function/uvc_video.h
@@ -12,8 +12,6 @@
 #ifndef __UVC_VIDEO_H__
 #define __UVC_VIDEO_H__
 
-#define UVCG_REQUEST_HEADER_LEN			2
-
 struct uvc_video;
 
 int uvcg_video_enable(struct uvc_video *video, int enable);
-- 
2.30.2

