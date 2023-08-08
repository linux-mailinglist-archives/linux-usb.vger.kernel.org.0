Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF10773CF9
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 18:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjHHQMS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 12:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231852AbjHHQKE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 12:10:04 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 783917AB1
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 08:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUiTxkNLIo+lujnw9W4Oe4whnjvDVv4a+S/a7ktTVtFOGuH+gyn+rCXlqemhsMnRVNKaMfoxbfaaCdmGwGH25FrPeHLv54imSbFcUKWj7Kuu+etdq+CtQ1ijARCRljWj1Y35xHUgKbfx5nnnW9yNAQ5dQ9dKPp7FljCAgg1qmHftP10j8wp45h/gyn8CI2+S8IUXM/qYDKxUDdU9kGg96V6JC8OhzIs50SYFhfXaTQsaskGMhR2w+CUkZZsOTG7iZibb1KNDnCu7WPHSu9NHC7fDj82wRrPRQj4F75r8qt8UIgmnp1Y1Duw/RYYCKOuyLB2WfNGbFfTMauroaPViXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2UqLMLdO6likwubM3VIZCM20QsYMfdcFRSvEX/Cd04=;
 b=Yc4OpZR0Yewa+935CnFhLzMN3mvJ1PaNskqhK5HD2swVngwwxpnRuHwxfMrMytX78bUYixgR/Jn7k7F7L/3dea79UDk9HZx56jBKJjW5MOTp3EQ/MLIvgTfqNMd3L+uZVIaN6N3e+uXkiLpjqjNvHHch5byxHjW6ggKPj5RtpH5Xt9iFI9NQKV5DI9IcMwt2bYylgpF4OpLNDa/gcXIvzATlhEyZLrJCtHtk9hC1a8Pfv7RXJZu1T6SCFuRM7/3pMyDHWQmrX5t4ozGfXuZGmYZP7B0BMGqdIvlD8PnqIKaWNiD9c3PhlDpgvjLQxy5Z9iTCaCtMixZCxZA+UOdSlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2UqLMLdO6likwubM3VIZCM20QsYMfdcFRSvEX/Cd04=;
 b=G11z8zHduA5a2vWZIU/x9z7ZxXsjpjb4/UwSCJhPBT3lpkcPcrSfbJpTN6C1dGIN+g5SUkI/9BCJkd14d9AQawV0mMWkVc6VrT/xpWYqL1IKKMjwNkPSIfI2Z3jD7NmxmDZ+Qz9jpQDs8EvnvJltC8KIRTUwOXQ4FL/fsY6EPlg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS8PR04MB8372.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 10:25:54 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 10:25:54 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     stern@rowland.harvard.edu
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com
Subject: [PATCH 2/2] usb: chipidea: add workaround for chipidea PEC bug
Date:   Tue,  8 Aug 2023 18:29:59 +0800
Message-Id: <20230808102959.479264-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808102959.479264-1-xu.yang_2@nxp.com>
References: <20230808102959.479264-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0002.APCP153.PROD.OUTLOOK.COM (2603:1096::12) To
 DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AS8PR04MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1dc276-8247-4be2-0007-08db97f9d86b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H8kE9uHCDHdD54+iI5jnmiHs1JgiT+tZRLpn0NOPvysWmCOpLmyqkZIDITF45tjjm+lBrjJIF6MqaDgwaJMc+vrlCUFkkSt4Epz3S7irtMycsXPH1Ovkz1zFmSdqvl42Eod3k/NeyTQpXpGq+PQI+qm7JYg7zKltqVTuObjRrh91j616sE2FeWKDgqp2EFU24Qdxar8Q7l7cY7fbWZWwxmCb2xI1ijQAuTnXk/WwzKSqAGWPBWvEUtuNlWdX196us9L6+MGV7ra6zuSJcXN987MkdwDA2PXf9khRbYp0SEU0wmEnOQNk8Q4wfXzv07N1opA3X4aYqgxl2O2tQGvkxMtl5CMKuDf9Rakt1196YpIhRUYFAXMlucqzW14ZJ7dLpFJOwbLQBXeayAz0CQxUubbYVIwDkEROU0TATB2Jrmy4HffpMy3mV5AcNWebD1uvZby18M5ZgBSmS8ycrIGn9hvcw2PLn3iw0hIdh/uB6aob65DVdqASmYMeRE+QkYWN6bH3UZu8P/06yU2dh+8IdG0dOJa35wSuzGTh4MogmOImkSXpYbGYD/SWo7H5ELBsy9pCEw2O74GFdKfeffu3B+sTCqaXd31y6kLKjFnR0GKHwrihLHGCdP6rGyK4NQ+h
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(366004)(136003)(346002)(186006)(1800799003)(451199021)(6486002)(478600001)(83380400001)(2616005)(6512007)(26005)(6506007)(1076003)(8936002)(316002)(66476007)(66556008)(41300700001)(8676002)(4326008)(66946007)(2906002)(6916009)(52116002)(36756003)(38350700002)(38100700002)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6WEJo06wTkBwANQSTAMViJaDJh2Jmiu79NIH/jkferUm7ohgoUtAHAlQhsHM?=
 =?us-ascii?Q?IWJZj7Y7u2aQ47FaQJRu3Mk9n9Hfj0RzchdZTUPhIYcmSEdlsV4gLcbmGA7X?=
 =?us-ascii?Q?zSDV6toDpZkzNN61shkv4lEBY7z//RkLXcVlV3KBQ95tghJoW2qFuzD90uL+?=
 =?us-ascii?Q?1XTSpNxeBY+AiY2yC7ksqGi+vcuin8dwv2lYWZGKlf0lgN3dapHwtaWSCkLj?=
 =?us-ascii?Q?EpvCRu7A8BCOE7/r/iNt6oFvFNxivWXMmQ5LklN0KDwD2JmZIj2sa0U5F2kV?=
 =?us-ascii?Q?MIj8QY2Tm6tGS75jkMpNYTExKSa2AW7al5EcbM0Lcf4YXf+189xLv/4TNHOj?=
 =?us-ascii?Q?/fUfkW5R+am6364rPUzqYOKOtjB5+AkHQRJzhOVs70l51hk032OFAfDgj64R?=
 =?us-ascii?Q?KSbEcOkb5airknLXaST3uKdXVmyfGKKdF1EwoROl1J1f+7eKKDtx4quv0ztU?=
 =?us-ascii?Q?uXO9h2XYzAiPRopaGyiiT1XJpfQTgOetJQ98s3APNLkaMT8XOIRseqQ3G5Qb?=
 =?us-ascii?Q?DD6p6icfRrPt9tPMVYLaoW3qGXGOmPCZ9bgHY1g1HZuLFpzb92gtw+DOG1ai?=
 =?us-ascii?Q?s6JkxF1gkukeqfezRXM3Vma/7MQXigtYcR6+S3eFV2QP+/zV5PykpOrJZ/ig?=
 =?us-ascii?Q?dBsGi7wRCigaQQv+1Ng7rafZKSGNTDHhy+WSd/0Q/oUUsR6uc4wpgZ4RFgEi?=
 =?us-ascii?Q?jFRX2gtJQS+sHbEO0U80J3W+4fhzHrQUQiZfJCbai/M47YuwE82LpY2RcIfk?=
 =?us-ascii?Q?4Lq8OjQrKHQ+0H94vwAjmFsX1b0oTBtNbmZ5T5Jpe8RAFBckJcBYot0rb5WK?=
 =?us-ascii?Q?nQ/Q/vW+7LKlo8S1RdbTYGfsuv8nBUmtbM9PjkFk1585p8xF0Ip4oZvMO62F?=
 =?us-ascii?Q?cQFeMZ4LytC7/PVohM7BjVj9D9ylHWfNOLYbIzsgOnVEY7RanxMXFVLvOKEI?=
 =?us-ascii?Q?4KzXFTcaPNqmyyu4HmJ/+BatWm+wf89Ind130iIywytOiMkWSRVfyTwSSJW/?=
 =?us-ascii?Q?P9rU6mxDvEnay1MwraFvvEKNUaNngcKmOjIiFRtxJZ1tbU0RFuV0w+Ms27+t?=
 =?us-ascii?Q?glKNoDKO276u9KCpLmxkaeYEX2zIc7TNcbVbrl/yO1761NDmUck2LpXRmpD3?=
 =?us-ascii?Q?e0aZoCaE+h3n/01G3aLMrf1ImWZhx0rVF/QWft5BjW1rvWyI4aw5qznilmzr?=
 =?us-ascii?Q?tQ/fD6OuBIyRw6HxVeKVoM1fieiI2txc/NH1MI2XyiNtQZPhAi0O84kCTPGe?=
 =?us-ascii?Q?JWozhIPHDOT5y0TzftZaSFq8K/GlG8lqjJiBmF22iqcjetawRcfu85Ul+Mwt?=
 =?us-ascii?Q?ZHT+OENR5AOF3mkfGXO/BCcZKsBP6jrbVIVcfjxwOOFyN4dpmaXpk1ikfSLt?=
 =?us-ascii?Q?OpA30ysnfrQiHMok0PiHDqP3yc0q+R031UHNAGioflbATGKWzPPmJesd/xj9?=
 =?us-ascii?Q?ANgJPtiUHDez5a9UenOmXXIZcDBz/To/YLjYXiEKIK7PTLupruWfX2nwxPZC?=
 =?us-ascii?Q?zew1XaIZUNv7QeL06qV+rtTPsg13HhPJmKbvrPceggTdmc1CT1iBtYs54y6O?=
 =?us-ascii?Q?95lYs5NFQy4Pw/bbfE5JwXxchrJRuTmiQJ6Ho1B/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1dc276-8247-4be2-0007-08db97f9d86b
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 10:25:53.9816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWKLyO0pOeiuz5uSFyDT0ff12qYOEb53SgwRPp/L2qw/152q/Ddf9x5fxd2k8tPELo57vefUuwKrjYKOSbCcDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8372
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some NXP processors using ChipIdea USB IP have a bug when frame babble is
detected.

