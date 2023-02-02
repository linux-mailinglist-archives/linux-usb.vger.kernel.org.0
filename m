Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81E2B687F5C
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 14:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbjBBNzy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 08:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbjBBNzy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 08:55:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90E18C1DE
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 05:55:49 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E77A6505;
        Thu,  2 Feb 2023 14:55:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675346127;
        bh=5Gk1LAEahm4E/tXuzlVT4IxLwmyax3/PXhPlOfFzL38=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z9AQmnY7mWpHHTrwhjdnGED76OhxPjA2J21HQfL5r89t0QVzB5j+h6nVA41v9Xqk4
         pFA2ULUspdkDkVXVoJ/harUh+/5JiBkLSLFTVewOMX/akXED0Doyvwc1aIPg1vv3Fw
         voyBl+7q+odc7lwKvKEVdtDtL7Pg53x73sAWqH7k=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v4 11/11] usb: gadget: uvc: Use custom strings if available
Date:   Thu,  2 Feb 2023 13:55:08 +0000
Message-Id: <20230202135508.447109-12-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202135508.447109-1-dan.scally@ideasonboard.com>
References: <20230202135508.447109-1-dan.scally@ideasonboard.com>
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

If the user has defined a custom string descriptor for the IAD or the
VideoStreaming interfaces then set their index field to point to the
custom descriptor instead of the hardcoded defaults. If no custom
descriptors have been linked to, then use the default ones.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v4:

	- None

Changes in v3:

	- Dropped the VideoControl description since there's an attribute for
	that now

Changes in v2:

	- New patch

 drivers/usb/gadget/function/f_uvc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 14e1aed52124..71953c731d30 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -745,6 +745,10 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 		if (xu->string_descriptor_index)
 			xu->desc.iExtension = cdev->usb_strings[xu->string_descriptor_index].id;
 
+	/*
+	 * We attach the hard-coded defaults incase the user does not provide
+	 * any more appropriate strings through configfs.
+	 */
 	uvc_en_us_strings[UVC_STRING_CONTROL_IDX].s = opts->function_name;
 	us = usb_gstrings_attach(cdev, uvc_function_strings,
 				 ARRAY_SIZE(uvc_en_us_strings));
@@ -752,11 +756,15 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 		ret = PTR_ERR(us);
 		goto error;
 	}
-	uvc_iad.iFunction = us[UVC_STRING_CONTROL_IDX].id;
-	uvc_control_intf.iInterface = us[UVC_STRING_CONTROL_IDX].id;
-	ret = us[UVC_STRING_STREAMING_IDX].id;
-	uvc_streaming_intf_alt0.iInterface = ret;
-	uvc_streaming_intf_alt1.iInterface = ret;
+
+	uvc_iad.iFunction = opts->iad_index ? cdev->usb_strings[opts->iad_index].id :
+			    us[UVC_STRING_CONTROL_IDX].id;
+	uvc_streaming_intf_alt0.iInterface = opts->vs0_index ?
+					     cdev->usb_strings[opts->vs0_index].id :
+					     us[UVC_STRING_STREAMING_IDX].id;
+	uvc_streaming_intf_alt1.iInterface = opts->vs1_index ?
+					     cdev->usb_strings[opts->vs1_index].id :
+					     us[UVC_STRING_STREAMING_IDX].id;
 
 	/* Allocate interface IDs. */
 	if ((ret = usb_interface_id(c, f)) < 0)
-- 
2.34.1

