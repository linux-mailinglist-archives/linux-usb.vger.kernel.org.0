Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528522432DF
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 05:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgHMDit (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 23:38:49 -0400
Received: from mail-vi1eur05on2040.outbound.protection.outlook.com ([40.107.21.40]:46849
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726567AbgHMDis (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 23:38:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAYBsxancNQwsspbuLW+XKgmaZthBqi/WZHGFYhQLyvwNPR2piskmZ7OH7pQkjbVKoieJoHfweod0fZqbplnDmYz4M8tv2BKejnLL02bcxhuld1TtIU+TDyKxEDUzA84AD6O8Hc9NTsSWtFwBh9KbHQmDstJNQ6j5/mwc0sWSPqk4cgtqkwgd3y0fj5kil8+hFfhbEkKj0x5agf5bSsBRfa0e2GFWGhf3saxGwAfNfBlPw4tErR4tyVWc0gSv5pVISZGgSRwwyCj08Mnfn4SV4APfO3angDqR29ItRoljPK0Rc3/S6Xw68WI8/ZK5jnsR/DLWm/YNbMn85xJ3+TL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a21MYJG585ovaQvFo1R1pG9GmwyxlzAKPyrUzmHcoPc=;
 b=Vy6ngt6S3E0yARGO2VU9AG8vo/fM6fuTT8JbtuOisJtTzeZVeBTIFIWbZFuz522g3CtPSjXJ+TrM5sGUmw/fHM0Vya4PEjKceAgsM/Ovk4GvyeH0H1CKKKccfmNOuo8swuVN0TV7VAQprP9enlG+fXb5tduhFepIoF/LiOKQEGgvS81Dk+Kiiv9AdUNtWT10mH1EpY5F1zP9ItXg6X8rAMyxBeHkTC02a8wvgqwKWJlv1cmQkmuKVDHYys9YoAAYVPDJFQr4GT7t6nrWqi2/cDT7/v3r9eMpphcleOzVi+hL8A1l0JDR8oqfVwIE0vj385ReK8iJKgs7MBjgbCq7KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a21MYJG585ovaQvFo1R1pG9GmwyxlzAKPyrUzmHcoPc=;
 b=Czq38EKXKThJjfPLgSRStfjlR35Q4jM9mQqKO1+8pCugAPGYkQ6O4mq94fSsVD3ljNu/TIVClaDhVJ78Qbi9GBumhDMN4G2RFJcUFWUiV0OKwewHOOzAFp6k14hhDpZjBhkhbuCcJDcANQOfV5El+miDkOL5q3w6To5zrDS57SY=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR0402MB3654.eurprd04.prod.outlook.com (2603:10a6:209:21::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 13 Aug
 2020 03:38:45 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 03:38:45 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [RESEND PATCH 1/7] usb: host: xhci-plat: add platform data support
Date:   Thu, 13 Aug 2020 11:37:35 +0800
Message-Id: <20200813033741.13982-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813033741.13982-1-peter.chen@nxp.com>
References: <20200813033741.13982-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 03:38:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3ca2b06d-0666-4f8c-1814-08d83f3a6187
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3654AABFB5C48E6F5E402EB38B430@AM6PR0402MB3654.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(6506007)(478600001)(316002)(26005)(6666004)(36756003)(6486002)(86362001)(186003)(6512007)(2906002)(66946007)(6916009)(66476007)(66556008)(4326008)(5660300002)(956004)(2616005)(16526019)(8936002)(8676002)(52116002)(1076003)(44832011)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca2b06d-0666-4f8c-1814-08d83f3a6187
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 03:38:45.2818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhX49RK8s1cPOx+yRY3S9cOC2Q0Be4WGPz7PLsUC97s1NmouJ18XW46Lri+4D+aK+5z2u8juvxXpLmekNV9dbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3654
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some xhci hosts (eg dwc3 and cdns3) do not use OF to create
platform device, they create xhci-plat platform device runtime.
And these platforms may also have quirks, and the quirks could
be supplied by their parent device through platform data.

Reviewed-by: Jun Li <jun.li@nxp.com>
Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 3057cfc76d6a..c7f98edc5678 100644
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

