Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB26A2EB05A
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 17:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729837AbhAEQlD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 11:41:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729770AbhAEQlC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jan 2021 11:41:02 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A816C0617A0
        for <linux-usb@vger.kernel.org>; Tue,  5 Jan 2021 08:40:20 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id k7so88567ybm.13
        for <linux-usb@vger.kernel.org>; Tue, 05 Jan 2021 08:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=3zHh9vMqtCHS/gAd7N5HDEoQ9ULMrzV+aRkL0N1OWfU=;
        b=PWhpxEpS2kYb7mXtWFJ7NZkBt4kHKcXrekXvsGfAD/dEa7Z1IZ+TsSbvREC9XLP3J2
         CDtrhXFovhDWGFg1u9WqRTRah0WS6DbdpFHup+KbQ4ybzy+tSmwxogszfVFAEpZTisHv
         oqVKc3NuvEkbz05cP+tj33cG6y4II1t0KBmV8CpWqz84K5HMWNlPJfLxLwR0yLjoXBJl
         4Ux3SHkFJkrbD8nz3U+oqJfgYD1d6o3RlSDfnkqpDbz43ftZ8m8vj6G6NiozsLGHVJOg
         j0QbBUaGxq4RRNoi8nQpub8/drv/ymJdhaJ9EUpeSgwYwPrempfBBA7uKlTwweE4xIYb
         ReHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=3zHh9vMqtCHS/gAd7N5HDEoQ9ULMrzV+aRkL0N1OWfU=;
        b=m+bf+wm3OV+p4tzdF2EP7OhVLB1GdEt9UGxw/gYjKEdos8iIwg0CaDUmEHKtMatINt
         Ze0lHLa6iJG7VRYdAgqeeXw5ZgirwP7VDE8l2IoudqccLWo4dPTKoQsCrs0igEhxVq6n
         pxEcmy/e8OoyXIn7ObDkzdXbF6xlBXIrFnmLsSu+MzKJ5ES7tTGJI5d5DVd8exYkmvhL
         rAiK0tBscWq5MX6IND4yGtMYg0Zxy9XvC2yB/BMUiyL7em3Cq9IWM5n+G9m25b4Sp3eN
         Wao6JH8d+vYq8MXIm7nUHGyZK7mjjvRJKZ3vVRm2i05yi/zGTsX7qf9is3RquvsCz9NO
         2WZw==
X-Gm-Message-State: AOAM533BoeUtKjUYgZyvtdPteMcv7EBMNzjSaF4ZEcOFYJCHNxDA9hM1
        ebMsCVFHjdpBeBfsSxvfZLYCa9FHgi7W
X-Google-Smtp-Source: ABdhPJzWuv7+nmJCDum5voYI9h3LHpJKrALxHGxFinyZN8BnTQRmgzFpfUM1/DgTwJC/3DwFjAPf+NPTTAiV
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:3e52:82ff:fe5b:30db])
 (user=kyletso job=sendgmr) by 2002:a25:aa45:: with SMTP id
 s63mr282843ybi.471.1609864819666; Tue, 05 Jan 2021 08:40:19 -0800 (PST)
Date:   Wed,  6 Jan 2021 00:39:27 +0800
In-Reply-To: <20210105163927.1376770-1-kyletso@google.com>
Message-Id: <20210105163927.1376770-4-kyletso@google.com>
Mime-Version: 1.0
References: <20210105163927.1376770-1-kyletso@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v5 3/3] usb: typec: tcpm: Respond Wait if VDM state machine is running
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, hdegoede@redhat.com
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>,
        Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Port partner could send PR_SWAP/DR_SWAP/VCONN_SWAP/Request just after it
enters Ready states. This will cause conficts if the port is going to
send DISC_IDENT in the Ready states of TCPM. Set a flag indicating that
the state machine is processing VDM and respond Wait messages until the
VDM state machine stops.

Signed-off-by: Kyle Tso <kyletso@google.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 80 ++++++++++++++++++++++++++++++++---
 1 file changed, 73 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index a951307d669d..9aa0e36f87e9 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -352,6 +352,7 @@ struct tcpm_port {
 	struct hrtimer enable_frs_timer;
 	struct kthread_work enable_frs;
 	bool state_machine_running;
+	bool vdm_sm_running;
 
 	struct completion tx_complete;
 	enum tcpm_transmit_status tx_status;
@@ -1527,6 +1528,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 				rlen = 1;
 			} else {
 				tcpm_register_partner_altmodes(port);
+				port->vdm_sm_running = false;
 			}
 			break;
 		case CMD_ENTER_MODE:
