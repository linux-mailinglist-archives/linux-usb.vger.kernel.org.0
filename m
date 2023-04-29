Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5FFB6F2542
	for <lists+linux-usb@lfdr.de>; Sat, 29 Apr 2023 17:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbjD2Pro (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Apr 2023 11:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjD2Prn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Apr 2023 11:47:43 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF431728
        for <linux-usb@vger.kernel.org>; Sat, 29 Apr 2023 08:47:42 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2a8b1b51dbdso8286061fa.0
        for <linux-usb@vger.kernel.org>; Sat, 29 Apr 2023 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682783260; x=1685375260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HIEBfULDH7JIBRGDSxkedGVsxTQIk3RG/ppZEaBd1lU=;
        b=d6FLzn7wKzp5K7sDz2u6CFd+yC5nD3hkHvxXi+KeXqVHH4Nwn60rF4OOMwZyOwsLAL
         FUGMtt+38W1uSFyFBkyiDi4zZkUzib+uSDuyxbEHtrwXYj5O1KqL9ZSiHWhn1olaZC41
         6gPzR9q+oQjJrnqKzFVp0Lul0nGtB/zaNPYaX1HZfmy1aARmW2olYhc1qlwcfEsVxR6C
         e1niujUNyZEgKZjR/HXc2Gpq8lj7F5pFHky56CBC6CTGJVOrOzXvKmWglVGoQkDnyj5g
         xOExlY21jx+EgX1V5xdCziltnK4u25UycpmPQNEfpzgfa4nnoj1OidxsWJe1kw1eqYdj
         QRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682783260; x=1685375260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIEBfULDH7JIBRGDSxkedGVsxTQIk3RG/ppZEaBd1lU=;
        b=ddViTssTXI2ghoe5mbaYwG0hVtasTOXK8yzUo8VD5DjHwt4OU0vqFH4p2wjEP5HPeF
         /3DPdAwKnu4pl5wIkOYAwCtyBnANCRGvbBcJiAKtRCPgyyXgWkOCU1j7zk80DaKd4wd8
         cwWxsGqf0CktrsUXUmZ9haHdL6vmMhJ1q+yNgrR1z3WEO0VMOUVjxRYdkDLJYuqO7Q5a
         53eEN6EMz+4zDSIjS1KMnjmIv06zdlAP4rd2s8IVYukiU/TYEjATcAvXCEySsZvEkdxv
         Pr6nD917HWBHBUwlTk/nbMKfTe5s6fQSUnR/tN97l2XRuKsErPm193SkvtI2BGfVJ0Nk
         gT+Q==
X-Gm-Message-State: AC+VfDwvmob5qk9dYUWWHrO3HyEIGqviMJlPiVrqYxH69ne2m2qopzGV
        5rhaq53v5o5WZyvA3iW7OVU=
X-Google-Smtp-Source: ACHHUZ6SrwZJZYtcbdr7EzEgj3tDDUw0c28Ze1Dnxr9aFceeN1QnFVjhm31HX1BALAyDvYNpNx94AQ==
X-Received: by 2002:a2e:9b90:0:b0:2a8:e600:7849 with SMTP id z16-20020a2e9b90000000b002a8e6007849mr2562467lji.33.1682783259816;
        Sat, 29 Apr 2023 08:47:39 -0700 (PDT)
Received: from t630.example.org (45-11-61-13.ip4.greenlan.pl. [45.11.61.13])
        by smtp.googlemail.com with ESMTPSA id g10-20020a19ac0a000000b004efff420b0dsm1972313lfc.1.2023.04.29.08.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 08:47:39 -0700 (PDT)
From:   Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
To:     gregkh@linuxfoundation.org, balbi@kernel.org,
        stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org,
        Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
Subject: [PATCH v4] usb: prevent duplicate bEndpointAddress by usb_ep_autoconfig_ss (bitmap).
Date:   Sat, 29 Apr 2023 17:47:33 +0200
Message-Id: <20230429154733.4429-1-wlodzimierz.lipert@gmail.com>
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

v2: formatting fixes only (errors).
v3: refined autoconf logic (removed num_mask, switched to use ffz).
v4: formatting only changes (style).

Signed-off-by: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
---
 drivers/usb/gadget/epautoconf.c | 25 ++++++++++++++++---------
 include/linux/usb/gadget.h      |  4 ++--
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/epautoconf.c
index 1eb4fa2e623f..f73a7fe3d7d7 100644
--- a/drivers/usb/gadget/epautoconf.c
+++ b/drivers/usb/gadget/epautoconf.c
@@ -67,6 +67,8 @@ struct usb_ep *usb_ep_autoconfig_ss(
 )
 {
 	struct usb_ep	*ep;
+	unsigned	*epmap;
+	u8		num;
 
 	if (gadget->ops->match_ep) {
 		ep = gadget->ops->match_ep(gadget, desc, ep_comp);
@@ -93,19 +95,23 @@ struct usb_ep *usb_ep_autoconfig_ss(
 
 	/* report address */
 	desc->bEndpointAddress &= USB_DIR_IN;
+	epmap = usb_endpoint_dir_in(desc) ?
+			&gadget->in_epnum : &gadget->out_epnum;
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

