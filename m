Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1E89BF4FE
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 16:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbfIZOZY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 10:25:24 -0400
Received: from mga14.intel.com ([192.55.52.115]:20997 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726500AbfIZOZY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Sep 2019 10:25:24 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Sep 2019 07:25:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,552,1559545200"; 
   d="scan'208";a="203864768"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2019 07:25:22 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 10/14] usb: typec: ucsi: acpi: Move to the new API
Date:   Thu, 26 Sep 2019 17:25:18 +0300
Message-Id: <20190926142522.67031-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
References: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Replacing the old "cmd" and "sync" callbacks with an
implementation of struct ucsi_operations. The ACPI
notification (interrupt) handler will from now on read the
CCI (Command Status and Connector Change Indication)
register, and call ucsi_connector_change() function and/or
complete pending command completions based on it.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 96 ++++++++++++++++++++++++------
 1 file changed, 77 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index a18112a83fae..876510acbf9f 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -19,7 +19,9 @@
 struct ucsi_acpi {
 	struct device *dev;
 	struct ucsi *ucsi;
-	struct ucsi_ppm ppm;
+	void __iomem *base;
+	struct completion complete;
+	unsigned long flags;
 	guid_t guid;
 };
 
@@ -39,27 +41,78 @@ static int ucsi_acpi_dsm(struct ucsi_acpi *ua, int func)
 	return 0;
 }
 
-static int ucsi_acpi_cmd(struct ucsi_ppm *ppm, struct ucsi_control *ctrl)
+static int ucsi_acpi_read(struct ucsi *ucsi, unsigned int offset,
+			  void *val, size_t val_len)
 {
-	struct ucsi_acpi *ua = container_of(ppm, struct ucsi_acpi, ppm);
+	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
+	int ret;
+
+	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
+	if (ret)
+		return ret;
 
-	ppm->data->ctrl.raw_cmd = ctrl->raw_cmd;
+	memcpy(val, ua->base + offset, val_len);
+
+	return 0;
+}
+
+static int ucsi_acpi_async_write(struct ucsi *ucsi, unsigned int offset,
+				 const void *val, size_t val_len)
+{
+	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
+
+	memcpy(ua->base + offset, val, val_len);
 
 	return ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_WRITE);
 }
 
-static int ucsi_acpi_sync(struct ucsi_ppm *ppm)
+static int ucsi_acpi_sync_write(struct ucsi *ucsi, unsigned int offset,
+				const void *val, size_t val_len)
 {
-	struct ucsi_acpi *ua = container_of(ppm, struct ucsi_acpi, ppm);
+	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
+	int ret;
+
+	set_bit(COMMAND_PENDING, &ua->flags);
+
+	ret = ucsi_acpi_async_write(ucsi, offset, val, val_len);
+	if (ret)
+		goto out_clear_bit;
+
+	if (!wait_for_completion_timeout(&ua->complete, msecs_to_jiffies(5000)))
+		ret = -ETIMEDOUT;
 
-	return ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
+out_clear_bit:
+	clear_bit(COMMAND_PENDING, &ua->flags);
+
+	return ret;
 }
 
+static const struct ucsi_operations ucsi_acpi_ops = {
+	.read = ucsi_acpi_read,
+	.sync_write = ucsi_acpi_sync_write,
+	.async_write = ucsi_acpi_async_write
+};
+
 static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
 {
 	struct ucsi_acpi *ua = data;
+	u32 cci;
+	int ret;
+
+	ret = ucsi_acpi_read(ua->ucsi, UCSI_CCI, &cci, sizeof(cci));
+	if (ret) {
+		dev_err(ua->dev, "failed to read CCI\n");
+		return;
+	}
+
+	if (UCSI_CCI_CONNECTOR(cci))
+		ucsi_connector_change(ua->ucsi, UCSI_CCI_CONNECTOR(cci));
 
-	ucsi_notify(ua->ucsi);
+	if (test_bit(COMMAND_PENDING, &ua->flags) &&
+	    (cci & (UCSI_CCI_BUSY |
+		    UCSI_CCI_ACK_COMPLETE |
+		    UCSI_CCI_COMMAND_COMPLETE)))
+		complete(&ua->complete);
 }
 
 static int ucsi_acpi_probe(struct platform_device *pdev)
@@ -90,35 +143,39 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
 	 * it can not be requested here, and we can not use
 	 * devm_ioremap_resource().
 	 */
-	ua->ppm.data = devm_ioremap(&pdev->dev, res->start, resource_size(res));
-	if (!ua->ppm.data)
+	ua->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!ua->base)
 		return -ENOMEM;
 
-	if (!ua->ppm.data->version)
-		return -ENODEV;
-
 	ret = guid_parse(UCSI_DSM_UUID, &ua->guid);
 	if (ret)
 		return ret;
 
-	ua->ppm.cmd = ucsi_acpi_cmd;
-	ua->ppm.sync = ucsi_acpi_sync;
+	init_completion(&ua->complete);
 	ua->dev = &pdev->dev;
 
+	ua->ucsi = ucsi_create(&pdev->dev, &ucsi_acpi_ops);
+	if (IS_ERR(ua->ucsi))
+		return PTR_ERR(ua->ucsi);
+
+	ucsi_set_drvdata(ua->ucsi, ua);
+
 	status = acpi_install_notify_handler(ACPI_HANDLE(&pdev->dev),
 					     ACPI_DEVICE_NOTIFY,
 					     ucsi_acpi_notify, ua);
 	if (ACPI_FAILURE(status)) {
 		dev_err(&pdev->dev, "failed to install notify handler\n");
+		ucsi_destroy(ua->ucsi);
 		return -ENODEV;
 	}
 
-	ua->ucsi = ucsi_register_ppm(&pdev->dev, &ua->ppm);
-	if (IS_ERR(ua->ucsi)) {
+	ret = ucsi_register(ua->ucsi);
+	if (ret) {
 		acpi_remove_notify_handler(ACPI_HANDLE(&pdev->dev),
 					   ACPI_DEVICE_NOTIFY,
 					   ucsi_acpi_notify);
-		return PTR_ERR(ua->ucsi);
+		ucsi_destroy(ua->ucsi);
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, ua);
@@ -130,7 +187,8 @@ static int ucsi_acpi_remove(struct platform_device *pdev)
 {
 	struct ucsi_acpi *ua = platform_get_drvdata(pdev);
 
-	ucsi_unregister_ppm(ua->ucsi);
+	ucsi_unregister(ua->ucsi);
+	ucsi_destroy(ua->ucsi);
 
 	acpi_remove_notify_handler(ACPI_HANDLE(&pdev->dev), ACPI_DEVICE_NOTIFY,
 				   ucsi_acpi_notify);
-- 
2.23.0

