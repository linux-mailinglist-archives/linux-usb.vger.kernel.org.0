Return-Path: <linux-usb+bounces-1279-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F147BE7B2
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 19:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85B9A1C20D74
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 17:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E444C38BCE;
	Mon,  9 Oct 2023 17:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="j19yWOUR"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ECF37C97;
	Mon,  9 Oct 2023 17:21:37 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FE7A3;
	Mon,  9 Oct 2023 10:21:35 -0700 (PDT)
Received: from jupiter.universe (dyndsl-091-248-211-168.ewe-ip-backbone.de [91.248.211.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6EAFC660716C;
	Mon,  9 Oct 2023 18:21:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696872093;
	bh=UsIbMdBkB63KIT1K+XLIc1aWT6m/RDcXwqMsI3caB1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j19yWOUR3vQL4YSn4IiVdvJP32EuORB71gqW3LowVX0sDvX+DuCgqPpwK+06T1vcC
	 060hbsjqpNrgDWc+QPK0NSspPMdhoDEu5Wzjppl0VRgUnc2EZ0IEjZ4hARHapxvBvC
	 yaGwJvhi1kp510oqrMRhxaPkMDBtS5hhH2A960kI9Qe5bT2jhLu0DPRvgfjtqeP8ZI
	 loAOEupY3BLCQjJybVqWgLSU1SC8sLXZxoL3s3s+Aa3xs/4LZO7CwIks369ygu355O
	 pPSzQ32jVCPBj9IO61/k8FrRggjzRQZqkVyo+tZPD6dmm1nw67Majxl1WrIpQUio9I
	 9gpLXVyhI722Q==
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2067F480105; Mon,  9 Oct 2023 19:21:31 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v3 3/3] arm64: dts: rockchip: rk3588s: Add USB3 host controller
Date: Mon,  9 Oct 2023 19:20:11 +0200
Message-ID: <20231009172129.43568-4-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009172129.43568-1-sebastian.reichel@collabora.com>
References: <20231009172129.43568-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

RK3588 has three USB3 controllers. This adds the host-only controller,
which is using the naneng-combphy shared with PCIe and SATA.

The other two are dual-role and using a different PHY that is not yet
supported upstream.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
index 5544f66c6ff4..8b4c99b49798 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
@@ -443,6 +443,27 @@ usb_host1_ohci: usb@fc8c0000 {
 		status = "disabled";
 	};
 
+	usb_host2_xhci: usb@fcd00000 {
+		compatible = "rockchip,rk3588-dwc3", "snps,dwc3";
+		reg = <0x0 0xfcd00000 0x0 0x400000>;
+		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru REF_CLK_USB3OTG2>, <&cru SUSPEND_CLK_USB3OTG2>,
+			 <&cru ACLK_USB3OTG2>, <&cru CLK_UTMI_OTG2>,
+			 <&cru CLK_PIPEPHY2_PIPE_U3_G>;
+		clock-names = "ref_clk", "suspend_clk", "bus_clk", "utmi", "pipe";
+		dr_mode = "host";
+		phys = <&combphy2_psu PHY_TYPE_USB3>;
+		phy-names = "usb3-phy";
+		phy_type = "utmi_wide";
+		resets = <&cru SRST_A_USB3OTG2>;
+		snps,dis_enblslpm_quirk;
+		snps,dis-u2-freeclk-exists-quirk;
+		snps,dis-del-phy-power-chg-quirk;
+		snps,dis-tx-ipgap-linecheck-quirk;
+		snps,dis_rxdet_inp3_quirk;
+		status = "disabled";
+	};
+
 	sys_grf: syscon@fd58c000 {
 		compatible = "rockchip,rk3588-sys-grf", "syscon";
 		reg = <0x0 0xfd58c000 0x0 0x1000>;
-- 
2.42.0


