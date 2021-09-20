Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD2904116D1
	for <lists+linux-usb@lfdr.de>; Mon, 20 Sep 2021 16:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234315AbhITOZ4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 10:25:56 -0400
Received: from mga07.intel.com ([134.134.136.100]:20391 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236173AbhITOZ4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Sep 2021 10:25:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="286817146"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="286817146"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2021 07:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="612526281"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2021 07:24:27 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Benjamin Berg <bberg@redhat.com>,
        Ulrich Huber <ulrich@huberulrich.de>, linux-usb@vger.kernel.org
Subject: [PATCH 7/7] usb: typec: ucsi: Better fix for missing unplug events issue
Date:   Mon, 20 Sep 2021 17:24:19 +0300
Message-Id: <20210920142419.54493-8-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920142419.54493-1-heikki.krogerus@linux.intel.com>
References: <20210920142419.54493-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The commit 217504a05532 ("usb: typec: ucsi: Work around PPM
losing change information") had solved this issue
previously, but in a really complex manner. The core issue
is that on some platforms the EC firmware does not interrupt
the driver on unplug event in some cases, mainly when the
cable is unplugged immediately after the plug-in.

From now on handling that problem by simply re-checking new
connections.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 190 ++++++++--------------------------
 drivers/usb/typec/ucsi/ucsi.h |   2 -
 2 files changed, 45 insertions(+), 147 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index e7267e47c3e4d..6aa28384f77f1 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -700,9 +700,6 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 	enum usb_role u_role = USB_ROLE_NONE;
 	int ret;
 
-	if (!con->partner)
-		return;
-
 	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
 	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
@@ -719,10 +716,6 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 		break;
 	}
 
-	/* Complete pending data role swap */
-	if (!completion_done(&con->complete))
-		complete(&con->complete);
-
 	/* Only notify USB controller if partner supports USB data */
 	if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) & UCSI_CONSTAT_PARTNER_FLAG_USB))
 		u_role = USB_ROLE_NONE;
@@ -733,118 +726,51 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 			con->num, u_role);
 }
 
+static int ucsi_check_connection(struct ucsi_connector *con)
+{
+	u64 command;
+	int ret;
+
+	command = UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
+	ret = ucsi_send_command(con->ucsi, command, &con->status, sizeof(con->status));
+	if (ret < 0) {
+		dev_err(con->ucsi->dev, "GET_CONNECTOR_STATUS failed (%d)\n", ret);
+		return ret;
+	}
+
+	if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
+		if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
+		    UCSI_CONSTAT_PWR_OPMODE_PD)
+			ucsi_partner_task(con, ucsi_check_altmodes, 30, 0);
+	} else {
+		ucsi_partner_change(con);
+		ucsi_port_psy_changed(con);
+		ucsi_unregister_partner(con);
+	}
+
+	return 0;
+}
+
 static void ucsi_handle_connector_change(struct work_struct *work)
 {
 	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
 						  work);
 	struct ucsi *ucsi = con->ucsi;
-	struct ucsi_connector_status pre_ack_status;
-	struct ucsi_connector_status post_ack_status;
 	enum typec_role role;
-	enum usb_role u_role = USB_ROLE_NONE;
-	u16 inferred_changes;
-	u16 changed_flags;
 	u64 command;
 	int ret;
 
 	mutex_lock(&con->lock);
 
