Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DED4114F4B
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 11:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfLFKwI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 05:52:08 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:19273 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfLFKwH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 05:52:07 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dea32d10000>; Fri, 06 Dec 2019 02:52:01 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 06 Dec 2019 02:52:05 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 06 Dec 2019 02:52:05 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 10:52:05 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 6 Dec 2019 10:52:04 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.64.167]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5dea32d10004>; Fri, 06 Dec 2019 02:52:04 -0800
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH 11/18] usb: gadget: tegra-xudc: use phy_set_mode to set/unset device mode
Date:   Fri, 6 Dec 2019 16:20:14 +0530
Message-ID: <1575629421-7039-12-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
References: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1575629521; bh=u1bcDz40B7dNymk8/LJ6X91ysvNdnPjo7xWL7ST0U6o=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=mPORBE6x2RQWkdNR1I/n2phHfPRJ8kMfNgjIkp6zYICbFYs9N09M+AP92Wjx0bqvx
         8Qs70rHZ9CUreTKKrlrxgAv+4eqrqyUEal+lpS4Wn1V+YIqh89E3jUi4OmWU8xMOla
         Sj8OxkXWBLcsRawKqCeMDnmg9ZX09uX9JTXjvoOd66aHvD0HFIQ1PoSN796SIr89+M
         I410bQ4DTpP9xPMpXr5vQ/CPKCxRk+OxJg5Kqo92lL6jiO+pc6jEflptgm7nOEp7iK
         HfwvqfAHmRAsAFj5F8a2+TwMWBqc882MiJkFkuWUDaDHfYIyh0OvdxpaIpP2HC2wYS
         Qq7kk+dVKHN0Q==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When device mode is set/uset, vbus override activity is done via
exported functions from padctl driver. Use phy_set_mode instead.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 0f27d57..283c320 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -615,7 +615,7 @@ static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
 
 	dev_dbg(xudc->dev, "device mode on\n");
 
-	tegra_xusb_padctl_set_vbus_override(xudc->padctl, true);
+	phy_set_mode_ext(xudc->utmi_phy, PHY_MODE_USB_OTG, USB_ROLE_DEVICE);
 
 	xudc->device_mode = true;
 
@@ -636,7 +636,7 @@ static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
 
 	reinit_completion(&xudc->disconnect_complete);
 
-	tegra_xusb_padctl_set_vbus_override(xudc->padctl, false);
+	phy_set_mode_ext(xudc->utmi_phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
 
 	pls = (xudc_readl(xudc, PORTSC) & PORTSC_PLS_MASK) >>
 		PORTSC_PLS_SHIFT;
@@ -716,9 +716,11 @@ static void tegra_xudc_plc_reset_work(struct work_struct *work)
 
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

