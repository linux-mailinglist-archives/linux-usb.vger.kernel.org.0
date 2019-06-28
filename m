Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5679A593AF
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 07:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfF1Fuj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 01:50:39 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33948 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727055AbfF1Fuj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jun 2019 01:50:39 -0400
Received: by mail-pg1-f194.google.com with SMTP id p10so2093895pgn.1
        for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2019 22:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=6Re3QMkOuLiPPZNqVgwqPmcn+cNWpuKhZRkwWpQaso4=;
        b=XJfjn7cOOHP6UNfrXoLSuvgPv8ZCdY69BYf+UPfKmp2XmOFLWPeY+UN+VQGMtEQO2K
         ZdgJcQxo87ilMvw4mRGqqU+tA4EE2WWgjgA3BqKYDxClj4SsXOWkz1rXOtc4mS2CpO9j
         ozGYs9HNy+MNKjj5k6/rPdxn3Hha0P85Wspt3gVgWn2hk8//b9kh/DBlWnWt2LgJZns0
         iPGaGrMc3+/A13BUMevB46BXR8uSnWwAYqkTHpW6oI6lFWXqJpJuZSxsrtGedl6xaCQ7
         nNMFkuxO2G6R7OjMujAW4z1Smdi9k3ZyKPL8c7ZWnIn8fq6lRfYqXVdx38N+doSuS0xi
         yqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6Re3QMkOuLiPPZNqVgwqPmcn+cNWpuKhZRkwWpQaso4=;
        b=CZvpBwUEUZHiU0+uTS5gm/0akBBtbUyZrekLN//bM3+h6T1UFNnvDk7hN0v2qgvJjB
         AFFEJE9QxIbvoa8ZC9onS7muzySm93iA0iCoWoREGRQ8Zpg0gfmUDopByfJuWIOClLWU
         CAve5n7JCylqXNHqMhUvPPGUJwrS/f7GXfj1rWQk4SHUXN3DywHIDlWUWZxZEKHBgOTa
         9EE3CWx2lkB3zC6Gb7P/fFCyDs6iV2LC8oLkwK83/8TP0oBuOgTtJ3+JonavpEyJ9UWk
         ahMELFebPT4oi6guFzDO/ohTtzk9AkVbM5QORsDYZGIv+ZuY9y4DlTE8HgEPUE438gv7
         m/DA==
X-Gm-Message-State: APjAAAWpcT23M7IavMNcQ2pcPe1KqhfE0SchHfsiv5jbHfXgggXONhVq
        qL9mH2ab4AqEoS371Xot+Stjm6S1
X-Google-Smtp-Source: APXvYqzvSSQTQ69Kz2f4rVVs5Rmp8HNV8rmTKu6qz7foGTQjR+M8lJJEBI1ahrfDCMrTsIky/H+FOg==
X-Received: by 2002:a65:5304:: with SMTP id m4mr7495238pgq.126.1561701038287;
        Thu, 27 Jun 2019 22:50:38 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id s43sm1030507pjb.10.2019.06.27.22.50.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 22:50:37 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [RFC] usb: typec: ucsi: add support for separate DP altmode devices
Date:   Thu, 27 Jun 2019 22:45:47 -0700
Message-Id: <20190628054547.26764-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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
 drivers/usb/typec/ucsi/ucsi.c | 191 +++++++++++++++++++++++++++++++++-
 drivers/usb/typec/ucsi/ucsi.h |  12 +++
 2 files changed, 199 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ba288b964dc8..491b5c925a90 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -39,8 +39,27 @@
  */
 #define UCSI_SWAP_TIMEOUT_MS	5000
 
+static void ucsi_update_get_current_cam_cmd(struct ucsi_connector *con,
+					    struct ucsi_data *data)
+{
+	u8 cam, new_cam;
+
+	if (data->cci.data_length == 0x1) {
+		cam = data->message_in[0];
+		new_cam = con->port_alt[cam].linked_idx;
+		data->message_in[0] = new_cam;
+		con->new_port_alt[new_cam].active_idx = cam;
+	}
+}
+
 static inline int ucsi_sync(struct ucsi *ucsi)
 {
+	struct ucsi_connector *con = ucsi->connector;
+	struct ucsi_data *data = ucsi->ppm->data;
+
+	if (data->ctrl.alt.cmd == UCSI_GET_CURRENT_CAM && con->has_multiple_dp)
+		ucsi_update_get_current_cam_cmd(con, data);
+
 	if (ucsi->ppm && ucsi->ppm->sync)
 		return ucsi->ppm->sync(ucsi->ppm);
 	return 0;
@@ -101,14 +120,57 @@ static int ucsi_ack(struct ucsi *ucsi, u8 ack)
 	return ret;
 }
 
