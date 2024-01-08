Return-Path: <linux-usb+bounces-4863-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 974AF827854
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jan 2024 20:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BCA01F23D33
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jan 2024 19:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530D056454;
	Mon,  8 Jan 2024 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jgC8/UDv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BFE55E70
	for <linux-usb@vger.kernel.org>; Mon,  8 Jan 2024 19:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-28cca9bda41so1037889a91.3
        for <linux-usb@vger.kernel.org>; Mon, 08 Jan 2024 11:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704741401; x=1705346201; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCFcT67haIvrMJOBRNynFQICJX8kaEkP4Zr3tNyyoJU=;
        b=jgC8/UDvtujTpvSXkXFuQVvt30CBKAYpJNkzvDRIoEy8Xw8zFQBanaDt11saQhEnXJ
         FfObx9M2leUjC6a3R2VKGn2UWcJFIqCjW5e4RsfK4CTEOCKqaIzUDr5QtoBwEpe6YeYa
         PIj4epVNefrIddJBTwBj3c0MM+VbgjdxnUDmgcHhuj+B5z9cKU7wxGXp5slNiu9XOfTC
         GLCEKc5NrY0Tq1k66FJNPmXoLM20ScLyWXE9cG8rUFXXHY/EXp7dlHesAG2WjzGFrWIx
         KayHQdrWTsTt/E9IPkRGzero39eORxEIiNJ/uh0GWAPFKd+mSgNkjcND0E1OWguX81ms
         QhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704741401; x=1705346201;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lCFcT67haIvrMJOBRNynFQICJX8kaEkP4Zr3tNyyoJU=;
        b=fO/jVwfQeVmwLgb7FjXjlNp1s7k8tBu/bsTSVXwWQNCG2O31Ajbih7oTrKwwTfDe7j
         7UmOOqdogrFLFUI6LFTNySpwA3ra72MGkQI20oxSv+9sHFV2/Nu9PbZpmtNqNP7vRbY6
         43Tly7jl0c/3xtGHj41LGu/55urG72Nxe9peMB+SlbjJPzX+ENi5P+EBiLDdWR9ger7R
         yrbr9QVlx8wVneWhY4GvILcU1Dzr1KLbkdncZ3cntt86r+uu80oaEJNYFZXUe8//739p
         U/vy8CYb5ziPpi3wBnFYX0UVi5M17l4P0P/1Aq5d40I6HptOcuc7/Bf+lryKc9gx6bqR
         GxrQ==
X-Gm-Message-State: AOJu0YzHqgZunjs+OH1GfTt8g5U22/Gl92lDTAlfcl2MpB4EXfE/i7fL
	mx30apK7xx6EVQ/Fq9WjIn3CpG1dk+ABD4VyGpBIGw==
X-Google-Smtp-Source: AGHT+IGEn2xlcfrcZew3jzcficaNl8005b8zPFYMsV01tn6c2L9Ni2VYYmb6rOKu9sZiuqIceuwmQiheh/BJkpU=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a17:90a:6843:b0:28d:2946:982e with SMTP
 id e3-20020a17090a684300b0028d2946982emr392502pjm.2.1704741400760; Mon, 08
 Jan 2024 11:16:40 -0800 (PST)
Date: Mon,  8 Jan 2024 19:16:19 +0000
In-Reply-To: <20240108191620.987785-14-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240108191620.987785-14-rdbabiera@google.com>
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=14840; i=rdbabiera@google.com;
 h=from:subject; bh=E7QPpw6LJd82MkJ9eDbREwgUi0xuVsvNCylwVs7TV+Y=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKlzvNgXKl7l2mKiKXQ9S+90hcWE1PYWh4u6k6JeZRdmp
 gX/6jjWUcrCIMbBICumyKLrn2dw40rqljmcNcYwc1iZQIYwcHEKwEQ+XGb471txpD5uUd8Fh9de
 omZHPy6deOkJh+rUxhhxv2Mzebd4FzEy/A+0ddTmfdi3JNQ4PWmy/GP7nYn6Lg8bvt9ZVXhCXvg hNwA=
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20240108191620.987785-20-rdbabiera@google.com>
Subject: [PATCH v3 06/12] usb: typec: tcpm: add control message support to sop'
From: RD Babiera <rdbabiera@google.com>
To: rdbabiera@google.com, heikki.krogerus@linux.intel.com, linux@roeck-us.net, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Cc: badhri@google.com, bryan.odonoghue@linaro.org, agross@kernel.org, 
	andersson@kernel.org, konrad.dybcio@linaro.org
