Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFD70509D4F
	for <lists+linux-usb@lfdr.de>; Thu, 21 Apr 2022 12:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388110AbiDUKO2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 06:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388191AbiDUKMi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 06:12:38 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3FA02B193
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1650535774; x=1682071774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WNLGcRelpIWjxYqyMxWi7fL9fY4g5B8mHPSs6i+mXQA=;
  b=fXGWonNhvEig9RT6Je4J6eBKJNSdM0BIwOm5TBKT0VTWmVPx/Nn2Lg06
   W+UhZVMPKluQa4fQ7NhJ77KR1MPL8lDRU/PIWdKwo9V3TRWv1gyDRl6q7
   jwhsc1ZDQWDO9tDrjcCfNnUMZiGl+OizGp0qcXcHtdgri/10WtPLxWZVY
   I=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 21 Apr 2022 03:09:31 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 03:09:31 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 03:09:31 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 03:09:29 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v4 3/3] usb: typec: ucsi: Wait for the USB role switches
Date:   Thu, 21 Apr 2022 18:09:20 +0800
Message-ID: <1650535760-18624-4-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650535760-18624-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1650535760-18624-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When role switch module probe not happen,
fwnode_usb_role_switch_get() will return -EPROBE_DEFER,
it is better to restart ucsi init work to find
it again every 100ms, total wait time is 10 second.

It also means change ucsi init work to delayed_work.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: keep original con->num in debug log
v3: change return value from -EAGAIN to PTR_ERR()
v4: change subject line,
    add counter for retry limit,
    correct commit descripton to match change in V3

 drivers/usb/typec/ucsi/ucsi.c | 32 ++++++++++++++++++++------------
 drivers/usb/typec/ucsi/ucsi.h |  6 +++++-
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ce9192e..11f8808 100644
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
+		return PTR_ERR(con->usb_role_sw);
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
@@ -1286,12 +1286,20 @@ static int ucsi_init(struct ucsi *ucsi)
 
 static void ucsi_init_work(struct work_struct *work)
 {
-	struct ucsi *ucsi = container_of(work, struct ucsi, work);
+	struct ucsi *ucsi = container_of(work, struct ucsi, work.work);
 	int ret;
 
 	ret = ucsi_init(ucsi);
 	if (ret)
 		dev_err(ucsi->dev, "PPM init failed (%d)\n", ret);
+
+	if (ret == -EPROBE_DEFER) {
+		if (ucsi->work_count++ > UCSI_ROLE_SWITCH_WAIT_COUNT)
+			return;
+
+		queue_delayed_work(system_long_wq, &ucsi->work,
+				   UCSI_ROLE_SWITCH_INTERVAL);
+	}
 }
 
 /**
@@ -1331,7 +1339,7 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
 	if (!ucsi)
 		return ERR_PTR(-ENOMEM);
 
-	INIT_WORK(&ucsi->work, ucsi_init_work);
+	INIT_DELAYED_WORK(&ucsi->work, ucsi_init_work);
 	mutex_init(&ucsi->ppm_lock);
 	ucsi->dev = dev;
 	ucsi->ops = ops;
@@ -1366,7 +1374,7 @@ int ucsi_register(struct ucsi *ucsi)
 	if (!ucsi->version)
 		return -ENODEV;
 
-	queue_work(system_long_wq, &ucsi->work);
+	queue_delayed_work(system_long_wq, &ucsi->work, 0);
 
 	return 0;
 }
@@ -1383,7 +1391,7 @@ void ucsi_unregister(struct ucsi *ucsi)
 	u64 cmd = UCSI_SET_NOTIFICATION_ENABLE;
 
 	/* Make sure that we are not in the middle of driver initialization */
-	cancel_work_sync(&ucsi->work);
+	cancel_delayed_work_sync(&ucsi->work);
 
 	/* Disable notifications */
 	ucsi->ops->async_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 280f1e1..8eb391e 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -287,7 +287,11 @@ struct ucsi {
 	struct ucsi_capability cap;
 	struct ucsi_connector *connector;
 
-	struct work_struct work;
+	struct delayed_work work;
+	int work_count;
+#define UCSI_ROLE_SWITCH_RETRY_PER_HZ	10
+#define UCSI_ROLE_SWITCH_INTERVAL	(HZ / UCSI_ROLE_SWITCH_RETRY_PER_HZ)
+#define UCSI_ROLE_SWITCH_WAIT_COUNT	(10 * UCSI_ROLE_SWITCH_RETRY_PER_HZ)
 
 	/* PPM Communication lock */
 	struct mutex ppm_lock;
-- 
2.7.4

