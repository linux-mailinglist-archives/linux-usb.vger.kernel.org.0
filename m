Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CABA3F8A21
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 16:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242787AbhHZOcj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 10:32:39 -0400
Received: from mga03.intel.com ([134.134.136.65]:40917 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242815AbhHZOci (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Aug 2021 10:32:38 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="217789883"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="217789883"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 07:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="598500975"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2021 07:31:49 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ulrich Huber <ulrich@huberulrich.de>
Cc:     linux-usb@vger.kernel.org
Subject: [RFC PATCH 3/7] usb: typec: ucsi: Add polling mechanism for partner tasks like alt mode checking
Date:   Thu, 26 Aug 2021 17:31:42 +0300
Message-Id: <20210826143146.25799-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826143146.25799-1-heikki.krogerus@linux.intel.com>
References: <20210826143146.25799-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The "poll worker" that is introduced here is first used for
checking partner alternate modes, but it can later be used
for any partner task that requires a separate job to be
scheduled to the connector specific workqueues.

The mechanism allows the partner device specific tasks to be
polling tasks and also delayed tasks if necessary.

By polling the partner alternate modes with this mechanism
the long command completion timeout value can be reduced
back to normal. The long command completion timeout was only
used to work around a problem on some platforms where the EC
firmware (PPM) didn't return BUSY even when it should with
the alt mode commands.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 119 ++++++++++++++++++++++++++++------
 drivers/usb/typec/ucsi/ucsi.h |   1 +
 2 files changed, 101 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index a35efd8174bd4..8af292141fe7b 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -191,6 +191,64 @@ int ucsi_resume(struct ucsi *ucsi)
 EXPORT_SYMBOL_GPL(ucsi_resume);
 /* -------------------------------------------------------------------------- */
 
+struct ucsi_work {
+	struct delayed_work work;
+	unsigned long delay;
+	unsigned int count;
+	struct ucsi_connector *con;
+	int (*cb)(struct ucsi_connector *);
+};
+
+static void ucsi_poll_worker(struct work_struct *work)
+{
+	struct ucsi_work *uwork = container_of(work, struct ucsi_work, work.work);
+	struct ucsi_connector *con = uwork->con;
+	int ret;
+
+	mutex_lock(&con->lock);
+
+	if (!con->partner) {
+		mutex_unlock(&con->lock);
+		kfree(uwork);
+		return;
+	}
+
+	ret = uwork->cb(con);
+
+	if (uwork->count-- && (ret == -EBUSY || ret == -ETIMEDOUT))
+		queue_delayed_work(con->wq, &uwork->work, uwork->delay);
+	else
+		kfree(uwork);
+
+	mutex_unlock(&con->lock);
+}
+
+static int ucsi_partner_task(struct ucsi_connector *con,
+			     int (*cb)(struct ucsi_connector *),
+			     int retries, unsigned long delay)
+{
+	struct ucsi_work *uwork;
+
+	if (!con->partner)
+		return 0;
+
+	uwork = kzalloc(sizeof(*uwork), GFP_KERNEL);
+	if (!uwork)
+		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&uwork->work, ucsi_poll_worker);
+	uwork->count = retries;
+	uwork->delay = delay;
+	uwork->con = con;
+	uwork->cb = cb;
+
+	queue_delayed_work(con->wq, &uwork->work, delay);
+
+	return 0;
+}
+
+/* -------------------------------------------------------------------------- */
+
 void ucsi_altmode_update_active(struct ucsi_connector *con)
 {
 	const struct typec_altmode *altmode = NULL;
@@ -543,6 +601,25 @@ static void ucsi_get_src_pdos(struct ucsi_connector *con, int is_partner)
 	con->num_pdos += ret / sizeof(u32);
 }
 
+static int ucsi_check_altmodes(struct ucsi_connector *con)
+{
+	int ret;
+
+	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP);
+	if (ret && ret != -ETIMEDOUT)
+		dev_err(con->ucsi->dev,
+			"con%d: failed to register partner alt modes (%d)\n",
+			con->num, ret);
+
+	/* Ignoring the errors in this case. */
+	if (con->partner_altmode[0]) {
+		ucsi_altmode_update_active(con);
+		return 0;
+	}
+
+	return ret;
+}
+
 static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 {
 	switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
@@ -650,14 +727,7 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 		dev_err(con->ucsi->dev, "con:%d: failed to set usb role:%d\n",
 			con->num, u_role);
 
-	/* Can't rely on Partner Flags field. Always checking the alt modes. */
-	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP);
-	if (ret)
-		dev_err(con->ucsi->dev,
-			"con%d: failed to register partner alternate modes\n",
-			con->num);
-	else
-		ucsi_altmode_update_active(con);
+	ucsi_partner_task(con, ucsi_check_altmodes, 30, 0);
 }
 
 static void ucsi_handle_connector_change(struct work_struct *work)
@@ -1045,8 +1115,18 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	enum typec_accessory *accessory = cap->accessory;
 	enum usb_role u_role = USB_ROLE_NONE;
 	u64 command;
+	char *name;
 	int ret;
 
+	name = kasprintf(GFP_KERNEL, "%s-con%d", dev_name(ucsi->dev), con->num);
+	if (!name)
+		return -ENOMEM;
+
+	con->wq = create_singlethread_workqueue(name);
+	kfree(name);
+	if (!con->wq)
+		return -ENOMEM;
+
 	INIT_WORK(&con->work, ucsi_handle_connector_change);
 	init_completion(&con->complete);
 	mutex_init(&con->lock);
@@ -1164,17 +1244,8 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 		ret = 0;
 	}
 
-	if (con->partner) {
-		ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP);
-		if (ret) {
-			dev_err(ucsi->dev,
-				"con%d: failed to register alternate modes\n",
-				con->num);
-			ret = 0;
-		} else {
-			ucsi_altmode_update_active(con);
-		}
-	}
+	if (con->partner)
+		ucsi_check_altmodes(con);
 
 	trace_ucsi_register_port(con->num, &con->status);
 
@@ -1182,6 +1253,12 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	fwnode_handle_put(cap->fwnode);
 out_unlock:
 	mutex_unlock(&con->lock);
+
+	if (ret && con->wq) {
+		destroy_workqueue(con->wq);
+		con->wq = NULL;
+	}
+
 	return ret;
 }
 
@@ -1252,6 +1329,8 @@ static int ucsi_init(struct ucsi *ucsi)
 		ucsi_unregister_partner(con);
 		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
 		ucsi_unregister_port_psy(con);
+		if (con->wq)
+			destroy_workqueue(con->wq);
 		typec_unregister_port(con->port);
 		con->port = NULL;
 	}
@@ -1374,6 +1453,8 @@ void ucsi_unregister(struct ucsi *ucsi)
 		ucsi_unregister_altmodes(&ucsi->connector[i],
 					 UCSI_RECIPIENT_CON);
 		ucsi_unregister_port_psy(&ucsi->connector[i]);
+		if (ucsi->connector[i].wq)
+			destroy_workqueue(ucsi->connector[i].wq);
 		typec_unregister_port(ucsi->connector[i].port);
 	}
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index cee666790907e..d10b8c24435af 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -317,6 +317,7 @@ struct ucsi_connector {
 	struct mutex lock; /* port lock */
 	struct work_struct work;
 	struct completion complete;
+	struct workqueue_struct *wq;
 
 	struct typec_port *port;
 	struct typec_partner *partner;
-- 
2.32.0

