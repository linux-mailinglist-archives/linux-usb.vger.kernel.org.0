Return-Path: <linux-usb+bounces-4601-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C29281F773
	for <lists+linux-usb@lfdr.de>; Thu, 28 Dec 2023 12:02:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E9561C22A3B
	for <lists+linux-usb@lfdr.de>; Thu, 28 Dec 2023 11:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911EC6FB6;
	Thu, 28 Dec 2023 11:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="A2AhcMIV"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7AE63C9
	for <linux-usb@vger.kernel.org>; Thu, 28 Dec 2023 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZW71tz0ztN53TypgN8rs7PStkkQUYOWg13aH3wq0yXoussiVCOz+BBA6gW/8wcsVayaSudqO5fGHcNPcXOECB1xYQ95GtK7bTRkeIXm/F3IEBhwtbCvtogqkVOvPgZoaXPf0Mn3WJJFGJFyDRyHD8he/I05f8fMgcTm7qnNrygSG9pwW3/P0bd9z34Xz294uuNw8bNUcN3lS9b9yVvL1i0dvDpKcoyKRG6zraXHUZymuTpwFLfxkDbMh1FVefY6IlNxfxZ4E/nwjeTCZTjPfskw+/AIVbteJskVVBn0oZcsANrCxjr27PVN4Zrc5xhe15zpBcjRhlnpRrmZusZb5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkGgar2trgr8Akk6iT+7SOA6bKz7H5Cqb868zWwKx2c=;
 b=hSv9FrhEoVleXkw/I0fg34G49CbfEpsDq4ggVgIc774aNRC+DPmbgcqUSxAsPlhDBS+zQs6vhQPfarbHFhWMVhe7lgmTQDEbxrkg70ZVaVkUVp4Xxc5YdnnVphfggrlX7CPOPAPwShcOCrD0XWx4V7WPJ93zeow9ZD/xdf+dEUce617ujEDvEYPiLrwaUZk5rQrYG1KCxfXvh/YuoSkIqnDtxMpxjaKIEOItGK2NhtocjYowGFZo6dljNeio0vGeoSo1UhNgkvUc92iKZdNk/QDjBMH3Xlk4IVqSe8bY/4EWRtN4AdpHpT2YfqBlrzsH/1hpxYmvw0QtRSAUGz2mgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkGgar2trgr8Akk6iT+7SOA6bKz7H5Cqb868zWwKx2c=;
 b=A2AhcMIVsM+PODlWQCzIgylKXGQoN3MkkGiCmilq3L1RskVW/PlWIL7ytFJQaHK4E+o69wNeaKiHGLE2jFqtTZnVExOnpZBh3qHMZ3o1LeIvV9pCAOTUIO89XfxPuWq+eoYh22cvP9+jXZMXVSPs4ls0bEcHGYQ/2TU/esHmVcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.19; Thu, 28 Dec
 2023 11:01:52 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 11:01:52 +0000
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
Subject: [PATCH v3 1/3] usb: chipidea: ci_hdrc_imx: add wakeup clock and keep it always on
Date: Thu, 28 Dec 2023 19:07:51 +0800
Message-Id: <20231228110753.1755756-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB5146:EE_|DB8PR04MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4e5c52-20dc-4012-7415-08dc079465df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gyIM9xthS3ZSl5sFaO9sEmSbZQ1GC5pcatFsgfHQysV5JPDkIf1R6QyekNt2sMBcIeE7VUeyCp3I6rP750rZ9uDYNEJJrDyKDQLLc9kdo47m7NHM7Wb0LFYbGyquNb350c/H+460MrMOo3dBbVVeDdlWIEUFhkcqXhpDl6yHUktemizNsgO0OYxF6Im57BuUNuCBZ2aykMhjJeMayS07UHHP8XblsEaMNH2EzjKCqlqOc3Nfm3XE+ZlTc2dzil3h+3SQ21h2v4OBNC57l6oBS6g2G+Yqz+5rYBsTOxN4x3IQ9UX3P5X52Q6w2O1+LrRBAPct0Jb7mrBgWYojeuIb5u3EFcx+0TksWCaSoPLrtJ+QISGGasQpUe8Ucvrj4sBtwXEkVY2R6Iqfga4sYAqYTmRHLS3pxK3XGbk1saO63aYsM5xBGrJ451OTVJaTUpNbJ/RkqVtSlY1Ry/kWhEzZH3Qb8NwYWF8mnnC+LV6Blpou2qH/Gl8UIF1m48ku+WwBskD2q0dYePM078rGG3zldJRo6vaiEmFILr3aRDt/kpxdA1UTgQruzkkNGMujrNIZw72EppwPRiRHSSasdUq6S5XObNXv8IWRmS/+lkdKhybDm2AprdF1k/3mpExSjg9W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6506007)(2616005)(1076003)(26005)(6512007)(52116002)(83380400001)(5660300002)(4326008)(8676002)(2906002)(6486002)(8936002)(66476007)(478600001)(316002)(66556008)(41300700001)(6916009)(66946007)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GPdnfPih3IE3mmxkwH92E9jHCiLmBLGAWF/i1NZDwbwsamF21tmmMZP3AZsv?=
 =?us-ascii?Q?MdBCbE+9Oxlm2ISPUde5i47jAlCCyWn5m64NZViAyCmWW1dm/bP94Q3xTCDa?=
 =?us-ascii?Q?4CmTEfauxcaT0YNWKOzbh3gVZNUZI3Cax427CtNJVj+w63oQxcoVL3FZb8j6?=
 =?us-ascii?Q?+uoVg2qmvUHUG+PXMbu6IfEI2DVAsmCjZJaKRgBHoJE4FvTqYzTvfDUuWc2t?=
 =?us-ascii?Q?V/EEd/0lcJfF2we9Py5yPsPy4xaoQjgCS6DdwJ8QZlI9mzI6kNJpZ0c5a2ZD?=
 =?us-ascii?Q?Nzd4n/u7Zlu14tPNU5onkY8RSk5ft5DK6qJa+zTlpRC7RSj+NYVOStsOaXIX?=
 =?us-ascii?Q?yLJ8/lRE6i587oJJlp4JkyEc3L6awQ3vF0TNg8BKBrkZNa4ORv+TgKJM5jiS?=
 =?us-ascii?Q?aYZhD5u2OLal6Bqef7XdQHW/CSlpHY4poGY+LUCxjQ0W8EVWrKoiOF01+ljC?=
 =?us-ascii?Q?sY05CJXjO0SHlbCfElN8Fbx9e0DO/sQXs/oWOMhlq39ePB3Cx5Jo8yjO+yJH?=
 =?us-ascii?Q?sSPg1NkthrZZ0Su1X1Cv8W8G1WMsWY3NeLnv7hO3ui0PQDT0B2ax554NHsfe?=
 =?us-ascii?Q?ZQKSiCQZ5tkTzENPwuV1ZpzAxxgFYjF0azBU7pqlsMazEBa774yDCMwH/sCU?=
 =?us-ascii?Q?nZAhANNtTpBf2zxq6TOJKWxnhQ1/BdbDyFB6CJfVik/eSCefu8S3PVSH6/RK?=
 =?us-ascii?Q?XzRIz6eYw5yMIYVJMP+I7AVGntuT289u65CN9571JiGqJISGUzRVvDjXFZVc?=
 =?us-ascii?Q?HkOAelCcbJ4S8dE62hywmSFG2/isdUYPsUrk7O6O1LTcSSHXS7L454CGiRZ7?=
 =?us-ascii?Q?XbAMqp19JZRJwmsXC3HIVQC0/G7t1JudaZr5gYFSFJegw6yhBiGX/zmrIlmo?=
 =?us-ascii?Q?6cjL4ojlGIivsqUlYct28kPzVbE6OLP2j3nN9cCifDaVm3Ui7XDxXtFFzuqk?=
 =?us-ascii?Q?hYtXM541YEwZWSEUM764jx7CSMa0EO2gT3NHrm0EnkQhNVpcKHl57pgug/Kh?=
 =?us-ascii?Q?gcX0H9AZ/UctRBudzZDjRqrxlH/0nfqJYyDgZYbbUX6S7CqRpKAGgqGDxAv/?=
 =?us-ascii?Q?FdBF2DGdMdLB/zSpYX5iIlnp+zEw2igiUMTzMkFIR7WweIpvGHGFMvKP2ZPx?=
 =?us-ascii?Q?Sr2chfj1zscGeD8BaLoOqJrmU073LJ+g688SNdqJFUTmJ01q8Pt2Tjj8TRGI?=
 =?us-ascii?Q?2YXigIP14CqhTkOgv5jWXFlaPr9UvAwRYFlWMjQhvQBtQdVw/Dcvm/EQEoA+?=
 =?us-ascii?Q?L8L7ce/1j8PhkLLabp8RyHCPwxpijO0j4frGDQAcWZQ1rr4Ipa8Oh6NorlRV?=
 =?us-ascii?Q?sIAdEyuNf3VA0L6R25f2F2kiUO8pPRFBjHN94KLyZhPWLfV+OdNL35X1RAod?=
 =?us-ascii?Q?A/b5bG7LSBocOiGuUATlJydy49SZOVAm5u1UlRkCudaNdkUgeZEnWUwOE1wC?=
 =?us-ascii?Q?toGz8PSuhJqyiEtkFkCqBWWyX33fBeT4zYx9lJ5vx1OdVeOchfq7D18Zcv7E?=
 =?us-ascii?Q?B5lqyusmuq3WUR8gLZhyXAP+34IUJFAs1K5xQAC1vchHemFWwHxfpAfJVNJq?=
 =?us-ascii?Q?+/q7YOKGYnucbHJV5YO8QHCQlXzAEEOHkNiQL6Mc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4e5c52-20dc-4012-7415-08dc079465df
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 11:01:52.8776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTXfZne05DvXhDt/J9CWfme54MO1DF4s4YU/PTm9FZSwT4mAJI5YA49rkkt9DgkWuTZpPg4KGo9aG9OqlUZlZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6795

