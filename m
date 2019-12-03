Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7976610F566
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 04:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfLCDGA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Dec 2019 22:06:00 -0500
Received: from inva020.nxp.com ([92.121.34.13]:59614 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbfLCDGA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Dec 2019 22:06:00 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 250EF1A125B;
        Tue,  3 Dec 2019 04:05:59 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8DEAF1A1254;
        Tue,  3 Dec 2019 04:05:56 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0DAA0402AD;
        Tue,  3 Dec 2019 11:05:52 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH RESEND v2 1/2] usb: phy: show USB charger type for user
Date:   Tue,  3 Dec 2019 11:03:54 +0800
Message-Id: <1575342235-14791-1-git-send-email-peter.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Current USB charger framework only shows charger state for user, but the
user may also need charger type for further use, add support for it.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v2:
- Some string unalignment for usb_chger_type
- Add ABI documentation for USB charger uevent

 drivers/usb/phy/phy.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
index 0277f62739a2..ad2554630889 100644
--- a/drivers/usb/phy/phy.c
+++ b/drivers/usb/phy/phy.c
@@ -34,6 +34,14 @@ struct phy_devm {
 	struct notifier_block *nb;
 };
 
+static const char *const usb_chger_type[] = {
+	[UNKNOWN_TYPE]			= "USB_CHARGER_UNKNOWN_TYPE",
+	[SDP_TYPE]			= "USB_CHARGER_SDP_TYPE",
+	[CDP_TYPE]			= "USB_CHARGER_CDP_TYPE",
+	[DCP_TYPE]			= "USB_CHARGER_DCP_TYPE",
+	[ACA_TYPE]			= "USB_CHARGER_ACA_TYPE",
+};
+
 static struct usb_phy *__usb_find_phy(struct list_head *list,
 	enum usb_phy_type type)
 {
@@ -98,7 +106,8 @@ static void usb_phy_notify_charger_work(struct work_struct *work)
 {
 	struct usb_phy *usb_phy = container_of(work, struct usb_phy, chg_work);
 	char uchger_state[50] = { 0 };
-	char *envp[] = { uchger_state, NULL };
+	char uchger_type[50] = { 0 };
+	char *envp[] = { uchger_state, uchger_type, NULL };
 	unsigned int min, max;
 
 	switch (usb_phy->chg_state) {
@@ -122,6 +131,8 @@ static void usb_phy_notify_charger_work(struct work_struct *work)
 		return;
 	}
 
+	snprintf(uchger_type, ARRAY_SIZE(uchger_type),
+		 "USB_CHARGER_TYPE=%s", usb_chger_type[usb_phy->chg_type]);
 	kobject_uevent_env(&usb_phy->dev->kobj, KOBJ_CHANGE, envp);
 }
 
-- 
2.17.1

