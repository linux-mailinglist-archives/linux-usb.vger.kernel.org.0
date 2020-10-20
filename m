Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA04286E8B
	for <lists+linux-usb@lfdr.de>; Thu,  8 Oct 2020 08:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgJHGQs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Oct 2020 02:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728731AbgJHGQZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Oct 2020 02:16:25 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F21C0613DA
        for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2020 23:16:22 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id s128so4354545ybc.21
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2020 23:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=6JgTqSJgT9+U2Syccyfmiliq6LISdJLZP+XxLV6n+5o=;
        b=A7j9tS/Xb9DrkemXROGwYAZIAH+oeggvQAtQS8NT4NivaYZZ6Gmv4It4sMocaubIfD
         Jx9rzrubwyZJMbRss6U4D6JGmRjl361sqzabsDSWWzX3FsZMLxNJolMPCucrwNXWeQpQ
         YBA689pJCngPpawU+lcAdLlxebL7Bi7xngIgjPf49duV4NrNVTwmyFmqpD0vCVbtsEFZ
         v+iVPcpYicJLsD1e8iIRLMv+GfHALCKatJVOf7uPNAyv6KunbwBreFNPT8PaDtoRfTTF
         yrv0rgVqQwvn0a2c77Vz2vO+hJDaI4p6gXRsu9HDLNPaEH8gTl4MILgk1yuVW/GWGq31
         Ftmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6JgTqSJgT9+U2Syccyfmiliq6LISdJLZP+XxLV6n+5o=;
        b=bKQEupp9eUb8IdkUbPl/xiTeLLLNbweyUKBR4sG1WSQAEliaAebgsRgCWHjG+WujUG
         T9DmGaDxTo3TDlccayhv0VIjvvI2NiGpgCDaXAx7CxF2GQDwsCaOdJrKtRA0yhZXa8cB
         hfo1PiT2r96WB8Wzc3MX0CANmTD1YtyzUIs/Et6C5q3RLsjMAHSupjJ7inr6fQyVSn4G
         xiGoSO1B4jRd5NlHTCM5agM3NFTkQUKFAig6nI4P/enkOcg2nJ2JBHGBjiOoDXXj9kHr
         N5W/PuXuTxrVsgtnqq4iMmpdzym7OY7hLEATOJuJOGAEOJrbpjyCTn6/wEdmwfF76oXA
         lmCw==
X-Gm-Message-State: AOAM532uyl3Zmvzpb64r2V2N61d2uONSp+3yEFdqg5iH8FfDsE2sNU3J
        gWNhS8rBaOBWzHW/CiRSFr0nDZ0X/68=
X-Google-Smtp-Source: ABdhPJzszkClNH2usU/jYbzUnTVxrHehknearvSOg97dOsiJLg5nDDh+HSoFqt1uJKk3pOloWFkeGejaaqk=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a25:2393:: with SMTP id j141mr9028667ybj.462.1602137781268;
 Wed, 07 Oct 2020 23:16:21 -0700 (PDT)
Date:   Wed,  7 Oct 2020 23:15:50 -0700
In-Reply-To: <20201008061556.1402293-1-badhri@google.com>
Message-Id: <20201008061556.1402293-10-badhri@google.com>
Mime-Version: 1.0
References: <20201008061556.1402293-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
Subject: [PATCH v10 09/15] usb: typec: tcpm: frs sourcing vbus callback
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <treding@nvidia.com>,
        Prashant Malani <pmalani@chromium.org>,
        Badhri Jagan Sridharan <badhri@google.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

During FRS hardware autonomously starts to source vbus. Provide
callback to perform chip specific operations.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Introduced in v9. No chages since then.
---
 drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
 include/linux/usb/tcpm.h      | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 55535c4f66bf..02b7f623f584 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4090,7 +4090,16 @@ static void _tcpm_pd_vbus_on(struct tcpm_port *port)
 	case SRC_TRY_DEBOUNCE:
 		/* Do nothing, waiting for sink detection */
 		break;
+	case FR_SWAP_SEND:
+	case FR_SWAP_SEND_TIMEOUT:
+	case FR_SWAP_SNK_SRC_TRANSITION_TO_OFF:
+	case FR_SWAP_SNK_SRC_SOURCE_VBUS_APPLIED:
+		if (port->tcpc->frs_sourcing_vbus)
+			port->tcpc->frs_sourcing_vbus(port->tcpc);
+		break;
 	case FR_SWAP_SNK_SRC_NEW_SINK_READY:
+		if (port->tcpc->frs_sourcing_vbus)
+			port->tcpc->frs_sourcing_vbus(port->tcpc);
 		tcpm_set_state(port, FR_SWAP_SNK_SRC_SOURCE_VBUS_APPLIED, 0);
 		break;
 
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index 09762d26fa0c..7303f518ba49 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -83,6 +83,9 @@ enum tcpm_transmit_type {
  *		Optional; Called to enable/disable PD 3.0 fast role swap.
  *		Enabling frs is accessory dependent as not all PD3.0
  *		accessories support fast role swap.
+ * @frs_sourcing_vbus:
+ *		Optional; Called to notify that vbus is now being sourced.
+ *		Low level drivers can perform chip specific operations, if any.
  */
 struct tcpc_dev {
 	struct fwnode_handle *fwnode;
@@ -109,6 +112,7 @@ struct tcpc_dev {
 			   const struct pd_message *msg);
 	int (*set_bist_data)(struct tcpc_dev *dev, bool on);
 	int (*enable_frs)(struct tcpc_dev *dev, bool enable);
+	void (*frs_sourcing_vbus)(struct tcpc_dev *dev);
 };
 
 struct tcpm_port;
-- 
2.28.0.806.g8561365e88-goog

