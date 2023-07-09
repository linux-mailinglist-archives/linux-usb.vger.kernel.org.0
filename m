Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A8B74C036
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jul 2023 02:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjGIAwV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Jul 2023 20:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjGIAwU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Jul 2023 20:52:20 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F937CD
        for <linux-usb@vger.kernel.org>; Sat,  8 Jul 2023 17:52:18 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-666ecf9a0ceso1625405b3a.2
        for <linux-usb@vger.kernel.org>; Sat, 08 Jul 2023 17:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688863938; x=1691455938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vveFk2wGcZ+4HH5+EqiZf6j3z828PkBXCiuToG8yuJc=;
        b=RVuSaUHTrHnXaZc3Bew+SSbj7GRo4/pc/VDP7SjTLhGiXRX2NTkLOh2J+tlEjYZnwe
         Hf4Q4uwopJPgjdTtV7unxypqjnuLkmvfZoL9SY10Tsj2klywj9FHAYgsicxFLr8cjK2u
         pEdfX3fiTxXDWMx2c+kW8Ng9Nw7egHXIup7DsJohADz/HJauk3aEI608TL5kLSJS9QFq
         FwjrbVlseLqxmlYJsGyT/uGCSC+a0ZsRXdcQowAjOHlh5qZT+xL4MVLDyVnjpOFLOpqw
         qcsWm4oKK0FVE5vG6PI9regrQy0IjV/9PhS+GJlsELd535l3TRQiPdcN7vvN5H6LQ5K2
         JLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688863938; x=1691455938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vveFk2wGcZ+4HH5+EqiZf6j3z828PkBXCiuToG8yuJc=;
        b=Ggj2es/ngAzh4MbKhv0PQOvXLJrpN1WXUleRNo2QpZMr/2EfxWSCz8svR48l3mm2L8
         6WC6MmMlIl8Ntc/WB9CmZQ1fw5v/EeUCWFIQPWx3htoc/tv5L3N+oEI8KQ+Qjy2tO9f8
         7d6NWCj2Oe1R6kGFVn5ZHnIWXbTbtxzwQq6eZgTL84auy1AbXqz+6R9G0Wj9IscTRpMr
         MVrmmhJmHrp36/+h0vjW0ef0HOJIh/v5K/hkMlpYPwZQJXNK2Q82J5RrehMq+1WEFxBS
         anV+Qul7VHy3bpGKWhc258Fa96r0kEfayUXHgMxHIfh14M4KB+URfZ8oUpHqnbKZmyuT
         ba3w==
X-Gm-Message-State: ABy/qLbwKcqROQmLcyE/4ttnqfTUxHVCUrHApey/4sJBhWjVHgAwL7iN
        zoPA3r3ObUgMd8dFbeWfmnw=
X-Google-Smtp-Source: APBJJlGIRW909tqywb92TBH+bHgqsWLuH+U0T5PLOC8uzUZ1o+B6JpickN+hiNZrfG6M1ZFnVlLE6Q==
X-Received: by 2002:a05:6a20:3c87:b0:12d:4c17:bb2d with SMTP id b7-20020a056a203c8700b0012d4c17bb2dmr8824052pzj.26.1688863937993;
        Sat, 08 Jul 2023 17:52:17 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:602:9300:2710::e399])
        by smtp.gmail.com with ESMTPSA id u21-20020aa78395000000b006765cb32558sm4829319pfm.139.2023.07.08.17.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 17:52:17 -0700 (PDT)
From:   Prince Kumar Maurya <princekumarmaurya06@gmail.com>
To:     gregkh@linuxfoundation.org, raychi@google.com,
        skhan@linuxfoundation.org
Cc:     Prince Kumar Maurya <princekumarmaurya06@gmail.com>,
        linux-usb@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] Style error/warning fixes: replacing space with tabs
Date:   Sat,  8 Jul 2023 17:51:33 -0700
Message-Id: <20230709005133.2439465-1-princekumarmaurya06@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Style fixes for warning found using checkpatch.pl script 

