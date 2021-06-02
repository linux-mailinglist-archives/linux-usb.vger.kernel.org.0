Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E16D398613
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 12:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhFBKQg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 06:16:36 -0400
Received: from mail-vi1eur05on2047.outbound.protection.outlook.com ([40.107.21.47]:14017
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230118AbhFBKQg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 06:16:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zd1uzDcar4tNYhszWBV/ru8zKbptxp0ce7cIAoPGy4B2FKD5dcG6rrIMkkHriVWHB73+gBFHvWaeQnaXvWf4iG+Fq1YGk4p0U00+mXAC7m1HVcZAHzAKhw143ezPF6sJ1tbi07QhvbPOBLvcNJavwMh37IKYs0NU404HNuKB0guGszidj+XRhldVtD5H3dXnp6HQXNfvdi1dQ8Bo7lq6aMB70mCGH3QmZ6ZP1HhqhOxGejegXiFSNVoPp9kozZaNzkSNkkIAgnQxvpH53Iio4EXFytp99ja6QiRCptrzysinWKk+lR+XcnONruAMaK7Mlu8PK2//GC7GP4DgTcAPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjDJcxVpL3Uc6eFbE+43MI+UutAs2hc3/QYts3DrNxE=;
 b=XIHfmnKZU8jwHMAC49Zwl+eKdPoKf+V2GAsEYmx0kaRW4Kj1L37z+xO3RIORQ1tPFwavA5FJgxQNOlKj2rbKFgouHyDF/cXsUOY5Dw7SlBrGZA8lInUSKUgA1gG11MkuKOyw/q/Hv1l52PHy/NN4aweApQZ2QqxH4ewhJTkDYJ4j/odrGls1clRkvSsuFiaDenBhq5POywo0wUZWil0F7pqE1MHZ1LthFMOsUFADw8XRA9C1SNub0eRo/SpHD7Owz+nUOZahKdQkjH6fU4ddawpxCGSOQMHX/lBWDV6HGANsX6NGF5P32z3dkYFmy9jQpe78gZ3MnlNnNtPOtUmONA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjDJcxVpL3Uc6eFbE+43MI+UutAs2hc3/QYts3DrNxE=;
 b=pbXXtGVssa/7W0vAV/9kHp7YHpKn0hkDgBI1tbjeBiUiicMRfd39b0dE/O+jthttOWEq2UuNEm7TvMzKUhtUhT7uQMGsosO/CEiG3ov1vnZu01MDYE5X8qJy3UC4TVqcSsAUzLwOVmLf3ANjDbr1NvGHi3JXsg8wMHdUFzuimMk=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VE1PR04MB7357.eurprd04.prod.outlook.com (2603:10a6:800:1ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Wed, 2 Jun
 2021 10:14:51 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194%7]) with mapi id 15.20.4195.020; Wed, 2 Jun 2021
 10:14:51 +0000
