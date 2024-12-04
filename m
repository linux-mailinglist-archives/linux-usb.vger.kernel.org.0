Return-Path: <linux-usb+bounces-18101-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8429E4507
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 20:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49750283CA8
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 19:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C807D1F03E1;
	Wed,  4 Dec 2024 19:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dg/d4JRa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F34C1F03C5
	for <linux-usb@vger.kernel.org>; Wed,  4 Dec 2024 19:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733341755; cv=none; b=K63+QljfMsU1aoEQyJHSpRjujQUVtieq/04uOTmWpo7zyMpYXGx7OrL7gAXzRgeecD7Ke6Hl9Etgv9UYo170zQBAoH+unL7C7z0Ni7y+VNZcyGKHMxErmgYrW/VM9bSG0jwen7UiQIFxSYqcNv3e8rH9aPuOGnkoAU+VLq+h5U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733341755; c=relaxed/simple;
	bh=lK0ivbMuGVFo22pBqlyHcJv5/FHxxVd+nXrWiElN8ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=asRgFNfAxXXQ2yORpAYn01IKEqwaNYq0myLMi9X6RGKOsrOzxdtEXimilDsyDxGXx02aXdMpp8+5YXi+v4q6sC33i2yFbCh9CKpX2xdhdoS0S3Oo4h+fyyyz9mjzmq2s6ObJA+zaN3bCqDDyOjtGe36Mivf9Rf/76fZnZ9amSN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dg/d4JRa; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa549f2f9d2so13718166b.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Dec 2024 11:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733341751; x=1733946551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfLXiqjgHx0dn5ZE4clNTJ1/vChAR6qFuJbSnRl8RYQ=;
        b=dg/d4JRaEbuOLUCMoR0+fnogalfruJW8OcEXeCqkc+32AHVVJngtzktF92P+wwbI11
         49sE0Z2T4gvzInhQDuyA4H52dpPWdYGS9xPFXM2LRD15ZIfynfzI3K77mSsv28+CeySq
         c2T7/UeftlaqcS0QgLDqk8Q8bggUQv1euN9g4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733341751; x=1733946551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfLXiqjgHx0dn5ZE4clNTJ1/vChAR6qFuJbSnRl8RYQ=;
        b=pwRhkmLBJ0sBshFqs5ZLrm6jyY+39LH4qdYzqu4JnPgs4dMvgEqFl13jMfES3v0iUP
         lf4rnVuSKLAh1QBQu0Plom/RUbxUO+6GN2JOkMOvAclstsgiBT1xaoMV1ZO4gwpoRsRW
         kxfmXR6mzLgDAFtwiSHIpMt5SLQVCF1yStkb76G0CMQpCkTGiayOQ740b3IrRvEFeLKa
         Far7k8DQzL4XjkT9agwPE1GVY+REd6GXj36X/Der3s4fxXDDJvXfjrLT14izgkrDZ15G
         rtBP5wLqsSGRLeg3AXHxeVBEO2Kw3SOsAnifcEZUZW0xq3Nafq1eJZTyO4q83NylORHG
         bgLQ==
X-Forwarded-Encrypted: i=1; AJvYcCViiFp4zU8qI7VQL5ldjvhYL4RO3yoO+PxzfUkgteNtVnArxYbX17Zw7qedc8NYo32M1GmmjEm/jfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMMhuJjxufzt0AG4wgng5s0BIlxMrO0xvD3t2Q/+37nJPmvqdU
	cCOCjYcHEsaBsKcPHpbyTs8ryoduJ17zOtRk8H7aPbilx8jrV+MuFW7CNNCw
X-Gm-Gg: ASbGncsjJFohXlcjztobK7yB8T4pZOEjiHtp+/RjXmvlVG90Wn/GeLoSyYPQrIy3Eqj
	l13teKloXf5yXY9UlEgZE4Qii9Ninw5MezA1O4ZyiTWcQJwHmdUR0ui9Es2rCrhrXbFn3i+IPXN
	7BKpBXMxNHvpMo5mg2hqDOGJoLWK6yGy6Sjko0kz7Ipk7s/I5JXclDpzWfDjOKKaHuJ6L3APztG
	W8Ls92xSi+Udzcce3ANSQZrr4EXXfKnE/HKouaI+oGDWUs5XgpPvLtRe6XFgnP0vMzsKJc0YdlW
	DNmmNasXU0yvlW8CDi320dKpsf7p4vQppWM=
X-Google-Smtp-Source: AGHT+IGotBOOCXg+AK6OAbJgCnmmngC5Ntc+zv+9ephRuYI5qPPfNNRv8J+7Vd3fPBgKQ3teMWpEAA==
X-Received: by 2002:a17:907:a08:b0:aa5:33f0:c50e with SMTP id a640c23a62f3a-aa5f7f2ca37mr803519766b.57.1733341751575;
        Wed, 04 Dec 2024 11:49:11 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996df797sm775338166b.68.2024.12.04.11.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 11:49:10 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v10 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
