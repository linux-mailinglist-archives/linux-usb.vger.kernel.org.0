Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 150375FD570
	for <lists+linux-usb@lfdr.de>; Thu, 13 Oct 2022 09:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiJMHNB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Oct 2022 03:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbiJMHM5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Oct 2022 03:12:57 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80049.outbound.protection.outlook.com [40.107.8.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0173F1187AE
        for <linux-usb@vger.kernel.org>; Thu, 13 Oct 2022 00:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzOxKGkuCicNTtPcViPETRNu9aaaFeRO9cLTtCU/8gMcv9PI0vQ+tvc+uFxo1dlImzi+7oauVJ4pYn++O8wT1vnxiJ2GsYYi0YIGWHvY9GwsrUtCk6RJQ8sK3kQIZTIckBZXuN7jG38mgs8Nueaz/ltFiJLLGkTLvIB+KhzRU6MHI0f705pPkmQrNNURvw4uEpSXPnW9Lb4g9qRjuahNelI1hsdNXMqNOZBwo1VV0MtdtxNKMWI6/eyT4M0njCa1a6dGp5ZuPQemQoxDvAis8nQad0wLjOXCmFPeUGE8h61TF+vS5x9q1YeNwbSYN+EZQtbaJgkXKsK/DJwOms4lTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8j0LSJQe/oq+ZD9WEaYHaXW7MkzkP0kE1x+DT7vmTtI=;
 b=H2dlJbXybxezWjDnIWrmujF9iuCWRCJHJQMJkPlsKsrAMCPLTI1O5vIbbUe/8qjO7QwE2WUs2+4OKc700qlAUFn0/biUr+AsNIkPac6ex/mUi21XAu3ttkPZatEt5RgtmGAmr3COYlkOXZcggPfTAZqd6mJCrsoV9OmhB1GaCyItVJ24zsgcDtz8x1OnlOEqo0I7WrAoisBvC0hE7fQ1vQkS2NaWiI+7cphvENhJeYgHfj+vihQfKvY7EQuqJnuRjnBRSFce6vZVIScBDbVQZDnVS0Nv8WM6vGLVQ8neUMrI7wFyTkaygkdbDnZ3HyS87w1nPA8VxvGShe0rur1SDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8j0LSJQe/oq+ZD9WEaYHaXW7MkzkP0kE1x+DT7vmTtI=;
 b=L/Q5+zz6aBzJY8urr+N/2oMm4Nx0t03aPHgc+UwBv73+H9Y1Op6bDWoH1VVWmD1crvRMgkiY+A9DGbUsg/TouB9uSxhDv9BszilxoIS1nZC/jk8jg+Fhnqy/yFcKi1r7UfyV+FlYJuTUQ7mZWL4XgiDJe79bF7qppH1fAH3iBYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by GV1PR04MB9151.eurprd04.prod.outlook.com (2603:10a6:150:26::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 07:12:51 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 07:12:51 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH v2 5/8] usb: chipidea: usbmisc: group usbmisc operations for PM
Date:   Thu, 13 Oct 2022 23:14:39 +0800
Message-Id: <20221013151442.3262951-6-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 55bc7df6-9aeb-4d7b-0c5a-08daacea56d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jge8G/xd3e3d/97MS6q4LswgVKsb3/DR1otSa6TIqzvD0ixDZZITmxLAJukhdkSwOryYkL9R1N1lbVGazEwM1W7ySH7rruf+78dHanbn9b6igEu6NHP62s5pQScmd1BhslNeJt42r/Oo4TF+6+M8XNpjr59qbE6LaHuu/g4TJVmelNzhNHLYLStd48V75YBrkuCF0Xrw3Y1c1cEien0fSBLf9IUYfVK+8Flp0EI4ya9RC0yD0Z+2SKyD0YMOZk/H8PvP00AMALSiCerYLV0EvsP64QEIp4F4b11f+OVu4r/b3rbIIbuNJcgU3IClVITTjNPR2HDl4toJjtwTodiMhN+XF9sve10kisGhWz5h/iMjM4ozUwp9sii/hkyGVGzOrDfbijR2LD2cl22i4vMWse+PIEm2V26P0bDY2jvlCxBf/IREgazuPW9diQoI47wSfKcq2v++6srg8GrtpTWUsWF+SUVKrM4HkVQCfelw8Uu0LfhWQ1WRTEUClys6OkAyQ46e6qLUbkIXoqS6PLbnJvp7QVYBOeuRG3pkuArVBNUMLJiRZeDuNShPXaHsFnKD2AOSX3irwXVul8FIxDRTfOd3chyCiHN2tmIp5Is2OOiV0UYJHbq2QHuL5GkXaBPiPBcNA6Tpqy1EZ5cSTi9piAwyqV4WJhEAv7yaj+ZSXzHHWtiATPOj356c5jcFkNU0wV9mY8HJ7hGYxm7Ys//eGvonq5+Cgvr+bn5NVnWL/5ka7IAMms6YWnuYDAudpopJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199015)(6636002)(316002)(38350700002)(66946007)(8936002)(38100700002)(2906002)(41300700001)(4326008)(66476007)(66556008)(8676002)(5660300002)(6512007)(186003)(6506007)(52116002)(6666004)(26005)(1076003)(2616005)(83380400001)(478600001)(6486002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uGFnbkWUHcb7OWRYMIsRwmpYvF1GhH4QFFdGjqGDbA0Vu9XW+SoGgUZkbPv+?=
 =?us-ascii?Q?RGQlz5zLGu1zvTZ1oY8xfwCSsw/SDr3X+//p/6wjgU0m1oWOMDLNfgbEPSsp?=
 =?us-ascii?Q?Kgk/p6Rm5H0ocXTYVzg4xAiW7UfMYnNNlbZSW2fKvuyMrUWHtmxgwIcxyaQF?=
 =?us-ascii?Q?3lHAMGU/hZvBtAq4Ob7Qzm06qWTIv9JcfMLb12hdaS4mUuo4pgepmQjMaBRF?=
 =?us-ascii?Q?Vh9PqbnwYh0Bdq7a8wZZpOA95TVN6knQ0shsmYDEQDEPwnHSSzCuANB5so3a?=
 =?us-ascii?Q?T54CzovfpUdZG4fDAPBHlEGkjjvfY8gEac+YKh/3EpGbFTDoxNgKLfaAXKBO?=
 =?us-ascii?Q?zDV6/IjHNVXn/33Zfpw3nZqPb41VjK6J07dLywn6mS74qwwnrFghaWh7wJad?=
 =?us-ascii?Q?c4u3qKCl8iowaWwFk/S9XDQD+8X3Gf/L+ej4rWg+81B6Kj2wY2XVjwTQVMMH?=
 =?us-ascii?Q?a046nLG5HQeN8AMTr4KMcDQrXn38g6aXQ8wY4QWEOjVZ9bV6YvaHKxqHNqDK?=
 =?us-ascii?Q?O0CaydyglKCvAu/IvTgVikfeFk/GPIUU01/lWOAsOuKWm6bHpEp8R042P0A9?=
 =?us-ascii?Q?caiFN/wsoqcWJ9Zf3z5W+YxSmCfW3ZrEVr4C6AehSdFw9gc92wzSx17nZQ4x?=
 =?us-ascii?Q?pZIHUW6IWd+xw2pj6XewvU7/ujA5Kx4dAC7LGsbTN93FNqexPCqs34rw0BNM?=
 =?us-ascii?Q?kV0UxvFFlDvqRLtj8gxFC3GZUGyqt12I9dZ27E/u+9Pqn+jt7oRB39oaNXDc?=
 =?us-ascii?Q?K+2ZUpZl/YVBFz4Gtr5NcBud3sWZB0Gz1cKUJzOMyupRE4LyVgZPM/0YhelZ?=
 =?us-ascii?Q?/62ROSxLkqtZ+1OnZexqdLpPbg/2DqZG+xsQBu/+cXCJg0IHQHDL3bNeeQp+?=
 =?us-ascii?Q?+6OjLGpJWDRFSpnou13JJf8PXfQ3+611nzNHBv2tX2ej1tFfvLeTIzVISWLT?=
 =?us-ascii?Q?JNVtQx5pNpqGl9nYuBaKwD1xtqjHn14zFeMdt0hGqSGfxm5OogTd4FDqlA21?=
 =?us-ascii?Q?cdIzya7yXnaqvket0ruKxDtKtQBfKhZVajCuX3J/YKVdBL9rluaoNht/Prne?=
 =?us-ascii?Q?bwdEvfl2OsviQlkJCLWwmbmmLSFQkzqqNerYmjmbxBI2wFV/5dz1MJsumXy2?=
 =?us-ascii?Q?dxC0X3+KMg4K+w6I56aWRnGcw46ZG1RdT0/4vBio0FA/K6Zl0nzes7R4fiSN?=
 =?us-ascii?Q?5RmyJD8SFA+KeShH020pmaU5xhgLxO0xv12mWjhaY6F7SMjMDDw4X5uoWNmX?=
 =?us-ascii?Q?eMULhV11PX9u43x7PqnuEnKrFntsgNKBxvB6TIjqYuRVqCkOf5grre4QYuWT?=
 =?us-ascii?Q?yilmIqrXBMVgElfWAQQ7FaHLsKHK2/WNaV9jjeEfls9ZUiZw6B1B/0R4R2Pv?=
 =?us-ascii?Q?Xd9TOXwqfvIlwP+tTheazeiYyWEZl/afHBcljneAfWFmZ1lcW28jZ7E5RM6Z?=
 =?us-ascii?Q?pTDy+4NhlCCXqyf8Yr2npoEcVRVpocNAhPQqSUkd4Bg9j70QFx8CDb+aEa/E?=
 =?us-ascii?Q?HKDPQV89xU7GqKy1oi1x0OaNUjqg4HjFp5N/VuQNVP0tbHCXcpdeFz2gVGjy?=
 =?us-ascii?Q?sXdP8oB1XtReaWsjQr66lKfbYX/UjM/bdwSJ17PP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55bc7df6-9aeb-4d7b-0c5a-08daacea56d9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8777.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 07:12:50.9840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWNOsJQCeucHeyXVY4/WMvclfOuQK7fkHfKGh7i9KGIZlY9ZVpX9tOYtvdI6JFRw9MAeiD5WiNRWwpAGeNHkzQ==
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

As there maybe more APIs of usbmisc for suspend and resume, group
them into imx_usbmisc_suspend/resume. Besides, introduced .power_lost_check
API, so that proper resume operations can be performed in power lost case.

Signed-off-by: Li Jun <jun.li@nxp.com>

---
Changes since v1:
- No changes.
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

