Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A3E288BAD
	for <lists+linux-usb@lfdr.de>; Fri,  9 Oct 2020 16:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388875AbgJIOlF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Oct 2020 10:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388736AbgJIOlE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Oct 2020 10:41:04 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B26C0613D6;
        Fri,  9 Oct 2020 07:41:04 -0700 (PDT)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94)
        (envelope-from <benjamin@sipsolutions.net>)
        id 1kQtZt-002KHD-SI; Fri, 09 Oct 2020 16:41:02 +0200
From:   Benjamin Berg <benjamin@sipsolutions.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, Benjamin Berg <bberg@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 2/2] usb: typec: ucsi: Work around PPM losing change information
Date:   Fri,  9 Oct 2020 16:40:47 +0200
Message-Id: <20201009144047.505957-3-benjamin@sipsolutions.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201009144047.505957-1-benjamin@sipsolutions.net>
References: <20201009144047.505957-1-benjamin@sipsolutions.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Benjamin Berg <bberg@redhat.com>

Some/many PPMs are simply clearing the change bitfield when a
notification on a port is acknowledge. Unfortunately, doing so means
that any changes between the GET_CONNECTOR_STATUS and ACK_CC_CI commands
is simply lost.

Work around this by re-fetching the connector status afterwards. We can
then infer any changes that we see have happened but that may not be
respresented in the change bitfield.

We end up with the following actions:
 1. UCSI_GET_CONNECTOR_STATUS, store result, update unprocessed_changes
 2. UCSI_GET_CAM_SUPPORTED, discard result
 3. ACK connector change
 4. UCSI_GET_CONNECTOR_STATUS, store result
 5. Infere lost changes by comparing UCSI_GET_CONNECTOR_STATUS results
 6. If PPM reported a new change, then restart in order to ACK
 7. Process everything as usual.

The worker is also changed to re-schedule itself if a new change
notification happened while it was running.

Doing this fixes quite commonly occurring issues where e.g. the UCSI
power supply would remain online even thought the ThunderBolt cable was
unplugged.

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Benjamin Berg <bberg@redhat.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 125 ++++++++++++++++++++++++++++------
 drivers/usb/typec/ucsi/ucsi.h |   2 +
 2 files changed, 107 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 758b988ac518..fad8680be7ab 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -53,7 +53,7 @@ static int ucsi_acknowledge_connector_change(struct ucsi *ucsi)
 	ctrl = UCSI_ACK_CC_CI;
 	ctrl |= UCSI_ACK_CONNECTOR_CHANGE;
 
-	return ucsi->ops->async_write(ucsi, UCSI_CONTROL, &ctrl, sizeof(ctrl));
+	return ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &ctrl, sizeof(ctrl));
 }
 
 static int ucsi_exec_command(struct ucsi *ucsi, u64 command);
@@ -625,21 +625,113 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
 						  work);
 	struct ucsi *ucsi = con->ucsi;
+	struct ucsi_connector_status pre_ack_status;
+	struct ucsi_connector_status post_ack_status;
 	enum typec_role role;
+	u16 inferred_changes;
+	u16 changed_flags;
 	u64 command;
 	int ret;
 
 	mutex_lock(&con->lock);
 
+	/*
+	 * Some/many PPMs have an issue where all fields in the change bitfield
+	 * are cleared when an ACK is send. This will causes any change
+	 * between GET_CONNECTOR_STATUS and ACK to be lost.
+	 *
+	 * We work around this by re-fetching the connector status afterwards.
+	 * We then infer any changes that we see have happened but that may not
+	 * be represented in the change bitfield.
+	 *
+	 * Also, even though we don't need to know the currently supported alt
+	 * modes, we run the GET_CAM_SUPPORTED command to ensure the PPM does
+	 * not get stuck in case it assumes we do.
+	 * Always do this, rather than relying on UCSI_CONSTAT_CAM_CHANGE to be
+	 * set in the change bitfield.
+	 *
+	 * We end up with the following actions:
+	 *  1. UCSI_GET_CONNECTOR_STATUS, store result, update unprocessed_changes
+	 *  2. UCSI_GET_CAM_SUPPORTED, discard result
+	 *  3. ACK connector change
+	 *  4. UCSI_GET_CONNECTOR_STATUS, store result
+	 *  5. Infere lost changes by comparing UCSI_GET_CONNECTOR_STATUS results
+	 *  6. If PPM reported a new change, then restart in order to ACK
+	 *  7. Process everything as usual.
+	 *
+	 * We may end up seeing a change twice, but we can only miss extremely
+	 * short transitional changes.
+	 */
+
+	/* 1. First UCSI_GET_CONNECTOR_STATUS */
+	command = UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
+	ret = ucsi_send_command(ucsi, command, &pre_ack_status,
+				sizeof(pre_ack_status));
+	if (ret < 0) {
+		dev_err(ucsi->dev, "%s: GET_CONNECTOR_STATUS failed (%d)\n",
+			__func__, ret);
+		goto out_unlock;
+	}
+	con->unprocessed_changes |= pre_ack_status.change;
+
+	/* 2. Run UCSI_GET_CAM_SUPPORTED and discard the result. */
+	command = UCSI_GET_CAM_SUPPORTED;
+	command |= UCSI_CONNECTOR_NUMBER(con->num);
+	ucsi_send_command(con->ucsi, command, NULL, 0);
+
+	/* 3. ACK connector change */
+	clear_bit(EVENT_PENDING, &ucsi->flags);
+	ret = ucsi_acknowledge_connector_change(ucsi);
+	if (ret) {
+		dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
+		goto out_unlock;
+	}
+
+	/* 4. Second UCSI_GET_CONNECTOR_STATUS */
 	command = UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
