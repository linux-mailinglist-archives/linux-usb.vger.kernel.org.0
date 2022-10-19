Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A394D60463F
	for <lists+linux-usb@lfdr.de>; Wed, 19 Oct 2022 15:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbiJSNDd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Oct 2022 09:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbiJSNDN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Oct 2022 09:03:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B9452E42
        for <linux-usb@vger.kernel.org>; Wed, 19 Oct 2022 05:46:41 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 843A55A4;
        Wed, 19 Oct 2022 14:45:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1666183553;
        bh=nxwhu/v9pAWfd1rklhtIdD//swgauSxiKDEGujblnyw=;
        h=From:To:Cc:Subject:Date:From;
        b=h2FHC3yvGyfmDJ/maNKTlkIDUoOZGr5F9+ii+0Y18/NOlHQetZKllgHUammf+Ay3d
         1g7UxyBuArmf2cQnyswBHwkNVUW4UTvi0X7GYwplTDccZnC8o061Wk38l4h7GfWsTr
         0G8HMUke18jC5aYSizWscvis23krxSEbWzxi+3Ic=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, kieran@linuxembedded.co.uk,
        balbi@kernel.org, gregkh@linuxfoundation.org, mgr@pengutronix.de,
        w36195@motorola.com, Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2] uvc: gadget: uvc: Defer uvcg_complete_buffer() until .complete()
Date:   Wed, 19 Oct 2022 13:45:35 +0100
Message-Id: <20221019124535.2712902-1-dan.scally@ideasonboard.com>
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
is encoded via uvc_video_encode_isoc_sg(). For consistency's sake the
same change is applied to uvc_video_encode_bulk().

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---

Changes in v2:

	- Applied the same change to uvc_video_encode_bulk() for consistency

@Dan - In the end I thought this is probably worth separating from your "usb:
gadget: uvc: fix sg handling in error case" patch, since it fixes a separate
issue by itself. I _think_ they're separable but I wasn't experiencing the
problem you were so I can't test that - let me know if I'm wrong.

@Michael - I dropped your R-b since I made the change to uvc_video_encode_bulk()
too, didn't want to jump the gun :)

 drivers/usb/gadget/function/uvc_video.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index c00ce0e91f5d..42bd4dd1d4a9 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -87,6 +87,7 @@ static void
 uvc_video_encode_bulk(struct usb_request *req, struct uvc_video *video,
 		struct uvc_buffer *buf)
 {
+	struct uvc_request *ureq = req->context;
 	void *mem = req->buf;
 	int len = video->req_size;
 	int ret;
@@ -113,7 +114,7 @@ uvc_video_encode_bulk(struct usb_request *req, struct uvc_video *video,
 		video->queue.buf_used = 0;
 		buf->state = UVC_BUF_STATE_DONE;
 		list_del(&buf->queue);
-		uvcg_complete_buffer(&video->queue, buf);
+		ureq->last_buf = buf;
 		video->fid ^= UVC_STREAM_FID;
 
 		video->payload_size = 0;
@@ -194,6 +195,7 @@ static void
 uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
 		struct uvc_buffer *buf)
 {
+	struct uvc_request *ureq = req->context;
 	void *mem = req->buf;
 	int len = video->req_size;
 	int ret;
@@ -213,7 +215,7 @@ uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
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

