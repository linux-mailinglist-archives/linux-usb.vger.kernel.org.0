Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0507B50DBFB
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 11:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbiDYJJf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 05:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241591AbiDYJHg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 05:07:36 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7BF3193C5
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1650877349; x=1682413349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ntSvY/F5il28Tmp1+7fRTiVkkRnV7bV16mSGAYPLWow=;
  b=zO1yzNFAmf6i/vwJx1FcFKB+dgNRZZcIPF2qiXjl0eq4pnPfdxVFZ/pM
   098sS8gNTwJBtt9n4QjLzQcSsXes+jg2ZEuHmX2A5vwQ4o62F99QGhgPW
   zfDW5oVvOvSmM2Wd3NdMJXjHCT7s976PsG4JReZ5wTASKGpDIbQ4Y+zqY
   Q=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Apr 2022 02:01:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 02:01:02 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Apr 2022 02:01:01 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Apr 2022 02:00:59 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v6 1/2] usb: typec: ucsi: add a common function ucsi_unregister_connectors()
Date:   Mon, 25 Apr 2022 17:00:51 +0800
Message-ID: <1650877252-10401-2-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650877252-10401-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1650877252-10401-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In error path of ucsi_init(), it will unregister all valid ucsi connectors,
and similar operation also happen in ucsi_unregister(),
add a common function ucsi_unregister_connectors() for two places.

Also in ucsi_init(), it allocate number of (ucsi->cap.num_connectors + 1)
connectors, there is one extra as the ending,
ucsi_unregister_connectors() is safe to unregister all ucsi connectors
according ucsi->cap.num_connectors,
remove the extra one connector to save memory.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: improve ucsi_connector_clean(), check total number of connector.
v3: rename to ucsi_unregister_connectors(), suggest by maintainer
v4: merge patch#1 in V3, fix a typo samiliar -> similar in commit description
v5: no change
v6: merge patch#2 in v5 to this one,
    remove con->port = NULL; and change break condition
    in ucsi_unregister_connectors().

 drivers/usb/typec/ucsi/ucsi.c | 53 +++++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index f0c2fa1..981b561 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1186,6 +1186,32 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	return ret;
 }
 
+static void ucsi_unregister_connectors(struct ucsi *ucsi)
+{
+	struct ucsi_connector *con;
+	int i;
+
+	if (!ucsi->connector)
+		return;
+
+	for (i = 0; i < ucsi->cap.num_connectors; i++) {
+		con = &ucsi->connector[i];
+		if (IS_ERR_OR_NULL(con->port))
+			break;
+
+		cancel_work_sync(&con->work);
+		ucsi_unregister_partner(con);
+		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
+		ucsi_unregister_port_psy(con);
+		if (con->wq)
+			destroy_workqueue(con->wq);
+		typec_unregister_port(con->port);
+	}
+
+	kfree(ucsi->connector);
+	ucsi->connector = NULL;
+}
+
 /**
  * ucsi_init - Initialize UCSI interface
  * @ucsi: UCSI to be initialized
@@ -1194,7 +1220,6 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
  */
 static int ucsi_init(struct ucsi *ucsi)
 {
-	struct ucsi_connector *con;
 	u64 command;
 	int ret;
 	int i;
@@ -1225,7 +1250,7 @@ static int ucsi_init(struct ucsi *ucsi)
 	}
 
 	/* Allocate the connectors. Released in ucsi_unregister() */
-	ucsi->connector = kcalloc(ucsi->cap.num_connectors + 1,
+	ucsi->connector = kcalloc(ucsi->cap.num_connectors,
 				  sizeof(*ucsi->connector), GFP_KERNEL);
 	if (!ucsi->connector) {
 		ret = -ENOMEM;
@@ -1249,15 +1274,7 @@ static int ucsi_init(struct ucsi *ucsi)
 	return 0;
 
 err_unregister:
-	for (con = ucsi->connector; con->port; con++) {
-		ucsi_unregister_partner(con);
-		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
-		ucsi_unregister_port_psy(con);
-		if (con->wq)
-			destroy_workqueue(con->wq);
-		typec_unregister_port(con->port);
-		con->port = NULL;
-	}
+	ucsi_unregister_connectors(ucsi);
 
 err_reset:
 	memset(&ucsi->cap, 0, sizeof(ucsi->cap));
@@ -1363,7 +1380,6 @@ EXPORT_SYMBOL_GPL(ucsi_register);
 void ucsi_unregister(struct ucsi *ucsi)
 {
 	u64 cmd = UCSI_SET_NOTIFICATION_ENABLE;
-	int i;
 
 	/* Make sure that we are not in the middle of driver initialization */
 	cancel_work_sync(&ucsi->work);
@@ -1371,18 +1387,7 @@ void ucsi_unregister(struct ucsi *ucsi)
 	/* Disable notifications */
 	ucsi->ops->async_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
 
-	for (i = 0; i < ucsi->cap.num_connectors; i++) {
-		cancel_work_sync(&ucsi->connector[i].work);
-		ucsi_unregister_partner(&ucsi->connector[i]);
-		ucsi_unregister_altmodes(&ucsi->connector[i],
-					 UCSI_RECIPIENT_CON);
-		ucsi_unregister_port_psy(&ucsi->connector[i]);
-		if (ucsi->connector[i].wq)
-			destroy_workqueue(ucsi->connector[i].wq);
-		typec_unregister_port(ucsi->connector[i].port);
-	}
-
-	kfree(ucsi->connector);
+	ucsi_unregister_connectors(ucsi);
 }
 EXPORT_SYMBOL_GPL(ucsi_unregister);
 
-- 
2.7.4

