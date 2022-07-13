Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26CB4573738
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 15:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236331AbiGMNSJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 09:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236257AbiGMNSC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 09:18:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FF0219A;
        Wed, 13 Jul 2022 06:18:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F2077B81F4A;
        Wed, 13 Jul 2022 13:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9188AC385A9;
        Wed, 13 Jul 2022 13:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657718277;
        bh=v2rWwBR0NCKPMGfpi9exx5JseAaw+qcoUF0daZnzPGY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tOSwwI6kvtQiLm/8VEcsLYKGjIQXWthamXQaSyVmOptXDI6gNujo3rjAQ+YiYBCPG
         /zARuEkrEFN5J4aEVYR2eur9ro7+EeATQvb9Cgd35cH8XYDvKxs+t0ZTX4HjybEFpF
         yQn68HjEunONOQhtcPyZAtBU93CK997mVaSzvqyywCyV7S99T+0Zztv0u+GvEnf0Gz
         D1zZqOw0XyuRlw/CZ3LtXXWV3fz6cUX7vX4asP9LoyppA+fH9fIdqzp/VjkVeSzT9e
         kz3hX4h6yG/D++eWdM/x+EDc/l+BoidOkQ6xZE9fsS/U06hNHFrH5tfXlCJShVXW+V
         2yGxxQLEXs7Xg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan+linaro@kernel.org>)
        id 1oBcFd-0007gM-C2; Wed, 13 Jul 2022 15:18:01 +0200
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 4/7] arm64: dts: qcom: sc8280xp: fix USB clock order
Date:   Wed, 13 Jul 2022 15:13:37 +0200
Message-Id: <20220713131340.29401-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220713131340.29401-1-johan+linaro@kernel.org>
References: <20220713131340.29401-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the USB controller clock order and naming so that they match the
devicetree binding.

Note that the driver currently simply enables all clocks in the order
that they are specified in the devicetree. Reordering the clocks as per
the binding means that the only explicit ordering constraint found in
the vendor driver, that cfg_noc should be enabled before the core_clk,
is now honoured.

Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 285a9828c250..45cc7d714fd2 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1855,16 +1855,16 @@ usb_0: usb@a6f8800 {
 			#size-cells = <2>;
 			ranges;
 
-			clocks = <&gcc GCC_USB30_PRIM_MASTER_CLK>,
-				 <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
 				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
-				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
 				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
 				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
 				 <&gcc GCC_AGGRE_USB_NOC_NORTH_AXI_CLK>,
 				 <&gcc GCC_AGGRE_USB_NOC_SOUTH_AXI_CLK>,
 				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
-			clock-names = "core", "iface", "bus_aggr", "utmi", "sleep",
+			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi",
 				      "noc_aggr", "noc_aggr_north", "noc_aggr_south", "noc_sys";
 
 			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
@@ -1905,16 +1905,16 @@ usb_1: usb@a8f8800 {
 			#size-cells = <2>;
 			ranges;
 
-			clocks = <&gcc GCC_USB30_SEC_MASTER_CLK>,
-				 <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
+			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
 				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
-				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
 				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
+				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
 				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
 				 <&gcc GCC_AGGRE_USB_NOC_NORTH_AXI_CLK>,
 				 <&gcc GCC_AGGRE_USB_NOC_SOUTH_AXI_CLK>,
 				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
-			clock-names = "core", "iface", "bus_aggr", "utmi", "sleep",
+			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi",
 				      "noc_aggr", "noc_aggr_north", "noc_aggr_south", "noc_sys";
 
 			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
-- 
2.35.1