From:   Li Jun <jun.li@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: [PATCH 1/3] usb: typec: tcpm: cancel vdm and state machine hrtimer when unregister tcpm port
Date:   Wed,  2 Jun 2021 17:57:07 +0800
Message-Id: <1622627829-11070-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0156.apcprd06.prod.outlook.com
 (2603:1096:1:1f::34) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0156.apcprd06.prod.outlook.com (2603:1096:1:1f::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4173.20 via Frontend Transport; Wed, 2 Jun 2021 10:14:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a0c9dda-a4c6-4e9f-b7e8-08d925af420a
X-MS-TrafficTypeDiagnostic: VE1PR04MB7357:
X-Microsoft-Antispam-PRVS: <VE1PR04MB735729B211EF1ACD1528141D893D9@VE1PR04MB7357.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hEd63uMmyWYPwNzcOq+BWHT7ou3EIt2Nr3ZmVUv9gpeNXXgIynTerYrc4V/swHJXMg95oP5ue1UoiAgaaxv2fUY6tLNGK3I43C7Thv5aAiSnUaiJ7k4zVRcemSJN9b9+tLYocHcr2Xa53GNUSVk6DLZBGah5pgysojYzRumvP/kCaLhIw9rfRsiRpEHhGXE7cvP1/I0HwoPOjHAT7fXm3HMMIim4LJOHVf6+Fb2LLsNKO7/DgVzxYXDBttYw07bChKU26Wo7D7qFwJ0g2XBviXvvpYYmUw4p/43uC529XwEf7mSL3A41f+qWsSv3kav/+39esQl+mpUWPhs4sYrH6DCWqGIoQvwcNZBh2z/pAu//A3E2Tg/DMqxtWNq1CMbjlkRsjWL7+EY/qP6v+2iitJMooRKe/urFeH3DeGStw+dTw8+asgd8TJxjdHgbx9+EHdaY/TzBFJOsU53G/+1vzLPfe79gNLbsJ252VNQpUrM6HsYRSDr2Q9VvN6XNmmU71QdBD5raSX3YiFI73Eat0PyWgZhbfTCVHn5UVtifUYH89qi+DrgFZ/MWqUJIOU1MuQn1Iwrjg1weu6VLeVd3bN06lko860brMoYYoI+8Su37ZfQBKrHdtwsdMldGU0WIjRmfrbTsThgjhwrCCPlSWf8+h3ZMnE2ImfG7FnB4K81GCGagFjkh+yRFeR+PNbhY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(6666004)(316002)(956004)(5660300002)(2616005)(8676002)(16526019)(66946007)(6486002)(6506007)(38100700002)(26005)(86362001)(2906002)(66476007)(186003)(478600001)(45080400002)(83380400001)(8936002)(52116002)(38350700002)(36756003)(4326008)(66556008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?09a57LuNhL3mjJX29S8Xw6XWyBXdDOTgkAGh2JUv1QpuNx0kYErftXpEDIvZ?=
 =?us-ascii?Q?pJXQSN+/OHuueApWIwSScfG5fiqqV7OpFmgCOKzdcmDy3JKSS9bhLg/XWnG5?=
 =?us-ascii?Q?VTixxoTyqWvEmhtWrYsc5yQvW6O7rPhDoOQI1eCMfKGPKQuh2xCskwPewEAc?=
 =?us-ascii?Q?a1CO9BkRnc7zCdakEP2xIFRk+u0BRO4o/J3R8NFBd8wndDDpN6jIDE292ILs?=
 =?us-ascii?Q?TCVbI0PStHyI9gBOU7DAwiLvIh68BeG4tVBqkgfqAFSiECUt0aGR1hXwzIqj?=
 =?us-ascii?Q?4fVwJAJ3A/LBvCWIu6t5U8d77WKjjdwyNRz0P3RZUHRx62FI7++yisKQ6m6D?=
 =?us-ascii?Q?P5/EqMmou3qll9sE59ek9p0/psoynylYgMDONC4CPR4WqJdp4XJICFoUp0uP?=
 =?us-ascii?Q?+awEfdo5m2u4GpMgCtZDTt+lCaEqKuY2iGbpt6/GB15Pno6PsXaZFD3Jr1zl?=
 =?us-ascii?Q?C+mD6teBZCpFt5fVsbOSxxZHNJ3i37VQ2sOJGBh9AmVH+PhvGyTse3WnQtvu?=
 =?us-ascii?Q?2v+KfdTHOlM+GX5h/BXdiqTdJRovbQszQnX5aHBTEs72/OTTGSUs/bLkIOh/?=
 =?us-ascii?Q?0VNo1+AAhgab1G2s67YbYTjGLvf/+YFtdtfOIQ7JGZGQB8LOlNejR1HUhkA/?=
 =?us-ascii?Q?takQsnIAUS/65/TpmrpUDtPWd9GvA+AL3nBRTOvo4RFt2Pcefdn8yW2AcXuH?=
 =?us-ascii?Q?7+c2+Krt7ZIM5YCwKV+HDVP7ZHdlTSxCHWb4QJisQdjT5zoZiAKmdSCScesa?=
 =?us-ascii?Q?6bpA3k9wZSFTlZ0Xcn2OUT3blc/Okbd3d4K3gwiLio8FcDWelilSA8eNOiNm?=
 =?us-ascii?Q?yBGGf6HX6nHTAHitFCF4aw6jRiBMfXcI1xDf6+dZr3i3x0niisslg/p3xq+w?=
 =?us-ascii?Q?+EeceX3QToXEMyJseihT+kBzAFM8XrrxXQS4UQ4YG8FHm0bo4F+nm12OgKBp?=
 =?us-ascii?Q?AAZ9qYC1QjTLHbikp6OIb38bY65Pcqpr9Vsz6JU8d59m28T/V4qZ2YVf2lMT?=
 =?us-ascii?Q?UJjnG2Ye2cFcPW964NwUBBp13dub3BTpVge0YAgvd19VkL1pmvFyekisymVY?=
 =?us-ascii?Q?vxA/Jul8q1MTR5qFPETLTwTt2OD1FV+UVxcync8p1o7letdMGs5mItfedmyG?=
 =?us-ascii?Q?Q4hHAmNBF2n9YTrJxmJJ69Qij85DIotpMtSdLXCt18bvZpemzBM1yz6oLI32?=
 =?us-ascii?Q?Dq5v+a9EOVW2QM58/dLwPwRt4IjsOBHKe1WmmhjoFauXCeH0q4vDh/xhAMHN?=
 =?us-ascii?Q?lJ+uT9DZNG2BOcgu1xS1evJUWteVCjqfYZYoC8gaLlykkOSPngxnCUi3jluh?=
 =?us-ascii?Q?vuewPQhTygbisoLWA3faRk7u?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0c9dda-a4c6-4e9f-b7e8-08d925af420a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 10:14:50.9167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJ+U4PV/rU9IQ9Gi2UKcLspKMYRIdQUNnKXeSzmOlnHv/MkVbWxksbDEYEK7PLE8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7357
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A pending hrtimer may expire after the kthread_worker of tcpm port
is destroyed, see below kernel dump when do module unload, fix it
by cancel the 2 hrtimers.

[  111.517018] Unable to handle kernel paging request at virtual address ffff8000118cb880
[  111.518786] blk_update_request: I/O error, dev sda, sector 60061185 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[  111.526594] Mem abort info:
[  111.526597]   ESR = 0x96000047
[  111.526600]   EC = 0x25: DABT (current EL), IL = 32 bits
[  111.526604]   SET = 0, FnV = 0
[  111.526607]   EA = 0, S1PTW = 0
[  111.526610] Data abort info:
[  111.526612]   ISV = 0, ISS = 0x00000047
[  111.526615]   CM = 0, WnR = 1
[  111.526619] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000041d75000
[  111.526623] [ffff8000118cb880] pgd=10000001bffff003, p4d=10000001bffff003, pud=10000001bfffe003, pmd=10000001bfffa003, pte=0000000000000000
[  111.526642] Internal error: Oops: 96000047 [#1] PREEMPT SMP
[  111.526647] Modules linked in: dwc3_imx8mp dwc3 phy_fsl_imx8mq_usb [last unloaded: tcpci]
[  111.526663] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.13.0-rc4-00927-gebbe9dbd802c-dirty #36
[  111.526670] Hardware name: NXP i.MX8MPlus EVK board (DT)
[  111.526674] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO BTYPE=--)
[  111.526681] pc : queued_spin_lock_slowpath+0x1a0/0x390
[  111.526695] lr : _raw_spin_lock_irqsave+0x88/0xb4
[  111.526703] sp : ffff800010003e20
[  111.526706] x29: ffff800010003e20 x28: ffff00017f380180
[  111.537156] buffer_io_error: 6 callbacks suppressed
[  111.537162] Buffer I/O error on dev sda1, logical block 60040704, async page read
[  111.539932]  x27: ffff00017f3801c0
[  111.539938] x26: ffff800010ba2490 x25: 0000000000000000 x24: 0000000000000001
[  111.543025] blk_update_request: I/O error, dev sda, sector 60061186 op 0x0:(READ) flags 0x0 phys_seg 7 prio class 0
[  111.548304]
[  111.548306] x23: 00000000000000c0 x22: ffff0000c2a9f184 x21: ffff00017f380180
[  111.551374] Buffer I/O error on dev sda1, logical block 60040705, async page read
[  111.554499]
[  111.554503] x20: ffff0000c5f14210 x19: 00000000000000c0 x18: 0000000000000000
[  111.557391] Buffer I/O error on dev sda1, logical block 60040706, async page read
[  111.561218]
[  111.561222] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[  111.564205] Buffer I/O error on dev sda1, logical block 60040707, async page read
[  111.570887] x14: 00000000000000f5 x13: 0000000000000001 x12: 0000000000000040
[  111.570902] x11: ffff0000c05ac6d8
[  111.583420] Buffer I/O error on dev sda1, logical block 60040708, async page read
[  111.588978]  x10: 0000000000000000 x9 : 0000000000040000
[  111.588988] x8 : 0000000000000000
[  111.597173] Buffer I/O error on dev sda1, logical block 60040709, async page read
[  111.605766]  x7 : ffff00017f384880 x6 : ffff8000118cb880
[  111.605777] x5 : ffff00017f384880
[  111.611094] Buffer I/O error on dev sda1, logical block 60040710, async page read
[  111.617086]  x4 : 0000000000000000 x3 : ffff0000c2a9f184
[  111.617096] x2 : ffff8000118cb880
[  111.622242] Buffer I/O error on dev sda1, logical block 60040711, async page read
[  111.626927]  x1 : ffff8000118cb880 x0 : ffff00017f384888
[  111.626938] Call trace:
[  111.626942]  queued_spin_lock_slowpath+0x1a0/0x390
[  111.795809]  kthread_queue_work+0x30/0xc0
[  111.799828]  state_machine_timer_handler+0x20/0x30
[  111.804624]  __hrtimer_run_queues+0x140/0x1e0
[  111.808990]  hrtimer_interrupt+0xec/0x2c0
[  111.813004]  arch_timer_handler_phys+0x38/0x50
[  111.817456]  handle_percpu_devid_irq+0x88/0x150
[  111.821991]  __handle_domain_irq+0x80/0xe0
[  111.826093]  gic_handle_irq+0xc0/0x140
[  111.829848]  el1_irq+0xbc/0x154
[  111.832991]  arch_cpu_idle+0x1c/0x2c
[  111.836572]  default_idle_call+0x24/0x6c
[  111.840497]  do_idle+0x238/0x2ac
[  111.843729]  cpu_startup_entry+0x2c/0x70
[  111.847657]  rest_init+0xdc/0xec
[  111.850890]  arch_call_rest_init+0x14/0x20
[  111.854988]  start_kernel+0x508/0x540
[  111.858659] Code: 910020e0 8b0200c2 f861d884 aa0203e1 (f8246827)
[  111.864760] ---[ end trace 308b9a4a3dcb73ac ]---
[  111.869381] Kernel panic - not syncing: Oops: Fatal exception in interrupt
[  111.876258] SMP: stopping secondary CPUs
[  111.880185] Kernel Offset: disabled
[  111.883673] CPU features: 0x00001001,20000846
[  111.888031] Memory Limit: none
[  111.891090] ---[ end Kernel panic - not syncing: Oops: Fatal exception in interrupt ]---

Fixes: 3ed8e1c2ac99 ("usb: typec: tcpm: Migrate workqueue to RT priority for processing events")
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 0db685d5d9c0..f47685e7923d 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6328,6 +6328,9 @@ void tcpm_unregister_port(struct tcpm_port *port)
 {
 	int i;
 
+	hrtimer_cancel(&port->vdm_state_machine_timer);
+	hrtimer_cancel(&port->state_machine_timer);
+
 	tcpm_reset_port(port);
 	for (i = 0; i < ARRAY_SIZE(port->port_altmode); i++)
 		typec_unregister_altmode(port->port_altmode[i]);
-- 
2.25.1

