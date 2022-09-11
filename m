Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFBA55B5212
	for <lists+linux-usb@lfdr.de>; Mon, 12 Sep 2022 02:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiILABr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Sep 2022 20:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiILABp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Sep 2022 20:01:45 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E98691F2E7;
        Sun, 11 Sep 2022 17:01:43 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB9A9113E;
        Sun, 11 Sep 2022 17:01:49 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC5713F73B;
        Sun, 11 Sep 2022 17:01:40 -0700 (PDT)
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
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 0/7] arm64: sunxi: h616: Add USB support
Date:   Mon, 12 Sep 2022 00:59:38 +0100
Message-Id: <20220911235945.6635-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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

This series is an update on what was included in earlier versions of the
initial H616 support series, but was later dropped to get the basic
support in first more quickly.
It is now based on v6.0-rc4 and is also available here:
https://github.com/apritzel/linux/commits/h616-usb

Please have a look and test on your hardware, especically on all ports
exposed on header pins of the OrangePi Zero2 board.

Cheers,
Andre

Andre Przywara (7):
  dt-bindings: usb: Add H616 compatible string
  dt-bindings: usb: Add special clock for Allwinner H616 PHY
  phy: sun4i-usb: Introduce port2 SIDDQ quirk
  phy: sun4i-usb: Add support for the H616 USB PHY
  arm64: dts: allwinner: h616: Add USB nodes
  arm64: dts: allwinner: h616: OrangePi Zero 2: Add USB nodes
  arm64: dts: allwinner: h616: X96 Mate: Add USB nodes

 .../phy/allwinner,sun8i-h3-usb-phy.yaml       |  19 +++
 .../devicetree/bindings/usb/generic-ehci.yaml |   1 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   1 +
 .../allwinner/sun50i-h616-orangepi-zero2.dts  |  42 +++++
 .../dts/allwinner/sun50i-h616-x96-mate.dts    |  25 +++
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 160 ++++++++++++++++++
 drivers/phy/allwinner/phy-sun4i-usb.c         |  71 ++++++++
 7 files changed, 319 insertions(+)

-- 
2.35.3