Content-Type: text/plain; charset="UTF-8"

Add tx_sop_type to tcpm_pd_send_control and rx_sop_type to
tcpm_pd_ctrl_request. TCPC_TX_SOP is added to all pd_send_control calls,
but TCPC_TX_SOP_PRIME is added to pd_send_control for a SOFT_RESET message
sent after a Vconn swap that makes the Port the Vconn source. Likewise,
tcpm_pd_ctrl_request resets the proper protocol layer depending on
rx_sop_type for SOFT_RESET.

VCONN_SWAP_TURN_ON_VCONN now moves to a new state,
VCONN_SWAP_SEND_SOFT_RESET. This state sends SOFT_RESET over SOP' before
transitioning to the ready state if applicable. It transitions after
PD_T_VCONN_STABLE, definied in pd.h as the time required for Vconn to be
on before transmitting messages.

Signed-off-by: RD Babiera <rdbabiera@google.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes since v2:
* Added reviewed-by tag
---
 drivers/usb/typec/tcpm/tcpm.c | 159 ++++++++++++++++++++++++----------
 include/linux/usb/pd.h        |   1 +
 2 files changed, 115 insertions(+), 45 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index d2ca85c8fec6..a59927925714 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -108,6 +108,7 @@
 	S(VCONN_SWAP_WAIT_FOR_VCONN),		\
 	S(VCONN_SWAP_TURN_ON_VCONN),		\
 	S(VCONN_SWAP_TURN_OFF_VCONN),		\
+	S(VCONN_SWAP_SEND_SOFT_RESET),		\
 						\
 	S(FR_SWAP_SEND),			\
 	S(FR_SWAP_SEND_TIMEOUT),		\
@@ -2395,7 +2396,8 @@ static inline enum tcpm_state ready_state(struct tcpm_port *port)
 }
 
 static int tcpm_pd_send_control(struct tcpm_port *port,
-				enum pd_ctrl_msg_type type);
+				enum pd_ctrl_msg_type type,
+				enum tcpm_transmit_type tx_sop_type);
 
 static void tcpm_handle_alert(struct tcpm_port *port, const __le32 *payload,
 			      int cnt)
@@ -2749,10 +2751,12 @@ static void tcpm_pps_complete(struct tcpm_port *port, int result)
 }
 
 static void tcpm_pd_ctrl_request(struct tcpm_port *port,
-				 const struct pd_message *msg)
+				 const struct pd_message *msg,
+				 enum tcpm_transmit_type rx_sop_type)
 {
 	enum pd_ctrl_msg_type type = pd_header_type_le(msg->header);
 	enum tcpm_state next_state;
+	unsigned int rev = pd_header_rev_le(msg->header);
 
 	/*
 	 * Stop VDM state machine if interrupted by other Messages while NOT_SUPP is allowed in
@@ -2917,6 +2921,16 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 		case SOFT_RESET_SEND:
 			if (port->ams == SOFT_RESET_AMS)
 				tcpm_ams_finish(port);
+			/*
+			 * SOP' Soft Reset is done after Vconn Swap,
+			 * which returns to ready state
+			 */
+			if (rx_sop_type == TCPC_TX_SOP_PRIME) {
+				if (rev < port->negotiated_rev_prime)
+					port->negotiated_rev_prime = rev;
+				tcpm_set_state(port, ready_state(port), 0);
+				break;
+			}
 			if (port->pwr_role == TYPEC_SOURCE) {
 				port->upcoming_state = SRC_SEND_CAPABILITIES;
 				tcpm_ams_start(port, POWER_NEGOTIATION);
@@ -3116,8 +3130,7 @@ static void tcpm_pd_rx_handler(struct kthread_work *work)
 			if (msgid == port->rx_msgid_prime)
 				goto done;
 			port->rx_msgid_prime = msgid;
-			/* Ignore SOP' for now */
-			goto done;
+			break;
 		case TCPC_TX_SOP:
 		default:
 			if (msgid == port->rx_msgid && type != PD_CTRL_SOFT_RESET)
@@ -3141,7 +3154,7 @@ static void tcpm_pd_rx_handler(struct kthread_work *work)
 			else if (cnt)
 				tcpm_pd_data_request(port, msg);
 			else
-				tcpm_pd_ctrl_request(port, msg);
+				tcpm_pd_ctrl_request(port, msg, rx_sop_type);
 		}
 	}
 
