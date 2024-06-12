Return-Path: <linux-usb+bounces-11185-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52497904FDB
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 12:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0DEE1F2522B
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 10:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6AC16F0E5;
	Wed, 12 Jun 2024 09:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FrPANOgf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C52516E887
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186382; cv=none; b=IBMm9FfWFCTtBlFFQPMXqUMdNPY8PTbo0vgouWUwV3rSxhsXIT2h7wWgm1yQ0K7QOkl/UtUsH0wWatUxeR12kIctVlJ4X+Q+lKBx12nRkYHPRVD9bmMwchgUjulUV354CtKVj3z9tmDoRuQjXpKnvo3sWMCAWya47/ykduLwScQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186382; c=relaxed/simple;
	bh=536LhHJbNHnYzP9G0tt9rYUFSxdg83RMRIw2Sz9ImnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OjMSPvMljQ4GGoJCHrNheaaT7/lne3FbgWd2Bv2V7ngyAGQ/3jn0tduuyAGOr8V/6gSrZuaJ6sFcVC6jbLI5pwvhOAKV8qGz6woMUpuLiADYYoQXc89IPYfGcbTaMw5BTkmmpgfu6362A5D/uoO4QRmxofTadMT+MhbKu0TyHoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FrPANOgf; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52b7ffd9f6eso7340745e87.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 02:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718186377; x=1718791177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiZrChU/cCRRqsW6GBKx9axeNfgylU+gBWIc4umxzkg=;
        b=FrPANOgfdk04WquPag3jNjgZJJjx13bvnPWexMSV4xz2ZVihVpnvb7QkYSqkrwQ13M
         WgoSIH5ca0owE7OP1L3AU3dF9B0qRXFcP486a2VveLHuI14iEoDvEIXqcbbuVRkqFVb6
         K1lLIz+BgxcEJ8iIGj6t2Jk0H2w0NHZXxxPPQR60vyKhHNTOO190pCa53Fumq/Y7v3gT
         uAmzzEg3LKw3u/8QRDUU3WFVVNcNx1c6H4CjKW8X4MzFicpo4lcN2y7rllE1P2LcQFth
         UWvtqe2KlyeSRSJnrqZjN/rZDQuSfG+w4UgejJxGoceo7O6RQBfxDjB2Ko9WJ0kVlmCL
         WAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718186377; x=1718791177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiZrChU/cCRRqsW6GBKx9axeNfgylU+gBWIc4umxzkg=;
        b=ihDUGllslUuRY2nJoRbaY+XdJZ5ZcZvYkxGHyLiX2iT3RBbqLS7lHdd2JyinqvV8c4
         WEyqscGo+SNVScvFpQoeFpstJkMlaFxQMhlm6P3UPEsMJ0QsKmt3Y5puAfbeTtcM/5Xv
         ypDV5lc3gSiY0VxKgK3oyl2chRUEKL+kZNNzfXKYmSNJK8uZLUY3L4LPVvG6ZqLl+jKl
         1P3+PJhw/RoopST6i9+dpTZ1C1AxZtL53hhuQpGeRnAnTOzoyvTTW/PiAuRfjsJeLUTW
         tp+sd/1P779WdFgezLeDVIKelHe8wgPML3ERTOH81WqKeHZEZOKJRi5lpo0T3NqdHJ8D
         lpgw==
X-Forwarded-Encrypted: i=1; AJvYcCVNAnFzVLYkYsGHdzeSK78GssmBNmwfYzPVCzYB483T+jKsriigDs6Qm52lIkAxB0dUzsGsarvSCRIM8OEpDzMWJrlfrzRItgoT
X-Gm-Message-State: AOJu0Yy4Lelqjl2xLaS/wCLAQrXkqv0+usj4hgN4nMy604jDojD6GZOQ
	p7Guc6KBTsY2pcTV5uMbjqktfSwNpnJAxgCmN/4vgYtsweY+7ivSHBbN1pHylHE=
X-Google-Smtp-Source: AGHT+IHjxlNdeTb2se4ALSsrpkUx05qLO/JByqtxwYMI8glMVosmIlzsmx0z23664Gqvi5+lyxuHKw==
X-Received: by 2002:a05:6512:3b83:b0:52c:84a2:6e0c with SMTP id 2adb3069b0e04-52c9a3fcc1bmr1061843e87.42.1718186377048;
        Wed, 12 Jun 2024 02:59:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c8907dae9sm1408095e87.129.2024.06.12.02.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 02:59:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jun 2024 12:59:34 +0300