Date: Wed,  4 Dec 2024 19:49:00 +0000
Message-ID: <20241204194900.371696-3-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241204194900.371696-1-ukaszb@chromium.org>
References: <20241204194900.371696-1-ukaszb@chromium.org>
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
 drivers/usb/typec/ucsi/Kconfig        |  13 +
 drivers/usb/typec/ucsi/Makefile       |   1 +
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 337 ++++++++++++++++++++++++++
 4 files changed, 358 insertions(+)
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..36eebe1ad078 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5452,6 +5452,13 @@ L:	chrome-platform@lists.linux.dev
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
index 000000000000..cd2231d6a0ea
--- /dev/null
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * UCSI driver for ChromeOS EC
+ *
+ * Copyright 2024 Google LLC.
+ */
+
+#include <linux/container_of.h>
+#include <linux/dev_printk.h>
+#include <linux/jiffies.h>
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
+ * Maximum time in milliseconds the cros_ec_ucsi driver
+ * will wait for a response to a command or and ack.
+ */
+#define WRITE_TMO_MS		5000
+
+/* Number of times to attempt recovery from a write timeout before giving up. */
+#define WRITE_TMO_CTR_MAX	5
+
+struct cros_ucsi_data {
+	struct device *dev;
+	struct ucsi *ucsi;
+
+	struct cros_ec_device *ec;
+	struct notifier_block nb;
+	struct work_struct work;
+	struct delayed_work write_tmo;
+	int tmo_counter;
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
+	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
+	int ret;
+
+	ret = ucsi_sync_control_common(ucsi, cmd);
+	switch (ret) {
+	case -EBUSY:
+		/* EC may return -EBUSY if CCI.busy is set.
+		 * Convert this to a timeout.
+		 */
+	case -ETIMEDOUT:
+		/* Schedule recovery attempt when we timeout
+		 * or tried to send a command while still busy.
+		 */
+		cancel_delayed_work_sync(&udata->write_tmo);
+		schedule_delayed_work(&udata->write_tmo,
+				      msecs_to_jiffies(WRITE_TMO_MS));
+		break;
+	case 0:
+		/* Successful write. Cancel any pending recovery work. */
+		cancel_delayed_work_sync(&udata->write_tmo);
+		break;
+	}
+
+	return ret;
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
+static void cros_ucsi_write_timeout(struct work_struct *work)
+{
+	struct cros_ucsi_data *udata =
+		container_of(work, struct cros_ucsi_data, write_tmo.work);
+	u32 cci;
+	u64 cmd;
+
+	if (cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci))) {
+		dev_err(udata->dev,
+			"Reading CCI failed; no write timeout recovery possible.");
+		return;
+	}
+
+	if (cci & UCSI_CCI_BUSY) {
+		udata->tmo_counter++;
+
+		if (udata->tmo_counter <= WRITE_TMO_CTR_MAX)
+			schedule_delayed_work(&udata->write_tmo,
+					      msecs_to_jiffies(WRITE_TMO_MS));
+		else
+			dev_err(udata->dev,
+				"PPM unresponsive - too many write timeouts.");
+
+		return;
+	}
+
+	/* No longer busy means we can reset our timeout counter. */
+	udata->tmo_counter = 0;
+
+	/* Need to ack previous command which may have timed out. */
+	if (cci & UCSI_CCI_COMMAND_COMPLETE) {
+		cmd = UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE;
+		cros_ucsi_async_control(udata->ucsi, &cmd);
+
+		/* Check again after a few seconds that the system has
+		 * recovered to make sure our async write above was successful.
+		 */
+		schedule_delayed_work(&udata->write_tmo,
+				      msecs_to_jiffies(WRITE_TMO_MS));
+		return;
+	}
+
+	/* We recovered from a previous timeout. Treat this as a recovery from
+	 * suspend and call resume.
+	 */
+	ucsi_resume(udata->ucsi);
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
+	cancel_delayed_work(&udata->write_tmo);
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
+	INIT_DELAYED_WORK(&udata->write_tmo, cros_ucsi_write_timeout);
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
+	cancel_delayed_work(&udata->write_tmo);
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
+/*
+ * UCSI protocol is also used on ChromeOS platforms which reply on
+ * cros_ec_lpc.c driver for communication with embedded controller (EC).
+ * On such platforms communication with the EC is not available until
+ * the .complete() callback of the cros_ec_lpc driver is executed.
+ * For this reason we delay ucsi_resume() until the .complete() stage
+ * otherwise UCSI SET_NOTIFICATION_ENABLE command will fail and we won't
+ * receive any UCSI notifications from the EC where PPM is implemented.
+ */
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