Signed-off-by: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
---
 drivers/usb/core/hub.c | 58 +++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index a739403a9e45..82a7b127a340 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1777,7 +1777,7 @@ static bool hub_descriptor_is_sane(struct usb_host_interface *desc)
 	if (!usb_endpoint_is_int_in(&desc->endpoint[0].desc))
 		return false;
 
-        return true;
+		return true;
 }
 
 static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
@@ -5854,37 +5854,37 @@ static void hub_event(struct work_struct *work)
 }
 
 static const struct usb_device_id hub_id_table[] = {
-    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
-                   | USB_DEVICE_ID_MATCH_PRODUCT
-                   | USB_DEVICE_ID_MATCH_INT_CLASS,
-      .idVendor = USB_VENDOR_SMSC,
-      .idProduct = USB_PRODUCT_USB5534B,
-      .bInterfaceClass = USB_CLASS_HUB,
-      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
-    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
-                   | USB_DEVICE_ID_MATCH_PRODUCT,
-      .idVendor = USB_VENDOR_CYPRESS,
-      .idProduct = USB_PRODUCT_CY7C65632,
-      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
-    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
+	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
+			| USB_DEVICE_ID_MATCH_PRODUCT
+			| USB_DEVICE_ID_MATCH_INT_CLASS,
+	  .idVendor = USB_VENDOR_SMSC,
+	  .idProduct = USB_PRODUCT_USB5534B,
+	  .bInterfaceClass = USB_CLASS_HUB,
+	  .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
+	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
+			| USB_DEVICE_ID_MATCH_PRODUCT,
+	  .idVendor = USB_VENDOR_CYPRESS,
+	  .idProduct = USB_PRODUCT_CY7C65632,
+	  .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
+	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
 			| USB_DEVICE_ID_MATCH_INT_CLASS,
-      .idVendor = USB_VENDOR_GENESYS_LOGIC,
-      .bInterfaceClass = USB_CLASS_HUB,
-      .driver_info = HUB_QUIRK_CHECK_PORT_AUTOSUSPEND},
-    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
+	  .idVendor = USB_VENDOR_GENESYS_LOGIC,
+	  .bInterfaceClass = USB_CLASS_HUB,
+	  .driver_info = HUB_QUIRK_CHECK_PORT_AUTOSUSPEND},
+	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
 			| USB_DEVICE_ID_MATCH_PRODUCT,
-      .idVendor = USB_VENDOR_TEXAS_INSTRUMENTS,
-      .idProduct = USB_PRODUCT_TUSB8041_USB2,
-      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
-    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
+	  .idVendor = USB_VENDOR_TEXAS_INSTRUMENTS,
+	  .idProduct = USB_PRODUCT_TUSB8041_USB2,
+	  .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
+	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
 			| USB_DEVICE_ID_MATCH_PRODUCT,
-      .idVendor = USB_VENDOR_TEXAS_INSTRUMENTS,
-      .idProduct = USB_PRODUCT_TUSB8041_USB3,
-      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
-    { .match_flags = USB_DEVICE_ID_MATCH_DEV_CLASS,
-      .bDeviceClass = USB_CLASS_HUB},
-    { .match_flags = USB_DEVICE_ID_MATCH_INT_CLASS,
-      .bInterfaceClass = USB_CLASS_HUB},
+	  .idVendor = USB_VENDOR_TEXAS_INSTRUMENTS,
+	  .idProduct = USB_PRODUCT_TUSB8041_USB3,
+	  .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
+	{ .match_flags = USB_DEVICE_ID_MATCH_DEV_CLASS,
+	  .bDeviceClass = USB_CLASS_HUB},
+	{ .match_flags = USB_DEVICE_ID_MATCH_INT_CLASS,
+	  .bInterfaceClass = USB_CLASS_HUB},
     { }						/* Terminating entry */
 };
 
-- 
2.40.1

