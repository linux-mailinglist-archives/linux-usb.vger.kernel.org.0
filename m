Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 874B1107C27
	for <lists+linux-usb@lfdr.de>; Sat, 23 Nov 2019 01:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfKWAsS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Nov 2019 19:48:18 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46756 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfKWAsS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Nov 2019 19:48:18 -0500
Received: by mail-pf1-f195.google.com with SMTP id 193so4332039pfc.13
        for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2019 16:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=gIBO8UIv78cx4WUUkCtWQrDmqs5yHVMINFebD0Kk1Tg=;
        b=vMGLql/zbdjjGomnk0tOM19xXQOJAn0JscRUJ34fuUtPRh+ggSSwGe7VINZWL5EZmt
         KeWX8hjjJLmwhfZxMNtmD5uJakbZdoiVpdcL+ga2lq6u6ohaBzWpwnu8lF1IVO/uBgp9
         iCCfHgNoqpEj/xQAukGzl5t7LcLvaSSRsHuR4OrZ0QXZPruY+bsm95ivKLX3lmgRy2xj
         +wcSRf5fcLfPFyc6MIx+ZsRkEobNnjB9l8ZbkvBqfDPU4GkdxtVZKrp9HNEYi8FTj6bR
         +n4Bz3ok0CUUqSwug9be2qsnKY1hZ0W1T2ha3qj2d+F+hlLLeXjHw+z0t0CrSirsT7pC
         RmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gIBO8UIv78cx4WUUkCtWQrDmqs5yHVMINFebD0Kk1Tg=;
        b=U2TT8WIMRMFs1JYCYpAZ0cP8dagTustBsAZvp483KFnbASyeBgAsICQ5CsG2OnTijg
         nD8L9VqlJ2wmRAH2OKb8psJLgnSmB5x+EtoTWoE806KP0RamGUcsExJ8CKiYBxjMaxdD
         EAEkYnUuhuBduCEnDcNKDUvLMpDxw/EdFE15n+eNoOYm4SQCgBowUx8pVlAbJkSQxfWB
         iGtQn3sORqPsccBpTrRL4MTramu1bxthqNUeQ+egsnXwJGXC5DD9YQjHbgHBZPyWnLLv
         cI4FfSss1F1/LhHPavZYVJTP1jVMJThys84g04Z9tZ3KaHl2RQM67P6VWxz7k2lJ7s5E
         OPkA==
X-Gm-Message-State: APjAAAX9poUd3A96mNOUiDPOwjIGYolZ32xpGwJQ6NhV5/RO7WNt0QaC
        kdzXFGTiP124KrFmipacp10=
X-Google-Smtp-Source: APXvYqwBm1w7J6Fil91taBUqVj0vXS4bmDwwTcJq9Zayu2P1Mair5M7PTHe1Z5phoqAxrce/ICtPfQ==
X-Received: by 2002:a63:4b52:: with SMTP id k18mr18452641pgl.394.1574470097555;
        Fri, 22 Nov 2019 16:48:17 -0800 (PST)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id h26sm8316875pfo.93.2019.11.22.16.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 16:48:16 -0800 (PST)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v6] usb: typec: ucsi: add support for separate DP altmode devices
Date:   Fri, 22 Nov 2019 16:43:47 -0800
Message-Id: <20191123004347.5127-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

CCGx controller used on NVIDIA GPU card has two separate display
altmode for two DP pin assignments. UCSI specification doesn't
prohibits using separate display altmode.

Current UCSI Type-C framework expects only one display altmode for
all DP pin assignment. This patch squashes two separate display
altmode into single altmode to support controllers with separate
display altmode. We first read all the alternate modes of connector
and then run through it to know if there are separate display
altmodes. If so, it prepares a new port altmode set after squashing
two or more separate altmodes into one.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
Original discussion on this issue is at [1]

Changes frpm v5->v6
	- Rebased to Greg's latest usb-testing branch

1. https://marc.info/?l=linux-usb&m=154905866830998&w=2

 drivers/usb/typec/ucsi/ucsi.c     |  65 ++++++++--
 drivers/usb/typec/ucsi/ucsi.h     |  10 ++
 drivers/usb/typec/ucsi/ucsi_ccg.c | 191 +++++++++++++++++++++++++++++-
 3 files changed, 253 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 4459bc68aa33..f028658d1b1a 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -323,12 +323,17 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 	int max_altmodes = UCSI_MAX_ALTMODES;
 	struct typec_altmode_desc desc;
 	struct ucsi_altmode alt[2];
+	struct ucsi_altmode orig[UCSI_MAX_ALTMODES];
+	struct ucsi_altmode updated[UCSI_MAX_ALTMODES];
+	struct ucsi *ucsi = con->ucsi;
+	bool multi_dp = false;
 	u64 command;
 	int num = 1;
 	int ret;
 	int len;
 	int j;
 	int i;
