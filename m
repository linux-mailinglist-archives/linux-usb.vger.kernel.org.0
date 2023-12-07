Return-Path: <linux-usb+bounces-3819-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E3A8083D7
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 10:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C56B1C21F3B
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 09:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D78932C6B;
	Thu,  7 Dec 2023 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qu+xmwFD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E9A10D2
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 01:08:12 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5d3eafe3d17so3000367b3.1
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 01:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701940091; x=1702544891; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tOxIUa0mOiY57OqfSzMpsv9qbznTXMq+FnNhc0wRkZY=;
        b=qu+xmwFDABJgeWs8T6h224GLiYm8LCf87oLhr7IoG1qLcraubXDkBRAgxdrF5p0CdN
         80OWAKbSxM6sYeXwWyBY3bZyQxPIdryvRqHm+Cp5ZoAj4QLxbOwK/II3rR4c24x8JVz4
         EQrf4Y4gvCEk4ywZfO0m6XLHirCNsy0HfcYidotODztWCSI/lLWGBXA+T6K+ajNOpqb7
         YS4Usu7jA/AA0rSpiwpSYklZGx90tmlC6XmQBP5iZD8pamTtbHDynpmCqyOLyUwdaQdq
         C2QjKyScrGspxhZuw/o0gDpTxengs7qSp/meF7J/XmdFx86/rTXBV7v44uOL/MLu6nHe
         2U4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940091; x=1702544891;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tOxIUa0mOiY57OqfSzMpsv9qbznTXMq+FnNhc0wRkZY=;
        b=YQovkpHCmBLySbqdpJONzUpOvCPrn4cUQG98Yd3afwLzuZvGaGWyN1udzE63agQnuH
         VWuKoGGxBQjA9iON6If/5j/0Jrd5GDBgi5XfI+TUnYptzteOtU2IlgEgfWpNCdYkkZWH
         7bpUxMiiSjIjAgchvXcregdrkYRaowJGW4xd5ACFzNzOC1yyr7VdTVZO5rrG/SmfLGLt
         ceObH9H1b1ydZ23OmDlAZ7OEeJcHf4Uqbs2SigJXIdQfJE8g/s4FiES912bghM1ak5EI
         8WUEEVKpl2VSP1WINmh+0czcLOTq74gN8aF1g/WtqcR2tpMoyoGIhrgoCkpnpvLW6Dhn
         wwEA==
X-Gm-Message-State: AOJu0YxKWPhf+kAC5JsHtmk4u4jM0tW+I4Foirs8yGgz6gbZkL/gCtU4
	VpvJLwfPwdcD76MhP779pBL/19Qkkv1BDk0=
X-Google-Smtp-Source: AGHT+IFhZ3nR+8KirEVwsULnaxyUKLQfH88N7uw+lgRjFtxWBKXn/USasJNfSEPdIrcrjCboEILo6ZjPrWGzpVM=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a25:bccd:0:b0:d9a:ca20:1911 with SMTP id
 l13-20020a25bccd000000b00d9aca201911mr120118ybm.4.1701940091379; Thu, 07 Dec
 2023 01:08:11 -0800 (PST)
Date: Thu,  7 Dec 2023 09:07:39 +0000
In-Reply-To: <20231207090738.15721-12-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231207090738.15721-12-rdbabiera@google.com>
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=16551; i=rdbabiera@google.com;
 h=from:subject; bh=GyGKDkjvo0LOYMx9j3TE67tGed7UrJIe0wrGn8Pp3D8=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKmF3XE31geyvFn3ob3SR9OxSDwl/+bawLS06ocTWox2H
 85KPCfXUcrCIMbBICumyKLrn2dw40rqljmcNcYwc1iZQIYwcHEKwESWWDD8d0g/4fA+/6laXIHv
 Zct3XfIHa5WUNbY9sBDQuD05ceNcLYb/0fcSpK+sZlNYclJpmQhLkJPBX58vOz5Z9P9sefRTzvY gBwA=
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231207090738.15721-20-rdbabiera@google.com>
Subject: [PATCH v1 08/10] usb: typec: tcpm: add mode data message support for SOP'
From: RD Babiera <rdbabiera@google.com>
To: heikki.krogerus@linux.intel.com, linux@roeck-us.net, 
	gregkh@linuxfoundation.org, pmalani@chromium.org, bleung@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Cc: badhri@google.com, tzungbi@kernel.org, utkarsh.h.patel@intel.com, 
	andriy.shevchenko@linux.intel.com, RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

