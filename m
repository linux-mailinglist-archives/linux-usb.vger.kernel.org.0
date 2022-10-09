Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00C245F8A11
	for <lists+linux-usb@lfdr.de>; Sun,  9 Oct 2022 10:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbiJIIGX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Oct 2022 04:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbiJIIGV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Oct 2022 04:06:21 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130045.outbound.protection.outlook.com [40.107.13.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129372DAB8
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 01:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cv3+vHeXhZ/tO10O3MluCRksN/aRK7Y18NIArx/x7e1SSMos29ZYTHRot8kZZyhisuPdATLLakfsPeGSHSHIvlWNauWaXKLoqnXiWpSIrPViMlEhjo4SKGpNN8PU3NvgzfNg1+5MRzrsJPbylN0558otAjCtcg9HKwuoOvjFpT/znUnifjX2oLpqhViYPijogVUyWk19gH686LMxsJZeij31ELqmogWr7NA8+MCdxlzrrxIRr+aKbe0m0cHtkp33+Dy/aoIUaORxHCIRgVVgtO+4ssQKU//L09A4jHWmcqGlE6jVdyJDRhyfFeq0NfVO7jvg18hEr/DSRe7rKiN8vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fe1+fzF2G0R1BSDzV2fQ4urwwMKeWjCV+6+VrDv45Ho=;
 b=DlFI9xs+ij4+2PRcjH1OqI1SwUi9h7dcK2ctr4I4nFop3Em+jYA2WzEw/Ib9y57CPTQsoUOKw1ya2WxuaZLtSUbHe32XHra/B0SoSE7LxjEXzr2JpDITWkSL2AhcbDk8Pv8NrN+yc4o0pLyntYpUfyGA26n0/To1ej8HIEpAn5axbHHaZpiMF4cD/x1zBU9g1iUkDKW/wAVIxXyFDkOxMFPSgEDci/6rc5DnH1DAlVyAuQmBQWNWezdqgraOjepMlEcy46Z1zlI/sOut7BzQ41qmLCgZPyreqBsXVUvwgGUwGLiJpd7PALYMUH1x+hl/iUlIni9RfBTCiD80DvppgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fe1+fzF2G0R1BSDzV2fQ4urwwMKeWjCV+6+VrDv45Ho=;
 b=gbcslHcmrefrLFCkW0S+4frX9HAca4VX0wCC50koTaWFUcoA9WHQOWuD7S01t5cZwxLT0wJdYKZy9RwfMQp9zMK2DPwnFGi2MAfgv9sudZR7R6JsCMyt6UHTli80YIbhqtGZNx8dt+OQdvjOIP800dmBQooXhxmnM5ZM7JJ2Fds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by PAXPR04MB9230.eurprd04.prod.outlook.com (2603:10a6:102:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Sun, 9 Oct
 2022 08:06:17 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be%5]) with mapi id 15.20.5676.038; Sun, 9 Oct 2022
 08:06:17 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 5/8] usb: chipidea: usbmisc: group usbmisc operations for PM
