Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A6F49CC00
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 15:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241998AbiAZON6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 09:13:58 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:61280 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242003AbiAZON4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jan 2022 09:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643206436; x=1674742436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WWiIdXtyw56Rqfds2qB4Yd2Fj1coCEHLkEHNeGkzWGg=;
  b=IBHw6C6plVEfso3f4lLlK8OIOBY8kbI8eawOUZslES8xdTGM6nrAvHpz
   WinpFisKj/V92Ts5kYS72QZJzx9qIDfcSc9Mdqo9/UXx1Jlrm20oAWn6y
   jbiH/1h2DTtvm2YV7dLfg/rs5zxGHKdAQ6C/a6OtJcXMgYpq/MhL7Vz3G
   YlqwTqTMG4vlo3osA7h73nOr5fLgzHAOWxTX1Ttpy6hosqVILLnED8rJS
   QDKNce47sK8M3b3reZ5arBwQdOStBoYBTGDzG/nJXx3qjGUjz52RD8tZe
   QzXFGZviXpmnioyJRr9qSoeaefkwZTc9BcLQ99EZyVFDek/SxoBHFArxy
   g==;
X-IronPort-AV: E=Sophos;i="5.88,318,1635199200"; 
   d="scan'208";a="21725572"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 26 Jan 2022 15:13:51 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 26 Jan 2022 15:13:51 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 26 Jan 2022 15:13:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643206431; x=1674742431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WWiIdXtyw56Rqfds2qB4Yd2Fj1coCEHLkEHNeGkzWGg=;
  b=AHSU8Gu7R6pE3wBOrrAKkpr+EJFy68F25TJSemeRgQfMgqG37EGotUWv
   e5kwPpcEefUGoTx6k/4tj71iHuzNY/3TBDUg4uUyK4i8NYWtZmFs9vlA5
   QepEkKJub7k60Chkaqfpxwpu7czdZH8uhynJ+arfWNAf6fKOBwFrT3RKX
   eAeNRwMFienJit2vJ4NN+nFYSJVOl0UfaxswUQDpZ4jrQ/kTfuLBwJknK
   vf+alctqwECV/CrvxLS1S/9uJP3fIEHR+kKzrCJVkndskZYNaNnApznVq
   GjOVGDIxvjgU+ZDhWSGsZ7JCfCDpAaesJgMTcOGH5CUJni6aaErEbE8cj
   g==;
X-IronPort-AV: E=Sophos;i="5.88,318,1635199200"; 
   d="scan'208";a="21725570"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 26 Jan 2022 15:13:51 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9ACE0280065;
        Wed, 26 Jan 2022 15:13:51 +0100 (CET)
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
Subject: [PATCH v4 4/4] arm64: dts: imx8mp: Add memory for USB3 glue layer to usb3 nodes
Date:   Wed, 26 Jan 2022 15:13:40 +0100
Message-Id: <20220126141340.234125-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126141340.234125-1-alexander.stein@ew.tq-group.com>
References: <20220126141340.234125-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e61ac5f136ad..d4aadb434d36 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1030,7 +1030,8 @@ usb3_phy0: usb-phy@381f0040 {
 
 		usb3_0: usb@32f10100 {
 			compatible = "fsl,imx8mp-dwc3";
-			reg = <0x32f10100 0x8>;
+			reg = <0x32f10100 0x8>,
+			      <0x381f0000 0x20>;
 			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
 				 <&clk IMX8MP_CLK_USB_ROOT>;
 			clock-names = "hsio", "suspend";
@@ -1070,7 +1071,8 @@ usb3_phy1: usb-phy@382f0040 {
 
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