@@ -3168,17 +3181,40 @@ void tcpm_pd_receive(struct tcpm_port *port, const struct pd_message *msg,
 EXPORT_SYMBOL_GPL(tcpm_pd_receive);
 
 static int tcpm_pd_send_control(struct tcpm_port *port,
-				enum pd_ctrl_msg_type type)
+				enum pd_ctrl_msg_type type,
+				enum tcpm_transmit_type tx_sop_type)
 {
 	struct pd_message msg;
 
 	memset(&msg, 0, sizeof(msg));
-	msg.header = PD_HEADER_LE(type, port->pwr_role,
-				  port->data_role,
-				  port->negotiated_rev,
-				  port->message_id, 0);
+	switch (tx_sop_type) {
+	case TCPC_TX_SOP_PRIME:
+		msg.header = PD_HEADER_LE(type,
+					  0,	/* Cable Plug Indicator for DFP/UFP */
+					  0,	/* Reserved */
+					  port->negotiated_rev,
+					  port->message_id_prime,
+					  0);
+		break;
+	case TCPC_TX_SOP:
+		msg.header = PD_HEADER_LE(type,
+					  port->pwr_role,
+					  port->data_role,
+					  port->negotiated_rev,
+					  port->message_id,
+					  0);
+		break;
+	default:
+		msg.header = PD_HEADER_LE(type,
+					  port->pwr_role,
+					  port->data_role,
+					  port->negotiated_rev,
+					  port->message_id,
+					  0);
+		break;
+	}
 
-	return tcpm_pd_transmit(port, TCPC_TX_SOP, &msg);
+	return tcpm_pd_transmit(port, tx_sop_type, &msg);
 }
 
 /*
@@ -3197,13 +3233,13 @@ static bool tcpm_send_queued_message(struct tcpm_port *port)
 
 		switch (queued_message) {
 		case PD_MSG_CTRL_WAIT:
-			tcpm_pd_send_control(port, PD_CTRL_WAIT);
+			tcpm_pd_send_control(port, PD_CTRL_WAIT, TCPC_TX_SOP);
 			break;
 		case PD_MSG_CTRL_REJECT:
-			tcpm_pd_send_control(port, PD_CTRL_REJECT);
+			tcpm_pd_send_control(port, PD_CTRL_REJECT, TCPC_TX_SOP);
 			break;
 		case PD_MSG_CTRL_NOT_SUPP:
-			tcpm_pd_send_control(port, PD_CTRL_NOT_SUPP);
+			tcpm_pd_send_control(port, PD_CTRL_NOT_SUPP, TCPC_TX_SOP);
 			break;
 		case PD_MSG_DATA_SINK_CAP:
 			ret = tcpm_pd_send_sink_caps(port);
@@ -4218,7 +4254,7 @@ static void run_state_machine(struct tcpm_port *port)
 	case SRC_NEGOTIATE_CAPABILITIES:
 		ret = tcpm_pd_check_request(port);
 		if (ret < 0) {
-			tcpm_pd_send_control(port, PD_CTRL_REJECT);
+			tcpm_pd_send_control(port, PD_CTRL_REJECT, TCPC_TX_SOP);
 			if (!port->explicit_contract) {
 				tcpm_set_state(port,
 					       SRC_WAIT_NEW_CAPABILITIES, 0);
@@ -4226,7 +4262,7 @@ static void run_state_machine(struct tcpm_port *port)
 				tcpm_set_state(port, SRC_READY, 0);
 			}
 		} else {
-			tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
+			tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);
 			tcpm_set_partner_usb_comm_capable(port,
 							  !!(port->sink_request & RDO_USB_COMM));
 			tcpm_set_state(port, SRC_TRANSITION_SUPPLY,
@@ -4235,7 +4271,7 @@ static void run_state_machine(struct tcpm_port *port)
 		break;
 	case SRC_TRANSITION_SUPPLY:
 		/* XXX: regulator_set_voltage(vbus, ...) */
