Return-Path: <linux-usb+bounces-31825-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1CCE8930
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 03:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D44403002072
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 02:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47C72F8BD3;
	Tue, 30 Dec 2025 02:38:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218BC2E0418;
	Tue, 30 Dec 2025 02:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767062281; cv=none; b=RjApJAUWH6WHZuywkSoR9d9c0RNyH903R9413vxkJ7l4L+yMjTes9N0XjE9E53JhVTfm8y6E0x4o+Eqse4OLZKJwkDZpoFiNEUiy4ue+JFdi48Jmo+xB391/erS0UNpNoZT34vXK+AnVEiWDhLGYIYTNrb45+4X9wODxKM4fzrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767062281; c=relaxed/simple;
	bh=S9yMTdl+moTTVgrFezuHN7qN2o2AqmVlH8Z7ugR8IYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RC2UoKkCjWLc33sWr34yokLSBFQtFfGPrUuuxp7kGrN2NcBT0j1VoRGPyvMzLN4fzpr2zWXpO8RRlGs2V8dMxNrzrsSRbwnv18xpmU4O9q+iYydA/mnFMMKLzrviYR6WzXy1/4+q/UaZq4JgbfTrHDChOJ4s7j6uGjpwNyaOONE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [223.160.207.108])
	by APP-01 (Coremail) with SMTP id qwCowACXQW3oOlNpIqZOAg--.5334S7;
	Tue, 30 Dec 2025 10:37:45 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: conor@kernel.org
Cc: vkoul@kernel.org,
	gregkh@linuxfoundation.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	neil.armstrong@linaro.org,
	krzk+dt@kernel.org,
	jiayu.riscv@isrc.iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 5/5] riscv: dts: canaan: Add syscon and USB nodes for K230
Date: Tue, 30 Dec 2025 10:37:24 +0800
Message-ID: <20251230023725.15966-6-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXQW3oOlNpIqZOAg--.5334S7
X-Coremail-Antispam: 1UD129KBjvJXoWxCFy8KF4xZw1fXr1UXw17GFg_yoW5XFy3p3
	srCFZ8Kr93Wr4S93W29340gF93GFWkGFyfGrn8AFyUGr4UZa4q9w1rJryfZF1UXF47G3y2
	yFZYqryxKr4jyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4U
	JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
	WIevJa73UjIFyTuYvjfUOyIUUUUUU
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

Add top syscon and USB PHY subdevice nodes, USB0/USB1 dwc2 controller
to K230 DTSI, and enable UART0 and USB0/USB1 in DshanPI DT.

Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---
 .../boot/dts/canaan/k230-canmv-dshanpi.dts    | 21 ++++++++
 arch/riscv/boot/dts/canaan/k230.dtsi          | 51 +++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts b/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
index 4f95b534ee87..622d273d723a 100644
--- a/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
+++ b/arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
@@ -80,3 +80,24 @@ &uart0 {
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
+&usbphy0 {
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index b815a65e02b9..825728727425 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -148,5 +148,56 @@ uart4: serial@91404000 {
 			reg-shift = <2>;
 			status = "disabled";
 		};
+
+		usb0: usb@91500000 {
+			compatible = "canaan,k230-usb", "snps,dwc2";
+			reg = <0x0 0x91500000 0x0 0x40000>;
+			interrupts = <173 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysclk K230_USB_480M_RATE>;
+			clock-names = "otg";
+			g-rx-fifo-size = <512>;
+			g-np-tx-fifo-size = <64>;
+			g-tx-fifo-size = <512 1024 64 64 64 64>;
+			phys = <&usbphy0>;
+			phy-names = "usb2-phy";
+			status = "disabled";
+		};
+
+		usb1: usb@91540000 {
+			compatible = "canaan,k230-usb", "snps,dwc2";
+			reg = <0x0 0x91540000 0x0 0x40000>;
+			interrupts = <174 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysclk K230_USB_480M_RATE>;
+			clock-names = "otg";
+			g-rx-fifo-size = <512>;
+			g-np-tx-fifo-size = <64>;
+			g-tx-fifo-size = <512 1024 64 64 64 64>;
+			phys = <&usbphy1>;
+			phy-names = "usb2-phy";
+			status = "disabled";
+		};
+
+		hi_sys_config: syscon@91585000 {
+			compatible = "canaan,k230-hisys-cfg", "syscon", "simple-mfd";
+			reg = <0x0 0x91585000 0x0 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			usbphy0: usb-phy@70 {
+				compatible = "canaan,k230-usb-phy";
+				reg = <0x70 0x1C>, <0xb0 0x8>;
+				clocks = <&sysclk K230_HS_USB0_AHB_GATE>;
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
+			usbphy1: usb-phy@90 {
+				compatible = "canaan,k230-usb-phy";
+				reg = <0x90 0x1C>, <0xb8 0x8>;
+				clocks = <&sysclk K230_HS_USB1_AHB_GATE>;
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+		};
 	};
 };
-- 
2.52.0


