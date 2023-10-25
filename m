Return-Path: <linux-usb+bounces-2196-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 519097D77F8
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 00:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5DE3B215B5
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 22:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58033381DD;
	Wed, 25 Oct 2023 22:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tSRZEtGr"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07D8381BA
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 22:30:40 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05382AC
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 15:30:39 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c595f5dc84so16198741fa.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 15:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698273037; x=1698877837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMc9DJrhHFukjQ0QSTQddBGYIHrkhtn026KunSVyHrs=;
        b=tSRZEtGrenQs9n8o26Ay9+k5JPQEequyFL+E2G6eCsQzVFOrBOZnDRaMpDvJnyXsyD
         1mmWXW82PFx8oaxBOjcXa+cijIm5PMcpACBU3hcZjG+A5KxND2Z+2Red4R+MYN9Ko1kj
         IPFJn6G3oYaMWpyOt6SRvvY7Ekbo/Eb9GA4r1Q9drOaaCCUkGvEWSw+gILJQPDauMNOk
         d1HtyR/tQZXJpAFvFOtVR3SgolUmpY9h4v+jDgSXa+RNOfFyY73U4LD/aLxQty+Sy2NF
         cizrPyhgQUop0eAWPBlUIpzgu2arPJqyIuVVfWAr2Rg4FR4dtqTP+Pw19WvC/d1UGV4s
         8EJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698273037; x=1698877837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMc9DJrhHFukjQ0QSTQddBGYIHrkhtn026KunSVyHrs=;
        b=LOjByk1nQBWj/TfNn5GV7ufysuK3qjDYJkT31C8v7YMB+y4XY2DfCSbZMIpp6lF+mI
         aCOcZ/uq7j0fSNrWQj8S72lCY1lB8NVIIW5mrkLYLBM0haxI1ba9R//Q09aMIbSV7i2s
         NnPoUKzzeeDmzMKCMkHNZyGaOddVWA5DjQfxvi027tDEuK8/0uJQE8RWkbEZKggRHdvb
         hnc7mEqjFLoqCyEDzR5/51Re/q1DsSTaObFTm7uYPonWcR90g8d8kAPb54SZjsgWKgig
         gW8y2/v1d81UkZm0xEBvRcXAbKQ4P5LQ+A5jUyNCp2hxt9csBEMtr7+en+r3aEhFYMfD
         rZQQ==
X-Gm-Message-State: AOJu0YwtZqFLUXw5mldwhoJ6qnrfGsWm3u4q6JO8nUdTVnJGU29Mup9L
	xzMN3fUFg47tR6eWlibpHWSQ1A==
X-Google-Smtp-Source: AGHT+IG0q4O9zZGFVgid9pyyJD2trDydpM4NoY89vGAulK1c/jtaw7eVVV4MrxSewpkgrRJTzf3/oA==
X-Received: by 2002:a2e:894d:0:b0:2c5:a41:2250 with SMTP id b13-20020a2e894d000000b002c50a412250mr286617ljk.19.1698273037373;
        Wed, 25 Oct 2023 15:30:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a36-20020a05651c212400b002bcbae4c21fsm2612543ljq.50.2023.10.25.15.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 15:30:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v5 6/6] usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
Date: Thu, 26 Oct 2023 01:28:07 +0300
Message-ID: <20231025223027.943563-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025223027.943563-1-dmitry.baryshkov@linaro.org>
References: <20231025223027.943563-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
same functionality for the DRM bridge chain termination.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/Kconfig                |  1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 41 +++----------------
 2 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index 0b2993fef564..64d5421c69e6 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -80,6 +80,7 @@ config TYPEC_QCOM_PMIC
 	tristate "Qualcomm PMIC USB Type-C Port Controller Manager driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on DRM || DRM=n
+	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE
 	help
 	  A Type-C port and Power Delivery driver which aggregates two
 	  discrete pieces of silicon in the PM8150b PMIC block: the
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index 581199d37b49..1a2b4bddaa97 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -18,7 +18,7 @@
 #include <linux/usb/tcpm.h>
 #include <linux/usb/typec_mux.h>
 
-#include <drm/drm_bridge.h>
+#include <drm/bridge/aux-bridge.h>
 
 #include "qcom_pmic_typec_pdphy.h"
 #include "qcom_pmic_typec_port.h"
@@ -36,7 +36,6 @@ struct pmic_typec {
 	struct pmic_typec_port	*pmic_typec_port;
 	bool			vbus_enabled;
 	struct mutex		lock;		/* VBUS state serialization */
-	struct drm_bridge	bridge;
 };
 
 #define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_typec, tcpc)
@@ -150,35 +149,6 @@ static int qcom_pmic_typec_init(struct tcpc_dev *tcpc)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_DRM)
-static int qcom_pmic_typec_attach(struct drm_bridge *bridge,
-				     enum drm_bridge_attach_flags flags)
-{
-	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
-}
-
-static const struct drm_bridge_funcs qcom_pmic_typec_bridge_funcs = {
-	.attach = qcom_pmic_typec_attach,
-};
-
-static int qcom_pmic_typec_init_drm(struct pmic_typec *tcpm)
-{
-	tcpm->bridge.funcs = &qcom_pmic_typec_bridge_funcs;
-#ifdef CONFIG_OF
-	tcpm->bridge.of_node = of_get_child_by_name(tcpm->dev->of_node, "connector");
-#endif
-	tcpm->bridge.ops = DRM_BRIDGE_OP_HPD;
-	tcpm->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
-
-	return devm_drm_bridge_add(tcpm->dev, &tcpm->bridge);
-}
-#else
-static int qcom_pmic_typec_init_drm(struct pmic_typec *tcpm)
-{
-	return 0;
-}
-#endif
-
 static int qcom_pmic_typec_probe(struct platform_device *pdev)
 {
 	struct pmic_typec *tcpm;
@@ -186,6 +156,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	const struct pmic_typec_resources *res;
 	struct regmap *regmap;
+	struct device *bridge_dev;
 	u32 base[2];
 	int ret;
 
@@ -241,14 +212,14 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	mutex_init(&tcpm->lock);
 	platform_set_drvdata(pdev, tcpm);
 
-	ret = qcom_pmic_typec_init_drm(tcpm);
-	if (ret)
-		return ret;
-
 	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
 	if (!tcpm->tcpc.fwnode)
 		return -EINVAL;
 
+	bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
+	if (IS_ERR(bridge_dev))
+		return PTR_ERR(bridge_dev);
+
 	tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
 	if (IS_ERR(tcpm->tcpm_port)) {
 		ret = PTR_ERR(tcpm->tcpm_port);
-- 
2.42.0


