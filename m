Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01D530B5F8
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 04:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbhBBDnS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 22:43:18 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:36074 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231230AbhBBDnR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 22:43:17 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BB860C00AA;
        Tue,  2 Feb 2021 03:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612237336; bh=GQeY4Dyd1vVl1aVcKtPqRsNjqhkfcFkRkX5HgC1nWV0=;
        h=Date:From:Subject:To:From;
        b=jzJcP9tLAEqsZQrf31RsijRGOAOyxb9GzoDFBrvutKRVkdRnZwmTA6NLmpRUmhA6Y
         iZvStK4zrB/jHeGxPrhfKKgQok5PX+wrXagtBmvAYGPRK0MwTsENZnFPrTF4oYr8pf
         Yz8r4DYOj+3stv9+oIYSvXY1zINmyV54jpmwnM5nm0yTd169CThkSWB5kfsYFyss5P
         QPve0yJGm5mZGJ+w+eAnFw8k+1t0KjjUqCfDHMJclmJbW10FpxI72QZXvRTnw6tfn3
         RPE7NamWq52zs6Mw1BgsvicMC5YTiv6u1jj0IN7LzV5HtsHgXGTGBM938yrFL2vB44
         QlFI3e7gvhqtA==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id EFD97A006F;
        Tue,  2 Feb 2021 03:42:09 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 01 Feb 2021 19:42:09 -0800
Date:   Mon, 01 Feb 2021 19:42:09 -0800
Message-Id: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 0/8] usb: Check for genXxY on host
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
        Romain Perier <romain.perier@gmail.com>,
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
 drivers/usb/core/hub.c      |  97 +++++++---
 drivers/usb/core/sysfs.c    |   5 +-
 drivers/usb/host/xhci-hub.c | 368 ++++++++++++++++++++++++------------
 drivers/usb/host/xhci-mem.c |   9 +
 drivers/usb/host/xhci.c     |   2 +
 include/linux/usb.h         |   2 +
 7 files changed, 345 insertions(+), 144 deletions(-)


base-commit: 29b01295a829fba7399ee84afff4e64660e49f04
-- 
2.28.0

