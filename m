Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B42E9B9008
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 14:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfITMxy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 08:53:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:51886 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbfITMxy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 08:53:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7801F614DB; Fri, 20 Sep 2019 12:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568984033;
        bh=QJDi084q4Z9/j3kRWpaGrApRjQec/H7sFgprw6V0yzQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I+nWzlY3bh3pA4M2vYQ9QloH55rfj9utPQvpzFElcjCT0clWGBjThUfpgXPvJgqTm
         HRHw2wqVaVVCZ3MnJCbYiyF2RGrK5yX0HFhlCTA2eSwSHoZCxwqpFBG6WabUFgTvfh
         ube2Wso8jZlQZusWcnxEioOtdAlkbMcGaqiOszzA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from cchiluve-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cchiluve@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DA6356155E;
        Fri, 20 Sep 2019 12:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568984032;
        bh=QJDi084q4Z9/j3kRWpaGrApRjQec/H7sFgprw6V0yzQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U8BdBeYapbtF4tXnC24/Ydzj4NA1dCjWhAcvD1xCiUMbUbI/ZfO0SvFFFp//TDC3N
         C+Qh5/29023q+ruEoOa8ojVENGH9t5SUNAwGX+jNboy5qbpi3Nm8JbB/VkhKvxBtz+
         qIqvytqaNl/U96/NgaZJ0ta+ASedGhIabGiZXzZ0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DA6356155E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=cchiluve@codeaurora.org
From:   cchiluve <cchiluve@codeaurora.org>
To:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org
Cc:     linux-usb@vger.kernel.org,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: [PATCH V4 3/3] arm64: dts: sdm845: Add interconnect properties for USB
Date:   Fri, 20 Sep 2019 18:23:17 +0530
Message-Id: <1568983997-20004-4-git-send-email-cchiluve@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1568983997-20004-1-git-send-email-cchiluve@codeaurora.org>
References: <1568983997-20004-1-git-send-email-cchiluve@codeaurora.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>

Populate USB DT nodes with interconnect properties.

Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index fcb9330..e4885f3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1837,6 +1837,12 @@
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
+			interconnects = <&rsc_hlos MASTER_USB3_0
+					 &rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC
+					 &rsc_hlos SLAVE_USB3_0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_1_dwc3: dwc3@a600000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a600000 0 0xcd00>;
@@ -1881,6 +1887,12 @@
 
 			resets = <&gcc GCC_USB30_SEC_BCR>;
 
+			interconnects = <&rsc_hlos MASTER_USB3_1
+					 &rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC
+					 &rsc_hlos SLAVE_USB3_1>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_2_dwc3: dwc3@a800000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a800000 0 0xcd00>;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

