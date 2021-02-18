Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC4C31E9FC
	for <lists+linux-usb@lfdr.de>; Thu, 18 Feb 2021 13:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbhBRMls (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Feb 2021 07:41:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbhBRKOK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Feb 2021 05:14:10 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABDE3C061793
        for <linux-usb@vger.kernel.org>; Thu, 18 Feb 2021 02:02:50 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id u17so2114347ybi.10
        for <linux-usb@vger.kernel.org>; Thu, 18 Feb 2021 02:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=rhmFR7BLHpK8TLJ7breRPeGR3uKxrHndtHhLrPqfHN4=;
        b=kkpACZ3e6jgcUaShcBqbY7qa645BTx8VnDdnS/F1hdkteSgjAacRkOvT66LgpzbmZS
         zv1e4qPGK1ubvTn47i2p96PrNMeKHX56CPIBYJIjpjORgB8aEUQZg16u+WWY3w2jYXuq
         uCjvCbvYxf8rXGihPhyYSs7W0E7jnk0tmE05/wdDjBipPuB7fr6GMJNhiNVQSBN6c1IE
         1dcppiwOSAcTdsEtF1NyWm4g+gGfVxLkH6RO8qVYGsZmNhWZsAouFHeP9RloqjWqQVHN
         g7MZc7UfmBZKdTfLLi+Bf1WAXhpSDmkivfzio6g+4d0s1ljAo8c0taWiOk4o5dhmsUqJ
         ckRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=rhmFR7BLHpK8TLJ7breRPeGR3uKxrHndtHhLrPqfHN4=;
        b=rMc7uV9wJJn4ZHSL5vY2y0iuc6RrN14wL8JB9HoPDVUVEwygsNCVOBlosPvYghBWDv
         qKJoTrhfDrXEwxP7FOOK2/HT9PNTi18u37/9P79ufZDT98goNmQhv5Cdn79wR1ux3Sx5
         Dt9D4rb+JSN4mkdBaVsvDtSq4m4VeG2o2MDH9fSYoS2gPbhwRvBsU6iEi69ab0fbsvaq
         0nU/82eAQVqDWCsWkXYfCA0qg5MDi1+d/ilMCbj7mXVIX/TN+YPWSXUtnJgKq4bygYZJ
         UiOif2zByC/NWdCNL07G5gFq0H4GsIO0U3CGrUX+NR+sh4+VSszmnnRCLMXNQODbeZvn
         CkIA==
X-Gm-Message-State: AOAM530BkbyHjGKYOkGnZqsJeAG7nPxWc1ffNgNnTv8HfDtHCrudJh+t
        QA+wPdIi55P5/ajWEG1m9Uzw0AyVmO4=
X-Google-Smtp-Source: ABdhPJzClO0ylX9/3oWXmja2Ro1aVSZ/VG/HXB3bOwqwMKASBGl983fJPQxTC4KrA/hqF0hvzbmIHrv6D0E=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:82c:798e:90ed:bdd0])
 (user=badhri job=sendgmr) by 2002:a25:350b:: with SMTP id c11mr5982694yba.95.1613642568913;
 Thu, 18 Feb 2021 02:02:48 -0800 (PST)
Date:   Thu, 18 Feb 2021 02:02:43 -0800
Message-Id: <20210218100243.32187-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH v1] usb: typec: tcpm: Wait for vbus discharge to VSAFE0V
 before toggling
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kyle Tso <kyletso@google.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When vbus auto discharge is enabled, TCPM can sometimes be faster than
the TCPC i.e. TCPM can go ahead and move the port to unattached state
(involves disabling vbus auto discharge) before TCPC could effectively
discharge vbus to VSAFE0V. This leaves vbus with residual charge and
increases the decay time which prevents tsafe0v from being met.
This change introduces a new state VBUS_DISCHARGE where the TCPM waits
for a maximum of tSafe0V(max) for vbus to discharge to VSAFE0V before
transitioning to unattached state and re-enable toggling. If vbus
discharges to vsafe0v sooner, then, transition to unattached state
happens right away.

Also, while in SNK_READY, when auto discharge is enabled, drive
disconnect based on vbus turning off instead of Rp disappearing on
CC pins. Rp disappearing on CC pins is almost instanteous compared
to vbus decay.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 60 +++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index be0b6469dd3d..0ed71725980f 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -62,6 +62,8 @@
 	S(SNK_TRANSITION_SINK_VBUS),		\
 	S(SNK_READY),				\
 						\
+	S(VBUS_DISCHARGE),			\
+						\
 	S(ACC_UNATTACHED),			\
 	S(DEBUG_ACC_ATTACHED),			\
 	S(AUDIO_ACC_ATTACHED),			\
@@ -438,6 +440,9 @@ struct tcpm_port {
 	enum tcpm_ams next_ams;
 	bool in_ams;
 
+	/* Auto vbus discharge state */
+	bool auto_vbus_discharge_enabled;
+
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *dentry;
 	struct mutex logbuffer_lock;	/* log buffer access lock */
@@ -3413,6 +3418,8 @@ static int tcpm_src_attach(struct tcpm_port *port)
 	if (port->tcpc->enable_auto_vbus_discharge) {
 		ret = port->tcpc->enable_auto_vbus_discharge(port->tcpc, true);
 		tcpm_log_force(port, "enable vbus discharge ret:%d", ret);
+		if (!ret)
+			port->auto_vbus_discharge_enabled = true;
 	}
 
 	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, tcpm_data_role_for_source(port));