Date:   Mon, 10 Oct 2022 00:08:10 +0800
Message-Id: <20221009160813.776829-6-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009160813.776829-1-xu.yang_2@nxp.com>
References: <20221009160813.776829-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|PAXPR04MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c4690d5-9e89-4ed0-c3fb-08daa9cd2472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F+IZy1uRJq98+2aiwKLybXkqGsl80IU0Vu33TnrCUm9h3at6opEwlMo/st95jbhCVELDzJxwgfNhmB2iUPAACBs231qa27UCr1aB9ZL5zFOrTeefBND2QpvELx7xxJXlcHfaq0NIydL5oVnpknVCT28j8yrA2YYhKplZchealK8g18l3dAKzfcv8j+pgdxvkrV8/wzZtE/QFzBxcxfkL9qj17bpSpzz/LCHoAW25F3wqPr19qjx7dEj/Wq3RLom9tlCdFwOwNvVLdf1cb4Cnl79l0DQJKo1ODkcFQvHHQ2Ld9yeAWk9IU9k1zl2wKzZQTWZjcDlogxiK5J1qyye84syoY5byNRJJkrY5PRNVe0aTEZRGJ8upnD2+fafBmSu74LAaN65Mhyb0/9b9BraeXkiT5qpQlS9ofAGFdZB6K4t9LY7nvMZhDUyJ0fs4BzqwK3APRSfjeL5g9uak/o2fdwLg6E0Ar/o9dLdjFEj5+86q9Al0AD8DcCMx0aOxIUmrXo59fW5xiO3QKCI65I6ovVSAsWF0jjA6G7h8W6+n4D+jv53rZRZecJVxn9qFOZzrZYrdrjtg6AuPhLI1lM/vCx8ie8VNlSGGINhSLkagY0+nDx9ntboCIi5UcTainF6A/bdFJ3n/JLE0MehL4CumisGFbLU9v0xNxU4/886CebeBclbj8c0s6uclOCTM1z1zrFl8u4F5kM7fA7JpLnE2W+5gbcg6CbW/6pwOjiKJ/Rtnx5fWc4MeZ2u+Zy3YvtMHTvu2Ve41apcO11mVeeIqVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(6666004)(83380400001)(1076003)(186003)(2616005)(38100700002)(38350700002)(2906002)(8936002)(41300700001)(6486002)(6636002)(26005)(6506007)(52116002)(478600001)(8676002)(66946007)(66556008)(4326008)(5660300002)(316002)(66476007)(36756003)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zbFqlnp1izYTThv3+rl3FhQP2nCva/B0qBAGMQvHzxbY72LfHqMCn7vJgt7H?=
 =?us-ascii?Q?2toV17thOLicjRurJZKwiAP5IlzpnrIVQ1zPejs2ZROqgLTgrSXSinoWtUw4?=
 =?us-ascii?Q?P8am79EvFUsfEEN44YzR/HRoLR/4ejUWK+fvhIECJ2jCtcZTuHGmtVs7qK7F?=
 =?us-ascii?Q?4fQSrryWddNhYkR4dcka8dRqWGfQVyPj640F1kpQarbF18JZQGOnQrqL7Q6S?=
 =?us-ascii?Q?K1nPDoryJyk84jTkh16wZx7/Kh21Abx88PmrrRwrhj3WHlnVlIu7UV39GG1z?=
 =?us-ascii?Q?P2FfPwXV6kL3za6nbC6w1H9MXBj8U5gVoeL94EBxj/jokVrQ3c75TfEcPYn1?=
 =?us-ascii?Q?g548M5NPsx9Hd5YNqMRpYBx3f5TdUJtsQ5e8gLRyXijGnTdx8wbib3To9vS7?=
 =?us-ascii?Q?S/KWhAS0brspoUoUKtpmNIFk7Yn/Wxc1SAZItybvHoeFcyhrXIrte6lKF9Tn?=
 =?us-ascii?Q?ZoRKwrjpJ7bBgGXma/N9HJjNRF0ZN1dkXb9j23Gvjc8ovcK+xPdZYFiOlUnT?=
 =?us-ascii?Q?KkRDNYMTNcJ/FeG9W6svb1Pjj/Oi67nyncDF7yeiI7/YN0Wspa+G1Ys19N6b?=
 =?us-ascii?Q?QPhofTecTqRXbFMyyw2TvAFc5aay1Gn4zDgieVpNGwla4ZDFSeJlclyJUClX?=
 =?us-ascii?Q?1PYgo7t5JCt08Da5CNIX0BNH28VBignUBjAo8V/mpIEnMmpGy5C3M5/qB1jz?=
 =?us-ascii?Q?LQ3CKd5BzDJ8QUT9EXg9LDmIw8fhDM9V6YLKoWVfr4Z0p3+KDN5KnahkIGfR?=
 =?us-ascii?Q?/+SfAhTAlXhBxoCDhh9WNHV5NhorY1yX6PLR+WnOu18UZ/oBB8kF0XUJDMK/?=
 =?us-ascii?Q?AK34TBLyFJbBRWNsfGZMP6twhKUkdrcLW738J6sA6ynvTyJf/qpNdSw/OCqz?=
 =?us-ascii?Q?vVavGoldwNS9+IopJjonKxDAziAeGrbj5zjFItZeN9KejAe9Fo4kLR5a69zk?=
 =?us-ascii?Q?5YsC8HWeViRWJDUpb0pBzTw5UQ8Rk9u+G1smS++em/nVJp/a3lZ3n2p2MdiL?=
 =?us-ascii?Q?QnoojouGoCiHmf2x69ys7794KCelfmt045Um+rLU/oewTRw67kSftyTTYLTx?=
 =?us-ascii?Q?IhXsiB7A0ojhnL4QwPGcW0MTXfSGjrcYj5y1tqb2IREieHi+TjHyYPM7Vk3/?=
 =?us-ascii?Q?K6fqXa9FGDJNJP3BAd2cOAkTb5L/Q2vfaR0O6Kz6If2/4YxtfyLWgDX4ihX0?=
 =?us-ascii?Q?l9wS/Flq3xsb4yGBX5JCIohV5D0l9bwuQ2vGND1XbU4gPVA+iUr3qmYvXQma?=
 =?us-ascii?Q?xRJaIrPODMVmmrMXCtR+DhPTyjo1uuYMRVDBM3jOoIag/2TFhHX4Y6ytOD36?=
 =?us-ascii?Q?pTDYOyKHnSxI/znzkMiK7LNaCm2iFIoHKfk1Ttp2PZQmwgBDzcwH9PXsPWNx?=
 =?us-ascii?Q?KDd0QPRyakVM+OR13V4HPMMV8RSpGKnG2ElPYc9pFCBJ5nXz+TIn4ZmXyB/u?=
 =?us-ascii?Q?/4Dmhgk8+cIkkeO1DmhsM058zuPbEisB05oEyz4XKYdC/TUANMxDXUQKltM9?=
 =?us-ascii?Q?vvI57++Hq58D9RH7g+kudFKvU4Sy+wrB2Jbd1ZXTFyXmqpbfaTG1jfy3W5lo?=
 =?us-ascii?Q?otYLN3AqR/XSitRsyKqS1JitidUD7bDL3bUX6Pq9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4690d5-9e89-4ed0-c3fb-08daa9cd2472
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 08:06:17.4205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhexnnFHFr73YMqExBqTEDHQCbOoNkaBY3bkzz0XA0jUQWuSOl2z0PG3erx98yp3A3kw8JIGQ8Z3L7IZVKqBqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9230
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

