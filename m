Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82693706293
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 10:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjEQIQV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 04:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjEQIQT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 04:16:19 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2068.outbound.protection.outlook.com [40.107.241.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D4510D4
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 01:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoXLCTR3tLzpiYKKELPsdB3a3G7C9OageiCJ4Hj0PLwDeAXZJTIaYd6xZXi2dmW9D16Hcdbv7urGxlw48ps9Or9MF2TPUYPIP8k/AIMOTPAIQcbeChXvVZT5pETVJcct5JQzW+c6PMy9IKzYuA0C6otLXedJR4uP1JAWG1UOw9o138qNLLvulhLw+eGtXH6C/MfZICUE2eNk5VhMKoKAByJUAMF5CGBd4AQ0wWpW9re7bMqNUnSYfJxphwSP/uxI8JfyYzLes80qibsddB2H5btY4zZKL57Xx5pWbppHb52jICxLz2Us0nGBRi+mNW79evUV3yEf5SflrPdNZMseRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rc9YhNOfRMJ7yKzt3bml+0dO23RrSJAyJLbkuOoabuY=;
 b=k20QvlnACVcRssI72aQSOlt9DYGK2K5DLkOgP7I0YSXbjORySTR0PNYSRgYCovur6mlR13LTZdtpL2roWre27G0is/mn3re/Goo6dovcntXDCqKy6LV5VWfxHunSdQquD2p0+SMBX1gEVgQSQW5TZrVRgXDOVOKQjJRKbSG3CTxP7hJ/m2+VNKNdloM32VcKaUf6SCvigppLFGXWhHMA04gB7WuFmMfAcLKLqvubEWvecMGxdOHqLLeemtblNMdM1fQ0Np05zX/g9VkH0pqrNVU0DwxfdNuHFAplWMeFTOwb0dG7O60EVvu1J0t3pJ0DJ2XruH/JdZG9zhJmlyKhag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rc9YhNOfRMJ7yKzt3bml+0dO23RrSJAyJLbkuOoabuY=;
 b=L8SZAVUHkfFM6SSV4MVCNwGkeOHbxaRfeWQlKl6ek66+IyAdECxZf2az0Vz6FAW8rEF9NkmgXSpZs8LU9KaNs2PggOg32t9Dwl0TvE/chPuNuCXXWJbF5oY6/UuWx1ZNEB5QOYY8jytcnCcbWLrHjfrk9+iykuoAvS3ckBHkuhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DB9PR04MB8446.eurprd04.prod.outlook.com (2603:10a6:10:2ce::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.25; Wed, 17 May 2023 08:16:16 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%6]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 08:16:16 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH 3/3] usb: chipidea: imx: add missing USB PHY DPDM wakeup setting
