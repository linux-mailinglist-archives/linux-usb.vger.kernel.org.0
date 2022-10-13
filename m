Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1195FD572
	for <lists+linux-usb@lfdr.de>; Thu, 13 Oct 2022 09:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbiJMHNH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Oct 2022 03:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbiJMHNB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Oct 2022 03:13:01 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80049.outbound.protection.outlook.com [40.107.8.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB4D11C274
        for <linux-usb@vger.kernel.org>; Thu, 13 Oct 2022 00:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlnnC07k4xiZS7BoH/HkHOuaUt4WumeHrh8KP/ECFPv/mqjx8iRuXJUZ0h9cffLkfqiLYqiNov3GhiThMEnNUlZXYy+gHhJvmhIyFqZgyjWoWydvE6dtCinY3BvVUGRJdlfQsw6liqc/uzUXn54B0rcVg1cVz270HKJHaS1LINP0uI4Oeq9V4XiyZj4txeNUfzTILRM58Wwzlb8bmYAdOabtE8kl6l2EXdbiJz20GBKyvX2d2dFCCiUYgBvBmtYpYLpfoWRWH2ZEhERt69YHGNZiKP8sAARQN5jRerY6KDG1NCG56/UERhTW7JirbFeNSn+bB7GNygYIFW+QhyToLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TN+cvx+ULURZUHbvw5XloGjbk95OmrA50HDYsX2lD/o=;
 b=C/NxQHa3f+BuuO0fjRs/INbLIqz5YksRZt46dCXO40avVUxfKNb46ybrC4Eo3T08RAnquljUBCmv1C9yCRTEvCjG+Kga50x55ZMDv3emUY+i8nzDs6tosAIZENEU+Fb1MdGqnRc8UkShVe9TVeBjzhRirXqqIWfNDvrEXsgEYdZP3QQoAuCkfCnkzdseZe/P9runsF5qXAZxt3gM2UZ9ctMM8y92eiFMEQaiPGHihNgqSiC3qUxy1CSGbTIaMjd4QYE58V2XoGHc51Ey0Ag7ioEfGhQRTv6OAuJyIb5bmzCNU+GW4AosrG8LmpxoSSkBBBer/PGKZxFHs6SSVLkQUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TN+cvx+ULURZUHbvw5XloGjbk95OmrA50HDYsX2lD/o=;
 b=V5BTmi6oVLKC7OgnRrkkUMbleJnNSLMbszF0wE4UhmNwVqH9wnbG6PL2GfhcZy2TrJ1vaobLEQINdqqKJOxMVp5F61irCl7JEsUCQRw+wIYViP3Cc6TswiSY/Avkb5yAWFaM023GABUisaUBZ0lwwCR4zdcub1SsBbClrLcgutI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by GV1PR04MB9151.eurprd04.prod.outlook.com (2603:10a6:150:26::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 07:12:55 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 07:12:55 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH v2 7/8] usb: chipidea: usbmisc: add power lost check for imx7d
Date:   Thu, 13 Oct 2022 23:14:41 +0800
Message-Id: <20221013151442.3262951-8-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013151442.3262951-1-xu.yang_2@nxp.com>
References: <20221013151442.3262951-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0091.apcprd02.prod.outlook.com
 (2603:1096:4:90::31) To AM9PR04MB8777.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|GV1PR04MB9151:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea8a55f-d50b-4fb5-717f-08daacea59b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cda7+kTjpfGIMw7sZnRMpEcm6TOa8gga5nhOFFO4zv2J4LbLb+PqoCSsPZgxsIPUaVrKLFQCGu68T4uDVjyXQLQJnoxw3pC3vA05rzC1Pqb86qP+X7XqrHCg83uFz3e7L794Om2Qg6uK9ygZ7HvrTb4Vf9YWT4WUVEXv5qP9YxqkltnXhQ2FbPb0pGLSPdBu1rLRHHZpDHpCYLAG7/GWDMkA+eTA1hl4f980KF/6mQAJhqNlsNc+faB7xeCrmJtWrsdS9tyP7YQ2Owbv9IaAw9Q3bbQdlWO6QmkdTLB00AtMuc2H+d6lGKA75Cf4qavtuzWWHPrItI2tTuRwkJF7h/ZWQYYjIuGnoL92zFI+ESx00fp4/ereRVwoFJAznzzpKTkZotOnU5WsE3KanydhMM2LZperTSLFbb6Ip50eXc90X45x5/OefFiJAdLPuoqPLiWPycQ4vXXrC1ReUusIlIN20ubFPDLfAnU0UScLub8kNdfeHp7BSwhwJKUST/lV3w4lEG2m9AKpYmoCcb2U5fLpAjkNhYDFWwt+cbpHD0xYV18NFIdeG5AC3ECTaGLNh4s2Cy5Gl8xFUYu0OQ7w23JZH9ttcwG6jxFsZZxnWfzxtuRdLP9aujJzocBZcM0RJcMog9FvZ6oFRa+qmrCJiho9GqvbhCh1QJA1CZpxOUC6VGo5rglgpqAaWXXN0Xvoa0MrrXICY/608c6Fh+OqzEV4dcQL0fgYpfc1rYCRsNxFpbiLL2QksDZf+3qKojj37HwmvJ3bxHzdU/Mu1B05kQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199015)(6636002)(316002)(38350700002)(66946007)(8936002)(38100700002)(2906002)(41300700001)(4326008)(66476007)(66556008)(8676002)(5660300002)(6512007)(186003)(6506007)(52116002)(6666004)(26005)(1076003)(2616005)(83380400001)(478600001)(6486002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GrtiCTIgvxXJuM8BxaP5eNIuuVX2gBT2VGPPqscZNtscOMO3qMUB1O0vr8ug?=
 =?us-ascii?Q?fM+7ngNLFd+wbaxDIs3eMAYa83qfeLMes1uZm8+4/qG6u+z1j4c4c9pv9mRj?=
 =?us-ascii?Q?ACbj3kZY8js6bSS4unjyFLJZe+5NgV6UXHosLs7XX1H1h6OWxWwmNPgeXS07?=
 =?us-ascii?Q?MbJbuMTUKYXhfcAs0l0regGw6Zr7G1GPAASj3bRKQHiOyonUIIcJjREkYKZc?=
 =?us-ascii?Q?r/Koqw5Bof39GnufI88GEiHZHQwcnc8Viu/RVa3fqnU3uYYfEHt7/Y5B41vE?=
 =?us-ascii?Q?doOzqNqbREsmNHB5q/9hgsYozlvX13FS/v22BV/H3OvFLIUQrPXXI9AIjjBd?=
 =?us-ascii?Q?sSZT39zsozfneitzm5SNZzhJG2RrNgz4aL4k3sk4Tv6NUIAu+6QhO6U8f1by?=
 =?us-ascii?Q?4EDD4IiTaIuCrhtB3BQsVu+73zb5KaB+Y2hBk0LQTFAaPYsmdCuRWaSrU6lP?=
 =?us-ascii?Q?42616EOf1emYsjP9wwt5TxvAEBFrSD/HtK373vhDJgJ6bCvNJ421ByrFhjTQ?=
 =?us-ascii?Q?K8Zyuc/5p+yCLAXa8qr7FzC1Tj2hWDZQqIKbQxjh5Vo6jRZCwizXRJcjQ8/8?=
 =?us-ascii?Q?WJtXCeANxZv8Gi2wV+YlkzsfCYxPn0dCKVc28xQZi15UM8dow58jUEaPuIaY?=
 =?us-ascii?Q?+HPqL7YZLP66Tn9ZsQJCQB9pZwUFgYziAcv0gu6G/j1ptp76nD0S5tcpilvV?=
 =?us-ascii?Q?G6t5owqK/L5aFBR+c9h+GC6r4mnMxx+yWHLv1nyLMPvfKPR1Pnag2DlchDRO?=
 =?us-ascii?Q?JCQ1MrF+HQEuJ8L3/xgDg0VO4xf3wj3FVbaRhxqaxLkDg/4O5pBkC4N+jPOI?=
 =?us-ascii?Q?5v1qNiK0gQsII/3SERm9uAe+/+ElvaKxQ5JxdFCy2UIjknBPh2GFruZSggwK?=
 =?us-ascii?Q?eB2umO+irUy/AKF6ZlrYzLhajRne8h0eIhlNLt/+UZBr+jYo6ZDd9p2sXvlY?=
 =?us-ascii?Q?WZFw93gcq8BZxQfxlQpRSRgBQjFifWu5nKslUOR/YpgL+NhInmZghV9/5MKa?=
 =?us-ascii?Q?jS5kOsUSXuu6inaTeRDtYV4lu2fDmdSXzJCFCx82yN+dePqHr0SSi6sSzY08?=
 =?us-ascii?Q?lpkpCAUS/2aAYOG9PXXGRa0y/O3cVIPSQ0GeP/fn98T1sOra6UyewduSQOQ0?=
 =?us-ascii?Q?NKRYHK1CYuIyzP5ldMBH4leTPOdc4UgLAf7fvh9Y0/2o1iI9YJZiAzcebIJj?=
 =?us-ascii?Q?jPx85Fhi5QpYGtSeJ4rTtV5zVTAtPifD2915V4P9UGhS+g87IMDoWhkng9q8?=
 =?us-ascii?Q?nYfolFPLKnJ7jkqh/d5jLbcYv2OxbXQC7bH38QHNgOOUizdfCB3cEzqB/1fU?=
 =?us-ascii?Q?UydJ12Z6EKHWlXRnTMukHnBGtdCJ6RCUaE1AQOtx679mFbAO8UlnhkmCQfWE?=
 =?us-ascii?Q?gXfbot/fKhc5E8tLsaSyv+XXD4yHdZNPHZQNlH3W2sRWaF0X2mzX/Uax+EXZ?=
 =?us-ascii?Q?tQfqXc23mVlZpzaX47UuWOkuZM2oTibYe61vqkMUZCRAzD+R6N9VEImquBIm?=
 =?us-ascii?Q?tmfNXR+v4Xv9F2hm5aazKRc8kvSnc3iI96eqLFazKPNZZ90a49CjBSlk8IKI?=
 =?us-ascii?Q?6kPKQs1waDdjIRQXlUeZun0US8r+ysuw+CoxIS5i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea8a55f-d50b-4fb5-717f-08daacea59b3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8777.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 07:12:55.7221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MaC/jx+mqEA649Uq54/XNQsx8jOVBrOEzqD7QdLipsQOsd8I6csg5Eun0SX7OnSHMSw6PAcZAeuE1a5UTs/iRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9151
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

imx7d can shutdown domain power supply if none of peripheral in this
domain is registered as wakeup source, this patch add related codes to
check if power is lost.

Signed-off-by: Li Jun <jun.li@nxp.com>

---
Changes since v1:
- No changes.
---
 drivers/usb/chipidea/usbmisc_imx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 7bfbfc83cfe3..cc17dcd97856 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -939,6 +939,25 @@ static int usbmisc_imx7ulp_init(struct imx_usbmisc_data *data)
 	return 0;
 }
 
+static int usbmisc_imx7d_power_lost_check(struct imx_usbmisc_data *data)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->base);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+	/*
+	 * Here use a power on reset value to judge
+	 * if the controller experienced a power lost
+	 */
+	if (val == 0x30001000)
+		return 1;
+	else
+		return 0;
+}
+
 static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -998,6 +1017,7 @@ static const struct usbmisc_ops imx7d_usbmisc_ops = {
 	.init = usbmisc_imx7d_init,
 	.set_wakeup = usbmisc_imx7d_set_wakeup,
 	.charger_detection = imx7d_charger_detection,
+	.power_lost_check = usbmisc_imx7d_power_lost_check,
 };
 
 static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
-- 
2.34.1