Adds Discover SVIDs and Discover Modes support for SOP' and Alt Mode
SVDM support over SOP'. tcpm_port adds separate Alt Mode data for SOP'.

svdm_consume_svids and svdm_consume_modes take the received SVDM's SOP*
type to store svids/modes separately, and tcpm_register_plug_altmodes
registers the active cable's alt modes.

In tcpm_pd_svdm, the port will send Discover SVIDs to SOP' after Discover
Modes on SOP if the connected cable is an active cable. Discover Modes on
SOP' is sent following Discover SVIDs on SOP. Registering partner alt modes
is delayed when an active cable is present until Discover Modes completes
on SOP', or if the Discover SVIDs/Discover Modes request on SOP' encounters
a transmission error.

tcpm_queue_vdm_unlocked now takes tx_sop_type as input, and two helpers are
implemented to convert between typec_altmode_transmit_type and
tcpm_transmit_type. Alt Mode drivers will now receive SVDMs over SOP' and
can send when applicable.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 260 ++++++++++++++++++++++++++++------
 1 file changed, 218 insertions(+), 42 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index f55bcbe6f031..b84cc4755efe 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -465,7 +465,9 @@ struct tcpm_port {
 
 	/* Alternate mode data */
 	struct pd_mode_data mode_data;
+	struct pd_mode_data mode_data_prime;
 	struct typec_altmode *partner_altmode[ALTMODE_DISCOVERY_MAX];
+	struct typec_altmode *plug_prime_altmode[ALTMODE_DISCOVERY_MAX];
 	struct typec_altmode *port_altmode[ALTMODE_DISCOVERY_MAX];
 
 	/* Deadline in jiffies to exit src_try_wait state */
@@ -1547,10 +1549,10 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
 }
 
 static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
-				    const u32 *data, int cnt)
+				    const u32 *data, int cnt, enum tcpm_transmit_type tx_sop_type)
 {
 	mutex_lock(&port->lock);
-	tcpm_queue_vdm(port, header, data, cnt, TCPC_TX_SOP);
+	tcpm_queue_vdm(port, header, data, cnt, tx_sop_type);
 	mutex_unlock(&port->lock);
 }
 
@@ -1629,9 +1631,11 @@ static void svdm_consume_identity_sop_prime(struct tcpm_port *port, const u32 *p
 	}
 }
 
