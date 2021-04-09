Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E35E35918A
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 03:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232951AbhDIBmG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 21:42:06 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:45210 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232426AbhDIBmG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 21:42:06 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4F30040460;
        Fri,  9 Apr 2021 01:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617932514; bh=vIkYbETxUsV7HBy1Z+XrRS/Po2G8eDFwp6bk+rvVuB0=;
        h=Date:From:Subject:To:Cc:From;
        b=TnZKfp5jbbJG5DXMOP0Qh4tWqJMCF0QKPq3srkIFqW+pz17E478bJWxm1xygkUrAs
         jQwIDRe1VhBA2iDAgBBtS3WSJmUgoixDKJjRagFmr8zGW1YFRfoHNcE6Udg7CuR1fW
         ETeI8gnQzGNQA2/28oLn8LU5YFL7UPd8yCwxWVh+nQN03aJ11OXCNJa1Ep4f5hpAlo
         UdDnkdwINnVH4YowIdaCBGnIyIyc58xDVsHkphsetl04L/JaMoFmkSx+IzQBDQmEsA
         NJgbmh0wSlbeQKg/X/ljhufyZkXM3xJyEEo4LW+x183J30kgbyyNhF+skdbk20AXEN
         RP3V4emUwVjnA==
Received: from lab-vbox (unknown [10.205.144.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id E5881A0096;
        Fri,  9 Apr 2021 01:41:52 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Thu, 08 Apr 2021 18:41:52 -0700
Date:   Thu, 08 Apr 2021 18:41:52 -0700
Message-Id: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 0/6] usb: Set quirks for xhci/dwc3 host mode
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series add 3 new quirks for DWC_usb31 host mode:
 * XHCI_ISOC_BLOCKED_DISCONNECT
 * XHCI_LIMIT_FS_BI_INTR_EP
 * XHCI_LOST_DISCONNECT_QUIRK

Different versions of DWC_usb3x controllers have different quirks. Typically we
set them based on PCI device VID:PID or DT compatible strings. However, we know
that a particular IP version(s) may share a common quirk across different
platforms. We can enable these quirks based on the IP type and version number.
This simplifies the designer work and consolidate the logic check. To do this,
we will need to expose the xHCI quirks to the common header along with the
private platform structure.


Thinh Nguyen (6):
  usb: xhci: Move quirks definitions to common usb header
  usb: xhci: Check for blocked disconnection
  usb: xhci: Workaround undercalculated BW for fullspeed BI
  usb: xhci: Rename Compliance mode timer quirk
  usb: xhci: Workaround lost disconnect port status
  usb: dwc3: host: Set quirks base on version

 drivers/usb/dwc3/host.c         |  21 +++++
 drivers/usb/host/xhci-hub.c     |  12 ++-
 drivers/usb/host/xhci-mem.c     |  26 +++++++
 drivers/usb/host/xhci-plat.c    |   1 -
 drivers/usb/host/xhci-plat.h    |  25 ------
 drivers/usb/host/xhci-rcar.c    |   1 -
 drivers/usb/host/xhci-ring.c    |  76 ++++++++++++++++++
 drivers/usb/host/xhci.c         | 134 ++++++++++++++++++++++++--------
 drivers/usb/host/xhci.h         |  71 ++++-------------
 include/linux/usb/xhci-quirks.h |  80 +++++++++++++++++++
 10 files changed, 328 insertions(+), 119 deletions(-)
 delete mode 100644 drivers/usb/host/xhci-plat.h
 create mode 100644 include/linux/usb/xhci-quirks.h


base-commit: e9fcb07704fcef6fa6d0333fd2b3a62442eaf45b
-- 
2.28.0

