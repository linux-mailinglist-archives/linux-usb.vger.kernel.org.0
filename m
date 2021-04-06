Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37788354A30
	for <lists+linux-usb@lfdr.de>; Tue,  6 Apr 2021 03:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243208AbhDFBhN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Apr 2021 21:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243180AbhDFBhH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Apr 2021 21:37:07 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC7BC061760
        for <linux-usb@vger.kernel.org>; Mon,  5 Apr 2021 18:36:59 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id e8so311565pfd.1
        for <linux-usb@vger.kernel.org>; Mon, 05 Apr 2021 18:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=lIyNvwnE/mS/ZjxslbGipf8ebUbSEhxfFtLwaEqMPBs=;
        b=RaAPJILqbTmv3/2qmy4ysmj0jZdRajrgxhgYz8+HTSaaGnxayGZmHd7Z8YSYQRq9HD
         VaorHYtXCgKsM6SeKZSMzitaMJE7IK/Eolo9OYJAwSbmMfpuP/ntLHNnORP5CsaCsUgY
         u9P+5oR5hqmBMtGibQIdkhtekWdtSkakTWCwrglMDsYXX/9dO0lUdLbvv4DnjKTQM3zV
         zvVm8f7Q1+jqHpesqjJ3goz1WrVQ7jvOT1PGtMeV8AQS6Umsk+o+c76QoNFCbe4i5Rxb
         kbk6KaliFQNedvXUlh2r82dWpQL64EUfNL6pYDuWdcRoZCKXYjz9rOIQwIk6f6TalPpO
         lBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=lIyNvwnE/mS/ZjxslbGipf8ebUbSEhxfFtLwaEqMPBs=;
        b=QIGdr9x/FZQlC/09NXoU2ydwUdQ/DPanDbjrE1Y31uJoEqB96hTV0GZF3b/OIl3ION
         W4CcLbMZjrMFLZ3mBsLxGGkJyjeaDCoEAo7khh1xW1aNxP/b5GQNcouIM337+YK3kvWK
         9Z3XB6YKqbI/K+I//0k/l91LGmcdFy8G9Q+PZTZJoBMhZ5LGRHJp0enkifouuYNxZrmL
         aGU7iWUlnGD43HaoA7eh/VztwsKiVlSjUC4jzMvoWoVjakfeDWgHWHktcb5ir/5lwyrB
         oFS26GJciQl+RUgpf1TbW3k9OtQbQXQiAuJd6YEADC4KmBWAdEUr53B8GRAQhZNPyvZT
         OtSA==
X-Gm-Message-State: AOAM533LulZYsNUjD+mIBzvNLu0KayLHyZ1LTZsg4YGf47NttKAI1Iuk
        Ea3m248fTLqGiT/S8m2Wav3o11igGaQ=
X-Google-Smtp-Source: ABdhPJwNGOWuTQGYkY/hNl4HTn52fG8lx9PtBdR72CpxJ/jTcfOSmeNJdXGYcTVMqQNhqaXjmUXRnH3XOy8=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:7080:32f9:cd15:6178])
 (user=badhri job=sendgmr) by 2002:a17:902:8303:b029:e6:4ef3:4f17 with SMTP id
 bd3-20020a1709028303b02900e64ef34f17mr26016796plb.22.1617673018706; Mon, 05
 Apr 2021 18:36:58 -0700 (PDT)
Date:   Mon,  5 Apr 2021 18:36:42 -0700
In-Reply-To: <20210406013643.3280369-1-badhri@google.com>
Message-Id: <20210406013643.3280369-6-badhri@google.com>
Mime-Version: 1.0
References: <20210406013643.3280369-1-badhri@google.com>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
Subject: [PATCH v1 5/6] usb: typec: tcpm: Allow slow charging loops to comply
 to pSnkStby
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Kyle Tso <kyletso@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When a PD charger advertising Rp-3.0 is connected to a sink port, the
sink port current limit would 3A, during SNK_DISCOVERY, till power
negotiation starts. Once the negotiation starts the power limit needs
to drop down to pSnkStby(500mA @ 5V) and to negotiated current limit
once the explicit contract is in place. Not all charging loops can ramp
up to 3A and drop down to 500mA within tSnkStdby which is 15ms. The port
partner might hard reset if tSnkStdby is not met.

To solve this problem, this patch introduces slow-charger-loop which
when set makes the port request PD_P_SNK_STDBY_MW upon entering
SNK_DISCOVERY(instead of 3A or the 1.5A during SNK_DISCOVERY) and the
actual currrent limit after RX of PD_CTRL_PSRDY for PD link or during
SNK_READY for non-pd link.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index de9e57a7a929..6aa314005f57 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -455,6 +455,12 @@ struct tcpm_port {
 	/* Auto vbus discharge status */
 	bool auto_vbus_discharge_enabled;
 
+	/*
+	 * When set, port requests PD_P_SNK_STDBY_MW upon entering SNK_DISCOVERY and
+	 * the actual currrent limit after RX of PD_CTRL_PSRDY for PD link,
+	 * SNK_READY for non-pd link.
+	 */
+	bool slow_charger_loop;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *dentry;
 	struct mutex logbuffer_lock;	/* log buffer access lock */
@@ -4043,9 +4049,12 @@ static void run_state_machine(struct tcpm_port *port)
 		break;
 	case SNK_DISCOVERY:
 		if (port->vbus_present) {
-			tcpm_set_current_limit(port,
-					       tcpm_get_current_limit(port),
-					       5000);
+			u32 current_lim = (!port->slow_charger_loop ||
+					   (tcpm_get_current_limit(port) <=
+					    PD_P_SNK_STDBY_MW / 5)) ?
+				tcpm_get_current_limit(port) :
+				PD_P_SNK_STDBY_MW / 5;
+			tcpm_set_current_limit(port, current_lim, 5000);
 			tcpm_set_charge(port, true);
 			tcpm_set_state(port, SNK_WAIT_CAPABILITIES, 0);
 			break;
@@ -4157,6 +4166,8 @@ static void run_state_machine(struct tcpm_port *port)
 			port->pwr_opmode = TYPEC_PWR_MODE_PD;
 		}
 
+		if (!port->pd_capable && port->slow_charger_loop)
+			tcpm_set_current_limit(port, tcpm_get_current_limit(port), 5000);
 		tcpm_swap_complete(port, 0);
 		tcpm_typec_connect(port);
 		mod_enable_frs_delayed_work(port, 0);
@@ -5759,6 +5770,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 	port->typec_caps.type = ret;
 	port->port_type = port->typec_caps.type;
 
+	port->slow_charger_loop = fwnode_property_read_bool(fwnode, "slow-charger-loop");
 	if (port->port_type == TYPEC_PORT_SNK)
 		goto sink;
 
-- 
2.31.0.208.g409f899ff0-goog

