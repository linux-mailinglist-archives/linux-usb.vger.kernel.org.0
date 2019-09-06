Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 269CAABE23
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2019 18:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395050AbfIFQ5j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Sep 2019 12:57:39 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41230 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfIFQ5i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Sep 2019 12:57:38 -0400
Received: by mail-pf1-f196.google.com with SMTP id b13so4875944pfo.8
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2019 09:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=xCGioBDMF24yWNTIGYPpn+xmZRHxCmvWDaaVgxRmkyk=;
        b=j7SToQ+M+9JJA6TnBlmlfpDCJU9rHpc5u8fePY5EmUtW8tF+u5hvrCWIQnzypPWPGt
         Csog26iOPIN9bAVPB+SEKqHUBrfbqpRrzdqjckUjHj1WwXNYouF3dqMFz6wjBDH81gtB
         7xId1m5KvYWLMgQBC06QjHoyO650wl52JWgpvDD/iFMYOmyyowL75Sef3cY27VOHhkpj
         voP4R9TrfJ5gLuGRzH7O84IASnDROYHxbZ2TI+BzzMNFXbGTEfZginhxQImwXMzPrCjY
         e4stXJ0cE6kRmOfuzuzP15Sv4zG0fCPHNkWleZpCxWHWgyQYVbO3DQw5Bnyepfh9zgD3
         oqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xCGioBDMF24yWNTIGYPpn+xmZRHxCmvWDaaVgxRmkyk=;
        b=Ez1SVagATTtyjB2pq+CCFqChTlUl/CGAQMg7iiveu61PYwFCmSdy0bb4JE1NvDmS/6
         8CqCV748rDSroZ43XfIJ13JFBSVBnSSrgbMdjO0+c1vCRpbjg1L+eTZGFWM30mllfafF
         BfI4hLY5aRFJB+zrO8tREbyWLHF4JBkRu5HYjhBIg8dZMNFTWbST3HsedxlKSWhpumj+
         zlbf5eIVDZf5k1M2hH8RUNgVio4KPPUdtRyJGGEYFGEKzH2XjJNq7itWO0XYPktPQDx6
         ijsDNOzpu5tDZyzUDeStLdt3kx43IrcI8rWzyvezADGzpX7RTM6IQkdAoVngWpj1Tg5F
         wCgg==
X-Gm-Message-State: APjAAAWV8sA/6vLDWbsUOZ1aWvmxDuFUKuV+AZAleSCG35J2iPc171ke
        gJ2M58tjAWOmJE5P4Cb65hU=
X-Google-Smtp-Source: APXvYqyvG1Cak76EfISCAN82SBmTRX5C3PvujNTnwEhCdwpQJoDWzr6EJ72kWJoVW2i5NzccVtCmLg==
X-Received: by 2002:a17:90a:3524:: with SMTP id q33mr10454019pjb.37.1567789057791;
        Fri, 06 Sep 2019 09:57:37 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id d10sm7077151pfh.8.2019.09.06.09.57.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Sep 2019 09:57:37 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v5] usb: typec: ucsi: add support for separate DP altmode devices
Date:   Fri,  6 Sep 2019 09:55:16 -0700
Message-Id: <20190906165516.24006-1-ajayg@nvidia.com>
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

Change from v4->v5
	- Fix comments style as per Heikki's review

1. https://marc.info/?l=linux-usb&m=154905866830998&w=2

 drivers/usb/typec/ucsi/ucsi.c     |  68 +++++++++--
 drivers/usb/typec/ucsi/ucsi.h     |   8 ++
 drivers/usb/typec/ucsi/ucsi_ccg.c | 181 +++++++++++++++++++++++++++++-
 3 files changed, 244 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ba288b964dc8..2903fb96b893 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -346,12 +346,17 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 	int max_altmodes = UCSI_MAX_ALTMODES;
 	struct typec_altmode_desc desc;
 	struct ucsi_altmode alt[2];