@@ -3495,6 +3502,8 @@ static void tcpm_reset_port(struct tcpm_port *port)
 	if (port->tcpc->enable_auto_vbus_discharge) {
 		ret = port->tcpc->enable_auto_vbus_discharge(port->tcpc, false);
 		tcpm_log_force(port, "Disable vbus discharge ret:%d", ret);
+		if (!ret)
+			port->auto_vbus_discharge_enabled = false;
 	}
 	port->in_ams = false;
 	port->ams = NONE_AMS;
@@ -3568,6 +3577,8 @@ static int tcpm_snk_attach(struct tcpm_port *port)
 		tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MODE_USB, false, VSAFE5V);
 		ret = port->tcpc->enable_auto_vbus_discharge(port->tcpc, true);
 		tcpm_log_force(port, "enable vbus discharge ret:%d", ret);
+		if (!ret)
+			port->auto_vbus_discharge_enabled = true;
 	}
 
 	ret = tcpm_set_roles(port, true, TYPEC_SINK, tcpm_data_role_for_sink(port));
@@ -3684,6 +3695,12 @@ static void run_state_machine(struct tcpm_port *port)
 	switch (port->state) {
 	case TOGGLING:
 		break;
+	case VBUS_DISCHARGE:
+		if (port->port_type == TYPEC_PORT_SRC)
+			tcpm_set_state(port, SRC_UNATTACHED, PD_T_SAFE_0V);
+		else
+			tcpm_set_state(port, SNK_UNATTACHED, PD_T_SAFE_0V);
+		break;
 	/* SRC states */
 	case SRC_UNATTACHED:
 		if (!port->non_pd_role_swap)
@@ -4669,7 +4686,9 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
 	case SRC_READY:
 		if (tcpm_port_is_disconnected(port) ||
 		    !tcpm_port_is_source(port)) {
-			if (port->port_type == TYPEC_PORT_SRC)
+			if (port->auto_vbus_discharge_enabled && !port->vbus_vsafe0v)
+				tcpm_set_state(port, VBUS_DISCHARGE, 0);
+			else if (port->port_type == TYPEC_PORT_SRC)
 				tcpm_set_state(port, SRC_UNATTACHED, 0);
 			else
 				tcpm_set_state(port, SNK_UNATTACHED, 0);
@@ -4703,7 +4722,18 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
 			tcpm_set_state(port, SNK_DEBOUNCED, 0);
 		break;
 	case SNK_READY:
-		if (tcpm_port_is_disconnected(port))
+		/*
+		 * When set_auto_vbus_discharge_threshold is enabled, CC pins go
+		 * away before vbus decays to disconnect threshold. Allow
+		 * disconnect to be driven by vbus disconnect when auto vbus
+		 * discharge is enabled.
+		 *
+		 * EXIT condition is based primarily on vbus disconnect and CC is secondary.
+		 * "A port that has entered into USB PD communications with the Source and
+		 * has seen the CC voltage exceed vRd-USB may monitor the CC pin to detect
+		 * cable disconnect in addition to monitoring VBUS.
+		 */
+		if (!port->auto_vbus_discharge_enabled && tcpm_port_is_disconnected(port))
 			tcpm_set_state(port, unattached_state(port), 0);
 		else if (!port->pd_capable &&
 			 (cc1 != old_cc1 || cc2 != old_cc2))
@@ -4803,9 +4833,16 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
 		 */
 		break;
 
+	case VBUS_DISCHARGE:
+		/* Do nothing. Waiting for vsafe0v signal */
+		break;
 	default:
-		if (tcpm_port_is_disconnected(port))
-			tcpm_set_state(port, unattached_state(port), 0);
+		if (tcpm_port_is_disconnected(port)) {
+			if (port->auto_vbus_discharge_enabled && !port->vbus_vsafe0v)
+				tcpm_set_state(port, VBUS_DISCHARGE, 0);
+			else
+				tcpm_set_state(port, unattached_state(port), 0);
+		}
 		break;
 	}
 }
@@ -4988,9 +5025,12 @@ static void _tcpm_pd_vbus_off(struct tcpm_port *port)
 		break;
 
 	default:
-		if (port->pwr_role == TYPEC_SINK &&
-		    port->attached)
-			tcpm_set_state(port, SNK_UNATTACHED, 0);
+		if (port->pwr_role == TYPEC_SINK && port->attached) {
+			if (port->auto_vbus_discharge_enabled && !port->vbus_vsafe0v)
+				tcpm_set_state(port, VBUS_DISCHARGE, 0);
+			else
+				tcpm_set_state(port, SNK_UNATTACHED, 0);
+		}
 		break;
 	}
 }
@@ -5012,6 +5052,12 @@ static void _tcpm_pd_vbus_vsafe0v(struct tcpm_port *port)
 			tcpm_set_state(port, tcpm_try_snk(port) ? SNK_TRY : SRC_ATTACHED,
 				       PD_T_CC_DEBOUNCE);
 		break;
+	case VBUS_DISCHARGE:
+		if (port->port_type == TYPEC_PORT_SRC)
+			tcpm_set_state(port, SRC_UNATTACHED, 0);
+		else
+			tcpm_set_state(port, SNK_UNATTACHED, 0);
+		break;
 	default:
 		break;
 	}
-- 
2.30.0.617.g56c4b15f3c-goog

