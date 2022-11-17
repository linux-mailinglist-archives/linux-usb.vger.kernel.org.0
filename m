Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23E6D62D81C
	for <lists+linux-usb@lfdr.de>; Thu, 17 Nov 2022 11:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239570AbiKQKhN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Nov 2022 05:37:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234602AbiKQKhF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Nov 2022 05:37:05 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A0E84391DF;
        Thu, 17 Nov 2022 02:37:02 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB436D6E;
        Thu, 17 Nov 2022 02:37:08 -0800 (PST)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94EB63F73B;
        Thu, 17 Nov 2022 02:37:00 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bin Liu <b-liu@ti.com>
Cc:     Icenowy Zheng <uwu@icenowy.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, soc@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev
Subject: [PATCH v4 00/11] ARM: suniv: USB and two new boards support
Date:   Thu, 17 Nov 2022 10:36:45 +0000
Message-Id: <20221117103656.1085840-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is an update and rebase of the former v3 series.
It now cleanly applies and builds on top of linux-sunxi/sunxi/for-next,
this is also the tree those patches should go through.
To make dtbs_check pass, we need three more binding patches, the LRADC
and I2C ones are in linux-next, the PHY binding [1] should end up there
hopefully soon.
To get a working image, one needs linux-next, plus the PHY support patch
[2]. Sorry for the mess, this is due to the PHY patches going through a
different tree, and they depend on the H616 changes only available there.
If there are any questions or advice how to solve this better, please
approach me via email or IRC.
I put a tree with all the requirements on top here:
https://github.com/apritzel/linux/commits/f1c100s-usb-v4

Code-wise there were only smaller changes, see the changelog below.
I put my Lctech Pi DT series on top, since it has the same USB
dependencies as the Popstick DT.

[1] https://lore.kernel.org/linux-arm-kernel/20221116151603.819533-2-andre.przywara@arm.com/
[2] https://lore.kernel.org/linux-arm-kernel/20221116151603.819533-3-andre.przywara@arm.com/

================
This patchset introduces support for F1C100s' USB, and the SourceParts
PopStick and Lctech Pi boards.

The DT binding and driver support for SUNIV USB MUSB device are added, in
addition to DT changes to the DTSI and Lichee Nano DT. New DTs are added
for the SourceParts PopStick v1.1 and Lctech Pi boards.

Changelog v3 ... v4:
- Dropped the PHY patches, they go via a different tree and need a
  different base
- rebased on top of linux-sunxi/sunxi/for-next (provides H616 USB)
- musb DT binding: use enum
- musb cleanup: use musb_hdrc_config config pointer directly
- musb cleanup: use const where possible
- drop partitions from Popstick DTS file
- clarify Popstick has a USB type-A *plug*
- add tags

Changelog v2 ... v3:
- remove redundant "Device Tree Bindings" suffix in DT binding doc title
- add BSD license to binding doc file (as per checkpatch)
- fix some commit message title prefixes
- use proper plural spelling for usb0_id_det-gpios
- popstick.dts: Reorder otg_sram node reference alphabetically
- popstick.dts: Add regulator- prefix to 3.3V regulator node name
- popstick.dts: Fix status, compatible and reg property order
- popstick.dts: Drop unneeded mmc0 and spi0 aliases
- add patch to clean up sunxi MUSB driver
- add Acks and Reviewed-by's

Changelog v1 ... v2:
- USB PHY binding: clarify the relation with other phy-sun4i-usb bindings
- Add Popstick binding and .dts patches

Andre Przywara (4):
  usb: musb: sunxi: Introduce config struct
  dt-bindings: vendor-prefixes: add Lctech name
  dt-bindings: arm: sunxi: add compatible strings for Lctech Pi
  ARM: dts: suniv: Add Lctech Pi F1C200s devicetree

Icenowy Zheng (7):
  dt-bindings: usb: sunxi-musb: add F1C100s MUSB compatible string
  usb: musb: sunxi: add support for the F1C100s MUSB controller
  ARM: dts: suniv: add USB-related device nodes
  ARM: dts: suniv: licheepi-nano: enable USB
  dt-bindings: vendor-prefixes: add Source Parts
  dt-binding: arm: sunxi: add compatible strings for PopStick v1.1
  ARM: dts: suniv: add device tree for PopStick v1.1

 .../devicetree/bindings/arm/sunxi.yaml        | 13 +++
 .../usb/allwinner,sun4i-a10-musb.yaml         | 10 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |  4 +
 arch/arm/boot/dts/Makefile                    |  4 +-
 .../boot/dts/suniv-f1c100s-licheepi-nano.dts  | 16 +++
 arch/arm/boot/dts/suniv-f1c100s.dtsi          | 32 ++++++
 arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts | 76 ++++++++++++++
 .../boot/dts/suniv-f1c200s-popstick-v1.1.dts  | 81 +++++++++++++++
 drivers/usb/musb/sunxi.c                      | 99 +++++++++++++------
 9 files changed, 301 insertions(+), 34 deletions(-)
 create mode 100644 arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts
 create mode 100644 arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts

-- 
2.25.1

