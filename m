Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD673A113E
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 12:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236484AbhFIKip (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 06:38:45 -0400
Received: from mail-eopbgr50050.outbound.protection.outlook.com ([40.107.5.50]:26596
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234105AbhFIKio (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Jun 2021 06:38:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpQkzIOoteoPGhLMgrbpn9InnX0wd2hNBMfA5z4npqO0fR+WXj9ahq0afos0rVOE7bHovJQASvO2GnY8XWpkvWw+r5100KluK49FD2Y9elTQRQuGKCRYiBi2gpt7F/v/aUTIYT5JGBykZ3WWdnVcPwEdX/JYyx2hHtreni8lMD+oCGN2osDlOdO3n4ZWJuRcAe1MzlysT9j8MMwuiLuYnquvH8sDBVnsgmI8+5ZZr/emKxwB6eU/JvMDruT3yfErhlep0Qh5oMSf3iyz5Yc4gLkaUTDtE8n3lBoLf9jFupabar/N5QUcPVhXqNIXy01XlOQ6peP6eV0MQ4h34jFUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpG7XiYR4jFmMkNvmCsv23Te0aPBc3ez0KqXEQBUXBk=;
 b=JCLxHm1Qzp4b3HO541Tp0xt8yHLzKBgNS3JIWkRlB1GWa3ce8dNgiXQtP5/y5FG7ImcifbubRuZ6vVwSoIfB5GkWsPPw2tkvxiQ50/Nj6OQcsI6jDLGsdzikLrsK3PQSnDSiMBkIXULA3WSUx1kWWAueaTZar0VyLNy93banMjzh/jn7WBuWWI7xvjYaaK5dcvfCvdVzaBxwmCN/0cyc3ihhWGJTy5pq2qohsnd/zD4Kn9ab7mru8awT+sXOn6L+vh2+6zIUEawG5X6v4lYT+l8rbfcfB7lqt9tV9ybjDaJ16/Fbr6RL2JY2t4A5uQAK9SUs7qi1Ay4yulORkCHadA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpG7XiYR4jFmMkNvmCsv23Te0aPBc3ez0KqXEQBUXBk=;
 b=jejgUarwSsR/xEv3NgBTpZ1LSmk1tG22CuBLrMCdd2IT7uItpUGUD22nWuvvAXxx6g6Zc0z46rJfwBc99nlJxIzS/GsFfN6VhI4spvJatUkUhc30h7GWaYG6Nl//H8TKWH7wHnJaMfVfQWjg3t/5zIzclpdzCtDvV9bqdqnGduw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB3024.eurprd04.prod.outlook.com (2603:10a6:802:d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Wed, 9 Jun
 2021 10:36:47 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194%7]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 10:36:47 +0000
From:   Li Jun <jun.li@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, faqiang.zhu@nxp.com
Subject: [PATCH v2] usb: chipidea: udc: assign interrupt number to USB gadget structure
Date:   Wed,  9 Jun 2021 18:18:47 +0800
Message-Id: <1623233927-21476-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0103.apcprd03.prod.outlook.com
 (2603:1096:4:7c::31) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0103.apcprd03.prod.outlook.com (2603:1096:4:7c::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4219.12 via Frontend Transport; Wed, 9 Jun 2021 10:36:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17855c88-8eb3-4aac-4819-08d92b327b7c
X-MS-TrafficTypeDiagnostic: VI1PR04MB3024:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB30248F89945695E9536A472589369@VI1PR04MB3024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hN5PpWS8iXylSuDenwpVUfY5Qb3ak+ScwhcLtQmro1G4kK2MoW34IB2WRP0/cWZ0qwFCARZid2l1TUWD77ZP62CYyA5+Ek+5OfmhQhI8nS2JOxh72EpWIYkX5hkMXJVwIUM8OudPUXs/GHXKwwNr3PmsTvaudJegRETY/tAT3ep9bFzdWPGyA6WcaJ8HZaNLihMeNTQ887UBYxGmaKbccw5I6GRIllV9I2rZwe0AUihTpf5kFM4WycOWrsYtQJzOrCr8hXtfCIxptNjmx/Pl4c+h4dJbtrVXLlb59hFtLJ+bRUl9RRqnC5i0qC0lmFRGbURjPAinj/NErGfpqYWVmTC+liquAtPUq7oRsmwtSQBDKc3qZdJixy/ru8nVpNYCoi8quV/RwaoeKYgjle4VJwQ1UTszKPuz5O8eBhEpxOxMDWksasdCvIg97TXaeey8YXjK2kHpY/pT1Mal9du8nFYyt/Sw6ZANX6ezr3pE+UNDvsNLptBcjFby0s81cqiCn+I3G+3FVSL6gX/Kwu76kRTmJWp16tD7jf9MIN8aLIKrYTPMase3YrmnkrCmoxfsGoFvp40QxDtRywSVYwL4uPBf2CTP4ZHeC/OrI11EdBbDrRo0wo8rOj7LAhMBXKKn+x2tZVc6wOAqiSUrmjaoed49zPaE3QtZAicF9U7sX157OyAodXS1swdm9sHyYtvE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(52116002)(38350700002)(6486002)(2906002)(8936002)(36756003)(6916009)(38100700002)(45080400002)(4326008)(8676002)(186003)(2616005)(478600001)(66556008)(66946007)(86362001)(16526019)(316002)(83380400001)(956004)(5660300002)(66476007)(6506007)(6512007)(26005)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DusTINU67nqViX+EvDBBgDG0d7wxlri6kcdh92At/r7SZEfgQ5xLlfcLg5l0?=
 =?us-ascii?Q?QtWUzULNGFO+Ach6bNIsPpFT29BNIUDjRnMFf/GT0sG1bo+MpG7R3yKWfcjY?=
 =?us-ascii?Q?lkKU2rxlP4H+uWhOu0LovuuyHkfdQgpKP94+ENuwC4s+4/lHD+sSepOqQrgQ?=
 =?us-ascii?Q?K2iTTFfwWFPtSa0Df4qMZ6G13yJSUuNbO0QAjTvum7IxknW9xXhJJ83NnVBk?=
 =?us-ascii?Q?RGkFIBcIKUK8HD2SmD9cIL9Q8XEodIbrXQkKMtFgMIfMobkmNC2r71nnbUBE?=
 =?us-ascii?Q?rRKDPRC/G7azDKWNOGEqwNZ85NVrcHMIr/6V5OOBvbqx/wTXHcaziJ7pNJY9?=
 =?us-ascii?Q?R3VV1T0FUy7+OBrzmvPBkIclOpg4cDC7vku589DCf4ONvyEvqYNnywl6GqmR?=
 =?us-ascii?Q?UQLvBnkbRWqBizt1EKvgs1annN1MPsmz/1D8csRD176/tTINmSJUtyBfgQMm?=
 =?us-ascii?Q?SlZkK/E7uL5iwZM5A7fDF8s54K0Cw/a+dGsmpV54FL90IQ4Fu03zbAAN6hmw?=
 =?us-ascii?Q?1yPyZo22O6ZqUhqKd9XndqleHN39mid44GwypGJg+ZUHlQ1zEZA5aUCmt/EV?=
 =?us-ascii?Q?spU6RcHrHFLBzeGY3sTFtqaZgU73s605j+jwh226UiS/TN/SDCa1oM82N4q5?=
 =?us-ascii?Q?BwD8FMU4QR7npLjCzxcM7SKcLYtL/FmeSacv+I2lKrl7qmDsek25SugcuRSk?=
 =?us-ascii?Q?7J0EjnpGVtQA8i9C75m2Du/FM+rM2EEWzdlj5PrmNTTuJar6uW7v+V9lfs+x?=
 =?us-ascii?Q?yJmw0Gnzh/G0zKuY4zo/CSZhmZ/MSqNhKh7n3WmAxvaKqvdXN/zz8/x1FVzr?=
 =?us-ascii?Q?WmJGEvTikEDZiCPXImy8ScMluZRSlB4R+/H/CGZ1hNhHW+xSFH+ixw0BndcM?=
 =?us-ascii?Q?cBbHE8rAlEsFPreyiUusvKHTvtAKOfEU4c5th/uP+fqIx4t3XCCwmflA3OVz?=
 =?us-ascii?Q?nFuSLUB3Hrt+g/QUl2m7q04vCBLBmX7Tup/9bAEtGY88/epVLzUM/MI2dokA?=
 =?us-ascii?Q?YQUsdP2j84s0Ns6akIhekFuqvlF3FPKNxji7N8xoPk4YMSKCT94y5YCkmnCS?=
 =?us-ascii?Q?uCvr8lX/D8px5gatYOmAXXfMUB5Jthm6E8d2lRs0IJryST0pE6d19udtPwg/?=
 =?us-ascii?Q?OwsRgNzofmBPWRKuXuI136v0BND6jJN7aiMLnuVbtWpOZJIz2Ht6OA8gA36R?=
 =?us-ascii?Q?XHyLlTafLaIv4kdecPaGp7xaWZUk6JN1WNFnWmSjuYLaueOv3pDozXFxsMpI?=
 =?us-ascii?Q?3mu98LGPuaoo0V0yHT2w61tJtVxIHGkiHbRXtbObPsJrBUB9XQRhKC4PHNxL?=
 =?us-ascii?Q?Kxqkzx2PVQ22IMAA+nZnpDo9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17855c88-8eb3-4aac-4819-08d92b327b7c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 10:36:47.1876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VK6FZz90ivcUFCtOQw5a+6W/FqGLMYR7SyY8apLywNQbKdVf1/X6hi5ukBhWQvNe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3024
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

Fixes: 3c73bc52195d ("usb: gadget: core: sync interrupt before unbind the udc")
Tested-by: faqiang.zhu <faqiang.zhu@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
Change for v2
-  Add fix tag to know how far this patch can be applied for
   stable kernels, the commit of the fix tag is not the patch
   introduced the problem, but the commit this patch can base
   on, I assume the problem exists all along.

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

