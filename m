Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411FE3AC4E6
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jun 2021 09:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbhFRHZY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Jun 2021 03:25:24 -0400
Received: from mail-eopbgr60086.outbound.protection.outlook.com ([40.107.6.86]:15017
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229782AbhFRHZY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Jun 2021 03:25:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWC4pDtZdXDXXl3zNyrIvUQYVbxZSDZSri7Cly8RZkX+lEWp9yUmSqrHK8gFKvAcro4+1TgpVljdj7rVyDWEiXuGqMtwdT1qZXXrgEdddYTS09kdktjnY4hL+ryFmrkUHcf1vzMeS0a+wnJKT0CZkpcSoBiFvj1GXVy5/Yw5Q3ngS+Zr9an+wIK2k/dG0gkI07a22gCZ8S5C75aXqUeIGgcrIb1dBqE1brlMoSpj5B74wPf0dP+Nzms4LgE4BlFavkiBN+wTONcOsLJ1ocywW7ASxGWGuNvr/RQHDF9k5LybzCxDVOzeFUKJPf93H0BLbEtgFtaZjA1cA6pFS9sN1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaDmfB/hQENgf8iaWQDAiYlS7qYU1YcnFqHKWrOqswQ=;
 b=WPtvqB24XZpeSEvs0SOS3nObdvFLKNhJ+Tk/5XHqZF/uMvHfvaAe8kjotNpW2CoYg1FHiLZpwYoigeLuAvqYG6er2HvBmOTL5G1Lkzf2tVXuAHXqmjOdOhqFkYnbdkznyYQOsyqqnzcdTwo2H8h4hmyg0rx1d/ABYR8o+c1D1fjIMhFIzDP9IU2c/zJEeTR3q5G6aM1GwcX26Rb0XovPrOBi/+PbX9fNgmw7hqNhWKdxwsGHqfA7BPoX24YI5488qjpl2+hGE5THSi1yvn9L45JMiY4swpGxlXWMVP9Sb1YiEHsR9MgSf/fsxEgvZkizcmsiv1tPUrxffwbJBYLszw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaDmfB/hQENgf8iaWQDAiYlS7qYU1YcnFqHKWrOqswQ=;
 b=C5aujOE3rd8rIsutihQON2Pm5ZDjLw5NtObOHO6mQ0se2FGF16wgMOyU5j6jV7IUu6DQrAs9OmbvAEsHcCpgbVm1hjW2YQAwoeEnt36VOfnOST+D8hYFNyrTcuu/RVZfBkW8e4QdYIOz9fEHktP69l/Bd4rXWqp3LDd2jXQlV7o=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR0402MB2735.eurprd04.prod.outlook.com (2603:10a6:800:b5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Fri, 18 Jun
 2021 07:23:13 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::79b2:6f7:b5ef:ed81]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::79b2:6f7:b5ef:ed81%5]) with mapi id 15.20.4242.019; Fri, 18 Jun 2021
 07:23:13 +0000
