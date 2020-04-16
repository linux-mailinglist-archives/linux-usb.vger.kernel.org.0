Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57AD61ABA04
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 09:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439349AbgDPHeq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 03:34:46 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6231 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438944AbgDPHep (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Apr 2020 03:34:45 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e980a870001>; Thu, 16 Apr 2020 00:34:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 16 Apr 2020 00:34:44 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 16 Apr 2020 00:34:44 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Apr
 2020 07:34:44 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 16 Apr 2020 07:34:44 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e980a910000>; Thu, 16 Apr 2020 00:34:44 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V1 0/4] Tegra XUDC support on Tegra194 Soc
Date:   Thu, 16 Apr 2020 13:04:16 +0530
Message-ID: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587022471; bh=WGWsXBGjVNAF9MTyr/8Av9p7t7MtwWUDSCVP9RaLjYU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=Cvry6dAqsoE//M0k5t/Ig/f/O6aNpjTasH5/9RZxrnFQLm9Zb2qXn1LHK8VHzBT9U
         hUlLfwRqhu7iGm17G70Yu6C8TP3StMEB+cMSbFsFFusG0VKLTl3jluSqhl0yFaK3k7
         XneTv3btVWvmR8KAIdwhxwU+ezxHc8SvWncsVH4CTca0NysFXSPn8fovumLdEtcN4o
         JI22c1TZOpJlMvCvg6wEIhXh0EurT7uJ9sUi7neh8EvHiBobsryQ3pUWO/rwCqfy3F
         B2oL7ocn+ruL+28aSLXQXScvEzDH1IzWRvbCEJmUw+eIlg/oiMt8rsyBMAIm39z1Ea
         SoLNJjhTg97iw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series adds support for XUSB Device Mode support on Tegra194 SoCs.

This patchset is composed with:
 - dt bindings of XUDC driver.
 - dt changes to add xudc node on Tegra194 Soc.
 - USB driver changes to tegra-xudc to add support on Tegra194 Soc. 

Nagarjuna Kristam (4):
  dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB controller support
  arm64: tegra: Add xudc node for Tegra194
  usb: gadget: tegra-xudc: Add Tegra194 support
  usb: gadget: tegra-xudc: add port_speed_quirk

 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml |   2 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  18 +++
 drivers/usb/gadget/udc/tegra-xudc.c                | 130 +++++++++++++++++++++
 3 files changed, 150 insertions(+)

-- 
2.7.4

