Return-Path: <linux-usb+bounces-8877-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 145728977CB
	for <lists+linux-usb@lfdr.de>; Wed,  3 Apr 2024 20:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C27B1C20FBB
	for <lists+linux-usb@lfdr.de>; Wed,  3 Apr 2024 18:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE9B1553A0;
	Wed,  3 Apr 2024 18:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hrgvY5uk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9569315444A
	for <linux-usb@vger.kernel.org>; Wed,  3 Apr 2024 18:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712167528; cv=none; b=QomkUPfkR35qh6CWwv8pp3jdt6orTtYxXaTjS5L05zHwDDEbybVz5j/hLZ/q+5XCX7ti5RIh/Kkcp3cRU+TJ5Zf2GlQ1YVmQLwiE1VbGcJfV2HEO1o/VxIsxtSQuVyqlBXGaeK3MUtqU1d/uNfgqVhXvtd6swO4KCBIsegdz3VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712167528; c=relaxed/simple;
	bh=TjPIswja+QX4qvchxCXr3vHxHmxScu0iGIwulb7avv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUuYAgOn3nIbVJb9sZBy0qp3DQ7C8JYs+/M7CCu856ySKrEx8fc8elJhFYR5Y0riVzEU3Tg+STsrXO0EmYVHQT/hPHSQuv4MVZuN0aSEuUgQiQQ8K1iXoudfI/CsZzkZptYOSjwMETNrJIJKk/TdCdOgvkwwslroh+Qap2od6xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hrgvY5uk; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6eae2b57ff2so60412b3a.2
        for <linux-usb@vger.kernel.org>; Wed, 03 Apr 2024 11:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712167526; x=1712772326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6r0hXY1mSUAHtmGHu0HIennFYFiBELuGkXbpbjNiGk=;
        b=hrgvY5ukzs/6SEgFopilyJWD4dhy7TlSdJRFJIA2pfKYqZxTu53vQplTpZ5S3nfshC
         vSYZmNLYLfFSc6kunzh2y8flo3x3sSQQ+kOY75jBEtMBn2JOniZx25AUomX6AoIzfW1F
         W+qPTBapu0YEdzoX8Atpdqd/9pOxrK/tSIJYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712167526; x=1712772326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6r0hXY1mSUAHtmGHu0HIennFYFiBELuGkXbpbjNiGk=;
        b=Hbi+XsOBMVtZUSwUocpgchYaawUpZhJtu6cKFPpnI3LuFaOGdRRTQD1NAdVPM3zNLl
         8nVkMT6cXkKdqSqtpvkxicxI/VYqvqEVNs44hFDuaQqYZjUeGeiPsuVzzC9pevKYJkZ6
         c5pVpCwKydjYiISH7WY4kNKj1TWRHzKhWHj13F4cp3/g5APikbPC8EEFtqeEwhjuAKFu
         4EGfBzTmD9Egk5MXqsv1bBXCQfQSC0ghoIMeMBeIlTiK+CB5g06a65K+dL+UxPdDUL/a
         Vbv/YSot5oL6wZIWQDu887VfmSCDOEIgS/PFURMlsXphX8eC1ubRWwoFDgR9DliSEhNp
         RKeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJvezbGYved6WXYJ1pPbOxgVycUfEPNujen3Qnem4hyA3Y5Hn+j+WoOHkjMzB517nRbtnJrTMiF2f1Opf8vDZiBSgBYG0rbh6r
X-Gm-Message-State: AOJu0YxXlHTE673rCzB0/UaXalJNNAWgyWOkcgtk1YZntH0TXIQHAct0
	PNzHPD4arNUX+/UNGL1p6CQYwa8GN5C3iQsPBkhQiPrs/nq39g8yiOBJX5Rq+A==
X-Google-Smtp-Source: AGHT+IGmhAX/WvVTQE/eADsUwzjrcoipMbnmE9q6T8NDVo9+zVJKWosRAEI41wFh4IBQQEP3LKtEAw==
X-Received: by 2002:a05:6a20:3d1e:b0:1a5:7404:6539 with SMTP id y30-20020a056a203d1e00b001a574046539mr413758pzi.40.1712167525901;
        Wed, 03 Apr 2024 11:05:25 -0700 (PDT)
