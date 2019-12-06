Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA414114F61
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 11:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbfLFKwd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 05:52:33 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18872 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbfLFKwb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 05:52:31 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dea32de0000>; Fri, 06 Dec 2019 02:52:14 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 06 Dec 2019 02:52:30 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 06 Dec 2019 02:52:30 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 10:52:30 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 6 Dec 2019 10:52:30 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.64.167]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5dea32ea0005>; Fri, 06 Dec 2019 02:52:29 -0800
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH 18/18] arm64: tegra: Enable xudc node on Jetson TX2
Date:   Fri, 6 Dec 2019 16:20:21 +0530
Message-ID: <1575629421-7039-19-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
References: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1575629534; bh=s6b/aqJTd/foXAYWDXdf7tVRvW+TZX5BlDC2GdSaxOI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=pigIwiupmzg+hqhmQ3v+o7qdCjDDta0LhbSSuDV6HUqVec7YHzDc64s1eWXrmjEuA
         KYq5WMsHgIGCFySvYTwhEVsWlh9Z57AxoREKBzIvOZEBay5uIZkbkHpylyLQx6Xbv9
         4LhwQ8lelPo7uC8yGzJNPikfdDFYQvgrCmxElA0p/jUC5iI11wBVawiJ0ZmBaU9+ve
         EMCwaIHugH5begUZ3lHbOwj9zd850V/0XT+BYzLPE5ZtNgBgm8cT+XQFEWS1oNbZcg
         IvkI516WngqEUNTsCdQUKs75kveJ7a+SKGnEHmprcuJXatS5YgKtdJFekc08rhFXoe
         jlKXlMVWmdnBA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable XUSB device mode driver for USB 2-0 slot on Jetson TX2.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index a1dcdb9..d7628f5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -131,7 +131,7 @@
 				status = "okay";
 
 				lanes {
-					usb2-0 {
+					micro_b: usb2-0 {
 						nvidia,function = "xusb";
 						status = "okay";
 					};
@@ -213,6 +213,13 @@
 		phy-names = "usb2-0", "usb2-1", "usb3-0";
 	};
 
+	usb@3550000 {
+		status = "okay";
+
+		phys = <&micro_b>;
+		phy-names = "usb2-0";
+	};
+
 	i2c@c250000 {
 		/* carrier board ID EEPROM */
 		eeprom@57 {
-- 
2.7.4

