Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81152715C09
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 12:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbjE3Kmd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 06:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbjE3Km2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 06:42:28 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2045.outbound.protection.outlook.com [40.107.8.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608388F;
        Tue, 30 May 2023 03:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqxgLM5gkW+nwzcdUPTie+uGbPP2Z3/ShxNJ2PyyXrCWE9FfLMzLfxKax/odxlflPJDeU/q7maClrrmi9DQFVLyVo4ched7p/Hx8iAmEiRttge4D1WPjuiiAYeTdH2cbsaifQypLWD15k840nQQU/QgpY1tiNjtzrs7Tj5x+NEC03wUZ+Yv4O3FN29UvrwLHo5dIO7j39uDLZ08wvYxYyw/4hcfJxdh5rX2XRI0QXv9b3lMLy1qJP8dy0La0I/CHnvw1Bi7VBmXGmDsZSgWqgs72k8P6CyWSUz7t12/8o71H6JJu3ePr2O83DHWtvLXT2H/8p2DwP9H2noK4njaG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVs/xAaC1WTrOMUWRykFj2T4oGVe96rOJJ4LuBWGGnI=;
 b=QFrkbX/BxzVclOCR1uCH11ucE3IvVP/Bma2gha7MxXd1c9tdUk57kCIUmi6Ldw9VQPjgOPewV6VxcijqhnVUyA59fo5spssHLK9+dIDRRBUI0F0LgtVpnsH2R08V5CB4sqIqi7R1es5uHI7M4Nw00dqQ4ZildIU+ZUOKM293Fur7TjNT1dwJL8MSthnSZ/TXVsEFwLmGGsHML0frgsY9F0h46iZl9Fp+eWbjWv+tiAsFrE+1q4hMoYrA2Qdr2URyJBSW1Mry2M8t9/zeSgE7FOBlibE0FZj+pOkOvxs4tRZKv5dAjBEMinUAvUsb8NX4mdYDdxwmm2ytdGwvXOxKNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVs/xAaC1WTrOMUWRykFj2T4oGVe96rOJJ4LuBWGGnI=;
 b=BQfJSiKTPYUcK/5lAGdSHCiP+XsfhrzR+IAMz5Hl23ADM8nNkp4R7UH2TFigaomv9MmpcgCdDI4BJx99gkc42XoBH+nz5OoCSTbwXm8PGV/3yukIDYqWERNBZrp2SCK3jMiTHavlI0urfl6JFfWOEjI81j8YdECiN6ab+88ZsR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS5PR04MB9970.eurprd04.prod.outlook.com (2603:10a6:20b:67e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 10:42:22 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 10:42:22 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, robh+dt@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com,
        devicetree@vger.kernel.org, peng.fan@nxp.com
Subject: [PATCH 1/2] dt-bindings: usb: ci-hdrc-usb2: add fsl,imx8ulp-usb compatible
Date:   Tue, 30 May 2023 18:40:06 +0800
Message-Id: <20230530104007.1294702-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0165.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::21) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AS5PR04MB9970:EE_
X-MS-Office365-Filtering-Correlation-Id: c23f2dc3-4821-4196-e4fd-08db60fa8ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D0iUIbMJfPUaDRxBfQd33F9qgd1xtych6IO3hjx7yUVVAaX7AIStzODdwrEPcVCZ/BXgh6H915/bJaiYgz+VoKfGWPIToW7RI+ABcUpWBnd+xI40TyXCQWE/dH1iqPKVY5PnYIgXg70OF4DaLsPAJFkY1zf5gPsd8VCDeCqxs+ZhY3ivWZhWQuPMcI8h4jsilHOprVeHXo7td9revgEmk+t+jJXVRKWaIT5Vlic7PEO+Y78aRsUTJL1wo+GHbUhQYE3bSB/hCfAfmEg49b+KQf/ELiVlosgs9q87u+zJDPNKERxOsCMarDqt6WpNw2aEBdC8JoZUvh/+UA2Q9ZSuk5F6piqHLfjcPuCn4sR6JX1BMhUMhNXycp4Gp0/Ap2yuLLLZZIOGvMqiSdQlTdvjeiJ1W4e2Ee+kTSOXQ/HcpZuwF0FBov9XX55nbLWy/FJY2BufjwDW1UiRqFBXHkspD/q/POFXT9xCYtLQkQxNrpuo0BS8iNoCpoHKusOkylYz8MehDE3YoCfE5c38EjeNNvoOipWptYf1vAyGiMPtpS3yGrJTK/PCkuEDs+2IihcloCT6oLpemVIQd/YTpRo9rcrXYGlxycpv4nSuGl9RaAAB8Avry9NH8r8K7RLcU/2/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199021)(1076003)(186003)(6506007)(26005)(52116002)(6486002)(6512007)(316002)(4744005)(6666004)(2906002)(5660300002)(36756003)(41300700001)(8936002)(8676002)(478600001)(38350700002)(38100700002)(4326008)(86362001)(66946007)(2616005)(66476007)(66556008)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IecpX2ThlsnxpL926L2VVUAplzep1JphpGCtLhEHaND7UL0ZuvDG0J2mUtuS?=
 =?us-ascii?Q?9KWC4sq/FeuTwT1rNpj8CnbdB256Sngmz+NWRoIjP089OgkfbXNkbYPGzJMb?=
 =?us-ascii?Q?0MolV/f2Ev+FXe0Vac3bxKWDfQXAn/Hn4jP/SK1cbSjXXQEmTs56Xuev+yb7?=
 =?us-ascii?Q?aEKfbQqyqoAKEJym/FY/yOavAWAiWekZI/uKP8zhnXoNRVpVB/c0PX2lkkPK?=
 =?us-ascii?Q?9SnHQH4rODirVqLcPXZtwexKbYEmysD9xolkJJzK8E0KdjFvEr90jbC0goOZ?=
 =?us-ascii?Q?dn0t4uNAvhTx2QQoVWOD0PotxCM1oyDfnwbqVo4Iei5eQA2e82d5yQaSMaBQ?=
 =?us-ascii?Q?Nmi4HhjJbcQrxn6/A5gFo+lhpCfhpwkvsuik5Lrc0x3hBstq9hVUNU0pEa/7?=
 =?us-ascii?Q?YAvycd/keUJS8qknD4TxsnHHBBgRSYYo5FQw6zpA1I9dwzrjXO4QpSqggpH/?=
 =?us-ascii?Q?Uw2PvMPiVoK80FP86UtftDj4AMz+vC+eV0kxV94Lqr9hW1PklTJuOiwl61a1?=
 =?us-ascii?Q?osxE9ckRSWRCFgD0vL0/MmSlRhiDY0gJdcrlYei7RvT4zG2L7YU8zFUesX4/?=
 =?us-ascii?Q?Nh4Kgh5O3fTD3mAyp7wdVKfw7rRz+cUeHjjgJizqzxz58qCLKiDncp8uiKrA?=
 =?us-ascii?Q?R2NjtK/JEqO3THhEePpd1Yc/PiSOabG+7EBxtIn3RWn4zhofIfvQPN67PXK5?=
 =?us-ascii?Q?FA7ZzqPdEqxpNvsgCDoLePWuB+GV8FJ3lLIgH671GYdJgpWQ/ekakzEiDhIp?=
 =?us-ascii?Q?Iz1gqDh7DBJmobBhicxsq4jSK6HA/J82uew+AkN1ZHpGYq2GmLiG6pehQpaL?=
 =?us-ascii?Q?QHtbkSB9PF+4F//2jQWUSPqzjqylSsUIvZ+yXfyoxvwG3IIJ2YYwtfzAAwJm?=
 =?us-ascii?Q?gOxZs9qf8xQKoVyeKiam1VHYYdax1umIbs0mCx11ejce/A0fZvW9+ZVZGQF7?=
 =?us-ascii?Q?uFEL/NPC6o78xOcFizRS38ElRKRtfVJ56t7sp0vgHvXflsPBjfT+0kc50+jn?=
 =?us-ascii?Q?vqfieDK5+cQAzz8jNnBSYmaDAbgl+5CO1T2RQiG+sAu+xDhEGK2stsOLNTwI?=
 =?us-ascii?Q?MNrZaXaAiMVHT4V7cY29teDEa5yxZUfQMgntVnG3QW2B22lOGIrGwOcGVXF7?=
 =?us-ascii?Q?HA+TEveyN5Is6aE0qck35LSqRQUdH7MpAOBzKG7zyc63YHvmxD8vRsjgRD8x?=
 =?us-ascii?Q?ysKoA7VgKBROneuFQ58WNnB4d1H3E6CQ+/YkWX4Lt21rAslX7stXt7l08w+A?=
 =?us-ascii?Q?0783oO/PVsc0Z8po0XGxSOz3DrD4cpSQsro3hss956B5L1d2ZIO6uSLiYeaf?=
 =?us-ascii?Q?c1PbMiLU7SPek6bWt18Ei/8OAZktxDnprrRJQxJjmET5id/tu3WSceLKAc99?=
 =?us-ascii?Q?GtrY3MjPPm7DpJlbmlwHjOre5t8MKuzGh7iF3KCN9G8+fGmv64CMfIEIpEYz?=
 =?us-ascii?Q?LhLX/xNccXS8OxNX+EiYkTqnabv046lu+XhF/an3+6mOINveIossfJrnOw05?=
 =?us-ascii?Q?0rOOYMSV7E9YbfPwmE4uSkBbfj/aWnULtjqM1IWUzddkEyp6oDOgZjdNxrGk?=
 =?us-ascii?Q?+QHwMId5+GuCwBDTramCxV2Mfa6nfrz/EaPI1fgT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c23f2dc3-4821-4196-e4fd-08db60fa8ca1
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 10:42:22.4850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcjM4nwOm6S5rDNa/cz+FIRr8cvXIWtmEFJY8lwUtvswGOnPdCmUlX85m68Ngy8Ak+SBuBX1fS2xf3iz+BCFaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9970
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The imx8ulp and imx8dxl are compatible. This will add fsl,imx8ulp-usb
to the compatible property.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index b26d26c2b023..782402800d4a 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -45,7 +45,9 @@ properties:
               - fsl,vf610-usb
           - const: fsl,imx27-usb
       - items:
-          - const: fsl,imx8dxl-usb
+          - enum:
+              - fsl,imx8dxl-usb
+              - fsl,imx8ulp-usb
           - const: fsl,imx7ulp-usb
           - const: fsl,imx6ul-usb
       - items:
-- 
2.34.1

