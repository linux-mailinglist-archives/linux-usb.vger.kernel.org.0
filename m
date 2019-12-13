Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB10811E821
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2019 17:23:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbfLMQXg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Dec 2019 11:23:36 -0500
Received: from mga17.intel.com ([192.55.52.151]:41727 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726404AbfLMQXg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Dec 2019 11:23:36 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Dec 2019 08:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; 
   d="scan'208,223";a="220945436"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 13 Dec 2019 08:23:34 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 13 Dec 2019 18:23:33 +0200
Date:   Fri, 13 Dec 2019 18:23:33 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     owl@ow1.in
Cc:     linux-usb@vger.kernel.org
Subject: About Bug 205841
Message-ID: <20191213162333.GA19292@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ilia,

Bugzilla at kernel.org does not respond today, so sending mail.

I can't reproduce the issue with the Lenovo boards we have, but I know
there is one problem with the firmware in some Lenovo's. Basically the
firmware starts generating notification (interrupts) before they are
enabled. That could theoretically cause the issue you are seeing.

Can you test v5.5-rc1 (mainline)? If the problem still happens with
mainline, can you test a patch that I've attached (so applied on top
of mainline)?

thanks,

-- 
heikki

--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-usb-typec-ucsi-Store-the-notification-mask.patch"

From 7fd350a603397b507eb01457472091a5651133ad Mon Sep 17 00:00:00 2001
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Fri, 25 Oct 2019 13:35:45 +0300
Subject: [PATCH] usb: typec: ucsi: Store the notification mask

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
index 15efa1f8ede9..a1ccfeab7315 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -189,7 +189,7 @@ int ucsi_resume(struct ucsi *ucsi)
 	u64 command;
 
 	/* Restore UCSI notification enable mask after system resume */
-	command = UCSI_SET_NOTIFICATION_ENABLE | UCSI_ENABLE_NTFY_ALL;
+	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->notify;
 
 	return ucsi_send_command(ucsi, command, NULL, 0);
 }
@@ -589,6 +589,11 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num)
 {
 	struct ucsi_connector *con = &ucsi->connector[num - 1];
 
+	if (!(ucsi->notify & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
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
+		c = UCSI_SET_NOTIFICATION_ENABLE | con->ucsi->notify;
 		ucsi_send_command(con->ucsi, c, NULL, 0);
 
 		ucsi_reset_connector(con, true);
@@ -925,8 +930,8 @@ int ucsi_init(struct ucsi *ucsi)
 	}
 
 	/* Enable basic notifications */
-	command = UCSI_SET_NOTIFICATION_ENABLE;
-	command |= UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
+	ucsi->notify = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
+	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->notify;
 	ret = ucsi_run_command(ucsi, command, NULL, 0);
 	if (ret < 0)
 		goto err_reset;
@@ -943,7 +948,7 @@ int ucsi_init(struct ucsi *ucsi)
 	}
 
 	/* Enable all notifications */
-	command = UCSI_SET_NOTIFICATION_ENABLE | UCSI_ENABLE_NTFY_ALL;
+	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->notify;
 	ret = ucsi_run_command(ucsi, command, NULL, 0);
 	if (ret < 0)
 		goto err_unregister;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 8569bbd3762f..3eb0cc246bcd 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -269,6 +269,9 @@ struct ucsi {
 	/* PPM Communication lock */
 	struct mutex ppm_lock;
 
+	/* The latest "Notification Enable" bits (SET_NOTIFICATION_ENABLE) */
+	u64 notify;
+
 	/* PPM communication flags */
 	unsigned long flags;
 #define EVENT_PENDING	0
-- 
2.24.0


--A6N2fC+uXW/VQSAv--