-	/*
-	 * Some/many PPMs have an issue where all fields in the change bitfield
-	 * are cleared when an ACK is send. This will causes any change
-	 * between GET_CONNECTOR_STATUS and ACK to be lost.
-	 *
-	 * We work around this by re-fetching the connector status afterwards.
-	 * We then infer any changes that we see have happened but that may not
-	 * be represented in the change bitfield.
-	 *
-	 * Also, even though we don't need to know the currently supported alt
-	 * modes, we run the GET_CAM_SUPPORTED command to ensure the PPM does
-	 * not get stuck in case it assumes we do.
-	 * Always do this, rather than relying on UCSI_CONSTAT_CAM_CHANGE to be
-	 * set in the change bitfield.
-	 *
-	 * We end up with the following actions:
-	 *  1. UCSI_GET_CONNECTOR_STATUS, store result, update unprocessed_changes
-	 *  2. UCSI_GET_CAM_SUPPORTED, discard result
-	 *  3. ACK connector change
-	 *  4. UCSI_GET_CONNECTOR_STATUS, store result
-	 *  5. Infere lost changes by comparing UCSI_GET_CONNECTOR_STATUS results
-	 *  6. If PPM reported a new change, then restart in order to ACK
-	 *  7. Process everything as usual.
-	 *
-	 * We may end up seeing a change twice, but we can only miss extremely
-	 * short transitional changes.
-	 */
-
-	/* 1. First UCSI_GET_CONNECTOR_STATUS */
-	command = UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
-	ret = ucsi_send_command(ucsi, command, &pre_ack_status,
-				sizeof(pre_ack_status));
-	if (ret < 0) {
-		dev_err(ucsi->dev, "%s: GET_CONNECTOR_STATUS failed (%d)\n",
-			__func__, ret);
-		goto out_unlock;
-	}
-	con->unprocessed_changes |= pre_ack_status.change;
-
-	/* 2. Run UCSI_GET_CAM_SUPPORTED and discard the result. */
-	command = UCSI_GET_CAM_SUPPORTED;
-	command |= UCSI_CONNECTOR_NUMBER(con->num);
-	ucsi_send_command(con->ucsi, command, NULL, 0);
-
-	/* 3. ACK connector change */
-	ret = ucsi_acknowledge_connector_change(ucsi);
-	clear_bit(EVENT_PENDING, &ucsi->flags);
-	if (ret) {
-		dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
-		goto out_unlock;
-	}
-
-	/* 4. Second UCSI_GET_CONNECTOR_STATUS */
 	command = UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
-	ret = ucsi_send_command(ucsi, command, &post_ack_status,
-				sizeof(post_ack_status));
+	ret = ucsi_send_command(ucsi, command, &con->status, sizeof(con->status));
 	if (ret < 0) {
 		dev_err(ucsi->dev, "%s: GET_CONNECTOR_STATUS failed (%d)\n",
 			__func__, ret);
 		goto out_unlock;
 	}
 
-	/* 5. Inferre any missing changes */
-	changed_flags = pre_ack_status.flags ^ post_ack_status.flags;
-	inferred_changes = 0;
-	if (UCSI_CONSTAT_PWR_OPMODE(changed_flags) != 0)
-		inferred_changes |= UCSI_CONSTAT_POWER_OPMODE_CHANGE;
-
-	if (changed_flags & UCSI_CONSTAT_CONNECTED)
-		inferred_changes |= UCSI_CONSTAT_CONNECT_CHANGE;
-
-	if (changed_flags & UCSI_CONSTAT_PWR_DIR)
-		inferred_changes |= UCSI_CONSTAT_POWER_DIR_CHANGE;
-
-	if (UCSI_CONSTAT_PARTNER_FLAGS(changed_flags) != 0)
-		inferred_changes |= UCSI_CONSTAT_PARTNER_CHANGE;
-
-	if (UCSI_CONSTAT_PARTNER_TYPE(changed_flags) != 0)
-		inferred_changes |= UCSI_CONSTAT_PARTNER_CHANGE;
-
-	/* Mask out anything that was correctly notified in the later call. */
-	inferred_changes &= ~post_ack_status.change;
-	if (inferred_changes)
-		dev_dbg(ucsi->dev, "%s: Inferred changes that would have been lost: 0x%04x\n",
-			__func__, inferred_changes);
-
-	con->unprocessed_changes |= inferred_changes;
-
-	/* 6. If PPM reported a new change, then restart in order to ACK */
-	if (post_ack_status.change)
-		goto out_unlock;
-
-	/* 7. Continue as if nothing happened */
-	con->status = post_ack_status;
-	con->status.change = con->unprocessed_changes;
-	con->unprocessed_changes = 0;
+	trace_ucsi_connector_change(con->num, &con->status);
 
 	role = !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
 
