Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B6E35A9A9
	for <lists+linux-usb@lfdr.de>; Sat, 10 Apr 2021 02:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235302AbhDJAqz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 20:46:55 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46908 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235215AbhDJAqz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 20:46:55 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E5EFAC00CB;
        Sat, 10 Apr 2021 00:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1618015601; bh=xiWZsg9y349izM9yCnSM3ih7z6oLToAJeP/dD2dD/nM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=I8rCplWs5Z5YPJy+yL3WFk7ixFfial1NbYi80Pky0MbtcKiaD/1G7Ho6B9Ouitj2g
         A0e7Jo1rN5smKILwsZjUL03lojdGqgmfOO1GdQsdadXzUdmG42SSdbAvfh27hgsHU3
         NwZa2ujKgfs5GXLl8tM2x3eWXD7BYVWeyw9K79uGtvR4IfVdmqoqqT9/uKpx/KB2VF
         K0E0dlzUGMSmhejHCuvVfEFVF4aaRxvplya/uSGMbHdfdaiv37mvjZ45J7tb27hXMa
         1DowuqP4E2wKpmMu36ZmbXaX9az7Lau8cYSOsIaYTsylOCRzz/boQ0tS85irh4LzRL
         Uh9zb0RFaUN3A==
Received: from lab-vbox (unknown [10.205.130.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 14B02A007C;
        Sat, 10 Apr 2021 00:46:38 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Fri, 09 Apr 2021 17:46:38 -0700
Date:   Fri, 09 Apr 2021 17:46:38 -0700
Message-Id: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
References: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 0/7] usb: Set quirks for xhci/dwc3 host mode
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Pawel Laszczak <pawell@cadence.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Roger Quadros <rogerq@kernel.org>,
        Peter Chen <peter.chen@kernel.org>
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
platform. We can enable these quirks based on the IP type and version number.
This simplifies the designer work and consolidate the logic check. To do this,
we will need to expose the xHCI quirks to the common header along with the
private platform structure.


Changes in v2:
- Instead of combining xhci-plat private structure in xhci-squirks.h, keep it
  as a separate header file


Thinh Nguyen (7):
  usb: xhci: Move quirks definitions to common usb header
  usb: xhci: Move xhci-plat header to common usb header
  usb: xhci: Check for blocked disconnection
  usb: xhci: Workaround undercalculated BW for fullspeed BI
  usb: xhci: Rename Compliance mode timer quirk
  usb: xhci: Workaround lost disconnect port status
  usb: dwc3: host: Set quirks base on version

 drivers/usb/cdns3/host.c                      |   2 +-
 drivers/usb/dwc3/host.c                       |  22 +++
 drivers/usb/host/xhci-hub.c                   |  12 +-
 drivers/usb/host/xhci-mem.c                   |  26 ++++
 drivers/usb/host/xhci-plat.c                  |   2 +-
 drivers/usb/host/xhci-rcar.c                  |   2 +-
 drivers/usb/host/xhci-ring.c                  |  76 ++++++++++
 drivers/usb/host/xhci.c                       | 134 +++++++++++++-----
 drivers/usb/host/xhci.h                       |  71 ++--------
 .../host => include/linux/usb}/xhci-plat.h    |  18 +--
 include/linux/usb/xhci-quirks.h               |  65 +++++++++
 11 files changed, 326 insertions(+), 104 deletions(-)
 rename {drivers/usb/host => include/linux/usb}/xhci-plat.h (54%)
 create mode 100644 include/linux/usb/xhci-quirks.h


base-commit: 496960274153bdeb9d1f904ff1ea875cef8232c1
-- 
2.28.0

