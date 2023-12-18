Return-Path: <linux-usb+bounces-4295-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 314A581663C
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 07:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A200EB210F8
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 06:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBFF6ABB;
	Mon, 18 Dec 2023 06:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="kn6ijUOt"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67446AAC
	for <linux-usb@vger.kernel.org>; Mon, 18 Dec 2023 06:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kggh/Xea6hYjnD3KIrQltfa8Jxwo/ifdX80kLZb2zIAbY7n7uySI4YHwzsITk9Nx0ttvGGx6vyxne6wgr7GbjcD9U4WsSc8uvaNDqM1KQcZWf5EZeKXAGDrLelD5N5gHTk2hye3NI+1UbdVJ6ojs7LCjNyOqNa3kE/zHdafcfPbhM7OciikB6x0JGSrphjW8N1CSfuejmbJSI90vvIwL8BGCXgXywHxxevOmke7ithUP32vGp9UXMoszJ1L02SKI52S+SsdKS3Kiyjhzhq6xt89R2aM44ggf4Jz7aySsw/Dy1NqfaRwa733adG08wDa5rv4z6IKEYPZ3YeFzr4NLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpNZMM6p3e2KyODfyRjiHxqFvOz20SVXar7IjcUGE7o=;
 b=YAD1l6ZKqPFX7ivmN+0owutDrtlVNA7AGtr2Mv4/z8M/A+qls/sLBRppeMkN1ctv4WbC3t4bd+BFfE/nYoT7zlPAen1hg4Fr6yO/RcvH5D0R3pApy+5LqxDP/qZIwprn9pPm1/txvOyeFOxXZPm7yAE77sBTVZO+W3mY7YvFVtnsVHOgd/dbUbm6onjOGYyw2wfAngeLaBb+apOeqNs+DKZ9xBksb3GYAIilbq8TBRZeyWbzCLwkBFcMFLtDJ8yuPZD+mtYy0DPhcsmS0znDoK4vFNi0OJao9yFBAciYSJBfBEo3Tdu8nhwtUXjmvZ6FT3UeD81cKvcin/hJH4qcJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpNZMM6p3e2KyODfyRjiHxqFvOz20SVXar7IjcUGE7o=;
 b=kn6ijUOt0GR2mH9WMf5letrxPW601FDVXB0TddJuQVqXUfAOIFzJw+KzuagF6285/xS152qItfNAVVJ1xDAIGcjMSK3LNtlnwOHpurxLe0XIW5esEO2S+POn019mobEqMcilovQkOulFshHQa/rb0oj2PQwRwg1/u2cUjGkWl7U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by AS8PR04MB8625.eurprd04.prod.outlook.com (2603:10a6:20b:428::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 06:08:26 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 06:08:26 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org
Cc: gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	luca.ceresoli@bootlin.com,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] usb: chipidea: ci_hdrc_imx: add wakeup clock and keep it always on
Date: Mon, 18 Dec 2023 14:14:18 +0800
Message-Id: <20231218061420.3460145-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB5146:EE_|AS8PR04MB8625:EE_
X-MS-Office365-Filtering-Correlation-Id: 5129f9f6-f7b9-4152-183b-08dbff8fbf6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nypote94KeBsqKO6jhgP+bwCN4arNxGE0u4viOKHM/Uicd7ZpJBDCM/HAEI/alBWZVORaHib/lkalftf5/pq20n5NUrcjkTt41H+uKzPAtZ8hK5fzH3GKTVwu5qena0TrDh1UkEAwLST4LwaGoqB7KKTsVmA5MhL18NV3kfVKw6CSDyot0+ivd0KIliCGWcGp/tXHewy2UW+ny+yxBbztuwTxAWIy/ef2p5wgFTKFqLmga2QQ9RHJxRpuGH6Jy2j0reyC5VYifyo1wk+YJMuCfk6iBDh3Jmh9DXHMeVujnb3nlbdnO1syZcxFZBC0F1Rg2jwwvscJdD3PDj3PQXVBGkGYLG2LZ4Zx/IzaAYKoNe4RnhNoRcmN2mhfSEVJizwl5kvw0KAzqO98opvwMasVdbYhaEReCCOf/y93o2pF4qWyqiyzmTEFPC09p2+pJkTjFkcBXdIu3VApkc24bySG92iX/vb6e85IKyBAG+Hwr+yShvds3njDzXP9s4AuMTmH7DpYO+1HELxBxbO3x8kJm0llIE6/dx3+plaw9jeDGXWUKpqRQnP/glPjdMJmmgeschAyKpe532hPE8IpBw7nW897Qb06+JuSFjuSOtlakRQpY2I3r3mO5kTxTozJFOz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(346002)(376002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(1076003)(26005)(2616005)(38350700005)(36756003)(86362001)(38100700002)(83380400001)(5660300002)(6512007)(6506007)(52116002)(6666004)(8936002)(8676002)(4326008)(66946007)(66556008)(6486002)(316002)(6916009)(66476007)(2906002)(41300700001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LdJy6rQgwhC27xHU4JfBaWnQge4iPVZudT4tYx9vm8LZFD/oiJtS8YTBGSbR?=
 =?us-ascii?Q?Aw/Bm7Xo48jg1YdIfS453wYW5nG2xRAapmzqXbZ6ZQpQnjJdqkxZuZissWI9?=
 =?us-ascii?Q?CCaBzX2DWuObZzAHoZHOrH2zUEFhcsXi10/+nWIs0wGiW/fa2AoRxcq2Meo2?=
 =?us-ascii?Q?Bx7Ifz9pHnZ/g8PrMVCIub3AvQuGRtR4SVM2doPhBqMJEeqzmqSBKM4F+Fev?=
 =?us-ascii?Q?bPK5OnKW1+qWNoCxCEwqcZrhD0nzwUnZrmiu+qjLCIAZ9PunT7PupumGFgNG?=
 =?us-ascii?Q?/Wp3xRd5GlvW1+FRR60MRGNh8cwReCnbx+B1Q0s8KRGcA0HiAqu9Xa/EA/nW?=
 =?us-ascii?Q?+AgZHtUr/EUTUDRJ3vKyJieyMQn/4gPCvWlAvLA7M6No1q0Zf/g1b+ybrdKt?=
 =?us-ascii?Q?5yMUYCZ9QkXqE0+s0UEvUq8z8M95Oe8P9FHuBL7L3fZgjsuQMdDjI2xLVg1o?=
 =?us-ascii?Q?Iuylk89p3UIwDW3SO7uBRRA4SsTQJD6IxZdcm/fq+76/Z6e4uZLbjTJnmR5j?=
 =?us-ascii?Q?mOHjuKLTtAJXDALk4BxiWs4m0gVUcWJvLwxnRlZ2tleXLG0hj+dJxdYR24gx?=
 =?us-ascii?Q?oZ3fDu1+APgd1PCTuc5h+7iXRuXQ3cciVrm/R9s+jzsmsIO9/Cs7/bqIco66?=
 =?us-ascii?Q?uoHN3JAp8BsfK0UiNkX/qF2fo69L6Zl13JE/Yxwl9a4n+cT9KFlJT5Po8+Fw?=
 =?us-ascii?Q?VyLbX4FQx0rhlvbYRmuo8vsGES4d4IUsBHCXTPUI/VwG12qMgtt+EaDMurfc?=
 =?us-ascii?Q?Oi+W1XLa3b/XzeEhNOQrpgrqkm64v+bwBWnjNmJSsW9xaWY8UZsH/sMYxV51?=
 =?us-ascii?Q?ELA0dEkzon99GZ6zqEFWG8cIKONCbEBb7AGUMjsDqP9qU7U6D0SAOq9wvM4N?=
 =?us-ascii?Q?90zX0dl0fyrJXuo3Q4anG0DzA3pJlmqcIbAP8FmjnlhWAzRl7wptbGUnEG4i?=
 =?us-ascii?Q?kNCccrJ9EVwPRo5MFcUF+63PaPZmfTYIPKh+XqFYcIkkwqHAgIKlTdnFmBdo?=
 =?us-ascii?Q?xjac3kYOXx16B+D5tdCKb/MhtHbu6BmG/fRIa+IHf+enTb+HVEO+r8+ENp2h?=
 =?us-ascii?Q?J5MC3fR2oegQcnNEp1UuH3xGVrWA62D3gy569JVp9XeQyKzBPwYqgE3zQZ37?=
 =?us-ascii?Q?o5YmsjEFHqfvF6y8j/vIFraBC+no7rwPEoN8Yp64y07PB2kDHznYFf+Fg69D?=
 =?us-ascii?Q?mZ2H9RIF9n5IzBjN2JfcZ2++FkiBJoNgWozt+/AYu50U/WPWc0Sx1okIKaaR?=
 =?us-ascii?Q?pTFEzb1rYchBG73lbwsIm+LUS2LHsDV0fUstxdltlrTeZSOrT/MvcwrHfaCy?=
 =?us-ascii?Q?cIuLU8995Iqwz+vTFXDUaJ2GTc+bWqNLN/+pT5J/9l8Y7xvLNFd4ekKbe9co?=
 =?us-ascii?Q?CRIaUDYCJvXT9UB2aTT81/nZYFN/SEWbSFEMFt6T8caobz+ioFXJwXu4YU4/?=
 =?us-ascii?Q?gHkJbi/yL3kIgvfFWm/mUd/B5DV4DgREQiGiDd5eXe7Tu4q3MauebwSHXafE?=
 =?us-ascii?Q?c0nhZzBYfn1p7Nc+nS3pTwFaHtpI/qPck6dhz1DAO+tBxJHgMOhezjHZuIha?=
 =?us-ascii?Q?MM3gSCosh5oAAPkuKtQ9/sH/FBF2MWWHcQIVu8t6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5129f9f6-f7b9-4152-183b-08dbff8fbf6b
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 06:08:26.1969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTHIHy+HRR16R0FkuFVQUVaT1X2NfvNgPhbsSsr2hKCj/IJ/u2LRxhHq55Rf7kKQXZtCZEZFEI7fNJcE9k9/sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8625

Some platform using ChipIdea IP  may keep 32KHz wakeup clock always
on without usb driver intervention. And some may need driver to handle
this clock. For now only i.MX93 needs this wakeup clock. This patch will
get wakeup clock and keep it always on to make controller work properly.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - modify commit msg to make it clear
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index e28bb2f2612d..4330be8240ff 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -96,6 +96,7 @@ struct ci_hdrc_imx_data {
 	struct usb_phy *phy;
 	struct platform_device *ci_pdev;
 	struct clk *clk;
+	struct clk *clk_wakeup;
 	struct imx_usbmisc_data *usbmisc_data;
 	bool supports_runtime_pm;
 	bool override_phy_control;
@@ -199,7 +200,7 @@ static int imx_get_clks(struct device *dev)
 
 	data->clk_ipg = devm_clk_get(dev, "ipg");
 	if (IS_ERR(data->clk_ipg)) {
-		/* If the platform only needs one clocks */
+		/* If the platform only needs one primary clock */
 		data->clk = devm_clk_get(dev, NULL);
 		if (IS_ERR(data->clk)) {
 			ret = PTR_ERR(data->clk);
@@ -208,6 +209,18 @@ static int imx_get_clks(struct device *dev)
 				PTR_ERR(data->clk), PTR_ERR(data->clk_ipg));
 			return ret;
 		}
+		/* Get wakeup clock. Not all of the platforms need to
+		 * handle this clock. So make it optional.
+		 */
+		data->clk_wakeup = devm_clk_get_optional(dev,
+							 "usb_wakeup_clk");
+		if (IS_ERR(data->clk_wakeup)) {
+			ret = PTR_ERR(data->clk_wakeup);
+			dev_err(dev,
+				"Failed to get wakeup clk, err=%ld\n",
+				PTR_ERR(data->clk_wakeup));
+			return ret;
+		}
 		return ret;
 	}
 
@@ -423,6 +436,10 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_hsic_regulator;
 
+	ret = clk_prepare_enable(data->clk_wakeup);
+	if (ret)
+		goto err_wakeup_clk;
+
 	data->phy = devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
 	if (IS_ERR(data->phy)) {
 		ret = PTR_ERR(data->phy);
@@ -504,6 +521,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 disable_device:
 	ci_hdrc_remove_device(data->ci_pdev);
 err_clk:
+	clk_disable_unprepare(data->clk_wakeup);
+err_wakeup_clk:
 	imx_disable_unprepare_clks(dev);
 disable_hsic_regulator:
 	if (data->hsic_pad_regulator)
@@ -530,6 +549,7 @@ static void ci_hdrc_imx_remove(struct platform_device *pdev)
 		usb_phy_shutdown(data->phy);
 	if (data->ci_pdev) {
 		imx_disable_unprepare_clks(&pdev->dev);
+		clk_disable_unprepare(data->clk_wakeup);
 		if (data->plat_data->flags & CI_HDRC_PMQOS)
 			cpu_latency_qos_remove_request(&data->pm_qos_req);
 		if (data->hsic_pad_regulator)
-- 
2.34.1