Issue description:
In USB camera test, our controller is host in HS mode. In ISOC IN, when
device sends data across the micro frame, it causes the babble in host
controller. This will clear the PE bit. In spec, it also requires to set
the PEC bit and then set the PCI bit. Without the PCI interrupt, the
software does not know the PE is cleared.

This will add a flag CI_HDRC_HAS_PORTSC_PEC_MISSED to some impacted
platform datas. And the ehci host driver will assert PEC by SW when
specific conditions are satisfied.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci.h          | 1 +
 drivers/usb/chipidea/ci_hdrc_imx.c | 4 +++-
 drivers/usb/chipidea/core.c        | 2 ++
 drivers/usb/chipidea/host.c        | 1 +
 include/linux/usb/chipidea.h       | 1 +
 5 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index d262b9df7b3d..d9bb3d3f026e 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -257,6 +257,7 @@ struct ci_hdrc {
 	bool				id_event;
 	bool				b_sess_valid_event;
 	bool				imx28_write_fix;
+	bool				has_portsc_pec_bug;
 	bool				supports_runtime_pm;
 	bool				in_lpm;
 	bool				wakeup_int;
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 772bbdade994..e28bb2f2612d 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -68,11 +68,13 @@ static const struct ci_hdrc_imx_platform_flag imx7d_usb_data = {
 
 static const struct ci_hdrc_imx_platform_flag imx7ulp_usb_data = {
 	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM |
+		CI_HDRC_HAS_PORTSC_PEC_MISSED |
 		CI_HDRC_PMQOS,
 };
 
 static const struct ci_hdrc_imx_platform_flag imx8ulp_usb_data = {
-	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM,
+	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM |
+		CI_HDRC_HAS_PORTSC_PEC_MISSED,
 };
 
 static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 6e1196b53253..7ac39a281b8c 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1044,6 +1044,8 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		CI_HDRC_IMX28_WRITE_FIX);
 	ci->supports_runtime_pm = !!(ci->platdata->flags &
 		CI_HDRC_SUPPORTS_RUNTIME_PM);
+	ci->has_portsc_pec_bug = !!(ci->platdata->flags &
+		CI_HDRC_HAS_PORTSC_PEC_MISSED);
 	platform_set_drvdata(pdev, ci);
 
 	ret = hw_device_init(ci, base);
diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index ebe7400243b1..08af26b762a2 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -151,6 +151,7 @@ static int host_start(struct ci_hdrc *ci)
 	ehci->has_hostpc = ci->hw_bank.lpm;
 	ehci->has_tdi_phy_lpm = ci->hw_bank.lpm;
 	ehci->imx28_write_fix = ci->imx28_write_fix;
+	ehci->has_ci_pec_bug = ci->has_portsc_pec_bug;
 
 	priv = (struct ehci_ci_priv *)ehci->priv;
 	priv->reg_vbus = NULL;
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index ee38835ed77c..0b4f2d5faa08 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -63,6 +63,7 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_IMX_IS_HSIC		BIT(14)
 #define CI_HDRC_PMQOS			BIT(15)
 #define CI_HDRC_PHY_VBUS_CONTROL	BIT(16)
+#define CI_HDRC_HAS_PORTSC_PEC_MISSED	BIT(17)
 	enum usb_dr_mode	dr_mode;
 #define CI_HDRC_CONTROLLER_RESET_EVENT		0
 #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
-- 
2.34.1