+	int k = 0;
 
 	if (!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_DETAILS))
 		return 0;
@@ -339,6 +344,10 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 	if (recipient == UCSI_RECIPIENT_CON)
 		max_altmodes = con->ucsi->cap.num_alt_modes;
 
+	memset(orig, 0, sizeof(orig));
+	memset(updated, 0, sizeof(updated));
+
+	/* First get all the alternate modes */
 	for (i = 0; i < max_altmodes;) {
 		memset(alt, 0, sizeof(alt));
 		command = UCSI_GET_ALTERNATE_MODES;
@@ -346,32 +355,66 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 		command |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
 		command |= UCSI_GET_ALTMODE_OFFSET(i);
 		len = ucsi_run_command(con->ucsi, command, alt, sizeof(alt));
-		if (len <= 0)
+		/*
+		 * We are collecting all altmodes first and then registering.
+		 * Some type-C device will return zero length data beyond last
+		 * alternate modes. We should not return if length is zero.
+		 */
+		if (len < 0)
 			return len;
 
+		/* We got all altmodes, now break out and register them */
+		if (!len)
+			break;
+
 		/*
 		 * This code is requesting one alt mode at a time, but some PPMs
 		 * may still return two. If that happens both alt modes need be
-		 * registered and the offset for the next alt mode has to be
+		 * saved and the offset for the next alt mode has to be
 		 * incremented.
 		 */
 		num = len / sizeof(alt[0]);
 		i += num;
 
 		for (j = 0; j < num; j++) {
-			if (!alt[j].svid)
-				return 0;
 
-			memset(&desc, 0, sizeof(desc));
-			desc.vdo = alt[j].mid;
-			desc.svid = alt[j].svid;
-			desc.roles = TYPEC_PORT_DRD;
+			if (!alt[j].svid) {
+				/* break out of outer loop and register */
+				i = max_altmodes;
+				break;
+			}
 
-			ret = ucsi_register_altmode(con, &desc, recipient);
-			if (ret)
-				return ret;
+			orig[k].mid = alt[j].mid;
+			orig[k].svid = alt[j].svid;
+			k++;
 		}
 	}
+	/*
+	 * Update the original altmode table as some ppms may report
+	 * multiple DP altmodes.
+	 */
+	if (recipient == UCSI_RECIPIENT_CON && ucsi->ops->update_altmodes)
+		multi_dp = ucsi->ops->update_altmodes(ucsi, orig, updated);
+
+	/* now register altmodes */
+	for (i = 0; i < max_altmodes; i++) {
+		memset(&desc, 0, sizeof(desc));
+		if (multi_dp && recipient == UCSI_RECIPIENT_CON) {
+			desc.svid = updated[i].svid;
+			desc.vdo = updated[i].mid;
+		} else {
+			desc.svid = orig[i].svid;
+			desc.vdo = orig[i].mid;
+		}
+		desc.roles = TYPEC_PORT_DRD;
+
+		if (!desc.svid)
+			return 0;
+
+		ret = ucsi_register_altmode(con, &desc, recipient);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 8569bbd3762f..08ecdf0dcbcc 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -11,6 +11,7 @@
 /* -------------------------------------------------------------------------- */
 
 struct ucsi;
+struct ucsi_altmode;
 
 /* UCSI offsets (Bytes) */
 #define UCSI_VERSION			0
@@ -35,6 +36,7 @@ struct ucsi;
  * @read: Read operation
  * @sync_write: Blocking write operation
  * @async_write: Non-blocking write operation
+ * @update_altmodes: Squashes duplicate DP altmodes
  *
  * Read and write routines for UCSI interface. @sync_write must wait for the
  * Command Completion Event from the PPM before returning, and @async_write must
@@ -47,6 +49,8 @@ struct ucsi_operations {
 			  const void *val, size_t val_len);
 	int (*async_write)(struct ucsi *ucsi, unsigned int offset,
 			   const void *val, size_t val_len);
+	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
+				struct ucsi_altmode *updated);
 };
 
 struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops);
@@ -82,6 +86,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_GET_ERROR_STATUS		0x13
 
 #define UCSI_CONNECTOR_NUMBER(_num_)		((u64)(_num_) << 16)
+#define UCSI_COMMAND(_cmd_)			((_cmd_) & 0xff)
 
 /* CONNECTOR_RESET command bits */
 #define UCSI_CONNECTOR_RESET_HARD		BIT(23) /* Deprecated in v1.1 */
@@ -140,6 +145,11 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_ERROR_PPM_POLICY_CONFLICT		BIT(11)
 #define UCSI_ERROR_SWAP_REJECTED		BIT(12)
 