Date:   Wed, 17 May 2023 16:19:07 +0800
Message-Id: <20230517081907.3410465-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517081907.3410465-1-xu.yang_2@nxp.com>
References: <20230517081907.3410465-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DB9PR04MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: a960a9d4-8119-47d6-59bc-08db56aefc67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y+G2x2PiJGEkHh3aXj3Zi5Z3JZ39n2z0cxeQt316CrdE4045Uk2j8R+i00G/7HVmbt5yxWmUAwLKC0701QjNi8/PLyWiaGU5QKdrS6OGTfY3Ka0pJXQJrURWGvAV+aowVpIqdQz5Ju8ufTbi+dee+bl1GyBVCIFO/YJ6G8p/ffCSKoTtBjK/f4LNslQCmeL8DDifd/kgF992MLZjR9nO5DtfWTy7daPk4sn5rQel0KyijJheEoL6LEIHLLAIB33EFb9Qz7t6JLicFOopkNrO05VznGLaOnWPJOD565Z/dzDKGFsS3FFbSexdSbwKa+wK+rcUccC0aEHcqr0p2enMaE25nzJVP4GAu0KmTUjtZHancmABfQQEBeaMPU0KC7XH+5MOca26JZjCiXOq8EkqancMoShFaN5uL0hJlphRj5tiwKZzviRnmwTipjGF2weO8D5SgCgm1y56bhYNXAh26nWB37lZUfyWnwea4gXX5rh2cDgYH2oxeKkzhkMs6Dzq/NndH+FkVpUwwncBqHrLXZcKDcasIWo2iA9JMDb5BhH/vdFVQMpt1+nhYPWPcpgoZJG/xVNOWaOFXZMGw1uIzJ/zZoJcez/hyRKYYMCnePwqiP+cEA294eHnAa+IJ4tH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199021)(6506007)(186003)(6512007)(1076003)(41300700001)(26005)(6486002)(52116002)(6666004)(2616005)(83380400001)(478600001)(66946007)(66556008)(4326008)(66476007)(6916009)(38350700002)(4744005)(8676002)(86362001)(316002)(8936002)(36756003)(5660300002)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QsROtVuXmSAZA7GYxDwVWJz3qAFY841CmDVAgNQ3O6ZWYJ+J90+2yZCfEJaZ?=
 =?us-ascii?Q?QSNc63ySHjLprdVuVf3bZIUR3ZCcasbdOmBC9m8CXyd8cACp/nKAUocw6SQo?=
 =?us-ascii?Q?xnDbWdMwhfDYTRNpmvRimuSGYmq9IngEu/6fNafYQ0LEK/LpFffEls4LDEKS?=
 =?us-ascii?Q?F9CUcXpUv7PCwLGi8x5EsX8V2iVy0EpWNvk4jFB/8/uDsU4axJNPzidss2l+?=
 =?us-ascii?Q?wD5dFW8KRKldernVONeNw99/HZX7Nn7YEQllNcuVepjfV2cNHWd8fu/rE8Qm?=
 =?us-ascii?Q?EJ+UHccPWBq7+LXnx7R2EPJDPRp95v3Zib30xy5uy53VzOq55rQkzzo7gFZd?=
 =?us-ascii?Q?9paCiVvFqbhUxdb3D99wUfIsOSXv0qVQhNvUkp3HYJ4npzGhzTQ7FBxCmMKN?=
 =?us-ascii?Q?xcq9lJ2QhdGdwz79St2wsld3DvbJTWlxTPR9dqNHp9UG1zhh6KvfR9mgkpSt?=
 =?us-ascii?Q?g/fJ1D1Xt74DaSPP9GU53p8vymx8lA0t3mKokKXmfjw1rtCANFxhNkATOnR+?=
 =?us-ascii?Q?8YgrDiblktS8i7dnoi4ZODABz58gDLF5ex7TQPsoGaLP2zaUHTBU23UcZTQg?=
 =?us-ascii?Q?SOhcfIT9UjGOQTdGWg7GXZi5R9m5vJc2r1z2JwP8i/H32hg8lJOauq2LBo6J?=
 =?us-ascii?Q?BC+5aeu/9Fg/q1pQJ55M7sp1GzOKzduIsG3OTXNR0JK3PRzn6wAc91REojuG?=
 =?us-ascii?Q?ftYJKzms64cu+HZpDgbiPCxH37WWDPYWwaWNRvF0dvHKHpkqFoeEhrlFilKp?=
 =?us-ascii?Q?satFw0hL0hmsFJqi+aDrr4YQ2Jm3UsfBkusnehtxTdQpTrEciqtVPysHtCff?=
 =?us-ascii?Q?RtAssHUWMclUpUtXX/eIAa/puMR7Cx6dyn280V+FdERfdgI7s241XhCfSh30?=
 =?us-ascii?Q?fuyRcZipo43lmeoJs4pV1BhAoVypMpY8SkOTb9VKobZHEQgH2uNcO4LWg8vM?=
 =?us-ascii?Q?1U+8G3oHQatiyvSM6G6YLtcIzait0Qfj4sCbASSk3+c+gB5GlIPaHb4aNV20?=
 =?us-ascii?Q?7VFBm2MrIOrSZ0BcFJT2VLJLUE/D3/s+3CQVCiahQfETVgI4nnhY3aY9EWIK?=
 =?us-ascii?Q?3Y4H8+/5kbTa1/mvyLp5D0hoJeAn4O4OfoRmasQ8G4vUZgeAIAiEETezbxdz?=
 =?us-ascii?Q?3GLOD63GQA/b/SgnmseKTRaDBiRCfEUDJQuki83hllbXjnPa+OlkfKcY08Jq?=
 =?us-ascii?Q?OY5tfbm4K3xU6Z7ZBf2+X6US0PFhZStP5TAE5Lj+eO8Dy2ROp4n2n6RMf5g/?=
 =?us-ascii?Q?KAHNTb6K92ubMfFOJAOx3QOKCx/uUcmucLrX3mb/IHS5nGqgK6/Ep0PhRSAN?=
 =?us-ascii?Q?7SqNy8n/B9CPV9QngwX9+AU35LMLhV3DtaSYG4VR+Y8a8LkR33GEpWIPUEHA?=
 =?us-ascii?Q?nkuffA+2LA5TpDUtL7pUwLT3DKtnQa7/LBVR48FggX6qhzKyLKjVdPoTsBp9?=
 =?us-ascii?Q?AF8SrGsWMJn8xgsTHSQnS38mKiQt7dmrtZjzdLpC709hQrmZyD1Wp2Y9zWsP?=
 =?us-ascii?Q?sWw5bhCJVg6IAsKfPqAJM8rc2HjgtfxSaDGNEWZu3rVEcLB+7fgk4tNHHl2t?=
 =?us-ascii?Q?X5K/hkf2pcT6R6f/W+9rKdLM+uXKY62X/0hJXBR6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a960a9d4-8119-47d6-59bc-08db56aefc67
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 08:16:16.5272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IojQIq+dFzfjf17iyXn8N6taKJw1TP+ezpiN5pyeK+VZQbrsCxWBLLzQScdYDhtjEDB7LknTzazumXLj5w/qgA==
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

USB PHY DPDM wakeup bit is enabled by default, when USB wakeup
is not required(/sys/.../wakeup is disabled), this bit should be
disabled, otherwise we will have unexpected wakeup if do USB device
connect/disconnect while system sleep.
This bit can be enabled for both host and device mode.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/usbmisc_imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 9566022a2183..9ee9621e2ccc 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -134,7 +134,7 @@
 #define TXVREFTUNE0_MASK		(0xf << 20)
 
 #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
-				 MX6_BM_ID_WAKEUP)
+				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)
 
 struct usbmisc_ops {
 	/* It's called once when probe a usb device */
-- 
2.34.1

