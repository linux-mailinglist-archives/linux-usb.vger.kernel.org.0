Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA81E2432E5
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 05:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgHMDjC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 23:39:02 -0400
Received: from mail-vi1eur05on2040.outbound.protection.outlook.com ([40.107.21.40]:46849
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726621AbgHMDjB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 23:39:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMpvvAk77Ee0fyp53VqphuuzMTvnB/eFOJCeDkIBfeyfKNfv5G6UMKJZTXhip3QD+AmMvNkzFQaglQYfSxYLQVCfuJ6CuGDPBdn0Qt/AofvAPx5kYpSuUJFiv6d/7dj5Z5sYrknvmlrSamdZygg0cMAFUzkkxUPAqXlstoKMIGpMMfdRHvwVdPYqCCT+wxMV5bQn27Fc0wSynHkZt2ooNvzfeBwqiz6ilgIK0XkRu57J0E32UyEJ3Guv2g/pQSqxh7T1tpRTQCJXfGfEyDG+8QOxfhQ9LhllRjAn7D7pACznkAOwZnn1TegEKR9B+QJHjxFLGY/AR8fpi+acAjknsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiygfphVRc6jCRLTweWBo0aa43+acXpEU7O3O1eRSHM=;
 b=d3ywwgD/z0qjD+lIMUWFfR7HhYhI2gM1TNQhyZ2QdXiHp/u0gV6HqfM/MN6TZAhvpf2p5p9Y3Z9gQTwzYRpo9kI5b7+L3m56+kULe5UEXj9IxA/7mH1zfaAEsqFGLBTCUvwp/0CRlBzVzUI6nsUhDINV+ENQBpuYFEEE2kmxO3Ug/Q1HrFMjdj04gm5LCn3jddjCDf/2gSe5o0gI+rabHNGJanPE4U4LYwxsraukQ8V74QvcMc6Tb395ZTkb8uizWWXbG8ruKdZXJTmN1sYS2ABbpDvAAnaOG7WNczwRo8268j//LgM7ZK42tOWo3ZR/iYQ2G5n9S/lmU/Q7GrXNdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiygfphVRc6jCRLTweWBo0aa43+acXpEU7O3O1eRSHM=;
 b=mMh4Fjkx0EA+8irnRHDX/vwbHwJuWqC7g7FOOcdr23d6xfOLDCfrxMqOeLtRdSDE7j/4XhQwX57spGuomoYgx0OXUbLtGJUR6Yq36qIMzUuo6uyaC2IFZxkEbfTCaSd7aT0PN/BREMfUkplL8myGKspSB524Olb2Z9pQV9GiJlA=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR0402MB3654.eurprd04.prod.outlook.com (2603:10a6:209:21::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 13 Aug
 2020 03:38:58 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 03:38:58 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [RESEND PATCH 7/7] usb: host: xhci: avoid calling contineous two times for xhci_suspend
Date:   Thu, 13 Aug 2020 11:37:41 +0800
Message-Id: <20200813033741.13982-8-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813033741.13982-1-peter.chen@nxp.com>
References: <20200813033741.13982-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 03:38:56 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f48e7fca-af9e-4392-3ffb-08d83f3a6937
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3654DE86517C3BFF3DAFE65A8B430@AM6PR0402MB3654.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(6506007)(478600001)(316002)(26005)(6666004)(36756003)(6486002)(86362001)(186003)(6512007)(2906002)(66946007)(6916009)(66476007)(66556008)(4326008)(5660300002)(956004)(2616005)(16526019)(8936002)(8676002)(52116002)(1076003)(44832011)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f48e7fca-af9e-4392-3ffb-08d83f3a6937
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 03:38:58.0439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zO5K6KG03RQLvtGRN+cf34ljFBCyjld5K7ZQdz8rMej7t1duIbcQW4Uzh7uAPGAGxhvl8+ydZS4n41FIgDzCWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3654
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the xhci-plat.c is the platform driver, after the runtime pm is
enabled, the xhci_suspend is called if nothing is connected on
the port. When the system goes to suspend, it will call xhci_suspend again
if USB wakeup is enabled.

Since the runtime suspend wakeup setting is not always the same with
system suspend wakeup setting, eg, at runtime suspend, we always need
wakeup if the controller is in low power mode; but at suspend system,
we may not need wakeup. So, we move the judgement after changing
wakeup setting.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 3c41b14ecce7..cde71f3b9767 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -982,12 +982,15 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 			xhci->shared_hcd->state != HC_STATE_SUSPENDED)
 		return -EINVAL;
 
-	xhci_dbc_suspend(xhci);
-
 	/* Clear root port wake on bits if wakeup not allowed. */
 	if (!do_wakeup)
 		xhci_disable_port_wake_on_bits(xhci);
 
+	if (!HCD_HW_ACCESSIBLE(hcd))
+		return 0;
+
+	xhci_dbc_suspend(xhci);
+
 	/* Don't poll the roothubs on bus suspend. */
 	xhci_dbg(xhci, "%s: stopping port polling.\n", __func__);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
-- 
2.17.1