@@ -858,63 +784,39 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 
 	if (con->status.change & UCSI_CONSTAT_CONNECT_CHANGE) {
 		typec_set_pwr_role(con->port, role);
-
-		switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
-		case UCSI_CONSTAT_PARTNER_TYPE_UFP:
-		case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
-			u_role = USB_ROLE_HOST;
-			fallthrough;
-		case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
-			typec_set_data_role(con->port, TYPEC_HOST);
-			break;
-		case UCSI_CONSTAT_PARTNER_TYPE_DFP:
-			u_role = USB_ROLE_DEVICE;
-			typec_set_data_role(con->port, TYPEC_DEVICE);
-			break;
-		default:
-			break;
-		}
+		ucsi_port_psy_changed(con);
+		ucsi_partner_change(con);
 
 		if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
 			ucsi_register_partner(con);
-
-			if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
-			    UCSI_CONSTAT_PWR_OPMODE_PD)
-				ucsi_partner_task(con, ucsi_check_altmodes, 30, 0);
+			ucsi_partner_task(con, ucsi_check_connection, 1, HZ);
 		} else {
 			ucsi_unregister_partner(con);
 		}
-
-		ucsi_port_psy_changed(con);
-
-		/* Only notify USB controller if partner supports USB data */
-		if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
-				UCSI_CONSTAT_PARTNER_FLAG_USB))
-			u_role = USB_ROLE_NONE;
-
-		ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
-		if (ret)
-			dev_err(ucsi->dev, "con:%d: failed to set usb role:%d\n",
-				con->num, u_role);
 	}
 
 	if (con->status.change & UCSI_CONSTAT_POWER_OPMODE_CHANGE ||
 	    con->status.change & UCSI_CONSTAT_POWER_LEVEL_CHANGE)
 		ucsi_pwr_opmode_change(con);
 
-	if (con->status.change & UCSI_CONSTAT_PARTNER_CHANGE)
+	if (con->partner && con->status.change & UCSI_CONSTAT_PARTNER_CHANGE) {
 		ucsi_partner_change(con);
 
-	trace_ucsi_connector_change(con->num, &con->status);
-
-out_unlock:
-	if (test_and_clear_bit(EVENT_PENDING, &ucsi->flags)) {
-		schedule_work(&con->work);
-		mutex_unlock(&con->lock);
-		return;
+		/* Complete pending data role swap */
+		if (!completion_done(&con->complete))
+			complete(&con->complete);
 	}
 
-	clear_bit(EVENT_PROCESSING, &ucsi->flags);
+	if (con->status.change & UCSI_CONSTAT_CAM_CHANGE)
+		ucsi_partner_task(con, ucsi_check_altmodes, 1, 0);
+
+	clear_bit(EVENT_PENDING, &con->ucsi->flags);
+
+	ret = ucsi_acknowledge_connector_change(ucsi);
+	if (ret)
+		dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
+
+out_unlock:
 	mutex_unlock(&con->lock);
 }
 
@@ -932,9 +834,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num)
 		return;
 	}
 
-	set_bit(EVENT_PENDING, &ucsi->flags);
-
-	if (!test_and_set_bit(EVENT_PROCESSING, &ucsi->flags))
+	if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
 		schedule_work(&con->work);
 }
 EXPORT_SYMBOL_GPL(ucsi_connector_change);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index d10b8c24435af..280f1e1bda2c9 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -300,7 +300,6 @@ struct ucsi {
 #define EVENT_PENDING	0
 #define COMMAND_PENDING	1
 #define ACK_PENDING	2
-#define EVENT_PROCESSING	3
 };
 
 #define UCSI_MAX_SVID		5
@@ -327,7 +326,6 @@ struct ucsi_connector {
 
 	struct typec_capability typec_cap;
 
-	u16 unprocessed_changes;
 	struct ucsi_connector_status status;
 	struct ucsi_connector_capability cap;
 	struct power_supply *psy;
-- 
2.33.0

