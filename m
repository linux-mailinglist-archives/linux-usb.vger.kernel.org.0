Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6C0631CCF
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 10:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbiKUJZu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 04:25:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbiKUJZt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 04:25:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035C58F3C2
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 01:25:47 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6506A1929;
        Mon, 21 Nov 2022 10:25:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669022739;
        bh=QiqTDLml8o8JhNkflKyyqaqrHzrPjH/a0fzolPjCV0s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F1fBogi6GpWd/IRiJv6BtnugcNJZDf6saUxTIWnxXbuLxVKjqKjyX93nFmod5yxJr
         +QsVkvU9Jk9rWuSFIWM1V440DBN96gRT3dZuwGK56Sis7M1E0t6QCBPmwTmPLFKGJH
         oTtqY/OymfYZausT5xygWTTPDuXv4JzwVbvAD+o4=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 7/9] usb: gadget: uvc: Attach custom string descriptors
Date:   Mon, 21 Nov 2022 09:25:15 +0000
Message-Id: <20221121092517.225242-8-dan.scally@ideasonboard.com>
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

Now that we have support for arbitrary string descriptors we need to
attach them during uvc_function_bind(). Set the iExtension field of
any Extension Units after the strings have attached.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2:

	- New patch

 drivers/usb/gadget/function/f_uvc.c | 71 ++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 1b8871a24be8..7821fe8f9120 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -622,12 +622,72 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	return hdr;
 }
 
+static struct usb_string *
+uvc_function_attach_usb_strings(struct usb_composite_dev *cdev, struct usb_function *f)
+{
+	struct f_uvc_opts *opts = fi_to_f_uvc_opts(f->fi);
+	struct usb_gadget_strings **gadget_strings;
+	struct uvcg_language *language;
+	struct uvcg_string *string;
+	struct usb_string *us;
+	unsigned int i = 0;
+	int nstrings = -1;
+	unsigned int j;
+
+	gadget_strings = kcalloc(opts->nlangs + 1, /* including NULL terminator */
+				 sizeof(struct usb_gadget_strings *), GFP_KERNEL);
+	if (!gadget_strings)
+		return ERR_PTR(-ENOMEM);
+
+	list_for_each_entry(language, &opts->languages, list) {
+		if (nstrings == -1) {
+			nstrings = language->nstrings;
+		} else if (nstrings != language->nstrings) {
+			uvcg_err(f, "languages must contain the same number of strings\n");
+			us = ERR_PTR(-EINVAL);
+			goto cleanup;
+		}
+
+		language->stringtab.strings = kcalloc(language->nstrings + 1,
+						      sizeof(struct usb_string),
+						      GFP_KERNEL);
+		if (!language->stringtab.strings) {
+			us = ERR_PTR(-ENOMEM);
+			goto cleanup;
+		}
+
+		j = 0;
+		list_for_each_entry(string, &language->strings, list) {
+			memcpy(&language->stringtab.strings[j], &string->usb_string,
+			       sizeof(struct usb_string));
+			j++;
+		}
+
+		gadget_strings[i] = &language->stringtab;
+		i++;
+	}
+
+	us = usb_gstrings_attach(cdev, gadget_strings, nstrings);
+
+cleanup:
+
+	list_for_each_entry(language, &opts->languages, list) {
+		kfree(language->stringtab.strings);
+		language->stringtab.strings = NULL;
+	}
+
+	kfree(gadget_strings);
+
+	return us;
+}
+
 static int
 uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 {
 	struct usb_composite_dev *cdev = c->cdev;
 	struct uvc_device *uvc = to_uvc(f);
-	struct usb_string *us;
+	struct uvcg_extension *xu;
+	struct usb_string *us, *cus;
 	unsigned int max_packet_mult;
 	unsigned int max_packet_size;
 	struct usb_ep *ep;
@@ -715,6 +775,15 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 	uvc_hs_streaming_ep.bEndpointAddress = uvc->video.ep->address;
 	uvc_ss_streaming_ep.bEndpointAddress = uvc->video.ep->address;
 
+	cus = uvc_function_attach_usb_strings(cdev, f);
+	if (IS_ERR(cus)) {
+		ret = PTR_ERR(cus);
+		goto error;
+	}
+
+	list_for_each_entry(xu, &opts->extension_units, list)
+		xu->desc.iExtension = cus[xu->string_descriptor_index].id;
+
 	uvc_en_us_strings[UVC_STRING_CONTROL_IDX].s = opts->function_name;
 	us = usb_gstrings_attach(cdev, uvc_function_strings,
 				 ARRAY_SIZE(uvc_en_us_strings));
-- 
2.34.1

