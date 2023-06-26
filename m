Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0FDF73DB63
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jun 2023 11:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbjFZJ2S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jun 2023 05:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbjFZJ1e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jun 2023 05:27:34 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2042.outbound.protection.outlook.com [40.107.8.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142741BD8;
        Mon, 26 Jun 2023 02:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHrBqMnxuGX2k+PVLhu/++Y/AfyxZcHZs7zmRLqbhTf9JGDIk6iRzTfOYJcFALIds7knEb2O5rcAkj7yz0W5YJtKRDiN2jtFxUZyevCbPFa9Nrl1iuTOlVwFcHF1JNu076WqawOO/AD7w1jnEaX9M6DH5/Mu5E4G6IhgYVZ22BXrpIwRDC8PKfJE/w16CaamV3oiB4gs2Q5EfNsgyFrunuaM33ya3wH1CN2U8Hq+k5tGX67faplKzIUU/4S4mA2WxdK1QLDSq9V3xuDEBUKxOIuvPenftTmuNfwxsYnT0Ndc+LeWeFu9m6Mwt5J4eqWQ7ewUNzcYyK1NDCDVfPWzFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSogE3bsyDTQME5L8/x/CAB6Mh23643uGobgY/r6REU=;
 b=f8KetkEWOf58vfsOTn7WYCOJqkEG9y8XzpA0LNrFo56JEoQJLnQUXfVw0/5JKlehlVXYEPs1ACaoj3PnN1Dp3KIVqsI+O5FUJHXOoCPAYdiKp/7uaSZpRRiWBGwKLIDPe91CAIjrv3Kx30uTDe/J5Tc2E0fJ8EcairSzqpXX+cHeRrsuIBDEOP/5giuR5IX251V/GXJNt7OZwiVcTo4ZQv0vofOrSG0ikg20EyU81lrfHKyrdkbxf3SbWm7AQVBBi6U5PUyWJoA7aNx6b6n4LtxBF2gv04aX1c9LKqqELMmXHbsjWHh+C+zkwfBDP3XH+5ysIiB5FFF9x7iePMMlig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSogE3bsyDTQME5L8/x/CAB6Mh23643uGobgY/r6REU=;
 b=it5MOckTJ2KdyztO77t+SHKeNGR+jKv5bPdbWtZT+Q83xCgf32mdc6s1vGLA4OwYhGJc6iUb7yB1igxIdib4VYJe+SI1uaV58+x7xTsTkohJ8W0mryl4Rj59yzZ0xIc51u0QR/84PCCqgaymxDL0cx+uPHi4fQwsgqIqgOQxFTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 09:26:29 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 09:26:29 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-imx@nxp.com, peng.fan@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH 2/3] dt-bindings: usb: ci-hdrc-usb2: add samsung,picophy-rise-fall-time-adjust property
