Return-Path: <linux-usb+bounces-32593-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGiDCtcAcWmgbAAAu9opvQ
	(envelope-from <linux-usb+bounces-32593-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 17:37:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD48D59FE2
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 17:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E30772A877
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 15:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE9B4963A4;
	Wed, 21 Jan 2026 14:55:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7B62D0601;
	Wed, 21 Jan 2026 14:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007354; cv=none; b=f2McV8l/3lb7SfGf2O/y9A9p6AOdbhbDEQbAqXKcIrqxfAPq9Wd2m1j2mahAalIXhcK50WXs9Fb75BDPObEy5So0ISQW9B2q+bBq/7qa6MDFdZ0tUarH9cIED0/AdJOgs7FCzsNk2iiZaNfSfECQUHxLASIWaoTXmuKXZHMIMyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007354; c=relaxed/simple;
	bh=y3j7a8AHlwqdtV7We7unMDy7szHzimBFoijdXbjyjJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJxiEyB63vgmOwEqqFGDHTATSX58q6rFTztm3Yyc17KlyHr9ieW2wTfSTJM5LUEvCGsTu2NENwop6I2HIcku1M6knu0AS93jXgTQbHzXWZaqTffB3xA/BupVpLE9ArZ8mGH9gVP3BWhFCfsPZDFEZ8jOi+71zQU5EkZs5BXVrtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [183.192.221.134])
	by APP-01 (Coremail) with SMTP id qwCowACXP2vl6HBpCoqlBQ--.20720S6;
	Wed, 21 Jan 2026 22:55:43 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: vkoul@kernel.org,
	gregkh@linuxfoundation.org,
	conor@kernel.org
Cc: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jiayu.riscv@isrc.iscas.ac.cn,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] riscv: dts: canaan: Add syscon and USB nodes for K230
Date: Wed, 21 Jan 2026 22:55:25 +0800
Message-ID: <20260121145526.14672-5-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXP2vl6HBpCoqlBQ--.20720S6
X-Coremail-Antispam: 1UD129KBjvJXoW7tF1xZr1fCrykZF47JFy5Jwb_yoW8tw4xp3
	srCFZ8Gr93Wr4S93Wak348KFyfGF4kGFyfWrn8AryUGr4UZas09w1fJ34fXFyUXw47J3y2
	kasYqryxKF4jyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUma14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWx
	Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
	x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
	JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
	ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
	vfC2KfnxnUUI43ZEXa7VUbPC7UUUUUU==
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-Spamd-Result: default: False [1.74 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32593-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[jiayu.riscv@isrc.iscas.ac.cn,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_PROHIBIT(0.00)[5.117.121.232:email,5.114.182.224:email];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[5.116.45.224:email,iscas.ac.cn:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,isrc.iscas.ac.cn:mid,5.116.202.32:email]
X-Rspamd-Queue-Id: CD48D59FE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add top syscon and USB PHY subdevice nodes, USB0/USB1 dwc2 controller
to K230 DTSI, and enable UART0 and USB0/USB1 in DshanPI DT.

Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---
 .../boot/dts/canaan/k230-canmv-dshanpi.dts    | 17 +++++++++
 arch/riscv/boot/dts/canaan/k230.dtsi          | 35 +++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts b/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
index 4f95b534ee87..55197cfc25b4 100644
--- a/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
+++ b/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
@@ -80,3 +80,20 @@ &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
+
+&usb0 {
+	vusb_d-supply = <&vdd_3v3>;
+	vusb_a-supply = <&vdd_1v8>;
+	status = "okay";
+};
+
+&usb1 {
+	dr_mode = "host";
+	vusb_d-supply = <&vdd_3v3>;
+	vusb_a-supply = <&vdd_1v8>;
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index 8ca5c7dee427..b369b7d8dc83 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -148,5 +148,40 @@ uart4: serial@91404000 {
 			reg-shift = <2>;
 			status = "disabled";
 		};
+
+		usb0: usb@91500000 {
+			compatible = "canaan,k230-usb", "snps,dwc2";
+			reg = <0x0 0x91500000 0x0 0x40000>;
+			interrupts = <173 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysclk K230_HS_USB0_AHB_GATE>;
+			clock-names = "otg";
+			g-rx-fifo-size = <512>;
+			g-np-tx-fifo-size = <64>;
+			g-tx-fifo-size = <512 1024 64 64 64 64>;
+			phys = <&usbphy 0>;
+			phy-names = "usb2-phy";
+			status = "disabled";
+		};
+
+		usb1: usb@91540000 {
+			compatible = "canaan,k230-usb", "snps,dwc2";
+			reg = <0x0 0x91540000 0x0 0x40000>;
+			interrupts = <174 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysclk K230_HS_USB1_AHB_GATE>;
+			clock-names = "otg";
+			g-rx-fifo-size = <512>;
+			g-np-tx-fifo-size = <64>;
+			g-tx-fifo-size = <512 1024 64 64 64 64>;
+			phys = <&usbphy 1>;
+			phy-names = "usb2-phy";
+			status = "disabled";
+		};
+
+		usbphy: usb-phy@91585000 {
+			compatible = "canaan,k230-usb-phy";
+			reg = <0x0 0x91585000 0x0 0x400>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.52.0