From:   Li Jun <jun.li@nxp.com>
To:     peter.chen@kernel.org
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        zhipeng.wang_1@nxp.com
Subject: [PATCH v2] usb: chipidea: host: fix port index underflow and UBSAN complains
Date:   Fri, 18 Jun 2021 15:04:39 +0800
Message-Id: <1623999879-2277-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::36) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0156.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4242.15 via Frontend Transport; Fri, 18 Jun 2021 07:23:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 562e3090-6b0e-42d2-6332-08d93229eee2
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2735:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2735E9F8685137020EBD60BE890D9@VI1PR0402MB2735.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zZULTAr2uzWufVuTpp7HF6MO7MqWlR8xuEOmpPIe8LqEiS5eC0g2lAqiZbkIGKyFDXbACgnZDx42FNRFUhLMj2Tp5IWyeU/Koh1XckL5OBickE83y1ECS4EyUBkOSz+NMSQ+lV0fTjgimjImPcuz4Xl98XvwPit6gvwUzfi8JIxC/7rEYZ7qfqXsR7kBfvjbYJHvhqEoJ2f0V1/XbJz5B6w4y/AS0VuALv8JWkOsKERo05JRE69ShmVOXY3aeq5xtsFg0VFWMwYZ+orybZoMIT9qOpiFNWch/d0JKqMbs6Adjq7T0do901pnvyyBXZABDYUxr1Zct8zIcKw7vyj2TVENZ+xUVGe3DtyVG8PEuTNk2u6mmLXG0ksoZoPhNXYmkdFQTZ3LSSZcaG50y8wq/ULo02CzGEkOsVtEpSZEtTNZ3QbceBl81bNaPf75kxBeWiIynVb0BRkC/CdQpOhECk2DVLTy+cJ1MeWwVxDm6/uOLf9DWMVmsK8AWPZ+LEpxGgzXZBHIlEwFZXZ08wklOLouP3Ep3rpe2729Z6ZweYIEWHAATkD/m/wRe5UlnsBl2IwWcCVYd2XA79+sGye10OvIMg1ouZxa2B3q99Y2PZavVc1wHDoJd+gujrq+EAJWPBsxPck1+MnVQx4zU10zTnusFx8F/BLy7UVaOTkJ9Azy0GqqcDdrIV1mrPSW+v+z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(186003)(6486002)(478600001)(66946007)(38100700002)(2616005)(4326008)(66476007)(38350700002)(36756003)(6512007)(83380400001)(66556008)(86362001)(956004)(6506007)(8676002)(16526019)(316002)(6666004)(26005)(5660300002)(2906002)(6916009)(8936002)(52116002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hiKDpcmvPYwaCCPUqM6y6of0Od+glyvYzjeEGL9H3+jDKJy2L5dcWHQqnowO?=
 =?us-ascii?Q?PauTOkeE+NSZiHLenl/4+tJwJKqjTK8Xb4SC+jFiXBO2mu2uHictjsV2GUCi?=
 =?us-ascii?Q?eTMmMOSI0TOCtNKDy3nuMxFNKjHYygPGNu/xwvu1wJ+WbQ9kb7Fw7Eax6GzT?=
 =?us-ascii?Q?6/GCdJ0zMLXvjXQKLX3nOtfms9HHwDmmyn69kj7rZZ3nxMhvsAWQa2trDTXk?=
 =?us-ascii?Q?DkeAo3cpz+0iOkGkhLEzrd0QnwUk/pm+grc7ilHQ4b77DtIPKJi5bUIPbrDB?=
 =?us-ascii?Q?9/4gi37P8/XO0Ui0utUyD3z5iTqxUUh7P5SvDCiNrC6BT/WtR2aGDheXN0Wf?=
 =?us-ascii?Q?j1ejZQND1CnqTXmsFuBM2RY4LQvIJwvIgqk5gY+4L3lVDsmzyhKLSeZI0LYE?=
 =?us-ascii?Q?KyT+diNQmmIbiA0nbvEcGrLyg66M/KQt9jG0KNCR15Gwlaed9LBfBIX2PIML?=
 =?us-ascii?Q?/6Woady4UbHBoSqlF9/T1xfBOGbymmjiJCUk+FsZjjUDD+YGk/JRSDNFcIAD?=
 =?us-ascii?Q?i2tEpQy/2EXPrsciiQjd4dpVEUmlU/yFxjlEID4gxMbkkU+FxZV3gmHgS2co?=
 =?us-ascii?Q?5EW4j2Kq2jYBCC2HuANy0djkWbKsJpEds4EPkdgpW1Q263kHqWtX5LLQWYLa?=
 =?us-ascii?Q?ZoGuV733itAMM/O/oJJv7OC5Ymysa1yevixZ1SBckVjhig1Wkr0lnwApkHBy?=
 =?us-ascii?Q?BZLNud7jwCWdqAeqHYN6RGS9IvuRVi7CZFJgmUT0wavXr0xr/EhsEUfbMRkt?=
 =?us-ascii?Q?PYX4mUjOLohiEqoXepzqlzNDshdq5NIup5n5AQ1anjbIm+zRBhYJR6eraHFq?=
 =?us-ascii?Q?w6vUz9G7tksxZkIQD+yTdlGXepSIIpNav+BKd0ZsAjrzpOfFhhO2+by/Q4zk?=
 =?us-ascii?Q?mBs8SkF3b/QfD87pFIxy6ZMaF3h65nIRNTC9bt/LzoIGmE9wUDyOCjZloWrZ?=
 =?us-ascii?Q?RIFdnorx7gheUBvstmFGoooPjdrOu2XCL7UlBEUu/ISA4x68EsmpEUBC4iDT?=
 =?us-ascii?Q?MJG2w/8g5aFHO/rVaC5U9rlGfxrtsl5AIUSFK+bzSKKYOnObtx4H5GXXKE1x?=
 =?us-ascii?Q?HMHOU3/FWs+2l14R4rjXv8QfdRcmX6zSr7kNPlwYHZ9iwC2bBHARr/E7zW06?=
 =?us-ascii?Q?lvD5pLc89ZrMuLPRZ4E03kK/tG1Nw8Yp8S6Cmmoodrjm8p/5oEaOeoagO05w?=
 =?us-ascii?Q?NjWnLS5ysB9uJ8K7xMGK4rKKEfNx0Doh0EtlcY8P/IasIlivWdlA7CeMvX23?=
 =?us-ascii?Q?vXPpUqErGlo+mugcOPbBMPxe9H/tzxihjao5bB1ZsdNqAEjuiSrFC43NWkbg?=
 =?us-ascii?Q?Y84Ss6abE40WNRZDqJ4zenrW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562e3090-6b0e-42d2-6332-08d93229eee2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 07:23:13.5006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idQkH9Mb0/dvNg0dxMMmSQRx3KyFfuJigdJnpW4KrYbNL0KitWkXgFNaOpdJWKtM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2735
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If wIndex is 0 (and it often is), these calculations underflow and
UBSAN complains, here resolve this by not decrementing the index when
it is equal to 0, this copies the solution from commit 85e3990bea49
("USB: EHCI: avoid undefined pointer arithmetic and placate UBSAN")

Reported-by: zhipeng.wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
Change for v2:
-  Add wIndex range check to ensure a correct port index value.

 drivers/usb/chipidea/host.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index e86d13c04bdb..bdc3885c0d49 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -240,15 +240,18 @@ static int ci_ehci_hub_control(
 )
 {
 	struct ehci_hcd	*ehci = hcd_to_ehci(hcd);
+	unsigned int	ports = HCS_N_PORTS(ehci->hcs_params);
 	u32 __iomem	*status_reg;
-	u32		temp;
+	u32		temp, port_index;
 	unsigned long	flags;
 	int		retval = 0;
 	bool		done = false;
 	struct device *dev = hcd->self.controller;
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
 
-	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
+	port_index = wIndex & 0xff;
+	port_index -= (port_index > 0);
+	status_reg = &ehci->regs->port_status[port_index];
 
 	spin_lock_irqsave(&ehci->lock, flags);
 
@@ -260,6 +263,11 @@ static int ci_ehci_hub_control(
 	}
 
 	if (typeReq == SetPortFeature && wValue == USB_PORT_FEAT_SUSPEND) {
+		if (!wIndex || wIndex > ports) {
+			retval = -EPIPE;
+			goto done;
+		}
+
 		temp = ehci_readl(ehci, status_reg);
 		if ((temp & PORT_PE) == 0 || (temp & PORT_RESET) != 0) {
 			retval = -EPIPE;
@@ -288,7 +296,7 @@ static int ci_ehci_hub_control(
 			ehci_writel(ehci, temp, status_reg);
 		}
 
-		set_bit((wIndex & 0xff) - 1, &ehci->suspended_ports);
+		set_bit(port_index, &ehci->suspended_ports);
 		goto done;
 	}
 
-- 
2.25.1

