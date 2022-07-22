Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8017157DBAC
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jul 2022 10:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234714AbiGVICM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jul 2022 04:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234476AbiGVICK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jul 2022 04:02:10 -0400
X-Greylist: delayed 357 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 22 Jul 2022 01:02:07 PDT
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [IPv6:2001:1600:3:17::1909])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8179B541
        for <linux-usb@vger.kernel.org>; Fri, 22 Jul 2022 01:02:07 -0700 (PDT)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
        by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Lq1w620jpzMrM2M;
        Fri, 22 Jul 2022 09:56:06 +0200 (CEST)
Received: from philippe-pc.cardiotech.int (unknown [37.17.235.10])
        by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Lq1w506PJzln8Vr;
        Fri, 22 Jul 2022 09:56:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pschenker.ch;
        s=20220412; t=1658476566;
        bh=XdvGbBvtjR3nhNigZS2yI8bt0t700ywhSrOK9IxLigg=;
        h=From:To:Cc:Subject:Date:From;
        b=anodZdDmcrGpexROkOr+TnHNItJocUmz/ej4CCv07jJn6bR0eACEAhKP69fp6b9wJ
         GiHom7h6WqzHwqQwbU4gaLlZrjJIaTGVN6iAZ1DmLNgRYtwn1BwqwTBs+4/paXaB2o
         9T0G1XaPXSoy8WEAkXUJ49ei1ritpToRUKkoDDrE=
From:   Philippe Schenker <dev@pschenker.ch>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Andrejs Cainikovs <andrejs.cainikovs@toradex.com>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: verdin-imx8mm: add otg2 pd to usbphy
Date:   Fri, 22 Jul 2022 09:55:59 +0200
Message-Id: <20220722075600.10943-1-dev@pschenker.ch>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Philippe Schenker <philippe.schenker@toradex.com>

The Verdin iMX8M Mini System on Module does not have VBUS signal
connected on Verdin USB_2 (usbotg2). On Verdin Development board this is
no problem, as we have connected a USB-Hub that is always connected.

However, if Verdin USB_2 is desired to be used as a single USB-Host port
the chipidea driver does not detect if a USB device is plugged into this
port, due to runtime pm shutting down the PHY.

Add the power-domain &pgc_otg2 to &usbphynop2 in order to detect
plugging events and enumerate the usb device.

Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for verdin imx8m mini")
Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

---

 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index eafa88d980b3..197da74837ca 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -737,6 +737,7 @@ &usbphynop1 {
 };
 
 &usbphynop2 {
+	power-domains = <&pgc_otg2>;
 	vcc-supply = <&reg_vdd_3v3>;
 };
 
-- 
2.37.1

