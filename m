Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92F356EF39A
	for <lists+linux-usb@lfdr.de>; Wed, 26 Apr 2023 13:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240123AbjDZLpm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Apr 2023 07:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbjDZLpk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Apr 2023 07:45:40 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E464C3F
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 04:45:39 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2a8baeac4d1so69266671fa.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 04:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682509537; x=1685101537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kp5hVblDUf2X2DcjhbH6TNN8htu/kIR8aai0vHTMtQ0=;
        b=HDivSCVywhUdC6r8arLBrxrsyQGfSkicyyogWFwePBvLf7GcL1zJkmqX2O+6BltuAS
         1Ac9REFbG+Aw/lWFDlH5UpGOhRPxIzoczd9t/Y3Q1YIAltwQP2uhLG0K1ic+jgQwLWVb
         HdXPkOj8UiaY+Wc3jmR2FgBxcT9S0INancp0Y/ZxrArimedRdJzS3S4HDrzgSdkelPdW
         7sfGu4ocBN5t68jgHhHHuEqzmFMXPk08ZdQXerJRJzf0R9vv1WdRDmsUAebjT88ONLDb
         QV6YzofoVjSfVIQecMAL+q6SGeNFJkIo82odp59vECT9YtNOcvQokxz1f0SHpnrop6MW
         t1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682509537; x=1685101537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kp5hVblDUf2X2DcjhbH6TNN8htu/kIR8aai0vHTMtQ0=;
        b=CKWbMVGQfYiVTEcRZkcmXCLUbbsvMv8ZEoq8EQLMJQ7j6P79FyWdy0zA4uQOUXwv3S
         NSlkYqvnvnnyJLDYmObh4c1+Lz+XuZS1YSVvQgIn6TPs8zD7E4B1n9YLceA/rTE9mPwT
         JTBaO9Olk5lFdY7hqMFq102mrM47bZZ28BdLQD97x45KQgunGiETzSMoDPc1p8QuAzJE
         xuE8REnefWQ/NqLWnRp8HP8LKf+Il9hvY9vbli314RVfzNUWcyDSH8iOunb5HBJuTFD0
         +oNonwuT2fkk1Mm/m8SmvCvbdHxeVSW2Oct63rcn6hulkKUAFjcSHA1FWDYiYlIJaS56
         JTag==
X-Gm-Message-State: AAQBX9dML9Ek3qbdhZCtX7mlZj1WrddJ8Xg1hWDDN3llPkXBWMN4KW/Q
        rIxSeqZHKVIoq3Gj8QSv1Bk=
X-Google-Smtp-Source: AKy350YjSXDiWoqVmmcwsy0PHsVo4WICBvg8KBVzjH5yznGvkKa+HSZ76vFiIcUTVMqud3QWkApYdg==
X-Received: by 2002:a2e:9903:0:b0:2a0:202c:93a7 with SMTP id v3-20020a2e9903000000b002a0202c93a7mr3951907lji.14.1682509537072;
        Wed, 26 Apr 2023 04:45:37 -0700 (PDT)
Received: from t630.example.org (45-11-61-13.ip4.greenlan.pl. [45.11.61.13])
        by smtp.googlemail.com with ESMTPSA id 13-20020a05651c008d00b0029b32a40934sm2439907ljq.113.2023.04.26.04.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 04:45:36 -0700 (PDT)
From:   Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
To:     gregkh@linuxfoundation.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org,
        Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
Subject: [PATCH v2] usb: prevent duplicate bEndpointAddress by usb_ep_autoconfig_ss (bitmap).
Date:   Wed, 26 Apr 2023 13:45:28 +0200
Message-Id: <20230426114528.3996-1-wlodzimierz.lipert@gmail.com>
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
+		if (num > 15)
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
+	while (*epnum_map & (1U << num))
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

