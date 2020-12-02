Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 758ED2CB333
	for <lists+linux-usb@lfdr.de>; Wed,  2 Dec 2020 04:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbgLBDSR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 22:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgLBDSR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Dec 2020 22:18:17 -0500
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB73EC0613CF
        for <linux-usb@vger.kernel.org>; Tue,  1 Dec 2020 19:17:36 -0800 (PST)
Received: by mail-qv1-xf49.google.com with SMTP id fb9so195165qvb.21
        for <linux-usb@vger.kernel.org>; Tue, 01 Dec 2020 19:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=uRuMnqp2OvW/pA4BgPFIExuJRDGSruEG9QfvRT1XzWw=;
        b=A0g9RXNXmF2M0Bq85UVVR91cqC0vlP2TuZDlkHVvSbL8Yt1BOyDb2LECQ7aRvl3qHK
         PEsC5SFM1eRmss9wXGlmY/peTfNsvk0lPObBg9gbJPPuVgMezSj+lkFDLRKA+FBzRqaM
         R7xLDGR+d6UDShdzNqMAaYqW2+zSj5gKfU6/XnaZKMsvIcf63abler3322Y29imMr2GW
         RIdK+1qGaD7MD8cIwlxyMekZSoyi83POTbd1bDFcblkT5QTmMjdbkpyGHJqn28SolqCS
         /E5nOexl3xwC7l819/CjkmGojjrwZRMNfL5tlj/UQokZYsqOVX/bRjbwNbNRIp0G4UKt
         Zmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=uRuMnqp2OvW/pA4BgPFIExuJRDGSruEG9QfvRT1XzWw=;
        b=YDudisF6RkTeqhQSbaxBfkMfZaftUnhBEvtr5oPTfIQNYyv50CYrlFk4VkkmQ+uBVq
         v+JZGDGowc0x5d/yb5PAMtJwGDEVoflK1ndPkGcviSzwLtLAhfOgIJmkDdWjOVx+7prJ
         z3RVQ9wtx1V56q2REtNYRaiFEBYTZKpB7iNq3CkLgATDe9Z3Z7z0jbYgc32QbMep/vfO
         FI3S18v+EMOpdYNqBervJtcpsVsrKtUu+aMFUbBMf9/SvOkMSYccER/q+6A+gACTWvhC
         qgMFOp+lkwqsnBjJkxLutU4u8ygO4Lfr30XbudB+vPgiTTE1w8SX2znCFW3SWf/WrTWF
         mOew==
X-Gm-Message-State: AOAM530Tm9vn7LmGCxMO/K4aXEX+aOXm5SVo2QDrSNCqkb8l0Z+Aqgu0
        3hNxTxp5qpSpLVpJ+tubK3ePwAoH4+A=
X-Google-Smtp-Source: ABdhPJwsJU+e2Qr0FhjcJwiw4r9A1cfukdruoQxYMnWny5v9+Tfu/UA5kRZ08u/OXPn1PX6MHwhia9v0tS4=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:ad4:522a:: with SMTP id r10mr818726qvq.23.1606879055942;
 Tue, 01 Dec 2020 19:17:35 -0800 (PST)
Date:   Tue,  1 Dec 2020 19:17:33 -0800
Message-Id: <20201202031733.647808-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v2] usb: typec: tcpm: Pass down negotiated rev to update retry count
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

nRetryCount was updated from 3 to 2 between PD2.0 and PD3.0 spec.
nRetryCount in "Table 6-34 Counter parameters" of the PD 2.0
spec is set to 3, whereas, nRetryCount in "Table 6-59 Counter
parameters" is set to 2.

Pass down negotiated rev in pd_transmit so that low level chip
drivers can update the retry count accordingly before attempting
packet transmission.

This helps in passing "TEST.PD.PORT.ALL.02" of the
"Power Delivery Merged" test suite which was initially failing
with "The UUT did not retransmit the message nReryCount times"

In fusb302 & tcpci drivers, by default the driver sets the retry
count to 3 (Default for PD 2.0). Update this to 2,
if the negotiated rev is PD 3.0.

In wcove, since the retry count is intentionally set to max, leaving
it as is.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since V1:
-Squashed tcpm and client patches to one as suggested by Heikki.
---
 drivers/usb/typec/tcpm/fusb302.c | 16 +++++++++++-----
 drivers/usb/typec/tcpm/tcpci.c   | 12 +++++++-----
 drivers/usb/typec/tcpm/tcpm.c    |  2 +-
 drivers/usb/typec/tcpm/wcove.c   |  3 ++-
 include/linux/usb/tcpm.h         |  2 +-
 5 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 99562cc65ca6..ebc46b9f776c 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -343,12 +343,11 @@ static int fusb302_sw_reset(struct fusb302_chip *chip)
 	return ret;
 }
 
