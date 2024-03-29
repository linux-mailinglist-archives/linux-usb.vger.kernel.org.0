Return-Path: <linux-usb+bounces-8643-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AC48913BD
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 07:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C771D1F2303C
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 06:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C566C44C7A;
	Fri, 29 Mar 2024 06:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uMlhrKx1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A218482E5
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 06:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692951; cv=none; b=CdfY9OKjwhbHn5Q9kfc9AMt43s6hIF4iuuCKOHtaWJ4vODFmdB4QvpwpFTZxHSlD4lXqTzJP0SPurljjUFqCAANY7WbLiRT5LWPhU56RkAiSK2Kjc/rMwNWSYncIfYOtquUwwbvlhMUmoHJq9tmIr1G/weLj9G/ozKPERxrjo5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692951; c=relaxed/simple;
	bh=YD/wggfHpA60Ni/iCzWPJjqKvxw25S4GmQbPPpQ7gio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X37DJeLVPawty9jBrvpDxqHLMwbzXd7EOl8JsT9CgcOEH4eQvpapzHk4EIGG1v7OeZUaqCJv/ItxLkRVUS/icwOmnPl7gYHsf9agCuedar2MlryjZVdKFxx0bVkjIV8m7H7w5TDFaYL8XUAFZwg/tgyzj7i4XxW05bIY9a66jKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uMlhrKx1; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-515a81928a1so2654072e87.3
        for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 23:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692947; x=1712297747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AquvWTI2GaVy0mYZa1ujIRfyg1V3AJj3Raax6DJtlpQ=;
        b=uMlhrKx1e7wprPkZZDH3cf5fZ91Wkk/xrerLPdEbNhiu4Wl5vQ/9avq6Uq+gXzouDk
         zEKhgJYXbiwAHuTZgYhMsDaNalh8MV3O1FY1nD48Q59EJRVx+ioG7GWf+kuWrjWudAtn
         0EkUwua4R5QgAgV2b9BVcs/1XdWnYMRQuYw6t+kfXmb5Bqz8T5mRBBRF+Ufykrj7N0uh
         ZFklElI17sgWkUfMQKA4UGALBoDS6fqBifaHLGH9sgONdopczwAMPotEzCOEsXQ3lmMj
         MI71MQuSwbjsH73dTLhP7az5l0BFAK/RYiZ2Erg3XB+VmiOdGCnn3MmX5uwMH0w+PyqQ
         SGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692947; x=1712297747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AquvWTI2GaVy0mYZa1ujIRfyg1V3AJj3Raax6DJtlpQ=;
        b=u5uu85hlhd7ZEqtB69yrxihYZIXkKtETsAMfIXny02ZycJYHbSP/1t/T2JPd580xhf
         XpXf98vcHBsqgMFSnIl3l4aspg475nsHUa2NPKFz4x9GcLjD1RCThRQ6FLq0qOwbuRtE
         O1plvdx/bL10n7eDlPAXxrW6Z3YwZu1WiQt3SRBNql4UnrkKDymZPRh1fw2JKlif+ZML
         Q1/UfKa081jegsT4ZTpN6yx5CfgZhZTveBeY+wq7Foxi49ThaPe0t8JOAaU3nU3V1ke/
         MhaZmqLyERY0wJ0oU6aD2ST83p4qTMMyUi5ZSwPQpgD5HdnOoAvmIBOmLkiZFN4Z/H2C
         EkVA==
X-Forwarded-Encrypted: i=1; AJvYcCUWhL59zYXqv3/dAIwc9jUOZOGuz0WfhtuR/b8E4u1Iwaa6gwnj3bS1anFF2y5nXJoJUrVd2oEA4h1x9cWGxxijIkoNE0/dPxsO
X-Gm-Message-State: AOJu0Yzd1U1wFVYgC5xkKfqP90Bdkk3m8f6BL5yX4F2oPOaTUb2q3C0B
	RXcVt3iNQ+vubzEC8jiZfdIY7SB3tgx3DeW5EeAgC79rQdLIBqUy3LsDUvMDnSg=
X-Google-Smtp-Source: AGHT+IHPyLucbnjVjjDJhkt02Gb92ctRYO/oltddM+q7aiXklJVRDPj1a+N7m6UnSHSJEg/7wdp/1A==
X-Received: by 2002:a05:651c:2ca:b0:2d7:b:da33 with SMTP id f10-20020a05651c02ca00b002d7000bda33mr829794ljo.4.1711692947298;
        Thu, 28 Mar 2024 23:15:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 08:15:39 +0200