+	struct ucsi_altmode orig[UCSI_MAX_ALTMODES];
+	struct ucsi_altmode updated[UCSI_MAX_ALTMODES];
+	struct ucsi *ucsi = con->ucsi;
+	bool multi_dp = false;
 	struct ucsi_control ctrl;
 	int num = 1;
 	int ret;
 	int len;
 	int j;
 	int i;
+	int k = 0;
 
 	if (!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_DETAILS))
 		return 0;
@@ -362,35 +367,74 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 	if (recipient == UCSI_RECIPIENT_CON)
 		max_altmodes = con->ucsi->cap.num_alt_modes;
 
+	memset(orig, 0, sizeof(orig));
+	memset(updated, 0, sizeof(updated));
+
+	/* First get all the alternate modes */
 	for (i = 0; i < max_altmodes;) {
 		memset(alt, 0, sizeof(alt));
 		UCSI_CMD_GET_ALTERNATE_MODES(ctrl, recipient, con->num, i, 1);
 		len = ucsi_run_command(con->ucsi, &ctrl, alt, sizeof(alt));
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
-
-			memset(&desc, 0, sizeof(desc));
-			desc.vdo = alt[j].mid;
-			desc.svid = alt[j].svid;
-			desc.roles = TYPEC_PORT_DRD;
+			if (!alt[j].svid) {
+				/* break out of outer loop and register */
+				i = max_altmodes;
+				break;
+			}
+
+			orig[k].mid = alt[j].mid;
+			orig[k].svid = alt[j].svid;
+			k++;
+		}
+	}
 
-			ret = ucsi_register_altmode(con, &desc, recipient);
-			if (ret)
-				return ret;
+	/*
+	 * Update the original altmode table as some ppms may report
+	 * multiple DP altmodes.
+	 */
+	if (recipient == UCSI_RECIPIENT_CON && ucsi->ppm &&
+	    ucsi->ppm->update_altmodes)
+		multi_dp = ucsi->ppm->update_altmodes(ucsi->ppm, orig, updated);
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
 		}
