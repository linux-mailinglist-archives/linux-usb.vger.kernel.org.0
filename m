Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5074FEA5A
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 01:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbiDLXpf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Apr 2022 19:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiDLXpZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Apr 2022 19:45:25 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92817B9
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 16:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649806316; x=1681342316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OZr9+z/S9+0FevHJwCGpgxaJ4tPdJ15vRebLsrhm+dA=;
  b=mF3iCU3PVnysbd0n4SQVKaU8iYwYx8ZSMJsqDKsO/ximonO8kaK5X7wu
   PTYjREQjcUS1nEtH4jaCsROcIrgkAcDlsH0wGAYIUbtx6GQWYYJYQi6NA
   KMD86Jhd17j+QrL6uegMRAPbYbVsSa5Ho6ZVAA1pe5AesHUh5PpNY9F5M
   4=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Apr 2022 16:31:56 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 16:31:56 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 12 Apr 2022 16:31:55 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 12 Apr 2022 16:31:54 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 2/4] usb: typec: ucsi: add a common function ucsi_connector_clean()
Date:   Wed, 13 Apr 2022 07:31:43 +0800
Message-ID: <1649806305-19070-3-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649806305-19070-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1649806305-19070-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In error path of ucsi_init(), it will clean all valid ucsi connector,
and samiliar operation also happen in ucsi_unregister(),
add a common function for two places.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: improve ucsi_connector_clean(), check total number of connector.

 drivers/usb/typec/ucsi/ucsi.c | 51 ++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 77ac0b7..87439f4 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1187,6 +1187,32 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	return ret;
 }
 
+static void ucsi_connector_clean(struct ucsi *ucsi)
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
@@ -1195,7 +1221,6 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
  */
 static int ucsi_init(struct ucsi *ucsi)
 {
-	struct ucsi_connector *con;
 	u64 command;
 	int ret;
 	int i;
@@ -1250,15 +1275,7 @@ static int ucsi_init(struct ucsi *ucsi)
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
+	ucsi_connector_clean(ucsi);
 
 err_reset:
 	memset(&ucsi->cap, 0, sizeof(ucsi->cap));
@@ -1364,7 +1381,6 @@ EXPORT_SYMBOL_GPL(ucsi_register);
 void ucsi_unregister(struct ucsi *ucsi)
 {
 	u64 cmd = UCSI_SET_NOTIFICATION_ENABLE;
-	int i;
 
 	/* Make sure that we are not in the middle of driver initialization */
 	cancel_work_sync(&ucsi->work);
@@ -1372,18 +1388,7 @@ void ucsi_unregister(struct ucsi *ucsi)
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
+	ucsi_connector_clean(ucsi);
 }
 EXPORT_SYMBOL_GPL(ucsi_unregister);
 
-- 
2.7.4

