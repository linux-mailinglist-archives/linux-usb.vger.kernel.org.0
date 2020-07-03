Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C996213419
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgGCGZj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:25:39 -0400
Received: from mail-vi1eur05on2076.outbound.protection.outlook.com ([40.107.21.76]:12304
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725764AbgGCGZi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 02:25:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qya/CDA8bm5WRQvVutE9sIg/htIocG2jLONcCeHUpDykC+1QECgIBiAJCoLvlGt7fskzRua4l8revyyjdAxMc6GFw4vP3Qz/P6eDvhvYTwlCXQSNSUcMBtPiOzXFAOjSabbfey8qoH6dPjCRK0aavtWhNRs0811rjIvyDfRJ4vqkt7dg/lRSRRoNrfP16j55Wg05H7MWbZNYqR+6eKPdD/Exd+XSNvvfVRqVsUqv+g/MZ9bjaFDXjcY9KwXiCydCPvS8Ks2Mor3pQ7NFWRDf2bsnLYrfvdVPES/DdCgg2rGsnEFCgq9JXXqSNYgiUVCqF8+BjKS8HsTgfNj5mbui/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrmJ77HfR4eGaLItuVwkP6lz2EknILl9bHDMpfXWWxs=;
 b=IFhQLmOvQ2MmX48R/00pm5mwmLtMLibFs9FyexBQI8yaPG/eErCLQoDwbc+PeBmS0wy/3DUzVebyLtlBZDejlFtuyFD/gsAA6P2cYS9djcyb9puUrycbCZaXt1NbzrEEbj2tHfy1rIr698Di0kfk7zYczRgJczOz38XJagGr0FA+gRL+XJsykOjvL754mUuNtctEo0YW45foBK5I30HKhdt/BuZ/9uPxlZTbpjJLBw+zqxfEklqoAhYK+Ytq0lSvwhW362tw34WWJiAOVK9C5K/51RX145ARUdFgSwjIbBYYac1PfW3AYpCllo2z58WRCuarQ385VKJoOrNl+8pkcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrmJ77HfR4eGaLItuVwkP6lz2EknILl9bHDMpfXWWxs=;
 b=jrpMLHkArpwbK4gjJEC8x3Gb5K69J4EJZ8STlu6qqsk+XfQ8Zwk7L4h+XUuIyXGqGFSg+jFPjJjVAlSnnKjWh79M3/Q3v4gCbaBWl3Z17U9l4EyRfYAaMUTvj8NLzOI8lgWnwhp5em5aa2TLCMACSBRViXd4x4lAElJSHyD5g5s=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4758.eurprd04.prod.outlook.com (2603:10a6:20b:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Fri, 3 Jul
 2020 06:25:35 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 06:25:35 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/2] usb: host: xhci: avoid calling two contineous times for xhci_suspend
Date:   Fri,  3 Jul 2020 14:25:31 +0800
Message-Id: <20200703062532.29076-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:3:17::36) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0024.apcprd02.prod.outlook.com (2603:1096:3:17::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Fri, 3 Jul 2020 06:25:33 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c47d28c5-9be0-4dd8-341a-08d81f19e50d
X-MS-TrafficTypeDiagnostic: AM6PR04MB4758:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4758DB59726395D34B7846C58B6A0@AM6PR04MB4758.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j/DlLATXeTExK3UQWw9Ao1BC9BTRSKdhOSciDzoU5QVvuEs4Hw9yCddDtCsCBw4B46NwAVaQeG//n/4uSzZS2aayz5N6fHAIxeZ9dYKIgyoqlcKgHVWJHOEtLFvlqLHYFvRWW+FbDCYvrhIysnPqy3G3V7rcBJBkm+9ZF5met3DMLBmwVAVQhcNd47SGMJPJJofuOPB4cDQzIswGBSKieBBzsnJzUPQyYjWynfxXdrnGGH6IqRHdE2VM9hW+GVOGFC0Vw2wSI/yraWtgR9vb6L6N1s0CHZYQNbHekyofdnkvO1hXARoEyR5WDl03+VQA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(316002)(4326008)(478600001)(6512007)(956004)(2616005)(5660300002)(6486002)(36756003)(66556008)(66476007)(44832011)(1076003)(52116002)(66946007)(6916009)(16526019)(186003)(86362001)(26005)(2906002)(6506007)(83380400001)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: /uWnxKLsgM1Zhw2BfJFcHZK4RYblFfsCLv6DTygpgj2C8aRRRiWAqc9YvM8lcdfj1jhnl9OodccwM9+YDbJTyHRmp4M03aFp85np0HuM/JGUEql+P1BJseazfuEJ0yQhj6FZhSf2ui2k7eXvWirKCf31TvFZCayy77s3iF1GyvD/Z2CjD/VtZVpeoK3mpiPwFNC8Yt4rBrVhDo0clZxSsnlbu2uDaDs+8Jtfa9OvO55KkKSMFI837iBFgVG17NBdEjxBGBRftiZwbSKOragK4pGw7ABM5RhL8ekFpZx62om7AJP3WQK1DBKToDMKd1MiZdQQzDMaTx+QI2s9WG8ViPFuSn4atY8UmoqDt4uv5xdDpAiOzh4CDesNw56oWqqTY/ug93tKSwePstDQrFhys/jx/qE4Rfwi44j9DLqach5FgZiZTxxs42LSogXaAU5vhH0rT8aXL+OYGvNgDacJSKPzfspAuPfgQTpE6vsYmE8=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c47d28c5-9be0-4dd8-341a-08d81f19e50d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 06:25:35.4120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3HEOglio7sFlhPxC/OG2AAdQt5oDwiJH3q/VYMHVjLkxXlVBqSspidNh1BQimlGCQpsGQvy9Dgjs00wfGyiog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4758
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

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ed468eed299c..66c894626be6 100644
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

