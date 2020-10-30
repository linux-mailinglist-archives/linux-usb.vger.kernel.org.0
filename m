Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846D82A0A0C
	for <lists+linux-usb@lfdr.de>; Fri, 30 Oct 2020 16:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbgJ3Pj7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 11:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgJ3Pj7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Oct 2020 11:39:59 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA36C0613CF
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2020 08:39:35 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id y12so6948450wrp.6
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2020 08:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=BLuc3+81IR0xgbrrNnLDKYivTtYHnNXf6doHT1KgVR4=;
        b=iitN2GkJnM+T4Jy3yP125KsoBsMrcrR1iaUOtJmxHWPN/Q59Z/yGaqfnGxYaOdcptF
         /7OTJw57+DMgr9BKbcNbjgsD/Z5K8fUanzJHnpcc4OeRpDVU15L/f1vihtZC5GwTwbo/
         xJcDw4aulFVKgY5l+hmvbhuGbeIV0pfAHhqBPBQ/H0puXc60e1rld2fprAB83kRFGmMw
         cKtrtxlp6WJaKK0gezOxOwfALZCPdLxjeEzzTRwKZNcKiy5E3+K32XmeAymFKqK67PVb
         h37E8G9xZe91+QbvbpeNvJMZS8UMUvAbnvlM+96GeVdzjJc2uBD5Hnhfl3V13SDSmiry
         LinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=BLuc3+81IR0xgbrrNnLDKYivTtYHnNXf6doHT1KgVR4=;
        b=MGBEyRuXBQm4z3CweKUhbvqtZ2xFA4O0MJF6eB60h4XfBQPg2BJ5iiVNHmyQsnPgw0
         x2a9OJql0PZhyK+oCqymQJ8Gwl+N8o2usQkEzTXCtsXfiuEJNKllVxnsR2yCm+3VKgaf
         Nd0Z8LEIsPs0a76K8j+1btIyJoFamCikOx1HhTWxrvZrmUGBJxBas42VHYm5CZy4vFjn
         a6m43Mk4yc2TDmKGUdnexrrDPF3R0G6UMo+cNlf9lcLvruQv2WTcKqITembf+g0Xclzj
         G0lKNTebkG+5nXK6lvXbR5PdK47d5TEJvG48Sg9tD5bmfouwzZXy3lg3DnyfN/rnt5kP
         ruxA==
X-Gm-Message-State: AOAM533mUGv8JdUA97xWfGeqh26g32BuUaQE2lFZk3rLDuXKoFYy8IyH
        MTF3NxD1ooII8E3Fuy7+zTUNDkFNVaXyLA==
X-Google-Smtp-Source: ABdhPJz6q8KrwsBsiwpcwP0u1jiNTPfVjp1f4I0LZ3FCxI000XqLqKXzQVjSnKbMRWA1IfQaN+7czQ==
X-Received: by 2002:a05:6000:108:: with SMTP id o8mr3901334wrx.256.1604072374436;
        Fri, 30 Oct 2020 08:39:34 -0700 (PDT)
Received: from localhost.localdomain (srvvpn1.y3s.fr. [195.154.42.16])
        by smtp.gmail.com with ESMTPSA id c18sm4971471wmk.36.2020.10.30.08.39.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2020 08:39:33 -0700 (PDT)
Sender: Yann Garras <yanngarras@gmail.com>
From:   Yann GARRAS <yann.garras@y3s.fr>
To:     johan@kernel.org
Cc:     linux-usb@vger.kernel.org, Yann GARRAS <yann.garras@y3s.fr>
Subject: [PATCH] USB: serial: option: creating of the missings constants for Telit products
Date:   Fri, 30 Oct 2020 16:39:27 +0100
Message-Id: <20201030153927.20795-1-yann.garras@y3s.fr>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Replace hard-coded product id values by constants for Telit Products

Signed-off-by: Yann GARRAS <yann.garras@y3s.fr>
---
 drivers/usb/serial/option.c | 40 +++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 2a3bfd6f8..1bc83b687 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -285,12 +285,22 @@ static void option_instat_callback(struct urb *urb);
 #define TELIT_PRODUCT_CC864_SINGLE		0x1006
 #define TELIT_PRODUCT_DE910_DUAL		0x1010
 #define TELIT_PRODUCT_UE910_V2			0x1012
+#define TELIT_PRODUCT_LE910C1_EUX  0x1031
+#define TELIT_PRODUCT_LE910C1_EUX_ECM  0x1033
 #define TELIT_PRODUCT_LE922_USBCFG1		0x1040
 #define TELIT_PRODUCT_LE922_USBCFG2		0x1041
 #define TELIT_PRODUCT_LE922_USBCFG0		0x1042
 #define TELIT_PRODUCT_LE922_USBCFG3		0x1043
 #define TELIT_PRODUCT_LE922_USBCFG5		0x1045
