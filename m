Return-Path: <linux-usb+bounces-5020-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E3A82CE9A
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 21:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FC431F22273
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 20:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F54F1864D;
	Sat, 13 Jan 2024 20:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fl7oZv/f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB755182B3
	for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 20:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50ea8fbf261so8753116e87.2
        for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 12:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705179360; x=1705784160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IrYbtSQLEwecmvY7mVOmkjv0hdobg9yVp8LjVqDvEtc=;
        b=fl7oZv/fcOQ3y5P75te6xfqt9bUG7FEasxIltRuTgu8lh13z4vYq5BLBqQ1kBmR73X
         yWz+uXmSw4JINSQQPTnTLSataPbrRaXfjaskPID7sqUyfZ3gByZklFJx85VU4hWmkgZk
         zKKtSfi0AuUED+2gHDHow3FpMsojonuvzbpWM+x2YgUEBAkYOpmMX+3J3p8jibSLbOyr
         FYoT0NslK00+1z722Wppboa2/OvXcVF6QyAu5HXFYmnPqR0LXJt1nQ2KxfYn2zPYdghP
         SiJxqt9fUsJP0jWr4XXqcjuPKvjcOxB3Q0AGkl4bDRfXomgxOyO2e5oAWB3SXR8yZrbZ
         2eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705179360; x=1705784160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrYbtSQLEwecmvY7mVOmkjv0hdobg9yVp8LjVqDvEtc=;
        b=mvx5T8pT05gXbOkdO7lLc87nF4wnLhhICkZmxI4odnUr1CYuqUKL56xlXyb3la6IB7
         tV69DFwKYZzkhRSQ5HTntH7xaiKQOoJUc58IvE4u8E4YxbCRy1JdtjzC6V9Opqah430a
         qF92ypnIh2ckaIORknS3tyhczuRvqantWjzScYlztifng9b9gby1hSX1/IMumEGvhWGL
         NAjmBRwoZr98H/nilE8SIW6eQdk4benyGQzYoTtZ8Iqe2QQFqM4m6l2XKN90bp2fekcX
         9sGVTofVu2UN82dWw6Q46TvantZr34JpwBeDMaLA+hlH9mAaRkhOq3/WCRbl4LH2JaU7
         QxIg==
X-Gm-Message-State: AOJu0YxrJcnAnj8xHLPK5Wng2R2eyAFEDdCnkl9gS58ETbvgGILsvvu9
	uBQGoy+vKHPIFwHUql0YWthxxyrct6PkYA==
X-Google-Smtp-Source: AGHT+IFgvseC4amvEk45BurCDgiV2AShck55v8bBlZ8h6AzSDGUJFN3jnxDK/ZE+tfUF2/FmeUU00A==
X-Received: by 2002:a19:6719:0:b0:50e:242a:775e with SMTP id b25-20020a196719000000b0050e242a775emr1547228lfc.106.1705179359911;
        Sat, 13 Jan 2024 12:55:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p14-20020a056512328e00b0050e9355d7eesm919802lfe.103.2024.01.13.12.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 12:55:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 22:55:51 +0200
Subject: [PATCH v2 08/15] usb: typec: qcom-pmic-typec: allow different
 implementations for the port backend
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v2-8-182d9aa0a5b3@linaro.org>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=27314;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=M70a8nwyM9k8KEGyiEZ97LlW387QdaOfmeDb4AQE5xg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlovjXf6zAUhb2+UviRjMteGH41TQ8GN6nM/7X0
 vTIXJCFLdGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaL41wAKCRCLPIo+Aiko
 1bxIB/44GGAvYFpBShz4UeLL4BUaaKGTphwG39W4eMeIcbTYWwXn7lJ4oy4yH2vKK8F2ozerW6t
 jgbJn+Wgj04UzuPCrlV51NECMxiH8pZHfj56bs5iD7bPIeTHBT6mbm1OACcDLQArlNvXwIQwvn2
 vtat0dZhKHg5YJjkrNLHDWew2Zj5GhCDA0TZfCgDoPCHpaBd5g+vsWTmh0mQb2UuLIruQRS0il3
 +xV5nk78N8jS/Yuxsx7vXFlwOIPb9figiMnl0Rv2UeDSl9YuhoAVGyPsqRXFpJbItt0ZQOTIpGb
 wrJpqlATc9/isA0VYk49P1SzYeWujgS/vH3WGwwtvr5a1VCe
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the PD PHY changes and rework Type-C port implementation to
become an encapsulated backend. While this is not required for the
PMI632, it will us later to enable Type-C handling on earlier platforms,
including, but not limited to SDM845, SDM660 and MSM8998.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      | 137 +---------
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h      |   6 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 290 +++++++++++++++++++--
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h | 168 +-----------
 4 files changed, 282 insertions(+), 319 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index 4c7c38c58a02..82e3f59ea471 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -26,85 +26,9 @@
 
 struct pmic_typec_resources {
 	const struct pmic_typec_pdphy_resources	*pdphy_res;
-	struct pmic_typec_port_resources	*port_res;
+	const struct pmic_typec_port_resources	*port_res;
 };
 
