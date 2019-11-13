Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C88FDFB678
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2019 18:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbfKMRc0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Nov 2019 12:32:26 -0500
Received: from mga11.intel.com ([192.55.52.93]:5879 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbfKMRc0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Nov 2019 12:32:26 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Nov 2019 09:32:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; 
   d="scan'208";a="257197669"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2019 09:32:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 22701EB; Wed, 13 Nov 2019 19:32:22 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Mathias Nyman <mathias.nyman@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH] xhci: Fix memory leak in xhci_add_in_port()
Date:   Wed, 13 Nov 2019 20:32:22 +0300
Message-Id: <20191113173222.33468-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When xHCI is part of Alpine or Titan Ridge Thunderbolt controller and
the xHCI device is hot-removed as a result of unplugging a dock for
example, the driver leaks memory it allocates for xhci->usb3_rhub.psi
and xhci->usb2_rhub.psi in xhci_add_in_port() as reported by kmemleak:

unreferenced object 0xffff922c24ef42f0 (size 16):
  comm "kworker/u16:2", pid 178, jiffies 4294711640 (age 956.620s)
  hex dump (first 16 bytes):
    21 00 0c 00 12 00 dc 05 23 00 e0 01 00 00 00 00  !.......#.......
  backtrace:
    [<000000007ac80914>] xhci_mem_init+0xcf8/0xeb7
    [<0000000001b6d775>] xhci_init+0x7c/0x160
    [<00000000db443fe3>] xhci_gen_setup+0x214/0x340
    [<00000000fdffd320>] xhci_pci_setup+0x48/0x110
    [<00000000541e1e03>] usb_add_hcd.cold+0x265/0x747
    [<00000000ca47a56b>] usb_hcd_pci_probe+0x219/0x3b4
    [<0000000021043861>] xhci_pci_probe+0x24/0x1c0
    [<00000000b9231f25>] local_pci_probe+0x3d/0x70
    [<000000006385c9d7>] pci_device_probe+0xd0/0x150
    [<0000000070241068>] really_probe+0xf5/0x3c0
    [<0000000061f35c0a>] driver_probe_device+0x58/0x100
    [<000000009da11198>] bus_for_each_drv+0x79/0xc0
    [<000000009ce45f69>] __device_attach+0xda/0x160
    [<00000000df201aaf>] pci_bus_add_device+0x46/0x70
    [<0000000088a1bc48>] pci_bus_add_devices+0x27/0x60
    [<00000000ad9ee708>] pci_bus_add_devices+0x52/0x60
unreferenced object 0xffff922c24ef3318 (size 8):
  comm "kworker/u16:2", pid 178, jiffies 4294711640 (age 956.620s)
  hex dump (first 8 bytes):
    34 01 05 00 35 41 0a 00                          4...5A..
  backtrace:
    [<000000007ac80914>] xhci_mem_init+0xcf8/0xeb7
    [<0000000001b6d775>] xhci_init+0x7c/0x160
    [<00000000db443fe3>] xhci_gen_setup+0x214/0x340
    [<00000000fdffd320>] xhci_pci_setup+0x48/0x110
    [<00000000541e1e03>] usb_add_hcd.cold+0x265/0x747
    [<00000000ca47a56b>] usb_hcd_pci_probe+0x219/0x3b4
    [<0000000021043861>] xhci_pci_probe+0x24/0x1c0
    [<00000000b9231f25>] local_pci_probe+0x3d/0x70
    [<000000006385c9d7>] pci_device_probe+0xd0/0x150
    [<0000000070241068>] really_probe+0xf5/0x3c0
    [<0000000061f35c0a>] driver_probe_device+0x58/0x100
    [<000000009da11198>] bus_for_each_drv+0x79/0xc0
    [<000000009ce45f69>] __device_attach+0xda/0x160
    [<00000000df201aaf>] pci_bus_add_device+0x46/0x70
    [<0000000088a1bc48>] pci_bus_add_devices+0x27/0x60
    [<00000000ad9ee708>] pci_bus_add_devices+0x52/0x60

Fix this by calling kfree() for the both psi objects in
xhci_mem_cleanup().

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
I'm not 100% sure the kfree()s below are in correct place so please double
check :)

 drivers/usb/host/xhci-mem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index e16eda6e2b8b..3b1388fa2f36 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1909,13 +1909,17 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->usb3_rhub.num_ports = 0;
 	xhci->num_active_eps = 0;
 	kfree(xhci->usb2_rhub.ports);
+	kfree(xhci->usb2_rhub.psi);
 	kfree(xhci->usb3_rhub.ports);
+	kfree(xhci->usb3_rhub.psi);
 	kfree(xhci->hw_ports);
 	kfree(xhci->rh_bw);
 	kfree(xhci->ext_caps);
 
 	xhci->usb2_rhub.ports = NULL;
+	xhci->usb2_rhub.psi = NULL;
 	xhci->usb3_rhub.ports = NULL;
+	xhci->usb3_rhub.psi = NULL;
 	xhci->hw_ports = NULL;
 	xhci->rh_bw = NULL;
 	xhci->ext_caps = NULL;
-- 
2.24.0

