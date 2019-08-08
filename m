Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7729285EB7
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 11:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732620AbfHHJiM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 05:38:12 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12512 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732589AbfHHJiL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 05:38:11 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d4bed83000b>; Thu, 08 Aug 2019 02:38:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 08 Aug 2019 02:38:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 08 Aug 2019 02:38:10 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Aug
 2019 09:38:09 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 8 Aug 2019 09:38:09 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d4bed7f0001>; Thu, 08 Aug 2019 02:38:09 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V6 0/8] Tegra XUSB gadget driver support
Date:   Thu, 8 Aug 2019 15:07:18 +0530
Message-ID: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1565257091; bh=qdUb8V4wtxiO/oXWfuEwtivWCMJqc18gOwIUaAnNx1o=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=YM3QoPyIiJk6IFDzDkBbWEgMAoBNoIs/Qw4aQkhO388OXtewLCYi764FvP3uabTB8
         I6pK3fSMIksE+Hf9VurWZykRo1gmlcW9oCb0X4E13whU+XOghQMci7CzoMP41H383s
         DAJbSRtuZRilKLfCfcROoT1GcU3hzk2wyaxI13kxKCPAeplW0jjqtZTfdPNmD8atpe
         0U+X/OenjYeRBtvcFK9wcDdFoUSd+Ofh7r2idKHETFskPWg5r6fhaMkEMQ5Bx7wTMW
         74WPraMu/pl/1fkLIX0VzQVJ8s9+z7CDS1yfPBf6ub3chsB8gHJj5C9AJppyXsyVqV
         AvXC86pxjeXmA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is the sixth version of series "Tegra XUSB gadget driver support"

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

This patch series is dependent[1] on
https://patchwork.kernel.org/cover/11056429/

[1] Dependent series doesnot compile on Master branch due to removal of
    switch_fwnode_match() in file drivers/usb/roles/class.c.
    Hence verified current series changes on 5.3-RC3 branch.
---
v6:
* Patches 1,2,3,7,8 - No changes
* Patch 4,5,6 - Comments from Rob addressed, updated usb connector driver
  compatibility string.
---
v5:
* Patches 1-3 - Commit subject updated as per inputs from Thierry
* Patch 4 - Added reg-names used on Tegra210 in the bindings doc
* Enabled xudc driver as module instead of part of kernel in patch 8
* Patched 5-8 - No changes
---
v4:
* patch 1 - no changes
* corrected companion device search based on inputs from Thierry in patch 2
* removed unneeded dev variable and corrected value read in
  tegra210_utmi_port_reset function in patch 3
* dt binding doc and dtb files are corrected for alignments.
  Replaced extcon-usb-gpio with usb role switch.
* Added support for USB role switch instead of extcon-usb-gpio and other minor
  comments as suggested by Chunfeng.
* Enabled xudc driver as module instead of part of kernel in patch 8
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
  phy: tegra: xusb: Add XUSB dual mode support on Tegra210
  phy: tegra: xusb: Add usb3 port fake support on Tegra210
  phy: tegra: xusb: Add vbus override support on Tegra210
  dt-bindings: usb: Add NVIDIA Tegra XUSB device mode controller binding
  arm64: tegra: Add xudc node for Tegra210
  arm64: tegra: Enable xudc on Jetson TX1
  usb: gadget: Add UDC driver for tegra XUSB device mode controller
  arm64: defconfig: Enable tegra XUDC driver

 .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  |  110 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   31 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   19 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/phy/tegra/xusb-tegra210.c                  |  133 +-
 drivers/phy/tegra/xusb.c                           |   87 +
 drivers/phy/tegra/xusb.h                           |    4 +
 drivers/usb/gadget/udc/Kconfig                     |   11 +
 drivers/usb/gadget/udc/Makefile                    |    1 +
 drivers/usb/gadget/udc/tegra_xudc.c                | 3808 ++++++++++++++++++++
 include/linux/phy/tegra/xusb.h                     |    4 +-
 11 files changed, 4205 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
 create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c

-- 
2.7.4

