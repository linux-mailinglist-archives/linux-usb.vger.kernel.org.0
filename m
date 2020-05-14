Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47CA1D2DC3
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 13:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgENLBw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 07:01:52 -0400
Received: from mga01.intel.com ([192.55.52.88]:33412 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725925AbgENLBw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 May 2020 07:01:52 -0400
IronPort-SDR: y6uO9lWw5xe8WhCgJZDt6+r9M92i7igRucp+5Ofrtk99oJwr2ggQNpN/JUfxUf44f0GtQOLtk1
 tfZMQNuU3v5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 04:01:51 -0700
IronPort-SDR: d6Ac/NPDsd6wjXu0o3aj/G9/mITerVGT1IHrcROhRZ44qgC0b1IQFcqEBJVQlGSvJ+MYfuS6JJ
 BPQcH+8l1oYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,391,1583222400"; 
   d="scan'208";a="307071685"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by FMSMGA003.fm.intel.com with ESMTP; 14 May 2020 04:01:50 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, Li Jun <jun.li@nxp.com>,
        Baolin Wang <baolin.wang@linaro.org>, stable@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/2] usb: host: xhci-plat: keep runtime active when removing host
Date:   Thu, 14 May 2020 14:04:32 +0300
Message-Id: <20200514110432.25564-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200514110432.25564-1-mathias.nyman@linux.intel.com>
References: <20200514110432.25564-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

While removing the host (e.g. for USB role switch from host to device),
if runtime pm is enabled by user, below oops occurs on dwc3 and cdns3
platforms.
Keeping the xhci-plat device active during host removal, and disabling
runtime pm before calling pm_runtime_set_suspended() fixes them.

oops1:
Unable to handle kernel NULL pointer dereference at virtual address
0000000000000240
Internal error: Oops: 96000004 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.4.3-00107-g64d454a-dirty
Hardware name: FSL i.MX8MP EVK (DT)
Workqueue: pm pm_runtime_work
pstate: 60000005 (nZCv daif -PAN -UAO)
pc : xhci_suspend+0x34/0x698
lr : xhci_plat_runtime_suspend+0x2c/0x38
sp : ffff800011ddbbc0
Call trace:
 xhci_suspend+0x34/0x698
 xhci_plat_runtime_suspend+0x2c/0x38
 pm_generic_runtime_suspend+0x28/0x40
 __rpm_callback+0xd8/0x138
 rpm_callback+0x24/0x98
 rpm_suspend+0xe0/0x448
 rpm_idle+0x124/0x140
 pm_runtime_work+0xa0/0xf8
 process_one_work+0x1dc/0x370
 worker_thread+0x48/0x468
 kthread+0xf0/0x120
 ret_from_fork+0x10/0x1c

oops2:
usb 2-1: USB disconnect, device number 2
xhci-hcd xhci-hcd.1.auto: remove, state 4
usb usb2: USB disconnect, device number 1
xhci-hcd xhci-hcd.1.auto: USB bus 2 deregistered
xhci-hcd xhci-hcd.1.auto: remove, state 4
usb usb1: USB disconnect, device number 1
Unable to handle kernel NULL pointer dereference at virtual address
0000000000000138
Internal error: Oops: 96000004 [#1] PREEMPT SMP
Modules linked in:
CPU: 2 PID: 7 Comm: kworker/u8:0 Not tainted 5.6.0-rc4-next-20200304-03578
Hardware name: Freescale i.MX8QXP MEK (DT)
Workqueue: 1-0050 tcpm_state_machine_work
pstate: 20000005 (nzCv daif -PAN -UAO)
pc : xhci_free_dev+0x214/0x270
lr : xhci_plat_runtime_resume+0x78/0x88
sp : ffff80001006b5b0
Call trace:
 xhci_free_dev+0x214/0x270
 xhci_plat_runtime_resume+0x78/0x88
 pm_generic_runtime_resume+0x30/0x48
 __rpm_callback+0x90/0x148
 rpm_callback+0x28/0x88
 rpm_resume+0x568/0x758
 rpm_resume+0x260/0x758
 rpm_resume+0x260/0x758
 __pm_runtime_resume+0x40/0x88
 device_release_driver_internal+0xa0/0x1c8
 device_release_driver+0x1c/0x28
 bus_remove_device+0xd4/0x158
 device_del+0x15c/0x3a0
 usb_disable_device+0xb0/0x268
 usb_disconnect+0xcc/0x300
 usb_remove_hcd+0xf4/0x1dc
 xhci_plat_remove+0x78/0xe0
 platform_drv_remove+0x30/0x50
 device_release_driver_internal+0xfc/0x1c8
 device_release_driver+0x1c/0x28
 bus_remove_device+0xd4/0x158
 device_del+0x15c/0x3a0
 platform_device_del.part.0+0x20/0x90
 platform_device_unregister+0x28/0x40
 cdns3_host_exit+0x20/0x40
 cdns3_role_stop+0x60/0x90
 cdns3_role_set+0x64/0xd8
 usb_role_switch_set_role.part.0+0x3c/0x68
 usb_role_switch_set_role+0x20/0x30
 tcpm_mux_set+0x60/0xf8
 tcpm_reset_port+0xa4/0xf0
 tcpm_detach.part.0+0x28/0x50
 tcpm_state_machine_work+0x12ac/0x2360
 process_one_work+0x1c8/0x470
 worker_thread+0x50/0x428
 kthread+0xfc/0x128
 ret_from_fork+0x10/0x18
Code: c8037c02 35ffffa3 17ffe7c3 f9800011 (c85f7c01)
---[ end trace 45b1a173d2679e44 ]---

[minor commit message cleanup  -Mathias]
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: <stable@vger.kernel.org>
Fixes: b0c69b4bace3 ("usb: host: plat: Enable xHCI plat runtime PM")
Reviewed-by: Peter Chen <peter.chen@nxp.com>
Tested-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-plat.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 1d4f6f85f0fe..ea460b9682d5 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -362,6 +362,7 @@ static int xhci_plat_remove(struct platform_device *dev)
 	struct clk *reg_clk = xhci->reg_clk;
 	struct usb_hcd *shared_hcd = xhci->shared_hcd;
 
+	pm_runtime_get_sync(&dev->dev);
 	xhci->xhc_state |= XHCI_STATE_REMOVING;
 
 	usb_remove_hcd(shared_hcd);
@@ -375,8 +376,9 @@ static int xhci_plat_remove(struct platform_device *dev)
 	clk_disable_unprepare(reg_clk);
 	usb_put_hcd(hcd);
 
-	pm_runtime_set_suspended(&dev->dev);
 	pm_runtime_disable(&dev->dev);
+	pm_runtime_put_noidle(&dev->dev);
+	pm_runtime_set_suspended(&dev->dev);
 
 	return 0;
 }
-- 
2.17.1