Subject: [PATCH v2 07/11] usb: typec: ucsi: support delaying GET_PDOS for
 device
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-qcom-ucsi-fixes-v2-7-0f5d37ed04db@linaro.org>
References: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
In-Reply-To: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3874;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YD/wggfHpA60Ni/iCzWPJjqKvxw25S4GmQbPPpQ7gio=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxpbTI/Rv2+6Cfe6pd+nHo2SP8h6/gmLzV47n+WrDO/OS
 jlRtLa/k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATud7E/pvV519E2XXrSeod
 cy3itrYZJhY3zZXu4bXl21/Ev9HomJV/p2Er858/ij91eOKK8gK+hc8RjW++ovtVhmv6788Jbre
 qdmrzT2Vi+T07Ijg//1+tRNdS73/RHRMfXPqny8c+x/y7XdwP1V87XYUkNC3ZnD73WlQyXhF6EB
 lZmrT7aOKdiFcbjX8xvPb4npvMFBcxyypJpfqP/rHDbClmG3TSl1/z4NAx2FUsvcbBrd0rtvRkf
 /26S6fPMweLGYf73K+WurfDy/EAy7TL32WWWk422hnpFZx+bH1cx+r9c6tdpTw2eETnXj5lkXR2
 qeFmVg3O206lqqfOiq7smvtIL1Re7uAKMW0rpZg5k5QB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Qualcomm firmware doesn't return sane information for device's PDOs
unless the partner is also using a PD mode. On SC8280XP this even
results in the Error bit being set in the UCSI response (with 0 error
status).

Add a quirk to delay reading USB PD capabilities for a device until we
detect a partner in PD mode.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 41 ++++++++++++++++++++++++++++-------------
 drivers/usb/typec/ucsi/ucsi.h |  1 +
 2 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 18b2e4ffc57e..f5ec776b84d6 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -821,6 +821,28 @@ static int ucsi_check_altmodes(struct ucsi_connector *con)
 	return ret;
 }
 
+static void ucsi_register_device_pdos(struct ucsi_connector *con)
+{
+	struct ucsi *ucsi = con->ucsi;
+	struct usb_power_delivery_desc desc = { ucsi->cap.pd_version };
+	struct usb_power_delivery_capabilities *pd_cap;
+
+	if (con->pd)
+		return;
+
+	con->pd = usb_power_delivery_register(ucsi->dev, &desc);
+
+	pd_cap = ucsi_get_pd_caps(con, TYPEC_SOURCE, false);
+	if (!IS_ERR(pd_cap))
+		con->port_source_caps = pd_cap;
+
+	pd_cap = ucsi_get_pd_caps(con, TYPEC_SINK, false);
+	if (!IS_ERR(pd_cap))
+		con->port_sink_caps = pd_cap;
+
+	typec_port_set_usb_power_delivery(con->port, con->pd);
+}
+
 static int ucsi_register_partner_pdos(struct ucsi_connector *con)
 {
 	struct usb_power_delivery_desc desc = { con->ucsi->cap.pd_version };
@@ -981,6 +1003,9 @@ static int ucsi_register_partner(struct ucsi_connector *con)
 		break;
 	}
 
+	if (pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD)
+		ucsi_register_device_pdos(con);
+
 	desc.identity = &con->partner_identity;
 	desc.usb_pd = pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD;
 	desc.pd_revision = UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->cap.flags);
@@ -1465,8 +1490,6 @@ static struct fwnode_handle *ucsi_find_fwnode(struct ucsi_connector *con)
 
 static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 {
-	struct usb_power_delivery_desc desc = { ucsi->cap.pd_version};
-	struct usb_power_delivery_capabilities *pd_cap;
 	struct typec_capability *cap = &con->typec_cap;
 	enum typec_accessory *accessory = cap->accessory;
 	enum usb_role u_role = USB_ROLE_NONE;
@@ -1544,17 +1567,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 		goto out;
 	}
 
-	con->pd = usb_power_delivery_register(ucsi->dev, &desc);
-
-	pd_cap = ucsi_get_pd_caps(con, TYPEC_SOURCE, false);
-	if (!IS_ERR(pd_cap))
-		con->port_source_caps = pd_cap;
-
-	pd_cap = ucsi_get_pd_caps(con, TYPEC_SINK, false);
-	if (!IS_ERR(pd_cap))
-		con->port_sink_caps = pd_cap;
-
-	typec_port_set_usb_power_delivery(con->port, con->pd);
+	if (!(ucsi->quirks & UCSI_DELAY_DEVICE_PDOS))
+		ucsi_register_device_pdos(con);
 
 	/* Alternate modes */
 	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_CON);
@@ -1617,6 +1631,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	if (con->partner &&
 	    UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
 	    UCSI_CONSTAT_PWR_OPMODE_PD) {
+		ucsi_register_device_pdos(con);
 		ucsi_get_src_pdos(con);
 		ucsi_check_altmodes(con);
 	}
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 591f734d457b..2caf2969668c 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -406,6 +406,7 @@ struct ucsi {
 
 	unsigned long quirks;
 #define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
+#define UCSI_DELAY_DEVICE_PDOS	BIT(1)	/* Reading PDOs fails until the parter is in PD mode */
 };
 
 #define UCSI_MAX_SVID		5

-- 
2.39.2


