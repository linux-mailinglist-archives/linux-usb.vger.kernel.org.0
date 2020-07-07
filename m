Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 690932167C3
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 09:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbgGGHuD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 03:50:03 -0400
Received: from mail-eopbgr60055.outbound.protection.outlook.com ([40.107.6.55]:9880
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727116AbgGGHuD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 03:50:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z82geetulWA8h0fDv31sXECIIys6pTqnOiYSHQ9grK9B7UWw+Jma+AZVwNSdLoZbcrwafwPH2Q1EPeTD4EiCWu8x/xqaHmq0Zkor6x0n71riYXMB3AXnfwuaVy2TiuHRc+sY9pvCf3bPJcIfxzv/kPdb13qqdG/l8vRjJjgvU5FKDaLs9MsdPytDmePD/SuCZd2oTk49elsiINIh5XoNwVIG6yR2XIFr33cyYXA81ShQ6jVg5n+UzxfZ2Zc/JVlcILJksSgTTwTgWpiFbKKhgpUGHkOifTgfmKxu2PQ5oeIzZUSPBl8Xa5GT63Vq9e+laxSWaz03GVIYtfg8/92QjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYBwFIPI1hjH7xN7LE8t80TTpuQEDF4qeg1U9pJXluA=;
 b=Bd4gk5xai3Z1ekhzkzbcQ5RZcs8PWqc9HwyUG9U6D3niAPjSzH6RadSKODS7jnpOFHoRiaBu0q2SLUTVMbIxsOyVc7sLud5K3/YHhW+txi7aNx5KfR4K2A+B1dgrjzd2OCEJBZ/EvsBdlrCr1rf+d1nMUpVLX5WzB17Vl/c/H8tZwPqiyC1sBFcCWexlvLCL1jPquQSGxpqFerVpRcY/iyLH/pI5XNrO+/zcg8j62plsMPK4gfJLPPngP1Ljarc/bw1UrJxycUJ7QdgCJbumBELjaqAK4k2LUEwo9q4qnTfDoB3L2ikBzUwyDNK/ReZ376sgT48v/C/As5bgMhnDhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYBwFIPI1hjH7xN7LE8t80TTpuQEDF4qeg1U9pJXluA=;
 b=K+1WG2tUa+tWg5DnLR9vPIF0lKYeYodaMWep71BQiqiRsqz7IknpyfyL6MolbZi2hhSADGo/uWb4Lh+fwW4v9mXDIB1TUzvdv7Jeab5IrSq1BkFOBnK62XC/F5RHu3iY1/RRF0UmPRjLJyU8mvYKn7gZlsKr3DVYdoUC8o/54EI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5608.eurprd04.prod.outlook.com (2603:10a6:20b:a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Tue, 7 Jul
 2020 07:49:57 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 07:49:57 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 4/9] usb: host: xhci-plat: add platform data support
Date:   Tue,  7 Jul 2020 15:49:36 +0800
Message-Id: <20200707074941.28078-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707074941.28078-1-peter.chen@nxp.com>
References: <20200707074941.28078-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:3:17::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0022.apcprd02.prod.outlook.com (2603:1096:3:17::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend Transport; Tue, 7 Jul 2020 07:49:54 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a60e6901-6ac2-4b8a-3443-08d8224a57cd
X-MS-TrafficTypeDiagnostic: AM6PR04MB5608:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5608367B7EF831CE439A44E38B660@AM6PR04MB5608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ooNKsxXPvwGT+BuSM+poS8Gi97/DJzU0ijPxmFVTqNaXet+a2M+1FHgxzFVmA/BbwCO3klwUh+A2jNQqjc6YJPOMeg/zD7BqkQ/CyoTutTgQBtB9pFycCg4lU0seU4X1voOws6aYZBHqWQLAC86viEPs0Np6uHKC2zJ3wGMjYjU/IH4sER0XhAKp+AbRUrYLKUwCb+9meUVNa/2DwEJcRodYlqz9npPEkxYfEa3YbYRN6/dIKNrupwHTbtfk7yEDP7wPDQa5e/n6FZ0i8H28SO8Od1qR7wsnIHscgTQ1X0XYsqCBWv1tVbufeyqKdkNPcad7QoSQr733TZ/F5H2xhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(1076003)(6512007)(2906002)(8676002)(478600001)(16526019)(6486002)(186003)(26005)(52116002)(4326008)(6666004)(6506007)(83380400001)(8936002)(44832011)(5660300002)(36756003)(66556008)(4744005)(86362001)(66476007)(956004)(2616005)(316002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: hxp4SA5IdkV2kgVqDH6EefBnVioZ4PO0Io5k5Xn/8k7k0bBU16s6WX1/aKo+H1uiwf6zKBPxuOD35yqllQrXwnLkr32dx6TiC58fzlD7LiD3SPbPnt7EPZHH5ajZPaF6zrLur0Nn+cSjqugfu/Vy1nsgyEWuP72C4Nzm2dviO9hDWLgXBG4fGlU8g5SalQ67Afgt7SFCmtTR843UCGozV5cdn+IC9Sb5m2iqsZ3FMajOJr2quJzJX3gHu/lAYi/R4V4vcAPr2aQP0bdhKii4GcYmy50jthq+6+NSwb/2l6NzYXIjMfLypKtovtIdi15U6gnNDpOEwsCFllD5M5wg59vibyHU/Fv2FYCLOKU1/d1DcsXM8ChQs1UmsZNHo9qg66KDtWEKjjqGEE7pafUURcYkExHyXZ4ztKTFU5tPqn7M1qTHC3+C++6LyQUFXrZEBYkIG4bY4GF1d6p9r79BAMKk+YMLDBnWrJwWRqqkfH939Hc5t1vrIWQpCxm8j29L
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a60e6901-6ac2-4b8a-3443-08d8224a57cd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 07:49:57.2091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53uLXbhQlpHYfd8UObDP4+/k2Xqf3dZbrR5cDMkbD6IVluu78gNotMM1WblATVdpk+eSfn4dcwRAsnLFjCdUHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5608
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some xhci hosts (eg dwc3 and cdns3) do not use OF to create
platform device, they create xhci-plat platform device runtime.
And these platforms may also have quirks, and the quirks could
be supplied by their parent device through platform data.

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index f6b4089bfc4a..38bea2b6a17d 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -264,7 +264,11 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_reg_clk;
 
-	priv_match = of_device_get_match_data(&pdev->dev);
+	if (pdev->dev.of_node)
+		priv_match = of_device_get_match_data(&pdev->dev);
+	else
+		priv_match = dev_get_platdata(&pdev->dev);
+
 	if (priv_match) {
 		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
 
-- 
2.17.1

