Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B06F68C30A
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 17:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjBFQUv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 11:20:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231607AbjBFQUk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 11:20:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C3F40C5
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 08:20:24 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25475F8D;
        Mon,  6 Feb 2023 17:18:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675700309;
        bh=7I8hBVCeYlzcCeqyF5okLckvrOF/PGBL4ADvF+Wn8XQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OA9TjstfLg08Fn9IV2ACXIN9DpqhvoqXZcyWwFvJ2Cd4tJhlPsdTgwtTt/6xaISr+
         U/+puUAQYLV36eLovM3GSD82r0foEXCgfb+L4ZKUovWoZbt+CIItH9njK/OFg6kYPe
         lVwWkgyybMsn0VFkMzcvB++hB3jk5iCYwiIs/FNo=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v5 09/11] usb: gadget: uvc: Pick up custom string descriptor IDs
Date:   Mon,  6 Feb 2023 16:18:00 +0000
Message-Id: <20230206161802.892954-10-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206161802.892954-1-dan.scally@ideasonboard.com>
References: <20230206161802.892954-1-dan.scally@ideasonboard.com>
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

If any custom string descriptors have been linked to from the
extension unit, pick up the string ID that was returned when
the strings were attached to the composite dev and use it to
set the iExtension field of the Extension Unit Descriptor.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v5:

	- None

Changes in v4:

	- None

Changes in v3:

	- New patch

 drivers/usb/gadget/function/f_uvc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index f6fd5decdcb7..7588ab21f952 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -644,6 +644,7 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 {
 	struct usb_composite_dev *cdev = c->cdev;
 	struct uvc_device *uvc = to_uvc(f);
+	struct uvcg_extension *xu;
 	struct usb_string *us;
 	unsigned int max_packet_mult;
 	unsigned int max_packet_size;
@@ -736,6 +737,14 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 	uvc_hs_streaming_ep.bEndpointAddress = uvc->video.ep->address;
 	uvc_ss_streaming_ep.bEndpointAddress = uvc->video.ep->address;
 
+	/*
+	 * XUs can have an arbitrary string descriptor describing them. If they
+	 * have one pick up the ID.
+	 */
+	list_for_each_entry(xu, &opts->extension_units, list)
+		if (xu->string_descriptor_index)
+			xu->desc.iExtension = cdev->usb_strings[xu->string_descriptor_index].id;
+
 	uvc_en_us_strings[UVC_STRING_CONTROL_IDX].s = opts->function_name;
 	us = usb_gstrings_attach(cdev, uvc_function_strings,
 				 ARRAY_SIZE(uvc_en_us_strings));
-- 
2.34.1

