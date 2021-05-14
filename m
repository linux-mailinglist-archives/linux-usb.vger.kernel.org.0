Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D02380843
	for <lists+linux-usb@lfdr.de>; Fri, 14 May 2021 13:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbhENLRs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 May 2021 07:17:48 -0400
Received: from mail-vi1eur05on2040.outbound.protection.outlook.com ([40.107.21.40]:60942
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229470AbhENLRs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 May 2021 07:17:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tpb1ReCMHAtocBblr0BvYrNYdDRayJAOrKcDqGZJqUlp4rEySkWX+VPU6R4L+nlfBR1OiOIPH86tLywsl6kaiC9kM8n2jBrw8O+GD4lbQjyW8B5TXaBqUDU3BnURlMg2CgTQvxAy5AOqTLCmaTW4MYCPg0pL5Qwun2jkRKNQAn2cENeXJVoxPQLm5g26YK3JLQ75NKLzGg1c04owSLjIomOe1xHYvcVru9zL29gOIjKTzaD+zVqvRsr/TPdgvTBCzEiEvgsDhdohFtGNSbrBfKqPClcCNSxd36SozxwbS1QWo6Fxw3nCyNYC0kSop8Gvis7YbJM+Tj+XQtsuEOPkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xo5YWspGS94/PjkRQzgLl4P5SaODPMD9ViremTDdCQ=;
 b=A55CB0fVOaPAnMCmqZavIVKBByw4kO0n81feoHnRyApEqY+GovPylIpL4xrhu9JC23iI5XxkAwCTPDKCTteMXE7ZhB/vNVCZ/eKGPa6OuCs9v+Luc8ei+KEuaLuznQFWcMdbvTxJLc4UxjjEyotgDYFvaCjxfmAi3zLLaskpFj7NHJYy6875dZagud7qWtiVmZnqMiJc3OO0TjuJmYpxeq9WVvRVdjtrL+proEMaWQMf927dm6K+BEbfYEkSIkK0sSsHYWpoG/6LYT+Ygr71js1UZs0o1ngm2GKLMlQXbFk2CDHGFnG78g9SXUxaYyVsgmkpRPuvyH+L1ohgPdkd8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xo5YWspGS94/PjkRQzgLl4P5SaODPMD9ViremTDdCQ=;
 b=s4PhBHRPyIPGowf10q/Yde9/duOnxZtr9lsApx+vimqsBDYWRD7lmrBdv+vTKmEUa9oEbCe8MR2cOP4Df75D52QdS+wqimTsYT+X/4+MYeCtOqcsaqmffQ8tfGqbS8o3pZqkFB6d+OzwmbJE592GWsb853Fis1E4g/e3/Fuei2E=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB4272.eurprd04.prod.outlook.com (2603:10a6:803:4c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 14 May
 2021 11:16:35 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4129.025; Fri, 14 May 2021
 11:16:35 +0000
From:   Li Jun <jun.li@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, faqiang.zhu@nxp.com
Subject: [PATCH] usb: chipidea: udc: assign interrupt number to USB gadget structure
Date:   Fri, 14 May 2021 18:59:44 +0800
Message-Id: <1620989984-7653-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0066.apcprd02.prod.outlook.com
 (2603:1096:4:54::30) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0066.apcprd02.prod.outlook.com (2603:1096:4:54::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.25 via Frontend Transport; Fri, 14 May 2021 11:16:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c6ff662-bc8e-4454-44c0-08d916c9bbff
X-MS-TrafficTypeDiagnostic: VI1PR04MB4272:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4272D39EB2FD2A4AF9B8280F89509@VI1PR04MB4272.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:250;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IJfXQhHprDZfze5aUN2gn5GdiSRnzni9rPvyPRyxrTYuge+AzZtKl8ZuZtqQEkjL4eInHZdyi3Akwz9RJWxyL8+rQ6Omj3zH8vVcsksdJQTIwL4bbX+XAj6CuhurclCZ97qMSyRbGmJqCG7ZrdizX9k7A0qayfkT2KiVa+z4FkE443JjPZgX0Gh3VnrCwpY14Fr8QBXd37jrDyhoWp28hHBNQHVXPyiXUY9K0X57RLWl6lpTfNAOu1m3pfJ+gOnRq2Y4nGSnFsHkFFeF4hmJ75hvPxQBuBTQ9XdaB/3rxa/z/MTUFOp4X4VweUTL18qFDVZfQ82gsBIZ3m0nEOPQZe43IkHQgME9hxEi4Zwb0PfPcNFPw6wNAQSVvzlPzLeQGoLj+qbWmSu7bLW6pr6rJMpVxw+bv/zYodyTXumwfrPhFovhzd3esSpf2hJhivZZ74LpzH2TdJOmhsqKZ1aicrkhqyVX0+gW1QTbCrOW5/jDMutr9IfSzP7i2OatJ4g8l7YQiPzeoBCxzNvl1YM+NprxzcP6uzE6EcKk2Z53Y+iFAlR9u4s9fPIhjEFwrYDQYg8d6a2X/lqtdXJ7GvyZ6nMUXX770Dm8d7v3G64ZhPgOfwxMi+oG1r1XyVTuPeNImoNU0VT9yK6IczMmP0XO0tgVB4xDer+RzBs09ni9KHlx63/irqoS3AOFmIcfaurH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(366004)(376002)(136003)(6666004)(6486002)(66946007)(66556008)(45080400002)(16526019)(66476007)(8936002)(52116002)(2906002)(186003)(5660300002)(6512007)(26005)(6916009)(316002)(478600001)(8676002)(2616005)(956004)(6506007)(86362001)(83380400001)(38100700002)(4326008)(38350700002)(36756003)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ie2/dK2kXrQVyr0iifnqmxKXjwY8UVSTWQqJEu+Jir2QojFL0ZKXV8NLiUqd?=
 =?us-ascii?Q?3AkW6qjl6jv+5a9JCPGYx3YavdxgcFFwhf7bBT1/vTfziNN3aRn7wcKrIA8B?=
 =?us-ascii?Q?Wa+zjRAHpUQb6jThyx2O74cvPc/rlcCc/6vivz/PxuvdgdgZ5z4xq/iJg2TY?=
 =?us-ascii?Q?EykwdsEF+3lypym7E6vGCepXlSC7Qils+Zxe/fvA4RccLcDwtq+ULTx6LxgP?=
 =?us-ascii?Q?AN1B+XN10C5WNAeusXHPj4ZLNYzqDVL3pWSE8x2atoGDJt4hAI8fNdi+6Rz+?=
 =?us-ascii?Q?McyLKeLy07BHErxlBrNtl8Dc1BtjiIWhSJlKlW8/h2YurFiJkxOzB4/zEIkV?=
 =?us-ascii?Q?JexKrJ3H7QfkKarlUzhu6urr7EzchAOWNRPMR6txDBtcNaMd0ZhNlY9lvZYQ?=
 =?us-ascii?Q?M7USo2MwY4GKNZ/L0N58N6b1YgEsfm1CE3yWWJlknWtdnhXxkoG2atXCDFor?=
 =?us-ascii?Q?P6Y1pSOPb7g32m4BLtlVGv3+nU+tC+6bJTdh4hr5+GNcUHSCFY5jczxWYRot?=
 =?us-ascii?Q?HKBA3pqk3X+Xht4UMIE8hYWSFf5aRzaP6S3wAfc13yeKK9byt5rzZaJCdBQP?=
 =?us-ascii?Q?4NkBSrCNhRuWwrvbekDf9lG1WK8sUy3qFMKuSutdo9WxzKY3d38p1G8VPYPd?=
 =?us-ascii?Q?GP9Z3kyM21oMHnu6JI6e9SqiFibALmCjpm8SkOO+Zz5eYUFhdEIeUQ0SVuV3?=
 =?us-ascii?Q?PVkQ5tgjEIJtN9VDRpXNxzcp7gztYfcQP+3IIsrQUdNQ11IYbISg2sv9sBHB?=
 =?us-ascii?Q?+vwgZCYcPSoPcZBHxmegvtMIpiLEb49WWtpin0mNu5QnmjB6LUogulK7mIN6?=
 =?us-ascii?Q?wK/qg1Qbg3onsC460fQd+sWXixuvTCTPRVr/CE/cbIzD9UJkD62I2okxy7VI?=
 =?us-ascii?Q?Yswbr4g4q/6YfwqDjwQQqTonSLJA9In2Cx07I4pgfYsXx4oHk6zCrgehZOpj?=
 =?us-ascii?Q?Jm6nfgU/DkcyPeDGywE5K+/jVbBSFAid4IzssRG4Y0NnwmlZTKVoHcGpKO5c?=
 =?us-ascii?Q?QGvpDPWm65+TpTo2E5jAb2n8yXFtngpp6FZWFf+L2v3aTYsfAkkfw8Ne0wvr?=
 =?us-ascii?Q?CaKNFaIpizT/PJVNGqq6PsKWlnvAHy7WwWDAvGEM7ZqLWz02/1NVLhA4q+7e?=
 =?us-ascii?Q?G9JHmHfrQBSwIn3PqPFtvOeeqInxG39jfLs5sSpRK3siVAZXuMj0xc8sJ6xT?=
 =?us-ascii?Q?eYk7c+P4S1Wy/r9lJfRJ2lMLLbvjtHTvSFduWOBjM1FRkhJdcBiXJ/2xVQlZ?=
 =?us-ascii?Q?BFzitAjs1ZG1fYRYydHHPKI846n6JwULN3J/yr+K9JtqIJuqO20Z//GFDLS3?=
 =?us-ascii?Q?7Z32kbDtQPaiT7m1KYjtjbQv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6ff662-bc8e-4454-44c0-08d916c9bbff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 11:16:35.0450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOyRGX/zDR53eD5I2Bzws9h9xPTMhjy0jTos/Mgq8Nz6ZwBtLd2+XC9CaNiJn0Bw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4272
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Chipidea also need sync interrupt before unbind the udc while
gadget remove driver, otherwise setup irq handling may happen
while unbind, see below dump generated from android function
switch stress test:

[ 4703.503056] android_work: sent uevent USB_STATE=CONNECTED
[ 4703.514642] android_work: sent uevent USB_STATE=DISCONNECTED
[ 4703.651339] android_work: sent uevent USB_STATE=CONNECTED
[ 4703.661806] init: Control message: Processed ctl.stop for 'adbd' from pid: 561 (system_server)
[ 4703.673469] init: processing action (init.svc.adbd=stopped) from (/system/etc/init/hw/init.usb.configfs.rc:14)
[ 4703.676451] Unable to handle kernel read from unreadable memory at virtual address 0000000000000090
[ 4703.676454] Mem abort info:
[ 4703.676458]   ESR = 0x96000004
[ 4703.676461]   EC = 0x25: DABT (current EL), IL = 32 bits
[ 4703.676464]   SET = 0, FnV = 0
[ 4703.676466]   EA = 0, S1PTW = 0
[ 4703.676468] Data abort info:
[ 4703.676471]   ISV = 0, ISS = 0x00000004
[ 4703.676473]   CM = 0, WnR = 0
[ 4703.676478] user pgtable: 4k pages, 48-bit VAs, pgdp=000000004a867000
[ 4703.676481] [0000000000000090] pgd=0000000000000000, p4d=0000000000000000
[ 4703.676503] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[ 4703.758297] Modules linked in: synaptics_dsx_i2c moal(O) mlan(O)
[ 4703.764327] CPU: 0 PID: 235 Comm: lmkd Tainted: G        W  O      5.10.9-00001-g3f5fd8487c38-dirty #63
[ 4703.773720] Hardware name: NXP i.MX8MNano EVK board (DT)
[ 4703.779033] pstate: 60400085 (nZCv daIf +PAN -UAO -TCO BTYPE=--)
[ 4703.785046] pc : _raw_write_unlock_bh+0xc0/0x2c8
[ 4703.789667] lr : android_setup+0x4c/0x168
[ 4703.793676] sp : ffff80001256bd80
[ 4703.796989] x29: ffff80001256bd80 x28: 00000000000000a8
[ 4703.802304] x27: ffff800012470000 x26: ffff80006d923000
[ 4703.807616] x25: ffff800012471000 x24: ffff00000b091140
[ 4703.812929] x23: ffff0000077dbd38 x22: ffff0000077da490
[ 4703.818242] x21: ffff80001256be30 x20: 0000000000000000
[ 4703.823554] x19: 0000000000000080 x18: ffff800012561048
[ 4703.828867] x17: 0000000000000000 x16: 0000000000000039
[ 4703.834180] x15: ffff8000106ad258 x14: ffff80001194c277
[ 4703.839493] x13: 0000000000003934 x12: 0000000000000000
[ 4703.844805] x11: 0000000000000000 x10: 0000000000000001
[ 4703.850117] x9 : 0000000000000000 x8 : 0000000000000090
[ 4703.855429] x7 : 6f72646e61203a70 x6 : ffff8000124f2450
[ 4703.860742] x5 : ffffffffffffffff x4 : 0000000000000009
[ 4703.866054] x3 : ffff8000108a290c x2 : ffff00007fb3a9c8
[ 4703.871367] x1 : 0000000000000000 x0 : 0000000000000090
[ 4703.876681] Call trace:
[ 4703.879129]  _raw_write_unlock_bh+0xc0/0x2c8
[ 4703.883397]  android_setup+0x4c/0x168
[ 4703.887059]  udc_irq+0x824/0xa9c
[ 4703.890287]  ci_irq+0x124/0x148
[ 4703.893429]  __handle_irq_event_percpu+0x84/0x268
[ 4703.898131]  handle_irq_event+0x64/0x14c
[ 4703.902054]  handle_fasteoi_irq+0x110/0x210
[ 4703.906236]  __handle_domain_irq+0x8c/0xd4
[ 4703.910332]  gic_handle_irq+0x6c/0x124
[ 4703.914081]  el1_irq+0xdc/0x1c0
[ 4703.917221]  _raw_spin_unlock_irq+0x20/0x54
[ 4703.921405]  finish_task_switch+0x84/0x224
[ 4703.925502]  __schedule+0x4a4/0x734
[ 4703.928990]  schedule+0xa0/0xe8
[ 4703.932132]  do_notify_resume+0x150/0x184
[ 4703.936140]  work_pending+0xc/0x40c
[ 4703.939633] Code: d5384613 521b0a69 d5184609 f9800111 (885ffd01)
[ 4703.945732] ---[ end trace ba5c1875ae49d53c ]---
[ 4703.950350] Kernel panic - not syncing: Oops: Fatal exception in interrupt
[ 4703.957223] SMP: stopping secondary CPUs
[ 4703.961151] Kernel Offset: disabled
[ 4703.964638] CPU features: 0x0240002,2000200c
[ 4703.968905] Memory Limit: none
[ 4703.971963] Rebooting in 5 seconds..

Tested-by: faqiang.zhu <faqiang.zhu@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/chipidea/udc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index c16d900cdaee..393f216b9161 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2061,6 +2061,7 @@ static int udc_start(struct ci_hdrc *ci)
 	ci->gadget.name         = ci->platdata->name;
 	ci->gadget.otg_caps	= otg_caps;
 	ci->gadget.sg_supported = 1;
+	ci->gadget.irq		= ci->irq;
 
 	if (ci->platdata->flags & CI_HDRC_REQUIRES_ALIGNED_DMA)
 		ci->gadget.quirk_avoids_skb_reserve = 1;
-- 
2.25.1

