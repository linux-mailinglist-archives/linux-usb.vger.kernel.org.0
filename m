Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7694C631CD1
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 10:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbiKUJZz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 04:25:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbiKUJZx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 04:25:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C4629375
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 01:25:50 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0294987;
        Mon, 21 Nov 2022 10:25:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669022741;
        bh=I9+HvzKpiTZp4KSPl/FkgoMqAqvRpV91iNhWp7eoreA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hnH0PkRrDwAx96qoLjmt8kra4Er17VTRvHz0gjX+PPIhGTgwFjCpjzC4j/9bAQxqc
         uBbGQsRRW03GwrShIAsZ9Nu5LWdV0MElpJL1W7HpLE8dSg8gmSDCDj5GceVndwYr1p
         Rjz/GNh9xlFNnC6nu9RvQTcaFQy+hN1+kwoZSBkk=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 9/9] usb: gadget: uvc: Use custom strings if available
Date:   Mon, 21 Nov 2022 09:25:17 +0000
Message-Id: <20221121092517.225242-10-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221121092517.225242-1-dan.scally@ideasonboard.com>
References: <20221121092517.225242-1-dan.scally@ideasonboard.com>
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
VideoControl or VideoStreaming interfaces then set their index field
to point to the custom descriptor instead of the hardcoded defaults.
If no custom descriptors have been linked to, then use the default
ones.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2:

	- New patch

 drivers/usb/gadget/function/f_uvc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 7821fe8f9120..ac6df8458cab 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -784,6 +784,10 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 	list_for_each_entry(xu, &opts->extension_units, list)
 		xu->desc.iExtension = cus[xu->string_descriptor_index].id;
 
+	/*
+	 * We attach the hard-coded defaults incase the user does not provide
+	 * any more appropriate strings through configfs.
+	 */
 	uvc_en_us_strings[UVC_STRING_CONTROL_IDX].s = opts->function_name;
 	us = usb_gstrings_attach(cdev, uvc_function_strings,
 				 ARRAY_SIZE(uvc_en_us_strings));
@@ -791,11 +795,15 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 		ret = PTR_ERR(us);
 		goto error;
 	}
-	uvc_iad.iFunction = us[UVC_STRING_CONTROL_IDX].id;
-	uvc_control_intf.iInterface = us[UVC_STRING_CONTROL_IDX].id;
-	ret = us[UVC_STRING_STREAMING_IDX].id;
-	uvc_streaming_intf_alt0.iInterface = ret;
-	uvc_streaming_intf_alt1.iInterface = ret;
+
+	uvc_iad.iFunction = opts->iad_index ? cus[opts->iad_index].id :
+			    us[UVC_STRING_CONTROL_IDX].id;
+	uvc_control_intf.iInterface = opts->iad_index ? cus[opts->iad_index].id :
+				      us[UVC_STRING_CONTROL_IDX].id;
+	uvc_streaming_intf_alt0.iInterface = opts->vs0_index ? cus[opts->vs0_index].id :
+					     us[UVC_STRING_STREAMING_IDX].id;
+	uvc_streaming_intf_alt1.iInterface = opts->vs1_index ? cus[opts->vs1_index].id :
+					     us[UVC_STRING_STREAMING_IDX].id;
 
 	/* Allocate interface IDs. */
 	if ((ret = usb_interface_id(c, f)) < 0)
-- 
2.34.1

