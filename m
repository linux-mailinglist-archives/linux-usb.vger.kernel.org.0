Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D37C44259E4
	for <lists+linux-usb@lfdr.de>; Thu,  7 Oct 2021 19:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243396AbhJGRvt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Oct 2021 13:51:49 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:64730 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243344AbhJGRvm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 Oct 2021 13:51:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633628988; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=tHA60v4N0YKViJuV9g9KY1VqT8BUuS4s4huUyY5Pxgk=; b=E5Y2wgGAaROC6SQqIp/vZFQla8/5qwHMzT0HQ+8c5xDaUd211VjwLhtHRxAj5w3c3PiLxySH
 Q3QNo3C4AnGd7j6ELeEjPyQWtG0UyWWBtFMG6ZmDb1Xdj0EVpz1OU3iaORNhnzKKzgea97OS
 WYZk56KfPnOomhxVUvKhpkfvE+I=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 615f332003355859c8d8837d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 17:49:20
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C3A96C4361B; Thu,  7 Oct 2021 17:49:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pmaliset-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BC9D9C4338F;
        Thu,  7 Oct 2021 17:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BC9D9C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org,
        linux-pci@vger.kernel.org,
        Prasad Malisetty <pmaliset@codeaurora.org>
Subject: [PATCH v12 3/5] arm64: dts: qcom: sc7280: Add PCIe nodes for IDP board
Date:   Thu,  7 Oct 2021 23:18:41 +0530
Message-Id: <1633628923-25047-4-git-send-email-pmaliset@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633628923-25047-1-git-send-email-pmaliset@codeaurora.org>
References: <1633628923-25047-1-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable PCIe controller and PHY for sc7280 IDP board.
Add specific NVMe GPIO entries for SKU1 and SKU2 support.

Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts  |  8 +++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 50 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts |  8 +++++
 3 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 64fc22a..e6b9f57 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -61,6 +61,14 @@
 	modem-init;
 };
 
+&nvme_pwren {
+	pins = "gpio19";
+};
+
+&nvme_3v3_regulator {
+	gpio = <&tlmm 19 GPIO_ACTIVE_HIGH>;
+};
+
 &pmk8350_vadc {
 	pmr735a_die_temp {
 		reg = <PMR735A_ADC7_DIE_TEMP>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 272d5ca..d623d71 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -31,6 +31,18 @@
 			linux,can-disable;
 		};
 	};
+
+	nvme_3v3_regulator: nvme-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VLDO_3V3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&nvme_pwren>;
+	};
 };
 
 /*
@@ -272,6 +284,23 @@
 	modem-init;
 };
 
+&pcie1 {
+	status = "okay";
+	perst-gpio = <&tlmm 2 GPIO_ACTIVE_LOW>;
+
+	vddpe-3v3-supply = <&nvme_3v3_regulator>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
+};
+
+&pcie1_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l10c_0p8>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+};
+
 &pmk8350_vadc {
 	pmk8350_die_temp {
 		reg = <PMK8350_ADC7_DIE_TEMP>;
@@ -462,6 +491,27 @@
 };
 
 &tlmm {
+	nvme_pwren: nvme-pwren {
+		function = "gpio";
+	};
+
+	pcie1_reset_n: pcie1-reset-n {
+		pins = "gpio2";
+		function = "gpio";
+
+		drive-strength = <16>;
+		output-low;
+		bias-disable;
+	};
+
+	pcie1_wake_n: pcie1-wake-n {
+		pins = "gpio3";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	qup_uart7_sleep_cts: qup-uart7-sleep-cts {
 		pins = "gpio28";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
index 1fc2add..3ae9969 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
@@ -21,3 +21,11 @@
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+&nvme_pwren {
+	pins = "gpio51";
+};
+
+&nvme_3v3_regulator {
+	gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

