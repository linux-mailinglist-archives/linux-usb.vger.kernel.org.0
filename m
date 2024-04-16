Return-Path: <linux-usb+bounces-9378-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 531218A60F5
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 04:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9A14B2205F
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 02:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A8038FB6;
	Tue, 16 Apr 2024 02:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V9vl7s3O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D36018622
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 02:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713234061; cv=none; b=kGUkr5gXdRpnIam4cDj9GMsxlgY1GaJ/f8U2z0vXGkf4qzrVnssQDeSbWSRymGYTk0wRMzU3PG8odTQ54n67P9/CnPPXYFIrh2aNaPj0oVRZixK+y5yRg8EqbgXnO3SkizuKUxy79boGMiwi4fLicZWwMRfr2SoF7RNBzRBwQ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713234061; c=relaxed/simple;
	bh=S4XLZ5gKp33g0mOP4hRwHIm80nPUorFiQzB2vpdJzqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QdNlXwZbjJPx4kQc8YVX0f497Ef3M2LnerahNk7ryiJFHpf2VRrfXGBTkToiSHnODyMyRank9t6kdk0b1wskvJPxa/6omKo/i0uAzY/jTE+haAH6CSLL/gHmUqtrIbnlQZErjPSAv5L5ELMZs13T3Crb/hc+pBM/gMW03Nph474=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V9vl7s3O; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-518bad5f598so2574829e87.2
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 19:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713234058; x=1713838858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmft9a32U+BC16BwBrJgQUX6tPI4vtXStWeaypraph0=;
        b=V9vl7s3OxQ1QMieud4iI3xs0xB7ASdcSWluvabszSj3boX5WKvf4aCCSNy/v4Ex70x
         Yach5XfRzP6jfzn6mLxAXwfdMJutNvmj7efIo4b42bdvGC1oQIsNdJw+0S2C8a7SEQam
         HlZ7pcnkFH+MGThUjpbpEm8f3n7bOC4mJGAb4lgZ3CgpsPP2SUG4NO4ChrgzmFF5zrT5
         sUf2Bbqr2xBnc3uIVW09w9gHQ64Jzb3tjNxRaSqaz3XAa0xXqWxcQ/ElLg2Q5xgA8izO
         Dnk7o2rX35gZjoLuSsi7We5nETfzld5pM2KKVp6deAMIbKBMZs5u2493D+hTRkSw8v75
         Ktww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713234058; x=1713838858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmft9a32U+BC16BwBrJgQUX6tPI4vtXStWeaypraph0=;
        b=Fa1/TeClDDL+ssdhCa+g4ZYB8f4YCKOg0zNR1O/tXAcBxHdcW+tPb9dn9/A1OrsOiw
         qvzcrV9IK4iQ0GMwHnohr7rdlIUH8OyNmvGKihoPf6FxnbwV+AJ1VcZi1Ew18SmzKUf5
         K+qA8xMFApBSAyHPMHOuBKukhxBLFfVqt3S/zwerUTsouImaca1T0Y3TeSxKCakRreoN
         tiXKirB6OO2wZaDHu8Uead8uIyNbJTOF4oLC9vu7uE7DwHk7Fbr8ONRXjZKjl2CDnz0E
         LnewPMVnG5M0Vcg9jqhVfJpCQfPIcshApzFw247Tz++j1wC//X8MX8x/PQKMtKq/Jxgr
         r6qQ==
X-Gm-Message-State: AOJu0YznpYjDosfgkmB+0+/c881MwSpAYgNpHLG2JNT/CReTCVKJQpf/
	j0ukD39enLJjefLRoTfFCzDPFcrKgv/xMDtxxDmyU5G5tEjIBdsoCd6EIvTunrSHkTzp9giFigX
	7
X-Google-Smtp-Source: AGHT+IFBL6bM/VlpK1viDFzpuJ5b+21YlpTzGJvRGZG9aZFsEC0Wh30vqokRKodcDSO5bVKOvjRQzA==
X-Received: by 2002:a05:6512:55b:b0:517:8594:2c00 with SMTP id h27-20020a056512055b00b0051785942c00mr6506167lfl.22.1713234057752;
        Mon, 15 Apr 2024 19:20:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bi30-20020a0565120e9e00b0051925dd92dbsm27716lfb.214.2024.04.15.19.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 19:20:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 05:20:54 +0300