-		tcpm_pd_send_control(port, PD_CTRL_PS_RDY);
+		tcpm_pd_send_control(port, PD_CTRL_PS_RDY, TCPC_TX_SOP);
 		port->explicit_contract = true;
 		typec_set_pwr_opmode(port->typec_port, TYPEC_PWR_MODE_PD);
 		port->pwr_opmode = TYPEC_PWR_MODE_PD;
@@ -4720,7 +4756,7 @@ static void run_state_machine(struct tcpm_port *port)
 		/* remove existing capabilities */
 		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
 		port->partner_source_caps = NULL;
-		tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
+		tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);
 		tcpm_ams_finish(port);
 		if (port->pwr_role == TYPEC_SOURCE) {
 			port->upcoming_state = SRC_SEND_CAPABILITIES;
@@ -4737,28 +4773,41 @@ static void run_state_machine(struct tcpm_port *port)
 		tcpm_ams_start(port, SOFT_RESET_AMS);
 		break;
 	case SOFT_RESET_SEND:
-		port->message_id = 0;
-		port->rx_msgid = -1;
-		/* remove existing capabilities */
-		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
-		port->partner_source_caps = NULL;
-		if (tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET))
-			tcpm_set_state_cond(port, hard_reset_state(port), 0);
-		else
-			tcpm_set_state_cond(port, hard_reset_state(port),
-					    PD_T_SENDER_RESPONSE);
+		/*
+		 * Power Delivery 3.0 Section 6.3.13
+		 *
+		 * A Soft_Reset Message Shall be targeted at a specific entity
+		 * depending on the type of SOP* packet used.
+		 */
+		if (port->tx_sop_type == TCPC_TX_SOP_PRIME) {
+			port->message_id_prime = 0;
+			port->rx_msgid_prime = -1;
+			tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET, TCPC_TX_SOP_PRIME);
+			tcpm_set_state_cond(port, ready_state(port), PD_T_SENDER_RESPONSE);
+		} else {
+			port->message_id = 0;
+			port->rx_msgid = -1;
+			/* remove existing capabilities */
+			usb_power_delivery_unregister_capabilities(port->partner_source_caps);
+			port->partner_source_caps = NULL;
+			if (tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET, TCPC_TX_SOP))
+				tcpm_set_state_cond(port, hard_reset_state(port), 0);
+			else
+				tcpm_set_state_cond(port, hard_reset_state(port),
+						    PD_T_SENDER_RESPONSE);
+		}
 		break;
 
 	/* DR_Swap states */
 	case DR_SWAP_SEND:
-		tcpm_pd_send_control(port, PD_CTRL_DR_SWAP);
+		tcpm_pd_send_control(port, PD_CTRL_DR_SWAP, TCPC_TX_SOP);
 		if (port->data_role == TYPEC_DEVICE || port->negotiated_rev > PD_REV20)
 			port->send_discover = true;
 		tcpm_set_state_cond(port, DR_SWAP_SEND_TIMEOUT,
 				    PD_T_SENDER_RESPONSE);
 		break;
 	case DR_SWAP_ACCEPT:
-		tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
+		tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);
 		if (port->data_role == TYPEC_DEVICE || port->negotiated_rev > PD_REV20)
 			port->send_discover = true;
 		tcpm_set_state_cond(port, DR_SWAP_CHANGE_DR, 0);
@@ -4782,7 +4831,7 @@ static void run_state_machine(struct tcpm_port *port)
 		break;
 
 	case FR_SWAP_SEND:
