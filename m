Return-Path: <linux-usb+bounces-15413-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1D7985150
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 05:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4419284B53
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 03:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12B81534EC;
	Wed, 25 Sep 2024 03:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hf1YRsE3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA8E14BF8A
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 03:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727233915; cv=none; b=qP/JCSvd0A/W52pSNrXExuRCvw2joeiuC03A4Rcx63wY4DQHcfHePCQp3MTanu4fBwSTR8kp4vNNONCzJa/zyYQeWZs5vmysa2Vzbf8ncUlEcQx9WYfGr6rYlZiSBIycazC5eKdka+s9uJ8i5NK3f7ZXy27nZNnWJnbRL2aZDq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727233915; c=relaxed/simple;
	bh=IUmkiF+knz9hs0ovUdm1Vj+4oa9bRHW0yd4qyfR0RRE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D5seeFrqJ9FIcsWyHPsvWsNrm6eYu/5ZEO0zsaahtkG0x6bI6ACTYJqHu3witEpw7yMq8ggvW9e0y7QRDLOL1EE51E2t7oDNwzgAlWuyiR53KKVSlcWFNu5010nIfeIImXTcOYnuOnCYDw6CsnB4j86r9fxEs749cmJu1gVd1A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hf1YRsE3; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e17bb508bb9so9872067276.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2024 20:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727233911; x=1727838711; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lNpn6Fg7tnJm0pUhtj1Rgrbxy0nCLf7PbUPZLOA7XRg=;
        b=Hf1YRsE3szG5KZbDlskMFUr5uovO0c2EYRONMz2TCuEaJs6hu72aJSKAHwbFLsghLN
         lzVpVSfes8uAgnVY4HU0GQU67dbO7jm4AtlM46Gm78vD3sLy6LWcOTZMqMs947Zub8X4
         al4IAxEvVugtdygzDUVx0U3PV8q842F4obXUumg+qlBHIQWHmCFAu6g+uWYM6obXmPzp
         HlBfuZdE6/qRa5oVxKQie3I2rpiYSDqegO+5t36XIalDX4zjcmND8peEKm7Xn5GzPfTU
         Ilv+wNoLlG65CVeXNR0Pls/1WL3lO8jL0QViRFAOH2rS9JtNM7toNV8ordDM2f733e8p
         Errg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727233911; x=1727838711;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lNpn6Fg7tnJm0pUhtj1Rgrbxy0nCLf7PbUPZLOA7XRg=;
        b=C/vwLDmNMeAXdwZ7ZJYOzu07NL+FeZCzibuZm0OZxJ4iXkCEdbw7bKYMHWX+zbYjxw
         h6sAdPbvO5rdAcz3bnVfeYuvPpi9ABGAcJXgC03glca2ynaQ2lVht4jtslll1AyCgCz0
         xSC8ttveoI3B0EUWKRLzpRUeCRYL1T2L50+sSmpAy1M9tPVB0cTDRcvJofSr9fVt2T6E
         Uw0Y2S14DTkrXtVpjdoi4YQL62sFSm4djxYlFPmI7Ktbd10Hj2iX64YdlZlqYELj/eoQ
         fvoO14fDEJkivQVsadTv13QybRzBsSzO6+WEIDiIPmis1CIgHMUXReT+A+mkuxMqNHQs
         aGvw==
X-Forwarded-Encrypted: i=1; AJvYcCVYygmQP6CYLau1lOH34IfqrzDxSdU+7n5CrnhdOtKrHB8A8n2B3ZfKVpOnorjV1WrSoP8qhFoeW/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVMrpg21Wt/iJhEFPY2h0cttgTfHQ5wIe+Gcwj7g+eBTNdLkBO
	B6Jlc/k5G13kRqzD3PQlVWozwEHcsbVKkOSEZ0tqaEPcTaJlSHpix7POf2PIs+ResPjZhgLFx+r
	5gg==
X-Google-Smtp-Source: AGHT+IHGdy4BNzel59+U5u1vQl6UWt7exhB8DT1fxnO2MIX0ypO3O+hJqgpY4CYiRKBqe3Ykwf3OFwh9GRE=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a05:6902:292:b0:e1a:a29d:33f6 with SMTP id
 3f1490d57ef6-e24d7825591mr7112276.3.1727233911438; Tue, 24 Sep 2024 20:11:51
 -0700 (PDT)
Date: Tue, 24 Sep 2024 20:11:31 -0700
In-Reply-To: <20240925031135.1101048-1-amitsd@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925031135.1101048-1-amitsd@google.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925031135.1101048-3-amitsd@google.com>
Subject: [RFC v4 2/2] usb: typec: tcpm: Add support for parsing time dt properties
From: Amit Sunil Dhamne <amitsd@google.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, dmitry.baryshkov@linaro.org, 
	heikki.krogerus@linux.intel.com
Cc: badhri@google.com, kyletso@google.com, rdbabiera@google.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for DT time properties to allow users to define platform
specific timing deadlines of certain timers rather than using hardcoded
ones. For values that have not been explicitly defined in DT using this
property, default values will be set therefore, making this change
backward compatible.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 73 +++++++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 4b02d6474259..5a661b925eba 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -310,6 +310,17 @@ struct pd_data {
 	unsigned int operating_snk_mw;
 };
 
