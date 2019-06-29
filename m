Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD0A25A7D7
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2019 02:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbfF2AUU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 20:20:20 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33652 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbfF2AUU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jun 2019 20:20:20 -0400
Received: by mail-pl1-f193.google.com with SMTP id c14so4128303plo.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2019 17:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Jc+zpoG30YepMwbRAYfls9aaPdR3TbelYyUpfV4v23s=;
        b=KV6m0i1eHVEU6d8Unh3NLaK3dfQKtNPOtNrqFey7CkAQmQq5fdQkyiO6hyVRmf/rWy
         7arma3QXvcPNlCw03HAtzV4do++4hRspaRaffm1jhN/XenpiZTfZblhRzsJXRP9NzDwT
         wna7Z1uwA852m7zNjuo1GNMpkZQKbq2oHuoZScGCVNSFBOmyJtiEUUB3TUCd+njguL8e
         UrxMAnJsi+l4WIwtcu5R9KWhasS1iAkOCvAjVktZ6wBMVlr6A91Do5Wv+I4759qg1SSR
         /KqREf1coS2zsYUUD5mZAF5u5UdGpjg36UsfDeadLz+pK7Vv+5BA54d8R1oiDtsY8HvP
         UHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Jc+zpoG30YepMwbRAYfls9aaPdR3TbelYyUpfV4v23s=;
        b=V5+3yPmUXH1ut6Buk5X2BYWEbPn5YxaAqjLt6hPca4aeGF0mlHFmgPpkw2yS23G/kQ
         rNfOOJjBJ3GINXmFnK8EdHMe+dUIev7E9Qw1QKom5CvDPdLUa3yxRxNJyLZb1Qd9crbt
         VgtNnJQY/0byN0tHyGwCfZILCifGiR4lt9rGhD0D8Jp2sLac0+Xe551dmNxkSAp9yJL7
         Ikun3Bz5EaUIwGDPwhnuuq8Vobvf5+1/1xHad1pfeZesxxqrWBFjcmpUfWG28S/mF7BJ
         Gc91uFaJnTqWY9cFpoKy0ZzWEqHM/HkVZJ4zckcYxGIKDoJe6LTg6BAMPCnv6vWAXzkS
         0KUA==
X-Gm-Message-State: APjAAAUc7dlm2D+i3kC8e9R4YZl2UFFv8G4LUEsc8gnhWqT6hjmYK1i0
        iCeQfk+1IVruvzUNpjRvkdo=
X-Google-Smtp-Source: APXvYqywM261PYaNlLGGIRQzRjoZ1LY1YRF95aEJi1g44yy0F6NbTAgPDwru81Ft/g9MWEyp4Fl3rw==
X-Received: by 2002:a17:902:bd05:: with SMTP id p5mr14446342pls.92.1561767619622;
        Fri, 28 Jun 2019 17:20:19 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id a3sm3671050pfo.49.2019.06.28.17.20.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 17:20:18 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH] usb: typec: ucsi: add support for separate DP altmode devices
Date:   Fri, 28 Jun 2019 17:15:24 -0700
Message-Id: <20190629001524.29997-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
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
RFC patch version is at [2]
Changes from RFC :
	- Update logic to prioritixe pin E -> D -> C
	- Fix a bug in ucsi_sync()

1. https://marc.info/?l=linux-usb&m=154905866830998&w=2 
2. https://marc.info/?l=linux-usb&m=156170104116037&w=2

 drivers/usb/typec/ucsi/ucsi.c | 210 ++++++++++++++++++++++++++++++++--
 drivers/usb/typec/ucsi/ucsi.h |  12 ++
 2 files changed, 215 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ba288b964dc8..e673e95e9f6c 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -39,11 +39,35 @@
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
-	if (ucsi->ppm && ucsi->ppm->sync)
-		return ucsi->ppm->sync(ucsi->ppm);
-	return 0;
+	struct ucsi_connector *con = ucsi->connector;
+	struct ucsi_data *data = ucsi->ppm->data;
+	int ret = 0;
+
+	if (ucsi->ppm && ucsi->ppm->sync) {
+		ret = ucsi->ppm->sync(ucsi->ppm);
+		if (ret)
+			return ret;
+	}
+
+	if (data->ctrl.alt.cmd == UCSI_GET_CURRENT_CAM && con->has_multiple_dp)
+		ucsi_update_get_current_cam_cmd(con, data);
+
+	return ret;
 }
 
 static int ucsi_command(struct ucsi *ucsi, struct ucsi_control *ctrl)
@@ -101,14 +125,65 @@ static int ucsi_ack(struct ucsi *ucsi, u8 ack)
 	return ret;
 }
 
+static void ucsi_update_set_new_cam_cmd(struct ucsi_connector *con,
+					struct ucsi_control *ctrl)
+{
+	struct new_ucsi_altmode *new_port, *port;
+	struct typec_altmode *alt = NULL;
+	u64 cmd;
+	u8 new_cam, cam, pin;
+	bool enter_new_mode;
+	int i, j, k = 0xff;
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
+				alt = con->partner_altmode[i];
+				if (alt->svid == new_port->svid)
+					break;
+			}
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
@@ -364,10 +439,24 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 
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
@@ -521,6 +610,103 @@ static void ucsi_partner_change(struct ucsi_connector *con)
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
@@ -851,6 +1037,16 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
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

