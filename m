Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A484926E7
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jan 2022 14:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241597AbiARNQi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jan 2022 08:16:38 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:30777 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241360AbiARNQi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jan 2022 08:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642511798; x=1674047798;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xcxwltqj3Z3qwj5uaSZAvScK+hD+/n+ucY4Xd51S4Ck=;
  b=aUddZDWqE9zEWTWqWUvux0AU2Mfki1tS9cOKGwEoVW+jKqgDcAgIXov9
   WLk0OE3o2zsCXAGXmMv8U+Al9JWol18SSud2qAy7CDBvbX4rd6u8MdpJc
   MFfxhKmGHwA87TgeHatoewPdYe56vaNSNowQeNs/EEPaeTXtP9pvNBR2L
   cWwDEqTkYEDfOnfqLX/RqLimJoApXeOHIAVAWFbaIMnLKRWpevRRjwNMt
   P0iQqR9yvd3LUo2wJYsdK7VizjZEqppqugyVSq49jSiWJMtzBK3/imm9h
   UFo/d20tXkjjr8wJAp+px72elH9WGbWLeKSeuU4/ACZ1PBHmUKOC3q6Hs
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,297,1635199200"; 
   d="scan'208";a="21564683"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Jan 2022 14:16:36 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Jan 2022 14:16:36 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Jan 2022 14:16:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642511796; x=1674047796;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xcxwltqj3Z3qwj5uaSZAvScK+hD+/n+ucY4Xd51S4Ck=;
  b=lJPs+PgAnD5Pt3ByC03GKFEFKT7Tjyt3814HRPd/1Ir1NvI89r/3vP/0
   m//6BwdR9XK3S4kKKZxJzbkzlrplHFY4CfO7LIFtv7gOjwzLsKfemVmde
   Ko9Tgnd32Wm5P5yJ7Ga/cxBICFo+glTamtp/+ctJbi1sFpIhGocXgEv2e
   5ngNBZdMzn67U4+zW4HaHGf1iBPFmqGWm3GUJfaxKzw+xMQsUx/6yACiX
   +HDV4xH+tYvTf2wzANoAisAz+jqvQ04uZRskmhBzfjJh18hgcrJExpQWl
   tHyv+efTzWeen+IMRf9oZ2QCQoHhLR9E30oeAOG0mtbzossAZlJXeON+B
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,297,1635199200"; 
   d="scan'208";a="21564682"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Jan 2022 14:16:36 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 228A2280065;
        Tue, 18 Jan 2022 14:16:36 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
Subject: [PATCH v3 0/4] i.MX8MP: more USB3 glue layer feature support
Date:   Tue, 18 Jan 2022 14:16:22 +0100
Message-Id: <20220118131626.926394-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks everyone for the rfeedback on v2 [1].

This patchset aims to support flags for e.g. over-current active low or port
permanantly attached which are provided in the USB3 glue layer.

In v3 the implementation is moved from USB PHY driver to USB DWC3 glue for
i.MX8MP. The confusing part is that the existing dwc3-imx8mp.c driver references
glue everywhere but is actually using HSIO BLK_CTL, which is a different
hardware block.
The implementation is still backward compatible and be used with device trees
where neither PHY clock nor (new) glue layer base address is provided.

Changes in v3:
* Rename existing member for clarity
* Moved feature implementation from phy-fsl-imx8mq-usb.c to dwc3-imx8mp.c

[1] https://lore.kernel.org/linux-arm-kernel/2245006.irdbgypaU6@steina-w/T/

Alexander Stein (4):
  usb: dwc3: imx8mp: rename iomem base pointer
  dt-bindings: usb: dwc3-imx8mp: Add imx8mp specific flags
  usb: dwc3: imx8mp: Add support for setting SOC specific flags
  arm64: dts: imx8mp: Add memory for USB3 glue layer to usb3 nodes

 .../bindings/usb/fsl,imx8mp-dwc3.yaml         | 38 ++++++--
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 20 ++--
 drivers/usb/dwc3/dwc3-imx8mp.c                | 95 +++++++++++++++++--
 3 files changed, 134 insertions(+), 19 deletions(-)

-- 
2.25.1

