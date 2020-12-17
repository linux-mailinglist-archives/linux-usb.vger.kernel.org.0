Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D21592DCC6B
	for <lists+linux-usb@lfdr.de>; Thu, 17 Dec 2020 07:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgLQGWA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Dec 2020 01:22:00 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:16561 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgLQGV7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Dec 2020 01:21:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608186092; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=WtsbgsNj+Vv2PTvwZ5AMpCvKoyFdEmPial23BEs0c0Y=; b=cNcGdrdCwmD5L7lkxymNKaaIEMNk6+RXRR6WJ90D8Jf37qY5oHfw2koQH1jU3InL5yNk3lIi
 YBJaTL+rJOT+nF2no1Dh3FniJPhwXtNUOqnxHkfNerO2FRRukeaaiDh9ModTkAujQ6y4XG8z
 DnV5MiHHRPRdJ/G+935VS6JqpOc=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fdaf8d37549779c5bc4ecc5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 06:21:07
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B3F15C433ED; Thu, 17 Dec 2020 06:21:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 53759C433CA;
        Thu, 17 Dec 2020 06:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 53759C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Mayank Rana <mrana@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH] usb: typec: ucsi: Add support for USB role switch
Date:   Wed, 16 Dec 2020 22:20:47 -0800
Message-Id: <20201217062047.13126-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Mayank Rana <mrana@codeaurora.org>

UCSI already conveys the information about a port's connection
status, whether it is operating in UFP or DFP mode, and whether the
partner supports USB data or not. This information can be used to
notify a dual-role controller to start up its host or peripheral
mode accordingly. Add optional support for this by querying each
port's fwnode to look for an associated USB role switch device.
If present, call usb_role_switch_set() with the determined data
role upon Connect Change or Connector Partner Change updates.

Signed-off-by: Mayank Rana <mrana@codeaurora.org>
Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 55 +++++++++++++++++++++++++++++++++--
 drivers/usb/typec/ucsi/ucsi.h |  3 ++
 2 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 51a570d40a42..8d3e3518a506 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -588,6 +588,7 @@ static void ucsi_unregister_partner(struct ucsi_connector *con)
 
 static void ucsi_partner_change(struct ucsi_connector *con)
 {
+	enum usb_role u_role = USB_ROLE_NONE;
 	int ret;
 
 	if (!con->partner)
@@ -595,11 +596,14 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 
 	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
-	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
 	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
+		u_role = USB_ROLE_HOST;
+		fallthrough;
+	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
 		typec_set_data_role(con->port, TYPEC_HOST);
 		break;
 	case UCSI_CONSTAT_PARTNER_TYPE_DFP:
+		u_role = USB_ROLE_DEVICE;
 		typec_set_data_role(con->port, TYPEC_DEVICE);
 		break;
 	default:
@@ -610,6 +614,15 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 	if (!completion_done(&con->complete))
 		complete(&con->complete);
 
+	/* Only notify USB controller if partner supports USB data */
+	if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) & UCSI_CONSTAT_PARTNER_FLAG_USB))
+		u_role = USB_ROLE_NONE;
+
+	ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
+	if (ret)
+		dev_err(con->ucsi->dev, "con:%d: failed to set usb role:%d\n",
+			con->num, u_role);
+
 	/* Can't rely on Partner Flags field. Always checking the alt modes. */
 	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP);
 	if (ret)
@@ -626,6 +639,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 						  work);
 	struct ucsi *ucsi = con->ucsi;
 	enum typec_role role;
+	enum usb_role u_role = USB_ROLE_NONE;
 	u64 command;
 	int ret;
 
@@ -661,11 +675,14 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 
 		switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 		case UCSI_CONSTAT_PARTNER_TYPE_UFP:
-		case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
 		case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
+			u_role = USB_ROLE_HOST;
+			fallthrough;
+		case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
 			typec_set_data_role(con->port, TYPEC_HOST);
 			break;
 		case UCSI_CONSTAT_PARTNER_TYPE_DFP:
+			u_role = USB_ROLE_DEVICE;
 			typec_set_data_role(con->port, TYPEC_DEVICE);
 			break;
 		default:
@@ -678,6 +695,16 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 			ucsi_unregister_partner(con);
 
 		ucsi_port_psy_changed(con);
+
+		/* Only notify USB controller if partner supports USB data */
+		if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
+				UCSI_CONSTAT_PARTNER_FLAG_USB))
+			u_role = USB_ROLE_NONE;
+
+		ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
+		if (ret)
+			dev_err(ucsi->dev, "con:%d: failed to set usb role:%d\n",
+				con->num, u_role);
 	}
 
 	if (con->status.change & UCSI_CONSTAT_CAM_CHANGE) {
@@ -903,6 +930,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	struct ucsi_connector *con = &ucsi->connector[index];
 	struct typec_capability *cap = &con->typec_cap;
 	enum typec_accessory *accessory = cap->accessory;
+	enum usb_role u_role = USB_ROLE_NONE;
 	u64 command;
 	int ret;
 
@@ -981,11 +1009,14 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 
 	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
-	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
 	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
+		u_role = USB_ROLE_HOST;
+		fallthrough;
+	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
 		typec_set_data_role(con->port, TYPEC_HOST);
 		break;
 	case UCSI_CONSTAT_PARTNER_TYPE_DFP:
+		u_role = USB_ROLE_DEVICE;
 		typec_set_data_role(con->port, TYPEC_DEVICE);
 		break;
 	default:
@@ -1001,6 +1032,24 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 		ucsi_port_psy_changed(con);
 	}
 
+	con->usb_role_sw = fwnode_usb_role_switch_get(cap->fwnode);
+	if (IS_ERR(con->usb_role_sw)) {
+		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
+			con->num);
+		con->usb_role_sw = NULL;
+	}
+
+	/* Only notify USB controller if partner supports USB data */
+	if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) & UCSI_CONSTAT_PARTNER_FLAG_USB))
+		u_role = USB_ROLE_NONE;
+
+	ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
+	if (ret) {
+		dev_err(ucsi->dev, "con:%d: failed to set usb role:%d\n",
+			con->num, u_role);
+		ret = 0;
+	}
+
 	if (con->partner) {
 		ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP);
 		if (ret) {
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index b7a92f246050..8474342b79a7 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -8,6 +8,7 @@
 #include <linux/power_supply.h>
 #include <linux/types.h>
 #include <linux/usb/typec.h>
+#include <linux/usb/role.h>
 
 /* -------------------------------------------------------------------------- */
 
@@ -329,6 +330,8 @@ struct ucsi_connector {
 	u32 rdo;
 	u32 src_pdos[UCSI_MAX_PDOS];
 	int num_pdos;
+
+	struct usb_role_switch *usb_role_sw;
 };
 
 int ucsi_send_command(struct ucsi *ucsi, u64 command,
-- 
2.24.0

The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
