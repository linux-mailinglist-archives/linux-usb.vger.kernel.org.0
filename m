Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1CED60DB57
	for <lists+linux-usb@lfdr.de>; Wed, 26 Oct 2022 08:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233162AbiJZGda (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Oct 2022 02:33:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233038AbiJZGdI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Oct 2022 02:33:08 -0400
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2089.outbound.protection.outlook.com [40.107.103.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F483A8CEB;
        Tue, 25 Oct 2022 23:33:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1exx3GyI4hLZU89TxFx2PJLERlEg5NFeJWFo58OESfndWLkXw/WvRcFQhTsmeMIWFQsolFOn/Z2L02fONt33fbeLkIgdlf0oUhWWTg5b8HPABL4+0JhjjiTvzGgu5nioW0R4hZPwYT/hqXT6Vo8KaO24Ee66vGvwiH7Ypz2NQ0z/zHHxcdhYTI5fWX7NfR6HgJPklpY0u5aNE8IVlRl+r4C7w8wwzdkAmM8je30yIcOpBTvqxvhyg/YQO1q9X6SRjb7q6O3jH1RQ9SV0XMBDN6spiz6lrlAotE5HQvFsEo6g1pFwfAyRCA7gKqCnqjWt9RfS688dgkb+/ro5feEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaxSnOclnY5L9Odu3JjhjjXxqeEsNk+NGbMlAi/41po=;
 b=N8fT06aGBJ1mdN0mDkjA1VIcLhgvNIx+wmOO0kwWVVuO5+4OasQN6zLt4KiSI1glKRqU3B+udZ2fLZ/pk87z2KHfyMZKuNAjXflNvxZorj/RLih8CKs3xGha8RM7WOMiB6jV8iO+rz9Q3Ts/4twQAr7O29M/+tpBevjSwWglrRkB1Pz/aHsNWgcalOHSc2n64SigyvVzipE4lqdMvkv4HuHCnsAA6MUYABonqdbwpivWK0Kc8q7T3QlUxQetI4DG2ZyIIgcsbFhd0k6TBCLAw0vUSQi5YCtRe/SoFF7V0IjI8pDPPpHdYcQVGVjFxFfBGQErg8KRbl57ZH+2EmK86w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaxSnOclnY5L9Odu3JjhjjXxqeEsNk+NGbMlAi/41po=;
 b=Vf+Pmr6yxL5HcjjbXFsZ0LQzScq1uIJAfRuHq1Or7BXGdk3+lJIDmD6VvdXsTP/qP+nBBhbk5ZvoK3qQyq9igRTmPhBRt7APCn5axodqCVYWDs/4j11A/qKbVcrjRRYu3rCq0D7eAJxlidGcDNkmvzeKlIKhulpOHyOUZuy9UdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DB9PR04MB9260.eurprd04.prod.outlook.com (2603:10a6:10:370::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 06:33:04 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313%7]) with mapi id 15.20.5746.026; Wed, 26 Oct 2022
 06:33:04 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, xu.yang_2@nxp.com, jun.li@nxp.com
Subject: [PATCH v2 1/2] dt-bindings: usb: usb-nop-xceiv: add wakeup-source property
Date:   Wed, 26 Oct 2022 14:12:21 +0800
Message-Id: <1666764742-4201-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0238.apcprd06.prod.outlook.com
 (2603:1096:4:ac::22) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9640:EE_|DB9PR04MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b2b526-2b27-4d46-d0f8-08dab71bef09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D9aLo6Y/t8YJ4wsrm/gdo0n427bRhIVQF4daC9zQiAE1GCpFbJ8pPmr/Mm2AxOesqUNI3t7PiBRh1rDRGnDc0lNi0V+MZ134ek8ju9BQuS4g3b9Z2WGL7aum2fTAOTHO8nR8Pt2F+YZhJi3AEDRSnuZ+h/vgdF6aR6W6gQyV9J0a6YzXMar84IR/VW9PLMw7+Z5ckoRNCE+fXhlAgxhE5Hju92GpSHtYaLC9/LPccC4vdqwOQoO5OujK1IfpD4ysqb6cUgWajeNJWucneFgjAy4FaU+q6X+jD0Q6KSj6erA8pYxVXBGJ7+YkGzO6qyrk/xVk9wX1NkCL3Y1EcwjqCarK9jcHmbQcs/7qsitOF70FMbbYUzYyb45NCdTVfH4ohfGT9tUlli9JzfQzFDYIbVniTb55D8NvXhETnvCEI4qh/4pbIxiXj3Rse1Nh4iDL4IjQsAtlOAilhX4O6T5GASDFjpIQMxk2A/ugpv6YMcqmjKtVgc/kLvBmfTSIdOxKzlkvsmZ4NZ6geaP6sI8CXm6pookn102XpVHvWuuGx15BiuvMsv8W4C5IWPFQwpky2Hm031Eo4U9jlQ3Rg4KkNkBM3hVZ803QXljMiHhmisAvNzzWnMBaU832OLGgwOFEhMkYu3PAWfGqrehN9B2HnsLLU3Mgmh/Y29VR9Di4N8Q6Et9CyJr8Nru6fpZMqeks6I7muX6bnZ0Mo68ZDIqem9SCsQuOFmq2iFz5ATs6Lu8JCumz5WIShYC9zgWhqK6T7sVvFtskFr6n25MED7G8Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199015)(86362001)(36756003)(38100700002)(38350700002)(2906002)(6666004)(6506007)(52116002)(83380400001)(6512007)(26005)(478600001)(186003)(2616005)(66556008)(41300700001)(4744005)(316002)(8676002)(4326008)(66476007)(66946007)(8936002)(5660300002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dKkf9fQdlSs6EZ36rPKCj4U4Xc5g1uDUoKU/PJzGh+P/2JU4ocH0ZFA0o16I?=
 =?us-ascii?Q?ekOwuCW7wNDsNWeIVXFDES+pNEJx0Y5wnRLvFo2PLsbeU5VxclEcSsQlCDTv?=
 =?us-ascii?Q?0RbgOX2H7L8nr3dFocRLnsfGLqHHK3i9JWbgigP2m12zmsi4+lj1EbDNu/kd?=
 =?us-ascii?Q?2AjE78w13t0kGYwQ0ZsR6qdL6DcCG1HfCcHQL+ePQgbej8TqJ/qIOnxu9Swx?=
 =?us-ascii?Q?S8+URVAiNMR916sZgYUH/kF4vU2OyXQ0Wrq1cmTecws2w6cVYcQ7v0gKQkUi?=
 =?us-ascii?Q?g0s5ynRuBae4Cu0SkKIe0Pwomhpc7k+aueMA7rBzYNvrpSoBcWdKh3RvCEkl?=
 =?us-ascii?Q?wZTT9jsaxTj6k+vfX3e0UWMsypPO/mDVwobgJuCRzNjc/39nw5vMe/Q55omF?=
 =?us-ascii?Q?wwmv2BqHsOl/OXKVGb6WAtNF3aIOr03yZfW8LMVJpUXbaYcT6Oh4uXK0DY9k?=
 =?us-ascii?Q?+lMgjIbGbNMlw0lAMCWCyLFFbmCr7UYuXid64+D7pPjZo/TLwXTzgU/Ydbh7?=
 =?us-ascii?Q?EJh1Yn2RXZFtt9fDdN16jC/DVlvtp6RXtMabfD6WbUQJLJYDKZUSUeV14890?=
 =?us-ascii?Q?+t4kOZogSt89XpY9EyyXH2zsDxs3y5w0P4vn/CMf8iAPrpaizqaJ8FVHaTHJ?=
 =?us-ascii?Q?l0NciWi8ZlcAIqtbREelog25ruO2KxtnQgT3VlNL6eZVq/Bl+QiGaTnfpQBq?=
 =?us-ascii?Q?WW8cvjFtS6SPdRmvwo9eyKdlHQgK+te6REFfPI4atUezRgAr6OCYz1hPJCG+?=
 =?us-ascii?Q?5MsJwA/KCpPrWCRksnRny7RCskNV+4Y6QSW8hy8DeJEK1Gv20Smzg/9KyjPv?=
 =?us-ascii?Q?wxUNJXRyl1gDpbGH6oeNu+O1HuwW8GOzckiCLwb6TZ10bx8wWe0jl85dCpfz?=
 =?us-ascii?Q?K43UAVHjukoiW6dxX4XJt8oYPUt+i7I/mNCaXkAoDbqZPpc0T7IiudREm+69?=
 =?us-ascii?Q?pGu9CD8DQZQ8dRJC1+GYZmHFkyLida2aN8BDC+J9ADbqgmyZ4gyX2AoiQfGx?=
 =?us-ascii?Q?sIdurpIARzOfVBLH6iJKriE69gW8NqjthxMQ1YjwcNHT8F6cuga7gNgvknie?=
 =?us-ascii?Q?Q5vQiyh8yZeyv5R0bMxc+7cF0XsYtpcrCFi0F7FyEHogu18pHnSsFobNKt/n?=
 =?us-ascii?Q?Q5WS3U2yU4wb6aAe0f8P60e0lWosHBVucOOp6NnY1Cf5ucgiweYBB2TweDQs?=
 =?us-ascii?Q?g9eY5rscW9VOUzeLkFYCjteE31+hoaVCpp8djk2Iq/S7bdJ4+6dKlr2+C+do?=
 =?us-ascii?Q?/qUb1EnX6CP6aoz+2CJZPyOyVJNiAC3q3itcIqHNJ9yEV6sloXccSsS3V6+L?=
 =?us-ascii?Q?BCbFUHYXQ8+ZpuUYg8L7y12mETcOaLd0RO70pUyTvX/ldyhL3LjjocKyAzpv?=
 =?us-ascii?Q?HHkNzFYfMx9DTLhTUqZlG5U+z1bQldPC6goakNLZCd4diVuI6cAvhWLtekBG?=
 =?us-ascii?Q?FNxAbSdyYSlysKHE1vQQz6jT0UGEUvMnLDI5+Nmsid0JNu3XCl+d51mjUqyM?=
 =?us-ascii?Q?JGoHHEC0n2Ja1Vc2NREJ6+ye/avvT9KEGk6IQAFhBkVeq4ecQoD1+vYOHnEL?=
 =?us-ascii?Q?3OV6jP0fjbZQB44KPRB572wW5ZlwHc3caBBw0hS2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b2b526-2b27-4d46-d0f8-08dab71bef09
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 06:33:04.5785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mb41ryycUjPn9S3P5hqVj+yvmzgSSDCRREIg3lPC9SqNoudlUwRMNt0E104vn69d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9260
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB phy may be a system wakeup source, so add wakeup source property
to keep its resource (e.g. power domain) active to make USB remote
wakeup work.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
Change for v2:
- Remove redundant type definition.
- Improve the property description.

 Documentation/devicetree/bindings/usb/usb-nop-xceiv.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-nop-xceiv.yaml b/Documentation/devicetree/bindings/usb/usb-nop-xceiv.yaml
index 2824c17285ee..326131dcf14d 100644
--- a/Documentation/devicetree/bindings/usb/usb-nop-xceiv.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-nop-xceiv.yaml
@@ -39,6 +39,11 @@ properties:
       the VBus line.
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  wakeup-source:
+    description:
+      Specify if the USB phy can detect the remote wakeup signal
+      while the system sleep.
+
 required:
   - compatible
   - '#phy-cells'
-- 
2.34.1

