Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C820CC0B0
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 18:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388148AbfJDQ3Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 12:29:24 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14630 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387609AbfJDQ3W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Oct 2019 12:29:22 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d9773610001>; Fri, 04 Oct 2019 09:29:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 04 Oct 2019 09:29:21 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 04 Oct 2019 09:29:21 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 4 Oct
 2019 16:29:21 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 4 Oct
 2019 16:29:20 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 4 Oct 2019 16:29:20 +0000
Received: from jckuo-lt.nvidia.com (Not Verified[10.19.101.223]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d97735e0000>; Fri, 04 Oct 2019 09:29:20 -0700
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, <skomatineni@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v3 3/7] phy: tegra: xusb: Protect Tegra186 soc with config
Date:   Sat, 5 Oct 2019 00:29:02 +0800
Message-ID: <20191004162906.4818-4-jckuo@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004162906.4818-1-jckuo@nvidia.com>
References: <20191004162906.4818-1-jckuo@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1570206561; bh=N/rSGgOURBqV0HziIOfjaxU35LnrIyMkeuD7ZkvVrw8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=jTS5UguIuK8j0VntFsKn3a4bq9CMS9vqHprugIhLw1tHZlJMz+ZXWaFcIs17O42pf
         ISY4wqCLKuHXbCIaDFmekKx8hA3cIrP9t1ao3T20LLcofC0fEdGDwzNFfFXClv6rvB
         0XEA/mu0ACWigS3O3lhs354ns1VHAY9Duvs+cnUu1oAbb3UtdM+Uf/Qr9jVCYCXjk2
         sssoIKgq5BJWvA+4PquDSWAQbcxpYmzB8n37//pXo4z8301Z8Nj2VjhaRpBMqICOoK
         v6cS4qWVMEUeoWqUCml1crGpyegTpp9RZeT9MOVtRdexvvJvhTlYoIg+6ZVTZTF5gW
         Z4FVyjmW/snJw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As xusb-tegra186.c will be reused for Tegra194, it would be good to
protect Tegra186 soc data with CONFIG_ARCH_TEGRA_186_SOC. This commit
also reshuffles Tegra186 soc data single CONFIG_ARCH_TEGRA_186_SOC
will be sufficient.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
Changes in v3: none
Changes in v2:
- new patch to protect Tegra186 soc data with config

 drivers/phy/tegra/xusb-tegra186.c | 70 ++++++++++++++++---------------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 6f3afaf9398f..3b60270f2009 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -503,19 +503,6 @@ static const char * const tegra186_usb2_functions[] = {
 	"xusb",
 };
 
-static const struct tegra_xusb_lane_soc tegra186_usb2_lanes[] = {
-	TEGRA186_LANE("usb2-0", 0,  0, 0, usb2),
-	TEGRA186_LANE("usb2-1", 0,  0, 0, usb2),
-	TEGRA186_LANE("usb2-2", 0,  0, 0, usb2),
-};
-
-static const struct tegra_xusb_pad_soc tegra186_usb2_pad = {
-	.name = "usb2",
-	.num_lanes = ARRAY_SIZE(tegra186_usb2_lanes),
-	.lanes = tegra186_usb2_lanes,
-	.ops = &tegra186_usb2_pad_ops,
-};
-
 static int tegra186_usb2_port_enable(struct tegra_xusb_port *port)
 {
 	return 0;
@@ -765,27 +752,6 @@ static const char * const tegra186_usb3_functions[] = {
 	"xusb",
 };
 
-static const struct tegra_xusb_lane_soc tegra186_usb3_lanes[] = {
-	TEGRA186_LANE("usb3-0", 0,  0, 0, usb3),
-	TEGRA186_LANE("usb3-1", 0,  0, 0, usb3),
-	TEGRA186_LANE("usb3-2", 0,  0, 0, usb3),
-};
-
-static const struct tegra_xusb_pad_soc tegra186_usb3_pad = {
-	.name = "usb3",
-	.num_lanes = ARRAY_SIZE(tegra186_usb3_lanes),
-	.lanes = tegra186_usb3_lanes,
-	.ops = &tegra186_usb3_pad_ops,
-};
-
-static const struct tegra_xusb_pad_soc * const tegra186_pads[] = {
-	&tegra186_usb2_pad,
-	&tegra186_usb3_pad,
-#if 0 /* TODO implement */
-	&tegra186_hsic_pad,
-#endif
-};
-
 static int
 tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl *padctl)
 {
@@ -862,6 +828,7 @@ static const struct tegra_xusb_padctl_ops tegra186_xusb_padctl_ops = {
 	.remove = tegra186_xusb_padctl_remove,
 };
 
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
 static const char * const tegra186_xusb_padctl_supply_names[] = {
 	"avdd-pll-erefeut",
 	"avdd-usb",
@@ -869,6 +836,40 @@ static const char * const tegra186_xusb_padctl_supply_names[] = {
 	"vddio-hsic",
 };
 
+static const struct tegra_xusb_lane_soc tegra186_usb2_lanes[] = {
+	TEGRA186_LANE("usb2-0", 0,  0, 0, usb2),
+	TEGRA186_LANE("usb2-1", 0,  0, 0, usb2),
+	TEGRA186_LANE("usb2-2", 0,  0, 0, usb2),
+};
+
+static const struct tegra_xusb_pad_soc tegra186_usb2_pad = {
+	.name = "usb2",
+	.num_lanes = ARRAY_SIZE(tegra186_usb2_lanes),
+	.lanes = tegra186_usb2_lanes,
+	.ops = &tegra186_usb2_pad_ops,
+};
+
+static const struct tegra_xusb_lane_soc tegra186_usb3_lanes[] = {
+	TEGRA186_LANE("usb3-0", 0,  0, 0, usb3),
+	TEGRA186_LANE("usb3-1", 0,  0, 0, usb3),
+	TEGRA186_LANE("usb3-2", 0,  0, 0, usb3),
+};
+
+static const struct tegra_xusb_pad_soc tegra186_usb3_pad = {
+	.name = "usb3",
+	.num_lanes = ARRAY_SIZE(tegra186_usb3_lanes),
+	.lanes = tegra186_usb3_lanes,
+	.ops = &tegra186_usb3_pad_ops,
+};
+
+static const struct tegra_xusb_pad_soc * const tegra186_pads[] = {
+	&tegra186_usb2_pad,
+	&tegra186_usb3_pad,
+#if 0 /* TODO implement */
+	&tegra186_hsic_pad,
+#endif
+};
+
 const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc = {
 	.num_pads = ARRAY_SIZE(tegra186_pads),
 	.pads = tegra186_pads,
@@ -893,6 +894,7 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc = {
 	.num_supplies = ARRAY_SIZE(tegra186_xusb_padctl_supply_names),
 };
 EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
+#endif
 
 MODULE_AUTHOR("JC Kuo <jckuo@nvidia.com>");
 MODULE_DESCRIPTION("NVIDIA Tegra186 XUSB Pad Controller driver");
-- 
2.17.1

