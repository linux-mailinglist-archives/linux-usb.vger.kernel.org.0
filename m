Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 886C860D70D
	for <lists+linux-usb@lfdr.de>; Wed, 26 Oct 2022 00:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbiJYW1b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Oct 2022 18:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbiJYW1J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Oct 2022 18:27:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713626E2C1
        for <linux-usb@vger.kernel.org>; Tue, 25 Oct 2022 15:27:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1onSNv-0005ne-Nz; Wed, 26 Oct 2022 00:26:59 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1onSNv-000OKo-Fo; Wed, 26 Oct 2022 00:26:58 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1onSNt-007u71-Vw; Wed, 26 Oct 2022 00:26:57 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: [PATCH v5] usb: gadget: uvc: add validate and fix function for uvc response
Date:   Wed, 26 Oct 2022 00:26:57 +0200
Message-Id: <20221025222657.1883922-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the userspace gets the setup requests for UVC_GET_CUR UVC_GET_MIN,
UVC_GET_MAX, UVC_GET_DEF it will fill out the ctrl response. This data
needs to be validated. Since the kernel also knows the limits for valid
cases, it can fixup the values in case the userspace is setting invalid
data.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1: -> v4:
- new patch
v4: -> v5:
- changed uvcg_info to uvcg_dbg for fixups, updated info strings

 drivers/usb/gadget/function/f_uvc.c    |  4 +-
 drivers/usb/gadget/function/uvc.h      |  1 +
 drivers/usb/gadget/function/uvc_v4l2.c | 76 ++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 6e131624011a5e..098bd3c4e3c0b3 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -254,8 +254,10 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	 */
 	mctrl = &uvc_event->req;
 	mctrl->wIndex &= ~cpu_to_le16(0xff);
-	if (interface == uvc->streaming_intf)
+	if (interface == uvc->streaming_intf) {
+		uvc->streaming_request = ctrl->bRequest;
 		mctrl->wIndex = cpu_to_le16(UVC_STRING_STREAMING_IDX);
+	}
 
 	v4l2_event_queue(&uvc->vdev, &v4l2_event);
 
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 40226b1f7e148a..1be4d5f24b46bf 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -151,6 +151,7 @@ struct uvc_device {
 	void *control_buf;
 
 	unsigned int streaming_intf;
+	unsigned char streaming_request;
 
 	/* Events */
 	unsigned int event_length;
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index c4ed48d6b8a407..d5bb3038626267 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -178,6 +178,67 @@ static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
  * Requests handling
  */
 
+/* validate and fixup streaming ctrl request response data if possible */
+static void
+uvc_validate_streaming_ctrl(struct uvc_device *uvc,
+			    struct uvc_streaming_control *ctrl)
+{
+	struct f_uvc_opts *opts = fi_to_f_uvc_opts(uvc->func.fi);
+	unsigned int iformat, iframe;
+	struct uvcg_format *uformat;
+	struct uvcg_frame *uframe;
+	bool ival_found = false;
+	int i;
+
+	iformat = ctrl->bFormatIndex;
+	iframe = ctrl->bFrameIndex;
+
+	/* Restrict the iformat, iframe and dwFrameInterval to valid values.
+	 * Negative values for iformat and iframe will result in the maximum
+	 * valid value being selected
+	 */
+	iformat = clamp((unsigned int)iformat, 1U,
+			(unsigned int)uvc->header->num_fmt);
+	if (iformat != ctrl->bFormatIndex) {
+		uvcg_dbg(&uvc->func,
+			  "userspace set invalid format index - fixup\n");
+		ctrl->bFormatIndex = iformat;
+	}
+	uformat = find_format_by_index(uvc, iformat);
+
+	iframe = clamp((unsigned int)iframe, 1U,
+		       (unsigned int)uformat->num_frames);
+	if (iframe != ctrl->bFrameIndex) {
+		uvcg_dbg(&uvc->func,
+			  "userspace set invalid frame index - fixup\n");
+		ctrl->bFrameIndex = iframe;
+	}
+	uframe = find_frame_by_index(uvc, uformat, iframe);
+
+	if (ctrl->dwFrameInterval) {
+		for (i = 0; i < uframe->frame.b_frame_interval_type; i++) {
+			if (ctrl->dwFrameInterval ==
+				 uframe->dw_frame_interval[i])
+				ival_found = true;
+		}
+	}
+	if (!ival_found) {
+		uvcg_dbg(&uvc->func,
+			  "userspace set invalid frame interval - fixup\n");
+		ctrl->dwFrameInterval = uframe->frame.dw_default_frame_interval;
+	}
+
+	if (!ctrl->dwMaxPayloadTransferSize ||
+			ctrl->dwMaxPayloadTransferSize >
+				opts->streaming_maxpacket)
+		ctrl->dwMaxPayloadTransferSize = opts->streaming_maxpacket;
+
+	if (!ctrl->dwMaxVideoFrameSize ||
+			ctrl->dwMaxVideoFrameSize >
+				uframe->frame.dw_max_video_frame_buffer_size)
+		ctrl->dwMaxVideoFrameSize = uvc_get_frame_size(uformat, uframe);
+}
+
 static int
 uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
 {
@@ -192,6 +253,21 @@ uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
 
 	memcpy(req->buf, data->data, req->length);
 
+	/* validate the ctrl content and fixup */
+	if (!uvc->event_setup_out) {
+		struct uvc_streaming_control *ctrl = req->buf;
+
+		switch (uvc->streaming_request) {
+		case UVC_GET_CUR:
+		case UVC_GET_MIN:
+		case UVC_GET_MAX:
+		case UVC_GET_DEF:
+			uvc_validate_streaming_ctrl(uvc, ctrl);
+		default:
+			break;
+		}
+	}
+
 	return usb_ep_queue(cdev->gadget->ep0, req, GFP_KERNEL);
 }
 
-- 
2.30.2

