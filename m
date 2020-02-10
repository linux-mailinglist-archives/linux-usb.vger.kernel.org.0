Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9CA0157066
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 09:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgBJINF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 03:13:05 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18273 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727764AbgBJIND (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 03:13:03 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e4110800000>; Mon, 10 Feb 2020 00:12:48 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 10 Feb 2020 00:13:03 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 10 Feb 2020 00:13:03 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 08:13:02 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 10 Feb 2020 08:13:02 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e41108b0001>; Mon, 10 Feb 2020 00:13:02 -0800
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V5 11/21] usb: gadget: tegra-xudc: use phy_set_mode to set/unset device mode
Date:   Mon, 10 Feb 2020 13:41:37 +0530
Message-ID: <1581322307-11140-12-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581322369; bh=enSyMPzTayP8VechD0lnuAhplv7sin8uwClOTcl+XQQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=goSBVyeEQff02Q8ND2Q4UCmjWnlG9dvVi/KlHeqv1EvT4kjOOTYU6xi3+bEFitE86
         MJcMcYC8ahXAGfpisjWa5IgedVcQ6pPpXdpxe86uwLJ48zSu8B2QBjbeIu+h6Wru7K
         YkcPxg8mnstFTwbhnMXIiBdjoeyPiKS8xBd4lMmtrlMMzkdLRz3NWzld7coAr6j02E
         98uxkEeg7EMd2zAyeCLVr8sgL4TB62Hw9UYvzxGxRq6WiQGdyVLa03Rjp23HPNVY+4
         z+t0nb/geyw71ww3eloeuR6Sce7M1Ft25m8DSknK8FWWuN1qVg9RS/xKcLOoJV1cui
         DD2sj1s7MVbmw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When device mode is set/uset, VBUS override activity is done via
exported functions from padctl driver. Use phy_set_mode() instead.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
V5:
 - No changes.
---
V4:
 - Updated commit message as per comments from Thierry.
---
V2-V3:
 - No changes in this version
---
 drivers/usb/gadget/udc/tegra-xudc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 7411dd15..a2299ee 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -612,7 +612,7 @@ static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
 
 	dev_dbg(xudc->dev, "device mode on\n");
 
-	tegra_xusb_padctl_set_vbus_override(xudc->padctl, true);
+	phy_set_mode_ext(xudc->utmi_phy, PHY_MODE_USB_OTG, USB_ROLE_DEVICE);
 }
 
 static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
@@ -627,7 +627,7 @@ static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
 
 	reinit_completion(&xudc->disconnect_complete);
 
-	tegra_xusb_padctl_set_vbus_override(xudc->padctl, false);
+	phy_set_mode_ext(xudc->utmi_phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
 
 	pls = (xudc_readl(xudc, PORTSC) & PORTSC_PLS_MASK) >>
 		PORTSC_PLS_SHIFT;
@@ -714,9 +714,11 @@ static void tegra_xudc_plc_reset_work(struct work_struct *work)
 
 		if (pls == PORTSC_PLS_INACTIVE) {
 			dev_info(xudc->dev, "PLS = Inactive. Toggle VBUS\n");
-			tegra_xusb_padctl_set_vbus_override(xudc->padctl,
-							      false);
-			tegra_xusb_padctl_set_vbus_override(xudc->padctl, true);
+			phy_set_mode_ext(xudc->utmi_phy, PHY_MODE_USB_OTG,
+					 USB_ROLE_NONE);
+			phy_set_mode_ext(xudc->utmi_phy, PHY_MODE_USB_OTG,
+					 USB_ROLE_DEVICE);
+
 			xudc->wait_csc = false;
 		}
 	}
-- 
2.7.4

