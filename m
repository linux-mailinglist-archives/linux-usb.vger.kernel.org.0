Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5894374C5
	for <lists+linux-usb@lfdr.de>; Fri, 22 Oct 2021 11:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbhJVJew (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Oct 2021 05:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232483AbhJVJeo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Oct 2021 05:34:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E63C061766
        for <linux-usb@vger.kernel.org>; Fri, 22 Oct 2021 02:32:27 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mdquX-0007Jl-OC; Fri, 22 Oct 2021 11:32:25 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mdquX-0006uR-6S; Fri, 22 Oct 2021 11:32:25 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de
Subject: [PATCH 1/2] usb: gadget: uvc: use on returned header len in video_encode_isoc_sg
Date:   Fri, 22 Oct 2021 11:32:22 +0200
Message-Id: <20211022093223.26493-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The function uvc_video_encode_header function returns the number of
bytes used for the header. We change the video_encode_isoc_sg function
to use the returned header_len rather than UVCG_REQUEST_HEADER_LEN and
make the encode function more flexible.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/uvc_video.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 7bc865eab27b3..2a9ab54bb3dc3 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -104,22 +104,22 @@ uvc_video_encode_isoc_sg(struct usb_request *req, struct uvc_video *video,
 	unsigned int len = video->req_size;
 	unsigned int sg_left, part = 0;
 	unsigned int i;
-	int ret;
+	int header_len;
 
 	sg = ureq->sgt.sgl;
 	sg_init_table(sg, ureq->sgt.nents);
 
 	/* Init the header. */
-	ret = uvc_video_encode_header(video, buf, ureq->header,
+	header_len = uvc_video_encode_header(video, buf, ureq->header,
 				      video->req_size);
-	sg_set_buf(sg, ureq->header, UVCG_REQUEST_HEADER_LEN);
-	len -= ret;
+	sg_set_buf(sg, ureq->header, header_len);
+	len -= header_len;
 
 	if (pending <= len)
 		len = pending;
 
 	req->length = (len == pending) ?
-		len + UVCG_REQUEST_HEADER_LEN : video->req_size;
+		len + header_len : video->req_size;
 
 	/* Init the pending sgs with payload */
 	sg = sg_next(sg);
@@ -148,7 +148,7 @@ uvc_video_encode_isoc_sg(struct usb_request *req, struct uvc_video *video,
 	req->num_sgs = i + 1;
 
 	req->length -= len;
-	video->queue.buf_used += req->length - UVCG_REQUEST_HEADER_LEN;
+	video->queue.buf_used += req->length - header_len;
 
 	if (buf->bytesused == video->queue.buf_used || !buf->sg) {
 		video->queue.buf_used = 0;
-- 
2.30.2

