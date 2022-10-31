Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE8DE613444
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 12:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbiJaLOW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 07:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbiJaLOV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 07:14:21 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8C92D2DCF;
        Mon, 31 Oct 2022 04:14:20 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 905241FB;
        Mon, 31 Oct 2022 04:14:26 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AADA73F703;
        Mon, 31 Oct 2022 04:14:17 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>,
        Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 0/7] arm64: sunxi: h616: Add USB support
Date:   Mon, 31 Oct 2022 11:13:51 +0000
Message-Id: <20221031111358.3387297-1-andre.przywara@arm.com>
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

This is a fixed and rebased update of the previous version, with only
the DT binding and one DT seeing changes, triggered by Krzysztof's
comments. For a changelog see below.
Thanks to Karl for testing this on the OrangePi Zero 2!

------------------------
The USB IP used in the Allwinner H616 SoC is very similar to the one
used in the H3 chip: it contains four USB 2.0 host controllers and four
PHYs, where the first PHY is shared with a separate USB-OTG controller.

But out of the four ports, only port 2 works out of the box, the other
ports require some resources and registers of port 2 to be enabled as
well.

Implement the required workaround in the Allwinner USB PHY driver, and
key this off the respective compatible string. This core code is
contained in patch 3/7. The first two patches add the respective DT
binding documentation, whereas patch 4/7 encodes all the configuration
options for the H616 USB PHY into the driver.
The last three patches add the respective devicetree nodes, to the H616
.dtsi, but also to the DTs of the two supported boards.

This allows USB to be used on any H616 based machine. This was tested on
the X96 Mate box.

The patches in this series were originally contained in the initial H616
support series, but where dropped there to speed up mainlining of the
basic support.

It is now based on v6.1-rc3 and is also available here:
https://github.com/apritzel/linux/commits/h616-usb-v2

Please have a look and test on your hardware, especically on all ports
exposed on header pins of the OrangePi Zero2 board.

Cheers,
Andre

Changelog v1 .. v2:
- Add Krzysztof's ACK
- wrap If: clause in allOf: (patch 2/7)
- limit old (H3) PHYs to 4 clocks (else clause, patch 2/7)
- change subsystem to phy: in subject (patch 2/7)
- use "regulator-" prefix for DT node name (patch 6/7)
- drop unneeded status property in regulator node (patch 6/7)

Andre Przywara (7):
  dt-bindings: usb: Add H616 compatible string
  dt-bindings: phy: Add special clock for Allwinner H616 PHY
  phy: sun4i-usb: Introduce port2 SIDDQ quirk
  phy: sun4i-usb: Add support for the H616 USB PHY
  arm64: dts: allwinner: h616: Add USB nodes
  arm64: dts: allwinner: h616: OrangePi Zero 2: Add USB nodes
  arm64: dts: allwinner: h616: X96 Mate: Add USB nodes

 .../phy/allwinner,sun8i-h3-usb-phy.yaml       |  26 +++
 .../devicetree/bindings/usb/generic-ehci.yaml |   1 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   1 +
 .../allwinner/sun50i-h616-orangepi-zero2.dts  |  41 +++++
 .../dts/allwinner/sun50i-h616-x96-mate.dts    |  25 +++
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 160 ++++++++++++++++++
 drivers/phy/allwinner/phy-sun4i-usb.c         |  71 ++++++++
 7 files changed, 325 insertions(+)

-- 
2.25.1

