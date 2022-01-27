Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D66B49DF94
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 11:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239431AbiA0Kld (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jan 2022 05:41:33 -0500
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:33258
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232804AbiA0Kld (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jan 2022 05:41:33 -0500
Received: from localhost.localdomain (unknown [222.129.35.96])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 83FAB3F131;
        Thu, 27 Jan 2022 10:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643280091;
        bh=7jJ2YW3SFFqaAmAarOJGscPOA+9KiH3eMmsHQ1TJANM=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=Qup1gY/hR5d7oiEx0HgpVFDRkFlL3cOr8Mf1T71DjFIq2ajkl3P1TXekuTeqzU2Uo
         Qb8ZC7QoAxzV5xrLKQpXjjw8Y1AQXiEjwvFcQC8tTK1aZgM/NGKJXzldlFmXl0Baox
         PSbqxeEMfwuBJkL46MFkjsjwy1P5NPSh3gOaQCohWd12EYRIzhvU36DS+nWTBj8JNc
         RpQWaOTLSnzPdWEX1f53liw1vx0x2jE73r3NRfHL4J9qh9YRLJtrOLZAq87G3Jgie2
         iGprM4nfevQkibM5E7EXhNUIMnOYSq3v//RGKY987aLpN6seP2CqGIHlhOw4kofCgE
         xprM/5gNhscSQ==
From:   Aaron Ma <aaron.ma@canonical.com>
To:     Mario.Limonciello@amd.com, aaron.ma@canonical.com, kuba@kernel.org,
        henning.schild@siemens.com, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc:     davem@davemloft.net, hayeswang@realtek.com, tiwai@suse.de
Subject: [PATCH v2] net: usb: r8152: Add MAC passthrough support for RTL8153BL
Date:   Thu, 27 Jan 2022 18:41:12 +0800
Message-Id: <20220127104112.13288-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RTL8153-BL is used in Lenovo Thunderbolt4 dock.
Add the support of MAC passthrough.
This is ported from Realtek Outbox driver r8152.53.56-2.15.0.

There are 2 kinds of rules for MAC passthrough of Lenovo products,
1st USB vendor ID belongs to Lenovo, 2nd the chip of RTL8153-BL
is dedicated for Lenovo. Check the ocp data first then set ACPI object
names.

Suggested-by: Hayes Wang <hayeswang@realtek.com>
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
v1 -> v2: fix whitespace in definition.
 drivers/net/usb/r8152.c | 44 ++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index ee41088c5251..5812d52bf694 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -718,6 +718,7 @@ enum spd_duplex {
 #define AD_MASK			0xfee0
 #define BND_MASK		0x0004
 #define BD_MASK			0x0001
+#define BL_MASK			BIT(3)
 #define EFUSE			0xcfdb
 #define PASS_THRU_MASK		0x1
 
@@ -1606,31 +1607,34 @@ static int vendor_mac_passthru_addr_read(struct r8152 *tp, struct sockaddr *sa)
 	acpi_object_type mac_obj_type;
 	int mac_strlen;
 
+	/* test for -AD variant of RTL8153 */
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_MISC_0);
+	if ((ocp_data & AD_MASK) == 0x1000) {
+		/* test for MAC address pass-through bit */
+		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, EFUSE);
+		if ((ocp_data & PASS_THRU_MASK) != 1) {
+			netif_dbg(tp, probe, tp->netdev,
+					"No efuse for RTL8153-AD MAC pass through\n");
+			return -ENODEV;
+		}
+	} else {
+		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_MISC_1);
+		if (tp->version == RTL_VER_09 && (ocp_data & BL_MASK)) {
+			/* test for RTL8153BL for Lenovo */
+			tp->lenovo_macpassthru = 1;
+		} else if ((ocp_data & BND_MASK) == 0 && (ocp_data & BD_MASK) == 0) {
+			/* test for RTL8153-BND and RTL8153-BD */
+			netif_dbg(tp, probe, tp->netdev,
+					"Invalid variant for MAC pass through\n");
+			return -ENODEV;
+		}
+	}
+
 	if (tp->lenovo_macpassthru) {
 		mac_obj_name = "\\MACA";
 		mac_obj_type = ACPI_TYPE_STRING;
 		mac_strlen = 0x16;
 	} else {
-		/* test for -AD variant of RTL8153 */
-		ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_MISC_0);
-		if ((ocp_data & AD_MASK) == 0x1000) {
-			/* test for MAC address pass-through bit */
-			ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, EFUSE);
-			if ((ocp_data & PASS_THRU_MASK) != 1) {
-				netif_dbg(tp, probe, tp->netdev,
-						"No efuse for RTL8153-AD MAC pass through\n");
-				return -ENODEV;
-			}
-		} else {
-			/* test for RTL8153-BND and RTL8153-BD */
-			ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_MISC_1);
-			if ((ocp_data & BND_MASK) == 0 && (ocp_data & BD_MASK) == 0) {
-				netif_dbg(tp, probe, tp->netdev,
-						"Invalid variant for MAC pass through\n");
-				return -ENODEV;
-			}
-		}
-
 		mac_obj_name = "\\_SB.AMAC";
 		mac_obj_type = ACPI_TYPE_BUFFER;
 		mac_strlen = 0x17;
-- 
2.32.0

