Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD8E665152
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jan 2023 02:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234719AbjAKBxv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 20:53:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234469AbjAKBxt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 20:53:49 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C88F4D98;
        Tue, 10 Jan 2023 17:53:48 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F6E0FEC;
        Tue, 10 Jan 2023 17:54:30 -0800 (PST)
Received: from donnerap.cambridge.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4B9F3F67D;
        Tue, 10 Jan 2023 17:53:46 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bin Liu <b-liu@ti.com>
Cc:     Icenowy Zheng <uwu@icenowy.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, soc@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev
Subject: [PATCH v5 05/11] ARM: dts: suniv: licheepi-nano: enable USB
Date:   Wed, 11 Jan 2023 01:53:26 +0000
Message-Id: <20230111015332.172021-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111015332.172021-1-andre.przywara@arm.com>
References: <20230111015332.172021-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Icenowy Zheng <uwu@icenowy.me>

Lichee Pi Nano has a Micro-USB connector, with its D+, D- pins connected
to the USB pins of the SoC and ID pin connected to PE2 GPIO.

Enable the USB functionality.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../arm/boot/dts/suniv-f1c100s-licheepi-nano.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts b/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
index 04e59b8381cb8..43896723a994c 100644
--- a/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
+++ b/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
@@ -6,6 +6,8 @@
 /dts-v1/;
 #include "suniv-f1c100s.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	model = "Lichee Pi Nano";
 	compatible = "licheepi,licheepi-nano", "allwinner,suniv-f1c100s";
@@ -50,8 +52,22 @@ flash@0 {
 	};
 };
 
+&otg_sram {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pe_pins>;
 	status = "okay";
 };
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 4 2 GPIO_ACTIVE_HIGH>; /* PE2 */
+	status = "okay";
+};
-- 
2.25.1

