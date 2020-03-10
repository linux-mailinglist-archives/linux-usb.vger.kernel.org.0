Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0BB217F746
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2020 13:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgCJMTQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Mar 2020 08:19:16 -0400
Received: from mga17.intel.com ([192.55.52.151]:38735 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726252AbgCJMTQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Mar 2020 08:19:16 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Mar 2020 05:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,537,1574150400"; 
   d="scan'208";a="353613990"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2020 05:19:13 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH] usb: typec: ucsi_ccg: workaround for NVIDIA test device
Date:   Tue, 10 Mar 2020 15:19:12 +0300
Message-Id: <20200310121912.57879-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

NVIDIA VirtualLink (svid 0x955) has two altmode, vdo=0x1 for
VirtualLink DP mode and vdo=0x3 for NVIDIA test mode. NVIDIA
test device FTB (Function Test Board) reports altmode list with
vdo=0x3 first and then vdo=0x1. The list is:
 SVID   VDO
0xff01  0xc05
0x28de  0x8085
0x955   0x3
0x955   0x1

Current logic to assign mode value is based on order
in altmode list. This causes a mismatch of CON and SOP altmodes
since NVIDIA GPU connector has order of vdo=0x1 first and then
vdo=0x3. Fixing this by changing the order of vdo values
reported by NVIDIA test device. the new list will be:

 SVID   VDO
0xff01  0xc05
0x28de  0x8085
0x955   0x1085
0x955   0x3

Also NVIDIA VirtualLink (svid 0x955) uses pin E for display mode.
NVIDIA test device reports vdo of 0x1 so make sure vdo values
always have pin E assignement.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.h     |  2 ++
 drivers/usb/typec/ucsi/ucsi_ccg.c | 55 ++++++++++++++++++++++++++++---
 2 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 65cd2f01eaed..cc87a72ff481 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -119,12 +119,14 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_SET_PDR_ACCEPT_ROLE_SWAPS		BIT(25)
 
 /* GET_ALTERNATE_MODES command bits */
+#define UCSI_ALTMODE_RECIPIENT(_r_)		(((_r_) >> 16) & 0x7)
 #define UCSI_GET_ALTMODE_RECIPIENT(_r_)		((u64)(_r_) << 16)
 #define   UCSI_RECIPIENT_CON			0
 #define   UCSI_RECIPIENT_SOP			1
 #define   UCSI_RECIPIENT_SOP_P			2
 #define   UCSI_RECIPIENT_SOP_PP			3
 #define UCSI_GET_ALTMODE_CONNECTOR_NUMBER(_r_)	((u64)(_r_) << 24)
+#define UCSI_ALTMODE_OFFSET(_r_)		(((_r_) >> 32) & 0xff)
 #define UCSI_GET_ALTMODE_OFFSET(_r_)		((u64)(_r_) << 32)
 #define UCSI_GET_ALTMODE_NUM_ALTMODES(_r_)	((u64)(_r_) << 40)
 
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index a5b8530490db..61543573290e 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -125,6 +125,10 @@ struct version_format {
 #define CCG_FW_BUILD_NVIDIA	(('n' << 8) | 'v')
 #define CCG_OLD_FW_VERSION	(CCG_VERSION(0x31) | CCG_VERSION_PATCH(10))
 
+/* Altmode offset for NVIDIA Function Test Board (FTB) */
+#define NVIDIA_FTB_DP_OFFSET	(2)
+#define NVIDIA_FTB_DBG_OFFSET	(3)
+
 struct version_info {
 	struct version_format base;
 	struct version_format app;
@@ -477,24 +481,65 @@ static void ucsi_ccg_update_set_new_cam_cmd(struct ucsi_ccg *uc,
 	*cmd |= UCSI_SET_NEW_CAM_SET_AM(cam);
 }
 
+/*
+ * Change the order of vdo values of NVIDIA test device FTB
+ * (Function Test Board) which reports altmode list with vdo=0x3
+ * first and then vdo=0x. Current logic to assign mode value is
+ * based on order in altmode list and it causes a mismatch of CON
+ * and SOP altmodes since NVIDIA GPU connector has order of vdo=0x1
+ * first and then vdo=0x3
+ */
+static void ucsi_ccg_nvidia_altmode(struct ucsi_ccg *uc,
+				    struct ucsi_altmode *alt)
+{
+	switch (UCSI_ALTMODE_OFFSET(uc->last_cmd_sent)) {
+	case NVIDIA_FTB_DP_OFFSET:
+		if (alt[0].mid == USB_TYPEC_NVIDIA_VLINK_DBG_VDO)
+			alt[0].mid = USB_TYPEC_NVIDIA_VLINK_DP_VDO |
+				DP_CAP_DP_SIGNALING | DP_CAP_USB |
+				DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_E));
+		break;
+	case NVIDIA_FTB_DBG_OFFSET:
+		if (alt[0].mid == USB_TYPEC_NVIDIA_VLINK_DP_VDO)
+			alt[0].mid = USB_TYPEC_NVIDIA_VLINK_DBG_VDO;
+		break;
+	default:
+		break;
+	}
+}
+
 static int ucsi_ccg_read(struct ucsi *ucsi, unsigned int offset,
 			 void *val, size_t val_len)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
-	int ret;
 	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(offset);
+	struct ucsi_altmode *alt;
+	int ret;
 
 	ret = ccg_read(uc, reg, val, val_len);
 	if (ret)
 		return ret;
 
-	if (offset == UCSI_MESSAGE_IN) {
-		if (UCSI_COMMAND(uc->last_cmd_sent) == UCSI_GET_CURRENT_CAM &&
-		    uc->has_multiple_dp) {
+	if (offset != UCSI_MESSAGE_IN)
+		return ret;
+
+	switch (UCSI_COMMAND(uc->last_cmd_sent)) {
+	case UCSI_GET_CURRENT_CAM:
+		if (uc->has_multiple_dp)
 			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)val);
+		break;
+	case UCSI_GET_ALTERNATE_MODES:
+		if (UCSI_ALTMODE_RECIPIENT(uc->last_cmd_sent) ==
+		    UCSI_RECIPIENT_SOP) {
+			alt = val;
+			if (alt[0].svid == USB_TYPEC_NVIDIA_VLINK_SID)
+				ucsi_ccg_nvidia_altmode(uc, alt);
 		}
-		uc->last_cmd_sent = 0;
+		break;
+	default:
+		break;
 	}
+	uc->last_cmd_sent = 0;
 
 	return ret;
 }
-- 
2.25.1

