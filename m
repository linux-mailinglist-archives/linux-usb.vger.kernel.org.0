Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12989157081
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 09:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbgBJINh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 03:13:37 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8997 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727952AbgBJINd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 03:13:33 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e4110910000>; Mon, 10 Feb 2020 00:13:05 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 10 Feb 2020 00:13:32 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 10 Feb 2020 00:13:32 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 08:13:32 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 10 Feb 2020 08:13:32 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e4110a80006>; Mon, 10 Feb 2020 00:13:31 -0800
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V5 19/21] ARM: tegra: Remove USB 2-0 port from Jetson TK1 padctl
Date:   Mon, 10 Feb 2020 13:41:45 +0530
Message-ID: <1581322307-11140-20-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581322385; bh=ubaetm8OUNUdZNYHzUJTT58gI6zfbaLg+OW3BrWOvPM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=WNJr5yzY3QQLTXcJsxJU4XwluoHn8tUymLEnWRjmBNfVnh0D0P4zq/a9OZDrbwz7J
         tP1EXd6DC61/2Ox673ukFvJvIlZKZpmRt8MvTqX5/qiONhR/Qmm084fKD2z8zg2kXY
         OZT9X+qYegDAfJyLKy4O1/dXm1VfnZTKVIQKsN+CfuAJcUji9VN5Wh2LIctPMMNmR6
         VZ1PTOxibXe07qpA/j+VVgvbvpVgNpYBYtTCCQTyjdjIKxuTsgwGgBsABvRKWSgOzF
         Nfx3VqdWCD/sFBKrBa/FhZoYoo5CAFkePvl0EZ8qGT+In0sl7A/GcYKkaJxruDMw/s
         zkx+w63IhzoBA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Jetson TK1 USB 2-0 port is controlled by phy-tegra-usb driver
rather than padctl driver. Remove the entry for the same.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
V5:
 - No changes.
---
V4:
 - New patch in the series.
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index d5fd642..54600ff 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1782,12 +1782,6 @@
 		};
 
 		ports {
-			/* Micro A/B */
-			usb2-0 {
-				status = "okay";
-				mode = "otg";
-			};
-
 			/* Mini PCIe */
 			usb2-1 {
 				status = "okay";
-- 
2.7.4