Subject: [PATCH 5/8] usb: typec: ucsi: glink: simplify notification
 handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240416-ucsi-glink-altmode-v1-5-890db00877ac@linaro.org>
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
In-Reply-To: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5788;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=S4XLZ5gKp33g0mOP4hRwHIm80nPUorFiQzB2vpdJzqo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmHeCEOldYMhHpDjHlCssZl4h2CPK7xckJEkiNk
 1xqfri6NkuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZh3ghAAKCRCLPIo+Aiko
 1QD+B/0S2/56T00TOtH5nUi/LdKpLohPJVjV+re8oMk8XGAbEE8KyYWJ8pUBracYkn4e3d4qvYi
 VzKtIHxVhVHPBErzaIaK0OlyVxBCZYr4pCk5wsC7Dg0Cw334G9FL254Eubp0e/FZlr8X4MtdbDw
 Uv92CWnNLUaEwOFSTh9wg/CjgOaxDVEOGqZRvRKXDb0xPxgmAWccGiGzy8nfB3nZ0RLGC6/xS5o
 XZ132SlUwMVVn9mzvpYsEbivU19s5uWHXtgihUuIzOSC2Bw6NZZPpyiVE2iz+K1LkrqiOoocK1K
 fYVh9q7ocJkwPOb7Yxo5HFril/IfcNKmDsFRg8qReXTyLRfV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

All platforms except Qualcomm SC8180X pass CCI in the notification
message. Use it instead of going back and forth over RPMSG
interface to read CCI.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 90 +++++++++++++++++++++++++++++--------
 1 file changed, 71 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index d029cc9d82e3..40fcda055b05 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -6,6 +6,7 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/pdr.h>
@@ -70,7 +71,7 @@ struct pmic_glink_ucsi {
 
 	int sync_val;
 
-	struct work_struct notify_work;
+	struct work_struct notify_work_sc8180x;
 	struct work_struct register_work;
 
 	u8 read_buf[UCSI_BUF_SIZE];
@@ -223,6 +224,20 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
 	.connector_status = pmic_glink_ucsi_connector_status,
 };
 
+static void pmic_glink_ucsi_notify_handle(struct pmic_glink_ucsi *ucsi, u32 cci)
+{
+	unsigned int con_num;
+
+	con_num = UCSI_CCI_CONNECTOR(cci);
+	if (con_num)
+		ucsi_connector_change(ucsi->ucsi, con_num);
+
+	if (ucsi->sync_pending &&
+		   (cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))) {
+		complete(&ucsi->sync_ack);
+	}
+}
+
 static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, size_t len)
 {
 	const struct ucsi_read_buf_resp_msg *resp;
@@ -259,10 +274,24 @@ static void pmic_glink_ucsi_write_ack(struct pmic_glink_ucsi *ucsi, const void *
 	complete(&ucsi->write_ack);
 }
 
-static void pmic_glink_ucsi_notify(struct work_struct *work)
+/* used everywhere except sc8180x */
+static void pmic_glink_ucsi_notify_ind(struct pmic_glink_ucsi *ucsi, const void *data, size_t len)
 {
-	struct pmic_glink_ucsi *ucsi = container_of(work, struct pmic_glink_ucsi, notify_work);
-	unsigned int con_num;
+	const struct ucsi_notify_ind_msg *msg;
+
+	if (len != sizeof (*msg)) {
+		dev_err_ratelimited(ucsi->dev, "Unexpected notification struct size %zd\n", len);
+		return;
+	}
+
+	msg = data;
+
+	pmic_glink_ucsi_notify_handle(ucsi, le32_to_cpu(msg->notification));
+}
+
+static void pmic_glink_ucsi_notify_work_sc8180x(struct work_struct *work)
+{
+	struct pmic_glink_ucsi *ucsi = container_of(work, struct pmic_glink_ucsi, notify_work_sc8180x);
 	u32 cci;
 	int ret;
 
@@ -272,14 +301,7 @@ static void pmic_glink_ucsi_notify(struct work_struct *work)
 		return;
 	}
 
-	con_num = UCSI_CCI_CONNECTOR(cci);
-	if (con_num)
-		ucsi_connector_change(ucsi->ucsi, con_num);
-
-	if (ucsi->sync_pending &&
-		   (cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))) {
-		complete(&ucsi->sync_ack);
-	}
+	pmic_glink_ucsi_notify_handle(ucsi, cci);
 }
 
 static void pmic_glink_ucsi_register(struct work_struct *work)
