Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85B046864C9
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 11:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbjBAKyD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 05:54:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbjBAKx4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 05:53:56 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6323D5AB58;
        Wed,  1 Feb 2023 02:53:54 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 408BC4B3;
        Wed,  1 Feb 2023 02:54:36 -0800 (PST)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98EC53F882;
        Wed,  1 Feb 2023 02:53:52 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bin Liu <b-liu@ti.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v6 0/3] usb: musb: sunxi: add F1C100s MUSB support
Date:   Wed,  1 Feb 2023 10:53:45 +0000
Message-Id: <20230201105348.1815461-1-andre.przywara@arm.com>
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

this is a split off from the combined USB/DT Allwinner F1C100s support
series[1], with just the (MUSB) USB patches.
There were no code changes in v5 or v6, those are just rebases and
resends.
============================

This patchset introduces support for the F1C100s USB controller, which
just consists of a MUSB controller variant and some USB PHY. The USB PHY
support bits are already in -next.
Patch 1 adds the compatible string to the binding, patch 2 introduces
that compatible string to the driver, and lets it pick the appropriate
flags.
As this came up in reviews, patch 3 cleans up the SoC specific
configuration bits in the driver, to make future additions easier.

Please have a look and apply, if possible.

Cheers,
Andre.

[1] https://lore.kernel.org/linux-arm-kernel/20230111015332.172021-1-andre.przywara@arm.com/

Changelog v5 ... v6:
- just keep MUSB driver and binding patches
- add Jernej's Reviewed-by:
- Rebase on top of gregkh/usb/usb-next

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


Andre Przywara (1):
  usb: musb: sunxi: Introduce config struct

Icenowy Zheng (2):
  dt-bindings: usb: sunxi-musb: add F1C100s MUSB compatible string
  usb: musb: sunxi: add support for the F1C100s MUSB controller

 .../usb/allwinner,sun4i-a10-musb.yaml         | 10 +-
 drivers/usb/musb/sunxi.c                      | 99 +++++++++++++------
 2 files changed, 76 insertions(+), 33 deletions(-)

-- 
2.25.1

