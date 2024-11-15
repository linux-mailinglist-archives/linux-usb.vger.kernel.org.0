Return-Path: <linux-usb+bounces-17623-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5FC9CF0D0
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 16:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 267B2B2BE9B
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 15:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DC61D5ABF;
	Fri, 15 Nov 2024 15:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="icQkLND/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712011D516F
	for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2024 15:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731685966; cv=none; b=AtVMQkO2vIplZEzuXCwKDtKS5wW0wNfSXY/3EdpLTKvi0VMTv8yneSDbguNrQjYZoJmaIvNP4SJFTZAkputvjQzm+GF+op/UOqCcEdgHQmpicRAeFHfN8AaB2OVHsX4uL7+Mb6SjkMv5NNR7mpdc+PcHkFrxZHWzg7Xb3ol9qyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731685966; c=relaxed/simple;
	bh=d8iORzWAkRlRDkNmgQKv2SPq3OHuyHXPg0ZOEguhGJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=je79ofMtFH1wnst0+H2t2VaQOOy3uODlocQXVoWOsFZ5Ox4npJYUsi+8hAsjk7E4CHGY2sEl+J9BhpsPHj0hLb3dLhuiUMDnIeVh9nD3XQ4j+VbaWDld/9lItkvhMaJRr2DiWqKBJnzkBNuEwykZ5DaKRigBir94rqNhSIcytKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=icQkLND/; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9ed0ec0e92so251139366b.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2024 07:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731685963; x=1732290763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+q+FtIFJacUPcbO+g3+ZKujDF+9VdAofyeFCU/U1w8=;
        b=icQkLND/fxuYpNms+5COO77EFYNA2M2+aBTASlLrdBeCSDi4o1GBQyvJhaVO/jHkfT
         TZkRZY15eL56aw3XROaZJYbI0bOZBt+aBibOjd3PbNmhqTFUFsw50bFl8f3R6mM8a52x
         tHiIWcKQSl4wguHh+kGssnSFcJuhfmWL4qorM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731685963; x=1732290763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+q+FtIFJacUPcbO+g3+ZKujDF+9VdAofyeFCU/U1w8=;
        b=EuetXVmQV1sxGgWLGeNRDYcY9eghKKZgdgM+uOO/7k8yjeGLnPIh19dNntY8Ictoxd
         pU4sW3GO68kGWEoIXpI/e0UUT5GBg+ctZ9ssYmZEJO16AAwmeMBeO2Bj/aep8+g8z/4S
         YJrkkwkOFu9sXTt5fE1xCs/13hktq9a+96lREU0XpkiYEyv4QdVnh0UNdMb7WWQMWnbz
         gKMYr0YyW6W0eJ9Psm9zglRHqjnlkOx2+WhOxIlEVOt4aClYPfg2eM2tNDZHveR/26Se
         2rBpiQewKWvqDwjV3NWmO+Ul5EWMqGbKlMwTpOBj0syTY0Y1NGTPPC1fyYR4+XM80NdY
         JCTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaWq/JBr/iWyF6V5qo1QMJuZiGx32IqoPHEAPOR+1LnoxpoqJJR9tW6ewevO0zp63+ueulgnALpSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxneCGYDVzmkq3cLgdCRx/fepz7O7jP6pSRmc7JGPPflFPQZnLG
	h5HnETuQPaiZXB/11O2DdHKrakKoL3UZvAY8i2kWYPd1UYrhiD0phHZkOqOgBLQJSwbI0pxBqaI
	1
X-Google-Smtp-Source: AGHT+IFc0M/KiyuuTODMgLJo3wXWPFDMf3upJHgE707Z09SNTiFQ5GLlRsAom2N2VumW7iN4ajfUTA==
X-Received: by 2002:a17:907:3e0f:b0:a7a:9f0f:ab18 with SMTP id a640c23a62f3a-aa48341caa6mr267874366b.20.1731685962541;
        Fri, 15 Nov 2024 07:52:42 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e086244sm187758166b.177.2024.11.15.07.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 07:52:40 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v7 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
Date: Fri, 15 Nov 2024 15:52:33 +0000
Message-ID: <20241115155234.1587589-3-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241115155234.1587589-1-ukaszb@chromium.org>
References: <20241115155234.1587589-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pavan Holla <pholla@chromium.org>

Implementation of a UCSI transport driver for ChromeOS.
This driver will be loaded if the ChromeOS EC implements a PPM.

Signed-off-by: Pavan Holla <pholla@chromium.org>
Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 MAINTAINERS                           |   7 +
 drivers/usb/typec/ucsi/Kconfig        |  13 ++
 drivers/usb/typec/ucsi/Makefile       |   1 +
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 248 ++++++++++++++++++++++++++
 4 files changed, 269 insertions(+)
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 21fdaa19229a..b5c57bb68c44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5389,6 +5389,13 @@ L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	drivers/watchdog/cros_ec_wdt.c
 
+CHROMEOS UCSI DRIVER
+M:	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
+M:	Łukasz Bartosik <ukaszb@chromium.org>
+L:	chrome-platform@lists.linux.dev
+S:	Maintained
+F:	drivers/usb/typec/ucsi/cros_ec_ucsi.c
+
 CHRONTEL CH7322 CEC DRIVER
 M:	Joe Tessler <jrt@google.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index 680e1b87b152..75559601fe8f 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -69,6 +69,19 @@ config UCSI_PMIC_GLINK
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
 config UCSI_LENOVO_YOGA_C630
 	tristate "UCSI Interface Driver for Lenovo Yoga C630"
 	depends on EC_LENOVO_YOGA_C630
diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index aed41d23887b..be98a879104d 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -21,4 +21,5 @@ obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
 obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
 obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
 obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
+obj-$(CONFIG_CROS_EC_UCSI)		+= cros_ec_ucsi.o
 obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)	+= ucsi_yoga_c630.o
diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
new file mode 100644
index 000000000000..aae0bf106494
--- /dev/null
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -0,0 +1,248 @@
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
+/*
+ * Maximum size in bytes of a UCSI message between AP and EC
+ */
+#define MAX_EC_DATA_SIZE	256
+
+/*
+ * Maximum time in miliseconds the cros_ec_ucsi driver
+ * will wait for a response to a command or and ack.
+ */
+#define WRITE_TMO_MS		5000
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
+static int cros_ucsi_read_version(struct ucsi *ucsi, u16 *version)
+{
+	return cros_ucsi_read(ucsi, UCSI_VERSION, version, sizeof(*version));
+}
+
+static int cros_ucsi_read_cci(struct ucsi *ucsi, u32 *cci)
+{
+	return cros_ucsi_read(ucsi, UCSI_CCI, cci, sizeof(*cci));
+}
+
+static int cros_ucsi_read_message_in(struct ucsi *ucsi, void *val,
+				     size_t val_len)
+{
+	return cros_ucsi_read(ucsi, UCSI_MESSAGE_IN, val, val_len);
+}
+
+static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
+{
+	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
+	u8 ec_buf[sizeof(struct ec_params_ucsi_ppm_set) + sizeof(cmd)];
+	struct ec_params_ucsi_ppm_set *req = (struct ec_params_ucsi_ppm_set *) ec_buf;
+	int ret;
+
+	req->offset = UCSI_CONTROL;
+	memcpy(req->data, &cmd, sizeof(cmd));
+	ret = cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_SET,
+			  req, sizeof(ec_buf), NULL, 0);
+	if (ret < 0) {
+		dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_SET: error=%d", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
+{
+	return ucsi_sync_control_common(ucsi, cmd);
+}
+
+struct ucsi_operations cros_ucsi_ops = {
+	.read_version = cros_ucsi_read_version,
+	.read_cci = cros_ucsi_read_cci,
+	.read_message_in = cros_ucsi_read_message_in,
+	.async_control = cros_ucsi_async_control,
+	.sync_control = cros_ucsi_sync_control,
+};
+
+static void cros_ucsi_work(struct work_struct *work)
+{
+	struct cros_ucsi_data *udata = container_of(work, struct cros_ucsi_data, work);
+	u32 cci;
+
+	if (cros_ucsi_read_cci(udata->ucsi, &cci))
+		return;
+
+	ucsi_notify_common(udata->ucsi, cci);
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
+static void cros_ucsi_destroy(struct cros_ucsi_data *udata)
+{
+	cros_usbpd_unregister_notify(&udata->nb);
+	cancel_work_sync(&udata->work);
+	ucsi_destroy(udata->ucsi);
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
+		dev_err(dev, "couldn't find parent EC device");
+		return -ENODEV;
+	}
+
+	platform_set_drvdata(pdev, udata);
+
+	INIT_WORK(&udata->work, cros_ucsi_work);
+	init_completion(&udata->complete);
+
+	udata->ucsi = ucsi_create(dev, &cros_ucsi_ops);
+	if (IS_ERR(udata->ucsi)) {
+		dev_err(dev, "failed to allocate UCSI instance");
+		return PTR_ERR(udata->ucsi);
+	}
+
+	ucsi_set_drvdata(udata->ucsi, udata);
+
+	udata->nb.notifier_call = cros_ucsi_event;
+	ret = cros_usbpd_register_notify(&udata->nb);
+	if (ret) {
+		dev_err(dev, "failed to register notifier: error=%d", ret);
+		ucsi_destroy(udata->ucsi);
+		return ret;
+	}
+
+	ret = ucsi_register(udata->ucsi);
+	if (ret) {
+		dev_err(dev, "failed to register UCSI: error=%d", ret);
+		cros_ucsi_destroy(udata);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void cros_ucsi_remove(struct platform_device *dev)
+{
+	struct cros_ucsi_data *udata = platform_get_drvdata(dev);
+
+	ucsi_unregister(udata->ucsi);
+	cros_ucsi_destroy(udata);
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
+static void __maybe_unused cros_ucsi_complete(struct device *dev)
+{
+	struct cros_ucsi_data *udata = dev_get_drvdata(dev);
+
+	ucsi_resume(udata->ucsi);
+}
+
+static const struct dev_pm_ops cros_ucsi_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend = cros_ucsi_suspend,
+	.complete = cros_ucsi_complete,
+#endif
+};
+
+static const struct platform_device_id cros_ucsi_id[] = {
+	{ KBUILD_MODNAME, 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
+
+static struct platform_driver cros_ucsi_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.pm = &cros_ucsi_pm_ops,
+	},
+	.id_table = cros_ucsi_id,
+	.probe = cros_ucsi_probe,
+	.remove = cros_ucsi_remove,
+};
+
+module_platform_driver(cros_ucsi_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");
-- 
2.47.0.338.g60cca15819-goog


