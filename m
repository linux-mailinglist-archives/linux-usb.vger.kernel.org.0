Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7313C229474
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 11:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgGVJGy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 05:06:54 -0400
Received: from mail-eopbgr130079.outbound.protection.outlook.com ([40.107.13.79]:29328
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726153AbgGVJGy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jul 2020 05:06:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bcb6VJ2oxGvmmA8fZNj97jReZ6vF17lBF6WtMzRACxPUgMUoeihGsbnUlQeiAcEtxYbjdpMi52TIIbUVnk5JTqO6pICZMlwZxx1H4/ZOBy9P/FDEmQHYiZ2y9jiI1KFixY6tRs1k/KG84+p7WNyYsM1tVYQUGbUJVZL3JqGAfc5sVC/Rjjh1LKsAGQGFrPUsaBrOU1I75iZjY5fVJmZKv1Pb9JGO4Q8IdyYd9gdGuAHHHH1T0I8sz7UmV4RxB/XwcZjRa8+z8D22tnyfJa/3EBOEXuCiJ+Il19eiaIjhm7mhwuR9SQNFQEircYvlbDteMunXmevpZYhjF0m3MvjNXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KPlMIdN5G9t+6CDjmEI7Ah/MD8ljvCO+Huv0sbC8X0=;
 b=bMzZ/5sf/Tf7xCJH8yEsdds/PgW2qsWT3QsUHD2dyLRT9jKhYVs3/lUG/mWzQb48VKrtOiHEAJVEtEFxant8Lku3IawYJGld6gq6bSPD8dreS7d1PaeeujOMSX9C/7a0FPbo9p0tkUNLmJRw039nTbpmryeYv4Gu26r+I7ZrpfHeF82EVsCXCB7jD6eXuHNjknT5d82SmChjM7hAKIRlepqnwutIKBROvaLGqEOI/NmaHZG/gseA1t4BeDDL8S+nTk/A3hffN4cKZSdxZ3d+JAfGystrbt4X0qChVSmIVuGs64Uu53gn1Ac8FfLJPMvq/Hqd54h8Dwbz1coeFzrjKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KPlMIdN5G9t+6CDjmEI7Ah/MD8ljvCO+Huv0sbC8X0=;
 b=CDbXo7We5i3is5uIgysglxuIRUABti4cL82FkuePdAPFCNZeKEGeBb9b9mf5hna5d5TrvSVQuBBbIjGWJAd+AAsmGIkDzo/N44PGySTC9MDP+gIecpqeAtn72+sRKToo/BB80phhMznnolY9mf4meIqQqWwuThd9FcA6plMQ92I=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6517.eurprd04.prod.outlook.com (2603:10a6:20b:f5::12)
 by AM6PR04MB4743.eurprd04.prod.outlook.com (2603:10a6:20b:2::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Wed, 22 Jul
 2020 09:06:48 +0000
Received: from AM6PR04MB6517.eurprd04.prod.outlook.com
 ([fe80::11a9:bf16:14cb:5821]) by AM6PR04MB6517.eurprd04.prod.outlook.com
 ([fe80::11a9:bf16:14cb:5821%6]) with mapi id 15.20.3216.022; Wed, 22 Jul 2020
 09:06:48 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3: debugfs: do not queue work if try to change mode on non-drd
Date:   Wed, 22 Jul 2020 17:02:55 +0800
Message-Id: <1595408575-13150-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0063.apcprd02.prod.outlook.com
 (2603:1096:4:54::27) To AM6PR04MB6517.eurprd04.prod.outlook.com
 (2603:10a6:20b:f5::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by SG2PR02CA0063.apcprd02.prod.outlook.com (2603:1096:4:54::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3195.18 via Frontend Transport; Wed, 22 Jul 2020 09:06:46 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7ed98f22-c6f4-4624-e62d-08d82e1e9070
X-MS-TrafficTypeDiagnostic: AM6PR04MB4743:
X-Microsoft-Antispam-PRVS: <AM6PR04MB474384CFA1E67641440870FF89790@AM6PR04MB4743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:398;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QRBnP/uiCoEv/nLORYiGM2rxMhwVV1qkrBvHoDGcwP7cvDycDPAGS/4sPJLwue+NzbBWYhjajxO0j2/pCCqxLhLWosIQOHAyOOmzQWP5yN+S2wF/2KB0yG+lzHOY0OK2Z1Uj7z8vchy7qy8d+u6GAYEM3cHniEnF+YvS2oczbbd14GTnP8y7IkrtfNocGB468nla8jfJGb3K/COcmUEcFlzrFzEFsJ6/rQj/bU4+ojSIxm8J7o90PVJjfUCegxdFbyL/nMsgCqs03lQilIFQ6dCpK8su5E2cC+4Re2WTps30teLSgVFCeNoXS4e5hpqqY8Judk/jOYDvRnbFV/TagTc0gHg8nhJMLeXQOnK//scjxH4parFmRFPfiS4YXryF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6517.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(6666004)(36756003)(5660300002)(8676002)(2616005)(69590400007)(956004)(4326008)(2906002)(6916009)(186003)(86362001)(6486002)(478600001)(316002)(83380400001)(52116002)(6512007)(45080400002)(66556008)(26005)(66946007)(8936002)(66476007)(6506007)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 66MhF1JotsuVHcQg3kbwwKAL+mp789r+uLzDdkziYVxAiFjvXaf9M2oQU5MIoVKbVhDG7WT3FlCp5VvzHTWiVHq/8gnZ+KEveZzV1n3RtTlkbQOQEbtAmYWdgw9z+9QRf7zhuCa9Y+4DG9Jl86R15zKLHfvU4/u+ZpwAFCm9e6oR4SNfnVuMKLJHJQ5JVQGCt1aEVARS21uMbon09sotc1lRtxxAWpSiXpijbdOoVjE+AsYyH9LYdquhjX9JyNZ/2akNlfkWtFwZit3tF5fsMVi2vqxmC26Fy/Y2jBMJpoHTkslMvPRLb5FFO1kTFV5K62brbmo5edyoGB69WEYEFVDjKSSOQy8HHmzO6XFRy/E9joh8Fo7snl1qI94umJIMuzMNlydXuXuEHpLtlgCxyTYOIMAKSxMcSNK6oGz5f7mYG7rCFJ6PWap2OmLWII85t90eX1afSMf32MIlbT9YyduKmiv+hrZ9dyZJaDUCx1A=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed98f22-c6f4-4624-e62d-08d82e1e9070
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6517.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 09:06:48.1998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P34DeZdSx4WFAXX2cvZ6ZkA+Lp+DdzjmIx6+KOqgzTbdLgKEOcRIX34x056Eoiig
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4743
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Do not try to queue a drd work for change mode if the port is not a drd,
this is to avoid below kernel dump:
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
 drivers/usb/dwc3/debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 6d9de33..99e7f53 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -428,6 +428,9 @@ static ssize_t dwc3_mode_write(struct file *file,
 	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
 		return -EFAULT;
 
+	if (dwc->dr_mode != USB_DR_MODE_OTG)
+		return count;
+
 	if (!strncmp(buf, "host", 4))
 		mode = DWC3_GCTL_PRTCAP_HOST;
 
-- 
2.7.4