Some platform using ChipIdea IP  may keep 32KHz wakeup clock always
on without usb driver intervention. And some may need driver to handle
this clock. For now only i.MX93 needs this wakeup clock. This patch will
get wakeup clock and keep it always on to make controller work properly.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Acked-by: Peter Chen <peter.chen@kernel.org>

---
Changes in v2:
 - modify commit msg to make it clear
Changes in v3:
 - use dev_err_probe as suggested by Stefan Wahren
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index e28bb2f2612d..ae9a6a17ec6e 100644
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
@@ -208,6 +209,13 @@ static int imx_get_clks(struct device *dev)
 				PTR_ERR(data->clk), PTR_ERR(data->clk_ipg));
 			return ret;
 		}
+		/* Get wakeup clock. Not all of the platforms need to
+		 * handle this clock. So make it optional.
+		 */
+		data->clk_wakeup = devm_clk_get_optional(dev, "usb_wakeup_clk");
+		if (IS_ERR(data->clk_wakeup))
+			ret = dev_err_probe(dev, PTR_ERR(data->clk_wakeup),
+					"Failed to get wakeup clk\n");
 		return ret;
 	}
 
@@ -423,6 +431,10 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_hsic_regulator;
 
+	ret = clk_prepare_enable(data->clk_wakeup);
+	if (ret)
+		goto err_wakeup_clk;
+
 	data->phy = devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
 	if (IS_ERR(data->phy)) {
 		ret = PTR_ERR(data->phy);
@@ -504,6 +516,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 disable_device:
 	ci_hdrc_remove_device(data->ci_pdev);
 err_clk:
+	clk_disable_unprepare(data->clk_wakeup);
+err_wakeup_clk:
 	imx_disable_unprepare_clks(dev);
 disable_hsic_regulator:
 	if (data->hsic_pad_regulator)
@@ -530,6 +544,7 @@ static void ci_hdrc_imx_remove(struct platform_device *pdev)
 		usb_phy_shutdown(data->phy);
 	if (data->ci_pdev) {
 		imx_disable_unprepare_clks(&pdev->dev);
+		clk_disable_unprepare(data->clk_wakeup);
 		if (data->plat_data->flags & CI_HDRC_PMQOS)
 			cpu_latency_qos_remove_request(&data->pm_qos_req);
 		if (data->hsic_pad_regulator)
-- 
2.34.1