-	ret = ucsi_send_command(ucsi, command, &con->status,
-				sizeof(con->status));
+	ret = ucsi_send_command(ucsi, command, &post_ack_status,
+				sizeof(post_ack_status));
 	if (ret < 0) {
 		dev_err(ucsi->dev, "%s: GET_CONNECTOR_STATUS failed (%d)\n",
 			__func__, ret);
 		goto out_unlock;
 	}
 
+	/* 5. Inferre any missing changes */
+	changed_flags = pre_ack_status.flags ^ post_ack_status.flags;
+	inferred_changes = 0;
+	if (UCSI_CONSTAT_PWR_OPMODE(changed_flags) != 0)
+		inferred_changes |= UCSI_CONSTAT_POWER_OPMODE_CHANGE;
+
+	if (changed_flags & UCSI_CONSTAT_CONNECTED)
+		inferred_changes |= UCSI_CONSTAT_CONNECT_CHANGE;
+
+	if (changed_flags & UCSI_CONSTAT_PWR_DIR)
+		inferred_changes |= UCSI_CONSTAT_POWER_DIR_CHANGE;
+
+	if (UCSI_CONSTAT_PARTNER_FLAGS(changed_flags) != 0)
+		inferred_changes |= UCSI_CONSTAT_PARTNER_CHANGE;
+
+	if (UCSI_CONSTAT_PARTNER_TYPE(changed_flags) != 0)
+		inferred_changes |= UCSI_CONSTAT_PARTNER_CHANGE;
+
+	/* Mask out anything that was correctly notified in the later call. */
+	inferred_changes &= ~post_ack_status.change;
+	if (inferred_changes)
+		dev_dbg(ucsi->dev, "%s: Inferred changes that would have been lost: 0x%04x\n",
+			__func__, inferred_changes);
+
+	con->unprocessed_changes |= inferred_changes;
+
+	/* 6. If PPM reported a new change, then restart in order to ACK */
+	if (post_ack_status.change)
+		goto out_unlock;
+
+	/* 7. Continue as if nothing happened */
+	con->status = post_ack_status;
+	con->status.change = con->unprocessed_changes;
+	con->unprocessed_changes = 0;
+
 	role = !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
 
 	if (con->status.change & UCSI_CONSTAT_POWER_OPMODE_CHANGE ||
@@ -676,28 +768,19 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 			ucsi_unregister_partner(con);
 	}
 
-	if (con->status.change & UCSI_CONSTAT_CAM_CHANGE) {
-		/*
-		 * We don't need to know the currently supported alt modes here.
-		 * Running GET_CAM_SUPPORTED command just to make sure the PPM
-		 * does not get stuck in case it assumes we do so.
-		 */
-		command = UCSI_GET_CAM_SUPPORTED;
-		command |= UCSI_CONNECTOR_NUMBER(con->num);
-		ucsi_send_command(con->ucsi, command, NULL, 0);
-	}
-
 	if (con->status.change & UCSI_CONSTAT_PARTNER_CHANGE)
 		ucsi_partner_change(con);
 
-	ret = ucsi_acknowledge_connector_change(ucsi);
-	if (ret)
-		dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
-
 	trace_ucsi_connector_change(con->num, &con->status);
 
 out_unlock:
-	clear_bit(EVENT_PENDING, &ucsi->flags);
+	if (test_and_clear_bit(EVENT_PENDING, &ucsi->flags)) {
+		schedule_work(&con->work);
+		mutex_unlock(&con->lock);
+		return;
+	}
+
+	clear_bit(EVENT_PROCESSING, &ucsi->flags);
 	mutex_unlock(&con->lock);
 }
 
@@ -715,7 +798,9 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num)
 		return;
 	}
 
-	if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
+	set_bit(EVENT_PENDING, &ucsi->flags);
+
+	if (!test_and_set_bit(EVENT_PROCESSING, &ucsi->flags))
 		schedule_work(&con->work);
 }
 EXPORT_SYMBOL_GPL(ucsi_connector_change);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index cba6f77bea61..543d54a33cb9 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -296,6 +296,7 @@ struct ucsi {
 #define EVENT_PENDING	0
 #define COMMAND_PENDING	1
 #define ACK_PENDING	2
+#define EVENT_PROCESSING	3
 };
 
 #define UCSI_MAX_SVID		5
@@ -322,6 +323,7 @@ struct ucsi_connector {
 
 	struct typec_capability typec_cap;
 
+	u16 unprocessed_changes;
 	struct ucsi_connector_status status;
 	struct ucsi_connector_capability cap;
 	struct power_supply *psy;
-- 
2.26.2

