Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82BF91FF9F
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 08:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbfEPGkQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 02:40:16 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:4907 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfEPGkQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 May 2019 02:40:16 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdd05d30000>; Wed, 15 May 2019 23:40:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 15 May 2019 23:40:13 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 15 May 2019 23:40:13 -0700
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 06:40:12 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 16 May 2019 06:40:13 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cdd05ca0003>; Wed, 15 May 2019 23:40:12 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V3 0/8] Tegra XUSB gadget driver support 
Date:   Thu, 16 May 2019 12:09:24 +0530
Message-ID: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557988820; bh=3GfE5X2VVKBA2g15MaDixjGxzqaJGLU7eTXrPcvBu00=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=CGG9aKeiZS7UlfEzh6/hZNx3/pZwt2r8zsGVVfHpRFGwxoLVBC0EXEaCYiyMZOGaj
         2TT5/Khhiizg8zo4Zdmri57wQnLd4QYsHkMo8NAz1Y7riW4B2QOU01PUXv3Ynk9qnh
         Rfj+CghApLkmaXdI7mpjSazf+CBO+G1m2qn1olpuKJDNi6+j9M/k7QCJdIiftHSVbL
         wMPuqdXN60TdX+KGobL2agBrL6yM0/0/oIUJLTTfG0PEEPQptkDAqafm6T8Mu/ICnh
         KSkjS340/ADObj6deGMbr1qKfZC0AvtY1NDvqqu/YDw8qFvrqHAKBQ0IRkYkUZLs5N
         aum+8OXusSdIQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is the third verion of series "Tegra XUSB gadget driver support"

Patches 1-3 are phy driver changes to add support for device
mode.
Patches 4-7 are changes related to XUSB device mode
controller driver.
Patch 8 is to enable XUDC driver in defconfig

Test Steps(USB 2.0):
- Enable "USB Gadget precomposed configurations" in defconfig
- Build, flash and boot Jetson TX1
- Connect Jetson TX1 and Ubuntu device using USB A to Micro B
  cable
- After boot on Jetson TX1 terminal usb0 network device should be
  enumerated
- Assign static ip to usb0 on Jetson TX1 and corresponding net
  device on ubuntu
- Run ping test and transfer test(used scp) to check data transfer
  communication

SS mode is verified by enabling Type A port as peripheral

---
V3:
* Rebased patch 1 to top of tree.
* Fixed bug in patch 2, where xudc interrupts dont get generated if USB host
  mode fails to probe. Moved fake port detection logic to generic xusb.c. fake
  usb port data is updated based on soc flag need_fake_usb3_port.
* Added extra lines whereever necessary to make code more readable in patch 3
  and 7.
* dt binding doc is corrected for typos and extcon references. Also added
  details for clocks and removed xusb_ references to clock and power-domain
  names and accordingly patch 5 is updated.
* removed avdd-pll-utmip-supply in patch 6, as its now part of padctl driver.
* Patch 8 has no changes.
---
V2:
* Patches 1-3 are new patches in this series, which splits unified features
  patch to speprated features and removes need of port-fake entry in DT.
* Patch 4 is re-arragend dt-bindings patch which incorporates previous
  patch comments to sort DT entries alphabetically, addresses name changes
  and PM domain details added.
* Patch 5-6 are re-arranged DT patches with major changes - sort entries
  alphabetically, and adds clock names.
* Patch 7 is UDC driver tegra XUSB device mode controller with major
  changes - remove un-used module params, lockinng for device_mode flag,
  moving un-needed info logs to debug level, making changes feature flag
  dependent rather than SOC based macros and other error handling in probe.
* Patch 8 has no changes.

Nagarjuna Kristam (8):
  phy: tegra: xusb: t210: add XUSB dual mode support
  phy: tegra: xusb: t210: add usb3 port fake support
  phy: tegra: xusb: t210: add vbus override support
  dt-bindings: usb: Add  NVIDIA Tegra XUSB device mode controller
    binding
  arm64: tegra: Add xudc node for Tegra210
  arm64: tegra: Enable xudc on Jetson TX1
  usb: gadget: Add UDC driver for tegra XUSB device mode controller
  arm64: defconfig: Enable tegra XUDC driver

 .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  |  101 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   14 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   19 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/phy/tegra/xusb-tegra210.c                  |  137 +-
 drivers/phy/tegra/xusb.c                           |   91 +
 drivers/phy/tegra/xusb.h                           |    4 +
 drivers/usb/gadget/udc/Kconfig                     |   10 +
 drivers/usb/gadget/udc/Makefile                    |    1 +
 drivers/usb/gadget/udc/tegra_xudc.c                | 3807 ++++++++++++++++++++
 include/linux/phy/tegra/xusb.h                     |    6 +-
 11 files changed, 4186 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
 create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c

-- 
2.7.4

