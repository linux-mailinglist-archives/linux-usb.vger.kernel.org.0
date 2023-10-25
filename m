Return-Path: <linux-usb+bounces-2170-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F637D6A84
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 13:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 561DC281C72
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 11:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9C627731;
	Wed, 25 Oct 2023 11:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jcjJUlh5"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB012770C
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 11:56:25 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E702181
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 04:56:24 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50802148be9so3083005e87.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698234982; x=1698839782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgafwTCUkzd/7BTG9BN3pSpU4yRcAwFDImAKova/XoA=;
        b=jcjJUlh5ZzvkM1V6/GDDWV2U3VGj/czgiX4G7LIW0YezENPjGEKC4oZD1e2jaYS6pc
         pTIrW4KvBunkGPEcYXlW1Na06H2YZX0JloBhfPtyk/mxyGyMFM14Tf3WSiewyhox736p
         3C6Feqwkqj8KeCelfy9ce3kgx8Gf5CDEYkUq04ldcndJMPHtjnirc29drtlVosAN1b6B
         PvELXPmBFJeAdibQPo3itf2Q26Mc5/qyV/GdNqF2/4l+idHD7Jvpj5B6ZbmpYzblP2pO
         Uszi1hhlYC5R3DHUzMMBWq24IwkjCkYVVyOew2wIO/H10PxGE02L8tC7CBw301HVskuF
         3zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698234982; x=1698839782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgafwTCUkzd/7BTG9BN3pSpU4yRcAwFDImAKova/XoA=;
        b=GxQU021+9Ae5vtmqXBpQ9Xo86o6vLt8TMi4Dyz9VqQr5yMTn7H7Stq7FQ9mPQvuuHl
         k10cMgTul5rXobfuIbF2V5iWy9Vc9/m4jNGbJfOF53lR0K1BHSZYoZPuD6ziUIWLSZRl
         qhvX+bJIi0lOUgfw3FWs14+mVytsETsRV4JP5QFYk9F8V+u2LYEszVApJsKvmqFKCCA0
         CV4B4LGVqP0IPo0PipmrsaEa8CSpevDnnpxwNfJKYoZPbbr2Hk/yQevHmmAMHZ7mEucS
         SLDL3gOLwWqFfGKVyNUTpPY4hxxk+0UtZ+nLUHyn52XB7y/Cu3E2ETVAb2RS5hRNDJ74
         Lhug==
X-Gm-Message-State: AOJu0YxOmUiLPvP2rPmC+sK4AXzVx0Cosm3ldglrhXG1j+sQs52+flDI
	VssJ3OI25Nhgsa3hutKJWyC3QWaTzLyfKkSI5h8=
X-Google-Smtp-Source: AGHT+IHEIBCnx7OnsCe5XYKl5N63Ra0I89CUF8iLcsMYFynDWvY4bHIMX8F4T9v8aDlCUP1hxBLdww==
X-Received: by 2002:a05:6512:3c8f:b0:507:cd39:a005 with SMTP id h15-20020a0565123c8f00b00507cd39a005mr13071713lfv.39.1698234982595;
        Wed, 25 Oct 2023 04:56:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 22-20020ac25f56000000b004fde41a2059sm2511751lfz.305.2023.10.25.04.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:56:22 -0700 (PDT)
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
Subject: [PATCH v2 1/2] usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
Date: Wed, 25 Oct 2023 14:49:29 +0300
Message-ID: <20231025115620.905538-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
References: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
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
 drivers/usb/typec/ucsi/ucsi.c       |  3 +++
 drivers/usb/typec/ucsi/ucsi.h       |  3 +++
 drivers/usb/typec/ucsi/ucsi_glink.c | 13 +++++++++++++
 3 files changed, 19 insertions(+)

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
index db6e248f8208..a94e2df6fd45 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -6,6 +6,7 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of_device.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/pdr.h>
 #include <linux/usb/typec_mux.h>
@@ -296,11 +297,19 @@ static void pmic_glink_ucsi_destroy(void *data)
 	mutex_unlock(&ucsi->lock);
 }
 
+static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
+	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
+	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
+	{ .compatible = "qcom,sm8350-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
+	{}
+};
+
 static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 				 const struct auxiliary_device_id *id)
 {
 	struct pmic_glink_ucsi *ucsi;
 	struct device *dev = &adev->dev;
+	const struct of_device_id *match;
 	struct fwnode_handle *fwnode;
 	int ret;
 
@@ -327,6 +336,10 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 	if (ret)
 		return ret;
 
+	match = of_match_device(pmic_glink_ucsi_of_quirks, dev->parent);
+	if (match)
+		ucsi->ucsi->quirks = (unsigned long)match->data;
+
 	ucsi_set_drvdata(ucsi->ucsi, ucsi);
 
 	device_for_each_child_node(dev, fwnode) {
-- 
2.42.0


