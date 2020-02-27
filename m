Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD90917292D
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 21:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730009AbgB0UD0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 15:03:26 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40739 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729441AbgB0UD0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 15:03:26 -0500
Received: by mail-pl1-f195.google.com with SMTP id y1so230901plp.7
        for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2020 12:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=K8iytLqHgFDY8ynjtXVffNccHAiLLbH2CUJKo1OnDUk=;
        b=fHUY3iCBJyi+1W9cFjvAZY2qYXKF5BErAQKup2WCQcviStJR9aKKucLkgMzKg4IJnB
         U1uY+Odm1eBtPFoBG34WO5iPmIbRGffjFXqYC48q2oMiT5C9WTdzL0RflIOWyBAnjr37
         R/C5oS8B96CVUCgUTzR77DC9vlh7HNhPOmWK11Cb3U5itxKYqAbLvAXpz+fbTgRPva99
         ol84p0ATxn6vPJSpgYXsKeMh6R6pS9smN92fhJxpR/Kzslkg2AurM/NCa320YWTOMHf1
         En7zxqBNi6P2Lgz7+TSDQ49uX7XhWNaXbyXeZPDXGrWW3lNpTFXZ47Ut5KMsGSKDZQwL
         2Zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=K8iytLqHgFDY8ynjtXVffNccHAiLLbH2CUJKo1OnDUk=;
        b=Uu6AjbIutkThAGOMR00jDszZj6fwPS0zoVZqn6R7Ssa+XB9CzQBxH1Ba9dy2DD3IUY
         b+jYCUVt2RKyvEaHzSxjLS4Ifdw1eFlu5TBgQUE0zGMF4Ea04DKVd6hK56eRKM16GRbg
         SlB7i+3zQ0cqXH8b/3b1gZSZfctyITt7AEd10tlfvcNOKi4zEg1vriD4tgjN+wa4HMa6
         AtoyigWgt+YO++xvG5os6ADhLbDcZa9tRbKmhAWzI3amnmbiFXORPFoXMD4nEVljGdnq
         8skSBSxIWhBx7QfNNRfadDbT7BDZeUnTh19BVrbK52Yd99L5mlsrXvygKifnMJhjrgM0
         /ZVw==
X-Gm-Message-State: APjAAAW3CTYYE7foCX4zCX6+iO67gOoYN0kxidmHg0Beo5uJTvT1X7gT
        enCoPW29bKltaB2YPYuj8+k=
X-Google-Smtp-Source: APXvYqzmpQ5oQTKIlR8TpQTcOwGdIhBPR/SXry80nTWIDtNt8ZzxcqCU7eBzOhDgJ5EvkljpTncwGA==
X-Received: by 2002:a17:90a:1f8d:: with SMTP id x13mr666170pja.27.1582833804833;
        Thu, 27 Feb 2020 12:03:24 -0800 (PST)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id z64sm8139292pfz.23.2020.02.27.12.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 12:03:23 -0800 (PST)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v2] usb: typec: ucsi_ccg: workaround for NVIDIA test device
Date:   Thu, 27 Feb 2020 12:03:17 -0800
Message-Id: <20200227200317.21509-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
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
---
Changes from v1: Fixed comments from Heikki

 drivers/usb/typec/ucsi/ucsi.h     |  2 ++
 drivers/usb/typec/ucsi/ucsi_ccg.c | 55 ++++++++++++++++++++++++++++---
 2 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index a89112b69cd5..8e831108f481 100644
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
index 2658cda5da11..bff96d64dddf 100644
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
2.17.1

