Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D85650AE68
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 05:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443671AbiDVDN2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 23:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443712AbiDVDNV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 23:13:21 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D59B4CD65
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 20:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1650597030; x=1682133030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ysFEVndUvmigFleqxWzgaqAiR8FXFyuoPIiMY6hb6j8=;
  b=ACkn4/5lLAODwIQp5ogfarhIdzzV+efLg17OnDkf/YFYwtJ5HHW+gb81
   PN2SADV9gPq/x/FnufdlaFrHJgJwUmPrA/rMNdTsM2AJfLJfNHqffmSLB
   2cypI+ZkGUL0faBzTFQV0dCvX0MoWLi/5iDJcPzqWVNlYlnwCZl4TJBTW
   o=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 21 Apr 2022 20:10:30 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 20:10:29 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 20:10:29 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 20:10:27 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v5 1/3] usb: typec: ucsi: add a common function ucsi_unregister_connectors()
Date:   Fri, 22 Apr 2022 11:10:20 +0800
Message-ID: <1650597022-19793-2-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650597022-19793-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1650597022-19793-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As con->port will be used in error path of ucsi_init(),
it should be NULL or valid.

In error path of ucsi_init(), it will unregister all valid ucsi connectors,
and similar operation also happen in ucsi_unregister(),
add a common function for two places.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: improve ucsi_connector_clean(), check total number of connector.
v3: rename to ucsi_unregister_connectors(), suggest by maintainer
v4: merge patch#1 in V3, fix a typo samiliar -> similar in commit description
v5: no change

 drivers/usb/typec/ucsi/ucsi.c | 52 ++++++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index f0c2fa1..af9a2a1 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1100,6 +1100,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	con->port = typec_register_port(ucsi->dev, cap);
 	if (IS_ERR(con->port)) {
 		ret = PTR_ERR(con->port);
+		con->port = NULL;
 		goto out;
 	}
 
@@ -1186,6 +1187,32 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
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
+		if (!con->port)
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
@@ -1194,7 +1221,6 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
  */
 static int ucsi_init(struct ucsi *ucsi)
 {
-	struct ucsi_connector *con;
 	u64 command;
 	int ret;
 	int i;
@@ -1249,15 +1275,7 @@ static int ucsi_init(struct ucsi *ucsi)
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
@@ -1363,7 +1381,6 @@ EXPORT_SYMBOL_GPL(ucsi_register);
 void ucsi_unregister(struct ucsi *ucsi)
 {
 	u64 cmd = UCSI_SET_NOTIFICATION_ENABLE;
-	int i;
 
 	/* Make sure that we are not in the middle of driver initialization */
 	cancel_work_sync(&ucsi->work);
@@ -1371,18 +1388,7 @@ void ucsi_unregister(struct ucsi *ucsi)
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

