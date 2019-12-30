Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A19312D095
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 15:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbfL3O0Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 09:26:16 -0500
Received: from mga06.intel.com ([134.134.136.31]:56429 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727397AbfL3O0Q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 09:26:16 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 06:26:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224233458"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 06:26:15 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: [PATCH 02/15] usb: typec: Add parameter for the VDO to typec_altmode_enter()
Date:   Mon, 30 Dec 2019 17:25:58 +0300
Message-Id: <20191230142611.24921-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
References: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enter Mode Command may contain one VDO.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/altmodes/displayport.c | 5 +++--
 drivers/usb/typec/bus.c                  | 8 +++++---
 drivers/usb/typec/tcpm/tcpm.c            | 6 +++---
 drivers/usb/typec/ucsi/displayport.c     | 2 +-
 include/linux/usb/typec_altmode.h        | 4 ++--
 5 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 4092248a5936..0edfb89e04a8 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -188,7 +188,7 @@ static void dp_altmode_work(struct work_struct *work)
 
 	switch (dp->state) {
 	case DP_STATE_ENTER:
-		ret = typec_altmode_enter(dp->alt);
+		ret = typec_altmode_enter(dp->alt, NULL);
 		if (ret)
 			dev_err(&dp->alt->dev, "failed to enter mode\n");
 		break;
@@ -306,7 +306,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 
 static int dp_altmode_activate(struct typec_altmode *alt, int activate)
 {
-	return activate ? typec_altmode_enter(alt) : typec_altmode_exit(alt);
+	return activate ? typec_altmode_enter(alt, NULL) :
+			  typec_altmode_exit(alt);
 }
 
 static const struct typec_altmode_ops dp_altmode_ops = {
diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index 4116379fbd68..76e024be2502 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -84,12 +84,14 @@ EXPORT_SYMBOL_GPL(typec_altmode_notify);
 /**
  * typec_altmode_enter - Enter Mode
  * @adev: The alternate mode
+ * @vdo: VDO for the Enter Mode command
  *
  * The alternate mode drivers use this function to enter mode. The port drivers
  * use this to inform the alternate mode drivers that the partner has initiated
- * Enter Mode command.
+ * Enter Mode command. If the alternate mode does not require VDO, @vdo must be
+ * NULL.
  */
-int typec_altmode_enter(struct typec_altmode *adev)
+int typec_altmode_enter(struct typec_altmode *adev, u32 *vdo)
 {
 	struct altmode *partner = to_altmode(adev)->partner;
 	struct typec_altmode *pdev = &partner->adev;
@@ -110,7 +112,7 @@ int typec_altmode_enter(struct typec_altmode *adev)
 		return ret;
 
 	/* Enter Mode */
-	return pdev->ops->enter(pdev);
+	return pdev->ops->enter(pdev, vdo);
 }
 EXPORT_SYMBOL_GPL(typec_altmode_enter);
 
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 56fc356bc55c..f3087ef8265c 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1475,16 +1475,16 @@ static int tcpm_validate_caps(struct tcpm_port *port, const u32 *pdo,
 	return 0;
 }
 
-static int tcpm_altmode_enter(struct typec_altmode *altmode)
+static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
 {
 	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
 	u32 header;
 
 	mutex_lock(&port->lock);
-	header = VDO(altmode->svid, 1, CMD_ENTER_MODE);
+	header = VDO(altmode->svid, vdo ? 2 : 1, CMD_ENTER_MODE);
 	header |= VDO_OPOS(altmode->mode);
 
-	tcpm_queue_vdm(port, header, NULL, 0);
+	tcpm_queue_vdm(port, header, vdo, vdo ? 1 : 0);
 	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
 	mutex_unlock(&port->lock);
 
diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index d4d5189edfb8..0f1273ae086c 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -45,7 +45,7 @@ struct ucsi_dp {
  * -EOPNOTSUPP.
  */
 
-static int ucsi_displayport_enter(struct typec_altmode *alt)
+static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 {
 	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
 	struct ucsi *ucsi = dp->con->ucsi;
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index 9a88c74a1d0d..fc57fd88004f 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -55,7 +55,7 @@ static inline void *typec_altmode_get_drvdata(struct typec_altmode *altmode)
  * @activate: User callback for Enter/Exit Mode
  */
 struct typec_altmode_ops {
-	int (*enter)(struct typec_altmode *altmode);
+	int (*enter)(struct typec_altmode *altmode, u32 *vdo);
 	int (*exit)(struct typec_altmode *altmode);
 	void (*attention)(struct typec_altmode *altmode, u32 vdo);
 	int (*vdm)(struct typec_altmode *altmode, const u32 hdr,
@@ -65,7 +65,7 @@ struct typec_altmode_ops {
 	int (*activate)(struct typec_altmode *altmode, int activate);
 };
 
-int typec_altmode_enter(struct typec_altmode *altmode);
+int typec_altmode_enter(struct typec_altmode *altmode, u32 *vdo);
 int typec_altmode_exit(struct typec_altmode *altmode);
 void typec_altmode_attention(struct typec_altmode *altmode, u32 vdo);
 int typec_altmode_vdm(struct typec_altmode *altmode,
-- 
2.24.1