@@ -289,6 +311,24 @@ static void pmic_glink_ucsi_register(struct work_struct *work)
 	ucsi_register(ucsi->ucsi);
 }
 
+static void pmic_glink_ucsi_callback_sc8180x(const void *data, size_t len, void *priv)
+{
+	struct pmic_glink_ucsi *ucsi = priv;
+	const struct pmic_glink_hdr *hdr = data;
+
+	switch (le32_to_cpu(hdr->opcode)) {
+	case UC_UCSI_READ_BUF_REQ:
+		pmic_glink_ucsi_read_ack(ucsi, data, len);
+		break;
+	case UC_UCSI_WRITE_BUF_REQ:
+		pmic_glink_ucsi_write_ack(ucsi, data, len);
+		break;
+	case UC_UCSI_USBC_NOTIFY_IND:
+		schedule_work(&ucsi->notify_work_sc8180x);
+		break;
+	};
+}
+
 static void pmic_glink_ucsi_callback(const void *data, size_t len, void *priv)
 {
 	struct pmic_glink_ucsi *ucsi = priv;
@@ -302,7 +342,7 @@ static void pmic_glink_ucsi_callback(const void *data, size_t len, void *priv)
 		pmic_glink_ucsi_write_ack(ucsi, data, len);
 		break;
 	case UC_UCSI_USBC_NOTIFY_IND:
-		schedule_work(&ucsi->notify_work);
+		pmic_glink_ucsi_notify_ind(ucsi, data, len);
 		break;
 	};
 }
@@ -348,6 +388,7 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 	struct device *dev = &adev->dev;
 	const struct of_device_id *match;
 	struct fwnode_handle *fwnode;
+	bool sc8180x_glink;
 	int ret;
 
 	ucsi = devm_kzalloc(dev, sizeof(*ucsi), GFP_KERNEL);
@@ -357,7 +398,7 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 	ucsi->dev = dev;
 	dev_set_drvdata(dev, ucsi);
 
-	INIT_WORK(&ucsi->notify_work, pmic_glink_ucsi_notify);
+	INIT_WORK(&ucsi->notify_work_sc8180x, pmic_glink_ucsi_notify_work_sc8180x);
 	INIT_WORK(&ucsi->register_work, pmic_glink_ucsi_register);
 	init_completion(&ucsi->read_ack);
 	init_completion(&ucsi->write_ack);
@@ -406,11 +447,22 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 		ucsi->port_orientation[port] = desc;
 	}
 
-	ucsi->client = devm_pmic_glink_register_client(dev,
-						       PMIC_GLINK_OWNER_USBC,
-						       pmic_glink_ucsi_callback,
-						       pmic_glink_ucsi_pdr_notify,
-						       ucsi);
+	sc8180x_glink = of_device_is_compatible(dev->parent->of_node,
+						"qcom,sc8180x-pmic-glink");
+
+	if (sc8180x_glink) {
+		ucsi->client = devm_pmic_glink_register_client(dev,
+							       PMIC_GLINK_OWNER_USBC,
+							       pmic_glink_ucsi_callback_sc8180x,
+							       pmic_glink_ucsi_pdr_notify,
+							       ucsi);
+	} else {
+		ucsi->client = devm_pmic_glink_register_client(dev,
+							       PMIC_GLINK_OWNER_USBC,
+							       pmic_glink_ucsi_callback,
+							       pmic_glink_ucsi_pdr_notify,
+							       ucsi);
+	}
 	return PTR_ERR_OR_ZERO(ucsi->client);
 }
 

-- 
2.39.2