+static void ucsi_update_set_new_cam_cmd(struct ucsi_connector *con,
+					struct ucsi_control *ctrl)
+{
+	struct new_ucsi_altmode *new_port, *port;
+	struct typec_altmode *partner = NULL;
+	u64 cmd;
+	u8 new_cam, cam;
+	bool enter_new_mode;
+	int i, j;
+
+	cmd = ctrl->raw_cmd;
+	new_cam = (cmd >> 24) & 0xff;
+	new_port = &con->new_port_alt[new_cam];
+	cam = new_port->linked_idx;
+	enter_new_mode = (cmd >> 23) & 1;
+
+	if (cam == UCSI_MULTI_LINKED_INDEX) {
+		if (enter_new_mode) {
+			port = con->port_alt;
+			for (i = 0; con->partner_altmode[i]; i++) {
+				partner = con->partner_altmode[i];
+				if (partner->svid == new_port->svid)
+					break;
+			}
+			for (j = 0; port[j].svid; j++)
+				if (partner && port[j].svid == partner->svid &&
+				    port[j].mid & partner->vdo)
+					break;
+			cam = j;
+			new_port->active_idx = cam;
+		} else {
+			cam = new_port->active_idx;
+		}
+	}
+	cmd &= ~(0xff << 24);
+	cmd |= (cam << 24);
+	ctrl->raw_cmd = cmd;
+}
+
 static int ucsi_run_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
 			    void *data, size_t size)
 {
 	struct ucsi_control _ctrl;
+	struct ucsi_connector *con = ucsi->connector;
 	u8 data_length;
 	u16 error;
 	int ret;
 
+	if (ctrl->alt.cmd == UCSI_SET_NEW_CAM && con->has_multiple_dp)
+		ucsi_update_set_new_cam_cmd(con, ctrl);
+
 	ret = ucsi_command(ucsi, ctrl);
 	if (ret)
 		goto err;
@@ -364,10 +426,24 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 
 	for (i = 0; i < max_altmodes;) {
 		memset(alt, 0, sizeof(alt));
-		UCSI_CMD_GET_ALTERNATE_MODES(ctrl, recipient, con->num, i, 1);
-		len = ucsi_run_command(con->ucsi, &ctrl, alt, sizeof(alt));
-		if (len <= 0)
-			return len;
+
+		if (recipient == UCSI_RECIPIENT_CON) {
+			if (con->has_multiple_dp) {
+				alt[0].svid = con->new_port_alt[i].svid;
+				alt[0].mid = con->new_port_alt[i].mid;
+			} else {
+				alt[0].svid = con->port_alt[i].svid;
+				alt[0].mid = con->port_alt[i].mid;
+			}
+			len = sizeof(alt[0]);
+		} else {
+			UCSI_CMD_GET_ALTERNATE_MODES(ctrl, recipient,
+						     con->num, i, 1);
+			len = ucsi_run_command(con->ucsi, &ctrl, alt,
+					       sizeof(alt));
+			if (len <= 0)
+				return len;
+		}
 
 		/*
 		 * This code is requesting one alt mode at a time, but some PPMs
@@ -521,6 +597,103 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 		ucsi_altmode_update_active(con);
 }
 
+static void ucsi_update_con_altmodes(struct ucsi_connector *con)
+{
+	int max_altmodes = con->ucsi->cap.num_alt_modes;
+	struct new_ucsi_altmode *alt, *new_alt;
+	int i, j, k = 0;
+	bool found = false;
+
+	alt = con->port_alt;
+	new_alt = con->new_port_alt;
+	memset(con->new_port_alt, 0, sizeof(con->new_port_alt));
+
+	for (i = 0; i < max_altmodes; i++) {
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
+			k++;
+			continue;
+		}
+
+		for (j = i + 1; j < max_altmodes; j++) {
+			if (alt[i].svid != alt[j].svid ||
+			    !DP_CONF_GET_PIN_ASSIGN(alt[j].mid)) {
+				continue;
+			} else {
+				/* Found duplicate DP mode */
+				new_alt[k].svid = alt[i].svid;
+				new_alt[k].mid |= alt[i].mid | alt[j].mid;
+				new_alt[k].linked_idx = UCSI_MULTI_LINKED_INDEX;
+				alt[i].linked_idx = k;
+				alt[j].linked_idx = k;
+				alt[j].checked = true;
+				found = true;
+			}
+		}
+		if (found) {
+			con->has_multiple_dp = true;
+		} else {
+			/* Didn't find any duplicate DP altmode */
+			new_alt[k].svid = alt[i].svid;
+			new_alt[k].mid |= alt[i].mid;
+			new_alt[k].linked_idx = i;
+			alt[i].linked_idx = k;
+		}
+		k++;
+	}
+}
+
+static int ucsi_get_altmodes(struct ucsi_connector *con)
+{
+	int max_altmodes = con->ucsi->cap.num_alt_modes;
+	struct ucsi_altmode alt[2];
+	struct ucsi_control ctrl;
+	int num = 1;
+	int len;
+	int j;
+	int i;
+	int k = 0;
+
+	memset(con->port_alt, 0, sizeof(con->port_alt));
+
+	for (i = 0; i < max_altmodes;) {
+		memset(alt, 0, sizeof(alt));
+		UCSI_CMD_GET_ALTERNATE_MODES(ctrl, UCSI_RECIPIENT_CON,
+					     con->num, i, 1);
+		len = ucsi_run_command(con->ucsi, &ctrl, alt, sizeof(alt));
+		if (len <= 0)
+			return len;
+
+		/*
+		 * This code is requesting one alt mode at a time, but some PPMs
+		 * may still return two.
+		 */
+		num = len / sizeof(alt[0]);
+		i += num;
+
+		for (j = 0; j < num; j++) {
+			if (!alt[j].svid)
+				return 0;
+
+			con->port_alt[k].mid = alt[j].mid;
+			con->port_alt[k].svid = alt[j].svid;
+			k++;
+		}
+	}
+	return 0;
+}
+
 static void ucsi_connector_change(struct work_struct *work)
 {
 	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
@@ -851,6 +1024,16 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	if (IS_ERR(con->port))
 		return PTR_ERR(con->port);
 
+	/* Get Alternate modes */
+	ret = ucsi_get_altmodes(con);
+	if (ret) {
+		dev_err(ucsi->dev,
+			"%s: con%d failed (%d)to get port alternate modes\n",
+			__func__, con->num, ret);
+		return 0;
+	}
+	ucsi_update_con_altmodes(con);
+
 	/* Alternate modes */
 	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_CON);
 	if (ret)
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index de87d0b8319d..7bbdf83c8d4a 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -274,6 +274,15 @@ struct ucsi_connector_capability {
 	u8:6; /* reserved */
 } __packed;
 
+struct new_ucsi_altmode {
+	u16 svid;
+	u32 mid;
+	u8 linked_idx;
+	u8 active_idx;
+#define UCSI_MULTI_LINKED_INDEX	(0xff)
+	bool checked;
+} __packed;
+
 struct ucsi_altmode {
 	u16 svid;
 	u32 mid;
@@ -408,6 +417,7 @@ struct ucsi {
 
 struct ucsi_connector {
 	int num;
+	bool has_multiple_dp;
 
 	struct ucsi *ucsi;
 	struct mutex lock; /* port lock */
@@ -424,6 +434,8 @@ struct ucsi_connector {
 
 	struct ucsi_connector_status status;
 	struct ucsi_connector_capability cap;
+	struct new_ucsi_altmode port_alt[UCSI_MAX_ALTMODES];
+	struct new_ucsi_altmode new_port_alt[UCSI_MAX_ALTMODES];
 };
 
 int ucsi_send_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
-- 
2.17.1

