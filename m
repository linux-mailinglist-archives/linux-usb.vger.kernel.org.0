Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 050924B6868
	for <lists+linux-usb@lfdr.de>; Tue, 15 Feb 2022 11:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236263AbiBOKAz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Feb 2022 05:00:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236216AbiBOKAy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Feb 2022 05:00:54 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2602C10E06C
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 02:00:45 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1nJudB-0001tH-OY; Tue, 15 Feb 2022 11:00:21 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1nJud9-009fwM-Eq; Tue, 15 Feb 2022 11:00:19 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        "David S. Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Scott Branden <sbranden@broadcom.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v4 4/8] ARM: dts: bcm283x: fix ethernet node name
Date:   Tue, 15 Feb 2022 11:00:14 +0100
Message-Id: <20220215100018.2306046-5-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220215100018.2306046-1-o.rempel@pengutronix.de>
References: <20220215100018.2306046-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It should be "ethernet@x" instead of "usbether@x" as required by Ethernet
controller devicetree schema:
 Documentation/devicetree/bindings/net/ethernet-controller.yaml

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/bcm283x-rpi-smsc9512.dtsi | 2 +-
 arch/arm/boot/dts/bcm283x-rpi-smsc9514.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm283x-rpi-smsc9512.dtsi b/arch/arm/boot/dts/bcm283x-rpi-smsc9512.dtsi
index 967e081cb9c2..882b13807075 100644
--- a/arch/arm/boot/dts/bcm283x-rpi-smsc9512.dtsi
+++ b/arch/arm/boot/dts/bcm283x-rpi-smsc9512.dtsi
@@ -12,7 +12,7 @@ usb1@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ethernet: usbether@1 {
+		ethernet: ethernet@1 {
 			compatible = "usb424,ec00";
 			reg = <1>;
 		};
diff --git a/arch/arm/boot/dts/bcm283x-rpi-smsc9514.dtsi b/arch/arm/boot/dts/bcm283x-rpi-smsc9514.dtsi
index dc7ae776db5f..4273b90b53cc 100644
--- a/arch/arm/boot/dts/bcm283x-rpi-smsc9514.dtsi
+++ b/arch/arm/boot/dts/bcm283x-rpi-smsc9514.dtsi
@@ -11,7 +11,7 @@ usb1@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ethernet: usbether@1 {
+		ethernet: ethernet@1 {
 			compatible = "usb424,ec00";
 			reg = <1>;
 		};
-- 
2.30.2

