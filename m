Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DADF118F269
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2020 11:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgCWKLo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Mar 2020 06:11:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:33406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727806AbgCWKLo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Mar 2020 06:11:44 -0400
Received: from localhost.localdomain (unknown [171.76.96.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0EF17206F8;
        Mon, 23 Mar 2020 10:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584958303;
        bh=pp48oPhTG1NSWXShz32Qit2sxUo9mo6IzWCL5HAPRWg=;
        h=From:To:Cc:Subject:Date:From;
        b=IMlYWVXCUgh3fHNGtXiqjAvoT3lH+3Id5/qfnat+lax6611ZD0kHlQGzTOezlalaB
         Wjigocw+eW05T22PToZzBpdG+9hnM4JzPy25GmwjeSChU4vNZgXFeWMLlJmNFOCUMs
         unZMkX5bIeQrBzxWQ0L9bwUPql+tUtsiLIaIJSio=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?UTF-8?q?Andreas=20B=C3=B6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/5] usb: xhci: Add support for Renesas USB controllers
Date:   Mon, 23 Mar 2020 15:41:16 +0530
Message-Id: <20200323101121.243906-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series add support for Renesas USB controllers uPD720201 and uPD720202.
These require firmware to be loaded and in case devices have ROM those can
also be programmed if empty. If ROM is programmed, it runs from ROM as well.

This includes patches from Christian which supported these controllers w/o
ROM and later my patches for ROM support and debugfs hook for rom erase and
export of xhci-pci functions.

Changes in v7:
 Make a single module which removes issues with module loading
 Keep the renesas code in renesas file
 Add hc_driver as argument for usb_hcd_pci_probe and modify hdc drivers to
   pass this and not use driver_data
 Use driver data for fw name
 Remove code to check if we need to load firmware or not
 remove multiple fw version support, we can do that with symlink in
   userspace

Changes in v6:
 Move the renesas code into a seprate driver which invokes xhci-pci functions.

Changes in v5:
 Added a debugfs rom erase patch, helps in debugging
 Squashed patch 1 & 2 as requested by Mathias

Changes in v4:
 Rollback the delay values as we got device failures

Changes in v3:
  Dropped patch 2 as discussed with Christian
  Removed aligned 8 bytes check
  Change order for firware search from highest version to lowest
  Added entry for new firmware for device 0x14 as well
  Add tested by Christian

Changes in v2:
  used macros for timeout count and delay
  removed renesas_fw_alive_check
  cleaned renesas_fw_callback
  removed recurion for renesas_fw_download
  added MODULE_FIRMWARE
  added comment for multiple fw order

Christian Lamparter (1):
  usb: renesas-xhci: Add the renesas xhci driver

Vinod Koul (4):
  usb: hci: add hc_driver as argument for usb_hcd_pci_probe
  usb: xhci: Add support for Renesas controller with memory
  usb: renesas-xhci: Add ROM loader for uPD720201
  usb: xhci: provide a debugfs hook for erasing rom

 drivers/usb/core/hcd-pci.c          |   7 +-
 drivers/usb/host/Makefile           |   3 +-
 drivers/usb/host/ehci-pci.c         |   6 +-
 drivers/usb/host/ohci-pci.c         |   9 +-
 drivers/usb/host/uhci-pci.c         |   8 +-
 drivers/usb/host/xhci-pci-renesas.c | 809 ++++++++++++++++++++++++++++
 drivers/usb/host/xhci-pci.c         |  43 +-
 drivers/usb/host/xhci-pci.h         |  14 +
 include/linux/usb/hcd.h             |   3 +-
 9 files changed, 878 insertions(+), 24 deletions(-)
 create mode 100644 drivers/usb/host/xhci-pci-renesas.c
 create mode 100644 drivers/usb/host/xhci-pci.h

-- 
2.25.1

