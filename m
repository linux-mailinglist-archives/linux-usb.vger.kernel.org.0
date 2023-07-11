Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307D174E5D6
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jul 2023 06:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjGKE2E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jul 2023 00:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjGKE2C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jul 2023 00:28:02 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 628DB90
        for <linux-usb@vger.kernel.org>; Mon, 10 Jul 2023 21:28:01 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b852785a65so33970405ad.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Jul 2023 21:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689049681; x=1691641681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZTTAndE5sQfFOQ4cgQtZgJ/SirH5KDOSAcX/kG5S4M=;
        b=p741asHOh2bb70IklMa/zmdltFAdD3+Nhz8/kXH4FXYL+hXGvqhc6/P2pN9Kadd44z
         g1d5cN596zFJXeZcBYSBIkdM0EwVedDrCtKMp3VREMOZoBE1OVuTh/FOAS9iYtMcn/i4
         ZxPlQkf9kTjZUiUe1gbQGYWLZalZ7axXToBJXRwxtY7qOm1S37DyU2L8i23Ryj2njid+
         cwzNLvPWaVY8tBVhwfccW3jLawrYk8smCZXLzMnWx299bJFp6SlxktFPA8Y2AYR/pxeD
         B5FAuj15Ef0KQ9Im23ievHfEuhwxO1DJbR6TGVeglPPXpXQau9vuHKyVnRCoM0t43wMp
         MO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689049681; x=1691641681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZTTAndE5sQfFOQ4cgQtZgJ/SirH5KDOSAcX/kG5S4M=;
        b=X5AW2VueNTCHWyyPd+YZKpRnwMX+GKewclQ4peFKN5Bfp/97fcsfYOFJPYEWBf0akm
         M64NtyU+Wz+gRrIC5qyBSyg1BqYTZgxQwm2or7ItdZqMjyGrzcZ+y49uSMTiPYT1Ezmd
         WbXznHtNHVen0TW/FtoF54++nuUziQvku9Aye8gvC8Obr5deHXInhB41A+AsB1NM8kX2
         014qoxuTLSP/cKCLrgSBzKeSrhpbmt4L31dTr6yY2+oXL3AJHYxAx/kLE1LrXCpVBYYi
         SPivvc1XVFxFFu0IURz+IpJuQxFjDoFh1sOVBQLz5QCX1TKCIbPieQxeH4m0jbMR7Y9o
         5r7g==
X-Gm-Message-State: ABy/qLYYF3F/ZEgPTufDP80yE2dpRv3FK6cD+nwc/fHXuJAVWbYYSDRz
        aJvdc/9P03MyupY9ZHuxJ60=
X-Google-Smtp-Source: APBJJlH4ryhaiEZRe0ylJ+ZVZWTIIHkDm1lgUpPPIqdfnq8yi7ukBLqTU65G80flKbN3SF82j3iXBg==
X-Received: by 2002:a17:903:228c:b0:1b8:9846:a3b2 with SMTP id b12-20020a170903228c00b001b89846a3b2mr21399313plh.14.1689049680642;
        Mon, 10 Jul 2023 21:28:00 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:602:9300:2710::e399])
        by smtp.gmail.com with ESMTPSA id q15-20020a170902b10f00b001b9da7ae98bsm721035plr.122.2023.07.10.21.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 21:28:00 -0700 (PDT)
From:   Prince Kumar Maurya <princekumarmaurya06@gmail.com>
To:     krzk@kernel.org, gregkh@linuxfoundation.org, raychi@google.com,
        skhan@linuxfoundation.org
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org, princekumarmaurya06@gmail.com
Subject: [PATCH] driver/usb: Fixing code style error/warning
Date:   Mon, 10 Jul 2023 21:27:20 -0700
Message-Id: <20230711042720.2544320-1-princekumarmaurya06@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1dcd6d8f-f15b-4f71-52a2-3ff48bff7575@kernel.org>
References: <1dcd6d8f-f15b-4f71-52a2-3ff48bff7575@kernel.org>
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

Update the patch and verified it with --strict flag.
Found no error/warning for this patch.

Signed-off-by: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
---
 drivers/usb/core/hub.c | 58 +++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index a739403a9e45..27037affb746 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1777,7 +1777,7 @@ static bool hub_descriptor_is_sane(struct usb_host_interface *desc)
 	if (!usb_endpoint_is_int_in(&desc->endpoint[0].desc))
 		return false;

-        return true;
+	return true;
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

