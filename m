Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A18D5F2EAE
	for <lists+linux-usb@lfdr.de>; Mon,  3 Oct 2022 12:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiJCKQn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Oct 2022 06:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiJCKQm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Oct 2022 06:16:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B422CE20
        for <linux-usb@vger.kernel.org>; Mon,  3 Oct 2022 03:16:40 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCD0B440;
        Mon,  3 Oct 2022 12:16:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664792197;
        bh=kmC8BNMznMK7bXklWmIHtSqUpJY+lR9xYFRDYIAlSiI=;
        h=From:To:Cc:Subject:Date:From;
        b=I4QCJxEtTNj4UGTbk983p/4rBaebfyndOVD0XjuT+DvTfMySMOm8KWQu4njDPVRzr
         oW3P3p5UpIJVYqHDfKUvQiu5+QVwBGoUkoDzk+ZG14e5arHpewnIXiAxu0g2Inz30r
         CXNLurziXwC06S1GYHjwzdQgBLD6buN5qC87T6bU=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, kieran@linuxembedded.co.uk,
        balbi@kernel.org, gregkh@linuxfoundation.org, mgr@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH] uvc: gadget: uvc: Defer uvcg_complete_buffer() until .complete()
Date:   Mon,  3 Oct 2022 11:16:27 +0100
Message-Id: <20221003101627.144026-1-dan.scally@ideasonboard.com>
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

Calling uvcg_complete_buffer() from uvc_video_encode_isoc() sometimes
causes the final isoc packet for a video frame to be delayed long
enough to cause the USB controller to drop it. The first isoc packet
of the next video frame is then received by the host, which interprets
the toggled FID bit correctly such that the stream continues without
interruption, but the first frame will be missing the last isoc
packet's worth of bytes.

To fix the issue delay the call to uvcg_complete_buffer() until the
usb_request's .complete() callback, as already happens when the data
is encoded via uvc_video_encode_isoc_sg().

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/usb/gadget/function/uvc_video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index c00ce0e91f5d..041819a655ed 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -194,6 +194,7 @@ static void
 uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
 		struct uvc_buffer *buf)
 {
+	struct uvc_request *ureq = req->context;
 	void *mem = req->buf;
 	int len = video->req_size;
 	int ret;
@@ -213,7 +214,7 @@ uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
 		video->queue.buf_used = 0;
 		buf->state = UVC_BUF_STATE_DONE;
 		list_del(&buf->queue);
-		uvcg_complete_buffer(&video->queue, buf);
+		ureq->last_buf = buf;
 		video->fid ^= UVC_STREAM_FID;
 	}
 }
-- 
2.34.1

