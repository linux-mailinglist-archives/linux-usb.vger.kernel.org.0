Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C567719501
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jun 2023 10:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbjFAIE1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jun 2023 04:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231374AbjFAIEZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jun 2023 04:04:25 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2065.outbound.protection.outlook.com [40.107.104.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F38C97;
        Thu,  1 Jun 2023 01:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b53V1vIczP1oKVlSQwGIbtmVsPiBx9QkcPVUvuIHo5etpbnENUkRwxgCoCaEVffROAW8W7qkqv37ZGcoMg6XlwCnc3EIjQ95DsviyP7wGxp0lBcOx/Tf/yWYM5PvBachDKIgl1Aa55O5MdhHn9o6vfSyXdDY+o3Y/MPsGxp04yr7lZYlmwR04yuKfeKElsJsDYoByFeHbdbrtBczYMKKlB/BcajP8r4WGQMHXYOXFXLh0H0sxRFpx1kAdURApytihnaV9gNy/Bu0o4LTb5r8oPmCafgN0GIn7KL+x4TbtKctz71PvBcLilSrnrrEBVSt+BD7TGrSgX6+iU0k9OdpzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWR/0ocFg02BRREUJzsFgovXDOhKeD8Ik088kBeQIRQ=;
 b=Vb9iVob1+8f3H+6sL/RagDncgt07x6sm0+p4NjVFo8CbT1QYdZTSk61PPozXHLKw/GY0e4MI066gYyYCN2XatIbDSe9nnXeicaYG+FO2MQREN478wXWAYm5bogFsNJvU3Q0Ds3R456+EFmo5WQUaWveGCcX4GSjMIlD584wpZcrxz2W4yZq3xe34jPyT2BYAWqTJdFlFBscY+6y9k0Q1TYkWU176krHDgjvNdKkC/lLcu/Q3NrZ0FeiQVZGkMXC/3KTKbYSFe6+Vlo+My8aUq3H/I/hoSLV5BGH436mtkSl7WoST67Fw/VzgfpSanDMp8ja91ZodcWnIoNhinf1xWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWR/0ocFg02BRREUJzsFgovXDOhKeD8Ik088kBeQIRQ=;
 b=WyCkM/Cx5DaT+bcuXi4FJ9fRmfhDeiguooBNdgbP8utpimUHA7SDaDBjujQwpXVltAtYiIK7cN19o8REIRE/5GNFsQAwuMzIM5GxpX8VxuF4t1W0wZ2vGhM8hwszLaOEcyVij9sENrb+Ag5Z955lbOfq8T3THNMbY7qqr+m7eic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DBBPR04MB8027.eurprd04.prod.outlook.com (2603:10a6:10:1e6::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.24; Thu, 1 Jun 2023 08:04:22 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 08:04:22 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH 2/2] dt-bindings: phy: mxs-usb-phy: add imx8ulp and imx8qm compatible
Date:   Thu,  1 Jun 2023 16:07:23 +0800
Message-Id: <20230601080723.1556461-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601080723.1556461-1-xu.yang_2@nxp.com>
References: <20230601080723.1556461-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DBBPR04MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4507c8-22fa-426c-c143-08db6276ceb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AnrqqsJ4mHtmGbQrghC8mxjv1gFJjkgIg0E2SS49OmQ3gl9dYkHk6ZQJJs75bjVjxJLCIXNc5uGXzkpvxMnRC0N5rAxtvytdlLa8h1PadoHuY95l1C/Wx02YsQuVYT90xy0Qq+rJ730Z5lnGdUSKnL9zIpMYv9MLT4FAdoFvqaPIwxoTA0AsXiArljJ/OAlvQhP3LJd42MRRb5glNbLhzMf6hRpyQ2QOoeoaNpRNg106wm8n8zS8a25NozFphwGpT2wP+KkUc12gZnmnxXArRLkzUTJSMxvnIKsov0vwnLCG1Txa/Jxak1BcbV3KyPRLoBYTngEfOlisYa8vvyzj/MFiIjQmmGCPmdu+e/1XQG6M2Acs1Tq6X7thugX3AYMaC2ayZQlm5SP75xN9+N09HCEc9jfkVdfzytpcJsNjz9Oife1je0PNRkQSQRZlEF0o2tFfdveepsVPV21aEcJgFiFRF8EcrnvBgoC1QJTB/4QRbQhK+AAovpNc780ssK1XL8YX0NGeh35j1u/YMFPLK/AdCK2zfFpDxGt1wkefSw+qGptsaKB1I54eNQcrm0SrFkBFz/qon+g7NR691x6geGMF5sZCgFpSYyYpZ16qY829xKxS0dqfRIrDIXk3YElX9MPSGjJLm0QETvlF49gpPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199021)(6486002)(52116002)(478600001)(83380400001)(2616005)(36756003)(1076003)(6512007)(26005)(186003)(6506007)(86362001)(38350700002)(38100700002)(316002)(4326008)(41300700001)(7416002)(66946007)(66556008)(66476007)(8936002)(5660300002)(2906002)(4744005)(8676002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yj2iOhb83LJoFAyLPOxsiAQf7XMZN6xyFxvYa1ci79lPhRuePj5AFZ+20EJL?=
 =?us-ascii?Q?N9M3m7QDROHSRSkhFJOM100HdC6jmhIhL6pk0z1xjwd2Pbf2WM5VjlvyejhM?=
 =?us-ascii?Q?7wMSrZjUIRXoqW/ytXGnU3fWuk/OBzu02X9bF8JVD7hXFFMMd9pFtiFS/Yrh?=
 =?us-ascii?Q?O0G1RLMG+mV9VIINgjbE6F9B+EWkihFUCihTZzSVuNSubh+gcYSWWEQK5TN/?=
 =?us-ascii?Q?QYQcUjvAmmorzOnMmXvgzJDKlg8afyj9be50dFQobApHXpnyeyUv/VKrRq+H?=
 =?us-ascii?Q?M5OFcGKtgRUPom2omWIjIbtsNHjDbCn9xllxj9k008+vZFhjY277jsi55WvT?=
 =?us-ascii?Q?lfwgmFhmi9E+J4ZVk0iesfS7/XKy/6wdK+mKosAdi6+xqjm9m8tJD5iSrhxN?=
 =?us-ascii?Q?9pk94+jeOPRivVDwyJLY8mcR9/9ga2I3x9wAdQLTXL5MKta6HZLR0wF9HPrI?=
 =?us-ascii?Q?vTlCVcPAVD3Awr9DsOGv9s8vj9E/oHsh7XnboQR7Cz1f3gKL0RnckNpEIw5V?=
 =?us-ascii?Q?nDnT3fiaxNv1nOePslr1CSddLCh2O/VPnSDK2SM5SkMZUN0hjGayBaQluFxC?=
 =?us-ascii?Q?wOQ2o5rZ7aIcTMguisb5UssvKkju4DDix988N/jlEdGFeUdY9hXhJAGNNvhw?=
 =?us-ascii?Q?OTs4D+oAoke3pC4wIZGFAMVhFUvueZGDTcYBIsCwVhXJbD4S9MzFCl0BnGJz?=
 =?us-ascii?Q?T+WO3vFEaECXQIRTUMc/ODpmTZboEOnTv73g8FxjL1R+MdiEG3vVbT1NbVGD?=
 =?us-ascii?Q?TMg5Idz6SLZIOU2tEKUxPtSiLExAWdu5a54dq7LifFUCF/1N9h9Qdhu+AlKK?=
 =?us-ascii?Q?7xxVunD3SCXmZ7+7OVm1YXfHSn/VhtMlZLGNUgaWIxPvleRSXAne7Z95Sx1j?=
 =?us-ascii?Q?UuHG2mTCUYV50a5VaR0kMgMXn/wTl1MXHKR3j+z9ytz1kCejkehnENxX7XaL?=
 =?us-ascii?Q?8lgptNoKX0W9m2evgnDFBcnuClzO/UZH0CJ/KWvAAq4W6wSgEO0QyNsNhUET?=
 =?us-ascii?Q?3BSs0UQaCr++luM/p2kJy6oY9QonVjMN8egSEHW0JT3EEtVJ4e3xhHba0ZwU?=
 =?us-ascii?Q?wKMEsk8mYkRT+N/bNBb1xAHmSOLzBh3a/6jX80FIJR1NdnLpxLwlxaf6NfNv?=
 =?us-ascii?Q?nrbsOs6VGoEdma23XOmz7oYdiRobVeeTCIKJ00XVxKuZTEITyL3o5HRY7OXL?=
 =?us-ascii?Q?iWqv4MCrlG5Y2BRWK1knjgf8cnmhyboW48F0iWQ1o6eRIIDHQb80puhFQBX7?=
 =?us-ascii?Q?6lAstztCHJU4h7Bal3VF0AQsdW/mL1iWcOZIcI9qzKy+Z/IkzHwbiHwauUZ6?=
 =?us-ascii?Q?WrD5C3sgnISaADSa3PC/8gUG/+P8njvtPvWIbGMri7t0Aa3JX5nTjq7lruTP?=
 =?us-ascii?Q?+2QnT8VpeXEyBCkF7BOU2LTgdjCP7jT58sYZSYcBViHiF+6qsvYnNVB7P+H7?=
 =?us-ascii?Q?4nN1xh6+fe8bKy5Pj25YS3kd8ePNI+LWvJYnN8umT7Cz7cPoVz2l0/zkks5S?=
 =?us-ascii?Q?4xtjt0Ms1+fDEHTtfvXKRYJgH2loudhrNcrX35Whs2M6qjz4jN6abEBMxc8o?=
 =?us-ascii?Q?vB82N0lOu5q4DJYJWDx9Ud90gNJSoM7GNRgn6RL5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4507c8-22fa-426c-c143-08db6276ceb1
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 08:04:21.9903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtYBUq4sOv6VUuOYlsTlI+hpyIlOn/7lgkz8OHrW8QlzXJl/7CQ/zqCvbjWBj1RN3fcndDmOBYN+kpqcAZJmUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8027
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The imx8ulp and imx8qm are compatible with imx8dxl. This will add such
compatible.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 Documentation/devicetree/bindings/phy/mxs-usb-phy.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/mxs-usb-phy.yaml b/Documentation/devicetree/bindings/phy/mxs-usb-phy.yaml
index 48b0e654e52c..642491d7fcbc 100644
--- a/Documentation/devicetree/bindings/phy/mxs-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mxs-usb-phy.yaml
@@ -30,7 +30,10 @@ properties:
           - const: fsl,imx6ul-usbphy
           - const: fsl,imx23-usbphy
       - items:
-          - const: fsl,imx8dxl-usbphy
+          - enum:
+              - fsl,imx8ulp-usbphy
+              - fsl,imx8dxl-usbphy
+              - fsl,imx8qm-usbphy
           - const: fsl,imx7ulp-usbphy
           - const: fsl,imx6ul-usbphy
           - const: fsl,imx23-usbphy
-- 
2.34.1

