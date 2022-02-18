Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 707574BBC27
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 16:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236017AbiBRP1j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 10:27:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237011AbiBRP1i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 10:27:38 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7A11C9184;
        Fri, 18 Feb 2022 07:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1645198041; x=1676734041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HOdfXpDV8bIeEo5WcfKavhxD1bHf99R2VgJCyxOy74g=;
  b=P0b5TWCfAMBxJPAfPNn0CKq4Obh+asTsv9O6EubeM9pcDD+JVQhBSexw
   YZDfnY5AQjrVjNw0ejmUzQTO4jEBHY/4tLvRX+SKFgOgNfX2kIooTFNZ+
   i75g4R155x+W9u49wfH/3q+wH2+A5J6s+Wubh42kJsHZT+4YungtM7Bgm
   qXOSg7NOusqh1zUFOzj8B4bcRs1DPwUlvWZDqpzHsj2J0lf+iDxlDF7Wt
   u9J5n7NJJR9MzB/YEm6Dk6KhkCDuDgcdswyh6fLpU466crfzE1j0rzS8B
   OpxxeDCzTJW7q8Beqm59D2WGqXBcT4fJh2uptIs0Toj2f3IZoNJPp5hbX
   A==;
X-IronPort-AV: E=Sophos;i="5.88,379,1635199200"; 
   d="scan'208";a="22181145"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Feb 2022 16:27:15 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 18 Feb 2022 16:27:15 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 18 Feb 2022 16:27:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1645198035; x=1676734035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HOdfXpDV8bIeEo5WcfKavhxD1bHf99R2VgJCyxOy74g=;
  b=ZwHk3F5ZArmEn+/NFTqvTg+d9RDJJ2rlE9rDK7HRhkkAdLOMiKHwiTX5
   n5nbtS58elk6CIP0qercTRJUEhfHMtw/IR9PnunOdMzltF8YEY1MisdK8
   OqBBW1fOwl/pnfbT6woUJtihFlipu4JLeOM+fje+6xQfurLl3i1qCBo0C
   qu0hFZq9hBnl38mmlWO41jwBuDg+LGzLtEGKoI+fRmmXe1c/Efg+WTSF2
   szYY4brCXMZF1s+5cMtjmYkyfNKSZynHZNdTVelDen6j1YRVCpPGYGV/P
   Xgd+cN1xyO8NLBMgxZEXZDVysBfKJ0qRhRQq9Pr4b/wOk1uDF7DSXV9Lx
   w==;
X-IronPort-AV: E=Sophos;i="5.88,379,1635199200"; 
   d="scan'208";a="22181144"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Feb 2022 16:27:15 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id EBAB2280065;
        Fri, 18 Feb 2022 16:27:14 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
Subject: [PATCH v5 4/4] arm64: dts: imx8mp: Add memory for USB3 glue layer to usb3 nodes
Date:   Fri, 18 Feb 2022 16:27:07 +0100
Message-Id: <20220218152707.2198357-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220218152707.2198357-1-alexander.stein@ew.tq-group.com>
References: <20220218152707.2198357-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB3 glue layer has 2 areas in the register set, see RM Rev.1
section 11.2.5.2.1 GLUE_usb3 memory map:
* USB3 control/status
* PHY control/status

Provide the memory area to the usb3 nodes for accessing the features
in the USB3 control area.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Li Jun <jun.li@nxp.com>
---
Changes in v5:
* Added Reviewed-by: Li Jun

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 00ed083662e9..d73f0937b5d3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1033,7 +1033,8 @@ usb3_phy0: usb-phy@381f0040 {
 
 		usb3_0: usb@32f10100 {
 			compatible = "fsl,imx8mp-dwc3";
-			reg = <0x32f10100 0x8>;
+			reg = <0x32f10100 0x8>,
+			      <0x381f0000 0x20>;
 			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
 				 <&clk IMX8MP_CLK_USB_ROOT>;
 			clock-names = "hsio", "suspend";
@@ -1074,7 +1075,8 @@ usb3_phy1: usb-phy@382f0040 {
 
 		usb3_1: usb@32f10108 {
 			compatible = "fsl,imx8mp-dwc3";
-			reg = <0x32f10108 0x8>;
+			reg = <0x32f10108 0x8>,
+			      <0x382f0000 0x20>;
 			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
 				 <&clk IMX8MP_CLK_USB_ROOT>;
 			clock-names = "hsio", "suspend";
-- 
2.25.1

