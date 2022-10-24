Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C326099E6
	for <lists+linux-usb@lfdr.de>; Mon, 24 Oct 2022 07:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbiJXFiD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Oct 2022 01:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbiJXFiC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Oct 2022 01:38:02 -0400
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2085.outbound.protection.outlook.com [40.107.103.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8837C18D;
        Sun, 23 Oct 2022 22:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikUfuL2PAjfCGyBO2zsQNCn6fExpscpFbVXczUIIrXn5NB3d/XQhLutHoiCcd7dpunSzjhejZJmTgfZk18QM/IzqHeN3M7FG21umBUjOLUvM7S1hOuaV17HtBiIoVcOF828OhN0KO1KmwkgeVdo1v/cCh1C8r4l110jbJwwK1aANMNkDajmtXJrEL1hSMKMj+hBrq5eh/qErekP5YCiNFhPpFkGlm5hoDrkvkNqfLK19HrMgcflsBW1veFYMwp8EJ2vOPJi+RhC7DtxBG98Ynw0DCmkXzN10EI+6dXAtjb090qmr0Vw7TgZMZz60H6vSxrumCt9lfqy44RxgMqWGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fPBcDDAZLmmt5F/4O508m7jXJoOUs2y2gqctvwXznU=;
 b=cibf85EMveQBaRpTRIH2vCiqoUhSGG4MFNQurOou6jqSu1D/Mh8DovOE8U7taHj5AoypabDEXAG6M0fVQAZIfX7/jrlBfHEKQL21BzFh4Hv3RZCuHqSKYYJfbaEYvSXg7D8ZUrCXoEURBqLBH0gE3a3QBaVHjFVdeCfAkSFF7OXnDv5vnleQM5QTjp9/GAQYY1thV8cI2Lm6DTb9Uc5CI/gKqXo9YsE5JBO9MbZ9oOa5x/SjqqlXtXHzUu6X8UbJJfLgLq91zGNAZxJsAoYK3atsuIk/WUDb/UuthOE9I9qnySYF0yhcJZJ8Fjijqce9IvGcXRQKdfiX+hjZ71b48g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fPBcDDAZLmmt5F/4O508m7jXJoOUs2y2gqctvwXznU=;
 b=LFI6zdDDHKBp1KjR5xwNhkuRKabUArEMb8nMBnBEcrjxKoC67mX55eAxaRJSZnm4Xud3m+iPlswkXR2tAVZ8hUxlZ30yX2y01SGJ+qfMSXeJsDg6MLJUYyJb93VChc/NevSdWSktmplZztAbX0mCfEl6MQd2M+3nb7j6yuePlm0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AM9PR04MB8570.eurprd04.prod.outlook.com (2603:10a6:20b:435::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 05:37:58 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 05:37:58 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, xu.yang_2@nxp.com, jun.li@nxp.com
Subject: [PATCH 1/2] dt-bindings: usb: usb-nop-xceiv: add wakeup-source property
Date:   Mon, 24 Oct 2022 13:17:27 +0800
Message-Id: <1666588648-1047-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:4:91::23) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9640:EE_|AM9PR04MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d569f5-2258-41d8-f509-08dab581e82e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NvtGL+h8/miG06gQWIhj047dvWCMLCGgGeLxOrxEENEbrt+eb+/q5ErTxq559LG7SQ19IzCJdXL3fSs4fsge3gaJNPq9NxljRpxk18RPLApaTBv5WsFZDusv8ViIO+4oWqYtq9WP+vArtQ2SP76xR43XRXb9e9zEU9bUxw5fAWqZ+tqdNzCzGOGbS2FFjpQbADfsnMZAgQgM5toJOrrTK4rndra+JMcClKB+ogL/+cGJY/Aj/TWUv/PR0lYW3KggZOLb1zJM1f3e7HXz5hPR4A6P1JzjW1huMNwG6P8oWR0uTE5aI1zwAyVEI4bmCniWaDj10hx6r4R89saFWuRBEWCdVjkXLPXZL9gVSKzFrd0oFsyOhW9+bA+3yuoL+biCJDWUzNKMWQMCq6rcUfhXmgK8I9w4lZ3HgrPgaBWYyDehPeX9l/4ohvF++CaWO3Cqxw76o+whAHFDmtFybyr3HlAYoZTW8f/0zOm1LVZ1/xP8MKm5EYxxzvBrWHw3KVvb26DKsjHn2WcIFlRj4x8GHmgjaRqANYWCSzRWq2NBi9la4KuMeN4sVt99nAKsMlVZRqZb6e+YCEI+bmX9S0f8IwGYrDvRLLrwOumXOES1ttaF6hxa6EpPkJyp1sgvZNCpG5Efeo4k3mtndSk+ZRtzWjxrGkBNf0DYszJCoJiMcR2bpH/qu5IfCJF0lKSvtCtlKcziyxT6tTI4lNgTVKxIsIec2c5FYp2FbMNP/Ily455Ies3dj7Oo0FepdXKsrURpz8Gu2hSvhL1z8GLJCAEz8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199015)(66476007)(66946007)(66556008)(6506007)(6666004)(4326008)(8676002)(8936002)(36756003)(41300700001)(26005)(52116002)(5660300002)(6512007)(316002)(86362001)(38350700002)(38100700002)(4744005)(186003)(2616005)(2906002)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NkdOzDb6y39EyuvYqwKEbE1X3MGV0nQesdehvVVAb56r/hLxVycKGIQh2llR?=
 =?us-ascii?Q?mTzg8X9hHjVS82+FHYvRgoIjJjQih+VCWOecevFXkuTCikGZyOPDKPrUIaE3?=
 =?us-ascii?Q?tE5VrW3SnqSibbvwNOLBt/qG62P6+gGvsoWG/HyneP6P2kw/A1ogznvpoUVu?=
 =?us-ascii?Q?1u5IayrurQMT1lG9sQUwu2KYuicsNPaQ93Cr+DNB591XBFRvmEsO0CalCwJw?=
 =?us-ascii?Q?Qk3Svr5ku0avUPK0aTmbL0vXG0E1He4ZTyq6TgUqsODvtLPU0N5L0uRJW6Gl?=
 =?us-ascii?Q?TFbK064PFZi45+ut+a0/Rcki+b7hfQSAYUu/8uAqXPZUDlWq/+EwSJ+85XJV?=
 =?us-ascii?Q?rfFLcs6eb210sQtyKN+GhXhgsRfPw1k/3pA9wZSwdWUdX9I2U0QNVVRkKOBh?=
 =?us-ascii?Q?GLzeguB76Ir54c7C/rk8HdVWfa3KeB9kIAH6FERqD1Nm9J29Bv/ntFVCaF3b?=
 =?us-ascii?Q?CAwjaLASYeHcmymZAScJuGgW91brnqrzn49yAwybLpRnQAzN8FHHBs7+b+RG?=
 =?us-ascii?Q?DjkKc47/Axxe/dJPeplOH/oy9HrTEpw9/GfphMZo4qxWmJ+dP6bwVk8jkG11?=
 =?us-ascii?Q?p7p6Z/R5pRr32QtS+Mww2US+PBuTvPhitvuGGU35YrttfaYc6a/lpoxow8M0?=
 =?us-ascii?Q?bJHT0sxxT4nCgofsrB6X1dMZ2ZmHw0sGzsGITfeyKD9gsmJGl2JJX9YWWhJv?=
 =?us-ascii?Q?OiG76vzSqQlATA9auEiuMPmfkt0KvIXeHW5w2At9u4PjHyF/h4Mklu7HIcmn?=
 =?us-ascii?Q?O5aDZ9x6kN6u8ISLiPz9+RhZ51mOXHsgTp+tODFhQcnOTiRY3DrzdMTX5Dx1?=
 =?us-ascii?Q?H7pn4UWhKg04lVS4MrnT9Bi7D1Ydd65VS461fqcPlxXwwP0zKgxTK0bHMtMU?=
 =?us-ascii?Q?udzHeIwHku0gpO5u04K5ciXn0oZTLFRPJsrnPqTdoCKeEVJCbl/hl8R0Uv7+?=
 =?us-ascii?Q?xQIboMOLulCAdE6+vRvNoDkUszhL6vsukf+R/K6tRauA4wUGVS2zZeBpmO9n?=
 =?us-ascii?Q?w6pfC7QsJQNJwA1tXm9kncASBQN0pxa01yV3+5+ihKAio06YmUYTL2zBT9Hh?=
 =?us-ascii?Q?WJmEGnvrQv0qvwxdnRaSSDVgzCzF7benK1oV1NHdRq3wtIY1dY0eIogcledg?=
 =?us-ascii?Q?Wdud4gS7FMqWK7RSZIaj2IwQPaTecob/dnKAm7plvkVRdGxpnfNn8NYrQW/q?=
 =?us-ascii?Q?x+deY7KxJXpvfk6QWqb1vm5A515GE/Z5Nz3eA1Sw/q8xlgVEzRCrVe2Z2faP?=
 =?us-ascii?Q?tJrx2zjyTk1AV7LMZMxGwBedhVUHzWR+7TnUL3OCBeMmn7rDs55ounMz0TOM?=
 =?us-ascii?Q?cE7BMgGMvByRdM4zR33MreCIU6Pf7kDo//Q0tPyQTYY3ksLYXG5q5VzXSWIS?=
 =?us-ascii?Q?yfRCyEbg+8YlfHgv6ne0UDciobSMiQoACllJHBX9WYVSGng9jSMCtNb5rqvd?=
 =?us-ascii?Q?wCSspmBUz/LNTvpoPx/jNHifS9zsDSU92toWOO0gAJQu0CZcsUNnIvOzL2JC?=
 =?us-ascii?Q?ubXuqNsXcKR5VU21P8KKvw+/yW5QmJzA6r7Ux3SD7KHBkupz6JnT6WuWeUaO?=
 =?us-ascii?Q?mvVgSaOnjeRbi2fbo0HMyTaaqB6r3PN58XUWEp5U?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d569f5-2258-41d8-f509-08dab581e82e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 05:37:58.0284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ulc3pkpZNdmGn2+8FDgIoAue27/f9dzZvvN+OA/4XTUELXN9xqRPrmAJsFgA4Yy4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8570
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb phy may be part of wakeup source, so add wakeup source property
to keep its resource(e.g power domain) active to make usb remote
wakeup work.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 Documentation/devicetree/bindings/usb/usb-nop-xceiv.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-nop-xceiv.yaml b/Documentation/devicetree/bindings/usb/usb-nop-xceiv.yaml
index 2824c17285ee..7b71e32d1df0 100644
--- a/Documentation/devicetree/bindings/usb/usb-nop-xceiv.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-nop-xceiv.yaml
@@ -39,6 +39,11 @@ properties:
       the VBus line.
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  wakeup-source:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Specify if it's USB remote wakeup capable.
+
 required:
   - compatible
   - '#phy-cells'
-- 
2.34.1