-		if (tcpm_pd_send_control(port, PD_CTRL_FR_SWAP)) {
+		if (tcpm_pd_send_control(port, PD_CTRL_FR_SWAP, TCPC_TX_SOP)) {
 			tcpm_set_state(port, ERROR_RECOVERY, 0);
 			break;
 		}
@@ -4802,7 +4851,7 @@ static void run_state_machine(struct tcpm_port *port)
 		break;
 	case FR_SWAP_SNK_SRC_SOURCE_VBUS_APPLIED:
 		tcpm_set_pwr_role(port, TYPEC_SOURCE);
-		if (tcpm_pd_send_control(port, PD_CTRL_PS_RDY)) {
+		if (tcpm_pd_send_control(port, PD_CTRL_PS_RDY, TCPC_TX_SOP)) {
 			tcpm_set_state(port, ERROR_RECOVERY, 0);
 			break;
 		}
@@ -4812,11 +4861,11 @@ static void run_state_machine(struct tcpm_port *port)
 
 	/* PR_Swap states */
 	case PR_SWAP_ACCEPT:
-		tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
+		tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);
 		tcpm_set_state(port, PR_SWAP_START, 0);
 		break;
 	case PR_SWAP_SEND:
-		tcpm_pd_send_control(port, PD_CTRL_PR_SWAP);
+		tcpm_pd_send_control(port, PD_CTRL_PR_SWAP, TCPC_TX_SOP);
 		tcpm_set_state_cond(port, PR_SWAP_SEND_TIMEOUT,
 				    PD_T_SENDER_RESPONSE);
 		break;
@@ -4858,7 +4907,7 @@ static void run_state_machine(struct tcpm_port *port)
 		 * supply is turned off"
 		 */
 		tcpm_set_pwr_role(port, TYPEC_SINK);
-		if (tcpm_pd_send_control(port, PD_CTRL_PS_RDY)) {
+		if (tcpm_pd_send_control(port, PD_CTRL_PS_RDY, TCPC_TX_SOP)) {
 			tcpm_set_state(port, ERROR_RECOVERY, 0);
 			break;
 		}
@@ -4905,17 +4954,17 @@ static void run_state_machine(struct tcpm_port *port)
 		 * Source."
 		 */
 		tcpm_set_pwr_role(port, TYPEC_SOURCE);
-		tcpm_pd_send_control(port, PD_CTRL_PS_RDY);
+		tcpm_pd_send_control(port, PD_CTRL_PS_RDY, TCPC_TX_SOP);
 		tcpm_set_state(port, SRC_STARTUP, PD_T_SWAP_SRC_START);
 		break;
 
 	case VCONN_SWAP_ACCEPT:
-		tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
+		tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);
 		tcpm_ams_finish(port);
 		tcpm_set_state(port, VCONN_SWAP_START, 0);
 		break;
 	case VCONN_SWAP_SEND:
-		tcpm_pd_send_control(port, PD_CTRL_VCONN_SWAP);
+		tcpm_pd_send_control(port, PD_CTRL_VCONN_SWAP, TCPC_TX_SOP);
 		tcpm_set_state(port, VCONN_SWAP_SEND_TIMEOUT,
 			       PD_T_SENDER_RESPONSE);
 		break;
@@ -4934,14 +4983,34 @@ static void run_state_machine(struct tcpm_port *port)
 			       PD_T_VCONN_SOURCE_ON);
 		break;
 	case VCONN_SWAP_TURN_ON_VCONN:
-		tcpm_set_vconn(port, true);
-		tcpm_pd_send_control(port, PD_CTRL_PS_RDY);
-		tcpm_set_state(port, ready_state(port), 0);
+		ret = tcpm_set_vconn(port, true);
+		tcpm_pd_send_control(port, PD_CTRL_PS_RDY, TCPC_TX_SOP);
+		/*
+		 * USB PD 3.0 Section 6.4.4.3.1
+		 *
+		 * Note that a Cable Plug or VPD will not be ready for PD
+		 * Communication until tVCONNStable after VCONN has been applied
+		 */
+		if (!ret)
+			tcpm_set_state(port, VCONN_SWAP_SEND_SOFT_RESET,
+				       PD_T_VCONN_STABLE);
+		else
+			tcpm_set_state(port, ready_state(port), 0);
 		break;
 	case VCONN_SWAP_TURN_OFF_VCONN:
 		tcpm_set_vconn(port, false);
 		tcpm_set_state(port, ready_state(port), 0);
 		break;
