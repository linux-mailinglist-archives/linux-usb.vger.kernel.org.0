Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8279872773E
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 08:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234678AbjFHGZn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 02:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234665AbjFHGZi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 02:25:38 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2058.outbound.protection.outlook.com [40.107.241.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44CA1FDE;
        Wed,  7 Jun 2023 23:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aon3fmj9TMmiDSm94wJ8SDAKvHulk8Db3BFzkq3+4zWhU1/E3QkqZtPk5iCbxFmbFYr/GbmCC+BurTldhMyAD6qibqVipVdtI8ASd9/mvYRbM1NMo3NaUEUT05N+ZqKlsmhJCjfPQ/dn81IREmdTlnII/PDNmdv6PL2YXBQtngaTWCZOwOciBfkSht0dUxa15ieLKM+CXiihqtFabA2ldG/RS3mZKE9QzTPdq20Tet9J+R4ldJiD3ddEjBluD2zAeE2SbeHJCEuco1CBx83EK/XFRdwr5WKzV4GYvm/zwy5rM5wIphjuNI+38n17wCri/Ots4wbE2lQ8TvMFhXabCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGszeJP1I+3qjVypfa0VCp1WHX7JW1a83KjNBNBXvv4=;
 b=OzdPiAVU2I3hL2aBdZFizbRWDvIeB751F+CSpRgHGnk7LaYwAeogf4ZnaUn+U6SVS32Oed7g4jWKFIM4yw5+t6FX/xnKWFlH3LTB8vIDQXlyhM1YhqwtF6DQyBYkLe5l/5eDE9J0qi4L+CTYr3kb0i3Ey3IOy7jXI0cs6tbH+XeLnQYnRHt/AGdIe3jq4lTqkkOrZHqDbJnUWf/4gUfgSMY+JRe3Jlq+3SoSz6YfqhC/bx5t1E7iCBopdjpyBAHYgVjNyhpMshVYyBqjvk96gmcHVNf1fNDIk1ln/0xEqBJuvjXCqTJaoPNZNiY8ZyrBayYn+hguDgTVkhUjg+Wg2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGszeJP1I+3qjVypfa0VCp1WHX7JW1a83KjNBNBXvv4=;
 b=H33921DiZMquibwuNkDu63RJNJAurkMnunEJRWJslJDFgk7xVDxik4uE5VjcZaioLBYvdwTeMhXWS2cgK+eNqOEjK+7jgdo3rbFYFh4fPRtAShkVX8Xg8uRFoXiAygQDK/zfOc+3STz8FA+MOYibR6GMhKM3ZSfQhMSEsdLs3ac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PAXPR04MB9596.eurprd04.prod.outlook.com (2603:10a6:102:23e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Thu, 8 Jun
 2023 06:25:35 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 06:25:35 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v3 2/2] dt-bindings: phy: mxs-usb-phy: add imx8ulp and imx8qm compatible
Date:   Thu,  8 Jun 2023 14:28:42 +0800
Message-Id: <20230608062842.4171157-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608062842.4171157-1-xu.yang_2@nxp.com>
References: <20230608062842.4171157-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|PAXPR04MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f42dab-93bc-432c-9cc7-08db67e92b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RsnTFGdIKUP/4vdnE2otfW2ykj67h1TrY/bdChaENYd/mV6VcLLiSS9037KXGugJrDrQMmYdcWCUbmr6C9M8oVnjLt3vwH6ad1UHaMG56Nn2HGb99NTW1EeyBlooHwuzGb5wbvFHyEHSVD7ujhNtOXiD5fZBMgR/4RdpRU0dF4lIINT0NFYoz+dKGwxooh2NSuCk6XxDGaNCHqdfNoFMu7cocw9/D+jnCSOvWy+0mNB7vKXGk9cjdiPH29mCvdhM9fAHUq4k/4uut4b0nPrf8wtj9GWvY/wNrPtQl5Mk5qpKFKdFHdrh9WNmS9HgbBiPPyX/vBffF5b8n8pW3fIKdsLuW0uQIFqvuFM3vTQIsMdBTeoRELespG/7VueOapW2X/2cAFNSBk2opcSu5FmbzjWdN9Ynqhyp8FRiC0d2fuC4KYfXtiAxWN9tCphAgFWAM7KOQqqO10sSqgkVnXOrFHJkPXQqZB1dhKht4BRbKyUcvCH1QLBSqi44bEKG6AqSXcCti6JnUmH+zLuYpFf5BErv6A/u10E6mD6xTz2s9YopmZfdmVF/E8RRfxmbVsHqWzzH0eSRmV99DnMv4X5fY9ZH7yTi3xNKKhpFvi/jox5QtzPrcGOPz1xS/P1gx9X9wW3Ip4J6bkqXttHYnRn9HA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(4744005)(2616005)(26005)(6512007)(1076003)(6506007)(83380400001)(38100700002)(41300700001)(38350700002)(52116002)(6486002)(6666004)(186003)(478600001)(66556008)(66946007)(66476007)(4326008)(316002)(7416002)(5660300002)(8936002)(2906002)(86362001)(8676002)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AZCqOM+xMQJ3vZxcfZdOU0zxiEvOz1Th/Mf0A9Wu3BZI3+XQPzfd6EYet4vf?=
 =?us-ascii?Q?NpdvK3FXykPAjBpGrLO4Jta2SZIgVNZohwrdLhkPcikQ6JV0ff9JhNTrvpW8?=
 =?us-ascii?Q?1nQMkeXVksZ6S59KAAeuyEiOCzsEBw9bbA982MZ4drJUfJAtS8+MlVYpWI4Y?=
 =?us-ascii?Q?v2gjoBUXu+LjTmdO/qp/c/rxzMDvH7mEXRdsD6psbLtMUzxYjlfdzj3ckL16?=
 =?us-ascii?Q?o0B5XKJsE99IcfMVGMSqczte/NgZ57OFJNMrbOORpNcwrKjMoKzokAHEVrqm?=
 =?us-ascii?Q?WxxO3xeIgyYdTYIZIX1Aqs6AZup5x5cRxzuXkKDWXJ0z1syFU4L7YKIKQ7Sg?=
 =?us-ascii?Q?1qBPCA3z93ERm4jFdWQDwPmJF/JaF9yTmaGmsCSE+Dsgb3sRwKdiT9buLmyY?=
 =?us-ascii?Q?mkFRWxv7NecFSjM0mKaoVhurFPOLLmXPoqlep1BYx6FUUqqUxnbn3J+YYl+o?=
 =?us-ascii?Q?IejZ+FTkFEIYkAC3a5RMUk/UkUAr8DO+BKOOVrdpT60PaI29pMaiBDb7wSZI?=
 =?us-ascii?Q?D/Bab+eCx1oxoFPGBAGwcW5ZdIP3+zNTASx3j9JYJS7H/RWN47LoZbrcNXep?=
 =?us-ascii?Q?nL/VD/j5r3lrwYL6FHQFVwSUFsHp+NQIWPsXG7nBzs+v0Xe56/GJBPo0RPZT?=
 =?us-ascii?Q?6vBQbK6DV1/kmrdyWVNZ0BpQ+QoAzlTv8Dc6q4TDEuqCnkilcDPC5ouIeLNH?=
 =?us-ascii?Q?eLs86Y7N673di3sH/kPMM5EX982CBCQlQI5jCRJjfoR8cssMnLqdLGm/XRkb?=
 =?us-ascii?Q?TF0VWxNwZRsQ6Ak255ixHMgE1MPtu3h/gyWcxhbcZkhVFmusxhG10DPswz5t?=
 =?us-ascii?Q?3rrE7QeiICk8YLkjnQr253Am3INw1y5207bmAji3/tErpKfGojvYnv6r/MC9?=
 =?us-ascii?Q?HutmN8s23dlAH9eI4ee9Z4cMQZrvIVNJGxzls6xbJs6vbbf9UpuUsAZ+GdVo?=
 =?us-ascii?Q?6yiqdrHxk0DtOTHJsCxt2dma8PVKaeSK5vZYLJCOyB2pcd+jfWLUdDlzXpnx?=
 =?us-ascii?Q?2gNPlYi39fYKjqyhxjdoi/5O9+pQMLlnJgMSIQKWOMqrgGQkMAhp85zbHVw8?=
 =?us-ascii?Q?PEKfhB7eAutEnz6t6fm6G6hErRHvOto62lpFJEvit5PJn5VbVyJsiD9MjuKM?=
 =?us-ascii?Q?QlVf0Z5xgpbb2/ZjLeiMOCXEEBawdmui/iVzzXOUZoi628tLMxjBacn30frg?=
 =?us-ascii?Q?tpRHFWKFkL6viMp9PNk1X8xcsyMe57SlnZqRhXFXs4cfEX6lDQXJLgHAs6mR?=
 =?us-ascii?Q?kxFYGWzu3aaEV23QN0OrPZBPF2++V1sV7zSe5ppcJMqtRfD4IZ48Orqywspg?=
 =?us-ascii?Q?ScC0c9/sI6IxIeOp+LiJbsuvL8777ME/OaDg6uKJEzVDp5k1h85TY0drF6py?=
 =?us-ascii?Q?rfD1nKN3fR7VpRoIWJPOxK1c5UDYFxH6pOn0JVvaghlBm7Pj8iR56z3B6qB2?=
 =?us-ascii?Q?D+BUbSqyuHNFX+tJxXRrC23IXWkZ81CCdB6PKNWXdpFxrYq2OUBvo3pPJRD1?=
 =?us-ascii?Q?+l7lJ2VZ/WpsCwbWMQh3Bm8dUoxePFSUjJ8jDAZG3I5sCOWRqum+aK9ttT9O?=
 =?us-ascii?Q?ZxxWTl2GxFzOHUQuJ2RNJ6/1eGQCMfz6uSpoh8fX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f42dab-93bc-432c-9cc7-08db67e92b4f
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 06:25:35.7749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGOZuHJetrkg5xJ+hBqWz6enGBQqX/x7Am0oKMQydG8QyreBY8rl6ErJFFB13hxlxzCmDFOUjyAKEqYQYMzpSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9596
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
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
Changes in v2:
 - no change
Changes in v3:
 - no change
---
 Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
index 9b89a8891c5b..cb5d68274b49 100644
--- a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
@@ -32,7 +32,10 @@ properties:
           - const: fsl,imx7ulp-usbphy
           - const: fsl,imx6ul-usbphy
       - items:
-          - const: fsl,imx8dxl-usbphy
+          - enum:
+              - fsl,imx8ulp-usbphy
+              - fsl,imx8dxl-usbphy
+              - fsl,imx8qm-usbphy
           - const: fsl,imx7ulp-usbphy
 
   reg:
-- 
2.34.1

