Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45EB8773C2A
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 18:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjHHQBD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 12:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbjHHP72 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 11:59:28 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2041.outbound.protection.outlook.com [40.107.15.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0219761AA
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 08:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBSrzLpGRX+qN8PoepP21mdxRhFhBHV5WXuF0jMHGOVc3GvQgxUEyi5gpCa+zxtPxrOEpqyaewhKo+4eFON9c4VM/5+WRQMpqb1uQeoVjvc1Zbz/VNh9/f51pDoPXt5wLHDbzke1xp0tdAQTUG2qFfS5y6ndU0bC0PE7fDpaVB4tl3HF3SXl6Vp5w/z8nwsjk4aw5EMX9CfaTE/298L7O7s1K8bxaZC8MerbdZrjERlP4M6+z/MJzlJ4ObbUY17RVuVEUkPgBsKTpw6+oPD/MkYEUe5ZtBJTrqOmjen1D0UpyRcGosqkYhrCD7DseZrVqFxHQy8UAxU1OzazCi7a/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2UqLMLdO6likwubM3VIZCM20QsYMfdcFRSvEX/Cd04=;
 b=jN7YewYXJlvK+3z/v4PvVCZCK3urfxJmhqYyz0zh7DCpH/e1EdLS3I9okK7u/JAa9+rnt3t4tTUGPyVrqtYNSalagZajz1uvg/cwhNDU2uO7kn+X2w7E2YbMaSzJnKSG1Y46rDOmOSeEOwpNQVuIc1pzBjZWSD9jEiDPt9qexFun2zlQBMOibQ7AFqhhIClm/sFGRjg7HzuOTPuhCEO/2tIMqs/QwA3ELwg89upcX8iFxc+rVSSzRFyxNjchAYmGtovLKuVp/orzZYNzzbOzbkKq/HwLNDyzmwWrZtS+yCmhr9GQfy+DWJGpVSP7YiG29/ATlWRvlk7yRHEnj9giFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2UqLMLdO6likwubM3VIZCM20QsYMfdcFRSvEX/Cd04=;
 b=eIgwvDP9ATh6x/K3T6OOEvcQpEVnqQHJWREO48TQiS+vDwlO3ti3/sSOTz4SBl3ISKzvfJcKy1W+C9wm5cT3k5DeOWptncQpJTW5g1YhgZp2WJuPmfo2FzQKJLnvD/qY0ThD0O5+Snu2LYcgkjvUZA25b6sdZlhOLnMEIfPmIjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AM7PR04MB6936.eurprd04.prod.outlook.com (2603:10a6:20b:106::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 10:33:29 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 10:33:29 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     stern@rowland.harvard.edu, peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH 2/2] usb: chipidea: add workaround for chipidea PEC bug
Date:   Tue,  8 Aug 2023 18:37:34 +0800
Message-Id: <20230808103734.494321-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808103734.494321-1-xu.yang_2@nxp.com>
References: <20230808103734.494321-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AM7PR04MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: 908e5275-d98b-4adb-c395-08db97fae804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mu1lmd8g22SgEGNiGDMcxPzvAFn19Sb8+BL1ylvGFclZFauNvh2ph0PRt20lAs8jyglSpdxmNoGmY46tZe2hXC+IPmW9SEvSTHcC5PSI8XwdQ2RqM8Rnws/cBczl1kpFuhoC+SxFFp6bhdyS1LH8YdNG/kURihxttoUP0lfRMKIXuF9FgFUhwNDvijyxEVqC9IC886ezmJWVdkZzA/P60aWUm6D0UfmyeA3ze3BGQT7YPj5vZcufupmL76lIRWsMHQGGPiQ7CClyH0fBUQHixYHGfb66TBBIGLgEvsOyLsJX3kFkEPEVEVKSZUUjaDA0I+47Dhij4CXm+wuLCKOeb0U6NvD7z/DrT8aHoOFcBke1FZh9Xq9v22VTnbbvBBjcVCjhR19NXf7prFMdjwEBT0zLE8QXnoEI3sKwrqmpVKl+iTyHPfYoaK4BacyHazTwspPUMrRGAHZ4x5EiudIlGmauO0Bf5OtwIGsDBOmbA/eON/aDnr1dsPf5Xkd9mIChgBCATFoI9XkijSYfIPZZ7k/d1qcCIWNJVWJVTXi01JTvy2AdIAa4c5zQmiehoCNS+s8nRIkIeN/gDuDAw6N2dHJhdwHTv2sZUVhZsxSMJlI4u9BZsuCrK7HLg/VuZj6M
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(346002)(376002)(396003)(186006)(1800799003)(451199021)(2616005)(52116002)(26005)(1076003)(6506007)(6512007)(6486002)(6666004)(478600001)(38350700002)(38100700002)(36756003)(66946007)(66476007)(66556008)(4326008)(316002)(41300700001)(8676002)(8936002)(5660300002)(2906002)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YciNynOBsxZRxABxK5nJSMNx8FKpM5HWjuXcHUrtoF306mYbFOEjUyinDeKl?=
 =?us-ascii?Q?RvufQr9hqZm0Weie6NespbB0kCOpf0J7urlpXZLMj72uGL6nlwrQhXG7DCNl?=
 =?us-ascii?Q?J05wl2/9ZZZAucmEyalqYiAcmzaiPOa01/1u5jpIh2+wRgKjJI7/RxoQYNaV?=
 =?us-ascii?Q?sQGemuuXkhlFFHY1rNRCWFIIy9NFLc3dpbiou5VIe3D+zyCpNuId8GiJy5nX?=
 =?us-ascii?Q?da+exPq7sYWeM9ZIuNlVu22ujA+1IrO0VraB3bA1u5KocqXCWDCyhuQMPHct?=
 =?us-ascii?Q?l77lQttObJLgpXCL0ZQDloh+a1gT9NugthkdEkE32Twy/UqEjxJI/uoXpgLG?=
 =?us-ascii?Q?IVDJGGkFc2vXgqSn1+n6iSzlQVz03YhQRD9SZ4FD1WYrktLlQtf4vwSY7DYt?=
 =?us-ascii?Q?/M4Auz85NWF61TRTfC6D01SINBQTc42rfo+Q3BHGnQcB4V99NRNNaBoOOv6b?=
 =?us-ascii?Q?nR9YAQpXqnLy6A5u2w4U5OUzVNrtEB6a+1l1tgEFE6o2I6iyq8xTSb6svcfG?=
 =?us-ascii?Q?sv09yVhdNTA94IEnZmv4SUiVxhwETsPt1QraXOWuKupKlvZR2kyMUdBM+oDP?=
 =?us-ascii?Q?t8qL0eEI5qdWBDWWwfq1TPYPrGWQ8ms0uz1WUDnhE1wJLk4SreGsUoMtErUJ?=
 =?us-ascii?Q?h3fzHXDaqSJwOdSbUmArSPuyRDE0sOujScyvR/bQ3LuKu88AVcw+hCNtK1Z/?=
 =?us-ascii?Q?oAGEx+PHhY+j34uIpw2QjVIjtl1T36h5eXuhRqeV6Wv1nkOKij/jbkRAxDYs?=
 =?us-ascii?Q?v+GnBpi+He4m+aN2lpUlh8Y/LYrodUwx/3w6Ru37qvS6qwfQsRqpWLEcQRat?=
 =?us-ascii?Q?0vo+c2kP4jlmtA1rFDVbmtIu4lSZ1bMil2v4c6Y5tZgKSmZKOsNBU0/xs7KJ?=
 =?us-ascii?Q?CGVeycIqdFNbix2kVHAS+ua7UDx08MFzUBeE5Z0VBRImv8IzqKj4QXCUPTie?=
 =?us-ascii?Q?3wEqfMn89HeDttIXIH097V2pxVLRShZKFOfNkGN/s/tNLSr/SdIog4FrxCmW?=
 =?us-ascii?Q?OobXyJrp6R31LyK2nDybPTMSVuv2fKPN7bK/oLQ/DT19hfan+I1hdWci0lG+?=
 =?us-ascii?Q?DdPtgn13XTvZC3+xzs1jNfR21l8kmAgtJVpzZ0lmR9LSXfxkWmK/3WFAf2fr?=
 =?us-ascii?Q?fWo+FYPKDV5kcZHo8DY8FlYSaQRlVMnG81ceKG31UKZ69tHGBW2vbEkhYyqr?=
 =?us-ascii?Q?cC1auNQjV5jZ4m1ON5QCfEj7uvmaO/Y8qgieME+s24c0uDDQzOSUCzeV+L8m?=
 =?us-ascii?Q?LCgz8NSC34gi0hpI+vreD2f46QyEDoswc6XE+tLC23ENkqPfd77fptUuwQv/?=
 =?us-ascii?Q?2P45BKaz04dLPJJnZo3iprIcXMu0jsa6kB2b4HG8P4KmfcQi6vNsLvZNtYH2?=
 =?us-ascii?Q?5OwQB6+sxxH51XegSd4YI8pQkTLxF+3iwbPrtwnse7FvaA5YmBxwSkJphXEf?=
 =?us-ascii?Q?Sq3XJDByjcyIRobFmIPWtV1ho8lOeV4fEC02AA+plDAtsrEQ8KTdAcczszyk?=
 =?us-ascii?Q?KVSVJ0asF7VKhNgIy+/ItqQd2PMdjkbhZKVFbTHcJ3Jp1j5oo/6luFjALkbL?=
 =?us-ascii?Q?wH0qpHgzoJhdtZ47YG7e1anDU6oUU5w8aQ0y/fHE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908e5275-d98b-4adb-c395-08db97fae804
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 10:33:29.5929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZ8755cETlJOuLoHIlvjsCBtad5halNmmRJagEveQivzbfzNt6tphzJg+dAeWxNG4K5tUYEA6JzynodMBDz0Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6936
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

