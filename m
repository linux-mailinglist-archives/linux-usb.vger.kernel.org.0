Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D192FB841
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 15:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390999AbhASMPs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 07:15:48 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:12870 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731305AbhASI5K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 03:57:10 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60069eb90006>; Tue, 19 Jan 2021 00:56:25 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 08:56:20 +0000
Received: from jckuo-lt.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Jan 2021 08:56:18 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v6 09/15] arm64: tegra210: XUSB PADCTL add "nvidia,pmc" prop
Date:   Tue, 19 Jan 2021 16:55:40 +0800
Message-ID: <20210119085546.725005-10-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119085546.725005-1-jckuo@nvidia.com>
References: <20210119085546.725005-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611046585; bh=ioAPvLrbuZtVa74+TfHR78XvqGqYez26zQnBwR7v7tc=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=bGpz7nF6Cg7L91KZBLn8KHcSknkHfb9JHm3+N3AD+GY/KONDm7FAmBpriTbTyw+0N
         WvZYj1112zXQNoiYiirqBymPzIt50NMMnvk1kPaC0nOa0k0Y9Po31womBuJ4YkRiMN
         X+1/m/7vapmE5jU9EfOKHi5Fsun6PRb8cvX6Ha1quWWQdW6/4Hq4lAYEH4kJ2QMpkg
         CCqCJoIHhtdP+xt98jg/1gmGr6MIkksY31dksCtyBrMmtQrb5fhg8rDXWIZiyYgOAz
         RZ4edDn6cAfJp5nKtjwQQitKf8FAahKjvVvJdEVM4kdesfP4tG9XSISfaR/uoNsMVq
         uMDPLacc5SjaA==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PMC driver provides USB sleepwalk registers access to XUSB PADCTL
driver. This commit adds a "nvidia,pmc" property which points to
PMC node to XUSB PADCTL device node.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
v6:
   no change
v5:
   no change
v4:
   no change
v3:
   no change

 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra210.dtsi
index 4fbf8c15b0a1..83f6d11c578b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1043,6 +1043,7 @@ padctl: padctl@7009f000 {
 		interrupts =3D <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 		resets =3D <&tegra_car 142>;
 		reset-names =3D "padctl";
+		nvidia,pmc =3D  <&tegra_pmc>;
=20
 		status =3D "disabled";
=20
--=20
2.25.1

