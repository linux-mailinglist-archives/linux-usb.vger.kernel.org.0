Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9980339A44A
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jun 2021 17:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbhFCPSq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 11:18:46 -0400
Received: from foss.arm.com ([217.140.110.172]:43882 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232116AbhFCPSp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Jun 2021 11:18:45 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1537F1424;
        Thu,  3 Jun 2021 08:17:00 -0700 (PDT)
Received: from monolith.localdoman (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0068F3F73D;
        Thu,  3 Jun 2021 08:16:58 -0700 (PDT)
From:   Alexandru Elisei <alexandru.elisei@arm.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        p.zabel@pengutronix.de, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sanm@codeaurora.org
Subject: [PATCH] Revert "usb: dwc3: core: Add shutdown callback for dwc3"
Date:   Thu,  3 Jun 2021 16:17:42 +0100
Message-Id: <20210603151742.298243-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit 568262bf5492a9bb2fcc4c204b8d38fd6be64e28.

The commit causes the following panic when shutting down a rockpro64-v2
board:

[..]
[   41.684569] xhci-hcd xhci-hcd.2.auto: USB bus 1 deregistered
[   41.686301] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a0
[   41.687096] Mem abort info:
[   41.687345]   ESR = 0x96000004
[   41.687615]   EC = 0x25: DABT (current EL), IL = 32 bits
[   41.688082]   SET = 0, FnV = 0
[   41.688352]   EA = 0, S1PTW = 0
[   41.688628] Data abort info:
[   41.688882]   ISV = 0, ISS = 0x00000004
[   41.689219]   CM = 0, WnR = 0
[   41.689481] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000073b2000
[   41.690046] [00000000000000a0] pgd=0000000000000000, p4d=0000000000000000
[   41.690654] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[   41.691143] Modules linked in:
[   41.691416] CPU: 5 PID: 1 Comm: shutdown Not tainted 5.13.0-rc4 #43
[   41.691966] Hardware name: Pine64 RockPro64 v2.0 (DT)
[   41.692409] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
[   41.692937] pc : down_read_interruptible+0xec/0x200
[   41.693373] lr : simple_recursive_removal+0x48/0x280
[   41.693815] sp : ffff800011fab910
[   41.694107] x29: ffff800011fab910 x28: ffff0000008fe480 x27: ffff0000008fe4d8
[   41.694736] x26: ffff800011529a90 x25: 00000000000000a0 x24: ffff800011edd030
[   41.695364] x23: 0000000000000080 x22: 0000000000000000 x21: ffff800011f23994
[   41.695992] x20: ffff800011f23998 x19: ffff0000008fe480 x18: ffffffffffffffff
[   41.696620] x17: 000c0400bb44ffff x16: 0000000000000009 x15: ffff800091faba3d
[   41.697248] x14: 0000000000000004 x13: 0000000000000000 x12: 0000000000000020
[   41.697875] x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f x9 : 6f6c746364716e62
[   41.698502] x8 : 7f7f7f7f7f7f7f7f x7 : fefefeff6364626d x6 : 0000000000000440
[   41.699130] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000000000a0
[   41.699758] x2 : 0000000000000001 x1 : 0000000000000000 x0 : 00000000000000a0
[   41.700386] Call trace:
[   41.700602]  down_read_interruptible+0xec/0x200
[   41.701003]  debugfs_remove+0x5c/0x80
[   41.701328]  dwc3_debugfs_exit+0x1c/0x6c
[   41.701676]  dwc3_remove+0x34/0x1a0
[   41.701988]  platform_remove+0x28/0x60
[   41.702322]  __device_release_driver+0x188/0x22c
[   41.702730]  device_release_driver+0x2c/0x44
[   41.703106]  bus_remove_device+0x124/0x130
[   41.703468]  device_del+0x16c/0x424
[   41.703777]  platform_device_del.part.0+0x1c/0x90
[   41.704193]  platform_device_unregister+0x28/0x44
[   41.704608]  of_platform_device_destroy+0xe8/0x100
[   41.705031]  device_for_each_child_reverse+0x64/0xb4
[   41.705470]  of_platform_depopulate+0x40/0x84
[   41.705853]  __dwc3_of_simple_teardown+0x20/0xd4
[   41.706260]  dwc3_of_simple_shutdown+0x14/0x20
[   41.706652]  platform_shutdown+0x28/0x40
[   41.706998]  device_shutdown+0x158/0x330
[   41.707344]  kernel_power_off+0x38/0x7c
[   41.707684]  __do_sys_reboot+0x16c/0x2a0
[   41.708029]  __arm64_sys_reboot+0x28/0x34
[   41.708383]  invoke_syscall+0x48/0x114
[   41.708716]  el0_svc_common.constprop.0+0x44/0xdc
[   41.709131]  do_el0_svc+0x28/0x90
[   41.709426]  el0_svc+0x2c/0x54
[   41.709698]  el0_sync_handler+0xa4/0x130
[   41.710045]  el0_sync+0x198/0x1c0
[   41.710342] Code: c8047c62 35ffff84 17fffe5f f9800071 (c85ffc60)
[   41.710881] ---[ end trace 406377df5178f75c ]---
[   41.711299] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[   41.712084] Kernel Offset: disabled
[   41.712391] CPU features: 0x10001031,20000846
[   41.712775] Memory Limit: none
[   41.713049] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

As Felipe explained: "dwc3_shutdown() is just called dwc3_remove()
directly, then we end up calling debugfs_remove_recursive() twice."

Reverting the commit fixes the panic.

Acked-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 drivers/usb/dwc3/core.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index b6e53d8212cd..21129d357f29 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1690,11 +1690,6 @@ static int dwc3_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static void dwc3_shutdown(struct platform_device *pdev)
-{
-	dwc3_remove(pdev);
-}
-
 #ifdef CONFIG_PM
 static int dwc3_core_init_for_resume(struct dwc3 *dwc)
 {
@@ -2012,7 +2007,6 @@ MODULE_DEVICE_TABLE(acpi, dwc3_acpi_match);
 static struct platform_driver dwc3_driver = {
 	.probe		= dwc3_probe,
 	.remove		= dwc3_remove,
-	.shutdown   = dwc3_shutdown,
 	.driver		= {
 		.name	= "dwc3",
 		.of_match_table	= of_match_ptr(of_dwc3_match),
-- 
2.31.1

