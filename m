Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E36AA659075
	for <lists+linux-usb@lfdr.de>; Thu, 29 Dec 2022 19:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbiL2Seo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Dec 2022 13:34:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234024AbiL2SeR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Dec 2022 13:34:17 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078661054D
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 10:34:16 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id gh17so46880885ejb.6
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 10:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOwNzTdUKlF0YVErH+m4Hrlu8Y/CqgzRzrTuhq10EAc=;
        b=RpPdq2z8ewpQAJ+Pq0zFsE+golr0XOyCeAmQ8xF4SnuhD4fy8ggns0HkMbA9lvQlAp
         aVnP0Dxbo/eGyNh2LUIz/M06a2X1mMCyh9d/nKEIqcueDwVj1n/ADSztLB6cGDJcEtBr
         yeaC241RtYWYMMM2RuU3I0ONfM54CJEgGfnrvMXDiScWPqMn36xAXArGcG4uOFJO77nX
         zJQTj/7gPqJ+P7c++wPIcLhUk2wojbzpnIEn/Ijy4FW4RMuTMc9TxmSE+x3cP2zZ4OzF
         qlIkuB+/1eHikr40668fcd4xOaSd9shwA6grac+jhojdIWVB2HkgGCcn5xJSyUzLcOC9
         4mzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOwNzTdUKlF0YVErH+m4Hrlu8Y/CqgzRzrTuhq10EAc=;
        b=u1b9v2yqtJj6sX1EYPb2xgWP5KcNDg9/KrO/DLIlBl4wx+iO3zpAbS2xj8B8DSmx76
         rQDMDIcmUXAiFdmJuH/C4n8HQnUipTV2Padw/SrurYWDthBRqujR5oGHkq4NMf8FH5by
         X90Y5crmAezdsFMZHSlPdwikWmoAHelpvAV8fWOKngYOhY8jRdPvY8HTz3eYJrUI9PD8
         2Np6uqJCqcXko3zDtjV0auNRrOln6bnzKIteTiQjdapEGg64ruesMEKXMHGdFzTqiK4U
         Dnf5qOKp1p4e452TXqsBvSW/3bq15126SSjNeSe62vtv9qsLChYtPCq6ts/5KdH5PyBw
         u24g==
X-Gm-Message-State: AFqh2krtLMjEhYe4q9o1Xzo353ounZR7AmAFA00NnHKjGbUGH/Sls/hJ
        4nl4j8mJFZS/Nx1ltxQj4Of2wA==
X-Google-Smtp-Source: AMrXdXvVMq4b7/E7hSZxnG5HN5oB/9/neiMONpxkkMMUQmt2TjO7i8r2qUhnlCxDRnksiZpVIL3ulg==
X-Received: by 2002:a17:907:c70c:b0:81e:9027:dedc with SMTP id ty12-20020a170907c70c00b0081e9027dedcmr25356911ejc.39.1672338854528;
        Thu, 29 Dec 2022 10:34:14 -0800 (PST)
Received: from planet9.chello.ie (2001-1c06-2302-5600-12a8-8cf4-e3f6-f90f.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:12a8:8cf4:e3f6:f90f])
        by smtp.gmail.com with ESMTPSA id g22-20020a1709064e5600b007c0688a68cbsm9013936ejw.176.2022.12.29.10.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 10:34:14 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v2 2/2] phy: qcom-usb-hs: Add qcom,dp-manual-pullup logic
Date:   Thu, 29 Dec 2022 18:34:10 +0000
Message-Id: <20221229183410.683584-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229183410.683584-1-bryan.odonoghue@linaro.org>
References: <20221229183410.683584-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Downstream has a flag called qcom,dp-manual-pullup which informs the
downstream driver if it should toggle ULPI_MISC_A_VBUSVLDEXTSEL and
ULPI_MISC_A_VBUSVLDEXT.

Downstream states:

"qcom,dp-manual-pullup: If present, vbus is not routed to USB
        controller/phy and controller driver therefore enables pull-up
        explicitly before starting controller using usbcmd run/stop bit."

Working with a system that has both an external Type-C port controller and
an internal USB Hub results in a situation where VBUS is not connected to
the SoC.

In this case we still need to set the DP pullup.

This patch enables and disables the DP pullup on PHY power_on and power_off
respectively if the DT has declared the bool "qcom,enable-vbus-pullup"
effectively replicating the downstream logic to the same effect.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-usb-hs.c | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs.c b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
index 53e46c220a3aa..45c94f6722c66 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hs.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
@@ -37,6 +37,7 @@ struct qcom_usb_hs_phy {
 	struct ulpi_seq *init_seq;
 	struct extcon_dev *vbus_edev;
 	struct notifier_block vbus_notify;
+	u8 enable_dp_pullup:1;
 };
 
 static int qcom_usb_hs_phy_set_mode(struct phy *phy,
@@ -105,6 +106,23 @@ qcom_usb_hs_phy_vbus_notifier(struct notifier_block *nb, unsigned long event,
 	return ulpi_write(uphy->ulpi, addr, ULPI_MISC_A_VBUSVLDEXT);
 }
 
+static int qcom_usb_hs_phy_enable_dp_pullup(struct ulpi *ulpi, bool enable)
+{
+	u8 addr;
+	int ret;
+
+	if (enable)
+		addr = ULPI_SET(ULPI_MISC_A);
+	else
+		addr = ULPI_CLR(ULPI_MISC_A);
+
+	ret = ulpi_write(ulpi, addr, ULPI_MISC_A_VBUSVLDEXTSEL);
+	if (ret)
+		return ret;
+
+	return ulpi_write(ulpi, addr, ULPI_MISC_A_VBUSVLDEXT);
+}
+
 static int qcom_usb_hs_phy_power_on(struct phy *phy)
 {
 	struct qcom_usb_hs_phy *uphy = phy_get_drvdata(phy);
@@ -154,6 +172,12 @@ static int qcom_usb_hs_phy_power_on(struct phy *phy)
 			goto err_ulpi;
 	}
 
+	if (uphy->enable_dp_pullup) {
+		ret = qcom_usb_hs_phy_enable_dp_pullup(ulpi, true);
+		if (ret)
+			goto err_ulpi;
+	}
+
 	if (uphy->vbus_edev) {
 		state = extcon_get_state(uphy->vbus_edev, EXTCON_USB);
 		/* setup initial state */
@@ -180,10 +204,19 @@ static int qcom_usb_hs_phy_power_on(struct phy *phy)
 static int qcom_usb_hs_phy_power_off(struct phy *phy)
 {
 	struct qcom_usb_hs_phy *uphy = phy_get_drvdata(phy);
+	struct ulpi *ulpi = uphy->ulpi;
+	int ret;
 
 	if (uphy->vbus_edev)
 		extcon_unregister_notifier(uphy->vbus_edev, EXTCON_USB,
 					   &uphy->vbus_notify);
+
+	if (uphy->enable_dp_pullup) {
+		ret = qcom_usb_hs_phy_enable_dp_pullup(ulpi, false);
+		if (ret)
+			return ret;
+	}
+
 	regulator_disable(uphy->v3p3);
 	regulator_disable(uphy->v1p8);
 	clk_disable_unprepare(uphy->sleep_clk);
@@ -229,6 +262,9 @@ static int qcom_usb_hs_phy_probe(struct ulpi *ulpi)
 	/* NUL terminate */
 	uphy->init_seq[size / 2].addr = uphy->init_seq[size / 2].val = 0;
 
+	if (of_property_read_bool(ulpi->dev.of_node, "qcom,dp-manual-pullup"))
+		uphy->enable_dp_pullup = 1;
+
 	uphy->ref_clk = clk = devm_clk_get(&ulpi->dev, "ref");
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
-- 
2.34.1