-static bool svdm_consume_svids(struct tcpm_port *port, const u32 *p, int cnt)
+static bool svdm_consume_svids(struct tcpm_port *port, const u32 *p, int cnt,
+			       enum tcpm_transmit_type rx_sop_type)
 {
-	struct pd_mode_data *pmdata = &port->mode_data;
+	struct pd_mode_data *pmdata = rx_sop_type == TCPC_TX_SOP_PRIME ?
+				      &port->mode_data_prime : &port->mode_data;
 	int i;
 
 	for (i = 1; i < cnt; i++) {
@@ -1677,14 +1681,30 @@ static bool svdm_consume_svids(struct tcpm_port *port, const u32 *p, int cnt)
 	return false;
 }
 
-static void svdm_consume_modes(struct tcpm_port *port, const u32 *p, int cnt)
+static void svdm_consume_modes(struct tcpm_port *port, const u32 *p, int cnt,
+			       enum tcpm_transmit_type rx_sop_type)
+
 {
 	struct pd_mode_data *pmdata = &port->mode_data;
 	struct typec_altmode_desc *paltmode;
 	int i;
 
-	if (pmdata->altmodes >= ARRAY_SIZE(port->partner_altmode)) {
-		/* Already logged in svdm_consume_svids() */
+	switch (rx_sop_type) {
+	case TCPC_TX_SOP_PRIME:
+		pmdata = &port->mode_data_prime;
+		if (pmdata->altmodes >= ARRAY_SIZE(port->plug_prime_altmode)) {
+			/* Already logged in svdm_consume_svids() */
+			return;
+		}
+		break;
+	case TCPC_TX_SOP:
+		pmdata = &port->mode_data;
+		if (pmdata->altmodes >= ARRAY_SIZE(port->partner_altmode)) {
+			/* Already logged in svdm_consume_svids() */
+			return;
+		}
+		break;
+	default:
 		return;
 	}
 
@@ -1722,7 +1742,28 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
 	}
 }
 
+static void tcpm_register_plug_altmodes(struct tcpm_port *port)
+{
+	struct pd_mode_data *modep = &port->mode_data_prime;
+	struct typec_altmode *altmode;
+	int i;
+
+	typec_plug_set_num_altmodes(port->plug_prime, modep->altmodes);
+
+	for (i = 0; i < modep->altmodes; i++) {
+		altmode = typec_plug_register_altmode(port->plug_prime,
+						&modep->altmode_desc[i]);
+		if (IS_ERR(altmode)) {
+			tcpm_log(port, "Failed to register plug SVID 0x%04x",
+				 modep->altmode_desc[i].svid);
+			altmode = NULL;
+		}
+		port->plug_prime_altmode[i] = altmode;
+	}
+}
+
 #define supports_modal(port)	PD_IDH_MODAL_SUPP((port)->partner_ident.id_header)
+#define supports_modal_cable(port)	PD_IDH_MODAL_SUPP((port)->cable_ident.id_header)
 #define supports_host(port)	PD_IDH_HOST_SUPP((port->partner_ident.id_header))
 
 /*
@@ -1800,6 +1841,14 @@ static bool tcpm_attempt_vconn_swap_discovery(struct tcpm_port *port)
 	return false;
 }
 
+static bool tcpm_cable_vdm_supported(struct tcpm_port *port)
+{
+	return !IS_ERR_OR_NULL(port->cable) &&
+	       typec_cable_is_active(port->cable) &&
+	       supports_modal_cable(port) &&
+	       tcpm_can_communicate_sop_prime(port);
+}
+
 static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 			const u32 *p, int cnt, u32 *response,
 			enum adev_actions *adev_action,
@@ -1807,8 +1856,8 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 			enum tcpm_transmit_type *response_tx_sop_type)
 {
 	struct typec_port *typec = port->typec_port;
-	struct typec_altmode *pdev;
-	struct pd_mode_data *modep;
+	struct typec_altmode *pdev, *pdev_prime;
+	struct pd_mode_data *modep, *modep_prime;
 	int svdm_version;
 	int rlen = 0;
 	int cmd_type;
@@ -1822,13 +1871,13 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 	tcpm_log(port, "Rx VDM cmd 0x%x type %d cmd %d len %d",
 		 p[0], cmd_type, cmd, cnt);
 
-	modep = &port->mode_data;
-
-	pdev = typec_match_altmode(port->partner_altmode, ALTMODE_DISCOVERY_MAX,
-				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
-
 	switch (rx_sop_type) {
 	case TCPC_TX_SOP_PRIME:
+		modep_prime = &port->mode_data_prime;
+		pdev_prime = typec_match_altmode(port->plug_prime_altmode,
+						 ALTMODE_DISCOVERY_MAX,
+						 PD_VDO_VID(p[0]),
+						 PD_VDO_OPOS(p[0]));
 		svdm_version = typec_get_cable_svdm_version(typec);
 		/*
 		 * Update SVDM version if cable was discovered before port partner.
@@ -1839,11 +1888,21 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 		}
 		break;
 	case TCPC_TX_SOP:
+		modep = &port->mode_data;
+		pdev = typec_match_altmode(port->partner_altmode,
+					   ALTMODE_DISCOVERY_MAX,
+					   PD_VDO_VID(p[0]),
+					   PD_VDO_OPOS(p[0]));
 		svdm_version = typec_get_negotiated_svdm_version(typec);
 		if (svdm_version < 0)
 			return 0;
 		break;
 	default:
+		modep = &port->mode_data;
+		pdev = typec_match_altmode(port->partner_altmode,
+					   ALTMODE_DISCOVERY_MAX,
+					   PD_VDO_VID(p[0]),
+					   PD_VDO_OPOS(p[0]));
 		svdm_version = typec_get_negotiated_svdm_version(typec);
 		if (svdm_version < 0)
 			return 0;
@@ -1935,6 +1994,9 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 		 * SOP'		Discover Identity
 		 * SOP		Discover SVIDs
 		 *		Discover Modes
+		 * (Active Cables)
+		 * SOP'		Discover SVIDs
+		 *		Discover Modes
 		 *
 		 * Perform Discover SOP' if the port can communicate with cable
 		 * plug.
@@ -2010,37 +2072,92 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 			}
 			break;
 		case CMD_DISCOVER_SVID:
+			*response_tx_sop_type = rx_sop_type;
 			/* 6.4.4.3.2 */
-			if (svdm_consume_svids(port, p, cnt)) {
+			if (svdm_consume_svids(port, p, cnt, rx_sop_type)) {
 				response[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_SVID);
 				rlen = 1;
-			} else if (modep->nsvids && supports_modal(port)) {
-				response[0] = VDO(modep->svids[0], 1, svdm_version,
-						  CMD_DISCOVER_MODES);
-				rlen = 1;
+			} else {
+				if (rx_sop_type == TCPC_TX_SOP) {
+					if (modep->nsvids && supports_modal(port)) {
+						response[0] = VDO(modep->svids[0], 1, svdm_version,
+								CMD_DISCOVER_MODES);
+						rlen = 1;
+					}
+				} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
+					if (modep_prime->nsvids) {
+						response[0] = VDO(modep_prime->svids[0], 1,
+								  svdm_version, CMD_DISCOVER_MODES);
+						rlen = 1;
+					}
+				}
 			}
 			break;
 		case CMD_DISCOVER_MODES:
-			/* 6.4.4.3.3 */
-			svdm_consume_modes(port, p, cnt);
-			modep->svid_index++;
-			if (modep->svid_index < modep->nsvids) {
-				u16 svid = modep->svids[modep->svid_index];
-				response[0] = VDO(svid, 1, svdm_version, CMD_DISCOVER_MODES);
-				rlen = 1;
-			} else {
-				tcpm_register_partner_altmodes(port);
+			if (rx_sop_type == TCPC_TX_SOP) {
+				/* 6.4.4.3.3 */
+				svdm_consume_modes(port, p, cnt, rx_sop_type);
+				modep->svid_index++;
+				if (modep->svid_index < modep->nsvids) {
+					u16 svid = modep->svids[modep->svid_index];
+					*response_tx_sop_type = TCPC_TX_SOP;
+					response[0] = VDO(svid, 1, svdm_version,
+							  CMD_DISCOVER_MODES);
+					rlen = 1;
+				} else if (tcpm_cable_vdm_supported(port)) {
+					*response_tx_sop_type = TCPC_TX_SOP_PRIME;
+					response[0] = VDO(USB_SID_PD, 1,
+							  typec_get_cable_svdm_version(typec),
+							  CMD_DISCOVER_SVID);
+					rlen = 1;
+				} else {
+					tcpm_register_partner_altmodes(port);
+				}
+			} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
+				/* 6.4.4.3.3 */
+				svdm_consume_modes(port, p, cnt, rx_sop_type);
+				modep_prime->svid_index++;
+				if (modep_prime->svid_index < modep_prime->nsvids) {
+					u16 svid = modep_prime->svids[modep_prime->svid_index];
+					*response_tx_sop_type = TCPC_TX_SOP_PRIME;
+					response[0] = VDO(svid, 1,
+							  typec_get_cable_svdm_version(typec),
+							  CMD_DISCOVER_MODES);
+					rlen = 1;
+				} else {
+					tcpm_register_plug_altmodes(port);
+					tcpm_register_partner_altmodes(port);
+				}
 			}
 			break;
 		case CMD_ENTER_MODE:
-			if (adev && pdev)
-				*adev_action = ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL;
+			if (rx_sop_type == TCPC_TX_SOP) {
+				if (adev && pdev) {
+					typec_altmode_update_active(pdev, true);
+					*adev_action = ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL;
+				}
+			} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
+				if (adev && pdev_prime) {
+					typec_altmode_update_active(pdev_prime, true);
+					*adev_action = ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL;
+				}
+			}
 			return 0;
 		case CMD_EXIT_MODE:
