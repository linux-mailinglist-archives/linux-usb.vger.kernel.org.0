Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92C3B12D051
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 14:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbfL3Neg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 08:34:36 -0500
Received: from mga02.intel.com ([134.134.136.20]:7640 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727445AbfL3Nef (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 08:34:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 05:34:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224226678"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 05:34:34 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: [PATCH 1/2] usb: typec: ucsi: Store the notification mask
Date:   Mon, 30 Dec 2019 16:34:30 +0300
Message-Id: <20191230133431.63445-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230133431.63445-1-heikki.krogerus@linux.intel.com>
References: <20191230133431.63445-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver needs to ignore any Connector Change Events
before the Connector Change Indication notifications have
actually been enabled. This adds a check to
ucsi_connector_change() function to make sure the function
does not try to process the event unless the Connector
Change notifications have been enabled.

It is quite common that the firmware representing the "PPM"
(Platform Policy Manager) starts generating Connector Change
notifications even when only the Command Completion
notifications are enabled.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 15 ++++++++++-----
 drivers/usb/typec/ucsi/ucsi.h |  3 +++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 15efa1f8ede9..a07bfa98c687 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -189,7 +189,7 @@ int ucsi_resume(struct ucsi *ucsi)
 	u64 command;
 
 	/* Restore UCSI notification enable mask after system resume */
-	command = UCSI_SET_NOTIFICATION_ENABLE | UCSI_ENABLE_NTFY_ALL;
+	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
 
 	return ucsi_send_command(ucsi, command, NULL, 0);
 }
@@ -589,6 +589,11 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num)
 {
 	struct ucsi_connector *con = &ucsi->connector[num - 1];
 
+	if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
+		dev_dbg(ucsi->dev, "Bogus connetor change event\n");
+		return;
+	}
+
 	if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
 		schedule_work(&con->work);
 }
@@ -656,7 +661,7 @@ static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
 		ucsi_reset_ppm(con->ucsi);
 		mutex_unlock(&con->ucsi->ppm_lock);
 
-		c = UCSI_SET_NOTIFICATION_ENABLE | UCSI_ENABLE_NTFY_ALL;
+		c = UCSI_SET_NOTIFICATION_ENABLE | con->ucsi->ntfy;
 		ucsi_send_command(con->ucsi, c, NULL, 0);
 
 		ucsi_reset_connector(con, true);
@@ -925,8 +930,8 @@ int ucsi_init(struct ucsi *ucsi)
 	}
 
 	/* Enable basic notifications */
-	command = UCSI_SET_NOTIFICATION_ENABLE;
-	command |= UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
+	ucsi->ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
+	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
 	ret = ucsi_run_command(ucsi, command, NULL, 0);
 	if (ret < 0)
 		goto err_reset;
@@ -943,7 +948,7 @@ int ucsi_init(struct ucsi *ucsi)
 	}
 
 	/* Enable all notifications */
-	command = UCSI_SET_NOTIFICATION_ENABLE | UCSI_ENABLE_NTFY_ALL;
+	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
 	ret = ucsi_run_command(ucsi, command, NULL, 0);
 	if (ret < 0)
 		goto err_unregister;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 8569bbd3762f..09ba261ea103 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -269,6 +269,9 @@ struct ucsi {
 	/* PPM Communication lock */
 	struct mutex ppm_lock;
 
+	/* The latest "Notification Enable" bits (SET_NOTIFICATION_ENABLE) */
+	u64 ntfy;
+
 	/* PPM communication flags */
 	unsigned long flags;
 #define EVENT_PENDING	0
-- 
2.24.1