+#define TELIT_PRODUCT_FN980_RMNET  0x1050
+#define TELIT_PRODUCT_FN980_MBIM 0x1051
+#define TELIT_PRODUCT_FN980_RNDIS  0x1052
+#define TELIT_PRODUCT_FN980_ECM  0x1053
+#define TELIT_PRODUCT_FT980_KS 0x1054
 #define TELIT_PRODUCT_ME910			0x1100
+#define TELIT_PRODUCT_ME910G1  0x110a
+#define TELIT_PRODUCT_ME910G1_ECM  0x110b
+#define TELIT_PRODUCT_ME910_ECM  0x1102
 #define TELIT_PRODUCT_ME910_DUAL_MODEM		0x1101
 #define TELIT_PRODUCT_LE920			0x1200
 #define TELIT_PRODUCT_LE910			0x1201
@@ -301,6 +311,10 @@ static void option_instat_callback(struct urb *urb);
 #define TELIT_PRODUCT_LE920A4_1212		0x1212
 #define TELIT_PRODUCT_LE920A4_1213		0x1213
 #define TELIT_PRODUCT_LE920A4_1214		0x1214
+#define TELIT_PRODUCT_LN940_QMI	0x1900
+#define TELIT_PRODUCT_LN940_MBIM	0x1901
+#define TELIT_PRODUCT_SBL_FN980_FLASH	0x9010
+
 
 /* ZTE PRODUCTS */
 #define ZTE_VENDOR_ID				0x19d2
@@ -1165,9 +1179,9 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_CC864_SINGLE) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_DE910_DUAL) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_UE910_V2) },
-	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1031, 0xff),	/* Telit LE910C1-EUX */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_LE910C1_EUX, 0xff),	
 	 .driver_info = NCTRL(0) | RSVD(3) },
-	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1033, 0xff),	/* Telit LE910C1-EUX (ECM) */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_LE910C1_EUX_ECM, 0xff),	
 	 .driver_info = NCTRL(0) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE922_USBCFG0),
 	  .driver_info = RSVD(0) | RSVD(1) | NCTRL(2) | RSVD(3) },
@@ -1179,25 +1193,25 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) | RSVD(3) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_LE922_USBCFG5, 0xff),
 	  .driver_info = RSVD(0) | RSVD(1) | NCTRL(2) | RSVD(3) },
-	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1050, 0xff),	/* Telit FN980 (rmnet) */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_FN980_RMNET, 0xff),
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
-	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1051, 0xff),	/* Telit FN980 (MBIM) */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_FN980_MBIM, 0xff),
 	  .driver_info = NCTRL(0) | RSVD(1) },
-	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1052, 0xff),	/* Telit FN980 (RNDIS) */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_FN980_RNDIS, 0xff),
 	  .driver_info = NCTRL(2) | RSVD(3) },
-	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1053, 0xff),	/* Telit FN980 (ECM) */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_FN980_ECM, 0xff),	
 	  .driver_info = NCTRL(0) | RSVD(1) },
-	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1054, 0xff),	/* Telit FT980-KS */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_FT980_KS, 0xff),	
 	  .driver_info = NCTRL(2) | RSVD(3) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910),
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(3) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910_DUAL_MODEM),
 	  .driver_info = NCTRL(0) | RSVD(3) },
-	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1102, 0xff),	/* Telit ME910 (ECM) */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910_ECM, 0xff),	
 	  .driver_info = NCTRL(0) },
-	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x110a, 0xff),	/* Telit ME910G1 */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910G1, 0xff),	
 	  .driver_info = NCTRL(0) | RSVD(3) },
-	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x110b, 0xff),	/* Telit ME910G1 (ECM) */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_ME910G1_ECM, 0xff),	
 	  .driver_info = NCTRL(0) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE910),
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
@@ -1219,11 +1233,11 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1261),
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
-	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1900),				/* Telit LN940 (QMI) */
+	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LN940_QMI),				
 	  .driver_info = NCTRL(0) | RSVD(1) },
-	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1901, 0xff),	/* Telit LN940 (MBIM) */
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_LN940_MBIM, 0xff),	
 	  .driver_info = NCTRL(0) },
-	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9010),				/* Telit SBL FN980 flashing device */
+	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_SBL_FN980_FLASH),				
 	  .driver_info = NCTRL(0) | ZLP },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MF622, 0xff, 0xff, 0xff) }, /* ZTE WCDMA products */
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0002, 0xff, 0xff, 0xff),
-- 
2.17.2 (Apple Git-113)