+/*
+ * @sink_wait_cap_time: Deadline (in ms) for tTypeCSinkWaitCap timer
+ * @ps_src_wait_off_time: Deadline (in ms) for tPSSourceOff timer
+ * @cc_debounce_time: Deadline (in ms) for tCCDebounce timer
+ */
+struct pd_timings {
+	u32 sink_wait_cap_time;
+	u32 ps_src_off_time;
+	u32 cc_debounce_time;
+};
+
 struct tcpm_port {
 	struct device *dev;
 
@@ -552,6 +563,9 @@ struct tcpm_port {
 	 */
 	unsigned int message_id_prime;
 	unsigned int rx_msgid_prime;
+
+	/* Timer deadline values configured at runtime */
+	struct pd_timings timings;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *dentry;
 	struct mutex logbuffer_lock;	/* log buffer access lock */
@@ -4639,15 +4653,15 @@ static void run_state_machine(struct tcpm_port *port)
 	case SRC_ATTACH_WAIT:
 		if (tcpm_port_is_debug(port))
 			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
-				       PD_T_CC_DEBOUNCE);
+				       port->timings.cc_debounce_time);
 		else if (tcpm_port_is_audio(port))
 			tcpm_set_state(port, AUDIO_ACC_ATTACHED,
-				       PD_T_CC_DEBOUNCE);
+				       port->timings.cc_debounce_time);
 		else if (tcpm_port_is_source(port) && port->vbus_vsafe0v)
 			tcpm_set_state(port,
 				       tcpm_try_snk(port) ? SNK_TRY
 							  : SRC_ATTACHED,
-				       PD_T_CC_DEBOUNCE);
+				       port->timings.cc_debounce_time);
 		break;
 
 	case SNK_TRY:
@@ -4698,7 +4712,7 @@ static void run_state_machine(struct tcpm_port *port)
 		}
 		break;
 	case SRC_TRYWAIT_DEBOUNCE:
-		tcpm_set_state(port, SRC_ATTACHED, PD_T_CC_DEBOUNCE);
+		tcpm_set_state(port, SRC_ATTACHED, port->timings.cc_debounce_time);
 		break;
 	case SRC_TRYWAIT_UNATTACHED:
 		tcpm_set_state(port, SNK_UNATTACHED, 0);
@@ -4901,7 +4915,7 @@ static void run_state_machine(struct tcpm_port *port)
 		    (port->cc1 != TYPEC_CC_OPEN &&
 		     port->cc2 == TYPEC_CC_OPEN))
 			tcpm_set_state(port, SNK_DEBOUNCED,
-				       PD_T_CC_DEBOUNCE);
+				       port->timings.cc_debounce_time);
 		else if (tcpm_port_is_disconnected(port))
 			tcpm_set_state(port, SNK_UNATTACHED,
 				       PD_T_PD_DEBOUNCE);
@@ -4941,7 +4955,7 @@ static void run_state_machine(struct tcpm_port *port)
 		break;
 	case SNK_TRYWAIT:
 		tcpm_set_cc(port, TYPEC_CC_RD);
-		tcpm_set_state(port, SNK_TRYWAIT_VBUS, PD_T_CC_DEBOUNCE);
+		tcpm_set_state(port, SNK_TRYWAIT_VBUS, port->timings.cc_debounce_time);
 		break;
 	case SNK_TRYWAIT_VBUS:
 		/*
@@ -5014,7 +5028,7 @@ static void run_state_machine(struct tcpm_port *port)
 		break;
 	case SNK_DISCOVERY_DEBOUNCE:
 		tcpm_set_state(port, SNK_DISCOVERY_DEBOUNCE_DONE,
-			       PD_T_CC_DEBOUNCE);
+			       port->timings.cc_debounce_time);
 		break;
 	case SNK_DISCOVERY_DEBOUNCE_DONE:
 		if (!tcpm_port_is_disconnected(port) &&
@@ -5041,10 +5055,10 @@ static void run_state_machine(struct tcpm_port *port)
 		if (port->vbus_never_low) {
 			port->vbus_never_low = false;
 			tcpm_set_state(port, SNK_SOFT_RESET,
-				       PD_T_SINK_WAIT_CAP);
+				       port->timings.sink_wait_cap_time);
 		} else {
 			tcpm_set_state(port, SNK_WAIT_CAPABILITIES_TIMEOUT,
-				       PD_T_SINK_WAIT_CAP);
+				       port->timings.sink_wait_cap_time);
 		}
 		break;
 	case SNK_WAIT_CAPABILITIES_TIMEOUT:
@@ -5066,7 +5080,8 @@ static void run_state_machine(struct tcpm_port *port)
 		if (tcpm_pd_send_control(port, PD_CTRL_GET_SOURCE_CAP, TCPC_TX_SOP))
 			tcpm_set_state_cond(port, hard_reset_state(port), 0);
 		else
-			tcpm_set_state(port, hard_reset_state(port), PD_T_SINK_WAIT_CAP);
+			tcpm_set_state(port, hard_reset_state(port),
+				       port->timings.sink_wait_cap_time);
 		break;
 	case SNK_NEGOTIATE_CAPABILITIES:
 		port->pd_capable = true;
@@ -5203,7 +5218,7 @@ static void run_state_machine(struct tcpm_port *port)
 			tcpm_set_state(port, ACC_UNATTACHED, 0);
 		break;
 	case AUDIO_ACC_DEBOUNCE:
-		tcpm_set_state(port, ACC_UNATTACHED, PD_T_CC_DEBOUNCE);
+		tcpm_set_state(port, ACC_UNATTACHED, port->timings.cc_debounce_time);
 		break;
 
 	/* Hard_Reset states */
