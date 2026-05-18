Return-Path: <linux-usb+bounces-37630-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +L7yGdF1C2oZIAUAu9opvQ
	(envelope-from <linux-usb+bounces-37630-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:25:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7BF5735BE
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F6903056859
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 20:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B89392C28;
	Mon, 18 May 2026 20:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBWIX99i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C0E392837
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 20:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779135792; cv=none; b=e82WtPWvDAV+OaPKVF3pjw6sDZLjxBEDKqJbD+iI3hNZvQ9bQ6dhl647qwL8KGJrKw2dEgXACzziAUqVkdqn15gcb1lTqZVV383sLIQxuw8uMoJqiKbvpu3Tt5cqO65ZUwqh+JUsX8eU7MDmsoOzrhKsFsBpGi0OgpG8QGboUJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779135792; c=relaxed/simple;
	bh=irpYGJCKR3bjiT4mhwqM9pkxHGcR9vvcqrGle5vQiYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QN24ni26nMQj2u3pDcTq1J4hoewNnqGABoiOx08IG0x0LPdPm6C4WibIRDU9PmY2Hhb3k+EPlQBtKEA2lmBVTXL0RUJDK+lY67snc9QRlHjmYP+dvGxhWkjwjyklH4eZk3fCxwoEhKPAHXBytf1g2VkkZ4bbtT4Z4hHGKZZnAto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBWIX99i; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-393d07e8938so25007781fa.2
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 13:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779135788; x=1779740588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/SGitXszrpcNPK3dZcbgwcy5TAfrIErrXFlnM2twUc=;
        b=PBWIX99i3/ktSuY5On4V79oWlLH59ieJFSe6/rnOC2gw6fYpDKlnmvpTekEL7uNMGU
         ia+yfgl+F2c9DlyG0ymOrrRls3uqpPDbgba37h1xO2TC1Am1t2/gCcpbScB8qoiKiPgj
         NhIXp0pMkBg2Fbm/7mqmNVaF/pHBFVyGh1SBpechQkB1AiskGCJCJ27RS4P2FzynZA9J
         qnkrspO7YuF1tZv9rGfKxZT2iJbwEAyFu67zg69kt2/fHo+Fc6BOXl2fQHKkvGlayhrg
         U83rWvkSFnWTdiU/rH4WZ+bs/HCA8pbi/zzs63uvCFOhkQ1C7infVwS9r+BYmJDWZth8
         pRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779135788; x=1779740588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/SGitXszrpcNPK3dZcbgwcy5TAfrIErrXFlnM2twUc=;
        b=DHdsQgh5hQJ3Yw3jMxnTo8IDvwes85INSydMHhcnBqhZq0lOMuP/aNyC1IVDU8Nu1a
         HTXtlutldfv9Pcu49MDvOjakiD8qKXxAudKnDtBgRoJLHHL4/ICBlIEu8pxzSoiV+TCp
         fiWGLYZKp2CqEa/692nw2D99/k6S4+RgkEeHUMf/CxfFTH0W+LJ56uXvYVRo44e5mg3S
         jdExIDRCtFr7KtRbSAM4eaoeVVIPGJkbi1Lfn0lhByWOdaX5UjQY9NHCu5v1AAlq9N3X
         s9zFm3Zgow5wuxJQ0BGiGWKwCGjtE/5MU9YTLwf5cPZO4osGkWoQNvUtNmQPScXWqWj+
         G+xw==
X-Forwarded-Encrypted: i=1; AFNElJ/AfekbOfa5Z+iQzL2Mq1I5g+plBIa3k5eIwRamaGXpCDyzOOUMVrUvwlL4TURuFFqZe/xHY62EimY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvIlNGGlV0/bQgfAUAZ6LBERcqvvsZiAE6xbv0CInDdsz9zXib
	W3S/biDTX3HaLwN7vpyYVJTzCfaz9WS1vpPyWm8Vn1gnOP7+6HWstPNx
X-Gm-Gg: Acq92OGkJF11TXImVOVIHs5u4ulrEJJDZEFry6bgDqKIzCM40YxF8t/Qcvhsweq4A37
	xS6vSKV6AfqBfarf1gW7WQbYeqhkfbdVcmnwKzLjpu+KEo3YyN7tTAqy4kRR9Kwb15fNKzoe26s
	/aM1gyhmrIV8y0Vh6jSSH/ZKqglEvVO4C9XpY4O22hF+H3mb2HU1VeGqKMB+060fyxoJaqSHYey
	U+HRmLHgjEF9oDYRuPVXAe3rH2kI2CzrzoP/dKYjAm35qnQ5HaTeGzKH7LNk0XcaWZgKILh1BMu
	ofE7ZFvCOBZdy+HFcQxJxrF+FaKURo5uG2KFnuzy+Sztt6LNHFliTlvvUHgki3O0sdMjL6aorLg
	JDh9z0zik+mkBxg1A8wxuPLnI6ZLNhLYZ0Z5nmV/VDFLiR+eYmDx20p+MfoBezLj1oN4IpLhee0
	bwgDD53H2K0nUQ+aAtPKiJF4cbJtkLMYYUUnqhnoEmp5NU2DP0EUdS2PjpSB8J4Q==
X-Received: by 2002:a05:651c:41d5:b0:38f:e2ad:e975 with SMTP id 38308e7fff4ca-39561c0d38amr51094441fa.14.1779135787577;
        Mon, 18 May 2026 13:23:07 -0700 (PDT)
Received: from localhost.localdomain ([90.157.113.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b42f8sm15225061fa.36.2026.05.18.13.23.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 13:23:06 -0700 (PDT)
From: taygoth <taygoth@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>
Subject: [PATCH 3/6] usb: typec: add Qualcomm PMI8998 role-switch driver
Date: Tue, 19 May 2026 01:22:48 +0500
Message-ID: <6fedbcd344505b63de72037f69ea94f916255f03.1779127507.git.taygoth@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
References: <cover.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-37630-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taygoth@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BB7BF5735BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm PMI8998 PMIC integrates a USB Type-C detection block in
its SMB2 charger USBIN region at offset 0x1300. The block performs CC
sensing, debounce and Rp/Rd resolution in silicon and reports role
changes through a single consolidated "type-c-change" interrupt.

This driver reads TYPE_C_STATUS_4 on probe and on every interrupt,
decodes the hardware-detected role (host / device / none) and pushes
it to a usb_role_switch consumer (typically dwc3) so the controller
can flip between peripheral and host on cable orientation change. An
optional VBUS supply regulator is toggled on USB_ROLE_HOST transitions
so bus-powered downstream peripherals can be powered.

No software TCPM state machine is used because the hardware handles
the Type-C protocol natively, and the PMI8998 interrupt topology does
not expose the granular per-event signals the TCPM code path expects.
Power Delivery is not implemented in this driver; the PMI8998 PDPHY
block at offset 0x1700 (register-identical to PM8150B) can be wired
up by a separate driver later if PD negotiation is required.

This enables USB host mode on the OnePlus 6 (enchilada), OnePlus 6T
(fajita), Xiaomi Poco F1 (beryllium), SHIFT 6mq (axolotl) and other
SDM845-based phones that use the PMI8998 as their second PMIC.

Signed-off-by: taygoth <taygoth@gmail.com>
---
 drivers/usb/typec/Kconfig              |  17 ++
 drivers/usb/typec/Makefile             |   1 +
 drivers/usb/typec/qcom_pmi8998_typec.c | 213 +++++++++++++++++++++++++
 3 files changed, 231 insertions(+)
 create mode 100644 drivers/usb/typec/qcom_pmi8998_typec.c

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index 2f80c2792dbd..1912ca3f6e0a 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -100,6 +100,23 @@ config TYPEC_STUSB160X
 	  If you choose to build this driver as a dynamically linked module, the
 	  module will be called stusb160x.ko.
 
+config TYPEC_QCOM_PMI8998
+	tristate "Qualcomm PMI8998 USB Type-C role-switch driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on SPMI
+	select USB_ROLE_SWITCH
+	help
+	  Say Y or M here to enable the role-switch driver for the USB
+	  Type-C detection block integrated in the Qualcomm PMI8998 PMIC.
+	  This is the part used on SDM845 phones such as the OnePlus 6/6T,
+	  Xiaomi Poco F1 and SHIFT 6mq. The driver reports the
+	  hardware-detected role through the USB role switch class so the
+	  USB DRD controller (e.g. dwc3) can flip between peripheral and
+	  host on cable orientation change.
+
+	  If you choose to build this driver as a dynamically linked module,
+	  the module will be called qcom_pmi8998_typec.ko.
+
 config TYPEC_WUSB3801
 	tristate "Willsemi WUSB3801 Type-C port controller driver"
 	depends on I2C
diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 8a6a1c663eb6..568f8ee68c9d 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -10,5 +10,6 @@ obj-$(CONFIG_TYPEC_ANX7411)	+= anx7411.o
 obj-$(CONFIG_TYPEC_HD3SS3220)	+= hd3ss3220.o
 obj-$(CONFIG_TYPEC_STUSB160X) 	+= stusb160x.o
 obj-$(CONFIG_TYPEC_RT1719)	+= rt1719.o
+obj-$(CONFIG_TYPEC_QCOM_PMI8998)	+= qcom_pmi8998_typec.o
 obj-$(CONFIG_TYPEC_WUSB3801)	+= wusb3801.o
 obj-$(CONFIG_TYPEC)		+= mux/
diff --git a/drivers/usb/typec/qcom_pmi8998_typec.c b/drivers/usb/typec/qcom_pmi8998_typec.c
new file mode 100644
index 000000000000..77662b4f1b0c
--- /dev/null
+++ b/drivers/usb/typec/qcom_pmi8998_typec.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Qualcomm PMI8998 USB Type-C role-switch driver.
+ *
+ * The PMI8998 PMIC integrates a USB Type-C detection block inside its
+ * SMB2 charger USBIN region at offset 0x1300. The block performs CC
+ * sensing, debounce and Rp/Rd resolution in hardware, then reports the
+ * negotiated role via TYPE_C_STATUS_4 and a single consolidated
+ * "type-c-change" interrupt.
+ *
+ * This driver translates the hardware-decided role into a
+ * usb_role_switch_set_role() call so the USB DRD controller (typically
+ * dwc3) can flip between peripheral and host. An optional VBUS supply
+ * regulator is enabled on USB_ROLE_HOST transitions so bus-powered
+ * peripherals can be powered.
+ *
+ * No software TCPM state machine is needed because the hardware handles
+ * the Type-C protocol natively. Power Delivery is not supported by this
+ * driver; the PMI8998 PDPHY block at offset 0x1700 (identical register
+ * layout to PM8150B) can be wired up separately by an additional driver
+ * if PD negotiation is required.
+ *
+ * Copyright (c) 2026 Maxim Furman <taygoth@gmail.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/usb/role.h>
+
+#define TYPE_C_STATUS_1_REG			0x0b
+#define   UFP_TYPEC_RDSTD				BIT(7)
+#define   UFP_TYPEC_RD1P5				BIT(6)
+#define   UFP_TYPEC_RD3P0				BIT(5)
+
+#define TYPE_C_STATUS_2_REG			0x0c
+#define   DFP_RD_OPEN					BIT(3)
+#define   DFP_RD_RA_VCONN				BIT(2)
+#define   DFP_RD_RD					BIT(1)
+#define   DFP_RA_RA					BIT(0)
+
+#define TYPE_C_STATUS_4_REG			0x0e
+#define   UFP_DFP_MODE_STATUS				BIT(7)
+#define   TYPEC_VBUS_STATUS				BIT(6)
+#define   TYPEC_VBUS_ERROR_STATUS			BIT(5)
+#define   TYPEC_DEBOUNCE_DONE_STATUS			BIT(4)
+#define   CC_ORIENTATION				BIT(1)
+#define   CC_ATTACHED					BIT(0)
+
+#define TYPE_C_STATUS_5_REG			0x0f
+
+#define TYPE_C_INTRPT_ENB_REG			0x67
+#define TYPE_C_INTRPT_ENB_SW_CTRL_REG		0x68
+
+struct pmi8998_typec {
+	struct device		*dev;
+	struct regmap		*regmap;
+	u32			base;
+	int			irq;
+	struct usb_role_switch	*role_sw;
+	struct regulator	*vbus;
+	bool			vbus_enabled;
+	enum usb_role		role;
+};
+
+static enum usb_role pmi8998_typec_decode(unsigned int status)
+{
+	if (!(status & CC_ATTACHED))
+		return USB_ROLE_NONE;
+	if (!(status & TYPEC_DEBOUNCE_DONE_STATUS))
+		return USB_ROLE_NONE;
+
+	return (status & UFP_DFP_MODE_STATUS) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
+}
+
+static int pmi8998_typec_apply(struct pmi8998_typec *typec)
+{
+	unsigned int status;
+	enum usb_role role;
+	int ret;
+
+	ret = regmap_read(typec->regmap,
+			  typec->base + TYPE_C_STATUS_4_REG, &status);
+	if (ret)
+		return ret;
+
+	role = pmi8998_typec_decode(status);
+	if (role == typec->role)
+		return 0;
+
+	if (typec->vbus) {
+		bool want_vbus = (role == USB_ROLE_HOST);
+
+		if (want_vbus && !typec->vbus_enabled) {
+			ret = regulator_enable(typec->vbus);
+			if (ret)
+				return ret;
+			typec->vbus_enabled = true;
+		} else if (!want_vbus && typec->vbus_enabled) {
+			regulator_disable(typec->vbus);
+			typec->vbus_enabled = false;
+		}
+	}
+
+	ret = usb_role_switch_set_role(typec->role_sw, role);
+	if (ret)
+		return ret;
+
+	typec->role = role;
+	return 0;
+}
+
+static irqreturn_t pmi8998_typec_isr(int irq, void *data)
+{
+	pmi8998_typec_apply(data);
+	return IRQ_HANDLED;
+}
+
+static int pmi8998_typec_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct fwnode_handle *connector;
+	struct pmi8998_typec *typec;
+	int ret;
+
+	typec = devm_kzalloc(dev, sizeof(*typec), GFP_KERNEL);
+	if (!typec)
+		return -ENOMEM;
+
+	typec->dev = dev;
+	typec->role = USB_ROLE_NONE;
+
+	typec->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!typec->regmap)
+		return -ENODEV;
+
+	ret = of_property_read_u32_index(dev->of_node, "reg", 0, &typec->base);
+	if (ret)
+		return ret;
+
+	typec->irq = platform_get_irq_byname(pdev, "type-c-change");
+	if (typec->irq < 0)
+		return typec->irq;
+
+	connector = device_get_named_child_node(dev, "connector");
+	if (!connector)
+		return -EINVAL;
+
+	typec->role_sw = fwnode_usb_role_switch_get(connector);
+	fwnode_handle_put(connector);
+	if (IS_ERR(typec->role_sw))
+		return PTR_ERR(typec->role_sw);
+
+	typec->vbus = devm_regulator_get_optional(dev, "vdd-vbus");
+	if (IS_ERR(typec->vbus)) {
+		if (PTR_ERR(typec->vbus) != -ENODEV) {
+			ret = PTR_ERR(typec->vbus);
+			goto err_role_put;
+		}
+		typec->vbus = NULL;
+	}
+
+	platform_set_drvdata(pdev, typec);
+
+	pmi8998_typec_apply(typec);
+
+	ret = devm_request_threaded_irq(dev, typec->irq, NULL,
+					pmi8998_typec_isr, IRQF_ONESHOT,
+					dev_name(dev), typec);
+	if (ret)
+		goto err_role_put;
+
+	return 0;
+
+err_role_put:
+	usb_role_switch_put(typec->role_sw);
+	return ret;
+}
+
+static void pmi8998_typec_remove(struct platform_device *pdev)
+{
+	struct pmi8998_typec *typec = platform_get_drvdata(pdev);
+
+	if (typec->vbus_enabled)
+		regulator_disable(typec->vbus);
+	usb_role_switch_put(typec->role_sw);
+}
+
+static const struct of_device_id pmi8998_typec_of_match[] = {
+	{ .compatible = "qcom,pmi8998-typec" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pmi8998_typec_of_match);
+
+static struct platform_driver pmi8998_typec_driver = {
+	.probe		= pmi8998_typec_probe,
+	.remove		= pmi8998_typec_remove,
+	.driver		= {
+		.name		= "qcom-pmi8998-typec",
+		.of_match_table	= pmi8998_typec_of_match,
+	},
+};
+module_platform_driver(pmi8998_typec_driver);
+
+MODULE_AUTHOR("Maxim Furman <taygoth@gmail.com>");
+MODULE_DESCRIPTION("Qualcomm PMI8998 USB Type-C role-switch driver");
+MODULE_LICENSE("GPL");
-- 
2.47.3


