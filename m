Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE71F2722A6
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 13:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgIULgX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 07:36:23 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44287 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgIULgV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 07:36:21 -0400
Received: by mail-lf1-f68.google.com with SMTP id d15so13588139lfq.11
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 04:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mT/W9gPoT8HPtWMjLt/eX8O8tgNIOA/33FYtdIYgctA=;
        b=X7U4f9Y/We8XmZhp8SQL/j6FaM78XylWUvR+gtK1IUSY5jAzCDMmoHhDBjwllquVSS
         49vXXpl73qZ+5C5NWIoS/k5SzLy1YXdWqMmKjVM1xxxn8HxSP7RlvTKdBv6ec0zwQrL0
         QwqHJWn1KX7DI+DTc03qbupFPqi2RVhdvNe6JtL9m2ufM0VirC/qdCUPbRsBc4DeRhMH
         RvzVUUV5GC7o651TPznrYEFUz/FCOeEG4oyZzOBgOW2Y1JMjtt/WiEXkwiryZ4XI6XRc
         Ft7iSte7DnAkegeh4HKtnU2vyGxppZ/316zWH+yxXaI6HszFgrVppcDbVLel46oLJtj/
         +DFg==
X-Gm-Message-State: AOAM531qTKnbdecxFdzYScAjmyWvWHFiNjgVYPbJKiyc6pugr88jDAC4
        H9dNrfGpfKppx5OPp24sH84=
X-Google-Smtp-Source: ABdhPJz3S43zAcu/gERGOeZM2BBbVIMeWWs8WqMB4g7GOzNJi9sD7lAR2GjstKfBNQfrsfYd3+y7QQ==
X-Received: by 2002:a05:6512:3191:: with SMTP id i17mr14796436lfe.460.1600688179495;
        Mon, 21 Sep 2020 04:36:19 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id b28sm2489744lfq.107.2020.09.21.04.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:36:18 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kKK79-0008OR-Dx; Mon, 21 Sep 2020 13:36:11 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>,
        Johan Hovold <johan@kernel.org>
Subject: [RFC 4/4] USB: cdc-acm: clean up handling of quirky devices
Date:   Mon, 21 Sep 2020 13:35:25 +0200
Message-Id: <20200921113525.32187-5-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200921113525.32187-1-johan@kernel.org>
References: <20200921113525.32187-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Instead of falling back to "combined-interface" probing when detecting
broken union and call-management descriptors, assume all interfaces with
three endpoints are of "combined-interface" type.

This allows for the removal of the NO_DATA_INTERFACE quirk and makes the
probe algorithm somewhat easier to follow.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/class/cdc-acm.c | 44 ++++++++++---------------------------
 drivers/usb/class/cdc-acm.h | 11 +++++-----
 2 files changed, 16 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 2758e295871e..eda883ce6d9d 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1217,44 +1217,27 @@ static int acm_probe(struct usb_interface *intf,
 	if (cmgmd)
 		call_intf_num = cmgmd->bDataInterface;
 
+	if (intf->cur_altsetting->desc.bNumEndpoints == 3) {
+		dev_dbg(&intf->dev, "assuming single interface\n");
+		combined_interfaces = 1;
+		control_interface = data_interface = intf;
+		goto look_for_collapsed_interface;
+	}
+
 	if (!union_header) {
 		if (call_intf_num > 0) {
 			dev_dbg(&intf->dev, "No union descriptor, using call management descriptor\n");
-			/* quirks for Droids MuIn LCD */
-			if (quirks & NO_DATA_INTERFACE) {
-				data_interface = usb_ifnum_to_if(usb_dev, 0);
-			} else {
-				data_intf_num = call_intf_num;
-				data_interface = usb_ifnum_to_if(usb_dev, data_intf_num);
-			}
+			data_intf_num = call_intf_num;
+			data_interface = usb_ifnum_to_if(usb_dev, data_intf_num);
 			control_interface = intf;
 		} else {
-			if (intf->cur_altsetting->desc.bNumEndpoints != 3) {
-				dev_dbg(&intf->dev,"No union descriptor, giving up\n");
-				return -ENODEV;
-			} else {
-				dev_warn(&intf->dev,"No union descriptor, testing for castrated device\n");
-				combined_interfaces = 1;
-				control_interface = data_interface = intf;
-				goto look_for_collapsed_interface;
-			}
+			dev_dbg(&intf->dev, "No union descriptor, giving up\n");
+			return -ENODEV;
 		}
 	} else {
-		int class = -1;
-
 		data_intf_num = union_header->bSlaveInterface0;
 		control_interface = usb_ifnum_to_if(usb_dev, union_header->bMasterInterface0);
 		data_interface = usb_ifnum_to_if(usb_dev, data_intf_num);
-
-		if (control_interface)
-			class = control_interface->cur_altsetting->desc.bInterfaceClass;
-
-		if (class != USB_CLASS_COMM && class != USB_CLASS_CDC_DATA) {
-			dev_warn(&intf->dev, "Broken union descriptor, assuming single interface\n");
-			combined_interfaces = 1;
-			control_interface = data_interface = intf;
-			goto look_for_collapsed_interface;
-		}
 	}
 
 	if (!control_interface || !data_interface) {
@@ -1881,11 +1864,6 @@ static const struct usb_device_id acm_ids[] = {
 
 	/* NOTE: non-Nokia COMM/ACM/0xff is likely MSFT RNDIS... NOT a modem! */
 
-	/* Support for Droids MuIn LCD */
-	{ USB_DEVICE(0x04d8, 0x000b),
-	.driver_info = NO_DATA_INTERFACE,
-	},
-
 #if IS_ENABLED(CONFIG_INPUT_IMS_PCU)
 	{ USB_DEVICE(0x04d8, 0x0082),	/* Application mode */
 	.driver_info = IGNORE_DEVICE,
diff --git a/drivers/usb/class/cdc-acm.h b/drivers/usb/class/cdc-acm.h
index b7174a0098a5..b2135095898f 100644
--- a/drivers/usb/class/cdc-acm.h
+++ b/drivers/usb/class/cdc-acm.h
@@ -135,9 +135,8 @@ struct acm {
 #define NO_UNION_NORMAL			BIT(0)
 #define SINGLE_RX_URB			BIT(1)
 #define NO_CAP_LINE			BIT(2)
-#define NO_DATA_INTERFACE		BIT(4)
-#define IGNORE_DEVICE			BIT(5)
-#define QUIRK_CONTROL_LINE_STATE	BIT(6)
-#define CLEAR_HALT_CONDITIONS		BIT(7)
-#define SEND_ZERO_PACKET		BIT(8)
-#define DISABLE_ECHO			BIT(9)
+#define IGNORE_DEVICE			BIT(3)
+#define QUIRK_CONTROL_LINE_STATE	BIT(4)
+#define CLEAR_HALT_CONDITIONS		BIT(5)
+#define SEND_ZERO_PACKET		BIT(6)
+#define DISABLE_ECHO			BIT(7)
-- 
2.26.2