@@ -5420,7 +5435,7 @@ static void run_state_machine(struct tcpm_port *port)
 		tcpm_set_state(port, ERROR_RECOVERY, 0);
 		break;
 	case FR_SWAP_SNK_SRC_TRANSITION_TO_OFF:
-		tcpm_set_state(port, ERROR_RECOVERY, PD_T_PS_SOURCE_OFF);
+		tcpm_set_state(port, ERROR_RECOVERY, port->timings.ps_src_off_time);
 		break;
 	case FR_SWAP_SNK_SRC_NEW_SINK_READY:
 		if (port->vbus_source)
@@ -5475,7 +5490,7 @@ static void run_state_machine(struct tcpm_port *port)
 		tcpm_set_cc(port, TYPEC_CC_RD);
 		/* allow CC debounce */
 		tcpm_set_state(port, PR_SWAP_SRC_SNK_SOURCE_OFF_CC_DEBOUNCED,
-			       PD_T_CC_DEBOUNCE);
+			       port->timings.cc_debounce_time);
 		break;
 	case PR_SWAP_SRC_SNK_SOURCE_OFF_CC_DEBOUNCED:
 		/*
@@ -5510,7 +5525,7 @@ static void run_state_machine(struct tcpm_port *port)
 						       port->pps_data.active, 0);
 		tcpm_set_charge(port, false);
 		tcpm_set_state(port, hard_reset_state(port),
-			       PD_T_PS_SOURCE_OFF);
+			       port->timings.ps_src_off_time);
 		break;
 	case PR_SWAP_SNK_SRC_SOURCE_ON:
 		tcpm_enable_auto_vbus_discharge(port, true);
@@ -5666,7 +5681,7 @@ static void run_state_machine(struct tcpm_port *port)
 	case PORT_RESET_WAIT_OFF:
 		tcpm_set_state(port,
 			       tcpm_default_state(port),
-			       port->vbus_present ? PD_T_PS_SOURCE_OFF : 0);
+			       port->vbus_present ? port->timings.ps_src_off_time : 0);
 		break;
 
 	/* AMS intermediate state */
@@ -6157,7 +6172,7 @@ static void _tcpm_pd_vbus_vsafe0v(struct tcpm_port *port)
 	case SRC_ATTACH_WAIT:
 		if (tcpm_port_is_source(port))
 			tcpm_set_state(port, tcpm_try_snk(port) ? SNK_TRY : SRC_ATTACHED,
-				       PD_T_CC_DEBOUNCE);
+				       port->timings.cc_debounce_time);
 		break;
 	case SRC_STARTUP:
 	case SRC_SEND_CAPABILITIES:
@@ -7053,6 +7068,30 @@ static int tcpm_port_register_pd(struct tcpm_port *port)
 	return ret;
 }
 
+static void tcpm_fw_get_timings(struct tcpm_port *port, struct fwnode_handle *fwnode)
+{
+	int ret;
+	u32 val;
+
+	ret = fwnode_property_read_u32(fwnode, "sink-wait-cap-time-ms", &val);
+	if (!ret)
+		port->timings.sink_wait_cap_time = val;
+	else
+		port->timings.sink_wait_cap_time = PD_T_SINK_WAIT_CAP;
+
+	ret = fwnode_property_read_u32(fwnode, "ps-source-off-time-ms", &val);
+	if (!ret)
+		port->timings.ps_src_off_time = val;
+	else
+		port->timings.ps_src_off_time = PD_T_PS_SOURCE_OFF;
+
+	ret = fwnode_property_read_u32(fwnode, "cc-debounce-time-ms", &val);
+	if (!ret)
+		port->timings.cc_debounce_time = val;
+	else
+		port->timings.cc_debounce_time = PD_T_CC_DEBOUNCE;
+}
+
 static int tcpm_fw_get_caps(struct tcpm_port *port, struct fwnode_handle *fwnode)
 {
 	struct fwnode_handle *capabilities, *child, *caps = NULL;
@@ -7615,6 +7654,8 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	if (err < 0)
 		goto out_destroy_wq;
 
+	tcpm_fw_get_timings(port, tcpc->fwnode);
+
 	port->try_role = port->typec_caps.prefer_role;
 
 	port->typec_caps.revision = 0x0120;	/* Type-C spec release 1.2 */
-- 
2.46.0.792.g87dc391469-goog


