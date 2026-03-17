Return-Path: <linux-usb+bounces-34926-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNuAAe5AuWmB9QEAu9opvQ
	(envelope-from <linux-usb+bounces-34926-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 12:54:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C5C2A949D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 12:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 194263031225
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 11:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F226D3B634B;
	Tue, 17 Mar 2026 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3u8qT8i"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799BB3B3BF8;
	Tue, 17 Mar 2026 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748436; cv=none; b=HBjxKz3cHSxOsqV6MDgowFmCj3rbf+YmW+Fk1uNIXvngediIVS3sDUKGss8NONW8CFkteAX55ceve4YwdcyVvvzsm2EnU2bmvE88k0yuHTyuuYb+oNK3mBE4TldqHaWA6uSY56L05fNTGqx/wHzq0Ry3Xs2EYzdYb+Pb2QSV/n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748436; c=relaxed/simple;
	bh=TFbRVqkiInsEoxByPRhntBXJ/89VgAXqRLdHlEElC7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cp7sCvZKYoyxYJF1td9TpZeMAhhCLyrjwxufBMU0NATDgyqfap7KyWCXZuAlwl6Ln5DPSBvkvfgTuJZtDYlicPFfpR/hs0pV1D2NYeq2MW5Ev8S/xudlB5EfCf3NNLTHFZa+8F5fy531QDx0wSIFGEJQTV716/7P/msJF94VBZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3u8qT8i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F918C19425;
	Tue, 17 Mar 2026 11:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773748436;
	bh=TFbRVqkiInsEoxByPRhntBXJ/89VgAXqRLdHlEElC7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W3u8qT8iX234qAkuKOT9R26PYD+5bu2AUIllqebot0uqXoiPPE4tOdug0gfa/BPaw
	 Syu/+qdCe6x6VWor3PJFnSgJiipkI0kCSktHcjO7cLuFApKu5sqFdsnp9lvOcCj1Qm
	 KS1bBR+NBsZJjbTJMDUIK8ZAwG5NdvXrWnzI4LEJ0attIalJTV5delmehHHG4ybOSL
	 JpXUJLeAXIl4dCORdwdp6GSuqag5MLSkliqiN/c0Wm73GgBrzFeVAP+qt4Fp6Xke++
	 sW6kBdgbpnqyQsXpgYlxW7HfbhT6ToXrj0RHXG/npCofPfGZYCWYrK2k8S7pRSjTqe
	 mXOonvHUO6DqA==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 17 Mar 2026 11:53:04 +0000
Subject: [PATCH 3/3] riscv: dts: spacemit: k3: Add USB2.0 support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-02-k3-usb20-support-v1-3-d89f59062ad4@kernel.org>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
In-Reply-To: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Junzhong Pan <junzhong.pan@spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2715; i=dlan@kernel.org;
 h=from:subject:message-id; bh=TFbRVqkiInsEoxByPRhntBXJ/89VgAXqRLdHlEElC7Q=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpuUC6kxU8ZFSs2QH7Z4NuaBBrviz0VT4CX0uH1
 cWSalc4mTOJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCablAuhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2k3Q//bs4WGQhdkRT0+EcWnZCioYvfBVrvgHOMCDRfGx7m1s3UboTsulZxr
 Nyl9PXs+wWO928+4hTFO4mruZFfKfgJjSnNBsKPu851XwxH6YksaTfg+bHpZvoEqFjbZI7hS/uI
 fAXyOEs2w+vCBhEvObn9GnHnofejHUx5OPwCCfNnRT0FxRXq5LDSwBpnNNCGvP1Sy0T0cZ0o3y+
 /W5e+3SzK/YqVRSA8ZC9FnCbTsVSJNZDvAjAJGrV3vOH/UPod4lcxDL87ifoFnDZLY2Q5GJnWXe
 bRmzq7epQYrxCPeLVOHqzmH8ydpcBGhPMw+bmLWas9VLXv4AjZfGAzdl/yjHIHXVzqo8kP+PCyP
 TsA+0ps1XDrsNkSow9p33OxDM13Z06s4My2apY2X797if/EGBtO+o01ZVA/L8bBpaBQWHdsvqja
 OBpmPtjBA352x4E68wQeKBk3Sv8U/HlECPdCSc02pDonbq/N+SFIclwAjRi46QnfKnSK8z0R4Dh
 Ulhtt8303xkWJ9cV50RwH2yDgzf9lr8gHELeGOYmql8rd12iWcqgFoTMiGOY7IJATO8aYFy5/dB
 Yc+K9G+MAu+ozZ5XNnItxhLX2de2DkMz/88r7CrkTeyb8Am8aIzTcaafOPpgZhxgjzmutpd5qyp
 XCEcd0r9eEP3rInm5fONYMBP28Hdy0=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34926-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[esmil.dk,spacemit.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,c0a00000:email,c0a20000:email,d4015000:email,0.0.0.1:email,5.245.225.0:email]
X-Rspamd-Queue-Id: 97C5C2A949D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The USB2.0 controller on Pico-ITX board connnects to a Terminus FE1.1 Hub
which fully USB2.0 protocol compliant and provides 4 ports.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 24 +++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 31 ++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b098dbd0e7a1..393a0ce65efc 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -23,6 +23,14 @@ memory@100000000 {
 		device_type = "memory";
 		reg = <0x1 0x00000000 0x4 0x00000000>;
 	};
+
+	aux_vcc3v3: regulator-aux-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &uart0 {
@@ -30,3 +38,19 @@ &uart0 {
 	pinctrl-0 = <&uart0_0_cfg>;
 	status = "okay";
 };
+
+&usb2_host {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hub@1 {
+		compatible = "usb1a40,0101";
+		reg = <1>;
+		vdd-supply = <&aux_vcc3v3>;
+	};
+};
+
+&usb2_phy {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index a3a8ceddabec..52be168a0496 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -438,6 +438,37 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		usb2_host: usb@c0a00000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0xc0a00000 0x0 0x10000>;
+			clocks = <&syscon_apmu CLK_APMU_USB2_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB2_AHB>,
+				 <&syscon_apmu RESET_APMU_USB2_VCC>,
+				 <&syscon_apmu RESET_APMU_USB2_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			interrupts = <105 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			phys = <&usb2_phy>;
+			phy-names = "usb2-phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			dr_mode = "host";
+			maximum-speed = "high-speed";
+			status = "disabled";
+		};
+
+		usb2_phy: phy@c0a20000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0xc0a20000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB2_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k3-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;

-- 
2.53.0


