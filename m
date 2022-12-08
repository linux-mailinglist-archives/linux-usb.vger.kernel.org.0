Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79A546466B2
	for <lists+linux-usb@lfdr.de>; Thu,  8 Dec 2022 03:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiLHCAt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Dec 2022 21:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiLHCAs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Dec 2022 21:00:48 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400247E403
        for <linux-usb@vger.kernel.org>; Wed,  7 Dec 2022 18:00:47 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id a4-20020a5b0004000000b006fdc6aaec4fso16063952ybp.20
        for <linux-usb@vger.kernel.org>; Wed, 07 Dec 2022 18:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gg7uvAOdpyEub2UHnmW2qmJ2HAntmcgxkViRZYZxbUQ=;
        b=GNpQFhnCw6y3yKFv8Ilxk4/JuAMfWFAWt+0mSXxEFihjqfVatwbk8Y1tcfjLEL3UvI
         ooLUDx+1NUVpeTLrWnDZQyfmPdmybC66Kv6ZvSXGrRAI15bT2/jjOhfIaQkGfe+P2YTi
         +Q2nNXOnQM4f+joBKvLBRt6nD/3rBKvdFVRpmFKkxiajhfUUYU2eYP7lssBtDnQpbxzJ
         PWUnKnfTbWWFiRIxnmj6e8J3QP3won/FoI1HzBpAmBVV55c25BJ1KnCEKXLYGQwcdbEx
         5OqZUji3gcaABrvR3ZKPuOofwKqkrBMv5m6MahroXFUMLOQMQjXm6MbygdxBRCAldZQM
         iAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gg7uvAOdpyEub2UHnmW2qmJ2HAntmcgxkViRZYZxbUQ=;
        b=K2voqBEH2WlvZpWS+Vwnz39dKPp6U+OCf8CZWt+a7R6OqLOklXBOtTa6rJj6dU4FaG
         TZ2HewEmLqhFllwr6JJoD96ANq8bnm2Rm5o9HdcWUb2y+qdBHDioWGmtdIlMDKPhwRov
         7nQj1wYEb332S+lmMNGvsIzZWv+yNGfKHSAnJPiJ083LZU45NXDI5WJ801Pe7BnXvbOA
         Orm9wdmHZYoDw3QwqfrlQY6aR+cQ+x0pd5uQPxDwxUzxTwvnnSWSLKWI+QdH7GFvF61o
         qGsZKawatjpVWqrGnSqGc8PhHbzLjC2nS2JSsdAXj2+ZyeD5xKYr7KeSbwQWkZuidhGo
         zQtQ==
X-Gm-Message-State: ANoB5pk3cAVi5EVjfTIpvzGttJ0wEdXRIUmEUwNemUfhJAOe+ITOPzWC
        057sZ9pf9i4EtLgBCgwCyLUFrFm05as=
X-Google-Smtp-Source: AA0mqf7HXln7vjChU0YbV/kVPArNiFPeaq+v2VbRd5PC8MlGMTlV8728W4ecdXuqKhHfuopHL1SZD+AuPT8=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:592e:36a9:5604:2233])
 (user=badhri job=sendgmr) by 2002:a25:e7c7:0:b0:6f2:eff3:a311 with SMTP id
 e190-20020a25e7c7000000b006f2eff3a311mr58478829ybh.258.1670464846523; Wed, 07
 Dec 2022 18:00:46 -0800 (PST)
Date:   Wed,  7 Dec 2022 18:00:41 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Message-ID: <20221208020043.374033-1-badhri@google.com>
Subject: [PATCH v5 1/3] usb: typec: tcpm: Add callbacks to mitigate wakeups
 due to contaminant
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On some of the TCPC implementations, when the Type-C port is exposed
to contaminants, such as water, TCPC stops toggling while reporting OPEN
either by the time TCPM reads CC pin status or during CC debounce
window. This causes TCPM to be stuck in TOGGLING state. If TCPM is made
to restart toggling, the behavior recurs causing redundant CPU wakeups
till the USB-C port is free of contaminant.

[206199.287817] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
[206199.640337] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
[206199.985789] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
...