-			if (adev && pdev) {
-				/* Back to USB Operation */
-				*adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
-				return 0;
+			if (rx_sop_type == TCPC_TX_SOP) {
+				if (adev && pdev) {
+					typec_altmode_update_active(pdev, false);
+					/* Back to USB Operation */
+					*adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
+					return 0;
+				}
+			} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
+				if (adev && pdev_prime) {
+					typec_altmode_update_active(pdev_prime, false);
+					/* Back to USB Operation */
+					*adev_action = ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL;
+					return 0;
+				}
 			}
 			break;
 		case VDO_CMD_VENDOR(0) ... VDO_CMD_VENDOR(15):
@@ -2092,6 +2209,30 @@ static void tcpm_pd_handle_msg(struct tcpm_port *port,
 			       enum pd_msg_request message,
 			       enum tcpm_ams ams);
 
+static enum typec_altmode_transmit_type tcpm_to_altmode_tx_type(enum tcpm_transmit_type tx_type)
+{
+	switch (tx_type) {
+	case TCPC_TX_SOP_PRIME:
+		return TYPEC_ALTMODE_SOP_PRIME;
+	case TCPC_TX_SOP:
+		return TYPEC_ALTMODE_SOP;
+	default:
+		return TYPEC_ALTMODE_SOP;
+	}
+}
+
+static enum tcpm_transmit_type altmode_to_tcpm_tx_type(enum typec_altmode_transmit_type tx_type)
+{
+	switch (tx_type) {
+	case TYPEC_ALTMODE_SOP_PRIME:
+		return TCPC_TX_SOP_PRIME;
+	case TYPEC_ALTMODE_SOP:
+		return TCPC_TX_SOP;
+	default:
+		return TCPC_TX_SOP;
+	}
+}
+
 static void tcpm_handle_vdm_request(struct tcpm_port *port,
 				    const __le32 *payload, int cnt,
 				    enum tcpm_transmit_type rx_sop_type)
