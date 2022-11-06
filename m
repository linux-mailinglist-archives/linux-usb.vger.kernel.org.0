Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A87C061E326
	for <lists+linux-usb@lfdr.de>; Sun,  6 Nov 2022 16:50:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbiKFPuD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Nov 2022 10:50:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiKFPuB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Nov 2022 10:50:01 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 85A1DE084;
        Sun,  6 Nov 2022 07:50:00 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35B9A1FB;
        Sun,  6 Nov 2022 07:50:06 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 333783F534;
        Sun,  6 Nov 2022 07:49:58 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Icenowy Zheng <uwu@icenowy.me>
Cc:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: [PATCH v3 00/11] ARM: suniv: USB and PopStick board support
Date:   Sun,  6 Nov 2022 15:48:15 +0000
Message-Id: <20221106154826.6687-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is an update to Icenowy's v2 of the series, fixing the smaller
issues mentioned during the review. Also it adds two patches that
improve the quirk handling for the sunxi MUSB and USB PHY driver, as it
was hinted in some replies. I put those patches at the end, to not
jeopardy the actual USB functionality of the Allwinner F1C100s series.
For a changelog see below.
================
This patchset introduces support for F1C100s' USB and SourceParts
PopStick board.

The DT binding and driver support for SUNIV USB PHY/MUSB are added, in
addition to DT changes to the DTSI and Lichee Nano DT. A new DT is added
for SourceParts PopStick v1.1 board.

Changelog v1 ... v2:
- USB PHY binding: clarify the relation with other phy-sun4i-usb bindings
- Add Popstick binding and .dts patches

Changelog v2 ... v3:
- remove redundant "Device Tree Bindings" suffix in DT binding doc title
- add BSD license to binding doc file (as per checkpatch)
- use existing PHY sun4i_a10_phy type instead of inventing new one
- fix some commit message title prefixes
- use proper plural spelling for usb0_id_det-gpios
- popstick.dts: Reorder otg_sram node reference alphabetically
- popstick.dts: Add regulator- prefix to 3.3V regulator node name
- popstick.dts: Fix status, compatible and reg property order
- popstick.dts: Drop unneeded mmc0 and spi0 aliases
- add two patches to clean up sunxi MUSB and USB PHY driver
- add Acks and Reviewed-by's


Andre Przywara (2):
  phy: sun4i-usb: Replace types with explicit quirk flags
  usb: musb: sunxi: Introduce config struct

Icenowy Zheng (9):
  dt-bindings: phy: add binding document for Allwinner F1C100s USB PHY
  dt-bindings: usb: sunxi-musb: add F1C100s MUSB compatible string
  phy: sun4i-usb: add support for the USB PHY on F1C100s SoC
  musb: sunxi: add support for the F1C100s MUSB controller
  ARM: dts: suniv: add USB-related device nodes
  ARM: dts: suniv: licheepi-nano: enable USB
  dt-bindings: vendor-prefixes: add Source Parts
  dt-binding: arm: sunxi: add compatible strings for PopStick v1.1
  ARM: dts: suniv: add device tree for PopStick v1.1

 .../devicetree/bindings/arm/sunxi.yaml        |  7 ++
 .../phy/allwinner,suniv-f1c100s-usb-phy.yaml  | 83 ++++++++++++++++
 .../usb/allwinner,sun4i-a10-musb.yaml         |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm/boot/dts/Makefile                    |  3 +-
 .../boot/dts/suniv-f1c100s-licheepi-nano.dts  | 16 +++
 arch/arm/boot/dts/suniv-f1c100s.dtsi          | 26 +++++
 .../boot/dts/suniv-f1c200s-popstick-v1.1.dts  | 99 +++++++++++++++++++
 drivers/phy/allwinner/phy-sun4i-usb.c         | 58 +++++------
 drivers/usb/musb/sunxi.c                      | 97 +++++++++++++-----
 10 files changed, 335 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/allwinner,suniv-f1c100s-usb-phy.yaml
 create mode 100644 arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts

-- 
2.35.5

