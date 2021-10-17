Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4ADC430C70
	for <lists+linux-usb@lfdr.de>; Sun, 17 Oct 2021 23:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344706AbhJQVwe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 17 Oct 2021 17:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344697AbhJQVwb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 17 Oct 2021 17:52:31 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAD91C06176C
        for <linux-usb@vger.kernel.org>; Sun, 17 Oct 2021 14:50:20 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mcE2s-00057d-TZ; Sun, 17 Oct 2021 23:50:18 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mcE2s-0004xG-AV; Sun, 17 Oct 2021 23:50:18 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: [PATCH v3 1/6] usb: gadget: uvc: consistently use define for headerlen
Date:   Sun, 17 Oct 2021 23:50:12 +0200
Message-Id: <20211017215017.18392-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017215017.18392-1-m.grzeschik@pengutronix.de>
References: <20211017215017.18392-1-m.grzeschik@pengutronix.de>
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

 drivers/usb/gadget/function/uvc_video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index b4a763e5f70e1..f3e97a4fc0303 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -33,7 +33,7 @@ uvc_video_encode_header(struct uvc_video *video, struct uvc_buffer *buf,
 	if (buf->bytesused - video->queue.buf_used <= len - UVCG_REQUEST_HEADER_LEN)
 		data[1] |= UVC_STREAM_EOF;
 
-	return 2;
+	return UVCG_REQUEST_HEADER_LEN;
 }
 
 static int
@@ -302,8 +302,8 @@ uvc_video_alloc_requests(struct uvc_video *video)
 		list_add_tail(&video->ureq[i].req->list, &video->req_free);
 		/* req_size/PAGE_SIZE + 1 for overruns and + 1 for header */
 		sg_alloc_table(&video->ureq[i].sgt,
-			       DIV_ROUND_UP(req_size - 2, PAGE_SIZE) + 2,
-			       GFP_KERNEL);
+			       DIV_ROUND_UP(req_size - UVCG_REQUEST_HEADER_LEN,
+					    PAGE_SIZE) + 2, GFP_KERNEL);
 	}
 
 	video->req_size = req_size;
-- 
2.30.2