+#define UCSI_SET_NEW_CAM_ENTER(x)		(((x) >> 23) & 0x1)
+#define UCSI_SET_NEW_CAM_GET_AM(x)		(((x) >> 24) & 0xff)
+#define UCSI_SET_NEW_CAM_AM_MASK		(0xff << 24)
+#define UCSI_SET_NEW_CAM_SET_AM(x)		(((x) & 0xff) << 24)
+#define UCSI_CMD_CONNECTOR_MASK			(0x7)
 /* Data structure filled by PPM in response to GET_CAPABILITY command. */
 struct ucsi_capability {
 	u32 attributes;
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 3370b3fc37b1..22c498688512 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/usb/typec_dp.h>
 
 #include <asm/unaligned.h>
 #include "ucsi.h"
@@ -173,6 +174,15 @@ struct ccg_resp {
 	u8 length;
 };
 
+struct ucsi_ccg_altmode {
+	u16 svid;
+	u32 mid;
+	u8 linked_idx;
+	u8 active_idx;
+#define UCSI_MULTI_DP_INDEX	(0xff)
+	bool checked;
+} __packed;
+
 struct ucsi_ccg {
 	struct device *dev;
 	struct ucsi *ucsi;
@@ -198,6 +208,11 @@ struct ucsi_ccg {
 	struct work_struct pm_work;
 
 	struct completion complete;
+
+	u64 last_cmd_sent;
+	bool has_multiple_dp;
+	struct ucsi_ccg_altmode orig[UCSI_MAX_ALTMODES];
+	struct ucsi_ccg_altmode updated[UCSI_MAX_ALTMODES];
 };
 
 static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
@@ -319,12 +334,169 @@ static int ucsi_ccg_init(struct ucsi_ccg *uc)
 	return -ETIMEDOUT;
 }
 
+static void ucsi_ccg_update_get_current_cam_cmd(struct ucsi_ccg *uc, u8 *data)
+{
+	u8 cam, new_cam;
+
+	cam = data[0];
+	new_cam = uc->orig[cam].linked_idx;
+	uc->updated[new_cam].active_idx = cam;
+	data[0] = new_cam;
+}
+
+static bool ucsi_ccg_update_altmodes(struct ucsi *ucsi,
+				     struct ucsi_altmode *orig,
+				     struct ucsi_altmode *updated)
+{
+	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
+	struct ucsi_ccg_altmode *alt, *new_alt;
+	int i, j, k = 0;
+	bool found = false;
+
+	alt = uc->orig;
+	new_alt = uc->updated;
+	memset(uc->updated, 0, sizeof(uc->updated));
+
+	/*
+	 * Copy original connector altmodes to new structure.
+	 * We need this before second loop since second loop
+	 * checks for duplicate altmodes.
+	 */
+	for (i = 0; i < UCSI_MAX_ALTMODES; i++) {
+		alt[i].svid = orig[i].svid;
+		alt[i].mid = orig[i].mid;
+		if (!alt[i].svid)
+			break;
+	}
+
+	for (i = 0; i < UCSI_MAX_ALTMODES; i++) {
+		if (!alt[i].svid)
+			break;
+
+		/* already checked and considered */
+		if (alt[i].checked)
+			continue;
+
+		if (!DP_CONF_GET_PIN_ASSIGN(alt[i].mid)) {
+			/* Found Non DP altmode */
+			new_alt[k].svid = alt[i].svid;
+			new_alt[k].mid |= alt[i].mid;
+			new_alt[k].linked_idx = i;
+			alt[i].linked_idx = k;
+			updated[k].svid = new_alt[k].svid;
+			updated[k].mid = new_alt[k].mid;
+			k++;
+			continue;
+		}
+
+		for (j = i + 1; j < UCSI_MAX_ALTMODES; j++) {
+			if (alt[i].svid != alt[j].svid ||
+			    !DP_CONF_GET_PIN_ASSIGN(alt[j].mid)) {
+				continue;
+			} else {
+				/* Found duplicate DP mode */
+				new_alt[k].svid = alt[i].svid;
+				new_alt[k].mid |= alt[i].mid | alt[j].mid;
+				new_alt[k].linked_idx = UCSI_MULTI_DP_INDEX;
+				alt[i].linked_idx = k;
+				alt[j].linked_idx = k;
+				alt[j].checked = true;
+				found = true;
+			}
+		}
+		if (found) {
+			uc->has_multiple_dp = true;
+		} else {
+			/* Didn't find any duplicate DP altmode */
+			new_alt[k].svid = alt[i].svid;
+			new_alt[k].mid |= alt[i].mid;
+			new_alt[k].linked_idx = i;
+			alt[i].linked_idx = k;
+		}
+		updated[k].svid = new_alt[k].svid;
+		updated[k].mid = new_alt[k].mid;
+		k++;
+	}
+	return found;
+}
+
+static void ucsi_ccg_update_set_new_cam_cmd(struct ucsi_ccg *uc,
+					    struct ucsi_connector *con,
+					    u64 *cmd)
+{
+	struct ucsi_ccg_altmode *new_port, *port;
+	struct typec_altmode *alt = NULL;
+	u8 new_cam, cam, pin;
+	bool enter_new_mode;
+	int i, j, k = 0xff;
+
+	port = uc->orig;
+	new_cam = UCSI_SET_NEW_CAM_GET_AM(*cmd);
+	new_port = &uc->updated[new_cam];
+	cam = new_port->linked_idx;
+	enter_new_mode = UCSI_SET_NEW_CAM_ENTER(*cmd);
+
+	/*
+	 * If CAM is UCSI_MULTI_DP_INDEX then this is DP altmode
+	 * with multiple DP mode. Find out CAM for best pin assignement
+	 * among all DP mode. Priorite pin E->D->C after making sure
+	 * the partner supports that pin.
+	 */
+	if (cam == UCSI_MULTI_DP_INDEX) {
+		if (enter_new_mode) {
+			for (i = 0; con->partner_altmode[i]; i++) {
+				alt = con->partner_altmode[i];
+				if (alt->svid == new_port->svid)
+					break;
+			}
+			/*
+			 * alt will always be non NULL since this is
+			 * UCSI_SET_NEW_CAM command and so there will be
+			 * atleast one con->partner_altmode[i] with svid
+			 * matching with new_port->svid.
+			 */
+			for (j = 0; port[j].svid; j++) {
+				pin = DP_CONF_GET_PIN_ASSIGN(port[j].mid);
+				if (alt && port[j].svid == alt->svid &&
+				    (pin & DP_CONF_GET_PIN_ASSIGN(alt->vdo))) {
+					/* prioritize pin E->D->C */
+					if (k == 0xff || (k != 0xff && pin >
+					    DP_CONF_GET_PIN_ASSIGN(port[k].mid))
+					    ) {
+						k = j;
+					}
+				}
+			}
+			cam = k;
+			new_port->active_idx = cam;
+		} else {
+			cam = new_port->active_idx;
+		}
+	}
+	*cmd &= ~UCSI_SET_NEW_CAM_AM_MASK;
+	*cmd |= UCSI_SET_NEW_CAM_SET_AM(cam);
+}
+
 static int ucsi_ccg_read(struct ucsi *ucsi, unsigned int offset,
 			 void *val, size_t val_len)
 {
+	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
+	int ret;
 	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(offset);
 
-	return ccg_read(ucsi_get_drvdata(ucsi), reg, val, val_len);
+	ret = ccg_read(uc, reg, val, val_len);
+	if (ret)
+		return ret;
+
+	if (offset == UCSI_MESSAGE_IN) {
+		if (UCSI_COMMAND(uc->last_cmd_sent) == UCSI_GET_CURRENT_CAM &&
+		    uc->has_multiple_dp) {
+			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)val);
+		}
+		uc->last_cmd_sent = 0;
+	}
+
+	return ret;
 }
 
 static int ucsi_ccg_async_write(struct ucsi *ucsi, unsigned int offset,
@@ -339,12 +511,26 @@ static int ucsi_ccg_sync_write(struct ucsi *ucsi, unsigned int offset,
 			       const void *val, size_t val_len)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
+	struct ucsi_connector *con;
+	int con_index;
 	int ret;
 
 	mutex_lock(&uc->lock);
 	pm_runtime_get_sync(uc->dev);
 	set_bit(DEV_CMD_PENDING, &uc->flags);
 
+	if (offset == UCSI_CONTROL && val_len == sizeof(uc->last_cmd_sent)) {
+		uc->last_cmd_sent = *(u64 *)val;
+
+		if (UCSI_COMMAND(uc->last_cmd_sent) == UCSI_SET_NEW_CAM &&
+		    uc->has_multiple_dp) {
+			con_index =  (uc->last_cmd_sent >> 16) &
+					UCSI_CMD_CONNECTOR_MASK;
+			con = &uc->ucsi->connector[con_index - 1];
+			ucsi_ccg_update_set_new_cam_cmd(uc, con, (u64 *)val);
+		}
+	}
+
 	ret = ucsi_ccg_async_write(ucsi, offset, val, val_len);
 	if (ret)
 		goto err_clear_bit;
@@ -363,7 +549,8 @@ static int ucsi_ccg_sync_write(struct ucsi *ucsi, unsigned int offset,
 static const struct ucsi_operations ucsi_ccg_ops = {
 	.read = ucsi_ccg_read,
 	.sync_write = ucsi_ccg_sync_write,
-	.async_write = ucsi_ccg_async_write
+	.async_write = ucsi_ccg_async_write,
+	.update_altmodes = ucsi_ccg_update_altmodes
 };
 
 static irqreturn_t ccg_irq_handler(int irq, void *data)
-- 
2.17.1

