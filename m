Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82E239C885
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 06:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbfHZEqh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Aug 2019 00:46:37 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43325 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfHZEqh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Aug 2019 00:46:37 -0400
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1i26tl-00010H-RL; Mon, 26 Aug 2019 04:46:34 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     stern@rowland.harvard.edu
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH 1/2] USB: storage: ums-realtek: Rename module parameter auto_delink_en to auto_delink_mode
Date:   Mon, 26 Aug 2019 12:46:29 +0800
Message-Id: <20190826044630.21949-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The option named "auto_delink_en" is a bit misleading, as setting it to
false doesn't really disable auto-delink but let auto-delink be firmware
controlled.

Rename it to reflect the real usage of this parameter.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/usb/storage/realtek_cr.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
index cc794e25a0b6..4d86cfcc0b40 100644
--- a/drivers/usb/storage/realtek_cr.c
+++ b/drivers/usb/storage/realtek_cr.c
@@ -36,9 +36,9 @@ MODULE_DESCRIPTION("Driver for Realtek USB Card Reader");
 MODULE_AUTHOR("wwang <wei_wang@realsil.com.cn>");
 MODULE_LICENSE("GPL");
 
-static int auto_delink_en = 1;
-module_param(auto_delink_en, int, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(auto_delink_en, "enable auto delink");
+static int auto_delink_mode = 1;
+module_param(auto_delink_mode, int, S_IRUGO | S_IWUSR);
+MODULE_PARM_DESC(auto_delink_mode, "auto delink mode (0=firmware, 1=software [default])");
 
 #ifdef CONFIG_REALTEK_AUTOPM
 static int ss_en = 1;
@@ -567,7 +567,7 @@ static int config_autodelink_after_power_on(struct us_data *us)
 	if (retval < 0)
 		return -EIO;
 
-	if (auto_delink_en) {
+	if (auto_delink_mode) {
 		CLR_BIT(value, 0);
 		CLR_BIT(value, 1);
 		SET_BIT(value, 2);
@@ -630,7 +630,7 @@ static int config_autodelink_before_power_down(struct us_data *us)
 	if (!CHK_AUTO_DELINK(chip))
 		return 0;
 
-	if (auto_delink_en) {
+	if (auto_delink_mode) {
 		retval = rts51x_read_mem(us, 0xFE77, &value, 1);
 		if (retval < 0)
 			return -EIO;
-- 
2.17.1

