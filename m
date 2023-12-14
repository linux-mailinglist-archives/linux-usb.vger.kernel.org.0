Return-Path: <linux-usb+bounces-4153-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78081812E6F
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 12:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DDD12823DA
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 11:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC533FB1B;
	Thu, 14 Dec 2023 11:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="NfZxA0UW"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2071.outbound.protection.outlook.com [40.107.21.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C10B9CF
	for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 03:20:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzuoOX3zXU2viL+PTsWQjP2Hj6NXKCd1cIIX4gvHIFgO+DQbhrFJVdF7660MDwQhatD1LlJv9N356ETdy1sJpjpz6ONhKrhnoId79meMCWaAD90E2o7UCZ9ulEYHTw42QWx6XugYtBNHMn9E38ZckQBsTNBH5R+U6EXVk79VWcOnXNOwUbG/19Irl0G67AwfXwcl/L4+9HWeT/YdIJA+t/TE5etFKQV/t8ov3simnOgRhp/78fr+rcNKbcgTc2EKvMe+6/dmh1f3Tlh1vOEB7fztBAQ5CxPqTwVgFR+Y78N4Up8l/lfJTH5/vTd0IoykmtG02i1+R37iZCPzW15Xkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRYjOSWvYDSkXe8mHjVPBGjF60MyLLwJhilw8Q/vfMs=;
 b=Ygb9vIa9sZxMMZZLAmMaG33Mrll7zt/Jc4VLkrOyyAh7WUbeB6YReJdqxKeL8MkViWcxrQd80pTo8iZrjbjBWDIPrUeY+X8pOzZztn1YJ6dl/yk2kKkfPVjdnch2g5szACzgKiJI06zfEqHxYlyfMBJ4UZexZim83XcUGQh6mHqfftqtdAVn8RdBgkbwblB7SmZq3VGkc+8AZifbI/QvtKiGuCkVx/wez8P+T3OhlYgb+AwBXxszwqJwocBoYLPqU2XeYKrLecQeZBzge3F/MeqZdnGZBHMgFAW1JvVbn5baSoxc/SdGcWEqZq+0WzBy20NCz7eST3ACXe7+B7ifWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRYjOSWvYDSkXe8mHjVPBGjF60MyLLwJhilw8Q/vfMs=;
 b=NfZxA0UWVLcZiHprFjsvXpOM7YPyZL+Atx2HxaLV0KyZzHGf+dXQWS/j2UNCUW7sDF4E2gMhbltau+1eXrZDaNOBezvnTsE1FV1iHCzz/JHkN5haefCyraRItYAHfLd1SaUP4CYKQLVz6oos0PupiRlMvrOy9zIG7VwLd6KdZkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5152.eurprd04.prod.outlook.com (2603:10a6:803:5b::13)
 by AS8PR04MB7880.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Thu, 14 Dec
 2023 11:20:35 +0000
Received: from VI1PR04MB5152.eurprd04.prod.outlook.com
 ([fe80::577e:f2c6:9d67:f89f]) by VI1PR04MB5152.eurprd04.prod.outlook.com
 ([fe80::577e:f2c6:9d67:f89f%7]) with mapi id 15.20.7068.033; Thu, 14 Dec 2023
 11:20:35 +0000
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
Subject: [PATCH 1/3] usb: chipidea: ci_hdrc_imx: add wakeup clock and keep it always on
Date: Thu, 14 Dec 2023 19:26:20 +0800
Message-Id: <20231214112622.2412321-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To AM6PR04MB5144.eurprd04.prod.outlook.com
 (2603:10a6:20b:a::32)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5152:EE_|AS8PR04MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: 873a3786-caea-4f57-03b2-08dbfc96b09d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FBit8rKYEp2tXgUo0BIzx8WSNSDmmB5Qf9sFEkrAx0MWwiJi1DdpvzGTjfbm4zWTUx0lX/x936i4wdL/Ju2n8BdIrkySsLms6Dh34rfYjSiGqOIAsC3ykZtrQAB9hGChkZax2mEAiiC7gt9TV2jxQ5/f0roYgWYj6EPSwTJi4oIeHG7uTrKbXx2NSYjfFofvXbuecxY1niMngzjaRMwgATOhYe8ZZ0chB8QImEl6bRwCmPVd9RE4L0oexcFLKdAII/Ghq8q+7XAPjqjLpxb6f5Xhi5GqN/my5nWLHVQWHq4guuShShdQn/cXxAatmRI1uhNh9FYhTzZtIbSDoM7tW2i9oMUSyFg0pzf5L225ehWFA1BZgaT11sHqldbdGfezB2coU253pfBNprPH2H3bCfowmT5gbnSr5mvd5wJvQnTYYXwbV0rlzaZSbDN7Eb/1fHj8eI10KQVhY76mXal/lcw+ruo3dP7QblnQlvcF4IrQSDDqj4w/bRDUmAejIjk72Jn3QSBALzTobsTEnIGsR08JVTV3s6Aw5FUuXepucWiX+99fi+8VBaKXrdioXiODTYAfCyAT7tyiLlpz72ipT3mdmObhvhNF7kf4AkPRO81C8H8VojvUDFBktMUb4SUD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5152.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(26005)(66946007)(6916009)(66476007)(66556008)(86362001)(38350700005)(36756003)(6666004)(83380400001)(6506007)(2616005)(6512007)(1076003)(52116002)(316002)(2906002)(478600001)(6486002)(5660300002)(8676002)(4326008)(38100700002)(41300700001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EupdhgCGwtcTSHVENCFtHNCm9t7RjWB209pLGmS9FQIpuWDSafW22zo/smhj?=
 =?us-ascii?Q?zSsidCGjgPffiFd1tUgz0N93jHNeJeNfN5ZV3zQ5wl/oR5Xz4Sajt40FlvI6?=
 =?us-ascii?Q?O5toqzsboIOLbHYt74Mw0fQcFnq2xiOzpoveCWmNi1YlkoFM0ZaaEx5jNXh2?=
 =?us-ascii?Q?uhWx54FlnrJPWOJ7E7hj7uvm1r02wx1mDqVZvW1TB4b9GG1aC7DARpkvvPlX?=
 =?us-ascii?Q?mW01Lpby6EbLtUuyh3RHgpWfiaPCKLhJ8RbqtrAAP7AqPHUwZd4ZxzmkQ931?=
 =?us-ascii?Q?GcWsKzbOD5TI6z3ujJfJhf3fA7IxhoArgHtC6GKbbfn2Dv6Haudl14yFoodc?=
 =?us-ascii?Q?CWPbH/L4WQcbnaU2K13mncsiv62WvIl6OkY3btkvfjRiQKjqW+JGVQt+yOtd?=
 =?us-ascii?Q?e2Bd8JdeKotYDv9CfIydbuiQXf1R7Bh92Tf1/s01ivJgb2dwkLiLjEsNIdsG?=
 =?us-ascii?Q?N1mqYM+Cal5n1U6PWKnlEFZ+ppK3SSi/dRGMSde95pAXL1HdnewSAKWNOEho?=
 =?us-ascii?Q?HM/RzVlix+92glXXDrWvYckD6oiZzWOCOhqUUMqxzX/sg6QBxzOvwulMXnI3?=
 =?us-ascii?Q?BV8I5B6Nycv79otY5TkX1ckgplK5LZDOH5AJg5i4oG/HHjz6bu8kv4iqWZ1Y?=
 =?us-ascii?Q?99/sKo8i+ucFiYBeFBaHPD7vQ42Q6mdcZMHSDYcb5wNDW7ZFHVqF/a1/c8+U?=
 =?us-ascii?Q?21bG6CMyOAYYf1peNfeHGRWN39D0vcFmdveEqwPIcoWpcjyWJlhax4sqj5Pr?=
 =?us-ascii?Q?LWQlWg3Xj11yDFSEd+1gdXF4Zb6OhtLVoABhHdCsModDXdnWFFxjCiXePooU?=
 =?us-ascii?Q?9qoWPVZ0E88rMkhFHRgNFvI9SCff6y5XfV8/Zt+dPL3CHLohh/BTwMpxvSbd?=
 =?us-ascii?Q?b6Ej46e6rBfK+yfHzDYqjg6ZTDvHbra1xE6mqvZsegIFVG0Fm4yhpUx3Etp4?=
 =?us-ascii?Q?TOjN0fEuPrUelxBE7ckAtvFvGwtUAlzu7CffycFrXI7ueAOABjN76Ai1ZbQM?=
 =?us-ascii?Q?mxfYlq8ie6P177j+sdGqTglK1EGzlQI1JikSuvK62b+x0re1EypTivcJd1l+?=
 =?us-ascii?Q?nwUeZ8N2+zrnwFoYgxyjsL0ZlviuyqbDMhg1UGjdX0t0gD0IJA+mzdH6FHRE?=
 =?us-ascii?Q?3UTINKfVkxS/kNVjF9Bv01XygsPDzITbvtyLV0LIzZrL5G5+AMIKNdQ2q7/U?=
 =?us-ascii?Q?BF+MySRgi4C66wBdjgLQBSOOCHxP2iruh/lneHFoq/KqeDjTdKC089frYm2K?=
 =?us-ascii?Q?SGYst/Hgpw165z1CfaCrQeNQhTT0QQXOpYfwjxchr7jXQkdSdAb9GiP3PX2G?=
 =?us-ascii?Q?X7htxSIm5F0IKzfAIFjpAQ50IjZzctiv8mUMcjITghf0MfMV0UEiite8ybhz?=
 =?us-ascii?Q?oIMPEL9KbQHzlH0IoJe37EXWytNXFseZxMEelDxJPssI6rw82+ezngrOXJPA?=
 =?us-ascii?Q?BJ49pNT27KWdvGMiAvUpLB6r3du2UtjV1ILuhw+fU0fUTnqXq5lNRb8Sfy8l?=
 =?us-ascii?Q?+f9EGOKSI9dWGud12C4oieaCu6VXNE46hNS9b5ANEa9TX0oT4ydisno9bqpI?=
 =?us-ascii?Q?46qfkdOS8wxyjnY6lI0TtKIDaX0fbP7A9z24zQi8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873a3786-caea-4f57-03b2-08dbfc96b09d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5144.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 11:20:35.0005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vgIsDn1J/+TiR3Wa/E13jPCbs1HbJpxP5Lpw99Plld5XMUkMFz1GqMxXtddmfcXH5LhuPUtvumnNeyXxHwGUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7880

Some platform using ChipIdea IP  may keep 32KHz wakeup clock always
on without usb driver intervention. And some may need driver to handle
this clock. This patch will get wakeup clock and keep it always on to
make controller work correctlly.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
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