+	case VCONN_SWAP_SEND_SOFT_RESET:
+		tcpm_swap_complete(port, port->swap_status);
+		if (tcpm_can_communicate_sop_prime(port)) {
+			port->tx_sop_type = TCPC_TX_SOP_PRIME;
+			port->upcoming_state = SOFT_RESET_SEND;
+			tcpm_ams_start(port, SOFT_RESET_AMS);
+		} else {
+			tcpm_set_state(port, ready_state(port), 0);
+		}
+		break;
 
 	case DR_SWAP_CANCEL:
 	case PR_SWAP_CANCEL:
@@ -4977,7 +5046,7 @@ static void run_state_machine(struct tcpm_port *port)
 		}
 		break;
 	case GET_STATUS_SEND:
-		tcpm_pd_send_control(port, PD_CTRL_GET_STATUS);
+		tcpm_pd_send_control(port, PD_CTRL_GET_STATUS, TCPC_TX_SOP);
 		tcpm_set_state(port, GET_STATUS_SEND_TIMEOUT,
 			       PD_T_SENDER_RESPONSE);
 		break;
@@ -4985,7 +5054,7 @@ static void run_state_machine(struct tcpm_port *port)
 		tcpm_set_state(port, ready_state(port), 0);
 		break;
 	case GET_PPS_STATUS_SEND:
-		tcpm_pd_send_control(port, PD_CTRL_GET_PPS_STATUS);
+		tcpm_pd_send_control(port, PD_CTRL_GET_PPS_STATUS, TCPC_TX_SOP);
 		tcpm_set_state(port, GET_PPS_STATUS_SEND_TIMEOUT,
 			       PD_T_SENDER_RESPONSE);
 		break;
@@ -4993,7 +5062,7 @@ static void run_state_machine(struct tcpm_port *port)
 		tcpm_set_state(port, ready_state(port), 0);
 		break;
 	case GET_SINK_CAP:
-		tcpm_pd_send_control(port, PD_CTRL_GET_SINK_CAP);
+		tcpm_pd_send_control(port, PD_CTRL_GET_SINK_CAP, TCPC_TX_SOP);
 		tcpm_set_state(port, GET_SINK_CAP_TIMEOUT, PD_T_SENDER_RESPONSE);
 		break;
 	case GET_SINK_CAP_TIMEOUT:
@@ -5033,7 +5102,7 @@ static void run_state_machine(struct tcpm_port *port)
 
 	/* Chunk state */
 	case CHUNK_NOT_SUPP:
-		tcpm_pd_send_control(port, PD_CTRL_NOT_SUPP);
+		tcpm_pd_send_control(port, PD_CTRL_NOT_SUPP, TCPC_TX_SOP);
 		tcpm_set_state(port, port->pwr_role == TYPEC_SOURCE ? SRC_READY : SNK_READY, 0);
 		break;
 	default:
diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
index eb626af0e4e7..d50098fb16b5 100644
--- a/include/linux/usb/pd.h
+++ b/include/linux/usb/pd.h
@@ -483,6 +483,7 @@ static inline unsigned int rdo_max_power(u32 rdo)
 #define PD_T_BIST_CONT_MODE	50	/* 30 - 60 ms */
 #define PD_T_SINK_TX		16	/* 16 - 20 ms */
 #define PD_T_CHUNK_NOT_SUPP	42	/* 40 - 50 ms */
+#define PD_T_VCONN_STABLE	50
 
 #define PD_T_DRP_TRY		100	/* 75 - 150 ms */
 #define PD_T_DRP_TRYWAIT	600	/* 400 - 800 ms */
-- 
2.43.0.472.g3155946c3a-goog