Date:   Mon, 26 Jun 2023 17:29:51 +0800
Message-Id: <20230626092952.1115834-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626092952.1115834-1-xu.yang_2@nxp.com>
References: <20230626092952.1115834-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0246.apcprd06.prod.outlook.com
 (2603:1096:4:ac::30) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|VI1PR04MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b6bab8-cc54-48ac-d00d-08db76276bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J+te16Yck+d6xbGyMTth1ZjFiBmqOnIdD78zxG7qjyxoiwfccbt9TT86qLg5Ivw2tz8djOXOMCdOMYQ2Op+GT+iWVsexx88U0HA4Y/5FutceTVsSVLu0nQyV4Bp5P2NFsVoEfzzmU0HR3OcV66VR5QzaNNvaRRSst533Y5S72ElKvw9CLmSld5VkqHQrZKAZWXL216DzOylDapu2j7QI2Go/HsWG3ru9LLEc6vIs7vlEsLoBEyas3P7GDZuAVZjLEr2b7CIYIfZYgsXLObY9aVAyJAqU4dD3jvyqXYCLR3m8WBv8fpGHtMTyJLdhZ1AqHy1HRFPAEAScVi/372nTTIeLJ1N5BsUJNecUaJ6aqvOpGcLmzPfTT4A/S4A8qHRO36o02iCqU0x8YG8WRAdXaP2sL68dYai3TiJsDSio9oOMfGJBvnGbH/8iWbJ78a2TVjtdUnn8YHFrFvAOQCxNVhiP0DO9YCsyfojHP86awFQ5wABfDoNoiRMIe2+j/Z4lE2JPF3QRxXzQ+4PmUu8Qmjf5eY7pNcxZiUI3+yAuKOkS0ewB/B/B/WyyGfXMzNRyZ5Vl7Sl+Dhqhh+3F3rcBhkdS1ESLlbRJMu1pBx0ZUn9bs1Vhjza6LLaCTfjK38P4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(26005)(478600001)(6666004)(52116002)(2616005)(6512007)(1076003)(6506007)(186003)(2906002)(6486002)(5660300002)(36756003)(38350700002)(38100700002)(316002)(66946007)(8936002)(8676002)(41300700001)(86362001)(4326008)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jv+7dvT8qKAYEvt+YM7o6H6ua9SI5b+m67t3RDei3Yi4dsyjJOYGII11cFQ0?=
 =?us-ascii?Q?k8xcQgkG8orEYhG03rgo0kg3Uler59mpjK4wM+5SDMw+T9bRWqacobMEedDP?=
 =?us-ascii?Q?HvPAlnIWQhrusIkmrgN0GREvMrHxHRmv3ye2/cAfIFOZh9gMxU4QfFYnlrBn?=
 =?us-ascii?Q?6szyaDI6zuKRrp4JxOT7RUH1mY/i36VFhkxk4hbXKG55TbtvM0AeEryFIrss?=
 =?us-ascii?Q?r+5/vO/ahTSWhk2V/gdkmEQiVChy4Lifdfk/cy8CiPvSZQpFmg7VH3qprpvY?=
 =?us-ascii?Q?ZdHdaIzO9rht30cAM7BuSZcOuT8h31xOWTAUt6Xt0P3xxdbvV4DxA6al7JnM?=
 =?us-ascii?Q?r+7rhGfsfNj6HTCgDMGormoPhV7cuiEbp3DZGEykmK2UhKE1gz4LI4oqxPUC?=
 =?us-ascii?Q?vmezBQOzz/prAWxd+/xyuVKQs3PU/rghXn1HQfy2Xeubr9oxjOCqXdBgOf0w?=
 =?us-ascii?Q?u/Dzwdq2c4Qpb0JjS2ypP0Ag1XHlFbRDCHjmOKiJQX3QVZ25VVrAhBVLNGIt?=
 =?us-ascii?Q?5ZAHYwegDpOu/q7028ZblEPnfZh7ozpyMBHAZGYk84CAcBqNI9MD7rnOxIdt?=
 =?us-ascii?Q?OR9ROEJQJU/Q4PzhCTRZtdNvUxRujmfFtF1QUDpsbn/u3YHcidzMKom5Mtuj?=
 =?us-ascii?Q?EWKmDS2DqZovqcQTgBpa3vE1DbzfuIC1bbZDo64oyGIc5T2v0IArDM2WsMy5?=
 =?us-ascii?Q?GjZuzhgn+r/M/evVPG2oI0xc/ydLn0gSRjyMEzMCn5/YBBIWYiRMvNgcGncA?=
 =?us-ascii?Q?+V2Wm279qazzO3km461wmCb+SgYP/Aaq8soxSCZCyNTADUDpJWWb4rRj3F5I?=
 =?us-ascii?Q?nzcikdCQ+8CbwBujwNHQZuJSjBEKRef1/wbguRZYN/0WrdgL4BTSmA/aBWaD?=
 =?us-ascii?Q?XwQD523iJrkTk2PkTNLErqUBbIawNOLnYeXtA/OwaaRlxUt5a1sTD9JRrVE7?=
 =?us-ascii?Q?ZUW1o9UtXjRLVGf1pq6jcZe4tRH6GJGoAREWTiyMcZQDnogvUzzuh4T2Y8Eh?=
 =?us-ascii?Q?uq+/ElpEA1cXSWnu8MZYhhX0RaL1hptAHzHJSSDUqfWQ4tfQJ7UGsGwLk808?=
 =?us-ascii?Q?IY7P2UwTYcrLh8SupCyf0I6J9T3F3aff16T7FCJeQPcCKA+R51BvKjWjhUwY?=
 =?us-ascii?Q?/9aR1a64lM4+GNF7qxWdwND7ThS+tqJL71QuwcwpbLMoaHdpZcHRELwJNEPe?=
 =?us-ascii?Q?0/DDgclNKrPMD+eggPSoXjWMencZFujvZaGmqXbfPZ4J48MuitGP5r0ZpcEp?=
 =?us-ascii?Q?LwjUfK5ysbw9s+OBXY7ttLEnD71vNXVWPNxjM2584hBTNKgPrns51yBMb065?=
 =?us-ascii?Q?yXFV1KxLJU9pT/fR24Ekv8yjSms6ZIMn7AEotGzq3AhMtQ7MGXe+2el95qsO?=
 =?us-ascii?Q?w8fi55x0kblDoGOQe5NtCn/jN8hCWqg5jpMDOnCX02gvStoo1WF/xuTiqLcI?=
 =?us-ascii?Q?zjjPGIqwS//n49NksHmOu1Rd0JDc9D7EdftmtFtmt0QZevjCHE46MPkOJevK?=
 =?us-ascii?Q?iOEoAzsYkFu6xPkiZIFb2llrS6g4WIT0aCuUowDorXufSPVWY0GUr99TGE8r?=
 =?us-ascii?Q?7j9LFSVjKZ6n97wE+Z4Cw7adesYGZY8ep5BnGoiw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b6bab8-cc54-48ac-d00d-08db76276bc0
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 09:26:28.9801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLdx07Gc0lspa3YOVnCAYMBulCpnalyKblXIK6ym7dyceyNkildYcMUnYT1lUEDhiOyjifFMasx0rp/rDzilXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The samsung,picophy-rise-fall-time-adjust property can help to adjust the
rise/fall times of the high-speed transmitter waveform. The value can be
0~3.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 782402800d4a..d84c66c342ac 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -292,6 +292,16 @@ properties:
     minimum: 0x0
     maximum: 0xf
 
+  samsung,picophy-rise-fall-time-adjust:
+    description:
+      HS Transmitter Rise/Fall Time Adjustment. Adjust the rise/fall times
+      of the high-speed transmitter waveform. The range is from 0x0 to 0x3,
+      the default value is 0x1. Details can refer to TXRISETUNE0 bit of
+      USBNC_n_PHY_CFG1.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x0
+    maximum: 0x3
+
   usb-phy:
     description: phandle for the PHY device. Use "phys" instead.
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.34.1

