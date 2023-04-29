Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7122F6F251D
	for <lists+linux-usb@lfdr.de>; Sat, 29 Apr 2023 16:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbjD2Opi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Apr 2023 10:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbjD2Oph (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Apr 2023 10:45:37 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970AA1987
        for <linux-usb@vger.kernel.org>; Sat, 29 Apr 2023 07:45:35 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4edc114c716so1227402e87.1
        for <linux-usb@vger.kernel.org>; Sat, 29 Apr 2023 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682779534; x=1685371534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H24YfCo0r0QwqI2Tud2+iRNxnUTKS8iPMGKqWjg5VtI=;
        b=SWZEJVcVD7tHd4Sq2nUkAOHs2xM9XLjQ/DSaHOrZT9rtyN7YeQgaUnaeJIoB5ZdWCG
         6MJOXwzQmmJNzbslJnC2dQJ7t7Cs2BOAx0Lsg0B6nYpa9DjFFcM/tESmOdgKhBY8saan
         xvG19mhh2miSp5ticuapfV8JG3sqbjcUmgUF+wq/uQ2ldZWPXNgcbqYwvoO6AZ5ts45E
         LK6L/I2CCbEZogFjUNYpTebx4r5RRxQcrypaRR27OZvFIJ9aYlBEUgCVp+vquJZb8gxi
         QDXR2aGG9oAJ+SeOCicENQzRKdeAxCje5KBbeBfLXtm29Im6GCvdZYd7Cc6SC1syr1xn
         MInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682779534; x=1685371534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H24YfCo0r0QwqI2Tud2+iRNxnUTKS8iPMGKqWjg5VtI=;
        b=gLDxpp7/JsFjL71Rumpli0WgUewRXKZdOCeZ7CSjpojj4+mAXdqRJaYt2ImlGlZACb
         HKNyLVJXD4vomBzgBcPmxo0bRegh8GTQazNPOiwXzTLbWPqlBSvGWvY0iBhxzxenqHiQ
         BurO0B8/U/h5WPw+p0t9eUfGmvPMTHJUZxbnQPEusHQV8H+Wbsgy1QYbabKVS7V7YGEE
         83XOOQeSOp8jS6QRVAv6Tww2+4gWO+XUVCx9BsQWnBM7jsvG/OYQeczdzfzifVSR36+8
         sIpA/vSFYmtMg2Nsz4RlTk/WJ8fgWb1Mt21lLzTG0LZIdb6oprUF4HUZTwn2jjZzQH8E
         uPJA==
X-Gm-Message-State: AC+VfDwG4Lm9MnHG/x/zWH1aPvnO/+AIPA2ofId8H+B+gUQCK8UPRxyt
        oa30O/Z5OePVX6UdSBpPMCE=
X-Google-Smtp-Source: ACHHUZ6mlXS7/4TcFM7Hl3bm4nvtDybe/r9VY88bboduBcQwDetC0oKAdgy69tS0fBCwYsV+MsZeFw==
X-Received: by 2002:ac2:4313:0:b0:4eb:29b0:1ca4 with SMTP id l19-20020ac24313000000b004eb29b01ca4mr2330543lfh.8.1682779533596;
        Sat, 29 Apr 2023 07:45:33 -0700 (PDT)
Received: from t630.example.org (45-11-61-13.ip4.greenlan.pl. [45.11.61.13])
        by smtp.googlemail.com with ESMTPSA id w14-20020ac25d4e000000b004eed8de597csm3808583lfd.32.2023.04.29.07.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 07:45:32 -0700 (PDT)
From:   Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
To:     gregkh@linuxfoundation.org, balbi@kernel.org,
        stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org,
        Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
Subject: [PATCH v3] usb: prevent duplicate bEndpointAddress by usb_ep_autoconfig_ss (bitmap).
Date:   Sat, 29 Apr 2023 16:45:16 +0200
Message-Id: <20230429144516.2848-1-wlodzimierz.lipert@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_ep_autoconfig_ss tries to use endpoint name or internal counters to generate
bEndpointAddress - this leads to duplicate addresses. Fix changes the
way in/out_epnum is used, now as bitmap which represents unavailable ep numbers.
Refined autoconf logic.

Signed-off-by: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
---
 drivers/usb/gadget/epautoconf.c | 25 ++++++++++++++++---------
 include/linux/usb/gadget.h      |  4 ++--
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/epautoconf.c
index 1eb4fa2e623f..74430807b803 100644
--- a/drivers/usb/gadget/epautoconf.c
+++ b/drivers/usb/gadget/epautoconf.c
@@ -67,6 +67,8 @@ struct usb_ep *usb_ep_autoconfig_ss(
 )
 {
 	struct usb_ep	*ep;
+	unsigned *epmap;
+	u8 num;
 
 	if (gadget->ops->match_ep) {
 		ep = gadget->ops->match_ep(gadget, desc, ep_comp);
@@ -93,19 +95,23 @@ struct usb_ep *usb_ep_autoconfig_ss(
 
 	/* report address */
 	desc->bEndpointAddress &= USB_DIR_IN;
+	epmap = usb_endpoint_dir_in(desc) ?
+		&gadget->in_epnum : &gadget->out_epnum;
+
 	if (isdigit(ep->name[2])) {
-		u8 num = simple_strtoul(&ep->name[2], NULL, 10);
-		desc->bEndpointAddress |= num;
-	} else if (desc->bEndpointAddress & USB_DIR_IN) {
-		if (++gadget->in_epnum > 15)
+		num = simple_strtoul(&ep->name[2], NULL, 10);
+		WARN_ON(num == 0 || num > 15);
+		if (*epmap & (1U << num))
 			return NULL;
-		desc->bEndpointAddress = USB_DIR_IN | gadget->in_epnum;
 	} else {
-		if (++gadget->out_epnum > 15)
+		/* find first available ep number (not encoded in ep name) */
+		num = ffz(*epmap);
+		if (num > 15)
 			return NULL;
-		desc->bEndpointAddress |= gadget->out_epnum;
 	}
 
+	*epmap |= 1U << num;
+	desc->bEndpointAddress |= num;
 	ep->address = desc->bEndpointAddress;
 	ep->desc = NULL;
 	ep->comp_desc = NULL;
@@ -208,7 +214,8 @@ void usb_ep_autoconfig_reset (struct usb_gadget *gadget)
 		ep->claimed = false;
 		ep->driver_data = NULL;
 	}
-	gadget->in_epnum = 0;
-	gadget->out_epnum = 0;
+	/* ep num 0 is reserved: not available for auto configuration */
+	gadget->in_epnum = 1U;
+	gadget->out_epnum = 1U;
 }
 EXPORT_SYMBOL_GPL(usb_ep_autoconfig_reset);
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 6a178177e4c9..1e00e22202bc 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -343,8 +343,8 @@ struct usb_gadget_ops {
  *	and sometimes configuration.
  * @dev: Driver model state for this abstract device.
  * @isoch_delay: value from Set Isoch Delay request. Only valid on SS/SSP
- * @out_epnum: last used out ep number
- * @in_epnum: last used in ep number
+ * @out_epnum: bitmap of allocated out ep numbers
+ * @in_epnum: bitmap of allocated in ep numbers
  * @mA: last set mA value
  * @otg_caps: OTG capabilities of this gadget.
  * @sg_supported: true if we can handle scatter-gather
-- 
2.39.2