@@ -1570,10 +1572,12 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 			rlen = 1;
 			break;
 		}
+		port->vdm_sm_running = false;
 		break;
 	default:
 		response[0] = p[0] | VDO_CMDT(CMDT_RSP_NAK);
 		rlen = 1;
+		port->vdm_sm_running = false;
 		break;
 	}
 
@@ -1740,6 +1744,8 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 			switch (PD_VDO_CMD(vdo_hdr)) {
 			case CMD_DISCOVER_IDENT:
 				res = tcpm_ams_start(port, DISCOVER_IDENTITY);
+				if (res == 0)
+					port->send_discover = false;
 				break;
 			case CMD_DISCOVER_SVID:
 				res = tcpm_ams_start(port, DISCOVER_SVIDS);
@@ -1766,8 +1772,10 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 				break;
 			}
 
-			if (res < 0)
+			if (res < 0) {
+				port->vdm_sm_running = false;
 				return;
+			}
 		}
 
 		port->vdm_state = VDM_STATE_SEND_MESSAGE;
@@ -1846,6 +1854,9 @@ static void vdm_state_machine_work(struct kthread_work *work)
 		 port->vdm_state != VDM_STATE_BUSY &&
 		 port->vdm_state != VDM_STATE_SEND_MESSAGE);
 
+	if (port->vdm_state == VDM_STATE_ERR_TMOUT)
+		port->vdm_sm_running = false;
+
 	mutex_unlock(&port->lock);
 }
 
@@ -2230,6 +2241,12 @@ static void tcpm_pd_data_request(struct tcpm_port *port,
 		}
 
 		port->sink_request = le32_to_cpu(msg->payload[0]);
+
+		if (port->vdm_sm_running && port->explicit_contract) {
+			tcpm_pd_handle_msg(port, PD_MSG_CTRL_WAIT, port->ams);
+			break;
+		}
+
 		if (port->state == SRC_SEND_CAPABILITIES)
 			tcpm_set_state(port, SRC_NEGOTIATE_CAPABILITIES, 0);
 		else
@@ -2335,6 +2352,10 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 								       TYPEC_PWR_MODE_PD,
 								       port->pps_data.active,
 								       port->supply_voltage);
+				/* Set VDM running flag ASAP */
+				if (port->data_role == TYPEC_HOST &&
+				    port->send_discover)
+					port->vdm_sm_running = true;
 				tcpm_set_state(port, SNK_READY, 0);
 			} else {
 				/*
@@ -2372,10 +2393,14 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 		switch (port->state) {
 		case SNK_NEGOTIATE_CAPABILITIES:
 			/* USB PD specification, Figure 8-43 */
-			if (port->explicit_contract)
+			if (port->explicit_contract) {
 				next_state = SNK_READY;
-			else
+				if (port->data_role == TYPEC_HOST &&
+				    port->send_discover)
+					port->vdm_sm_running = true;
+			} else {
 				next_state = SNK_WAIT_CAPABILITIES;
+			}
 			tcpm_set_state(port, next_state, 0);
 			break;
 		case SNK_NEGOTIATE_PPS_CAPABILITIES:
@@ -2384,6 +2409,11 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 			port->pps_data.op_curr = port->current_limit;
 			port->pps_status = (type == PD_CTRL_WAIT ?
 					    -EAGAIN : -EOPNOTSUPP);
+
+			if (port->data_role == TYPEC_HOST &&
+			    port->send_discover)
+				port->vdm_sm_running = true;
+
 			tcpm_set_state(port, SNK_READY, 0);
 			break;
 		case DR_SWAP_SEND:
@@ -2440,6 +2470,10 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 			}
 			break;
 		case DR_SWAP_SEND:
+			if (port->data_role == TYPEC_DEVICE &&
+			    port->send_discover)
+				port->vdm_sm_running = true;
+
 			tcpm_set_state(port, DR_SWAP_CHANGE_DR, 0);
 			break;
 		case PR_SWAP_SEND:
@@ -2470,28 +2504,45 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 		 * 6.3.9: If an alternate mode is active, a request to swap
 		 * alternate modes shall trigger a port reset.
 		 */