+		desc.roles = TYPEC_PORT_DRD;
+
+		if (!desc.svid)
+			return 0;
+
+		ret = ucsi_register_altmode(con, &desc, recipient);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index de87d0b8319d..fa6d896c5531 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -231,6 +231,11 @@ struct ucsi_control {
 #define UCSI_ERROR_DEAD_BATTERY			BIT(5)
 #define UCSI_ERROR_CONTRACT_NEGOTIATION_FAIL	BIT(6)
 
+#define UCSI_SET_NEW_CAM_ENTER(x)		(((x) >> 23) & 0x1)
+#define UCSI_SET_NEW_CAM_GET_AM(x)		(((x) >> 24) & 0xff)
+#define UCSI_SET_NEW_CAM_AM_MASK		(0xff << 24)
+#define UCSI_SET_NEW_CAM_SET_AM(x)		(((x) & 0xff) << 24)
+#define UCSI_CMD_CONNECTOR_MASK			(0x7)
 /* Data structure filled by PPM in response to GET_CAPABILITY command. */
 struct ucsi_capability {
 	u32 attributes;
@@ -363,11 +368,14 @@ struct ucsi_data {
  * @data: memory location to the UCSI data structures
  * @cmd: UCSI command execution routine
  * @sync: Refresh UCSI mailbox (the data structures)
+ * @update_altmodes: Squashes duplicate DP altmodes
  */
 struct ucsi_ppm {
 	struct ucsi_data *data;
 	int (*cmd)(struct ucsi_ppm *, struct ucsi_control *);
 	int (*sync)(struct ucsi_ppm *);
+	bool (*update_altmodes)(struct ucsi_ppm *ppm, struct ucsi_altmode *orig,
+				struct ucsi_altmode *updated);
 };
 
 struct ucsi *ucsi_register_ppm(struct device *dev, struct ucsi_ppm *ppm);
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 907e20e1a71e..157ec3246d3c 100644
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
@@ -197,6 +207,10 @@ struct ucsi_ccg {
 	u16 fw_build;
 	bool run_isr; /* flag to call ISR routine during resume */
 	struct work_struct pm_work;
+
+	bool has_multiple_dp;
+	struct ucsi_ccg_altmode orig[UCSI_MAX_ALTMODES];
+	struct ucsi_ccg_altmode updated[UCSI_MAX_ALTMODES];
 };
 
 static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
@@ -389,9 +403,23 @@ static int ucsi_ccg_ack_interrupt(struct ucsi_ccg *uc)
 	return ccg_write(uc, CCGX_RAB_INTR_REG, &data, sizeof(data));
 }
 
+static void ucsi_ccg_update_get_current_cam_cmd(struct ucsi_ccg *uc,
+						struct ucsi_data *data)
+{
+	u8 cam, new_cam;
+
+	if (data->cci.data_length == 0x1) {
+		cam = data->message_in[0];
+		new_cam = uc->orig[cam].linked_idx;
+		data->message_in[0] = new_cam;
+		uc->updated[new_cam].active_idx = cam;
+	}
+}
+
 static int ucsi_ccg_sync(struct ucsi_ppm *ppm)
 {
 	struct ucsi_ccg *uc = container_of(ppm, struct ucsi_ccg, ppm);
+	struct ucsi_data *data;
 	int status;
 
 	status = ucsi_ccg_recv_data(uc);
@@ -399,12 +427,162 @@ static int ucsi_ccg_sync(struct ucsi_ppm *ppm)
 		return status;
 
 	/* ack interrupt to allow next command to run */
-	return ucsi_ccg_ack_interrupt(uc);
+	status = ucsi_ccg_ack_interrupt(uc);
+	if (status < 0)
+		return status;
+
+	data = ppm->data;
+	if (data->ctrl.alt.cmd == UCSI_GET_CURRENT_CAM && uc->has_multiple_dp)
+		ucsi_ccg_update_get_current_cam_cmd(uc, data);
+
+	return status;
+}
+
+static bool ucsi_ccg_update_altmodes(struct ucsi_ppm *ppm,
+				     struct ucsi_altmode *orig,
+				     struct ucsi_altmode *updated)
+{
+	struct ucsi_ccg *uc = container_of(ppm, struct ucsi_ccg, ppm);
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
+					    struct ucsi_control *ctrl)
+{
+	struct ucsi_ccg_altmode *new_port, *port;
+	struct typec_altmode *alt = NULL;
+	u8 new_cam, cam, pin;
+	bool enter_new_mode;
+	int i, j, k = 0xff;
+
+	port = uc->orig;
+	new_cam = UCSI_SET_NEW_CAM_GET_AM(ctrl->raw_cmd);
+	new_port = &uc->updated[new_cam];
+	cam = new_port->linked_idx;
+	enter_new_mode = UCSI_SET_NEW_CAM_ENTER(ctrl->raw_cmd);
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
+	ctrl->raw_cmd &= ~UCSI_SET_NEW_CAM_AM_MASK;
+	ctrl->raw_cmd |= UCSI_SET_NEW_CAM_SET_AM(cam);
 }
 
 static int ucsi_ccg_cmd(struct ucsi_ppm *ppm, struct ucsi_control *ctrl)
 {
 	struct ucsi_ccg *uc = container_of(ppm, struct ucsi_ccg, ppm);
+	struct ucsi_connector *con;
+	int con_index;
+
+	if (ctrl->alt.cmd == UCSI_SET_NEW_CAM && uc->has_multiple_dp) {
+		con_index = ctrl->cmd.data & UCSI_CMD_CONNECTOR_MASK;
+		con = &uc->ucsi->connector[con_index - 1];
+
+		ucsi_ccg_update_set_new_cam_cmd(uc, con, ctrl);
+	}
 
 	ppm->data->ctrl.raw_cmd = ctrl->raw_cmd;
 	return ucsi_ccg_send_data(uc);
@@ -1128,6 +1306,7 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 
 	uc->ppm.cmd = ucsi_ccg_cmd;
 	uc->ppm.sync = ucsi_ccg_sync;
+	uc->ppm.update_altmodes = ucsi_ccg_update_altmodes;
 	uc->dev = dev;
 	uc->client = client;
 	uc->run_isr = true;
-- 
2.17.1

