Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84FD1230A8E
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 14:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729780AbgG1Mq7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 08:46:59 -0400
Received: from mail-eopbgr10073.outbound.protection.outlook.com ([40.107.1.73]:15172
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729562AbgG1Mq6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jul 2020 08:46:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3IL0Aiv9vXPgYHbpkWnJ+z+/2fzdunq3UCuxkggKyr4skV7NrTDmnaHI820WMo3QLvaPzPooJZGvpmrKqJct9NCCOKGskA+QxydnwODvfhK0xq1CNK2wA3rtZ19MVaBX1o196+VoCq7sAedm49ra5Rg3dmp+TFytH8+1JZZgg8BxJ2tRAQ1BvzD0bv5kNC0eAkxoPJI8LNI0WYCXrWXX8/w7enFgs/SMkutc9t4rHnJmDXhbeceaSYaGxOYiimNxSNXMQ6Wi8WMdx8qauxKxPT+FC5P5GvuZSTsaIha4tG0KV9OltCx++3WAipX506Zyrcx+v0o2e62vyvOS5lYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jifqee3B1UzjV3uPGYuHvLDS3zWEK4vVRT17ecIuWM0=;
 b=QcybHnqwMGV+BUbHHMr4eNZ98A/rhpLGW71t620bcc+Jar3Kb3gEwMabSZNA37qY2GyycF7nTyc68KxcT0NvZTubZc5dxlX4IviT6j5wAs/tg6LWHFW6XcQiAGwlbdEeAmWV0QGj/toIQihVwCAwyDTRxbMHs/Rm7pZPzHsZrb9uid8QThTJoTf7VjazH1gKIP9nR01fifet4ZFW25a0hlXer7W4X9v4YlR4S62thpcZGMWBs2p02xiHMbuaKmA8znnUg+gy61ylKIjYP0tusRY58WjcBMB1mYNrbd/r/EYOL4s3CDl8MGUoClVv7QA+7OnqNROSv048PVBbgmGEvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jifqee3B1UzjV3uPGYuHvLDS3zWEK4vVRT17ecIuWM0=;
 b=rJd3GpsGD1rbW6+mErUZh2eB7sqopu+KXoorlVxr7lo6hs85PVSRZCmR0b33JZWlyksSnGb+3B78piHEUfq15uJlBVUdFCKuR8LE38D9l/9qM2tIt0AjW8WU2y2U5L6NpXn3/9nYPOV9AgbKqrkFBrjs5xV33tQoVEawE5gcEdw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB2910.eurprd04.prod.outlook.com (2603:10a6:800:b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 12:46:54 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 12:46:54 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 1/2] usb: dwc3: core: don't trigger runtime pm when remove driver
Date:   Tue, 28 Jul 2020 20:42:40 +0800
Message-Id: <1595940161-3700-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by SG2PR02CA0031.apcprd02.prod.outlook.com (2603:1096:3:18::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3216.21 via Frontend Transport; Tue, 28 Jul 2020 12:46:52 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b4807550-24ed-497c-aa51-08d832f44e31
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2910:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2910443998B3B3CF726E6BE589730@VI1PR0402MB2910.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:294;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9jA9+Jrh5NI7SwkknFbq0M7ICUOIYZQ8q/+FzvD7j4nhbhK0OF/ObCcrh8DAWKyG4HYC24CroEctS9mJ+F406yzm0jih9UKyYZmnmRgnPUXBMjXKQ37ATs2xzmxo8WxxbhKOWCX2vcpOrfqUty9W9buzyLKUagr3FwfSBs2j2Hk2SQYUGv4OFdGBvp7KahRftM+1Zkny2Nq0G2qZTAfSp75mVQ9Wa+XO1C4ATmcbYxKs+zhi2ihjLAb6kyRtacntCI2HAajO/o8IOzc42Syw4uAnRWXpn6324270WPUEEKMG2d+QFewppSxHFu54ZV8jHcRuCudsNIwWh4USIR1/rXvmTzQFxk7brY2y76+PXeVN0tlOfVgvkuZLlUfuC/qd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(26005)(83380400001)(956004)(5660300002)(2616005)(16526019)(186003)(36756003)(6506007)(66946007)(4326008)(66476007)(52116002)(66556008)(2906002)(86362001)(6916009)(8676002)(45080400002)(69590400007)(8936002)(478600001)(6486002)(6666004)(316002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: jj9pOChvtHTQhRn30O37NJK+m/gGOqlS09iqvPslaNZyla+NTAOlu77Cz4bPmaDXpvyGXUMEFOA5dHZ+XGBzgfTCmdLGiP3iZ85YKxlOWy4NkJeN5db0TbzfDwx2NvVt3Qf7WKNqCEsdKwvk2oIS1EjqD/aRjQaOOJD6GiUGkWKKjr39OY/NRzgOR0Vp9Cv/79vwswSEF5pMyrUEXGmwcsbfifhX1dWV47xbTuUCu1R7gIPLfhVztjDuqIE8aR9VHRBMhEjIMfDw/TuF0S80hbYBaoNKT1uxcH1/weVmcO11IAJUWqmEd9kkiqvLppKWLtOyC9Ox7UFBakkfDCP7KJH58kMtK1M/uKzfRwoGfbd7vTKo+/qVdAJuJeFDPbxC7jsZXiuMydvBWa2yOAFOzdSIo8JyYoGbABIEjktGySojA0nANZeymwZLqS33CTfD9tt9mdemnSUSFlwD85Z++M6+dFoodB50mm3LXUr1YK4=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4807550-24ed-497c-aa51-08d832f44e31
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 12:46:53.9980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ul07lV+8nZ+kVkwRVA6kpe0X7dUo1IsoUzWepOnxQFtp8rcpjQZalEghLDLPZdoQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2910
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No need to trigger runtime pm in driver removal, otherwise if user
disable auto suspend via sys file, runtime suspend may be entered,
which will call dwc3_core_exit() again and there will be clock disable
not balance warning:

[ 2026.820154] xhci-hcd xhci-hcd.0.auto: remove, state 4
[ 2026.825268] usb usb2: USB disconnect, device number 1
[ 2026.831017] xhci-hcd xhci-hcd.0.auto: USB bus 2 deregistered
[ 2026.836806] xhci-hcd xhci-hcd.0.auto: remove, state 4
[ 2026.842029] usb usb1: USB disconnect, device number 1
[ 2026.848029] xhci-hcd xhci-hcd.0.auto: USB bus 1 deregistered
[ 2026.865889] ------------[ cut here ]------------
[ 2026.870506] usb2_ctrl_root_clk already disabled
[ 2026.875082] WARNING: CPU: 0 PID: 731 at drivers/clk/clk.c:958
clk_core_disable+0xa0/0xa8
[ 2026.883170] Modules linked in: dwc3(-) phy_fsl_imx8mq_usb [last
unloaded: dwc3]
[ 2026.890488] CPU: 0 PID: 731 Comm: rmmod Not tainted
5.8.0-rc7-00280-g9d08cca-dirty #245
[ 2026.898489] Hardware name: NXP i.MX8MQ EVK (DT)
[ 2026.903020] pstate: 20000085 (nzCv daIf -PAN -UAO BTYPE=--)
[ 2026.908594] pc : clk_core_disable+0xa0/0xa8
[ 2026.912777] lr : clk_core_disable+0xa0/0xa8
[ 2026.916958] sp : ffff8000121b39a0
[ 2026.920271] x29: ffff8000121b39a0 x28: ffff0000b11f3700
[ 2026.925583] x27: 0000000000000000 x26: ffff0000b539c700
[ 2026.930895] x25: 000001d7e44e1232 x24: ffff0000b76fa800
[ 2026.936208] x23: ffff0000b76fa6f8 x22: ffff800008d01040
[ 2026.941520] x21: ffff0000b539ce00 x20: ffff0000b7105000
[ 2026.946832] x19: ffff0000b7105000 x18: 0000000000000010
[ 2026.952144] x17: 0000000000000001 x16: 0000000000000000
[ 2026.957456] x15: ffff0000b11f3b70 x14: ffffffffffffffff
[ 2026.962768] x13: ffff8000921b36f7 x12: ffff8000121b36ff
[ 2026.968080] x11: ffff8000119e1000 x10: ffff800011bf26d0
[ 2026.973392] x9 : 0000000000000000 x8 : ffff800011bf3000
[ 2026.978704] x7 : ffff800010695d68 x6 : 0000000000000252
[ 2026.984016] x5 : ffff0000bb9881f0 x4 : 0000000000000000
[ 2026.989327] x3 : 0000000000000027 x2 : 0000000000000023
[ 2026.994639] x1 : ac2fa471aa7cab00 x0 : 0000000000000000
[ 2026.999951] Call trace:
[ 2027.002401]  clk_core_disable+0xa0/0xa8
[ 2027.006238]  clk_core_disable_lock+0x20/0x38
[ 2027.010508]  clk_disable+0x1c/0x28
[ 2027.013911]  clk_bulk_disable+0x34/0x50
[ 2027.017758]  dwc3_core_exit+0xec/0x110 [dwc3]
[ 2027.022122]  dwc3_suspend_common+0x84/0x188 [dwc3]
[ 2027.026919]  dwc3_runtime_suspend+0x74/0x9c [dwc3]
[ 2027.031712]  pm_generic_runtime_suspend+0x28/0x40
[ 2027.036419]  genpd_runtime_suspend+0xa0/0x258
[ 2027.040777]  __rpm_callback+0x88/0x140
[ 2027.044526]  rpm_callback+0x20/0x80
[ 2027.048015]  rpm_suspend+0xd0/0x418
[ 2027.051503]  __pm_runtime_suspend+0x58/0xa0
[ 2027.055693]  dwc3_runtime_idle+0x7c/0x90 [dwc3]
[ 2027.060224]  __rpm_callback+0x88/0x140
[ 2027.063973]  rpm_idle+0x78/0x150
[ 2027.067201]  __pm_runtime_idle+0x58/0xa0
[ 2027.071130]  dwc3_remove+0x64/0xc0 [dwc3]
[ 2027.075140]  platform_drv_remove+0x28/0x48
[ 2027.079239]  device_release_driver_internal+0xf4/0x1c0
[ 2027.084377]  driver_detach+0x4c/0xd8
[ 2027.087954]  bus_remove_driver+0x54/0xa8
[ 2027.091877]  driver_unregister+0x2c/0x58
[ 2027.095799]  platform_driver_unregister+0x10/0x18
[ 2027.100509]  dwc3_driver_exit+0x14/0x1408 [dwc3]
[ 2027.105129]  __arm64_sys_delete_module+0x178/0x218
[ 2027.109922]  el0_svc_common.constprop.0+0x68/0x160
[ 2027.114714]  do_el0_svc+0x20/0x80
[ 2027.118031]  el0_sync_handler+0x88/0x190
[ 2027.121953]  el0_sync+0x140/0x180
[ 2027.125267] ---[ end trace 027f4f8189958f1f ]---
[ 2027.129976] ------------[ cut here ]------------

Fixes: fc8bb91bc83e ("usb: dwc3: implement runtime PM")
Cc: <stable@vger.kernel.org>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/dwc3/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 5c52da5..0444018 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1590,9 +1590,9 @@ static int dwc3_remove(struct platform_device *pdev)
 	dwc3_core_exit(dwc);
 	dwc3_ulpi_exit(dwc);
 
-	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_allow(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
 
 	dwc3_free_event_buffers(dwc);
 	dwc3_free_scratch_buffers(dwc);
-- 
2.7.4

