Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3C5772DC81
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jun 2023 10:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241216AbjFMIbl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jun 2023 04:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235270AbjFMIbj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jun 2023 04:31:39 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2085.outbound.protection.outlook.com [40.107.104.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C5BD2;
        Tue, 13 Jun 2023 01:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0I+8emFy3lBXXTw8fO1tVrbbLODzruyJrp2MGDJRtiOZsZpTJObIzrmLyN/wq0doJ4SPJc5Sz2dQaGchwDE8+ezmE8ab1C9a4ZGuTJCg/N1sBbJMXgyr7pumTzkzbGB9GBb5p5aqYDm1kNQz4JqQkrUVksqXbWy32ehSfFJqY5mSzVIiIXGhAGzPbGzSgzt0rGxPjakylska9karuepBVkIXdeyjX2yYuFJJ93FyphqwGiTEntyyr9yeHb9wX1+xWH6zOY/xEc5FY6hvhh33dmyt6rzx2X1y1i0C3pa64AOaWV28n8iLOi+2n38JW5NDc/AYE5SQ7nfcw3R/J+MsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1XtWfZBP4Q1FnvHP8399scCfjtx/GPg92mJZeRtM3Y=;
 b=PFvHKGQK8DYSlUMz2byJ4rv6QD4RI+JOIbbDtVAMmpkxJuIPsER/plz9kFm4GpH0sSLwiiUX+r0PVVFLVrRs8SbZHyaRdh8qnw5isil5Bdizyw372F14SjAPjlqgA6FFGcN7qugssX3nlhDKmuLEHNoMTyTzVoKhFnG9oPc3fA3ThQ2OC8THGnVGil02+uUnstolbrXp/2lB8Z3YRiDhsk0rjnhyYqdmWzNjEdGzOj6UB4gXizhgiS2pfkNoVW7yvYKR8y0gtaZlnpMmqtOYHPUP+WXCu7xLBGOayaU2Ra5rnb5lTJbnU8asLhwOjvQzhhstWuwcGtxO4vUgik4zvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1XtWfZBP4Q1FnvHP8399scCfjtx/GPg92mJZeRtM3Y=;
 b=F7WeJ46LVNsGrHGV9aDOvsZ4bvbuzCq1emqn2h/y7YX7dkDI8rEkqAcwlOL1Nl8X4PnPC8+rC9eZ2NPAySxw55B1kZL5ta3pdUSoQ7cSseMK6E7Ae2I/NGyALw+BpS57IXjom3w+5hWW+1j/rL4xkPm4Ue+Hi/Lpu0VF7u+A12k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DBBPR04MB7529.eurprd04.prod.outlook.com (2603:10a6:10:208::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.46; Tue, 13 Jun 2023 08:31:36 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 08:31:36 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v4 2/2] dt-bindings: phy: mxs-usb-phy: add imx8ulp and imx8qm compatible
Date:   Tue, 13 Jun 2023 16:34:45 +0800
Message-Id: <20230613083445.1129137-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230613083445.1129137-1-xu.yang_2@nxp.com>
References: <20230613083445.1129137-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:3:18::14) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DBBPR04MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: aa81901c-c1df-423b-8761-08db6be89997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +6icaAvEFvzTFUmURTqTJO6enO+RAUO5Ry20I63vs1wrLt5w3ugXeqVSkui8dr8XHdI9licU9S8mfWSdbgShL+Uc7XAGn6Wuau7LjvFs4HjEK7jrjlubxPUSFO/RApmx6lVr7OBAyhFLs0ZTvhHeS6875+DUb8Di+neP4qknXy+waE6KWBlFB8jMHKB7WoZLWG6qEd0UtZNqCWzbFf7+tlAatV+VfPv6qdNtZcBq03Py+9gK+d//maudmZefmj7BWeEzNtCAzTiPOeVMTgO+sE5XCfXXHethrx5MzBg8Zo8xeQ+lsdUrG9fU80+KkEcrNzxmxj+spk9wztlRYwUaZLtgHXYgmZk0wBLWv+WTlLdABLUkx2um1ItTUDvQ1n3gPLB0l6WefMPLSc+X7/4ZJWn59sZyHZbgdgRzRL4v3QWA0kkdPA8yZGrLp3E+vXC7Lb113+JKGKEq6HgT1N1AHVYSKFTDZVRHVqXQGIdqrP/7VqpODrf7Ny3uA4971GnBHZC/OYDvSFlZrhoNaHVwt92cL7rlBHanjWz2eCsz/wCUhh0dYEBsCjytTV9hgtXAHRGGjhNL6mUzEPCIV2ehJtgqSdqWwfzyB8d1WZa+7SkjbMIIXIE0BbMcTjih7TVOdh3Mg130JZDuUT9WZmoglA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199021)(83380400001)(66946007)(26005)(6512007)(6506007)(6666004)(6486002)(1076003)(52116002)(4744005)(186003)(2616005)(7416002)(478600001)(2906002)(8936002)(8676002)(66556008)(86362001)(5660300002)(36756003)(4326008)(41300700001)(38350700002)(38100700002)(316002)(66476007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ErAsHmpO2Y3dBaD9I2RGbwDpvehXCrprUPl1PfE2S8x6nBk4Rwbm7Vv3LMt?=
 =?us-ascii?Q?YNE2kwQEZHIDicwkk6XQVU7mzJZQsnlanAq19M38u3+F4ZVGa8Y7MSHt93w7?=
 =?us-ascii?Q?hYflSTn94ALqvKP8D8UBnuPrz67MZ4SKeUGqp7RaPgMBCNpVsSi4izN2bwgU?=
 =?us-ascii?Q?4P/Rhl0G453VnscgyyzzowfrnAvKQXsoInGc7UVPAubwNVdZ6EMT2MBgZtQN?=
 =?us-ascii?Q?n0HY8m/6M0/0kYTuhn5TCz70qWZVpiuw1Z1+HTXH3t9GOxoN+AVedzsxtnX1?=
 =?us-ascii?Q?B173AYbSoWT9B4BhYR6x2gH0inles7j5KvUFVol2McMmDdLan+Oi/M3bB56n?=
 =?us-ascii?Q?XSIvzt8MpFMLWE70xO6fgTHamvn53WXsCOUAMEImz8JDAjTh6zMlFWv81yes?=
 =?us-ascii?Q?U/vhHelJ9KkLRDDi4YIbTcBW2UjfG9fVKWEL2LtO4Uq32LjIQmD64VOAv/Mi?=
 =?us-ascii?Q?Khikf8K4dQZ+HohieSL2GGLM6LidFzK2BeBpjS1pmMqzmh6yu+icdS8hGFl2?=
 =?us-ascii?Q?NmJo5vDqBAIHV3R1ddkZPgD8LvRPG7Y8fK2JgIygCSTWlNAA4DGk/8N0Fift?=
 =?us-ascii?Q?eyHHeU8fXrYPrz3Yp2A1tjaDJjLZ9kRRuNsaZdB+cPGfPIgzwP+KqYFsILs0?=
 =?us-ascii?Q?DzpNiHu726SiJuNB3PriJQo/P6IcGEHFggsFZAxqwNkXikcDCOiQpTzyw9vK?=
 =?us-ascii?Q?+6kSh/rlIIHvjvGc4IXrYa2z5CySU9W8J9OhEPv37xLO2EvD3WFPiGtkXc5T?=
 =?us-ascii?Q?bSxDOltioiknYw+sBQgqennxyhctfBrng3pTrvmPKXgld69JR6Q0r35JB6I6?=
 =?us-ascii?Q?GKyIiOvfaGcAlybHc8iVOKgjL+Fb+rQDxfBe4CkqSB5wHujCESOxz7ihsHom?=
 =?us-ascii?Q?flCPk0DtoxauKx3AoSbfkFld6aIAiUNzTs3GRG9lRxDn1dWUtFgbc7Cn/eCH?=
 =?us-ascii?Q?OZFL5nPQ3yJl7xtKdgNeKeZxOgXaIeQIHC3sdxHMWCTOsxdm2PPajwtgIPVc?=
 =?us-ascii?Q?XT7ywlahSLpc5GY/lNvcTNU616cy12rqP1iqbCbDXz6C/waNyFYlcgKTFOSG?=
 =?us-ascii?Q?W8XIJV6+VoC0QNi0KnAfp9+8r9Bd/86mmhKDKcadnIa9tX4xdA3OaA1586HO?=
 =?us-ascii?Q?eNo6wqH9F4mIGE6D4JGI4MFgoVVmN6pTFn4ySGhbAU+HmVUvmy1U0iczFvWW?=
 =?us-ascii?Q?YsZQTF3z3nRKwdiXLBMGmsQPhNBDzuhefUSei/RfiPGLlQyLQRiL0p/cJY5V?=
 =?us-ascii?Q?z4aY6qkgLkVrdx9a0Aq60UCtk1XQ8HrdKTJAlnfVsxCoq/sXHxAl6SirSq25?=
 =?us-ascii?Q?/gJzHZsGmhgxoZdyovL07BMjP1yUSSB50/YPN1bIHQWTYwS2kQYSPUnG2nkV?=
 =?us-ascii?Q?hkDuNEIOMjbEUH8kk1PXjMB80bcsQJZIfVVjOTuhazWYEqC8YgsvUzHB05+H?=
 =?us-ascii?Q?lSOw+FSgLvl0mbdb0IGfk1FnxOyfadGYmxPnxfR3XXsMaAYDTl8awttQB2dV?=
 =?us-ascii?Q?ml4HDr3NFhTK8p+RUyMzPN938b5ejB4vDe3Mt9wkXjmOuX9JN7n/txoh+l1S?=
 =?us-ascii?Q?gKve+v2m4azmwLb8MqJ838CKDYFBZXVEX/cKYGKb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa81901c-c1df-423b-8761-08db6be89997
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 08:31:35.9606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQ8k0lOH4DDY8Nm/gWuNU7NoLJn0MB0yXOEd7ugAo9Xq6hadg5+YKf+qMRknFEONiICPfC4AdeGE0n7XJkzJqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7529
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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
Changes in v4:
 - no change
---
 Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
index cc9f2bc7e6fb..f4b1ca2fb562 100644
--- a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
@@ -29,7 +29,10 @@ properties:
           - const: fsl,imx6ul-usbphy
           - const: fsl,imx23-usbphy
       - items:
-          - const: fsl,imx8dxl-usbphy
+          - enum:
+              - fsl,imx8dxl-usbphy
+              - fsl,imx8qm-usbphy
+              - fsl,imx8ulp-usbphy
           - const: fsl,imx7ulp-usbphy
 
   reg:
-- 
2.34.1

