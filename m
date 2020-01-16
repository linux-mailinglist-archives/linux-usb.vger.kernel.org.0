Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96CDF13D2BC
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2020 04:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729692AbgAPDdD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 22:33:03 -0500
Received: from inva021.nxp.com ([92.121.34.21]:47368 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726513AbgAPDdD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jan 2020 22:33:03 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1F1F2200639;
        Thu, 16 Jan 2020 04:33:02 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5B124200633;
        Thu, 16 Jan 2020 04:32:59 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id AB04E402A8;
        Thu, 16 Jan 2020 11:32:55 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 1/2] usb: phy: show USB charger type for user
Date:   Thu, 16 Jan 2020 11:28:52 +0800
Message-Id: <1579145333-1657-1-git-send-email-peter.chen@nxp.com>
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
Changes for v4:
- No changes.

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

