Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4FFA2F2249
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 22:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387615AbhAKV4i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 16:56:38 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:52644 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732176AbhAKV4h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 16:56:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610402173; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=PtaFRiDxRtZj8p7OuuzON49LnTL2oAXa3kHM/ZbEbDY=; b=I+DNg95MMf4Jo3GU9T57DspNvq+5KZhYwxrjbch5Z1jI0yn7mWq9tJH9aeGbeqeNljzuixII
 OlsyI8hhIUj/bRZKYy+ovokPKDCNdRg7RYk/eBvL9Hdzv1p7/mydAu6UYr8RV1eIehLUIgMA
 WPqIGVR70x8g4ABzEkD0XnxoJtY=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ffcc95bd84bad3547eaaaf8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 21:55:39
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 00F87C43461; Mon, 11 Jan 2021 21:55:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 93850C433C6;
        Mon, 11 Jan 2021 21:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 93850C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Mayank Rana <mrana@codeaurora.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH v2] usb: typec: ucsi: Add support for USB role switch
Date:   Mon, 11 Jan 2021 13:55:20 -0800
Message-Id: <20210111215520.18476-1-jackp@codeaurora.org>
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
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
v2: Rebased on gregkh/usb-next and added Heikki's Reviewed-by tag

 drivers/usb/typec/ucsi/ucsi.c | 55 +++++++++++++++++++++++++++++++++--
 drivers/usb/typec/ucsi/ucsi.h |  3 ++
 2 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index f02958927cbd..ca3f4194ad90 100644
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
@@ -628,6 +641,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	struct ucsi_connector_status pre_ack_status;
 	struct ucsi_connector_status post_ack_status;
 	enum typec_role role;
+	enum usb_role u_role = USB_ROLE_NONE;
 	u16 inferred_changes;
 	u16 changed_flags;
 	u64 command;
@@ -753,11 +767,14 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 
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
@@ -770,6 +787,16 @@ static void ucsi_handle_connector_change(struct work_struct *work)
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
 
 	if (con->status.change & UCSI_CONSTAT_PARTNER_CHANGE)
@@ -988,6 +1015,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	struct ucsi_connector *con = &ucsi->connector[index];
 	struct typec_capability *cap = &con->typec_cap;
 	enum typec_accessory *accessory = cap->accessory;
+	enum usb_role u_role = USB_ROLE_NONE;
 	u64 command;
 	int ret;
 
@@ -1066,11 +1094,14 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 
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
@@ -1086,6 +1117,24 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
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
index dd9ba60ab4a3..3920e20a9e9e 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -8,6 +8,7 @@
 #include <linux/power_supply.h>
 #include <linux/types.h>
 #include <linux/usb/typec.h>
+#include <linux/usb/role.h>
 
 /* -------------------------------------------------------------------------- */
 
@@ -331,6 +332,8 @@ struct ucsi_connector {
 	u32 rdo;
 	u32 src_pdos[UCSI_MAX_PDOS];
 	int num_pdos;
+
+	struct usb_role_switch *usb_role_sw;
 };
 
 int ucsi_send_command(struct ucsi *ucsi, u64 command,
-- 
2.24.0

