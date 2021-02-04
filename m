Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8D8630EB70
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 05:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbhBDELd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 23:11:33 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:43626 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231499AbhBDELc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Feb 2021 23:11:32 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1C9FA404A0;
        Thu,  4 Feb 2021 04:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612411831; bh=fnP5HffHj4+A5qCPaUlYYsRRmXn5rB4gi8kgnqkJNGQ=;
        h=Date:From:Subject:To:From;
        b=C4bBN5ySy1aSIaP7JBACtXMo085pDJp4vDoMFMJH1z40bgP6BNQcitEuzU9h9MqKI
         R/tE9KI0Szz1914tQb6DLuGjVJaQna1w1jWAt+8cNLrxnXai3TFw8sqXu8y5tEALi7
         9/nqXGqxeF5038SKne28hyQ5vm6SCdeQvPtG1D4eBjADIlnlWSofNwVGvW1hsZoQAV
         TffAX9wOwn0H8+umvnqEEDUtfS33+4TNAjqqW1Xpr+IPcn27ppTXA0iK524jeQarVk
         7jsKUqKNxlA9G7xiglhr6w1wyOgaVQgbdpih/jQPVfPns4il7GhrbAI23+ZYs9IrJE
         guVvapeMmXdwg==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 43E8AA007C;
        Thu,  4 Feb 2021 04:10:25 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 03 Feb 2021 20:10:25 -0800
Date:   Wed, 03 Feb 2021 20:10:25 -0800
Message-Id: <cover.1612410491.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 0/8] usb: Check for genXxY on host
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        chenqiwu <chenqiwu@xiaomi.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Hardik Gajjar <hgajjar@de.adit-jv.com>,
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


base-commit: d021e0694d77ee3cdc5d3fca2c8d53ae7575499a
-- 
2.28.0