@@ -2170,13 +2311,16 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 			break;
 		case ADEV_NOTIFY_USB_AND_QUEUE_VDM:
 			WARN_ON(typec_altmode_notify(adev, TYPEC_STATE_USB, NULL));
-			typec_altmode_vdm(adev, p[0], &p[1], cnt, TYPEC_ALTMODE_SOP);
+			typec_altmode_vdm(adev, p[0], &p[1], cnt,
+					  tcpm_to_altmode_tx_type(rx_sop_type));
 			break;
 		case ADEV_QUEUE_VDM:
-			typec_altmode_vdm(adev, p[0], &p[1], cnt, TYPEC_ALTMODE_SOP);
+			typec_altmode_vdm(adev, p[0], &p[1], cnt,
+					  tcpm_to_altmode_tx_type(rx_sop_type));
 			break;
 		case ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL:
-			if (typec_altmode_vdm(adev, p[0], &p[1], cnt, TYPEC_ALTMODE_SOP)) {
+			if (typec_altmode_vdm(adev, p[0], &p[1], cnt,
+					      tcpm_to_altmode_tx_type(rx_sop_type))) {
 				int svdm_version = typec_get_negotiated_svdm_version(
 									port->typec_port);
 				if (svdm_version < 0)
@@ -2410,6 +2554,16 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 				tcpm_queue_vdm(port, response[0], &response[1],
 					       0, TCPC_TX_SOP);
 				break;
+			/*
+			 * If Discover SVIDs or Discover Modes fail, then
+			 * proceed with Alt Mode discovery process on SOP.
+			 */
+			case CMD_DISCOVER_SVID:
+				tcpm_register_partner_altmodes(port);
+				break;
+			case CMD_DISCOVER_MODES:
+				tcpm_register_partner_altmodes(port);
+				break;
 			default:
 				break;
 			}
@@ -2605,14 +2759,20 @@ static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo,
 	int svdm_version;
 	u32 header;
 
-	svdm_version = typec_get_negotiated_svdm_version(port->typec_port);
+	if (tx_sop_type == TYPEC_ALTMODE_SOP_PRIME && !tcpm_cable_vdm_supported(port))
+		return -EPERM;
+
+	svdm_version = tx_sop_type == TYPEC_ALTMODE_SOP ?
+		       typec_get_negotiated_svdm_version(port->typec_port) :
+		       typec_get_cable_svdm_version(port->typec_port);
 	if (svdm_version < 0)
 		return svdm_version;
 
 	header = VDO(altmode->svid, vdo ? 2 : 1, svdm_version, CMD_ENTER_MODE);
 	header |= VDO_OPOS(altmode->mode);
 
-	tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0);
+	tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0,
+				altmode_to_tcpm_tx_type(tx_sop_type));
 	return 0;
 }
 