-static int qcom_pmic_typec_get_vbus(struct tcpc_dev *tcpc)
-{
-	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
-	int ret;
-
-	mutex_lock(&tcpm->lock);
-	ret = tcpm->vbus_enabled || qcom_pmic_typec_port_get_vbus(tcpm->pmic_typec_port);
-	mutex_unlock(&tcpm->lock);
-
-	return ret;
-}
-
-static int qcom_pmic_typec_set_vbus(struct tcpc_dev *tcpc, bool on, bool sink)
-{
-	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
-	int ret = 0;
-
-	mutex_lock(&tcpm->lock);
-	if (tcpm->vbus_enabled == on)
-		goto done;
-
-	ret = qcom_pmic_typec_port_set_vbus(tcpm->pmic_typec_port, on);
-	if (ret)
-		goto done;
-
-	tcpm->vbus_enabled = on;
-	tcpm_vbus_change(tcpm->tcpm_port);
-
-done:
-	dev_dbg(tcpm->dev, "set_vbus set: %d result %d\n", on, ret);
-	mutex_unlock(&tcpm->lock);
-
-	return ret;
-}
-
-static int qcom_pmic_typec_set_vconn(struct tcpc_dev *tcpc, bool on)
-{
-	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
-
-	return qcom_pmic_typec_port_set_vconn(tcpm->pmic_typec_port, on);
-}
-
-static int qcom_pmic_typec_get_cc(struct tcpc_dev *tcpc,
-				  enum typec_cc_status *cc1,
-				  enum typec_cc_status *cc2)
-{
-	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
-
-	return qcom_pmic_typec_port_get_cc(tcpm->pmic_typec_port, cc1, cc2);
-}
-
-static int qcom_pmic_typec_set_cc(struct tcpc_dev *tcpc,
-				  enum typec_cc_status cc)
-{
-	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
-
-	return qcom_pmic_typec_port_set_cc(tcpm->pmic_typec_port, cc);
-}
-
-static int qcom_pmic_typec_set_polarity(struct tcpc_dev *tcpc,
-					enum typec_cc_polarity pol)
-{
-	/* Polarity is set separately by phy-qcom-qmp.c */
-	return 0;
-}
-
-static int qcom_pmic_typec_start_toggling(struct tcpc_dev *tcpc,
-					  enum typec_port_type port_type,
-					  enum typec_cc_status cc)
-{
-	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
-
-	return qcom_pmic_typec_port_start_toggling(tcpm->pmic_typec_port,
-						   port_type, cc);
-}
-
 static int qcom_pmic_typec_init(struct tcpc_dev *tcpc)
 {
 	return 0;
@@ -131,13 +55,6 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 
 	tcpm->dev = dev;
 	tcpm->tcpc.init = qcom_pmic_typec_init;
-	tcpm->tcpc.get_vbus = qcom_pmic_typec_get_vbus;
-	tcpm->tcpc.set_vbus = qcom_pmic_typec_set_vbus;
-	tcpm->tcpc.set_cc = qcom_pmic_typec_set_cc;
-	tcpm->tcpc.get_cc = qcom_pmic_typec_get_cc;
-	tcpm->tcpc.set_polarity = qcom_pmic_typec_set_polarity;
-	tcpm->tcpc.set_vconn = qcom_pmic_typec_set_vconn;
-	tcpm->tcpc.start_toggling = qcom_pmic_typec_start_toggling;
 
 	regmap = dev_get_regmap(dev->parent, NULL);
 	if (!regmap) {
@@ -149,11 +66,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	tcpm->pmic_typec_port = qcom_pmic_typec_port_alloc(dev);
-	if (IS_ERR(tcpm->pmic_typec_port))
-		return PTR_ERR(tcpm->pmic_typec_port);
-
-	ret = qcom_pmic_typec_port_probe(pdev, tcpm->pmic_typec_port,
+	ret = qcom_pmic_typec_port_probe(pdev, tcpm,
 					 res->port_res, regmap, base[0]);
 	if (ret)
 		return ret;
@@ -163,7 +76,6 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	mutex_init(&tcpm->lock);
 	platform_set_drvdata(pdev, tcpm);
 
 	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
@@ -180,8 +92,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 		goto fwnode_remove;
 	}
 
-	ret = qcom_pmic_typec_port_start(tcpm->pmic_typec_port,
-					 tcpm->tcpm_port);
+	ret = tcpm->port_start(tcpm, tcpm->tcpm_port);
 	if (ret)
 		goto fwnode_remove;
 
@@ -202,50 +113,12 @@ static void qcom_pmic_typec_remove(struct platform_device *pdev)
 	struct pmic_typec *tcpm = platform_get_drvdata(pdev);
 
 	tcpm->pdphy_stop(tcpm);
-	qcom_pmic_typec_port_stop(tcpm->pmic_typec_port);
+	tcpm->port_stop(tcpm);
 	tcpm_unregister_port(tcpm->tcpm_port);
 	fwnode_remove_software_node(tcpm->tcpc.fwnode);
 }
 
-static struct pmic_typec_port_resources pm8150b_port_res = {
-	.irq_params = {
-		{
-			.irq_name = "vpd-detect",
-			.virq = PMIC_TYPEC_VPD_IRQ,
-		},
-
-		{
-			.irq_name = "cc-state-change",
-			.virq = PMIC_TYPEC_CC_STATE_IRQ,
-		},
-		{
-			.irq_name = "vconn-oc",
-			.virq = PMIC_TYPEC_VCONN_OC_IRQ,
-		},
-
-		{
-			.irq_name = "vbus-change",
-			.virq = PMIC_TYPEC_VBUS_IRQ,
-		},
-
-		{
-			.irq_name = "attach-detach",
-			.virq = PMIC_TYPEC_ATTACH_DETACH_IRQ,
-		},
-		{
-			.irq_name = "legacy-cable-detect",
-			.virq = PMIC_TYPEC_LEGACY_CABLE_IRQ,
-		},
-
-		{
-			.irq_name = "try-snk-src-detect",
-			.virq = PMIC_TYPEC_TRY_SNK_SRC_IRQ,
-		},
-	},
-	.nr_irqs = 7,
-};
-
-static struct pmic_typec_resources pm8150b_typec_res = {
+static const struct pmic_typec_resources pm8150b_typec_res = {
 	.pdphy_res = &pm8150b_pdphy_res,
 	.port_res = &pm8150b_port_res,
 };
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
index da035916c12a..3c75820c9187 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
@@ -12,12 +12,14 @@ struct pmic_typec {
 	struct tcpc_dev		tcpc;
 	struct pmic_typec_pdphy	*pmic_typec_pdphy;
 	struct pmic_typec_port	*pmic_typec_port;
-	bool			vbus_enabled;
-	struct mutex		lock;		/* VBUS state serialization */
 
 	int (*pdphy_start)(struct pmic_typec *tcpm,
 			   struct tcpm_port *tcpm_port);
 	void (*pdphy_stop)(struct pmic_typec *tcpm);
+
+	int (*port_start)(struct pmic_typec *tcpm,
+			  struct tcpm_port *tcpm_port);
+	void (*port_stop)(struct pmic_typec *tcpm);
 };
 
 #define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_typec, tcpc)
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index a8f3f4d3a450..a747baa29784 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -16,8 +16,147 @@
 #include <linux/usb/tcpm.h>
 #include <linux/usb/typec_mux.h>
 #include <linux/workqueue.h>
+
+#include "qcom_pmic_typec.h"
 #include "qcom_pmic_typec_port.h"
 
+#define TYPEC_SNK_STATUS_REG				0x06
+#define DETECTED_SNK_TYPE_MASK				GENMASK(6, 0)
+#define SNK_DAM_MASK					GENMASK(6, 4)
+#define SNK_DAM_500MA					BIT(6)
+#define SNK_DAM_1500MA					BIT(5)
+#define SNK_DAM_3000MA					BIT(4)
+#define SNK_RP_STD					BIT(3)
+#define SNK_RP_1P5					BIT(2)
+#define SNK_RP_3P0					BIT(1)
+#define SNK_RP_SHORT					BIT(0)
+
+#define TYPEC_SRC_STATUS_REG				0x08
+#define DETECTED_SRC_TYPE_MASK				GENMASK(4, 0)
+#define SRC_HIGH_BATT					BIT(5)
+#define SRC_DEBUG_ACCESS				BIT(4)
+#define SRC_RD_OPEN					BIT(3)
+#define SRC_RD_RA_VCONN					BIT(2)
+#define SRC_RA_OPEN					BIT(1)
+#define AUDIO_ACCESS_RA_RA				BIT(0)
+
+#define TYPEC_STATE_MACHINE_STATUS_REG			0x09
+#define TYPEC_ATTACH_DETACH_STATE			BIT(5)
+
+#define TYPEC_SM_STATUS_REG				0x0A
+#define TYPEC_SM_VBUS_VSAFE5V				BIT(5)
+#define TYPEC_SM_VBUS_VSAFE0V				BIT(6)
+#define TYPEC_SM_USBIN_LT_LV				BIT(7)
+
+#define TYPEC_MISC_STATUS_REG				0x0B
+#define TYPEC_WATER_DETECTION_STATUS			BIT(7)
+#define SNK_SRC_MODE					BIT(6)
+#define TYPEC_VBUS_DETECT				BIT(5)
+#define TYPEC_VBUS_ERROR_STATUS				BIT(4)
+#define TYPEC_DEBOUNCE_DONE				BIT(3)
+#define CC_ORIENTATION					BIT(1)
+#define CC_ATTACHED					BIT(0)
+
+#define LEGACY_CABLE_STATUS_REG				0x0D
+#define TYPEC_LEGACY_CABLE_STATUS			BIT(1)
+#define TYPEC_NONCOMP_LEGACY_CABLE_STATUS		BIT(0)
+
+#define TYPEC_U_USB_STATUS_REG				0x0F
+#define U_USB_GROUND_NOVBUS				BIT(6)
+#define U_USB_GROUND					BIT(4)
+#define U_USB_FMB1					BIT(3)
+#define U_USB_FLOAT1					BIT(2)
+#define U_USB_FMB2					BIT(1)
+#define U_USB_FLOAT2					BIT(0)
+
+#define TYPEC_MODE_CFG_REG				0x44
+#define TYPEC_TRY_MODE_MASK				GENMASK(4, 3)
+#define EN_TRY_SNK					BIT(4)
+#define EN_TRY_SRC					BIT(3)
+#define TYPEC_POWER_ROLE_CMD_MASK			GENMASK(2, 0)
+#define EN_SRC_ONLY					BIT(2)
+#define EN_SNK_ONLY					BIT(1)
+#define TYPEC_DISABLE_CMD				BIT(0)
+
+#define TYPEC_VCONN_CONTROL_REG				0x46
+#define VCONN_EN_ORIENTATION				BIT(2)
+#define VCONN_EN_VALUE					BIT(1)
+#define VCONN_EN_SRC					BIT(0)
+
+#define TYPEC_CCOUT_CONTROL_REG				0x48
+#define TYPEC_CCOUT_BUFFER_EN				BIT(2)
+#define TYPEC_CCOUT_VALUE				BIT(1)
+#define TYPEC_CCOUT_SRC					BIT(0)
+
+#define DEBUG_ACCESS_SRC_CFG_REG			0x4C
+#define EN_UNORIENTED_DEBUG_ACCESS_SRC			BIT(0)
+
+#define TYPE_C_CRUDE_SENSOR_CFG_REG			0x4e
+#define EN_SRC_CRUDE_SENSOR				BIT(1)
+#define EN_SNK_CRUDE_SENSOR				BIT(0)
+
+#define TYPEC_EXIT_STATE_CFG_REG			0x50
+#define BYPASS_VSAFE0V_DURING_ROLE_SWAP			BIT(3)
+#define SEL_SRC_UPPER_REF				BIT(2)
+#define USE_TPD_FOR_EXITING_ATTACHSRC			BIT(1)
+#define EXIT_SNK_BASED_ON_CC				BIT(0)
+
+#define TYPEC_CURRSRC_CFG_REG				0x52
+#define TYPEC_SRC_RP_SEL_330UA				BIT(1)
+#define TYPEC_SRC_RP_SEL_180UA				BIT(0)
+#define TYPEC_SRC_RP_SEL_80UA				0
+#define TYPEC_SRC_RP_SEL_MASK				GENMASK(1, 0)
+
+#define TYPEC_INTERRUPT_EN_CFG_1_REG			0x5E
+#define TYPEC_LEGACY_CABLE_INT_EN			BIT(7)
+#define TYPEC_NONCOMPLIANT_LEGACY_CABLE_INT_EN		BIT(6)
+#define TYPEC_TRYSOURCE_DETECT_INT_EN			BIT(5)
+#define TYPEC_TRYSINK_DETECT_INT_EN			BIT(4)
+#define TYPEC_CCOUT_DETACH_INT_EN			BIT(3)
+#define TYPEC_CCOUT_ATTACH_INT_EN			BIT(2)
+#define TYPEC_VBUS_DEASSERT_INT_EN			BIT(1)
+#define TYPEC_VBUS_ASSERT_INT_EN			BIT(0)
+
+#define TYPEC_INTERRUPT_EN_CFG_2_REG			0x60
+#define TYPEC_SRC_BATT_HPWR_INT_EN			BIT(6)
+#define MICRO_USB_STATE_CHANGE_INT_EN			BIT(5)
+#define TYPEC_STATE_MACHINE_CHANGE_INT_EN		BIT(4)
+#define TYPEC_DEBUG_ACCESS_DETECT_INT_EN		BIT(3)
+#define TYPEC_WATER_DETECTION_INT_EN			BIT(2)
+#define TYPEC_VBUS_ERROR_INT_EN				BIT(1)
+#define TYPEC_DEBOUNCE_DONE_INT_EN			BIT(0)
+
+#define TYPEC_DEBOUNCE_OPTION_REG			0x62
+#define REDUCE_TCCDEBOUNCE_TO_2MS			BIT(2)
+
+#define TYPE_C_SBU_CFG_REG				0x6A
+#define SEL_SBU1_ISRC_VAL				0x04
+#define SEL_SBU2_ISRC_VAL				0x01
+
+#define TYPEC_U_USB_CFG_REG				0x70
+#define EN_MICRO_USB_FACTORY_MODE			BIT(1)
+#define EN_MICRO_USB_MODE				BIT(0)
+
+#define TYPEC_PMI632_U_USB_WATER_PROTECTION_CFG_REG	0x72
+
+#define TYPEC_U_USB_WATER_PROTECTION_CFG_REG		0x73
+#define EN_MICRO_USB_WATER_PROTECTION			BIT(4)
+#define MICRO_USB_DETECTION_ON_TIME_CFG_MASK		GENMASK(3, 2)
+#define MICRO_USB_DETECTION_PERIOD_CFG_MASK		GENMASK(1, 0)
+
+#define TYPEC_PMI632_MICRO_USB_MODE_REG			0x73
+#define MICRO_USB_MODE_ONLY				BIT(0)
+
+/* Interrupt numbers */
+#define PMIC_TYPEC_OR_RID_IRQ				0x0
+#define PMIC_TYPEC_VPD_IRQ				0x1
+#define PMIC_TYPEC_CC_STATE_IRQ				0x2
+#define PMIC_TYPEC_VCONN_OC_IRQ				0x3
+#define PMIC_TYPEC_VBUS_IRQ				0x4
+#define PMIC_TYPEC_ATTACH_DETACH_IRQ			0x5
+#define PMIC_TYPEC_LEGACY_CABLE_IRQ			0x6
+#define PMIC_TYPEC_TRY_SNK_SRC_IRQ			0x7
+
 struct pmic_typec_port_irq_data {
 	int				virq;
 	int				irq;
@@ -33,6 +172,8 @@ struct pmic_typec_port {
 	struct pmic_typec_port_irq_data	*irq_data;
 
 	struct regulator		*vdd_vbus;
+	bool				vbus_enabled;
+	struct mutex			vbus_lock;		/* VBUS state serialization */
 
 	int				cc;
 	bool				debouncing_cc;
@@ -131,7 +272,7 @@ static irqreturn_t pmic_typec_port_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-int qcom_pmic_typec_port_get_vbus(struct pmic_typec_port *pmic_typec_port)
+static int qcom_pmic_typec_port_vbus_detect(struct pmic_typec_port *pmic_typec_port)
 {
 	struct device *dev = pmic_typec_port->dev;
 	unsigned int misc;
@@ -148,7 +289,7 @@ int qcom_pmic_typec_port_get_vbus(struct pmic_typec_port *pmic_typec_port)
 	return !!(misc & TYPEC_VBUS_DETECT);
 }
 
-int qcom_pmic_typec_port_set_vbus(struct pmic_typec_port *pmic_typec_port, bool on)
+static int qcom_pmic_typec_port_vbus_toggle(struct pmic_typec_port *pmic_typec_port, bool on)
 {
 	u32 sm_stat;
 	u32 val;
@@ -179,10 +320,49 @@ int qcom_pmic_typec_port_set_vbus(struct pmic_typec_port *pmic_typec_port, bool
 	return 0;
 }
 
-int qcom_pmic_typec_port_get_cc(struct pmic_typec_port *pmic_typec_port,
-				enum typec_cc_status *cc1,
-				enum typec_cc_status *cc2)
+static int qcom_pmic_typec_port_get_vbus(struct tcpc_dev *tcpc)
+{
+	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
+	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
+	int ret;
+
+	mutex_lock(&pmic_typec_port->vbus_lock);
+	ret = pmic_typec_port->vbus_enabled || qcom_pmic_typec_port_vbus_detect(pmic_typec_port);
+	mutex_unlock(&pmic_typec_port->vbus_lock);
+
+	return ret;
+}
+
+static int qcom_pmic_typec_port_set_vbus(struct tcpc_dev *tcpc, bool on, bool sink)
+{
+	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
+	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
+	int ret = 0;
+
+	mutex_lock(&pmic_typec_port->vbus_lock);
+	if (pmic_typec_port->vbus_enabled == on)
+		goto done;
+
+	ret = qcom_pmic_typec_port_vbus_toggle(pmic_typec_port, on);
+	if (ret)
+		goto done;
+
+	pmic_typec_port->vbus_enabled = on;
+	tcpm_vbus_change(tcpm->tcpm_port);
+
+done:
+	dev_dbg(tcpm->dev, "set_vbus set: %d result %d\n", on, ret);
+	mutex_unlock(&pmic_typec_port->vbus_lock);
+
+	return ret;
+}
+
+static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
+				       enum typec_cc_status *cc1,
+				       enum typec_cc_status *cc2)
 {
+	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
+	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 	struct device *dev = pmic_typec_port->dev;
 	unsigned int misc, val;
 	bool attached;
@@ -275,9 +455,11 @@ static void qcom_pmic_set_cc_debounce(struct pmic_typec_port *pmic_typec_port)
 			      msecs_to_jiffies(2));
 }
 
-int qcom_pmic_typec_port_set_cc(struct pmic_typec_port *pmic_typec_port,
-				enum typec_cc_status cc)
+static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
+				       enum typec_cc_status cc)
 {
+	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
+	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 	struct device *dev = pmic_typec_port->dev;
 	unsigned int mode, currsrc;
 	unsigned int misc;
@@ -341,8 +523,17 @@ int qcom_pmic_typec_port_set_cc(struct pmic_typec_port *pmic_typec_port,
 	return ret;
 }
 
-int qcom_pmic_typec_port_set_vconn(struct pmic_typec_port *pmic_typec_port, bool on)
+static int qcom_pmic_typec_port_set_polarity(struct tcpc_dev *tcpc,
+					     enum typec_cc_polarity pol)
+{
+	/* Polarity is set separately by phy-qcom-qmp.c */
+	return 0;
+}
+
+static int qcom_pmic_typec_port_set_vconn(struct tcpc_dev *tcpc, bool on)
 {
+	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
+	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 	struct device *dev = pmic_typec_port->dev;
 	unsigned int orientation, misc, mask, value;
 	unsigned long flags;
@@ -377,10 +568,12 @@ int qcom_pmic_typec_port_set_vconn(struct pmic_typec_port *pmic_typec_port, bool
 	return ret;
 }
 
-int qcom_pmic_typec_port_start_toggling(struct pmic_typec_port *pmic_typec_port,
-					enum typec_port_type port_type,
-					enum typec_cc_status cc)
+static int qcom_pmic_typec_port_start_toggling(struct tcpc_dev *tcpc,
+					       enum typec_port_type port_type,
+					       enum typec_cc_status cc)
 {
+	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
+	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 	struct device *dev = pmic_typec_port->dev;
 	unsigned int misc;
 	u8 mode = 0;
@@ -441,9 +634,10 @@ int qcom_pmic_typec_port_start_toggling(struct pmic_typec_port *pmic_typec_port,
 	(TYPEC_STATE_MACHINE_CHANGE_INT_EN | TYPEC_VBUS_ERROR_INT_EN | \
 	 TYPEC_DEBOUNCE_DONE_INT_EN)
 
-int qcom_pmic_typec_port_start(struct pmic_typec_port *pmic_typec_port,
-			       struct tcpm_port *tcpm_port)
+static int qcom_pmic_typec_port_start(struct pmic_typec *tcpm,
+				      struct tcpm_port *tcpm_port)
 {
+	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 	int i;
 	int mask;
 	int ret;
@@ -491,29 +685,30 @@ int qcom_pmic_typec_port_start(struct pmic_typec_port *pmic_typec_port,
 	return ret;
 }
 
-void qcom_pmic_typec_port_stop(struct pmic_typec_port *pmic_typec_port)
+static void qcom_pmic_typec_port_stop(struct pmic_typec *tcpm)
 {
+	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 	int i;
 
 	for (i = 0; i < pmic_typec_port->nr_irqs; i++)
 		disable_irq(pmic_typec_port->irq_data[i].irq);
 }
 
-struct pmic_typec_port *qcom_pmic_typec_port_alloc(struct device *dev)
-{
-	return devm_kzalloc(dev, sizeof(struct pmic_typec_port), GFP_KERNEL);
-}
-
 int qcom_pmic_typec_port_probe(struct platform_device *pdev,
-			       struct pmic_typec_port *pmic_typec_port,
-			       struct pmic_typec_port_resources *res,
+			       struct pmic_typec *tcpm,
+			       const struct pmic_typec_port_resources *res,
 			       struct regmap *regmap,
 			       u32 base)
 {
 	struct device *dev = &pdev->dev;
 	struct pmic_typec_port_irq_data *irq_data;
+	struct pmic_typec_port *pmic_typec_port;
 	int i, ret, irq;
 
+	pmic_typec_port = devm_kzalloc(dev, sizeof(*pmic_typec_port), GFP_KERNEL);
+	if (!pmic_typec_port)
+		return -ENOMEM;
+
 	if (!res->nr_irqs || res->nr_irqs > PMIC_TYPEC_MAX_IRQS)
 		return -EINVAL;
 
@@ -522,6 +717,8 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	if (!irq_data)
 		return -ENOMEM;
 
+	mutex_init(&pmic_typec_port->vbus_lock);
+
 	pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
 	if (IS_ERR(pmic_typec_port->vdd_vbus))
 		return PTR_ERR(pmic_typec_port->vdd_vbus);
@@ -556,5 +753,56 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 			return ret;
 	}
 
+	tcpm->pmic_typec_port = pmic_typec_port;
+
+	tcpm->tcpc.get_vbus = qcom_pmic_typec_port_get_vbus;
+	tcpm->tcpc.set_vbus = qcom_pmic_typec_port_set_vbus;
+	tcpm->tcpc.set_cc = qcom_pmic_typec_port_set_cc;
+	tcpm->tcpc.get_cc = qcom_pmic_typec_port_get_cc;
+	tcpm->tcpc.set_polarity = qcom_pmic_typec_port_set_polarity;
+	tcpm->tcpc.set_vconn = qcom_pmic_typec_port_set_vconn;
+	tcpm->tcpc.start_toggling = qcom_pmic_typec_port_start_toggling;
+
+	tcpm->port_start = qcom_pmic_typec_port_start;
+	tcpm->port_stop = qcom_pmic_typec_port_stop;
+
 	return 0;
 }
+
+const struct pmic_typec_port_resources pm8150b_port_res = {
+	.irq_params = {
+		{
+			.irq_name = "vpd-detect",
+			.virq = PMIC_TYPEC_VPD_IRQ,
+		},
+
+		{
+			.irq_name = "cc-state-change",
+			.virq = PMIC_TYPEC_CC_STATE_IRQ,
+		},
+		{
+			.irq_name = "vconn-oc",
+			.virq = PMIC_TYPEC_VCONN_OC_IRQ,
+		},
+
+		{
+			.irq_name = "vbus-change",
+			.virq = PMIC_TYPEC_VBUS_IRQ,
+		},
+
+		{
+			.irq_name = "attach-detach",
+			.virq = PMIC_TYPEC_ATTACH_DETACH_IRQ,
+		},
+		{
+			.irq_name = "legacy-cable-detect",
+			.virq = PMIC_TYPEC_LEGACY_CABLE_IRQ,
+		},
+
+		{
+			.irq_name = "try-snk-src-detect",
+			.virq = PMIC_TYPEC_TRY_SNK_SRC_IRQ,
+		},
+	},
+	.nr_irqs = 7,
+};
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h
index 4a892048908e..2ca83a46cf3b 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h
@@ -9,143 +9,6 @@
 #include <linux/platform_device.h>
 #include <linux/usb/tcpm.h>
 
-#define TYPEC_SNK_STATUS_REG				0x06
-#define DETECTED_SNK_TYPE_MASK				GENMASK(6, 0)
-#define SNK_DAM_MASK					GENMASK(6, 4)
-#define SNK_DAM_500MA					BIT(6)
-#define SNK_DAM_1500MA					BIT(5)
-#define SNK_DAM_3000MA					BIT(4)
-#define SNK_RP_STD					BIT(3)
-#define SNK_RP_1P5					BIT(2)
-#define SNK_RP_3P0					BIT(1)
-#define SNK_RP_SHORT					BIT(0)
-
-#define TYPEC_SRC_STATUS_REG				0x08
-#define DETECTED_SRC_TYPE_MASK				GENMASK(4, 0)
-#define SRC_HIGH_BATT					BIT(5)
-#define SRC_DEBUG_ACCESS				BIT(4)
-#define SRC_RD_OPEN					BIT(3)
-#define SRC_RD_RA_VCONN					BIT(2)
-#define SRC_RA_OPEN					BIT(1)
-#define AUDIO_ACCESS_RA_RA				BIT(0)
-
-#define TYPEC_STATE_MACHINE_STATUS_REG			0x09
-#define TYPEC_ATTACH_DETACH_STATE			BIT(5)
-
-#define TYPEC_SM_STATUS_REG				0x0A
-#define TYPEC_SM_VBUS_VSAFE5V				BIT(5)
-#define TYPEC_SM_VBUS_VSAFE0V				BIT(6)
-#define TYPEC_SM_USBIN_LT_LV				BIT(7)
-
-#define TYPEC_MISC_STATUS_REG				0x0B
-#define TYPEC_WATER_DETECTION_STATUS			BIT(7)
-#define SNK_SRC_MODE					BIT(6)
-#define TYPEC_VBUS_DETECT				BIT(5)
-#define TYPEC_VBUS_ERROR_STATUS				BIT(4)
-#define TYPEC_DEBOUNCE_DONE				BIT(3)
-#define CC_ORIENTATION					BIT(1)
-#define CC_ATTACHED					BIT(0)
-
-#define LEGACY_CABLE_STATUS_REG				0x0D
-#define TYPEC_LEGACY_CABLE_STATUS			BIT(1)
-#define TYPEC_NONCOMP_LEGACY_CABLE_STATUS		BIT(0)
-
-#define TYPEC_U_USB_STATUS_REG				0x0F
-#define U_USB_GROUND_NOVBUS				BIT(6)
-#define U_USB_GROUND					BIT(4)
-#define U_USB_FMB1					BIT(3)
-#define U_USB_FLOAT1					BIT(2)
-#define U_USB_FMB2					BIT(1)
-#define U_USB_FLOAT2					BIT(0)
-
-#define TYPEC_MODE_CFG_REG				0x44
-#define TYPEC_TRY_MODE_MASK				GENMASK(4, 3)
-#define EN_TRY_SNK					BIT(4)
-#define EN_TRY_SRC					BIT(3)
-#define TYPEC_POWER_ROLE_CMD_MASK			GENMASK(2, 0)
-#define EN_SRC_ONLY					BIT(2)
-#define EN_SNK_ONLY					BIT(1)
-#define TYPEC_DISABLE_CMD				BIT(0)
-
-#define TYPEC_VCONN_CONTROL_REG				0x46
-#define VCONN_EN_ORIENTATION				BIT(2)
-#define VCONN_EN_VALUE					BIT(1)
-#define VCONN_EN_SRC					BIT(0)
-
-#define TYPEC_CCOUT_CONTROL_REG				0x48
-#define TYPEC_CCOUT_BUFFER_EN				BIT(2)
-#define TYPEC_CCOUT_VALUE				BIT(1)
-#define TYPEC_CCOUT_SRC					BIT(0)
-
-#define DEBUG_ACCESS_SRC_CFG_REG			0x4C
-#define EN_UNORIENTED_DEBUG_ACCESS_SRC			BIT(0)
-
-#define TYPE_C_CRUDE_SENSOR_CFG_REG			0x4e
-#define EN_SRC_CRUDE_SENSOR				BIT(1)
-#define EN_SNK_CRUDE_SENSOR				BIT(0)
-
-#define TYPEC_EXIT_STATE_CFG_REG			0x50
-#define BYPASS_VSAFE0V_DURING_ROLE_SWAP			BIT(3)
-#define SEL_SRC_UPPER_REF				BIT(2)
-#define USE_TPD_FOR_EXITING_ATTACHSRC			BIT(1)
-#define EXIT_SNK_BASED_ON_CC				BIT(0)
-
-#define TYPEC_CURRSRC_CFG_REG				0x52
-#define TYPEC_SRC_RP_SEL_330UA				BIT(1)
-#define TYPEC_SRC_RP_SEL_180UA				BIT(0)
-#define TYPEC_SRC_RP_SEL_80UA				0
-#define TYPEC_SRC_RP_SEL_MASK				GENMASK(1, 0)
-
-#define TYPEC_INTERRUPT_EN_CFG_1_REG			0x5E
-#define TYPEC_LEGACY_CABLE_INT_EN			BIT(7)
-#define TYPEC_NONCOMPLIANT_LEGACY_CABLE_INT_EN		BIT(6)
-#define TYPEC_TRYSOURCE_DETECT_INT_EN			BIT(5)
-#define TYPEC_TRYSINK_DETECT_INT_EN			BIT(4)
-#define TYPEC_CCOUT_DETACH_INT_EN			BIT(3)
-#define TYPEC_CCOUT_ATTACH_INT_EN			BIT(2)
-#define TYPEC_VBUS_DEASSERT_INT_EN			BIT(1)
-#define TYPEC_VBUS_ASSERT_INT_EN			BIT(0)
-
-#define TYPEC_INTERRUPT_EN_CFG_2_REG			0x60
-#define TYPEC_SRC_BATT_HPWR_INT_EN			BIT(6)
-#define MICRO_USB_STATE_CHANGE_INT_EN			BIT(5)
-#define TYPEC_STATE_MACHINE_CHANGE_INT_EN		BIT(4)
-#define TYPEC_DEBUG_ACCESS_DETECT_INT_EN		BIT(3)
-#define TYPEC_WATER_DETECTION_INT_EN			BIT(2)
-#define TYPEC_VBUS_ERROR_INT_EN				BIT(1)
-#define TYPEC_DEBOUNCE_DONE_INT_EN			BIT(0)
-
-#define TYPEC_DEBOUNCE_OPTION_REG			0x62
-#define REDUCE_TCCDEBOUNCE_TO_2MS			BIT(2)
-
-#define TYPE_C_SBU_CFG_REG				0x6A
-#define SEL_SBU1_ISRC_VAL				0x04
-#define SEL_SBU2_ISRC_VAL				0x01
-
-#define TYPEC_U_USB_CFG_REG				0x70
-#define EN_MICRO_USB_FACTORY_MODE			BIT(1)
-#define EN_MICRO_USB_MODE				BIT(0)
-
-#define TYPEC_PMI632_U_USB_WATER_PROTECTION_CFG_REG	0x72
-
-#define TYPEC_U_USB_WATER_PROTECTION_CFG_REG		0x73
-#define EN_MICRO_USB_WATER_PROTECTION			BIT(4)
-#define MICRO_USB_DETECTION_ON_TIME_CFG_MASK		GENMASK(3, 2)
-#define MICRO_USB_DETECTION_PERIOD_CFG_MASK		GENMASK(1, 0)
-
-#define TYPEC_PMI632_MICRO_USB_MODE_REG			0x73
-#define MICRO_USB_MODE_ONLY				BIT(0)
-
-/* Interrupt numbers */
-#define PMIC_TYPEC_OR_RID_IRQ				0x0
-#define PMIC_TYPEC_VPD_IRQ				0x1
-#define PMIC_TYPEC_CC_STATE_IRQ				0x2
-#define PMIC_TYPEC_VCONN_OC_IRQ				0x3
-#define PMIC_TYPEC_VBUS_IRQ				0x4
-#define PMIC_TYPEC_ATTACH_DETACH_IRQ			0x5
-#define PMIC_TYPEC_LEGACY_CABLE_IRQ			0x6
-#define PMIC_TYPEC_TRY_SNK_SRC_IRQ			0x7
-
 /* Resources */
 #define PMIC_TYPEC_MAX_IRQS				0x08
 
@@ -156,40 +19,17 @@ struct pmic_typec_port_irq_params {
 
 struct pmic_typec_port_resources {
 	unsigned int				nr_irqs;
-	struct pmic_typec_port_irq_params	irq_params[PMIC_TYPEC_MAX_IRQS];
+	const struct pmic_typec_port_irq_params	irq_params[PMIC_TYPEC_MAX_IRQS];
 };
 
 /* API */
-struct pmic_typec;
 
-struct pmic_typec_port *qcom_pmic_typec_port_alloc(struct device *dev);
+extern const struct pmic_typec_port_resources pm8150b_port_res;
 
 int qcom_pmic_typec_port_probe(struct platform_device *pdev,
-			       struct pmic_typec_port *pmic_typec_port,
-			       struct pmic_typec_port_resources *res,
+			       struct pmic_typec *tcpm,
+			       const struct pmic_typec_port_resources *res,
 			       struct regmap *regmap,
 			       u32 base);
 
-int qcom_pmic_typec_port_start(struct pmic_typec_port *pmic_typec_port,
-			       struct tcpm_port *tcpm_port);
-
-void qcom_pmic_typec_port_stop(struct pmic_typec_port *pmic_typec_port);
-
-int qcom_pmic_typec_port_get_cc(struct pmic_typec_port *pmic_typec_port,
-				enum typec_cc_status *cc1,
-				enum typec_cc_status *cc2);
-
-int qcom_pmic_typec_port_set_cc(struct pmic_typec_port *pmic_typec_port,
-				enum typec_cc_status cc);
-
-int qcom_pmic_typec_port_get_vbus(struct pmic_typec_port *pmic_typec_port);
-
-int qcom_pmic_typec_port_set_vconn(struct pmic_typec_port *pmic_typec_port, bool on);
-
-int qcom_pmic_typec_port_start_toggling(struct pmic_typec_port *pmic_typec_port,
-					enum typec_port_type port_type,
-					enum typec_cc_status cc);
-
-int qcom_pmic_typec_port_set_vbus(struct pmic_typec_port *pmic_typec_port, bool on);
-
 #endif /* __QCOM_PMIC_TYPE_C_PORT_H__ */

-- 
2.39.2


