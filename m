Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8332D5C2A
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 14:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389334AbgLJNnR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 08:43:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:45234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732601AbgLJNnR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Dec 2020 08:43:17 -0500
From:   Peter Chen <peter.chen@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     pawell@cadence.com, rogerq@ti.com, robh+dt@kernel.org,
        frowand.list@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, a-govindraju@ti.com,
        frank.li@nxp.com, devicetree@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/2] usb: cdns3: imx: assign platform_data_length for auxdata structure
Date:   Thu, 10 Dec 2020 21:42:15 +0800
Message-Id: <20201210134215.20424-2-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201210134215.20424-1-peter.chen@kernel.org>
References: <20201210134215.20424-1-peter.chen@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

In this case, the OF code will call platform_device_add_data to
allocate platform_data using kmalloc, and avoid kfree issue when
unload module. It fixed below oops:

log1:
[  333.501593] Unable to handle kernel paging request at virtual address 000000000004ae48
[  333.509558] Mem abort info:
[  333.512369]   ESR = 0x96000006
[  333.515476]   EC = 0x25: DABT (current EL), IL = 32 bits
[  333.520847]   SET = 0, FnV = 0
[  333.523986]   EA = 0, S1PTW = 0
[  333.527193] Data abort info:
[  333.530124]   ISV = 0, ISS = 0x00000006
[  333.534004]   CM = 0, WnR = 0
[  333.536988] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000885d73000
[  333.543497] [000000000004ae48] pgd=0000000000000000, p4d=0000000000000000
[  333.550354] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[  333.555936] Modules linked in: fsl_jr_uio caam_jr caamkeyblob_desc caamhash_desc caamalg_desc crypto_engine rng_core authenc libdes crct10dif_
ce mxc_jpeg_encdec phy_mxs_usb phy_cadence_salvo imx8_media_dev(C) caam error [last unloaded: cdns3]
[  333.577484] CPU: 3 PID: 168 Comm: kworker/3:38 Tainted: G         C        5.10.0-rc4-04454-gd479340c061 #30
[  333.587313] Hardware name: Freescale i.MX8QXP MEK (DT)
[  333.592471] Workqueue: rcu_gp srcu_invoke_callbacks
[  333.597359] pstate: a0000005 (NzCv daif -PAN -UAO -TCO BTYPE=--)
[  333.603373] pc : kfree+0x78/0x3a0
[  333.606690] lr : platform_device_release+0x28/0x58
[  333.611481] sp : ffff8000135bbc20
[  333.614800] x29: ffff8000135bbc20 x28: ffff800012146000
[  333.620125] x27: ffff00083fa06470 x26: ffff800010108cb0
[  333.625442] x25: 0080000000000000 x24: ffff80001240f000
[  333.630767] x23: ffff0008012ef000 x22: ffff800010875478
[  333.636093] x21: ffff8000092b90c8 x20: ffff000804bf1b00
[  333.641418] x19: 000000000004ae40 x18: 0000000000000000
[  333.646735] x17: 0000000000000000 x16: 0000000000000000
[  333.652052] x15: 0000000000000000 x14: 0000000000000000
[  333.657368] x13: 0000000000000002 x12: 0000000000000000
[  333.662685] x11: 0000000000000040 x10: 0000000000000a00
[  333.668000] x9 : ffff800010875478 x8 : fefefefefefefeff
[  333.673319] x7 : 0000000000000018 x6 : ffff00080101006c
[  333.678644] x5 : ffff00083fa5c300 x4 : 0000000000000000
[  333.683969] x3 : 0000000000000002 x2 : 0000000000000000
[  333.689286] x1 : 0000000000000030 x0 : fffffdffffe00000
[  333.694605] Call trace:
[  333.697059]  kfree+0x78/0x3a0
[  333.700027]  platform_device_release+0x28/0x58
[  333.704476]  device_release+0x38/0x90
[  333.708144]  kobject_put+0x78/0x208
[  333.711633]  __device_link_free_srcu+0x50/0x78
[  333.716082]  srcu_invoke_callbacks+0xf4/0x168
[  333.720445]  process_one_work+0x1c8/0x480
[  333.724460]  worker_thread+0x50/0x420
[  333.728124]  kthread+0x148/0x168
[  333.731355]  ret_from_fork+0x10/0x18
[  333.734940] Code: b26babe0 d34cfe73 f2dfbfe0 8b131813 (f9400660)
[  333.741049] ---[ end trace 9a41d9fcbc0885e6 ]---
[  333.745671] Kernel panic - not syncing: Oops: Fatal exception in interrupt
[  333.752551] SMP: stopping secondary CPUs
[  333.756485] Kernel Offset: disabled
[  333.759979] CPU features: 0x0240002,20002008
[  333.764251] Memory Limit: none

log2:
[  160.400179]  kfree+0x78/0x3a0
[  160.403147]  platform_device_release+0x28/0x58
[  160.407595]  device_release+0x38/0x90
[  160.411264]  kobject_put+0x78/0x208
[  160.414753]  klist_children_put+0x1c/0x28
[  160.418766]  klist_next+0xac/0x128
[  160.422172]  device_for_each_child+0x4c/0xa8
[  160.426453]  cdns_imx_remove+0x2c/0x40 [cdns3_imx]
[  160.431251]  platform_drv_remove+0x30/0x50
[  160.435353]  device_release_driver_internal+0x114/0x1e8
[  160.440580]  driver_detach+0x54/0xe0
[  160.444163]  bus_remove_driver+0x60/0xd8
[  160.448087]  driver_unregister+0x34/0x60
[  160.452013]  platform_driver_unregister+0x18/0x20
[  160.456726]  cdns_imx_driver_exit+0x14/0x478 [cdns3_imx]
[  160.462042]  __arm64_sys_delete_module+0x180/0x258
[  160.466837]  el0_svc_common.constprop.0+0x70/0x168
[  160.471631]  do_el0_svc+0x28/0x88
[  160.474950]  el0_sync_handler+0x158/0x160
[  160.478961]  el0_sync+0x140/0x180

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/cdns3-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index f03562c76a50..67c9b789d3b2 100644
--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -158,6 +158,7 @@ static const struct of_dev_auxdata cdns_imx_auxdata[] = {
 	{
 		.compatible = "cdns,usb3",
 		.platform_data = &cdns_imx_pdata,
+		.platform_data_length = sizeof(cdns_imx_pdata),
 	},
 	{},
 };
-- 
2.17.1

