Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E826322DB89
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jul 2020 05:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgGZDVu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 23:21:50 -0400
Received: from mail-am6eur05on2048.outbound.protection.outlook.com ([40.107.22.48]:22112
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726264AbgGZDVu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 25 Jul 2020 23:21:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5RZOavu1q3n2siudf8X7UmuRbRO9P50DV2B8/5ORbq8k2kRW9vAUKsi6Z8hiHiew4EthEGdig0WrlibMk8TXD6yRjSvyzUqJ/tSOSjkN73nGPvcMrc/QFwMKQwwvytDAPOy+Wxwmdf4un6sHGT/fqqXu18pnJZreWdNxnS3/ynjWhqlGGsO1qW7HPL2o8Y/kLrGk3SrcelvndRTXMOk3WaABc1YbWoHWc8+DOUZiC8IUDKKPogOGOcZiEnaPJ6sJpBah/l7XpCx21HN92MiibTr1krO/gYH+fWzfVQrejpmf6GibGA+kZDn9ZvoQ6855Q7Ep+4QQk+wAgaQedCZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4UDJnfkMrYIy23N2wlKz3dRcOOMZKVKg1RTG/jjINQ=;
 b=JT5AALy9MQ0gWQ/grku/FDeuSAglzqQQTVRMDSnA24assmXS3vfzkyF18DlUdp3mPGvfXjkQICvJTG/kfGK+H+/J6iyxPqKJLddIoiUXhWEeAbj52xQARcIgH7wNaiJY665qYFPHOy9GDm2ChblN9X2Yaih7fNSp/AjjYLPXfrwvV0i8pvTaS39VBkTRPggg9Ve1SD8RdaO1kczwik+Vz296Fu07imPcrEtw6gmUqchmpjrvRORcbmkBZrn8QBzY4KPpQNLiLh7+AjfvAAjBKIl/eRGHDpZnzDoNXQrqCGAnFAYoslhLHILgRwuJpANL7d20RUOJRAP5H46rhj9FRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4UDJnfkMrYIy23N2wlKz3dRcOOMZKVKg1RTG/jjINQ=;
 b=GokgIL9vasE9nGaAuS58MInb3iSfY/9Gl7zsG8WV+rHVg43WU7JEO4UkTIQuLe1nBRsqJJvYqC1kFbWkER59S4+e/ut6koAjOXcXJG1bIwBmfgnrGf0yR97Qe1hw92RH1s09xU3ODDLr7c6zjlFKdP34wOQ9Fz2/USNivI+Ey2M=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0401MB2574.eurprd04.prod.outlook.com (2603:10a6:800:57::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Sun, 26 Jul
 2020 03:21:46 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3216.028; Sun, 26 Jul 2020
 03:21:46 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Thinh.Nguyen@synopsys.com
Subject: [PATCH v2] usb: dwc3: core: do not queue work if dr_mode is not USB_DR_MODE_OTG
Date:   Sun, 26 Jul 2020 11:17:39 +0800
Message-Id: <1595733459-22298-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:3:17::14) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by SG2PR02CA0002.apcprd02.prod.outlook.com (2603:1096:3:17::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3216.20 via Frontend Transport; Sun, 26 Jul 2020 03:21:44 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 22d7e5bf-83e7-4f0b-a38f-08d8311306b6
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2574:
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2574C8DEA758A8FF6E6476A189750@VI1PR0401MB2574.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vdy1WqOPRsQk/k6MPukQElBd9qc46WnNhYBhcVZoircHP9bRXaF8aquGk985GIZvR4YGiw17BKYPsjq0qAN292FV/KoziIj45pEw0nRLQDBEUjMEqc6/z6Xd2D9irUydQpy+8LO6K52QfqEz8q7dCbizr023GgFRrgFcFViPXafcnPT5r9In5fIbyUC34PlzilIc4DI+7avDBWzo4i1k49gi2mEXPpXFXzTWVfVWPb+WYHontGjzIKnxsNkgItnc1ljnithnoGdvpi9zHcGNvhJe4yZr6axh03gDAgAVW6Z6uYS0+a4ymbuWGlnXrQkeDA06CfKugAXx2/xcqleRLBMpAdoY09EteCDUKr+wf6tH3HOoZ5uj10TDcGhVaV7H
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39850400004)(376002)(396003)(346002)(136003)(366004)(2616005)(2906002)(86362001)(316002)(8676002)(52116002)(69590400007)(956004)(478600001)(8936002)(36756003)(6916009)(45080400002)(66946007)(6666004)(6486002)(26005)(16526019)(186003)(66556008)(5660300002)(83380400001)(66476007)(6506007)(4326008)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: FGdt8VR1B0bQ07OQrHEdhOTc706JeI4D2P4Io/ZWHv/La+AF4N5RgqG0nDGNpoxI1G1aLpY4wGjH5bvt/2jxLMpaP1SJjlws+oMl+4iNbcZuyEXEdce14c/k5MoLtBg6j49bK95/q5p0JY3DbMawpVXzZ9IKmtnzU7e7sVfghDzX5UCGmzdj5AJwcDLUS9jCPLnSidH+12PCM493mQQNTYohlegtLYLNUiiujWiv4zKzZyl/9qcXbwsC7z5JMycADG3D+GPrHdAr2qigmVwcgjoto4Zc5HubGkRCEtAxAnPaJ/VAMuAJ5QSZXF2M40Xtn0s4jh4wk2LvPhPZlKaAxZS8WgO43GlaNT05jh+1Z5R4zjwEgjg/PCeiyIfebrvSbmdxCBsMxCTWaCq8H0N+nPsnxhueGAkjJs09LpBm8cej+WE5Ethbh5ZsgZPPb0oR1jNmDXkfKluiYjoUqfkY00OM02s6BGWCzfsNbEB2pjk=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d7e5bf-83e7-4f0b-a38f-08d8311306b6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2020 03:21:46.1986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6W5XkJ/SGT+dNFQKLC1da9jls1M4zMH+7lnzNCcuQWcQCtaetYJlnjH1cpwWDtG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2574
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Do not try to queue a drd work if dr_mode is not USB_DR_MODE_OTG
because the work is not inited, this may be triggered by user try
to change mode file of debugfs on a single role port, which will
cause below kernel dump:
[   60.115529] ------------[ cut here ]------------
[   60.120166] WARNING: CPU: 1 PID: 627 at kernel/workqueue.c:1473
__queue_work+0x46c/0x520
[   60.128254] Modules linked in:
[   60.131313] CPU: 1 PID: 627 Comm: sh Not tainted
5.7.0-rc4-00022-g914a586-dirty #135
[   60.139054] Hardware name: NXP i.MX8MQ EVK (DT)
[   60.143585] pstate: a0000085 (NzCv daIf -PAN -UAO)
[   60.148376] pc : __queue_work+0x46c/0x520
[   60.152385] lr : __queue_work+0x314/0x520
[   60.156393] sp : ffff8000124ebc40
[   60.159705] x29: ffff8000124ebc40 x28: ffff800011808018
[   60.165018] x27: ffff800011819ef8 x26: ffff800011d39980
[   60.170331] x25: ffff800011808018 x24: 0000000000000100
[   60.175643] x23: 0000000000000013 x22: 0000000000000001
[   60.180955] x21: ffff0000b7c08e00 x20: ffff0000b6c31080
[   60.186267] x19: ffff0000bb99bc00 x18: 0000000000000000
[   60.191579] x17: 0000000000000000 x16: 0000000000000000
[   60.196891] x15: 0000000000000000 x14: 0000000000000000
[   60.202202] x13: 0000000000000000 x12: 0000000000000000
[   60.207515] x11: 0000000000000000 x10: 0000000000000040
[   60.212827] x9 : ffff800011d55460 x8 : ffff800011d55458
[   60.218138] x7 : ffff0000b7800028 x6 : 0000000000000000
[   60.223450] x5 : ffff0000b7800000 x4 : 0000000000000000
[   60.228762] x3 : ffff0000bb997cc0 x2 : 0000000000000001
[   60.234074] x1 : 0000000000000000 x0 : ffff0000b6c31088
[   60.239386] Call trace:
[   60.241834]  __queue_work+0x46c/0x520
[   60.245496]  queue_work_on+0x6c/0x90
[   60.249075]  dwc3_set_mode+0x48/0x58
[   60.252651]  dwc3_mode_write+0xf8/0x150
[   60.256489]  full_proxy_write+0x5c/0xa8
[   60.260327]  __vfs_write+0x18/0x40
[   60.263729]  vfs_write+0xdc/0x1c8
[   60.267045]  ksys_write+0x68/0xf0
[   60.270360]  __arm64_sys_write+0x18/0x20
[   60.274286]  el0_svc_common.constprop.0+0x68/0x160
[   60.279077]  do_el0_svc+0x20/0x80
[   60.282394]  el0_sync_handler+0x10c/0x178
[   60.286403]  el0_sync+0x140/0x180
[   60.289716] ---[ end trace 70b155582e2b7988 ]---

Signed-off-by: Li Jun <jun.li@nxp.com>
---
change for v2:
- Move the condition check from debugfs to dwc3_set_mode()
  to cover in any case, we queue work with drd work inited.
  then we don't need this check in__dwc3_set_mode().
 
 drivers/usb/dwc3/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 6adaa7d..2fa50ec 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -120,9 +120,6 @@ static void __dwc3_set_mode(struct work_struct *work)
 	unsigned long flags;
 	int ret;
 
-	if (dwc->dr_mode != USB_DR_MODE_OTG)
-		return;
-
 	pm_runtime_get_sync(dwc->dev);
 
 	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_OTG)
@@ -205,6 +202,9 @@ void dwc3_set_mode(struct dwc3 *dwc, u32 mode)
 {
 	unsigned long flags;
 
+	if (dwc->dr_mode != USB_DR_MODE_OTG)
+		return;
+
 	spin_lock_irqsave(&dwc->lock, flags);
 	dwc->desired_dr_role = mode;
 	spin_unlock_irqrestore(&dwc->lock, flags);
-- 
2.7.4