TCPM invokes is_potential_contaminant callback to allow low level chip
drivers to monitor TCPM state machine transitions and notify TCPM when
the Type-C port needs to be checked for potential contaminant presence.
TCPCs which do have the needed hardware can implement the check_contaminant
callback which is invoked by TCPM to evaluate for presence of contaminant.
Lower level TCPC driver can restart toggling through TCPM_PORT_CLEAN event
when the driver detects that USB-C port is free of contaminant.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Change-Id: I136d788bb46d871d12e64bd73fd50a77b4659dbf
---
Changes since v4:
* None
Changes since v3:
* None
Changes since V2:
* Offloaded tcpm from maintaining disconnect_while_debouncing logic
* to lower level maxim tcpc driver based on feedback.
---
 drivers/usb/typec/tcpm/tcpm.c | 162 +++++++++-------------------------
 include/linux/usb/tcpm.h      | 133 ++++++++++++++++++++++++++++
 2 files changed, 177 insertions(+), 118 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 904c7b4ce2f0..a138cea49612 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -33,119 +33,6 @@
 
 #include <uapi/linux/sched/types.h>
 
-#define FOREACH_STATE(S)			\
-	S(INVALID_STATE),			\
-	S(TOGGLING),			\
-	S(SRC_UNATTACHED),			\
-	S(SRC_ATTACH_WAIT),			\
-	S(SRC_ATTACHED),			\
-	S(SRC_STARTUP),				\
-	S(SRC_SEND_CAPABILITIES),		\
-	S(SRC_SEND_CAPABILITIES_TIMEOUT),	\
-	S(SRC_NEGOTIATE_CAPABILITIES),		\
-	S(SRC_TRANSITION_SUPPLY),		\
-	S(SRC_READY),				\
-	S(SRC_WAIT_NEW_CAPABILITIES),		\
-						\
-	S(SNK_UNATTACHED),			\
-	S(SNK_ATTACH_WAIT),			\
-	S(SNK_DEBOUNCED),			\
-	S(SNK_ATTACHED),			\
-	S(SNK_STARTUP),				\
-	S(SNK_DISCOVERY),			\
-	S(SNK_DISCOVERY_DEBOUNCE),		\
-	S(SNK_DISCOVERY_DEBOUNCE_DONE),		\
-	S(SNK_WAIT_CAPABILITIES),		\
-	S(SNK_NEGOTIATE_CAPABILITIES),		\
-	S(SNK_NEGOTIATE_PPS_CAPABILITIES),	\
-	S(SNK_TRANSITION_SINK),			\
-	S(SNK_TRANSITION_SINK_VBUS),		\
-	S(SNK_READY),				\
-						\
-	S(ACC_UNATTACHED),			\
-	S(DEBUG_ACC_ATTACHED),			\
-	S(AUDIO_ACC_ATTACHED),			\
-	S(AUDIO_ACC_DEBOUNCE),			\
-						\
-	S(HARD_RESET_SEND),			\
-	S(HARD_RESET_START),			\
-	S(SRC_HARD_RESET_VBUS_OFF),		\
-	S(SRC_HARD_RESET_VBUS_ON),		\
-	S(SNK_HARD_RESET_SINK_OFF),		\
-	S(SNK_HARD_RESET_WAIT_VBUS),		\
-	S(SNK_HARD_RESET_SINK_ON),		\
-						\
-	S(SOFT_RESET),				\
-	S(SRC_SOFT_RESET_WAIT_SNK_TX),		\
-	S(SNK_SOFT_RESET),			\
-	S(SOFT_RESET_SEND),			\
-						\
-	S(DR_SWAP_ACCEPT),			\
-	S(DR_SWAP_SEND),			\
-	S(DR_SWAP_SEND_TIMEOUT),		\
-	S(DR_SWAP_CANCEL),			\
-	S(DR_SWAP_CHANGE_DR),			\
-						\
-	S(PR_SWAP_ACCEPT),			\
-	S(PR_SWAP_SEND),			\
-	S(PR_SWAP_SEND_TIMEOUT),		\
-	S(PR_SWAP_CANCEL),			\
-	S(PR_SWAP_START),			\
-	S(PR_SWAP_SRC_SNK_TRANSITION_OFF),	\
-	S(PR_SWAP_SRC_SNK_SOURCE_OFF),		\
-	S(PR_SWAP_SRC_SNK_SOURCE_OFF_CC_DEBOUNCED), \
-	S(PR_SWAP_SRC_SNK_SINK_ON),		\
-	S(PR_SWAP_SNK_SRC_SINK_OFF),		\
-	S(PR_SWAP_SNK_SRC_SOURCE_ON),		\
-	S(PR_SWAP_SNK_SRC_SOURCE_ON_VBUS_RAMPED_UP),    \
-						\
-	S(VCONN_SWAP_ACCEPT),			\
-	S(VCONN_SWAP_SEND),			\
-	S(VCONN_SWAP_SEND_TIMEOUT),		\
-	S(VCONN_SWAP_CANCEL),			\
-	S(VCONN_SWAP_START),			\
-	S(VCONN_SWAP_WAIT_FOR_VCONN),		\
-	S(VCONN_SWAP_TURN_ON_VCONN),		\
-	S(VCONN_SWAP_TURN_OFF_VCONN),		\
-						\
-	S(FR_SWAP_SEND),			\
-	S(FR_SWAP_SEND_TIMEOUT),		\
-	S(FR_SWAP_SNK_SRC_TRANSITION_TO_OFF),			\
-	S(FR_SWAP_SNK_SRC_NEW_SINK_READY),		\
-	S(FR_SWAP_SNK_SRC_SOURCE_VBUS_APPLIED),	\
-	S(FR_SWAP_CANCEL),			\
-						\
-	S(SNK_TRY),				\
-	S(SNK_TRY_WAIT),			\
-	S(SNK_TRY_WAIT_DEBOUNCE),               \
-	S(SNK_TRY_WAIT_DEBOUNCE_CHECK_VBUS),    \
-	S(SRC_TRYWAIT),				\
-	S(SRC_TRYWAIT_DEBOUNCE),		\
-	S(SRC_TRYWAIT_UNATTACHED),		\
-						\
-	S(SRC_TRY),				\
-	S(SRC_TRY_WAIT),                        \
-	S(SRC_TRY_DEBOUNCE),			\
-	S(SNK_TRYWAIT),				\
-	S(SNK_TRYWAIT_DEBOUNCE),		\
-	S(SNK_TRYWAIT_VBUS),			\
-	S(BIST_RX),				\
-						\
-	S(GET_STATUS_SEND),			\
-	S(GET_STATUS_SEND_TIMEOUT),		\
-	S(GET_PPS_STATUS_SEND),			\
-	S(GET_PPS_STATUS_SEND_TIMEOUT),		\
-						\
-	S(GET_SINK_CAP),			\
-	S(GET_SINK_CAP_TIMEOUT),		\
-						\
-	S(ERROR_RECOVERY),			\
-	S(PORT_RESET),				\
-	S(PORT_RESET_WAIT_OFF),			\
-						\
-	S(AMS_START),				\
-	S(CHUNK_NOT_SUPP)
-
 #define FOREACH_AMS(S)				\
 	S(NONE_AMS),				\
 	S(POWER_NEGOTIATION),			\
