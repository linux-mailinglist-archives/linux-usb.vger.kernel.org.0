Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0F479C886
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 06:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729658AbfHZEqk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Aug 2019 00:46:40 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43330 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfHZEqj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Aug 2019 00:46:39 -0400
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1i26tp-00014D-8f; Mon, 26 Aug 2019 04:46:37 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     stern@rowland.harvard.edu
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH 2/2] USB: storage: ums-realtek: Enable auto-delink optionally
Date:   Mon, 26 Aug 2019 12:46:30 +0800
Message-Id: <20190826044630.21949-2-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826044630.21949-1-kai.heng.feng@canonical.com>
References: <20190826044630.21949-1-kai.heng.feng@canonical.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Auto-delink requires writing special registers to ums-realtek device.
Unconditionally enable auto-delink may break newer devices.

So only enable auto-delink by default for the original three IDs,
0x0138, 0x0158 and 0x0159.

Realtek is working on a patch to properly support auto-delink for other
IDs.

BugLink: https://bugs.launchpad.net/bugs/1838886
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/usb/storage/realtek_cr.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
index 4d86cfcc0b40..376f41d0cbc3 100644
--- a/drivers/usb/storage/realtek_cr.c
+++ b/drivers/usb/storage/realtek_cr.c
@@ -36,6 +36,10 @@ MODULE_DESCRIPTION("Driver for Realtek USB Card Reader");
 MODULE_AUTHOR("wwang <wei_wang@realsil.com.cn>");
 MODULE_LICENSE("GPL");
 
+static int auto_delink_enable = -1;
+module_param(auto_delink_enable, int, S_IRUGO | S_IWUSR);
+MODULE_PARM_DESC(auto_delink_enable, "enable auto delink (-1=auto [default], 0=disable, 1=enable)");
+
 static int auto_delink_mode = 1;
 module_param(auto_delink_mode, int, S_IRUGO | S_IWUSR);
 MODULE_PARM_DESC(auto_delink_mode, "auto delink mode (0=firmware, 1=software [default])");
@@ -996,12 +1000,22 @@ static int init_realtek_cr(struct us_data *us)
 			goto INIT_FAIL;
 	}
 
-	if (CHECK_FW_VER(chip, 0x5888) || CHECK_FW_VER(chip, 0x5889) ||
-	    CHECK_FW_VER(chip, 0x5901))
-		SET_AUTO_DELINK(chip);
-	if (STATUS_LEN(chip) == 16) {
-		if (SUPPORT_AUTO_DELINK(chip))
+	if (auto_delink_enable == -1) {
+		if (CHECK_PID(chip, 0x0138) || CHECK_PID(chip, 0x0158) ||
+		    CHECK_PID(chip, 0x0159))
+			auto_delink_enable = 1;
+		else
+			auto_delink_enable = 0;
+	}
+
+	if (auto_delink_enable) {
+		if (CHECK_FW_VER(chip, 0x5888) || CHECK_FW_VER(chip, 0x5889) ||
+				CHECK_FW_VER(chip, 0x5901))
 			SET_AUTO_DELINK(chip);
+		if (STATUS_LEN(chip) == 16) {
+			if (SUPPORT_AUTO_DELINK(chip))
+				SET_AUTO_DELINK(chip);
+		}
 	}
 #ifdef CONFIG_REALTEK_AUTOPM
 	if (ss_en)
-- 
2.17.1

