Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEF0D272674
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 16:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727371AbgIUOAG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 10:00:06 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34166 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727356AbgIUOAG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 10:00:06 -0400
Received: by mail-lj1-f195.google.com with SMTP id v23so11218328ljd.1
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 07:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2pgMmvVc6BBJkuon8x/rXqtpns3TbySrtqQAZSWvaOE=;
        b=iwFMfk3bPMNP0TlvJuaWhQLDV591ZphhnvdvToAXqfNq+lH+s+6cxA/DOxmXN1P4Kq
         s1trMTOY0Fmnb6qrcGYFk3SBwlowKKWZIpbgoOhDi424ZG0N1PMNRn87rVupRon/c+/V
         MfLK088nOMEM2a6TBtgdijb6AmPS0Ar5dGaenHn54SGGsbzKKB5bF7hapiEYmnGwJAx4
         68blnuosMxmd0HiUBHbMrITcDKRVcRIyqhgMPk/AiYJE1xfsrNDWMOtLETR77Zzt8iPj
         891Lc/ZRiNRg1Wdjw7Ig7UOBwfhmP+eAz3af32lCbmMrcgfB9NZ/Jp/V5ENV2rr/qbVb
         shAg==
X-Gm-Message-State: AOAM532QgVm9pt531M0JHkTqgTmOfAzfa2mnq/j54+yP9D7JXLqJqVhY
        B8iYExROCE8ed/rJuOmtRus=
X-Google-Smtp-Source: ABdhPJxt8Kw0D8C7U/bO9Mdxdzf3tferk6c7J5YWwY1Mneldo05FdeSJ2MKu3okgUlVsupmMaHqqnQ==
X-Received: by 2002:a2e:964a:: with SMTP id z10mr15589284ljh.463.1600696803928;
        Mon, 21 Sep 2020 07:00:03 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id i63sm2751718lji.66.2020.09.21.07.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:00:01 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kKMMF-0006H4-7V; Mon, 21 Sep 2020 15:59:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 4/4] USB: cdc-acm: clean up no-union-descriptor handling
Date:   Mon, 21 Sep 2020 15:59:51 +0200
Message-Id: <20200921135951.24045-5-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200921135951.24045-1-johan@kernel.org>
References: <20200921135951.24045-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For interfaces that lack a union descriptor, probe for a
"combined-interface" before falling back to the call-management
descriptor instead of the other way round.

This allows for the removal of the NO_DATA_INTERFACE quirk and makes the
probe algorithm somewhat easier to follow.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/class/cdc-acm.c | 32 ++++++++++----------------------
 drivers/usb/class/cdc-acm.h | 11 +++++------
 2 files changed, 15 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index a361b937684a..357e896a4fc0 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1218,26 +1218,19 @@ static int acm_probe(struct usb_interface *intf,
 		call_intf_num = cmgmd->bDataInterface;
 
 	if (!union_header) {
-		if (call_intf_num > 0) {
+		if (intf->cur_altsetting->desc.bNumEndpoints == 3) {
+			dev_dbg(&intf->dev, "No union descriptor, assuming single interface\n");
+			combined_interfaces = 1;
+			control_interface = data_interface = intf;
+			goto look_for_collapsed_interface;
+		} else if (call_intf_num > 0) {
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
 		int class = -1;
@@ -1881,11 +1874,6 @@ static const struct usb_device_id acm_ids[] = {
 
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

