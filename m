Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 204B7279F84
	for <lists+linux-usb@lfdr.de>; Sun, 27 Sep 2020 10:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730476AbgI0IK0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Sep 2020 04:10:26 -0400
Received: from mail5.windriver.com ([192.103.53.11]:59518 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727263AbgI0IK0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 27 Sep 2020 04:10:26 -0400
X-Greylist: delayed 453 seconds by postgrey-1.27 at vger.kernel.org; Sun, 27 Sep 2020 04:10:26 EDT
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
        by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08R81SIl029042
        (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
        Sun, 27 Sep 2020 01:01:39 -0700
Received: from pek-qzhang2-d1.wrs.com (128.224.162.183) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sun, 27 Sep 2020 01:01:17 -0700
From:   <qiang.zhang@windriver.com>
To:     <laurent.pinchart@ideasonboard.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: gadget: uvc: Fix the wrong v4l2_device_unregister call
Date:   Sun, 27 Sep 2020 16:01:16 +0800
Message-ID: <20200927080116.24763-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zqiang <qiang.zhang@windriver.com>

If an error occurred before calling the 'v4l2_device_register' func,
and then goto error, but no need to call 'v4l2_device_unregister'
func.

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 drivers/usb/gadget/function/f_uvc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 0b9712616455..44b4352a2676 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -740,20 +740,20 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 	/* Initialise video. */
 	ret = uvcg_video_init(&uvc->video, uvc);
 	if (ret < 0)
-		goto error;
+		goto v4l2_error;
 
 	/* Register a V4L2 device. */
 	ret = uvc_register_video(uvc);
 	if (ret < 0) {
 		uvcg_err(f, "failed to register video device\n");
-		goto error;
+		goto v4l2_error;
 	}
 
 	return 0;
 
-error:
+v4l2_error:
 	v4l2_device_unregister(&uvc->v4l2_dev);
-
+error:
 	if (uvc->control_req)
 		usb_ep_free_request(cdev->gadget->ep0, uvc->control_req);
 	kfree(uvc->control_buf);
-- 
2.17.1