Received: from pholla1.c.googlers.com (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with ESMTPSA id n16-20020aa79850000000b006e64ddfa71asm12359162pfq.170.2024.04.03.11.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:05:25 -0700 (PDT)
From: Pavan Holla <pholla@chromium.org>
Date: Wed, 03 Apr 2024 18:05:22 +0000
Subject: [PATCH v3 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-public-ucsi-h-v3-2-f848e18c8ed2@chromium.org>
References: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
In-Reply-To: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 chrome-platform@lists.linux.dev, Pavan Holla <pholla@chromium.org>
X-Mailer: b4 0.12.4

Implementation of a UCSI transport driver for ChromeOS.
This driver will be loaded if the ChromeOS EC implements a PPM.

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
 drivers/usb/typec/ucsi/Kconfig        |  13 ++
 drivers/usb/typec/ucsi/Makefile       |   1 +
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 245 ++++++++++++++++++++++++++++++++++
 3 files changed, 259 insertions(+)

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index bdcb1764cfae..4dceb14a66ee 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -69,4 +69,17 @@ config UCSI_PMIC_GLINK
 	  To compile the driver as a module, choose M here: the module will be
 	  called ucsi_glink.
 
+config CROS_EC_UCSI
+	tristate "UCSI Driver for ChromeOS EC"
+	depends on MFD_CROS_EC_DEV
+	depends on CROS_USBPD_NOTIFY
+	depends on !EXTCON_TCSS_CROS_EC
+	default MFD_CROS_EC_DEV
+	help
+	  This driver enables UCSI support for a ChromeOS EC. The EC is
+	  expected to implement a PPM.
+
+	  To compile the driver as a module, choose M here: the module
+	  will be called cros_ec_ucsi.
+
 endif
diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index b4679f94696b..cb336eee055c 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -21,3 +21,4 @@ obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
 obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
 obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
 obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
+obj-$(CONFIG_CROS_EC_UCSI)		+= cros_ec_ucsi.o
diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
new file mode 100644
index 000000000000..dd46b46d430f
--- /dev/null
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * UCSI driver for ChromeOS EC
+ *
+ * Copyright 2024 Google LLC.
+ */
+
+#include <linux/container_of.h>
+#include <linux/dev_printk.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_data/cros_ec_commands.h>
+#include <linux/platform_data/cros_usbpd_notify.h>
+#include <linux/platform_data/cros_ec_proto.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/wait.h>
+
+#include "ucsi.h"
+
+#define DRV_NAME "cros-ec-ucsi"
+
+#define MAX_EC_DATA_SIZE 256
+#define WRITE_TMO_MS 500
+
+struct cros_ucsi_data {
+	struct device *dev;
+	struct ucsi *ucsi;
+
+	struct cros_ec_device *ec;
+	struct notifier_block nb;
+	struct work_struct work;
+
+	struct completion complete;
+	unsigned long flags;
+};
+
+static int cros_ucsi_read(struct ucsi *ucsi, unsigned int offset, void *val,
+			  size_t val_len)
+{
+	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
+	struct ec_params_ucsi_ppm_get req = {
+		.offset = offset,
+		.size = val_len,
+	};
+	int ret;
+
+	if (val_len > MAX_EC_DATA_SIZE) {
+		dev_err(udata->dev, "Can't read %zu bytes. Too big.", val_len);
+		return -EINVAL;
+	}
+
+	ret = cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_GET,
+			  &req, sizeof(req), val, val_len);
+	if (ret < 0) {
+		dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_GET: error=%d", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int cros_ucsi_async_write(struct ucsi *ucsi, unsigned int offset,
+				 const void *val, size_t val_len)
+{
+	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
+	uint8_t ec_buffer[MAX_EC_DATA_SIZE + sizeof(struct ec_params_ucsi_ppm_set)];
+	struct ec_params_ucsi_ppm_set *req = (struct ec_params_ucsi_ppm_set *)ec_buffer;
+	int ret = 0;
+
+	if (val_len > MAX_EC_DATA_SIZE) {
+		dev_err(udata->dev, "Can't write %zu bytes. Too big.", val_len);
+		return -EINVAL;
+	}
+
+	memset(req, 0, sizeof(ec_buffer));
+	req->offset = offset;
+	memcpy(req->data, val, val_len);
+	ret = cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_SET,
+			  req, sizeof(struct ec_params_ucsi_ppm_set) + val_len, NULL, 0);
+
+	if (ret < 0) {
+		dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_SET: error=%d", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int cros_ucsi_sync_write(struct ucsi *ucsi, unsigned int offset,
+				const void *val, size_t val_len)
+{
+	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
+	bool ack = UCSI_COMMAND(*(u64 *)val) == UCSI_ACK_CC_CI;
+	int ret;
+
+	if (ack)
+		set_bit(ACK_PENDING, &udata->flags);
+	else
+		set_bit(COMMAND_PENDING, &udata->flags);
+
+	ret = cros_ucsi_async_write(ucsi, offset, val, val_len);
+	if (ret)
+		goto out;
+
+	if (!wait_for_completion_timeout(&udata->complete, WRITE_TMO_MS))
+		ret = -ETIMEDOUT;
+
+out:
+	if (ack)
+		clear_bit(ACK_PENDING, &udata->flags);
+	else
+		clear_bit(COMMAND_PENDING, &udata->flags);
+	return ret;
+}
+
+struct ucsi_operations cros_ucsi_ops = {
+	.read = cros_ucsi_read,
+	.async_write = cros_ucsi_async_write,
+	.sync_write = cros_ucsi_sync_write,
+};
+
+static void cros_ucsi_work(struct work_struct *work)
+{
+	struct cros_ucsi_data *udata = container_of(work, struct cros_ucsi_data, work);
+	u32 cci;
+	int ret;
+
+	ret = cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci));
+	if (ret)
+		return;
+
+	if (UCSI_CCI_CONNECTOR(cci))
+		ucsi_connector_change(udata->ucsi, UCSI_CCI_CONNECTOR(cci));
+
+	if (cci & UCSI_CCI_ACK_COMPLETE && test_bit(ACK_PENDING, &udata->flags))
+		complete(&udata->complete);
+	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
+	    test_bit(COMMAND_PENDING, &udata->flags))
+		complete(&udata->complete);
+}
+
+static int cros_ucsi_event(struct notifier_block *nb,
+			   unsigned long host_event, void *_notify)
+{
+	struct cros_ucsi_data *udata = container_of(nb, struct cros_ucsi_data, nb);
+
+	if (!(host_event & PD_EVENT_PPM))
+		return NOTIFY_OK;
+
+	dev_dbg(udata->dev, "UCSI notification received");
+	flush_work(&udata->work);
+	schedule_work(&udata->work);
+
+	return NOTIFY_OK;
+}
+
+static int cros_ucsi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cros_ec_dev *ec_data = dev_get_drvdata(dev->parent);
+	struct cros_ucsi_data *udata;
+	int ret;
+
+	udata = devm_kzalloc(dev, sizeof(*udata), GFP_KERNEL);
+	if (!udata)
+		return -ENOMEM;
+
+	udata->dev = dev;
+
+	udata->ec = ec_data->ec_dev;
+	if (!udata->ec) {
+		dev_err(dev, "couldn't find parent EC device\n");
+		return -ENODEV;
+	}
+
+	platform_set_drvdata(pdev, udata);
+
+	INIT_WORK(&udata->work, cros_ucsi_work);
+	init_completion(&udata->complete);
+
+	udata->ucsi = ucsi_create(udata->dev, &cros_ucsi_ops);
+	if (IS_ERR(udata->ucsi)) {
+		dev_err(dev, "failed to allocate UCSI instance\n");
+		return PTR_ERR(udata->ucsi);
+	}
+
+	ucsi_set_drvdata(udata->ucsi, udata);
+
+	ret = ucsi_register(udata->ucsi);
+	if (ret) {
+		ucsi_destroy(udata->ucsi);
+		return ret;
+	}
+
+	udata->nb.notifier_call = cros_ucsi_event;
+	return cros_usbpd_register_notify(&udata->nb);
+}
+
+static int cros_ucsi_remove(struct platform_device *dev)
+{
+	struct cros_ucsi_data *udata = platform_get_drvdata(dev);
+
+	ucsi_unregister(udata->ucsi);
+	ucsi_destroy(udata->ucsi);
+	return 0;
+}
+
+static int __maybe_unused cros_ucsi_suspend(struct device *dev)
+{
+	struct cros_ucsi_data *udata = dev_get_drvdata(dev);
+
+	cancel_work_sync(&udata->work);
+
+	return 0;
+}
+
+static int __maybe_unused cros_ucsi_resume(struct device *dev)
+{
+	struct cros_ucsi_data *udata = dev_get_drvdata(dev);
+
+	return ucsi_resume(udata->ucsi);
+}
+
+static SIMPLE_DEV_PM_OPS(cros_ucsi_pm_ops, cros_ucsi_suspend,
+			 cros_ucsi_resume);
+
+static const struct platform_device_id cros_ec_ucsi_id[] = {
+	{ "cros-ec-ucsi"},
+	{}
+};
+MODULE_DEVICE_TABLE(platform, cros_ec_ucsi_id);
+
+static struct platform_driver cros_ucsi_driver = {
+	.driver = {
+		.name = DRV_NAME,
+		.pm = &cros_ucsi_pm_ops,
+	},
+	.id_table = cros_ec_ucsi_id,
+	.probe = cros_ucsi_probe,
+	.remove = cros_ucsi_remove,
+};
+
+module_platform_driver(cros_ucsi_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");

-- 
2.44.0.478.gd926399ef9-goog


