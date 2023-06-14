Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7605B72FC1D
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jun 2023 13:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243076AbjFNLNt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jun 2023 07:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235923AbjFNLNJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jun 2023 07:13:09 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1F226A9;
        Wed, 14 Jun 2023 04:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPnqOiTcRWWGMnn7s+waeyknu8IUAXJ/s/Yhy1Rugkh3GYSrtlrmAD/3bFngP7nRGp9bloTSUIhBbUW86NcE0LZcpbhIbvmY3O4EiZjeURxwl+0ta/Pk+d1kPVbZODArvU4z4xBA6zXnVsMEQpVokK6FFmRMjpCVYf77rMi3si07WCj7Kk55RYbxxibkrjNXfE/r+V8xwTxs++SgjERf9aKz87cuat1ZYYlycbvcGLNWKimlmFP/8g2pPgWIMtsm8ScYpcbY0W2raS44bP3qyOTVRO6I3fApoRWUDgqauVMRX0q8qkEPpAC76JwaZOzJ+DfigMbPksw79D+SCtRAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBhHKi+NEzxvZ2IrN631cPnzpjhv5qbU2Ik+e5AGJJI=;
 b=gUJufkF1tNzWX9e5ZwWqawtEFWn09gKiwncHERu3H7aOUhqSRsvZdGESgE+a3hPrDNZux3rhHaVOcd2TPgUja04cUVBeA0T/GUxA1awShdisKhYFl73ACPpeKp5RHX99JTeuOyT3hlfLF7jc8uJfAevdh4pc6vMu4JjFl/ag4quudDY3iK0rRp9o4sCKWnZx9PSiGTxviykc8mjTOavjURDri4OiBLc7VhbWxQDgwWpSsjUnf2whsivlE54QtnvHqSppyXH0k29P2G19m0IQ4xAqWioSWi8GnU9gwaRNOdFivH0TNC6g/gQD90f91zswjEuog0L3wrAbauA8Ur6yqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBhHKi+NEzxvZ2IrN631cPnzpjhv5qbU2Ik+e5AGJJI=;
 b=JNU9enDCQkKAf5X7CdJBBN4b31yTdCOrzRzMoP54bvq78yo0QdKXQf0f9QvdeeUGvhqNQ/z4OjGkQJsHJ0OBCDNR0gMCQvrFvImujh7w1adQ8/cm+pd+hniGddQE6qi6dst6Q3m8xUS+GSlPQ4+a2pwVCj/qG3P8OwO6XwHmp8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DU2PR04MB8647.eurprd04.prod.outlook.com (2603:10a6:10:2de::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.46; Wed, 14 Jun 2023 11:12:36 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 11:12:36 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gregkh@linuxfoundation.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, jun.li@nxp.com
Cc:     Frank.Li@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, xu.yang_2@nxp.com
Subject: [PATCH 2/2] usb: phy: mxs: add DT bindings to hold data line
Date:   Wed, 14 Jun 2023 19:15:48 +0800
Message-Id: <20230614111548.1815146-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230614111548.1815146-1-xu.yang_2@nxp.com>
References: <20230614111548.1815146-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0191.apcprd06.prod.outlook.com (2603:1096:4:1::23)
 To DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DU2PR04MB8647:EE_
X-MS-Office365-Filtering-Correlation-Id: 899731ca-7e2c-481a-159b-08db6cc841f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cMBrb391Bbmn8GurrAFa8E9mnsyPVOAuh3KtMSoXtwW9HTAn/BOkmQZazuqu+uMHQiVHh/YhUcxkvzHTPhxXXRpX9BFexfo+O0/5Nat8UsQwOPQdA0iaUxW1LH/GhCQYIPbv0fNCVlVLaZCZVUn7FwX9qDqDBlLC3Lebmf9cPr0s/vTsLgJQwwiWDGWQo7ie3Dz+PwPjfd8OcY+cKnAAizL+tVXOehUWRm4U1/+vNhSogr5X2TBzcRsU9NBoH2tOUmC/SCWrkL0U37sNjqUyI0mVeGx2V54xAKNh75jIyr2glEECG0wOJfWv6jSY3gsOSsSZfXb887L4Bao/DkK/HyVCBqDrfp/wb/LOROCifyslmD+P/tOt9YgNJrZSLXL5gZ4T3eZhm2w0sgVdXCTvLh++aV3sog81r8emBatStTyvktUWLfgBHZSLoOLyG4PQu7gujQXUzJZL3lvr+1veeqyiOc1A2LGGqzCzxHIBu8C4/E+zWlIjAz7IoCBVDpDAM7yPxikKp9zYjkG0N3y4xRCsAzPrMqJ1xG5pz5tWoJUb60gYVfJbVJv5HHS1DMWsp6HFJpfZb3mC+sPCUTInK62bI6863tpniRb+xPkbFbGAHhVJyWNoQAsQudyscN9y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199021)(83380400001)(66476007)(7416002)(4326008)(66946007)(6636002)(36756003)(316002)(5660300002)(26005)(6512007)(2906002)(6506007)(1076003)(41300700001)(8676002)(8936002)(86362001)(38100700002)(38350700002)(66556008)(478600001)(2616005)(186003)(6666004)(52116002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+3S7DCqX04elGKJXBr72gHcLTgecwT9hlmtYdokrKPv42rctoKtysRa8qJpV?=
 =?us-ascii?Q?gq0T0wxMQZBSQhYfFiNZgOI88sy4st4ij9zOpjdfD1vHQLUg4YKP4eiVaux2?=
 =?us-ascii?Q?gv+zPAe9TTZjdDFajfwmAEC5BPC7amc+DJcCR5Q/OkLMR2OQ1E+jLX8Tcgn/?=
 =?us-ascii?Q?7bfIO9ChZeYiTRBhGSF9fziKhe86pfVtXsaviOL7rrhpohdxaar+jVrBIAG2?=
 =?us-ascii?Q?Mfun5QOpPTOliUr1VrIuGCQmSevXyHFxknVRiyllSherQ1uEkNfwOLEz8BA8?=
 =?us-ascii?Q?FbUH5CMvcpGPw3Hcoa5YN6qRVfOYUgNxobRAdhG0MCm1T1lsn3X8bFIFB5A9?=
 =?us-ascii?Q?mSRKUGbqN2VPT5flF8P8+WFGdE4TQJBqeRwRXf3uuN1noCny1H9MusUR1mFb?=
 =?us-ascii?Q?L2H6q5rGvCxAVOD0hMG0wn4f9C3wjY61sXN4hAfC+wnBBVZSwl8zGPQeq4oZ?=
 =?us-ascii?Q?IOdSU3JwpfQ9s7c5691XsiJw17tHEh0uu7sp0gjff40kHzuP+dEOVrCAhpHo?=
 =?us-ascii?Q?aX3RMjfRygJ4jegdp9dZSbXqh97zEbiz2Fei3o5iazmZtdSxFGbCkVwKGTq9?=
 =?us-ascii?Q?n06SRwGmaEiRUprSQG9Mv7eAIBslpArhRsvxNteBux6JC5uMn69+Wd6/puuY?=
 =?us-ascii?Q?1w1DiFbMZk6Oipxm3KqlXcIj3TA+k8SwT/1VoY84WEOgliZitTmdI/+c9gTQ?=
 =?us-ascii?Q?XOGlU8HQd6e0ONIEpMRouw6zYK6C1vidKASVRTdaOTDmPif8wU5y/QuvW0dX?=
 =?us-ascii?Q?6eQ24b6WqLmW2Ve38eOBJ8ocI6G1919OVIvtywARaO/AbqXHwTM11vaJqgtX?=
 =?us-ascii?Q?pP1/orlLGLJWl3pm719R8aNdkRjhi2kJG6/yazrc926sYMoBn6ixG3Uu+7Sf?=
 =?us-ascii?Q?vrIgcv4fs8YMxjOKL5FBWkz4QUsMz+ZkLKlMQOoZA6R6P9MGWiGzdHVofibW?=
 =?us-ascii?Q?pEyE6BuZiYl713DmT2wpfl3nC9RyM7/8/V6Gg4ol9RC7XdDKlQOb8J0j13SK?=
 =?us-ascii?Q?Wi9CL3o6v2833is9row0ib94GDiaWDxVx5j9DffMqZXzFFQI8PONSmONg6Ph?=
 =?us-ascii?Q?+wa2Z7ogm00QG13Zedf/KRlS1ew6K6C2VnME1Bp8DbdwxMiVlXzPVDclO+ml?=
 =?us-ascii?Q?9bh8uodlAO4VVkoGGo/jpJ0l/w7qEC8cDQWRo3XZCVQ8PVE5TajbeYcC9F4L?=
 =?us-ascii?Q?ux1O68FvJJ6JRZQwxu2oxMES0XzxZ+MAghiMtTluLuiYTjqT/o149Z3i8JJy?=
 =?us-ascii?Q?tQ6TBmCjWTW/pBhNE41w7CZLfNvQuo8HIWEH9AiBSJDkeIFgxTW3YKDxAp0O?=
 =?us-ascii?Q?OZuUF5PUAbN6hHNTJ8E6GPbV9o3if0NvOEtQntmFOTH0e+AwSdg6AmDguLQP?=
 =?us-ascii?Q?VQWmhQu+Hh92lPbTABRjEAdRey45HFwQRAnBbmKhxStle8FgAvkERcFKcHc9?=
 =?us-ascii?Q?snfO1h1iHDyJrkwbww+hSLQ+cVRKWwYB5yBXNO+VhpyFlIt0HJ/YtxMe7k77?=
 =?us-ascii?Q?+51JToiYt6VIad9tPMa47+8BZZ5ZrSArR1vbwuGoVUgYEQZTn5gnzL/ISNSD?=
 =?us-ascii?Q?89RCSnXuikIPRpWaOGps/VUFiaNWsVcII3TeLIjC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 899731ca-7e2c-481a-159b-08db6cc841f7
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 11:12:36.0780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clBpXC3YrwSO88qRkT9LgKLeoA8UTpdZpFnYBy8bl1VzlvYhzRAqkC6IlMTLOcm9bLHnvQTAaWvFsSsGispCbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8647
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Whether the data line is disconnected when vbus is not present is related
to whether the platform data set MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS
flag. This will provide a override from dts node if the user want to hold
the data line when vbus is not present.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index e1a2b2ea098b..036bb58a3a71 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -199,7 +199,7 @@ MODULE_DEVICE_TABLE(of, mxs_phy_dt_ids);
 struct mxs_phy {
 	struct usb_phy phy;
 	struct clk *clk;
-	const struct mxs_phy_data *data;
+	struct mxs_phy_data *data;
 	struct regmap *regmap_anatop;
 	int port_id;
 	u32 tx_reg_set;
@@ -774,6 +774,11 @@ static int mxs_phy_probe(struct platform_device *pdev)
 		mxs_phy->tx_reg_set  |= GM_USBPHY_TX_D_CAL(val);
 	}
 
+	mxs_phy->data = (struct mxs_phy_data *)of_device_get_match_data(&pdev->dev);
+
+	if (of_property_present(np, "fsl,hold-line-without-vbus"))
+		mxs_phy->data->flags &= ~MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS;
+
 	ret = of_alias_get_id(np, "usbphy");
 	if (ret < 0)
 		dev_dbg(&pdev->dev, "failed to get alias id, errno %d\n", ret);
@@ -792,7 +797,6 @@ static int mxs_phy_probe(struct platform_device *pdev)
 	mxs_phy->phy.charger_detect	= mxs_phy_charger_detect;
 
 	mxs_phy->clk = clk;
-	mxs_phy->data = of_device_get_match_data(&pdev->dev);
 
 	platform_set_drvdata(pdev, mxs_phy);
 
-- 
2.34.1

