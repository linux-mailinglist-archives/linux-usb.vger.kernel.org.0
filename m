Return-Path: <linux-usb+bounces-15226-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACF997C55F
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 09:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F68DB21A39
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 07:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02391197A95;
	Thu, 19 Sep 2024 07:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n6Fm/38Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3456197A67
	for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 07:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726732318; cv=none; b=mkiyL4SdrlbYxRHt5RZwg6ChraJmHLA6jnPNj7NztgJjbMpkdUu2xZwpbVEGlGBmD25SERjEspePaj5tdsvWLEU3iGGSXVToRJ/HKzBxxrAIIj2nJYdBghH5FnM16JJFzozMsa3mUJ/DaYmVAeeG9tJvdmXCCBYZ3X8/TH+1xkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726732318; c=relaxed/simple;
	bh=oc9D8dO110xDkqc5MrbVCW8xWQkX+zaPbZoMrJy7VPI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rdCIn49lulAGcyF15ikYshQBXnBaEu7XGoYbVuhjSyYYjp0OXCLLNn6507mdc65TUJzyq+5nPgwyRlb19zKshqVgRSxB+5XEcgRyb18A+kmbX2EfM5d1ZPFdwnPuZjNKy5j9hd1AZhGyHzNuk1r94hfhCZKVdCBfg+ogZZ8BkI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n6Fm/38Z; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6886cd07673so9689717b3.3
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 00:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726732316; x=1727337116; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1rMyRRpvG/fS+iCsrFQSvxhn6a0Vas9E1OApVjH4Yf4=;
        b=n6Fm/38ZGNSazasMz2iVqf4H+XcVUM8SzJhOuIxSH4N49Mbe6xCPmj3/1aYNtfW9Sb
         AU10nYQ5hr6aqis9vtuFFWTyAOZ1hkexToHwc6ExlSrHYHGDwP5sh3j7f1tQHt8l1ZkL
         mjx1GVSDGancZHW2XpekOcyK6UUSvkSOOsZFO6GGcJhdxSHwuWKF+XYnmYG9xYVmBM4C
         ogpgWjICuY10Frpk/uPtOaU3JV2ggD1Ah9AYFrVDFkpzun+0vcVGkJnLsGcGgE0iS3E7
         oDbncPrMpaN6F2hjPx8oLsO0gJonzhHNP0424WPRO+41UN5nUiQRcar6MF9SNrfDkled
         9HLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726732316; x=1727337116;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1rMyRRpvG/fS+iCsrFQSvxhn6a0Vas9E1OApVjH4Yf4=;
        b=UMzw6EyYKmAlJao7YVu4O/pMMI1Byx+xjPFDE4YhjHyXJOfZFNgjMN9M+2PCuKBQaG
         TnWjZJukej5MO09gPaYVUF4+fO4DsgHjw/1Rmu6ujGPxHzhd+trudGoJxcPTf/XN8xLe
         isaSJtM0MfcOfcdN8UuMqFTEYarafFirIkZVRGHPVKDpa92FrAGj5VSPcBNvMtFhESjU
         LM/jNndctQHg6sRv3Z49DpHL8TCRz5Q9GteSFK0ra1ioLzxkAWEaCi50yQKlDhYKe61k
         nb8aPsNmoOiAJYEmxMuBI74iTFLMQowC+kNzngaM7XgDgIbckRwC/Cvt0TYXtDGdRMfV
         Hgow==
X-Forwarded-Encrypted: i=1; AJvYcCX62c57B3uOTS/mrol1arAMEQ9JhjVBLQ22s/EM0Iw+ImBW5tDV7yel/1Yb+FbVaHBAkb/IBAD4mvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzUphaxF2tCf0HzyPhvAzMSrXUeyAe9HrMyAAg9PMrwjRq46cp
	jtX3+ZAZTAKXkFRgXWJVdFX8DPikb3f794NikWlkZW5IsIlOteJNN+qojDc8Yuc6BmIUSkO7/6K
	F/g==
X-Google-Smtp-Source: AGHT+IHJBl51Gem8MLOAXTdQlkHEka3u6iIa4/rSkNbA+ZXSMAxhNUH4YM2aGpeptmW9PpWQmPyTrVT9FK4=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a05:690c:6e88:b0:6de:19f:34d7 with SMTP id
 00721157ae682-6de019f7ae7mr531627b3.2.1726732315891; Thu, 19 Sep 2024
 00:51:55 -0700 (PDT)
Date: Thu, 19 Sep 2024 00:51:14 -0700
In-Reply-To: <20240919075120.328469-1-amitsd@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240919075120.328469-1-amitsd@google.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240919075120.328469-3-amitsd@google.com>
Subject: [RFC v2 2/2] usb: typec: tcpm: Add support for parsing time dt properties
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
---
 drivers/usb/typec/tcpm/tcpm.c | 81 ++++++++++++++++++++++++++++-------
 1 file changed, 65 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 4b02d6474259..e6c243bc44f7 100644
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
@@ -7053,6 +7068,35 @@ static int tcpm_port_register_pd(struct tcpm_port *port)
 	return ret;
 }
 
+static int tcpm_fw_get_timings(struct tcpm_port *port, struct fwnode_handle *fwnode)
+{
+	int ret;
+	u32 val;
+
+	if (!fwnode)
+		return -EINVAL;
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
+
+	return 0;
+}
+
 static int tcpm_fw_get_caps(struct tcpm_port *port, struct fwnode_handle *fwnode)
 {
 	struct fwnode_handle *capabilities, *child, *caps = NULL;
@@ -7608,9 +7652,14 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	init_completion(&port->pps_complete);
 	tcpm_debugfs_init(port);
 
+	err = tcpm_fw_get_timings(port, tcpc->fwnode);
+	if (err < 0)
+		goto out_destroy_wq;
+
 	err = tcpm_fw_get_caps(port, tcpc->fwnode);
 	if (err < 0)
 		goto out_destroy_wq;
+
 	err = tcpm_fw_get_snk_vdos(port, tcpc->fwnode);
 	if (err < 0)
 		goto out_destroy_wq;
-- 
2.46.0.792.g87dc391469-goog


