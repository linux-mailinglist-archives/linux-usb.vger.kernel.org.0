Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3EDD29561D
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 03:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894771AbgJVBkY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 21:40:24 -0400
Received: from mail-eopbgr80080.outbound.protection.outlook.com ([40.107.8.80]:23295
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2894768AbgJVBkX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 21:40:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nt5kCkZSYM4aynX8Woflh4v8EQFrlStbWB8BurwUyH8n869isYDFZBWA8XBnFr+fzZtZAp+lJiazzHsXf9754X0L5Vg09fIKccH3q/1xWppIfZH7R0HZk8ett0j8/R4sbS2S0JQx9WPtFLsnz9GEo+sTMHodj5MbDGffrsJFAsc7mZzutzyZGirVZyfqQt7pSK+faN1Cb2nVDqaD1W2t3X//DmFUhBpj/0f90V1R2HRHWYTfeY93kD6XKvTQGEKAcWeccFn4hLA1EHToiZjumxkisDFSAc+bfMaW78qPkHX2y9bzOwajOHiYwplcb0SOR9et0Cc2kXrTQ93fKtxaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77AXOuqWcAv9a+mrENmQCNIU0XPTsJ3NuVrAYcUnhbI=;
 b=BcXtAq0GNI4bSzXSW9wvlybXxBmxUUDcfE6eh97NIiZTbuLAoZf1IBsGM/47ZgDbwm0MUH1wpUYS0hZU587FcLRGmsovAXvoZGgvHgrwETjfN0M6qos7nFO0nnwMQsyY5GGW58J6kEENHmtFfFMs89iJGnBO5Y85jdzrkZIAWgqnSm71dI47CNL2T8Wf+csKy29I7IQlRki5RvVUjMLaGnEApiDDx9QClS2hw1xeg5R3mnfUV8tORaBeqRchgdiXHYOHigFXN5FWbe5GAXJfmsigdh1Z5aWupscTkXTc03bHm2PfLzHPICokWaXXGMEbQLGu+0fzJJjsjx/l+znYdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77AXOuqWcAv9a+mrENmQCNIU0XPTsJ3NuVrAYcUnhbI=;
 b=OqORFdUstDEKSTKUU3anUA3+MAPAq4ojKaKp2yizUfFuoO7fzw7izgnAkb3k/HqIAqbIXFzY6924SY+Ratp+QmHre/++C+DCJ0OyjdrP7jsz9uaWcg5qfrmTfJ/41UWy0PWwOIGUr1cWHUdz0abWt9vCNq2gNIfCV3Q2tFngX/U=
Authentication-Results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR0402MB3539.eurprd04.prod.outlook.com (2603:10a6:208:1b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Thu, 22 Oct
 2020 01:40:20 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 01:40:20 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     pawell@cadence.com, rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 5/6] usb: cdns3: imx: enable runtime pm by default
Date:   Thu, 22 Oct 2020 09:39:30 +0800
Message-Id: <20201022013930.2166-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201022013930.2166-1-peter.chen@nxp.com>
References: <20201022013930.2166-1-peter.chen@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0190.apcprd04.prod.outlook.com
 (2603:1096:4:14::28) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0190.apcprd04.prod.outlook.com (2603:1096:4:14::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 01:40:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 04c0ae01-1ec2-4942-2e07-08d8762b6fc2
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3539:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3539EFE14D78F19B24A4E1798B1D0@AM0PR0402MB3539.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bpJyn8codxvtfbKQqfeFcWfWhkqB8bGGUQtY5owqWSOTpDKRdMXZkp2jmYPt5Tc3BG4piRALXLc8BncwF+m+H2sQqjOx3sjFUK3g4CgVSBjceaamPXDt8SE06fQ45Vmq6kpxfXRvLq1YTiwZwerDnQAEtWYZ4vjnt06D41tiab4xVtsYMCUb10CxfcpjXdSM42ijtP5lNaxySvmzIV376vsEtdbW2x3SziQViq5igK2/jDxzcq4i9+8xHhnSYc14RnVwr0gbkHW1ZqKe2pXfsdE0XJic3gxLNtnzMuqiUxEUSLib6rni5LIjrmZ/idRdhAb7vMmBPbradk+0XSyYfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(66556008)(66946007)(66476007)(478600001)(5660300002)(6506007)(26005)(6512007)(44832011)(6666004)(8936002)(4744005)(186003)(16526019)(1076003)(86362001)(4326008)(36756003)(52116002)(2616005)(956004)(6486002)(83380400001)(8676002)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: LmglVFIC46A7VCh+OzX5NE9V5uNDJwF6iGyV1Xnz5qJ+wcPZ30/h+ZeDNPSr8s9W66BBPQA5Vg8hifgc2ZQk+HZgR0cZw4Y+04FXvgrTG1EMDirsDwSVT6tOAE90yZ7prHt0cKVE0JIABOosX4+nZCw9Ray/1SyhLy9qL8e+Qdey1fbgYj8NqyatyfviSqgmQxGvsBuK2mVt31i5nvsheHCEEb+84INj0WFq2Urks+G9Zj3DonyjV1W68NkIaQm/IVRWNU7V/fSYywOeayuFJksyBuy60w5WcI+Tc6tejkBlMvpr+dD3+pVzvMDAxiClIobgSGW7hNaDd8n5OZEiQ9XQjr9/H+6cLa7lzjKdiSX/GeozLlEHKMDYkNRmkmN5GtMN8+9ECxGwp6tcMFl504old4s9+zns3gIhOfvN7B7Y7Pluq8tzMyX3Io+sQ0GjBRzO6nlXxIn4IRUjFW4+Tzonsc7+KfFEkVOIf4mR2+r4ym3kPijmIYhHjCqLwJKaIYRct3GoEFy/OTkstZ7JYHxL5y+jYybopmmeBSpd751a7fjt+0uXHa49eMFa6KAMZ2EMCiaLNIUfjJmZfg2SWs9+vLS8U0fk30h1f+MrpKSLwXrIgRwmvHHYhE0cTVlq58Uouggfq9kk2w9nNZ9gpQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c0ae01-1ec2-4942-2e07-08d8762b6fc2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 01:40:20.6420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LXsUv22bkQij6g+okwq14yYHg2RxURqo5bC6Bc/3eoZDOKJOpsta0YEY49guJiY4Vs3eXqsBPlHRuaUM30FGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3539
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable runtime pm by default

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/cdns3-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index 54a2d70a9c73..22a56c4dce67 100644
--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -151,6 +151,7 @@ static int cdns_imx_platform_suspend(struct device *dev,
 	bool suspend, bool wakeup);
 static struct cdns3_platform_data cdns_imx_pdata = {
 	.platform_suspend = cdns_imx_platform_suspend,
+	.quirks		  = CDNS3_DEFAULT_PM_RUNTIME_ALLOW,
 };
 
 static const struct of_dev_auxdata cdns_imx_auxdata[] = {
@@ -206,7 +207,6 @@ static int cdns_imx_probe(struct platform_device *pdev)
 	device_set_wakeup_capable(dev, true);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
-	pm_runtime_forbid(dev);
 
 	return ret;
 err:
-- 
2.17.1

