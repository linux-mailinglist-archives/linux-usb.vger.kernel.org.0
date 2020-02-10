Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75AA5157086
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 09:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgBJINi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 03:13:38 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:3865 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727575AbgBJINh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 03:13:37 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e4110710000>; Mon, 10 Feb 2020 00:12:33 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 10 Feb 2020 00:13:36 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 10 Feb 2020 00:13:36 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 08:13:35 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 10 Feb 2020 08:13:35 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e4110ac0001>; Mon, 10 Feb 2020 00:13:35 -0800
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V5 20/21] arm64: tegra: update OTG port entries for jetson-nano
Date:   Mon, 10 Feb 2020 13:41:46 +0530
Message-ID: <1581322307-11140-21-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581322354; bh=Ldb3UZv2AkiRIXVHdJWKa0Yw4NWPxPcisyX+eCZxiBI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Mky4OvM96hyVUxpYCW2Xsv5tsewJMJq6QW73Gna1zczfIAis71uwC6FXfVIqNHhKE
         OPp1gMNiTP4oALNnEvttxTIK0TwPzPxlI3WIL1Vx3Thq3XGqkrhX/bHh7Z1z2O7ERz
         Ki9ImdeMruvJ4vEyD7rzJc+DLzOQo+jXncoGIOz7a++clQSouGrcVST+HK3n8YZ8K1
         3SfImntwLpbY/ZdPkPnKVm4RUv3ASpeS0a0s6lhm6eYtCKLGyRErWQeT+Pn1mbWv2i
         XdoR+Oe0ut7LnLeGpOTUjnpIHrOnyVRZaJ9TvkUDD0mNYgfj6ZNbwQNrVHNYhROuYU
         QMFbz5VHezWiA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add usb-role-switch entry to peripheral usb port and add corresponding
connector details.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
V5:
 - New patch in the series.
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 9101d3a..b75f69d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -505,7 +505,17 @@
 		ports {
 			usb2-0 {
 				status = "okay";
-				mode = "otg";
+				mode = "peripheral";
+
+				usb-role-switch;
+				connector {
+					compatible = "usb-b-connector",
+						     "gpio-usb-b-connector";
+					label = "micro-USB";
+					type = "micro";
+					vbus-gpio = <&gpio TEGRA_GPIO(CC, 4)
+						     GPIO_ACTIVE_LOW>;
+				};
 			};
 
 			usb2-1 {
-- 
2.7.4