-static int fusb302_enable_tx_auto_retries(struct fusb302_chip *chip)
+static int fusb302_enable_tx_auto_retries(struct fusb302_chip *chip, u8 retry_count)
 {
 	int ret = 0;
 
-	ret = fusb302_i2c_set_bits(chip, FUSB_REG_CONTROL3,
-				   FUSB_REG_CONTROL3_N_RETRIES_3 |
+	ret = fusb302_i2c_set_bits(chip, FUSB_REG_CONTROL3, retry_count |
 				   FUSB_REG_CONTROL3_AUTO_RETRY);
 
 	return ret;
@@ -399,7 +398,7 @@ static int tcpm_init(struct tcpc_dev *dev)
 	ret = fusb302_sw_reset(chip);
 	if (ret < 0)
 		return ret;
-	ret = fusb302_enable_tx_auto_retries(chip);
+	ret = fusb302_enable_tx_auto_retries(chip, FUSB_REG_CONTROL3_N_RETRIES_3);
 	if (ret < 0)
 		return ret;
 	ret = fusb302_init_interrupt(chip);
@@ -1017,7 +1016,7 @@ static const char * const transmit_type_name[] = {
 };
 
 static int tcpm_pd_transmit(struct tcpc_dev *dev, enum tcpm_transmit_type type,
-			    const struct pd_message *msg)
+			    const struct pd_message *msg, unsigned int negotiated_rev)
 {
 	struct fusb302_chip *chip = container_of(dev, struct fusb302_chip,
 						 tcpc_dev);
@@ -1026,6 +1025,13 @@ static int tcpm_pd_transmit(struct tcpc_dev *dev, enum tcpm_transmit_type type,
 	mutex_lock(&chip->lock);
 	switch (type) {
 	case TCPC_TX_SOP:
+		/* nRetryCount 3 in P2.0 spec, whereas 2 in PD3.0 spec */
+		ret = fusb302_enable_tx_auto_retries(chip, negotiated_rev > PD_REV20 ?
+						     FUSB_REG_CONTROL3_N_RETRIES_2 :
+						     FUSB_REG_CONTROL3_N_RETRIES_3);
+		if (ret < 0)
+			fusb302_log(chip, "Cannot update retry count ret=%d", ret);
+
 		ret = fusb302_pd_send_message(chip, msg);
 		if (ret < 0)
 			fusb302_log(chip,
diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 12d983a75510..98a2455f779f 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -18,7 +18,8 @@
 
 #include "tcpci.h"
 
-#define	PD_RETRY_COUNT				3
+#define	PD_RETRY_COUNT_DEFAULT			3
+#define	PD_RETRY_COUNT_3_0_OR_HIGHER		2
 #define	AUTO_DISCHARGE_DEFAULT_THRESHOLD_MV	3500
 #define	AUTO_DISCHARGE_PD_HEADROOM_MV		850
 #define	AUTO_DISCHARGE_PPS_HEADROOM_MV		1250
@@ -447,9 +448,8 @@ static int tcpci_set_vbus(struct tcpc_dev *tcpc, bool source, bool sink)
 	return 0;
 }
 
-static int tcpci_pd_transmit(struct tcpc_dev *tcpc,
-			     enum tcpm_transmit_type type,
-			     const struct pd_message *msg)
+static int tcpci_pd_transmit(struct tcpc_dev *tcpc, enum tcpm_transmit_type type,
+			     const struct pd_message *msg, unsigned int negotiated_rev)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
 	u16 header = msg ? le16_to_cpu(msg->header) : 0;
@@ -497,7 +497,9 @@ static int tcpci_pd_transmit(struct tcpc_dev *tcpc,
 		}
 	}
 
-	reg = (PD_RETRY_COUNT << TCPC_TRANSMIT_RETRY_SHIFT) | (type << TCPC_TRANSMIT_TYPE_SHIFT);
+	/* nRetryCount is 3 in PD2.0 spec where 2 in PD3.0 spec */
+	reg = ((negotiated_rev > PD_REV20 ? PD_RETRY_COUNT_3_0_OR_HIGHER : PD_RETRY_COUNT_DEFAULT)
+	       << TCPC_TRANSMIT_RETRY_SHIFT) | (type << TCPC_TRANSMIT_TYPE_SHIFT);
 	ret = regmap_write(tcpci->regmap, TCPC_TRANSMIT, reg);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 3bbc1f10af49..c73bc3a8356a 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -667,7 +667,7 @@ static int tcpm_pd_transmit(struct tcpm_port *port,
 		tcpm_log(port, "PD TX, type: %#x", type);
 
 	reinit_completion(&port->tx_complete);
-	ret = port->tcpc->pd_transmit(port->tcpc, type, msg);
+	ret = port->tcpc->pd_transmit(port->tcpc, type, msg, port->negotiated_rev);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/usb/typec/tcpm/wcove.c b/drivers/usb/typec/tcpm/wcove.c
index 9b745f432c91..79ae63950050 100644
--- a/drivers/usb/typec/tcpm/wcove.c
+++ b/drivers/usb/typec/tcpm/wcove.c
@@ -356,7 +356,8 @@ static int wcove_set_pd_rx(struct tcpc_dev *tcpc, bool on)
 
 static int wcove_pd_transmit(struct tcpc_dev *tcpc,
 			     enum tcpm_transmit_type type,
-			     const struct pd_message *msg)
+			     const struct pd_message *msg,
+			     unsigned int negotiated_rev)
 {
 	struct wcove_typec *wcove = tcpc_to_wcove(tcpc);
 	unsigned int info = 0;
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index e68aaa12886f..efaedd7e8a18 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -121,7 +121,7 @@ struct tcpc_dev {
 			      enum typec_cc_status cc);
 	int (*try_role)(struct tcpc_dev *dev, int role);
 	int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type type,
-			   const struct pd_message *msg);
+			   const struct pd_message *msg, unsigned int negotiated_rev);
 	int (*set_bist_data)(struct tcpc_dev *dev, bool on);
 	int (*enable_frs)(struct tcpc_dev *dev, bool enable);
 	void (*frs_sourcing_vbus)(struct tcpc_dev *dev);
-- 
2.29.2.576.ga3fc446d84-goog

