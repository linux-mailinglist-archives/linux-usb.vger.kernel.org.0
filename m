Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D59B420B8D5
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jun 2020 20:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgFZS4G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jun 2020 14:56:06 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:45294 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725992AbgFZSzl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Jun 2020 14:55:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593197740; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ulss9HHbM4ZJcwJ3mp+I9k0MAc5jrVWcm1JkPzBgFEg=; b=CfYXRop1r2MQ6ydG7mLKld+F6Pi2HVd007TIKzfMGkWvqRzzo2S6lYwz5TwSRQhPBBJDigex
 BDnI/9IG6KsPqTapGxkhlxn89VZMWro3QJf0YnEYRk8vc2i2alIeApPAMNN8F2RvDvm2pNBG
 6UxdBc/p0d/dAXLiK1Y2sNo9lnk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5ef6449f8fe116ddd9a0779d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Jun 2020 18:55:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D56DBC4339C; Fri, 26 Jun 2020 18:55:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 76FCBC433C8;
        Fri, 26 Jun 2020 18:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 76FCBC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     heikki.krogerus@linux.intel.com, agross@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        gregkh@linuxfoundation.org, broonie@kernel.org,
        lgirdwood@gmail.com, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, rdunlap@infradead.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v4 6/6] arm64: boot: dts: qcom: pm8150b: Add DTS node for PMIC VBUS booster
Date:   Fri, 26 Jun 2020 11:55:16 -0700
Message-Id: <20200626185516.18018-7-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626185516.18018-1-wcheng@codeaurora.org>
References: <20200626185516.18018-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the required DTS node for the USB VBUS output regulator, which is
available on PM8150B.  This will provide the VBUS source to connected
peripherals.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi   | 6 ++++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index 91b870345dda..18f64bca73bc 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -22,6 +22,12 @@ power-on@800 {
 			status = "disabled";
 		};
 
+		 pm8150b_vbus: dcdc@1100 {
+			compatible = "qcom,pm8150b-vbus-reg";
+			status = "disabled";
+			reg = <0x1100>;
+		};
+
 		pm8150b_typec: typec@1500 {
 			compatible = "qcom,pm8150b-usb-typec";
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index 6c6325c3af59..ba3b5b802954 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -409,6 +409,10 @@ &ufs_mem_phy {
 	vdda-pll-max-microamp = <19000>;
 };
 
+&pm8150b_vbus {
+	status = "okay";
+};
+
 &usb_1_hsphy {
 	status = "okay";
 	vdda-pll-supply = <&vdd_usb_hs_core>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

