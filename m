Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAAE2572FE
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 06:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727786AbgHaElI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 00:41:08 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1178 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726824AbgHaEk6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 00:40:58 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4c7edd0000>; Sun, 30 Aug 2020 21:38:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 30 Aug 2020 21:40:58 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 30 Aug 2020 21:40:58 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 31 Aug
 2020 04:40:55 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 31 Aug 2020 04:40:55 +0000
Received: from jckuo-lt.nvidia.com (Not Verified[10.19.101.4]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f4c7f550001>; Sun, 30 Aug 2020 21:40:55 -0700
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v2 10/12] arm64: tegra210/tegra186/tegra194: XUSB PADCTL irq
Date:   Mon, 31 Aug 2020 12:40:41 +0800
Message-ID: <20200831044043.1561074-11-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831044043.1561074-1-jckuo@nvidia.com>
References: <20200831044043.1561074-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598848733; bh=5xHfZPttdwW7Er6d1zUMfgP3rWvN2dNH9BKH/oThNWo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=DDJmuVfvXOI5e6Nr4/x9IG2mrW7XoDECZq6S9JWDlsqQu0SV27wBsYu0PpjdaYIwH
         GCYIifxoURc2FFGojOrtE6dsTm3QoMpCP+TqLTwVGCXmk60nXDmg7xXwOUWhmaINIG
         yc1J9vxHe/oc+JvApq0AaZCfey62NjKE2J71O/SkSyitZ9Qip2pxrizmaY52gB9LAg
         TvU6dKKjsWuU1mdSaTFHF7gaGqFRQT4JsL8rsJdYMgyGhOAE2WoGKMF1xXSfosrZLl
         ns20pbIUtHGciilE0/BoSPChsee4aIU8JXmQgjlHpR78VRLNmM6HE7ZDkXSVzxXQ4b
         IaHHvA7675FXw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit adds "interrupts" property to Tegra210/Tegra186/Tegra194
XUSB PADCTL node. XUSB PADCTL interrupt will be raised when USB wake
event happens. This is required for supporting XUSB host controller
ELPG.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 1 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 1 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra186.dtsi
index 34d249d85da7..454a857e5e56 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -466,6 +466,7 @@ padctl: padctl@3520000 {
 		reg =3D <0x0 0x03520000 0x0 0x1000>,
 		      <0x0 0x03540000 0x0 0x1000>;
 		reg-names =3D "padctl", "ao";
+		interrupts =3D <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
=20
 		resets =3D <&bpmp TEGRA186_RESET_XUSB_PADCTL>;
 		reset-names =3D "padctl";
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra194.dtsi
index 48160f48003a..2b5216a34c06 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -561,6 +561,7 @@ xusb_padctl: padctl@3520000 {
 			reg =3D <0x03520000 0x1000>,
 			      <0x03540000 0x1000>;
 			reg-names =3D "padctl", "ao";
+			interrupts =3D <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
=20
 			resets =3D <&bpmp TEGRA194_RESET_XUSB_PADCTL>;
 			reset-names =3D "padctl";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra210.dtsi
index 67c90a0ea32e..2ba526779ee5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1041,6 +1041,7 @@ padctl: padctl@7009f000 {
 		resets =3D <&tegra_car 142>;
 		reset-names =3D "padctl";
 		nvidia,pmc =3D  <&tegra_pmc>;
+		interrupts =3D <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
=20
 		status =3D "disabled";
=20
--=20
2.25.1

