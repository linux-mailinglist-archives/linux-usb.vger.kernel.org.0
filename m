Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 605946EF384
	for <lists+linux-usb@lfdr.de>; Wed, 26 Apr 2023 13:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240513AbjDZLlq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Apr 2023 07:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239947AbjDZLlp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Apr 2023 07:41:45 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F5D46A6
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 04:41:43 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4ec816d64afso30238072e87.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 04:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682509302; x=1685101302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Rhrj4sQwygc9XaiC9VmfgJL3i2AK8zPKePp35VK5NY=;
        b=oQQO45pVb+kXER+qfn7OqtTceonMhxFnFPlkvRPixviEwPBIIAN4Ou6910X3FbD1Dn
         d0HV/CBqDTRK/dbyuuWpslnTjUcn6ZjbCKxSkMIPBPkN9ytkOMOGJZoJ1KpdRtS87gBd
         H6IskwaK4H87ACc/Evefxr3vK+uF47jSuvDyC8WhnepdDCkws1nuq7B8x7EZ0wX0Tx1r
         cou+S7E6pAnGdHS7rwdC/R6REcieGiGEx2HLfgw+JdB2E4SE5GLrsmQM8kWDvWxDl3f5
         PpODBT3wXQ+6/PjFgM74kCBsjeiGfL1ZFWP3eVuP5pUQ5qSBsU9TX1x5dl6C8ZWlj7Sx
         tPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682509302; x=1685101302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Rhrj4sQwygc9XaiC9VmfgJL3i2AK8zPKePp35VK5NY=;
        b=lsIrfEHAQvZ7mv7kYQ/vbTXwVDXcoLxjW8Wh28/N5wvhdXM/rzd0+JiXYK3Pkk49fC
         boeLmoX/tvQh462a80b11edgGxLrDyHYwNGGaz5jVwTFrp+XluuCIOU1w7obdPlf32rn
         YDzANj3otOp1lU2awIONjJoy29oqDpEzZf2jvOm2WwKVVyjco4PJBXM46FiNbuFmXRi7
         Ijf3y0MKk0HQ4L9i24mtiGaPpoLdzHuIyK8Tgvgr3rDgwhLbulTS2zZwM5ZlvB582wC8
         eCptRRn/HcePiIWvfr4ZFGh1+1MWSMxzGaa/Mnqz98lcHsYN35mxYDjo/6Bcch6nENos
         UeGA==
X-Gm-Message-State: AC+VfDxxXbZUYr40ruGmWzifUXjZeWMT9QkQ69Al07I5AnQTVh22mjoD
        mLMf5N8m/EW/IY9RhU4Ygcw=
X-Google-Smtp-Source: ACHHUZ5+l99R5UcUTcn6ggonoyA3WbpI8mEeOT11UWi2t5lxgyyptrlPXpmSJpGt8xERqZuJEp233w==
X-Received: by 2002:ac2:5464:0:b0:4d8:51e7:9f23 with SMTP id e4-20020ac25464000000b004d851e79f23mr545160lfn.34.1682509301329;
        Wed, 26 Apr 2023 04:41:41 -0700 (PDT)
Received: from t630.example.org (45-11-61-13.ip4.greenlan.pl. [45.11.61.13])
        by smtp.googlemail.com with ESMTPSA id x24-20020a19f618000000b004db3e7dfb8csm2461011lfe.189.2023.04.26.04.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 04:41:40 -0700 (PDT)
From:   Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
To:     gregkh@linuxfoundation.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org,
        Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
Subject: [PATCH] usb: prevent duplicate bEndpointAddress by usb_ep_autoconfig_ss (bitmap).
Date:   Wed, 26 Apr 2023 13:41:20 +0200
Message-Id: <20230426114120.3603-1-wlodzimierz.lipert@gmail.com>
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

Signed-off-by: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
---
 drivers/usb/gadget/epautoconf.c | 35 ++++++++++++++++++++++-----------
 include/linux/usb/gadget.h      |  4 ++--
 2 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/epautoconf.c
index 1eb4fa2e623f..50a2e8a90447 100644
--- a/drivers/usb/gadget/epautoconf.c
+++ b/drivers/usb/gadget/epautoconf.c
@@ -67,6 +67,11 @@ struct usb_ep *usb_ep_autoconfig_ss(
 )
 {
 	struct usb_ep	*ep;
+	unsigned *epnum_map;
+	/* ep num 0 is reserved: not available for auto configuration */
+	u8 num = 1;
+	/* USB allows up to 16 IN and 16 OUT enpoints */
+	unsigned num_mask = 0xFFFFU;
 
 	if (gadget->ops->match_ep) {
 		ep = gadget->ops->match_ep(gadget, desc, ep_comp);
@@ -94,18 +99,25 @@ struct usb_ep *usb_ep_autoconfig_ss(
 	/* report address */
 	desc->bEndpointAddress &= USB_DIR_IN;
 	if (isdigit(ep->name[2])) {
-		u8 num = simple_strtoul(&ep->name[2], NULL, 10);
-		desc->bEndpointAddress |= num;
-	} else if (desc->bEndpointAddress & USB_DIR_IN) {
-		if (++gadget->in_epnum > 15)
+		num = simple_strtoul(&ep->name[2], NULL, 10);
+		if(num > 15)
 			return NULL;
-		desc->bEndpointAddress = USB_DIR_IN | gadget->in_epnum;
-	} else {
-		if (++gadget->out_epnum > 15)
-			return NULL;
-		desc->bEndpointAddress |= gadget->out_epnum;
+		num_mask = 1U << num;
 	}
 
+	epnum_map = desc->bEndpointAddress & USB_DIR_IN
+		? &gadget->in_epnum : &gadget->out_epnum;
+
+	/* check if requested ep number (if name encodes it) or any is available */
+	if (num_mask == (*epnum_map & num_mask))
+		return NULL;
+
+	/* find first available ep number (if not encoded in ep name) */
+	while(*epnum_map & (1U << num))
+		++num;
+
+	*epnum_map |= 1U << num;
+	desc->bEndpointAddress |= num;
 	ep->address = desc->bEndpointAddress;
 	ep->desc = NULL;
 	ep->comp_desc = NULL;
@@ -208,7 +220,8 @@ void usb_ep_autoconfig_reset (struct usb_gadget *gadget)
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

