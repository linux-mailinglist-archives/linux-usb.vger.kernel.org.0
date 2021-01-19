Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD6802FB4A7
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 09:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731337AbhASI5G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 03:57:06 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6127 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbhASI4s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 03:56:48 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60069e9a0001>; Tue, 19 Jan 2021 00:55:54 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 08:55:51 +0000
Received: from jckuo-lt.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Jan 2021 08:55:48 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v6 00/15] Tegra XHCI controller ELPG support
Date:   Tue, 19 Jan 2021 16:55:31 +0800
Message-ID: <20210119085546.725005-1-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611046554; bh=ZON5aretQ9H8PdWHEDTWVkej22AqCFg+dYWyS+Qc2Gw=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=FgynQo34dMFfU3/ULN/PgTavt3S/U9PgwdecmQaKZE3acZTDBTraO1Fkpms1mznWB
         fh4VHGFhr00HoLJA1varZ+bZFym/n+dhQBjrBbrAh/7RZFSI00S6Ad8jzvXASmsTvc
         CC4/DDbPpvR+zbAwq9Bll2zlbNDjGkN2V+60IBiN3qiXTpwHchGJpZUzxTu7+qVfqT
         BKs2tJykDblrD5lWj9XvWm2vNVHDjaCtr/5eWsHlyTGLWsQEs0RKGBGCmwSZQpQyE8
         95A8wQocFy51JIHuaT2SbXPh1iexRtNQQZpKD9FoTig5HZ7Dk6o0FNWZbNmkL+Bo8R
         Eu6NMVN5oEk5Q==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tegra XHCI controler can be placed in ELPG (Engine Level PowerGated)
state for power saving when all of the connected USB devices are in
suspended state. This patch series includes clk, phy and pmc changes
that are required for properly place controller in ELPG and bring
controller out of ELPG.

JC Kuo (15):
  clk: tegra: Add PLLE HW power sequencer control
  clk: tegra: Don't enable PLLE HW sequencer at init
  phy: tegra: xusb: Move usb3 port init for Tegra210
  phy: tegra: xusb: tegra210: Do not reset UPHY PLL
  phy: tegra: xusb: Rearrange UPHY init on Tegra210
  phy: tegra: xusb: Add Tegra210 lane_iddq operation
  phy: tegra: xusb: Add sleepwalk and suspend/resume
  soc/tegra: pmc: Provide USB sleepwalk register map
  arm64: tegra210: XUSB PADCTL add "nvidia,pmc" prop
  dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
  phy: tegra: xusb: Add wake/sleepwalk for Tegra210
  phy: tegra: xusb: Tegra210 host mode VBUS control
  phy: tegra: xusb: Add wake/sleepwalk for Tegra186
  usb: host: xhci-tegra: Unlink power domain devices
  xhci: tegra: Enable ELPG for runtime/system PM

 .../phy/nvidia,tegra124-xusb-padctl.txt       |    1 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |    1 +
 drivers/clk/tegra/clk-pll.c                   |   12 -
 drivers/clk/tegra/clk-tegra210.c              |   53 +-
 drivers/phy/tegra/xusb-tegra186.c             |  558 ++++-
 drivers/phy/tegra/xusb-tegra210.c             | 1889 +++++++++++++----
 drivers/phy/tegra/xusb.c                      |   92 +-
 drivers/phy/tegra/xusb.h                      |   22 +-
 drivers/soc/tegra/pmc.c                       |   94 +
 drivers/usb/host/xhci-tegra.c                 |  613 ++++--
 include/linux/clk/tegra.h                     |    4 +-
 include/linux/phy/tegra/xusb.h                |   10 +-
 12 files changed, 2784 insertions(+), 565 deletions(-)

v5 "arm64: tegra210/tegra186/tegra194: XUSB PADCTL irq" has been
merged separately.
--=20
2.25.1