-		if (port->typec_caps.data != TYPEC_PORT_DRD)
+		if (port->typec_caps.data != TYPEC_PORT_DRD) {
 			tcpm_pd_handle_msg(port,
 					   port->negotiated_rev < PD_REV30 ?
 					   PD_MSG_CTRL_REJECT :
 					   PD_MSG_CTRL_NOT_SUPP,
 					   NONE_AMS);
-		else
+		} else {
+			if (port->vdm_sm_running) {
+				tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
+				break;
+			}
+
 			tcpm_pd_handle_state(port, DR_SWAP_ACCEPT,
 					     DATA_ROLE_SWAP, 0);
+		}
 		break;
 	case PD_CTRL_PR_SWAP:
-		if (port->port_type != TYPEC_PORT_DRP)
+		if (port->port_type != TYPEC_PORT_DRP) {
 			tcpm_pd_handle_msg(port,
 					   port->negotiated_rev < PD_REV30 ?
 					   PD_MSG_CTRL_REJECT :
 					   PD_MSG_CTRL_NOT_SUPP,
 					   NONE_AMS);
-		else
+		} else {
+			if (port->vdm_sm_running) {
+				tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
+				break;
+			}
+
 			tcpm_pd_handle_state(port, PR_SWAP_ACCEPT,
 					     POWER_ROLE_SWAP, 0);
+		}
 		break;
 	case PD_CTRL_VCONN_SWAP:
+		if (port->vdm_sm_running) {
+			tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
+			break;
+		}
+
 		tcpm_pd_handle_state(port, VCONN_SWAP_ACCEPT, VCONN_SWAP, 0);
 		break;
 	case PD_CTRL_GET_SOURCE_CAP_EXT:
@@ -3359,6 +3410,7 @@ static void tcpm_reset_port(struct tcpm_port *port)
 	}
 	port->in_ams = false;
 	port->ams = NONE_AMS;
+	port->vdm_sm_running = false;
 	tcpm_unregister_altmodes(port);
 	tcpm_typec_disconnect(port);
 	port->attached = false;
@@ -4157,6 +4209,9 @@ static void run_state_machine(struct tcpm_port *port)
 		break;
 	case DR_SWAP_ACCEPT:
 		tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
+		/* Set VDM state machine running flag ASAP */
+		if (port->data_role == TYPEC_DEVICE && port->send_discover)
+			port->vdm_sm_running = true;
 		tcpm_set_state_cond(port, DR_SWAP_CHANGE_DR, 0);
 		break;
 	case DR_SWAP_SEND_TIMEOUT:
@@ -4312,6 +4367,8 @@ static void run_state_machine(struct tcpm_port *port)
 		break;
 	case VCONN_SWAP_SEND_TIMEOUT:
 		tcpm_swap_complete(port, -ETIMEDOUT);
+		if (port->data_role == TYPEC_HOST && port->send_discover)
+			port->vdm_sm_running = true;
 		tcpm_set_state(port, ready_state(port), 0);
 		break;
 	case VCONN_SWAP_START:
@@ -4327,10 +4384,14 @@ static void run_state_machine(struct tcpm_port *port)
 	case VCONN_SWAP_TURN_ON_VCONN:
 		tcpm_set_vconn(port, true);
 		tcpm_pd_send_control(port, PD_CTRL_PS_RDY);
+		if (port->data_role == TYPEC_HOST && port->send_discover)
+			port->vdm_sm_running = true;
 		tcpm_set_state(port, ready_state(port), 0);
 		break;
 	case VCONN_SWAP_TURN_OFF_VCONN:
 		tcpm_set_vconn(port, false);
+		if (port->data_role == TYPEC_HOST && port->send_discover)
+			port->vdm_sm_running = true;
 		tcpm_set_state(port, ready_state(port), 0);
 		break;
 
@@ -4338,6 +4399,8 @@ static void run_state_machine(struct tcpm_port *port)
 	case PR_SWAP_CANCEL:
 	case VCONN_SWAP_CANCEL:
 		tcpm_swap_complete(port, port->swap_status);
+		if (port->data_role == TYPEC_HOST && port->send_discover)
+			port->vdm_sm_running = true;
 		if (port->pwr_role == TYPEC_SOURCE)
 			tcpm_set_state(port, SRC_READY, 0);
 		else
@@ -4668,6 +4731,9 @@ static void _tcpm_pd_vbus_on(struct tcpm_port *port)
 	switch (port->state) {
 	case SNK_TRANSITION_SINK_VBUS:
 		port->explicit_contract = true;
+		/* Set the VDM flag ASAP */
+		if (port->data_role == TYPEC_HOST && port->send_discover)
+			port->vdm_sm_running = true;
 		tcpm_set_state(port, SNK_READY, 0);
 		break;
 	case SNK_DISCOVERY:
-- 
2.29.2.729.g45daf8777d-goog

