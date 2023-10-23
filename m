Return-Path: <linux-usb+bounces-2091-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 705307D41F8
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 23:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1A1B1C20AF7
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 21:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C11623760;
	Mon, 23 Oct 2023 21:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VRwZkeLW"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9C422F14
	for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 21:53:35 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5326810E
	for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 14:53:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507bd644a96so5610010e87.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 14:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698098011; x=1698702811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHQPeaj7JIAfkzHBWsKTDrZ2sXAmH8LlIRsWgPLYV7o=;
        b=VRwZkeLWsvqX3frtuvkBwABVgvqh709qbY715/2IsGqsqwPyloQEPJU9gbbiD1oJJq
         jK83e3F6Z6ch2qrwM4ADX6yULRB2Z4FWceCn0bBqtTHkkFerc0r+ihVBYPYpizdGMt+O
         t/kCt5hpazudSnuQxMddebBhvIslzLwbkjem1cH8U4WDp3S0dAjOY4ktWYNtPO4EqN7q
         zJSLlfzIChrmENyrXozqxwGHpE+Iz3R5fgOOtxiern3vuRQOr+6zfJKNG8RJbO58NQt5
         rEpBPnp1upTNwQ1XOfMwiSgAD9qSuqC6q2FXBEFzErbliaKbd2aU6lre2gfAl3yuOC7l
         l5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698098011; x=1698702811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHQPeaj7JIAfkzHBWsKTDrZ2sXAmH8LlIRsWgPLYV7o=;
        b=SEm0OQ5q+/Y5H/fnl6HRT9uEgby9XvUjiP98/5yKLRD1HSUxnYL8wj+TCOUuW0wMsK
         sGqdthw9qE4QkgcxvEm91WonANLqWduQPHvjHRGbgveHy/W+uVJ1oFmyvWYImDdv1+OX
         SJYEPq0fDVefgC5D5E8QyoAsRIRTR/Q2ZLKzgOGy2l4jAmcynG9EUZjVe5pXTLIeVuqx
         onpGzvjuNM/vMIjQkgNpEnI8SMbMVZMRCWmGnxP44U+1n6Q1yhvmP+ZutLM18S1+LILu
         pSX41U4qFDQzKMpwoFAnvLFDMJ+0QDqImGhhqio3y/hbQKkhoDGyQoc1ojAWvylG3WoH
         L3iQ==
X-Gm-Message-State: AOJu0YzYpNc7wcOpdiehHRqmiPIBJd8AVBjST9wNCJ2K/7DcBSskbeWD
	HUFg/ecyBT6awVol9botfabL5A==
X-Google-Smtp-Source: AGHT+IFQ5E49cCJA+S2lWIbu4D1qLDRU4CqhR8pa1g7kImjWJq9iQJPwHDToo56TnuxKFO2A5jEUXw==
X-Received: by 2002:ac2:490c:0:b0:501:bd6f:7c1e with SMTP id n12-20020ac2490c000000b00501bd6f7c1emr7095971lfi.33.1698098011108;
        Mon, 23 Oct 2023 14:53:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (85-76-147-63-nat.elisa-mobile.fi. [85.76.147.63])
        by smtp.gmail.com with ESMTPSA id g3-20020a056512118300b005079dac9620sm1845143lfr.43.2023.10.23.14.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:53:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
Date: Tue, 24 Oct 2023 00:47:26 +0300
Message-ID: <20231023215327.695720-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231023215327.695720-1-dmitry.baryshkov@linaro.org>
References: <20231023215327.695720-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On sevral Qualcomm platforms (SC8180X, SM8350, SC8280XP) a call to
UCSI_GET_PDOS for non-PD partners will cause a firmware crash with no
easy way to recover from it. Since we have no easy way to determine
whether the partner really has PD support, shortcut UCSI_GET_PDOS on
such platforms. This allows us to enable UCSI support on such devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c       | 3 +++
 drivers/usb/typec/ucsi/ucsi.h       | 3 +++
 drivers/usb/typec/ucsi/ucsi_glink.c | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 61b64558f96c..5392ec698959 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -578,6 +578,9 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
 	u64 command;
 	int ret;
 
+	if (ucsi->quirks & UCSI_NO_PARTNER_PDOS)
+		return 0;
+
 	command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);
 	command |= UCSI_GET_PDOS_PARTNER_PDO(is_partner);
 	command |= UCSI_GET_PDOS_PDO_OFFSET(offset);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 474315a72c77..6478016d5cb8 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -317,6 +317,9 @@ struct ucsi {
 #define EVENT_PENDING	0
 #define COMMAND_PENDING	1
 #define ACK_PENDING	2
+
+	unsigned long quirks;
+#define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
 };
 
 #define UCSI_MAX_SVID		5
diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index db6e248f8208..5c159e7b2b65 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -327,6 +327,8 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 	if (ret)
 		return ret;
 
+	ucsi->ucsi->quirks = id->driver_data;
+
 	ucsi_set_drvdata(ucsi->ucsi, ucsi);
 
 	device_for_each_child_node(dev, fwnode) {
@@ -379,6 +381,7 @@ static void pmic_glink_ucsi_remove(struct auxiliary_device *adev)
 
 static const struct auxiliary_device_id pmic_glink_ucsi_id_table[] = {
 	{ .name = "pmic_glink.ucsi", },
+	{ .name = "pmic_glink.ucsi-no-pdos", .driver_data = UCSI_NO_PARTNER_PDOS, },
 	{},
 };
 MODULE_DEVICE_TABLE(auxiliary, pmic_glink_ucsi_id_table);
-- 
2.42.0


