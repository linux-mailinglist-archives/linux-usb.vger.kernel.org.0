Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6040EE231
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 15:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728813AbfKDOZB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 09:25:01 -0500
Received: from mga02.intel.com ([134.134.136.20]:3708 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728761AbfKDOZB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 09:25:01 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 06:25:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; 
   d="scan'208";a="212324069"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2019 06:24:59 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v4 13/18] usb: typec: ucsi: ccg: Move to the new API
Date:   Mon,  4 Nov 2019 17:24:30 +0300
Message-Id: <20191104142435.29960-14-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
References: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Replacing the old "cmd" and "sync" callbacks with an
implementation of struct ucsi_operations. The interrupt
handler will from now on read the CCI (Command Status and
Connector Change Indication) register, and call
ucsi_connector_change() function and/or complete pending
command completions based on it.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Tested-by: Ajay Gupta <ajayg@nvidia.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 166 +++++++++++++++---------------
 1 file changed, 81 insertions(+), 85 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index d772fce51905..3370b3fc37b1 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -176,8 +176,8 @@ struct ccg_resp {
 struct ucsi_ccg {
 	struct device *dev;
 	struct ucsi *ucsi;
-	struct ucsi_ppm ppm;
 	struct i2c_client *client;
+
 	struct ccg_dev_info info;
 	/* version info for boot, primary and secondary */
 	struct version_info version[FW2 + 1];
@@ -196,6 +196,8 @@ struct ucsi_ccg {
 	/* fw build with vendor information */
 	u16 fw_build;
 	struct work_struct pm_work;
+
+	struct completion complete;
 };
 
 static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
@@ -243,7 +245,7 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
 	return 0;
 }
 
-static int ccg_write(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
+static int ccg_write(struct ucsi_ccg *uc, u16 rab, const u8 *data, u32 len)
 {
 	struct i2c_client *client = uc->client;
 	unsigned char *buf;
@@ -317,88 +319,85 @@ static int ucsi_ccg_init(struct ucsi_ccg *uc)
 	return -ETIMEDOUT;
 }
 
-static int ucsi_ccg_send_data(struct ucsi_ccg *uc)
+static int ucsi_ccg_read(struct ucsi *ucsi, unsigned int offset,
+			 void *val, size_t val_len)
 {
-	u8 *ppm = (u8 *)uc->ppm.data;
-	int status;
-	u16 rab;
+	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(offset);
 
-	rab = CCGX_RAB_UCSI_DATA_BLOCK(offsetof(struct ucsi_data, message_out));
-	status = ccg_write(uc, rab, ppm +
-			   offsetof(struct ucsi_data, message_out),
-			   sizeof(uc->ppm.data->message_out));
-	if (status < 0)
-		return status;
-
-	rab = CCGX_RAB_UCSI_DATA_BLOCK(offsetof(struct ucsi_data, ctrl));
-	return ccg_write(uc, rab, ppm + offsetof(struct ucsi_data, ctrl),
-			 sizeof(uc->ppm.data->ctrl));
+	return ccg_read(ucsi_get_drvdata(ucsi), reg, val, val_len);
 }
 
-static int ucsi_ccg_recv_data(struct ucsi_ccg *uc)
+static int ucsi_ccg_async_write(struct ucsi *ucsi, unsigned int offset,
+				const void *val, size_t val_len)
 {
-	u8 *ppm = (u8 *)uc->ppm.data;
-	int status;
-	u16 rab;
+	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(offset);
 
-	rab = CCGX_RAB_UCSI_DATA_BLOCK(offsetof(struct ucsi_data, cci));
-	status = ccg_read(uc, rab, ppm + offsetof(struct ucsi_data, cci),
-			  sizeof(uc->ppm.data->cci));
-	if (status < 0)
-		return status;
-
-	rab = CCGX_RAB_UCSI_DATA_BLOCK(offsetof(struct ucsi_data, message_in));
-	return ccg_read(uc, rab, ppm + offsetof(struct ucsi_data, message_in),
-			sizeof(uc->ppm.data->message_in));
+	return ccg_write(ucsi_get_drvdata(ucsi), reg, val, val_len);
 }
 
-static int ucsi_ccg_ack_interrupt(struct ucsi_ccg *uc)
+static int ucsi_ccg_sync_write(struct ucsi *ucsi, unsigned int offset,
+			       const void *val, size_t val_len)
 {
-	int status;
-	unsigned char data;
+	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
+	int ret;
 
-	status = ccg_read(uc, CCGX_RAB_INTR_REG, &data, sizeof(data));
-	if (status < 0)
-		return status;
+	mutex_lock(&uc->lock);
+	pm_runtime_get_sync(uc->dev);
+	set_bit(DEV_CMD_PENDING, &uc->flags);
 
-	return ccg_write(uc, CCGX_RAB_INTR_REG, &data, sizeof(data));
-}
+	ret = ucsi_ccg_async_write(ucsi, offset, val, val_len);
+	if (ret)
+		goto err_clear_bit;
 
-static int ucsi_ccg_sync(struct ucsi_ppm *ppm)
-{
-	struct ucsi_ccg *uc = container_of(ppm, struct ucsi_ccg, ppm);
-	int status;
+	if (!wait_for_completion_timeout(&uc->complete, msecs_to_jiffies(5000)))
+		ret = -ETIMEDOUT;
 
-	status = ucsi_ccg_recv_data(uc);
-	if (status < 0)
-		return status;
+err_clear_bit:
+	clear_bit(DEV_CMD_PENDING, &uc->flags);
+	pm_runtime_put_sync(uc->dev);
+	mutex_unlock(&uc->lock);
 
-	/* ack interrupt to allow next command to run */
-	return ucsi_ccg_ack_interrupt(uc);
+	return ret;
 }
 
-static int ucsi_ccg_cmd(struct ucsi_ppm *ppm, struct ucsi_control *ctrl)
-{
-	struct ucsi_ccg *uc = container_of(ppm, struct ucsi_ccg, ppm);
-
-	ppm->data->ctrl.raw_cmd = ctrl->raw_cmd;
-	return ucsi_ccg_send_data(uc);
-}
+static const struct ucsi_operations ucsi_ccg_ops = {
+	.read = ucsi_ccg_read,
+	.sync_write = ucsi_ccg_sync_write,
+	.async_write = ucsi_ccg_async_write
+};
 
 static irqreturn_t ccg_irq_handler(int irq, void *data)
 {
+	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(UCSI_CCI);
 	struct ucsi_ccg *uc = data;
+	u8 intr_reg;
+	u32 cci;
+	int ret;
+
+	ret = ccg_read(uc, CCGX_RAB_INTR_REG, &intr_reg, sizeof(intr_reg));
+	if (ret)
+		return ret;
+
+	ret = ccg_read(uc, reg, (void *)&cci, sizeof(cci));
+	if (ret)
+		goto err_clear_irq;
+
+	if (UCSI_CCI_CONNECTOR(cci))
+		ucsi_connector_change(uc->ucsi, UCSI_CCI_CONNECTOR(cci));
+
+	if (test_bit(DEV_CMD_PENDING, &uc->flags) &&
+	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
+		complete(&uc->complete);
 
-	ucsi_notify(uc->ucsi);
+err_clear_irq:
+	ccg_write(uc, CCGX_RAB_INTR_REG, &intr_reg, sizeof(intr_reg));
 
 	return IRQ_HANDLED;
 }
 
 static void ccg_pm_workaround_work(struct work_struct *pm_work)
 {
-	struct ucsi_ccg *uc = container_of(pm_work, struct ucsi_ccg, pm_work);
-
-	ucsi_notify(uc->ucsi);
+	ccg_irq_handler(0, container_of(pm_work, struct ucsi_ccg, pm_work));
 }
 
 static int get_fw_info(struct ucsi_ccg *uc)
@@ -1027,10 +1026,10 @@ static int ccg_restart(struct ucsi_ccg *uc)
 		return status;
 	}
 
-	uc->ucsi = ucsi_register_ppm(dev, &uc->ppm);
-	if (IS_ERR(uc->ucsi)) {
-		dev_err(uc->dev, "ucsi_register_ppm failed\n");
-		return PTR_ERR(uc->ucsi);
+	status = ucsi_register(uc->ucsi);
+	if (status) {
+		dev_err(uc->dev, "failed to register the interface\n");
+		return status;
 	}
 
 	return 0;
@@ -1047,7 +1046,7 @@ static void ccg_update_firmware(struct work_struct *work)
 		return;
 
 	if (flash_mode != FLASH_NOT_NEEDED) {
-		ucsi_unregister_ppm(uc->ucsi);
+		ucsi_unregister(uc->ucsi);
 		free_irq(uc->irq, uc);
 
 		ccg_fw_update(uc, flash_mode);
@@ -1091,21 +1090,15 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct ucsi_ccg *uc;
 	int status;
-	u16 rab;
 
 	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
 	if (!uc)
 		return -ENOMEM;
 
-	uc->ppm.data = devm_kzalloc(dev, sizeof(struct ucsi_data), GFP_KERNEL);
-	if (!uc->ppm.data)
-		return -ENOMEM;
-
-	uc->ppm.cmd = ucsi_ccg_cmd;
-	uc->ppm.sync = ucsi_ccg_sync;
 	uc->dev = dev;
 	uc->client = client;
 	mutex_init(&uc->lock);
+	init_completion(&uc->complete);
 	INIT_WORK(&uc->work, ccg_update_firmware);
 	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
 
@@ -1133,30 +1126,25 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 	if (uc->info.mode & CCG_DEVINFO_PDPORTS_MASK)
 		uc->port_num++;
 
+	uc->ucsi = ucsi_create(dev, &ucsi_ccg_ops);
+	if (IS_ERR(uc->ucsi))
+		return PTR_ERR(uc->ucsi);
+
+	ucsi_set_drvdata(uc->ucsi, uc);
+
 	status = request_threaded_irq(client->irq, NULL, ccg_irq_handler,
 				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
 				      dev_name(dev), uc);
 	if (status < 0) {
 		dev_err(uc->dev, "request_threaded_irq failed - %d\n", status);
-		return status;
+		goto out_ucsi_destroy;
 	}
 
 	uc->irq = client->irq;
 
-	uc->ucsi = ucsi_register_ppm(dev, &uc->ppm);
-	if (IS_ERR(uc->ucsi)) {
-		dev_err(uc->dev, "ucsi_register_ppm failed\n");
-		return PTR_ERR(uc->ucsi);
-	}
-
-	rab = CCGX_RAB_UCSI_DATA_BLOCK(offsetof(struct ucsi_data, version));
-	status = ccg_read(uc, rab, (u8 *)(uc->ppm.data) +
-			  offsetof(struct ucsi_data, version),
-			  sizeof(uc->ppm.data->version));
-	if (status < 0) {
-		ucsi_unregister_ppm(uc->ucsi);
-		return status;
-	}
+	status = ucsi_register(uc->ucsi);
+	if (status)
+		goto out_free_irq;
 
 	i2c_set_clientdata(client, uc);
 
@@ -1167,6 +1155,13 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 	pm_runtime_idle(uc->dev);
 
 	return 0;
+
+out_free_irq:
+	free_irq(uc->irq, uc);
+out_ucsi_destroy:
+	ucsi_destroy(uc->ucsi);
+
+	return status;
 }
 
 static int ucsi_ccg_remove(struct i2c_client *client)
@@ -1175,8 +1170,9 @@ static int ucsi_ccg_remove(struct i2c_client *client)
 
 	cancel_work_sync(&uc->pm_work);
 	cancel_work_sync(&uc->work);
-	ucsi_unregister_ppm(uc->ucsi);
 	pm_runtime_disable(uc->dev);
+	ucsi_unregister(uc->ucsi);
+	ucsi_destroy(uc->ucsi);
 	free_irq(uc->irq, uc);
 
 	return 0;
-- 
2.24.0.rc1

