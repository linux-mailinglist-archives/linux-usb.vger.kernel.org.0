Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB2674FEAB8
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 01:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbiDLXpu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Apr 2022 19:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbiDLXpZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Apr 2022 19:45:25 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC24165CD
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 16:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649806320; x=1681342320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MZy71ISFwG4Ckw3rSTAbXfMb6HhVe3vlXzj/v7FwT5Q=;
  b=uHX9LsJjyBMcyxSohBVuDAeQAUqH4w8T5qZaUAStV1d1Eq14ujuGidt9
   0zkUD2IDjXr/Pij9alXv0+mQrRi4tJOwnxGu1bF2n2JGx2v+Zl7YyvkZ5
   fD4kf2Zr09kWReNTl0y78O0ZzZ/hQIbUIiIigwvYEu9ERYBIXU53hPm/3
   0=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 12 Apr 2022 16:32:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 16:31:59 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 12 Apr 2022 16:31:59 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 12 Apr 2022 16:31:57 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 4/4] usb: typec: ucsi: retry find role swithch when module load late
Date:   Wed, 13 Apr 2022 07:31:45 +0800
Message-ID: <1649806305-19070-5-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649806305-19070-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1649806305-19070-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When role switch enabled, return -EAGAIN if fail to find it due to
module load ordering issue, then restart ucsi init work to find
it again every 100ms.

It also means change ucsi init work to delayed_work.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: keep original con->num in debug log

 drivers/usb/typec/ucsi/ucsi.c | 28 ++++++++++++++++------------
 drivers/usb/typec/ucsi/ucsi.h |  2 +-
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 0a0cbf6..2a36482 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1053,6 +1053,14 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	con->num = index + 1;
 	con->ucsi = ucsi;
 
+	cap->fwnode = ucsi_find_fwnode(con);
+	con->usb_role_sw = fwnode_usb_role_switch_get(cap->fwnode);
+	if (IS_ERR(con->usb_role_sw)) {
+		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
+			con->num);
+		return -EAGAIN;
+	}
+
 	/* Delay other interactions with the con until registration is complete */
 	mutex_lock(&con->lock);
 
@@ -1088,7 +1096,6 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	if (con->cap.op_mode & UCSI_CONCAP_OPMODE_DEBUG_ACCESSORY)
 		*accessory = TYPEC_ACCESSORY_DEBUG;
 
-	cap->fwnode = ucsi_find_fwnode(con);
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
 
@@ -1147,13 +1154,6 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 		ucsi_port_psy_changed(con);
 	}
 
-	con->usb_role_sw = fwnode_usb_role_switch_get(cap->fwnode);
-	if (IS_ERR(con->usb_role_sw)) {
-		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
-			con->num);
-		con->usb_role_sw = NULL;
-	}
-
 	/* Only notify USB controller if partner supports USB data */
 	if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) & UCSI_CONSTAT_PARTNER_FLAG_USB))
 		u_role = USB_ROLE_NONE;
@@ -1286,12 +1286,16 @@ static int ucsi_init(struct ucsi *ucsi)
 
 static void ucsi_init_work(struct work_struct *work)
 {
-	struct ucsi *ucsi = container_of(work, struct ucsi, work);
+	struct ucsi *ucsi = container_of(work, struct ucsi, work.work);
 	int ret;
 
 	ret = ucsi_init(ucsi);
 	if (ret)
 		dev_err(ucsi->dev, "PPM init failed (%d)\n", ret);
+
+
+	if (ret == -EAGAIN)
+		queue_delayed_work(system_long_wq, &ucsi->work, HZ/10);
 }
 
 /**
@@ -1331,7 +1335,7 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
 	if (!ucsi)
 		return ERR_PTR(-ENOMEM);
 
-	INIT_WORK(&ucsi->work, ucsi_init_work);
+	INIT_DELAYED_WORK(&ucsi->work, ucsi_init_work);
 	mutex_init(&ucsi->ppm_lock);
 	ucsi->dev = dev;
 	ucsi->ops = ops;
@@ -1366,7 +1370,7 @@ int ucsi_register(struct ucsi *ucsi)
 	if (!ucsi->version)
 		return -ENODEV;
 
-	queue_work(system_long_wq, &ucsi->work);
+	queue_delayed_work(system_long_wq, &ucsi->work, 0);
 
 	return 0;
 }
@@ -1383,7 +1387,7 @@ void ucsi_unregister(struct ucsi *ucsi)
 	u64 cmd = UCSI_SET_NOTIFICATION_ENABLE;
 
 	/* Make sure that we are not in the middle of driver initialization */
-	cancel_work_sync(&ucsi->work);
+	cancel_delayed_work_sync(&ucsi->work);
 
 	/* Disable notifications */
 	ucsi->ops->async_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 280f1e1..3812017 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -287,7 +287,7 @@ struct ucsi {
 	struct ucsi_capability cap;
 	struct ucsi_connector *connector;
 
-	struct work_struct work;
+	struct delayed_work work;
 
 	/* PPM Communication lock */
 	struct mutex ppm_lock;
-- 
2.7.4

