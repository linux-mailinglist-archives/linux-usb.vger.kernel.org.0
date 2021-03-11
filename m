Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7FBD336AD8
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 04:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhCKDnF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 22:43:05 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38212 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229971AbhCKDml (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 22:42:41 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8E968407D9;
        Thu, 11 Mar 2021 03:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1615434161; bh=gr3m0/j0/OCl9cEpiVboqTfDPzIY/I5wE0RR0n7kdis=;
        h=Date:From:Subject:To:From;
        b=PGvIrlgQ6WVcalXWT5N9/fAZHO47dr25N8zIel0c31IT12L8pPA+57IYYCKU/4z77
         4sVhrcvBWfrcLOUhv8jZmu2WnLW2X+a4BIQ4SuQqrbs/JLNYkpafinTspsgl7n8wY0
         R3p4XCmCMcOmkuwcXRX4AUDXdKG1NUZMekNRgDEZh6f2OPhcNvr610cmCSb1WhNT/V
         5R1WpHngJx82DE275a5v4/gPee4KM2Mi6ewlB2uVMtWtsEcfTTiLGJawBH7o11SlA6
         ovIPch+xw5tjaPshtnPsHmDN8o488VR/M0h3youdLMd+hkS1R1UuO145LyGudbenVW
         VoVxernUawEHA==
Received: from lab-vbox (unknown [10.205.137.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id EF43BA006F;
        Thu, 11 Mar 2021 03:42:35 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Wed, 10 Mar 2021 19:42:35 -0800
Date:   Wed, 10 Mar 2021 19:42:35 -0800
Message-Id: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 0/8] usb: Check for genXxY on host
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Sasha Levin <sashal@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Allen Pais <allen.lkml@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        Zeng Tao <prime.zeng@hisilicon.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series add some missing support for USB 3.2 SuperSpeed Plus detection on
the host side. A SuperSpeed Plus device can operate in gen2x2, gen2x1, or
gen1x2. The current implementation can't detect whether the device is in Gen 1
or Gen 2 speed. We can do this by matching for the lane speed exponent and
mantissa of the SSP sublink speed capability descriptor from the hub driver.

Also, the current xHCI driver is missing some reports for the default SSP
Sublink Speed capability for USB 3.2 roothub. This series also add some support
for xHCI driver detecting various SuperSpeed Plus GenXxY.

Changes in v3:
- Rebase on greg/usb-testing
- Update speed print from genXxY to Gen XxY
- Use > < operators for easier read for port minor revision fix
Changes in v2:
- Remove RFC tag
- Rebase on greg/usb-testing
- Make some updates on BOS descriptor creation base on Mathias suggestions


Thinh Nguyen (8):
  usb: core: Track SuperSpeed Plus GenXxY
  usb: core: hub: Remove port_speed_is_ssp()
  usb: core: hub: Print speed name based on ssp rate
  usb: core: sysfs: Check for SSP rate in speed attr
  usb: xhci: Init root hub SSP rate
  usb: xhci: Fix port minor revision
  usb: xhci: Rewrite xhci_create_usb3_bos_desc()
  usb: xhci: Remove unused function

 drivers/usb/core/hcd.c      |   6 +-
 drivers/usb/core/hub.c      |  97 ++++++++---
 drivers/usb/core/sysfs.c    |   5 +-
 drivers/usb/host/xhci-hub.c | 320 +++++++++++++++++++++++-------------
 drivers/usb/host/xhci-mem.c |   9 +
 drivers/usb/host/xhci.c     |   2 +
 include/linux/usb.h         |   2 +
 7 files changed, 300 insertions(+), 141 deletions(-)


base-commit: 60a35ba9141f06b67150ce3544bc595d049b0d83
-- 
2.28.0