@@ -2623,14 +2783,20 @@ static int tcpm_altmode_exit(struct typec_altmode *altmode,
 	int svdm_version;
 	u32 header;
 
-	svdm_version = typec_get_negotiated_svdm_version(port->typec_port);
+	if (tx_sop_type == TYPEC_ALTMODE_SOP_PRIME && !tcpm_cable_vdm_supported(port))
+		return -EPERM;
+
+	svdm_version = tx_sop_type == TYPEC_ALTMODE_SOP ?
+		       typec_get_negotiated_svdm_version(port->typec_port) :
+		       typec_get_cable_svdm_version(port->typec_port);
 	if (svdm_version < 0)
 		return svdm_version;
 
 	header = VDO(altmode->svid, 1, svdm_version, CMD_EXIT_MODE);
 	header |= VDO_OPOS(altmode->mode);
 
-	tcpm_queue_vdm_unlocked(port, header, NULL, 0);
+	tcpm_queue_vdm_unlocked(port, header, NULL, 0,
+				altmode_to_tcpm_tx_type(tx_sop_type));
 	return 0;
 }
 
@@ -2640,7 +2806,11 @@ static int tcpm_altmode_vdm(struct typec_altmode *altmode,
 {
 	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
 
-	tcpm_queue_vdm_unlocked(port, header, data, count - 1);
+	if (tx_sop_type == TYPEC_ALTMODE_SOP_PRIME && !tcpm_cable_vdm_supported(port))
+		return -EPERM;
+
+	tcpm_queue_vdm_unlocked(port, header, data, count - 1,
+				altmode_to_tcpm_tx_type(tx_sop_type));
 
 	return 0;
 }
@@ -4126,14 +4296,20 @@ static void tcpm_typec_disconnect(struct tcpm_port *port)
 static void tcpm_unregister_altmodes(struct tcpm_port *port)
 {
 	struct pd_mode_data *modep = &port->mode_data;
+	struct pd_mode_data *modep_prime = &port->mode_data_prime;
 	int i;
 
 	for (i = 0; i < modep->altmodes; i++) {
 		typec_unregister_altmode(port->partner_altmode[i]);
 		port->partner_altmode[i] = NULL;
 	}
+	for (i = 0; i < modep_prime->altmodes; i++) {
+		typec_unregister_altmode(port->plug_prime_altmode[i]);
+		port->plug_prime_altmode[i] = NULL;
+	}
 
 	memset(modep, 0, sizeof(*modep));
+	memset(modep_prime, 0, sizeof(*modep_prime));
 }
 
 static void tcpm_set_partner_usb_comm_capable(struct tcpm_port *port, bool capable)
-- 
2.43.0.rc2.451.g8631bc7472-goog


