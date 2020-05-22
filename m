Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE8C1DE47C
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 12:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728938AbgEVKc7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 06:32:59 -0400
Received: from mail-vi1eur05on2057.outbound.protection.outlook.com ([40.107.21.57]:6057
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728827AbgEVKc5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 May 2020 06:32:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYMlaFS9gRp/8NKDwXsU8SRlpadZ2jp+tkOgFcfhtBoo57khl1LGqhwhu8FzSwt+rVQr6cL+hVR7XP1RIDLYSs7HZtyWyvPzRJ1bX90pDagfHUjYJR+XpXm6k9RZF7j3kyX9oTiq8WAeviLduDUieys9dK5WHd6VrtEUzfhb0eIdrpwu2M2ZbD2PFMFHb8rWfvmElCgOxfAZejY0GrZbMA4s4RHeWqKLtcKaJ6LFYxK70gHKXzN+LBrPfbNtl0071tLNRCxks2RcsrooWchKr9ilHbu+PbzpatsTAtPCV7RL2xwMj+40O0n15UIMjOFt79ObLkxl4FD+rn54yTzaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjRElqrXKYAgA99yuhF3afHtqrTsXTP1mgLePZbIrFs=;
 b=CuTGBepxsXE9t4pUJVVtlPCHWYwPuZP+w0mWFJpLU0O3Q2XWwdlA+OfCiBxCktGkUdaefiTBRceFl0GrVVLnHvjn/mDa2e5JHueO0JkMf9adEyOmzPIbSd5I8WrU606umdk/G+uOuI3En40hhMybniTRZ865nBP37sIyE4nmyPXTL369AehOBa7GaIE959S3c0y5avmz2XZ8WBu2dbKMExN6jNFNMrx3nbJjc57j+ELW1CjhdIsn8VYCnBQUq87np0YfMFUZxHmfvTuojC8i3siu1lDXBD7HXCviJoWluVqfz6qQ0u8DtpEwBjJ/LHneEjM6+gLeNyUV8AIbC1ySaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjRElqrXKYAgA99yuhF3afHtqrTsXTP1mgLePZbIrFs=;
 b=kGn7M7eTJEuhDTbacj9xunjkLECuUd/J3hc0VMGAo+LIAu9ynbcSfZvAm7hwsQ3v8mMxs+sVEdIT2Zzz6e2oIdl8Omtz/MxjMvZk8+8JuO1pRDigumglPeEAaNZkVfFql+yA3pz6o7Plib4BqQU+i3liOGGwZX7ZOYMMKX6nPKI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6984.eurprd04.prod.outlook.com (2603:10a6:20b:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 10:32:54 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Fri, 22 May 2020
 10:32:54 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 3/8] usb: host: xhci-plat: add platform data support
Date:   Fri, 22 May 2020 18:32:51 +0800
Message-Id: <20200522103256.16322-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522103256.16322-1-peter.chen@nxp.com>
References: <20200522103256.16322-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 10:32:51 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 65d9db1a-22c9-46ec-fb4b-08d7fe3b7c65
X-MS-TrafficTypeDiagnostic: AM7PR04MB6984:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB69847BC445C7D8F70A1D78C18BB40@AM7PR04MB6984.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YlN7wOaziV836szmgZJtWFgHT+4493YzyQClCY/3WJx71eKUjI0JUFfBTTK46dTdx6AYdpW0+25m/2frfnGgzGIoJ6G5xwxZ4iVdy0B/Q0eF/QYjHMY4uI3Mg2C41Srj+jQ6q5WSBDUopVYyldfqQcUNN3+dDH7xlepFiLNasKW2yxeP09ImIKGQOBwyq2Cr7mGwyB/+VN+gZ364FOeGEH/Zsw8TBkZ9Eg0B6mOTnSGjk27ITnkpH+okXVtaIdxYHGa6HZkVwEi8LU2Ch1Dxc+456wTEoh096B+TJTp9zVdqTZqS7YlhlQZqLsI9S+lqg2g31djW7oxd/fHzyOatGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(2616005)(956004)(316002)(16526019)(186003)(2906002)(6486002)(86362001)(52116002)(44832011)(4744005)(8936002)(5660300002)(8676002)(6506007)(6512007)(4326008)(36756003)(26005)(478600001)(66946007)(66556008)(66476007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Ro6AiXyK8+LDnlCYAZoQ1/9yj40H2gnpGQCG+hOLnMLsM8Yp0CN/+TYgdDFAtu3QgxQRZWDUb1Wyxn4PNjTfCzerXRNR6ZsHDqWVpNclpVloox7ER3CssSl8vyG6ptxCblxDs9fyCpaAcX1E4aS94m2EUVqZxxYBf90jiEfpIKURg8HIkfeL0ITUXTF8vmkILWOwIbrXoOm7zAYzxM1WOO7ikokhrRch/v5jTwimjEPFCJMVbzzY0ZioizqAM7H5DAvYaGWyBoxljbK9Lx/Zsbny7ZLdCXRGkDhBcEJ+TuRKY3XVoMYaCAtRUzDK5m02AZZpgRZLxB3VJnIQ9nhjeBt0GJPAqZXUeKGnsEenXOGh6oOjraWd6gqPSctVsG1sKDyy0PV65K1GRaXg1cfbFYDMuoX7C3Okk5MpomJFYdwkaJrq/tK1bYSe140/ah/7p/NF30z5IJqJ0f9iGI6UXCmzXh50tPJZvEssehjiEb8=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d9db1a-22c9-46ec-fb4b-08d7fe3b7c65
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 10:32:54.3153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnYlCpwbnF1FTW+f9I28JZjyr0vuRtSXBJYKd5+7B13c1kX+P69K5LozOa4QuQWvSSgPoPs3fKfiWIIX7MUExg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6984
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some xhci hosts (eg dwc3 and cdns3) do not use OF to create
platform device, they create xhci-plat platform device runtime.
And these platforms may also have quirks, and the quirks could
be supplied by their parent device through platform data.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 0b4cdc5af130..e00efd84ea1a 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -255,7 +255,11 @@ static int xhci_plat_probe(struct platform_device *pdev)
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

