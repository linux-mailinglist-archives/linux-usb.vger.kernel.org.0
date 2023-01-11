Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD87665148
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jan 2023 02:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233578AbjAKBxl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 20:53:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbjAKBxk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 20:53:40 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3628AC3A;
        Tue, 10 Jan 2023 17:53:39 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDF2BFEC;
        Tue, 10 Jan 2023 17:54:20 -0800 (PST)
Received: from donnerap.cambridge.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C6333F67D;
        Tue, 10 Jan 2023 17:53:36 -0800 (PST)
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
Subject: [PATCH v5 00/11] ARM: suniv: USB and two new boards support
Date:   Wed, 11 Jan 2023 01:53:21 +0000
Message-Id: <20230111015332.172021-1-andre.przywara@arm.com>
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

Hi,

this is mostly a rebase of the former v4 series.
It is based on top of v6.2-rc1, and builds cleanly there. For passing
make dtbs_check, the PHY binding patch, part of a separate series[1], is
needed. For USB functionality, patch 2/3 from there is needed as well.

I put a tree with both series combined here:
https://github.com/apritzel/linux/commits/f1c100s-usb-v5

There were no changes to the actual patches, this is just a resend since
the series missed the previous merge window.

Cheers,
Andre

[1] https://lore.kernel.org/linux-phy/20230109012223.4079299-1-andre.przywara@arm.com/

================
This patchset introduces support for F1C100s' USB, and the SourceParts
PopStick and Lctech Pi boards.

The DT binding and driver support for SUNIV USB MUSB device are added, in
addition to DT changes to the DTSI and Lichee Nano DT. New DTs are added
for the SourceParts PopStick v1.1 and Lctech Pi boards.

Changelog v4 ... v5:
- Rebase on top to v6.2-rc1

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


base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
prerequisite-patch-id: 7734c0032dcc073e59f0217ee47ff023f0b47bcf
-- 
2.25.1

