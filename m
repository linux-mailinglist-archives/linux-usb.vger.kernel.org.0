Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B409706291
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 10:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjEQIQS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 04:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjEQIQQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 04:16:16 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2068.outbound.protection.outlook.com [40.107.241.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363661BE7
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 01:16:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WU+KNMERrUH9dblr8BnscV4gf3anqqXwWk0DgQfS3x95JmoJMl8ybHacwYILfhWpLt8g9Qqix/JDXBan1ta80OB6wF78v2I3n9T/Vio1MPE8oylkXoTkgWIInb/ku9XJqW3BQeA2gbsSsCHFW/4yZl6MPbRBtvXTQbMnCcNbVHqfn9tUdvGrw1uhDOFp6YF06gQzGfbqqNyANyH3RJFKpbb89bKOKZoiyAH/4RHGrFo0ni7J9v9SBei+aadFYmZNcvxwMUkMqWsaRUoUvKXIPJitnzxpYezLvoCwd0L9s66gQL1HaWLvhYOiT9dfN81X66LnIDc7U6eeBvL1HEDK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Qwv1shscJMPJyAoK5jMYOpTvICx3zKvhPBm4MLF3D4=;
 b=Xy9gpxjYbfg84lw6UPj1kilDDGYdXepKm6lVa2tvUSlb2AOxjlgu5WafqiaIiOBoTAGcDBTlsvqQtHftZjQS9QexMG49kjzkw5Al2/pHQigGgRQDgPOvDbTC0JA7ag2EAEZFRSDPifGTF78CYbm7zN8FrBA0rFYZ76T6Qz8QHyZ8nxlBQwkL4O29ClLec8k3lUeeKmMQ5HN5OofFFIsyfE4wXThJZui+FQXRfKuZ6nDWdSibpnkRcf3fzVG96SRxOE/4AbhHfCXW90Ure5AkekaFjXJeJoXjanMu8gSkeKZ74NmIlYjGLa6sWPpJcaqKICYw6NZf7Hg/EZsGBl+ogQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Qwv1shscJMPJyAoK5jMYOpTvICx3zKvhPBm4MLF3D4=;
 b=nsw6R4vuaet0TQkw20SH/qBlptnQQ+aUuXVikukUR6XKk/H8Qk7H712sCIx2KpCT6EMse5pIeY1VR8ifIHfqiWJe0UqD9Z0mSMImfYL+8wnvbZ0GeZXAKhGhJ5h20TD3Ssq+6QnoXp/XYCalYufdxUuAneuvsAPELidjkHaMmpU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DB9PR04MB8446.eurprd04.prod.outlook.com (2603:10a6:10:2ce::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.25; Wed, 17 May 2023 08:16:11 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%6]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 08:16:11 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH 1/3] usb: chipidea: imx: remove one duplicated reg define
