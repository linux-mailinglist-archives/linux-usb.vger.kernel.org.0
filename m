Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 871542DE78E
	for <lists+linux-usb@lfdr.de>; Fri, 18 Dec 2020 17:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgLRQno (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Dec 2020 11:43:44 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:15985 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgLRQno (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Dec 2020 11:43:44 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fdcdc170001>; Fri, 18 Dec 2020 08:43:03 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Dec
 2020 16:43:01 +0000
Received: from jckuo-lt.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 18 Dec 2020 16:42:59 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <mathias.nyman@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <robh@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH] xhci: tegra: Delay for disabling LFPS detector
Date:   Sat, 19 Dec 2020 00:42:34 +0800
Message-ID: <20201218164234.128762-1-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1608309783; bh=dX1OHAKyCwaFYNdxLad4ue/GK0kWXogxQXR0HulKU8A=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=pnhE50GJuDbyFXgiSFgnCKLDDmCOBF565ou8kXb7nmqLk0MIR7eZrxoxYQ0ZZJS9B
         aSKlrvhuWNZh7AvPM26JVLETYFClnefsJldnk+umXTJ5+jylpi8lRWPBwxg7uAR2q8
         W53036JDr/rId31n0OBiHZtvWraKcdCPLJonGker0VsbGmcnyfof0EdoO3cHxoN6cX
         nDWmi5ohKdbWwEKac3mtpNfWoU+dJODzJqhHNmnn86L6KkeSTN9tRqXifNtUWKM6fB
         jlfhsC8KrQjBl2xIcgZkconMTCrvQ/BPWqGHrzom/SgcKzEmOynd0envgubUPwkAAf
         Q8so9Ae1aF+uA==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Occasionally, we are seeing some SuperSpeed devices resumes right after
being directed to U3. This commits add 500us delay to ensure LFPS
detector is disabled before sending ACK to firmware.

[   16.099363] tegra-xusb 70090000.usb: entering ELPG
[   16.104343] tegra-xusb 70090000.usb: 2-1 isn't suspended: 0x0c001203
[   16.114576] tegra-xusb 70090000.usb: not all ports suspended: -16
[   16.120789] tegra-xusb 70090000.usb: entering ELPG failed

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 934be1686352..20cdc11f7dc6 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -623,6 +623,12 @@ static void tegra_xusb_mbox_handle(struct tegra_xusb *=
tegra,
 								     enable);
 			if (err < 0)
 				break;
+
+			/*
+			 * wait 500us for LFPS detector to be disabled before sending ACK
+			 */
+			if (!enable)
+				usleep_range(500, 1000);
 		}
=20
 		if (err < 0) {
--=20
2.25.1