@@ -182,13 +69,8 @@
 	S(COUNTRY_INFO),			\
 	S(COUNTRY_CODES)
 
-#define GENERATE_ENUM(e)	e
 #define GENERATE_STRING(s)	#s
 
-enum tcpm_state {
-	FOREACH_STATE(GENERATE_ENUM)
-};
-
 static const char * const tcpm_states[] = {
 	FOREACH_STATE(GENERATE_STRING)
 };
@@ -249,6 +131,7 @@ enum frs_typec_current {
 #define TCPM_RESET_EVENT	BIT(2)
 #define TCPM_FRS_EVENT		BIT(3)
 #define TCPM_SOURCING_VBUS	BIT(4)
+#define TCPM_PORT_CLEAN		BIT(5)
 
 #define LOG_BUFFER_ENTRIES	1024
 #define LOG_BUFFER_ENTRY_SIZE	128
@@ -483,6 +366,14 @@ struct tcpm_port {
 	 * SNK_READY for non-pd link.
 	 */
 	bool slow_charger_loop;
+
+	/*
+	 * When true indicates that the lower level drivers indicate potential presence
+	 * of contaminant in the connector pins based on the tcpm state machine
+	 * transitions.
+	 */
+	bool potential_contaminant;
+
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *dentry;
 	struct mutex logbuffer_lock;	/* log buffer access lock */
@@ -3904,15 +3795,26 @@ static void run_state_machine(struct tcpm_port *port)
 	unsigned int msecs;
 	enum tcpm_state upcoming_state;
 
+	if (port->tcpc->is_potential_contaminant)
+		port->potential_contaminant =
+			port->tcpc->is_potential_contaminant(port->tcpc, port->state);
+
 	port->enter_state = port->state;
 	switch (port->state) {
 	case TOGGLING:
 		break;
+	case CHECK_CONTAMINANT:
+		port->tcpc->check_contaminant(port->tcpc);
+		break;
 	/* SRC states */
 	case SRC_UNATTACHED:
 		if (!port->non_pd_role_swap)
 			tcpm_swap_complete(port, -ENOTCONN);
 		tcpm_src_detach(port);
+		if (port->potential_contaminant && port->tcpc->check_contaminant) {
+			tcpm_set_state(port, CHECK_CONTAMINANT, 0);
+			break;
+		}
 		if (tcpm_start_toggling(port, tcpm_rp_cc(port))) {
 			tcpm_set_state(port, TOGGLING, 0);
 			break;
@@ -4150,6 +4052,10 @@ static void run_state_machine(struct tcpm_port *port)
 			tcpm_swap_complete(port, -ENOTCONN);
 		tcpm_pps_complete(port, -ENOTCONN);
 		tcpm_snk_detach(port);
+		if (port->potential_contaminant && port->tcpc->check_contaminant) {
+			tcpm_set_state(port, CHECK_CONTAMINANT, 0);
+			break;
+		}
 		if (tcpm_start_toggling(port, TYPEC_CC_RD)) {
 			tcpm_set_state(port, TOGGLING, 0);
 			break;
@@ -4926,6 +4832,9 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
 		else if (tcpm_port_is_sink(port))
 			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
 		break;
+	case CHECK_CONTAMINANT:
+		/* Wait for Toggling to be resumed */
+		break;
 	case SRC_UNATTACHED:
 	case ACC_UNATTACHED:
 		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
@@ -5425,6 +5334,10 @@ static void tcpm_pd_event_handler(struct kthread_work *work)
 			port->vbus_source = true;
 			_tcpm_pd_vbus_on(port);
 		}
+		if (events & TCPM_PORT_CLEAN) {
+			tcpm_log(port, "port clean");
+			tcpm_set_state(port, TOGGLING, 0);
+		}
 
 		spin_lock(&port->pd_event_lock);
 	}
@@ -5477,6 +5390,19 @@ void tcpm_sourcing_vbus(struct tcpm_port *port)
 }
 EXPORT_SYMBOL_GPL(tcpm_sourcing_vbus);
 
+/*
+ * Low level tcpc drivers invoke this once the port is deemed clean to return
+ * the port to TOGGLING state.
+ */
+void tcpm_port_clean(struct tcpm_port *port)
+{
+	spin_lock(&port->pd_event_lock);
+	port->pd_events |= TCPM_PORT_CLEAN;
+	spin_unlock(&port->pd_event_lock);
+	kthread_queue_work(port->wq, &port->event_work);
+}
+EXPORT_SYMBOL_GPL(tcpm_port_clean);
+
 static void tcpm_enable_frs_work(struct kthread_work *work)
 {
 	struct tcpm_port *port = container_of(work, struct tcpm_port, enable_frs);
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index bffc8d3e14ad..9cf16372a6e4 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -10,6 +10,126 @@
 #include <linux/usb/typec.h>
 #include "pd.h"
 
+#define FOREACH_STATE(S)			\
+	S(INVALID_STATE),			\
+	S(TOGGLING),			\
+	S(CHECK_CONTAMINANT),			\
+	S(SRC_UNATTACHED),			\
+	S(SRC_ATTACH_WAIT),			\
+	S(SRC_ATTACHED),			\
+	S(SRC_STARTUP),				\
+	S(SRC_SEND_CAPABILITIES),		\
+	S(SRC_SEND_CAPABILITIES_TIMEOUT),	\
+	S(SRC_NEGOTIATE_CAPABILITIES),		\
+	S(SRC_TRANSITION_SUPPLY),		\
+	S(SRC_READY),				\
+	S(SRC_WAIT_NEW_CAPABILITIES),		\
+						\
+	S(SNK_UNATTACHED),			\
+	S(SNK_ATTACH_WAIT),			\
+	S(SNK_DEBOUNCED),			\
+	S(SNK_ATTACHED),			\
+	S(SNK_STARTUP),				\
+	S(SNK_DISCOVERY),			\
+	S(SNK_DISCOVERY_DEBOUNCE),		\
+	S(SNK_DISCOVERY_DEBOUNCE_DONE),		\
+	S(SNK_WAIT_CAPABILITIES),		\
+	S(SNK_NEGOTIATE_CAPABILITIES),		\
+	S(SNK_NEGOTIATE_PPS_CAPABILITIES),	\
+	S(SNK_TRANSITION_SINK),			\
+	S(SNK_TRANSITION_SINK_VBUS),		\
+	S(SNK_READY),				\
+						\
+	S(ACC_UNATTACHED),			\
+	S(DEBUG_ACC_ATTACHED),			\
+	S(AUDIO_ACC_ATTACHED),			\
+	S(AUDIO_ACC_DEBOUNCE),			\
+						\
+	S(HARD_RESET_SEND),			\
+	S(HARD_RESET_START),			\
+	S(SRC_HARD_RESET_VBUS_OFF),		\
+	S(SRC_HARD_RESET_VBUS_ON),		\
+	S(SNK_HARD_RESET_SINK_OFF),		\
+	S(SNK_HARD_RESET_WAIT_VBUS),		\
+	S(SNK_HARD_RESET_SINK_ON),		\
+						\
+	S(SOFT_RESET),				\
+	S(SRC_SOFT_RESET_WAIT_SNK_TX),		\
+	S(SNK_SOFT_RESET),			\
+	S(SOFT_RESET_SEND),			\
+						\
+	S(DR_SWAP_ACCEPT),			\
+	S(DR_SWAP_SEND),			\
+	S(DR_SWAP_SEND_TIMEOUT),		\
+	S(DR_SWAP_CANCEL),			\
+	S(DR_SWAP_CHANGE_DR),			\
+						\
+	S(PR_SWAP_ACCEPT),			\
+	S(PR_SWAP_SEND),			\
+	S(PR_SWAP_SEND_TIMEOUT),		\
+	S(PR_SWAP_CANCEL),			\
+	S(PR_SWAP_START),			\
+	S(PR_SWAP_SRC_SNK_TRANSITION_OFF),	\
+	S(PR_SWAP_SRC_SNK_SOURCE_OFF),		\
+	S(PR_SWAP_SRC_SNK_SOURCE_OFF_CC_DEBOUNCED), \
+	S(PR_SWAP_SRC_SNK_SINK_ON),		\
+	S(PR_SWAP_SNK_SRC_SINK_OFF),		\
+	S(PR_SWAP_SNK_SRC_SOURCE_ON),		\
+	S(PR_SWAP_SNK_SRC_SOURCE_ON_VBUS_RAMPED_UP),    \
+						\
+	S(VCONN_SWAP_ACCEPT),			\
+	S(VCONN_SWAP_SEND),			\
+	S(VCONN_SWAP_SEND_TIMEOUT),		\
+	S(VCONN_SWAP_CANCEL),			\
+	S(VCONN_SWAP_START),			\
+	S(VCONN_SWAP_WAIT_FOR_VCONN),		\
+	S(VCONN_SWAP_TURN_ON_VCONN),		\
+	S(VCONN_SWAP_TURN_OFF_VCONN),		\
+						\
+	S(FR_SWAP_SEND),			\
+	S(FR_SWAP_SEND_TIMEOUT),		\
+	S(FR_SWAP_SNK_SRC_TRANSITION_TO_OFF),			\
+	S(FR_SWAP_SNK_SRC_NEW_SINK_READY),		\
+	S(FR_SWAP_SNK_SRC_SOURCE_VBUS_APPLIED),	\
+	S(FR_SWAP_CANCEL),			\
+						\
+	S(SNK_TRY),				\
+	S(SNK_TRY_WAIT),			\
+	S(SNK_TRY_WAIT_DEBOUNCE),               \
+	S(SNK_TRY_WAIT_DEBOUNCE_CHECK_VBUS),    \
+	S(SRC_TRYWAIT),				\
+	S(SRC_TRYWAIT_DEBOUNCE),		\
+	S(SRC_TRYWAIT_UNATTACHED),		\
+						\
+	S(SRC_TRY),				\
+	S(SRC_TRY_WAIT),                        \
+	S(SRC_TRY_DEBOUNCE),			\
+	S(SNK_TRYWAIT),				\
+	S(SNK_TRYWAIT_DEBOUNCE),		\
+	S(SNK_TRYWAIT_VBUS),			\
+	S(BIST_RX),				\
+						\
+	S(GET_STATUS_SEND),			\
+	S(GET_STATUS_SEND_TIMEOUT),		\
+	S(GET_PPS_STATUS_SEND),			\
+	S(GET_PPS_STATUS_SEND_TIMEOUT),		\
+						\
+	S(GET_SINK_CAP),			\
+	S(GET_SINK_CAP_TIMEOUT),		\
+						\
+	S(ERROR_RECOVERY),			\
+	S(PORT_RESET),				\
+	S(PORT_RESET_WAIT_OFF),			\
+						\
+	S(AMS_START),				\
+	S(CHUNK_NOT_SUPP)
+
+#define GENERATE_ENUM(e)	e
+
+enum tcpm_state {
+	FOREACH_STATE(GENERATE_ENUM)
+};
+
 enum typec_cc_status {
 	TYPEC_CC_OPEN,
 	TYPEC_CC_RA,
@@ -114,6 +234,16 @@ enum tcpm_transmit_type {
  *              Optional; The USB Communications Capable bit indicates if port
  *              partner is capable of communication over the USB data lines
  *              (e.g. D+/- or SS Tx/Rx). Called to notify the status of the bit.
+ * @check_contaminant:
+ *		Optional; The callback is invoked when chiplevel drivers indicated
+ *		that the USB port needs to be checked for contaminant presence.
+ *		Chip level drivers are expected to check for contaminant and call
+ *		tcpm_clean_port when the port is clean to put the port back into
+ *		toggling state.
+ * @is_potential_contaminant:
+ *		Optional; TCPM invokes the callback for every TCPM state machine
+ *		transition. Chiplevel drivers can monitor the state machine
+ *		transitions to flag for potential contaminant presence.
  */
 struct tcpc_dev {
 	struct fwnode_handle *fwnode;
@@ -148,6 +278,8 @@ struct tcpc_dev {
 						 bool pps_active, u32 requested_vbus_voltage);
 	bool (*is_vbus_vsafe0v)(struct tcpc_dev *dev);
 	void (*set_partner_usb_comm_capable)(struct tcpc_dev *dev, bool enable);
+	void (*check_contaminant)(struct tcpc_dev *dev);
+	bool (*is_potential_contaminant)(struct tcpc_dev *dev, enum tcpm_state current_state);
 };
 
 struct tcpm_port;
@@ -165,5 +297,6 @@ void tcpm_pd_transmit_complete(struct tcpm_port *port,
 			       enum tcpm_transmit_status status);
 void tcpm_pd_hard_reset(struct tcpm_port *port);
 void tcpm_tcpc_reset(struct tcpm_port *port);
+void tcpm_port_clean(struct tcpm_port *port);
 
 #endif /* __LINUX_USB_TCPM_H */

base-commit: 1524ceb14dd5ebd6f724d993c5ec1a9a8d445d8e
-- 
2.39.0.rc0.267.gcb52ba06e7-goog