Subject: [PATCH v6 3/6] usb: typec: ucsi: add Lenovo Yoga C630 glue driver
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-yoga-ec-driver-v6-3-8e76ba060439@linaro.org>
References: <20240612-yoga-ec-driver-v6-0-8e76ba060439@linaro.org>
In-Reply-To: <20240612-yoga-ec-driver-v6-0-8e76ba060439@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7269;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=536LhHJbNHnYzP9G0tt9rYUFSxdg83RMRIw2Sz9ImnA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaXGFOoqOaeRh29a6Z4lsde68fzBu/Dh+pkzlF
 95GtJ22y4yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmlxhQAKCRCLPIo+Aiko
 1fpvB/9/qLAqCYMi38v5tvuOdQHAERhs9i9LsXiTuwxKTazK2DbpU1t2Dnqg61nXDvZiizmJU1i
 EWSmLGnaCV3BqkLXYKDPYXwDyGOyK1tma/zioG0polMf0VOFzaFtPVAeeTsqq3IYNcF3j3meHXN
 jpDUklZY33dI8Xo89k3eYn9FPSQLa463nVKdQVB4Y+QoJ6KsZZtv3QqihB42QVTT9sMDGwjgMV0
 SFlYySnKf7ux7RGp03W66Gufa0SlCDKd6n0okUnBzb4dJIFzFz/K/TmWUZPkm3R5RPCbqXF/yRb
 AUpUGW5I24yJbgUmE/yvNfjv10EMJm0A2UQrbFF/t2Ea7rLj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The Lenovo Yoga C630 WOS laptop provides implements UCSI interface in
the onboard EC. Add glue driver to interface the platform's UCSI
implementation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/Kconfig          |   9 ++
 drivers/usb/typec/ucsi/Makefile         |   1 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 202 ++++++++++++++++++++++++++++++++
 3 files changed, 212 insertions(+)

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index bdcb1764cfae..680e1b87b152 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -69,4 +69,13 @@ config UCSI_PMIC_GLINK
 	  To compile the driver as a module, choose M here: the module will be
 	  called ucsi_glink.
 
+config UCSI_LENOVO_YOGA_C630
+	tristate "UCSI Interface Driver for Lenovo Yoga C630"
+	depends on EC_LENOVO_YOGA_C630
+	help
+	  This driver enables UCSI support on the Lenovo Yoga C630 laptop.
+
+	  To compile the driver as a module, choose M here: the module will be
+	  called ucsi_yoga_c630.
+
 endif
diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index b4679f94696b..aed41d23887b 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -21,3 +21,4 @@ obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
 obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
 obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
 obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
+obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)	+= ucsi_yoga_c630.o
diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
new file mode 100644
index 000000000000..194b49291f28
--- /dev/null
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024, Linaro Ltd
+ * Authors:
+ *  Bjorn Andersson
+ *  Dmitry Baryshkov
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/completion.h>
+#include <linux/container_of.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/string.h>
+#include <linux/platform_data/lenovo-yoga-c630.h>
+
+#include "ucsi.h"
+
+struct yoga_c630_ucsi {
+	struct yoga_c630_ec *ec;
+	struct ucsi *ucsi;
+	struct notifier_block nb;
+	struct completion complete;
+	unsigned long flags;
+#define UCSI_C630_COMMAND_PENDING	0
+#define UCSI_C630_ACK_PENDING		1
+	u16 version;
+};
+
+static int yoga_c630_ucsi_read(struct ucsi *ucsi, unsigned int offset,
+			       void *val, size_t val_len)
+{
+	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
+	u8 buf[YOGA_C630_UCSI_READ_SIZE];
+	int ret;
+
+	ret = yoga_c630_ec_ucsi_read(uec->ec, buf);
+	if (ret)
+		return ret;
+
+	if (offset == UCSI_VERSION) {
+		memcpy(val, &uec->version, min(val_len, sizeof(uec->version)));
+		return 0;
+	}
+
+	if (offset == UCSI_CCI)
+		memcpy(val, buf, min(val_len, YOGA_C630_UCSI_CCI_SIZE));
+	else if (offset == UCSI_MESSAGE_IN)
+		memcpy(val, buf + YOGA_C630_UCSI_CCI_SIZE,
+		       min(val_len, YOGA_C630_UCSI_DATA_SIZE));
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int yoga_c630_ucsi_async_write(struct ucsi *ucsi, unsigned int offset,
+				      const void *val, size_t val_len)
+{
+	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
+
+	if (offset != UCSI_CONTROL ||
+	    val_len != YOGA_C630_UCSI_WRITE_SIZE)
+		return -EINVAL;
+
+	return yoga_c630_ec_ucsi_write(uec->ec, val);
+}
+
+static int yoga_c630_ucsi_sync_write(struct ucsi *ucsi, unsigned int offset,
+				     const void *val, size_t val_len)
+{
+	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
+	bool ack = UCSI_COMMAND(*(u64 *)val) == UCSI_ACK_CC_CI;
+	int ret;
+
+	if (ack)
+		set_bit(UCSI_C630_ACK_PENDING, &uec->flags);
+	else
+		set_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
+
+	reinit_completion(&uec->complete);
+
+	ret = yoga_c630_ucsi_async_write(ucsi, offset, val, val_len);
+	if (ret)
+		goto out_clear_bit;
+
+	if (!wait_for_completion_timeout(&uec->complete, 5 * HZ))
+		ret = -ETIMEDOUT;
+
+out_clear_bit:
+	if (ack)
+		clear_bit(UCSI_C630_ACK_PENDING, &uec->flags);
+	else
+		clear_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
+
+	return ret;
+}
+
+const struct ucsi_operations yoga_c630_ucsi_ops = {
+	.read = yoga_c630_ucsi_read,
+	.sync_write = yoga_c630_ucsi_sync_write,
+	.async_write = yoga_c630_ucsi_async_write,
+};
+
+static void yoga_c630_ucsi_notify_ucsi(struct yoga_c630_ucsi *uec, u32 cci)
+{
+	if (UCSI_CCI_CONNECTOR(cci))
+		ucsi_connector_change(uec->ucsi, UCSI_CCI_CONNECTOR(cci));
+
+	if (cci & UCSI_CCI_ACK_COMPLETE &&
+	    test_bit(UCSI_C630_ACK_PENDING, &uec->flags))
+		complete(&uec->complete);
+
+	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
+	    test_bit(UCSI_C630_COMMAND_PENDING, &uec->flags))
+		complete(&uec->complete);
+}
+
+static int yoga_c630_ucsi_notify(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	struct yoga_c630_ucsi *uec = container_of(nb, struct yoga_c630_ucsi, nb);
+	u32 cci;
+	int ret;
+
+	switch (action) {
+	case LENOVO_EC_EVENT_USB:
+	case LENOVO_EC_EVENT_HPD:
+		ucsi_connector_change(uec->ucsi, 1);
+		return NOTIFY_OK;
+
+	case LENOVO_EC_EVENT_UCSI:
+		ret = uec->ucsi->ops->read(uec->ucsi, UCSI_CCI, &cci, sizeof(cci));
+		if (ret)
+			return NOTIFY_DONE;
+
+		yoga_c630_ucsi_notify_ucsi(uec, cci);
+
+		return NOTIFY_OK;
+
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static int yoga_c630_ucsi_probe(struct auxiliary_device *adev,
+				const struct auxiliary_device_id *id)
+{
+	struct yoga_c630_ec *ec = adev->dev.platform_data;
+	struct yoga_c630_ucsi *uec;
+	int ret;
+
+	uec = devm_kzalloc(&adev->dev, sizeof(*uec), GFP_KERNEL);
+	if (!uec)
+		return -ENOMEM;
+
+	uec->ec = ec;
+	init_completion(&uec->complete);
+	uec->nb.notifier_call = yoga_c630_ucsi_notify;
+
+	uec->ucsi = ucsi_create(&adev->dev, &yoga_c630_ucsi_ops);
+	if (IS_ERR(uec->ucsi))
+		return PTR_ERR(uec->ucsi);
+
+	ucsi_set_drvdata(uec->ucsi, uec);
+
+	uec->version = yoga_c630_ec_ucsi_get_version(uec->ec);
+
+	auxiliary_set_drvdata(adev, uec);
+
+	ret = yoga_c630_ec_register_notify(ec, &uec->nb);
+	if (ret)
+		return ret;
+
+	return ucsi_register(uec->ucsi);
+}
+
+static void yoga_c630_ucsi_remove(struct auxiliary_device *adev)
+{
+	struct yoga_c630_ucsi *uec = auxiliary_get_drvdata(adev);
+
+	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
+	ucsi_unregister(uec->ucsi);
+}
+
+static const struct auxiliary_device_id yoga_c630_ucsi_id_table[] = {
+	{ .name = YOGA_C630_MOD_NAME "." YOGA_C630_DEV_UCSI, },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, yoga_c630_ucsi_id_table);
+
+static struct auxiliary_driver yoga_c630_ucsi_driver = {
+	.name = YOGA_C630_DEV_UCSI,
+	.id_table = yoga_c630_ucsi_id_table,
+	.probe = yoga_c630_ucsi_probe,
+	.remove = yoga_c630_ucsi_remove,
+};
+
+module_auxiliary_driver(yoga_c630_ucsi_driver);
+
+MODULE_DESCRIPTION("Lenovo Yoga C630 UCSI");
+MODULE_LICENSE("GPL");

-- 
2.39.2