As there maybe more APIs of usbmisc for suspend and resume, group
them into imx_usbmisc_suspend/resume. Besides, introduced .power_lost_check
API, so that proper resume operations can be performed in power lost case.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c |  49 ++++--------
 drivers/usb/chipidea/ci_hdrc_imx.h |   4 +-
 drivers/usb/chipidea/usbmisc_imx.c | 119 +++++++++++++++++++++--------
 3 files changed, 106 insertions(+), 66 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 9ffcecd3058c..923f5c00a1d9 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -527,16 +527,19 @@ static void ci_hdrc_imx_shutdown(struct platform_device *pdev)
 	ci_hdrc_imx_remove(pdev);
 }
 
-static int __maybe_unused imx_controller_suspend(struct device *dev)
+static int __maybe_unused imx_controller_suspend(struct device *dev,
+						 pm_message_t msg)
 {
 	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
 	int ret = 0;
 
 	dev_dbg(dev, "at %s\n", __func__);
 
-	ret = imx_usbmisc_hsic_set_clk(data->usbmisc_data, false);
+	ret = imx_usbmisc_suspend(data->usbmisc_data,
+				  PMSG_IS_AUTO(msg) || device_may_wakeup(dev));
 	if (ret) {
-		dev_err(dev, "usbmisc hsic_set_clk failed, ret=%d\n", ret);
+		dev_err(dev,
+			"usbmisc suspend failed, ret=%d\n", ret);
 		return ret;
 	}
 
@@ -549,7 +552,8 @@ static int __maybe_unused imx_controller_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused imx_controller_resume(struct device *dev)
+static int __maybe_unused imx_controller_resume(struct device *dev,
+						pm_message_t msg)
 {
 	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
 	int ret = 0;
@@ -570,22 +574,15 @@ static int __maybe_unused imx_controller_resume(struct device *dev)
 
 	data->in_lpm = false;
 
-	ret = imx_usbmisc_set_wakeup(data->usbmisc_data, false);
+	ret = imx_usbmisc_resume(data->usbmisc_data,
+				 PMSG_IS_AUTO(msg) || device_may_wakeup(dev));
 	if (ret) {
-		dev_err(dev, "usbmisc set_wakeup failed, ret=%d\n", ret);
+		dev_err(dev, "usbmisc resume failed, ret=%d\n", ret);
 		goto clk_disable;
 	}
 
-	ret = imx_usbmisc_hsic_set_clk(data->usbmisc_data, true);
-	if (ret) {
-		dev_err(dev, "usbmisc hsic_set_clk failed, ret=%d\n", ret);
-		goto hsic_set_clk_fail;
-	}
-
 	return 0;
 
-hsic_set_clk_fail:
-	imx_usbmisc_set_wakeup(data->usbmisc_data, true);
 clk_disable:
 	imx_disable_unprepare_clks(dev);
 	return ret;
@@ -601,16 +598,7 @@ static int __maybe_unused ci_hdrc_imx_suspend(struct device *dev)
 		/* The core's suspend doesn't run */
 		return 0;
 
-	if (device_may_wakeup(dev)) {
-		ret = imx_usbmisc_set_wakeup(data->usbmisc_data, true);
-		if (ret) {
-			dev_err(dev, "usbmisc set_wakeup failed, ret=%d\n",
-					ret);
-			return ret;
-		}
-	}
-
-	ret = imx_controller_suspend(dev);
+	ret = imx_controller_suspend(dev, PMSG_SUSPEND);
 	if (ret)
 		return ret;
 
@@ -624,7 +612,7 @@ static int __maybe_unused ci_hdrc_imx_resume(struct device *dev)
 	int ret;
 
 	pinctrl_pm_select_default_state(dev);
-	ret = imx_controller_resume(dev);
+	ret = imx_controller_resume(dev, PMSG_RESUME);
 	if (!ret && data->supports_runtime_pm) {
 		pm_runtime_disable(dev);
 		pm_runtime_set_active(dev);
@@ -637,25 +625,18 @@ static int __maybe_unused ci_hdrc_imx_resume(struct device *dev)
 static int __maybe_unused ci_hdrc_imx_runtime_suspend(struct device *dev)
 {
 	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
-	int ret;
 
 	if (data->in_lpm) {
 		WARN_ON(1);
 		return 0;
 	}
 
-	ret = imx_usbmisc_set_wakeup(data->usbmisc_data, true);
-	if (ret) {
-		dev_err(dev, "usbmisc set_wakeup failed, ret=%d\n", ret);
-		return ret;
-	}
-
-	return imx_controller_suspend(dev);
+	return imx_controller_suspend(dev, PMSG_AUTO_SUSPEND);
 }
 
 static int __maybe_unused ci_hdrc_imx_runtime_resume(struct device *dev)
 {
-	return imx_controller_resume(dev);
+	return imx_controller_resume(dev, PMSG_AUTO_RESUME);
 }
 
 static const struct dev_pm_ops ci_hdrc_imx_pm_ops = {
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
index 7daccb9c5006..7135b9a5d913 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.h
+++ b/drivers/usb/chipidea/ci_hdrc_imx.h
@@ -32,9 +32,9 @@ struct imx_usbmisc_data {
 
 int imx_usbmisc_init(struct imx_usbmisc_data *data);
 int imx_usbmisc_init_post(struct imx_usbmisc_data *data);
-int imx_usbmisc_set_wakeup(struct imx_usbmisc_data *data, bool enabled);
 int imx_usbmisc_hsic_set_connect(struct imx_usbmisc_data *data);
-int imx_usbmisc_hsic_set_clk(struct imx_usbmisc_data *data, bool on);
 int imx_usbmisc_charger_detection(struct imx_usbmisc_data *data, bool connect);
+int imx_usbmisc_suspend(struct imx_usbmisc_data *data, bool wakeup);
+int imx_usbmisc_resume(struct imx_usbmisc_data *data, bool wakeup);
 
 #endif /* __DRIVER_USB_CHIPIDEA_CI_HDRC_IMX_H */
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index bac0f5458cab..aa815f6d3fe9 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -150,6 +150,8 @@ struct usbmisc_ops {
 	int (*hsic_set_clk)(struct imx_usbmisc_data *data, bool enabled);
 	/* usb charger detection */
 	int (*charger_detection)(struct imx_usbmisc_data *data);
+	/* It's called when system resume from usb power lost */
+	int (*power_lost_check)(struct imx_usbmisc_data *data);
 };
 
 struct imx_usbmisc {
@@ -1009,30 +1011,29 @@ EXPORT_SYMBOL_GPL(imx_usbmisc_init);
 int imx_usbmisc_init_post(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc;
+	int ret = 0;
 
 	if (!data)
 		return 0;
 
 	usbmisc = dev_get_drvdata(data->dev);
-	if (!usbmisc->ops->post)
-		return 0;
-	return usbmisc->ops->post(data);
-}
-EXPORT_SYMBOL_GPL(imx_usbmisc_init_post);
-
-int imx_usbmisc_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
-{
-	struct imx_usbmisc *usbmisc;
+	if (usbmisc->ops->post)
+		ret = usbmisc->ops->post(data);
+	if (ret) {
+		dev_err(data->dev, "post init failed, ret=%d\n", ret);
+		return ret;
+	}
 
-	if (!data)
-		return 0;
+	if (usbmisc->ops->set_wakeup)
+		ret = usbmisc->ops->set_wakeup(data, false);
+	if (ret) {
+		dev_err(data->dev, "set_wakeup failed, ret=%d\n", ret);
+		return ret;
+	}
 
-	usbmisc = dev_get_drvdata(data->dev);
-	if (!usbmisc->ops->set_wakeup)
-		return 0;
-	return usbmisc->ops->set_wakeup(data, enabled);
+	return 0;
 }
-EXPORT_SYMBOL_GPL(imx_usbmisc_set_wakeup);
+EXPORT_SYMBOL_GPL(imx_usbmisc_init_post);
 
 int imx_usbmisc_hsic_set_connect(struct imx_usbmisc_data *data)
 {
@@ -1048,20 +1049,6 @@ int imx_usbmisc_hsic_set_connect(struct imx_usbmisc_data *data)
 }
 EXPORT_SYMBOL_GPL(imx_usbmisc_hsic_set_connect);
 
-int imx_usbmisc_hsic_set_clk(struct imx_usbmisc_data *data, bool on)
-{
-	struct imx_usbmisc *usbmisc;
-
-	if (!data)
-		return 0;
-
-	usbmisc = dev_get_drvdata(data->dev);
-	if (!usbmisc->ops->hsic_set_clk || !data->hsic)
-		return 0;
-	return usbmisc->ops->hsic_set_clk(data, on);
-}
-EXPORT_SYMBOL_GPL(imx_usbmisc_hsic_set_clk);
-
 int imx_usbmisc_charger_detection(struct imx_usbmisc_data *data, bool connect)
 {
 	struct imx_usbmisc *usbmisc;
@@ -1094,6 +1081,78 @@ int imx_usbmisc_charger_detection(struct imx_usbmisc_data *data, bool connect)
 }
 EXPORT_SYMBOL_GPL(imx_usbmisc_charger_detection);
 
+int imx_usbmisc_suspend(struct imx_usbmisc_data *data, bool wakeup)
+{
+	struct imx_usbmisc *usbmisc;
+	int ret = 0;
+
+	if (!data)
+		return 0;
+
+	usbmisc = dev_get_drvdata(data->dev);
+
+	if (wakeup && usbmisc->ops->set_wakeup)
+		ret = usbmisc->ops->set_wakeup(data, true);
+	if (ret) {
+		dev_err(data->dev, "set_wakeup failed, ret=%d\n", ret);
+		return ret;
+	}
+
+	if (usbmisc->ops->hsic_set_clk && data->hsic)
+		ret = usbmisc->ops->hsic_set_clk(data, false);
+	if (ret) {
+		dev_err(data->dev, "set_wakeup failed, ret=%d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(imx_usbmisc_suspend);
+
+int imx_usbmisc_resume(struct imx_usbmisc_data *data, bool wakeup)
+{
+	struct imx_usbmisc *usbmisc;
+	int ret = 0;
+
+	if (!data)
+		return 0;
+
+	usbmisc = dev_get_drvdata(data->dev);
+
+	if (usbmisc->ops->power_lost_check)
+		ret = usbmisc->ops->power_lost_check(data);
+	if (ret > 0) {
+		/* re-init if resume from power lost */
+		ret = imx_usbmisc_init(data);
+		if (ret) {
+			dev_err(data->dev, "re-init failed, ret=%d\n", ret);
+			return ret;
+		}
+	}
+
+	if (wakeup && usbmisc->ops->set_wakeup)
+		ret = usbmisc->ops->set_wakeup(data, false);
+	if (ret) {
+		dev_err(data->dev, "set_wakeup failed, ret=%d\n", ret);
+		return ret;
+	}
+
+	if (usbmisc->ops->hsic_set_clk && data->hsic)
+		ret = usbmisc->ops->hsic_set_clk(data, true);
+	if (ret) {
+		dev_err(data->dev, "set_wakeup failed, ret=%d\n", ret);
+		goto hsic_set_clk_fail;
+	}
+
+	return 0;
+
+hsic_set_clk_fail:
+	if (wakeup && usbmisc->ops->set_wakeup)
+		usbmisc->ops->set_wakeup(data, true);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(imx_usbmisc_resume);
+
 static const struct of_device_id usbmisc_imx_dt_ids[] = {
 	{
 		.compatible = "fsl,imx25-usbmisc",
-- 
2.34.1