Date:   Wed, 17 May 2023 16:19:05 +0800
Message-Id: <20230517081907.3410465-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DB9PR04MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: b082da44-3b85-4469-9e93-08db56aef973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QMZyUEiXNzk88Mu6oMK8jApc+ktJMV4x8NmRXwNyAt+hiVdMKyFUflz5U1cQbZNLOUVMnqsiIIDYdATZj6dys5K3X9tJDas1R8+e8mlEj5weTPNUsWL/3aUstnMVY0D+V0LDpoYLOcXL6uafO2TQGhGkl7HqOW1iUF6rlI8PLqkDZNw/Pn6jSGVPutjfWd0Zw2LFtMosb9/mig1NlK469pQ/wJeJklan1XEkdK62xXQaGNBuuGqbHUGydC9ptmrsynFTB5q9qwxLcb8JaXCYPGlj6SBofgFEeCZQlxcipjIdQy3GXi5wD7seUOuad8W2PyxRtf5fAkvohJG5UqqLe7DUs3nqA2jSnq/beF16T4AaorooC2Ef+H2gFEVrY1JqFhoL9T4mk4vwlPmPiPmjZgD5Xs/7UsgmoT3NWCexLfZTZpD1WkIUG976p4h3Mq3a9OXVuJBtzCh4vXgTxaZ02pV0uvzsSkkUgw4swVmLe4/mfknzUJMFjwIMBdHpZDC0imsB3hl0uiBfmfNUmJ5qAwDV9GvznFr54YWn/nc/KCyCqA+XLyo+qXLd4nbntA/QW7wBGBum5RhyNZKAEFOW+uxP1b6GcSoPWHCnQwR9TJMNoIpA8a1v7Sp0eryEvHCw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199021)(6506007)(186003)(6512007)(1076003)(41300700001)(26005)(6486002)(52116002)(6666004)(2616005)(83380400001)(478600001)(66946007)(66556008)(4326008)(66476007)(6916009)(38350700002)(4744005)(8676002)(86362001)(316002)(8936002)(36756003)(5660300002)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3K3OGswLel6uxkq/uDHTzRt3/N1NNTTKwQsVCcWpO+c7w4a2FMPvxajzKLuW?=
 =?us-ascii?Q?zVzaen7Ej1ECoa5wbo3H4pguFgeuEB8Jm5+8NNijK6aqUnZCv19zqnRyrIS5?=
 =?us-ascii?Q?mEw5+AORXH8W6p3YUCInl5OPffN3+/cgs3l0uc5GaqF1cZxSqX4wXwNPnyC2?=
 =?us-ascii?Q?D045YPv4vM01iD38TA3BwZ3qpJ3IcOtNUdHChywHtaQvYW10oF3T2OmlAR4N?=
 =?us-ascii?Q?lCTVRgKS+6jn8ep1XpSmVUtHzJICvu+4mZTv3Rzxu+chS+IZfw6/Nn4+rF2R?=
 =?us-ascii?Q?5QctpGTeG5Jo+Z4GIIYeeGrh5Kkdd8wFQGTEGX/sf1+tJQ4e7CW7YTkryRF5?=
 =?us-ascii?Q?OD9nHDRm6jZXlQ3A6Sx5bCOUoSt/t9vgbWAOMT3rm+shbi/Kkg1w9PZzG/Ii?=
 =?us-ascii?Q?tbl7z5Z3mCtNFXVlLqiqa4v0jGscAivL4XvGSjw8VorXNO5Yhy2FkaL11+lv?=
 =?us-ascii?Q?HbkGNqLRAns7tL1bYzGhB/vjdIrw7BU6YnaOuy8mrIPKguFXCvf0AixuK+lt?=
 =?us-ascii?Q?+SC4ggtONN4Zzic13T6VBOHq4S9PVmdFqHZUMFii0/wZi6sz6d/0s61wI5Jc?=
 =?us-ascii?Q?3GWPVLws8jobry7n5U+S71291aU83e8QqflAMYhlSU66ybz/hxv68D2XbKv5?=
 =?us-ascii?Q?kJwOi7qdvYWgpHOH9NDTl6vOCyQXdUCgalK5A+kUPdu4385XHOGLBnqVTJqg?=
 =?us-ascii?Q?GhVkhXwxMhWwPYQlBHyR7/p7Bxpls//1psHOzqtLqYP2DieTFy7Jc6faqF26?=
 =?us-ascii?Q?LUMA0S6Kvv/Ihd70pVxz+DTLye0WJ/h/Wfi0WlGg6X6dSQl1qxmnL/OZxJjU?=
 =?us-ascii?Q?YGILhZh3myCrLNUufcoo2EcMOhuz7H3h1XXX5d+EsmDUMm9vmyjchMhc19KV?=
 =?us-ascii?Q?z1YZGOYny5SAqshjbm2XWAFP3qRdEMOuCN1rckjAav6zZSk/ppjsfMt3zuEn?=
 =?us-ascii?Q?vzas9yNCMXoxscXmceRFA3krCahsGRajqq1kXxM9CAGgndwN39mB2jilu/UG?=
 =?us-ascii?Q?cEZlg+MhZnshpH1cclI4/GpgtFxu1AWBe9s/YsFp70oOHj8oZ8CwZNQBQ5F/?=
 =?us-ascii?Q?VtOpDXiJupJF5SdKAaumbXpzYqgDgbo971bY+KgxCU+T0PHv5Cwh3BvqmUJg?=
 =?us-ascii?Q?mnR5ZlbXn2YpQmR7Ut8mP8EWI1Oy+/waCdnr7WcpAtH7bu+uEmFz6VnDdpm3?=
 =?us-ascii?Q?EChu6mTiL35v1gyznBGrfHJf7FziQMUlWnU6X4ah2Ri4kOLjDn7rRkTxASpw?=
 =?us-ascii?Q?4AVRrT1Cy4qUjUKGjFrpNjFBO0jeCXadrLZK7R15JTDq3XbJNWFQ/C/bSUpU?=
 =?us-ascii?Q?pTidemd+yqmsqJN89dC2hoQiA7IyG/LH9j497J2Lgmt2PpxujahcWBbkXRC4?=
 =?us-ascii?Q?wiGg698fHIUusVYXeZ/czFeDqWWuOBoXVHTZQRXSXtb8TpOE1lag9ROgUaIT?=
 =?us-ascii?Q?TwCM696r5wHfBj1ToKGZQWsusUx34fNZXjOnl7DmZXQILnPV0m0ybiZ/PqLL?=
 =?us-ascii?Q?HUzMuakM/hz40h1uSq7UeyJpCtgBFEfarECvz3QY0SYTbEZmyIeH8WkbP5iT?=
 =?us-ascii?Q?if7LgZaN+hYZ9drI/3LXqtvqm0y1mf1SvKXPzjbD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b082da44-3b85-4469-9e93-08db56aef973
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 08:16:11.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RY1KMCN24LGqBGsAbBTmxkLKyka9QsbvPGbAXFoo4fn+0gH9MonynmIRaL62/PRDy9A0mcp7DUGtkeVPKFbfxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8446
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove one duplicated definition of MX7D_USB_OTG_PHY_CFG1.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/usbmisc_imx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index c57c1a71a513..be939e77719d 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -113,7 +113,6 @@
 #define MX7D_USBNC_USB_CTRL2_DP_DM_MASK			(BIT(12) | BIT(13) | \
 							BIT(14) | BIT(15))
 
-#define MX7D_USB_OTG_PHY_CFG1		0x30
 #define MX7D_USB_OTG_PHY_CFG2_CHRG_CHRGSEL	BIT(0)
 #define MX7D_USB_OTG_PHY_CFG2_CHRG_VDATDETENB0	BIT(1)
 #define MX7D_USB_OTG_PHY_CFG2_CHRG_VDATSRCENB0	BIT(2)
-- 
2.34.1

