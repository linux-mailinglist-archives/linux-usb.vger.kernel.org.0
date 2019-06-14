Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4410B456A5
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 09:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbfFNHrR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jun 2019 03:47:17 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16045 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbfFNHrR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jun 2019 03:47:17 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0351040000>; Fri, 14 Jun 2019 00:47:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 14 Jun 2019 00:47:16 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 14 Jun 2019 00:47:16 -0700
Received: from jckuo-lt.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 07:47:14 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <pdeschrijver@nvidia.com>,
        <afrid@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>,
        <skomatineni@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH 0/8] Tegra XHCI controller ELPG support
Date:   Fri, 14 Jun 2019 15:46:48 +0800
Message-ID: <20190614074652.21960-1-jckuo@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560498436; bh=8u3amQ38YMlftXEJnPfMiHDFL4HnCwY6N58gDQB7uBY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-Originating-IP:X-ClientProxiedBy:Content-Type;
        b=G+nCVAFF2alK7yY5BCT8z0KH9ZT2lbD6PEMPcs75CkhkRHX7sPnLSqac455hwkhA/
         Aw8m3u02N9lVnOCk3IgSEbEayjBZEorC+oebrQ4rP5MFrCnL98E+gXAtEP/eCLdKVA
         ErEXwWXdL6+G5Xw/c1jN0pkE40BoSYaw/nCPf4lxGIb0+SvuTvI9V6xgTLF3LHv3IE
         D/qyJjt1yZf4SSkJ+MJJq5Y6m8F4U5TOjTNDh3zVZOziZxonvBo8j2J36j8FnY+i45
         apjbzD8aE4zYvTb3IjKUJbCcIAcF80KsFR3gt5++gbKy7RBv++Do2vg/UYWGj2HloD
         J4uDJGK38r2Ow==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tegra XHCI controler can be placed in ELPG (Engine Level PowerGate)
state for power saving when all of the connected USB devices are in
suspended state. This patch series includes clk, phy and pmc changes
that are required for properly place controller in ELPG and bring
controller out of ELPG.


JC Kuo (8):
  clk: tegra: Add PLLE HW power sequencer control
  clk: tegra: don't enable PLLE HW sequencer at init
  phy: tegra: xusb: t210: rearrange UPHY init
  phy: tegra: xusb: add sleepwalk and suspend/resume
  soc/tegra: pmc: support T210 USB 2.0 Sleepwalk
  phy: tegra: xusb: t210: support wake and sleepwalk
  arm64: tegra: add Tegra210 XUSB PADCTL irq
  xhci: tegra: enable ELPG for runtime/system PM

 arch/arm64/boot/dts/nvidia/tegra210.dtsi |    3 +-
 drivers/clk/tegra/clk-pll.c              |   12 -
 drivers/clk/tegra/clk-tegra210.c         |   45 +
 drivers/phy/tegra/xusb-tegra210.c        | 1023 +++++++++++++++++-----
 drivers/phy/tegra/xusb.c                 |   80 +-
 drivers/phy/tegra/xusb.h                 |   10 +
 drivers/soc/tegra/pmc.c                  |  462 ++++++++++
 drivers/usb/host/xhci-tegra.c            |  802 ++++++++++++++---
 include/linux/clk/tegra.h                |    2 +
 include/linux/phy/tegra/xusb.h           |   12 +
 include/soc/tegra/pmc.h                  |   13 +
 11 files changed, 2108 insertions(+), 356 deletions(-)

-- 
2.17.1

