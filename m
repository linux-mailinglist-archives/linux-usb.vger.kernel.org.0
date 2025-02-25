Return-Path: <linux-usb+bounces-21000-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7657BA434BA
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 06:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 790C03B75AB
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 05:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5832561C3;
	Tue, 25 Feb 2025 05:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bwRsnGEx"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F03F2561DC;
	Tue, 25 Feb 2025 05:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740461953; cv=fail; b=II7NJ7aO6GlA0iFZSWqh219PQYqPEa5y+7xv0vkfWrRYo5loCtCa/Mm+W6K2S44PcW9nRFn4TYTRVc9xgnsLGAWthLMlWKQXZZYAzg5WSKHB/sOITSMYMKXD56y34ocdA5oY7R01i36+NdWdq57WcJQr7mQtgXf8EnMQOocCnp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740461953; c=relaxed/simple;
	bh=7VP9mQCvbXMwnlzRLO9ZABjyqXtg8ykjFvE+dwBP+N0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BJV8thAF1kOBtE7gCV2bv2+lNK0DQ3USQh6OUgYNEMEs0ShUYV7I4BsqBkX49LyoFmCI9Di+ElOS3O0x7PNQNfHD8cx6U8GBFQ/+qdXj6hNJdSSl68hsBK/QhEmax1tGGKL5Umj2gAX7khu0kOk0hEJazL9auelR504S71T+pKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bwRsnGEx; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxrniIz0d7KzhZJazxKSqIOOX/xA63ckPRz7cOo4daur7NbGCJtCDhL8bOVPZo2Wb6gJCaS3c9N0k37Q2Pyj57E71hjigavhDNavOTYSGQL6WbD7sAdik4iC8UrO8TI+g5Pc5VWnHPREZkgcBRooBVhL/jmGeSDnMNJrCLwC7NDLLPgwwe1mzUQJg5KjRXo+fQ2HmV+RZkod2wBLv+T/2J7XAhBzoJoOxEWlxU9kTmOBwPlVmHfa8PfRapi6/0NGXPDafQGJ4+E71PsTJ6UZIE7Vd8N0WEuHzmpIUDLoroEk30NjfzO6AKJPv+6WxopA6J7bU/q+0YylwT8RvnM7Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hief3CW3iNlLdM53SR3wBNtDZHM6uleBMkhZbzyCULo=;
 b=N07Weybh/lOadekPm84Xo5abBLmBB9D8emKLobGRnYBEszqyNyOCN+V7TyzbFibbTMYzyix2bvW9/FHBxx27g/TDfN0wcx0oEwqsEEk26ar3lDx/02oasMI5Z7S28/ImgQf2utRtBH51mrNkK1uVUwOABmdHc29aL+rM3uWiqrUfyAjD935S1IMw5hbDXCAiKBUnWM/QPADatwIJbA2UezRKVPvtU5mVynft783p5DVxTvVIh6+O2/8CBdl11ufMZx8CyaGJkiXfgDFBwCHcNMfBF7l6xHN2ScjPPkokDKZlnU9lOCLFHa4BY4YOFjVLiyM1zk4FcheWSPN2DHB1MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hief3CW3iNlLdM53SR3wBNtDZHM6uleBMkhZbzyCULo=;
 b=bwRsnGExKpSWMYfhapGRokT0T8sfPABaxQr9n7duHpfKnJ509OCl1jfR7NnVSMwkC6s/1fNh1M09ij1pIhsyPQMET4VQgEFYP4vsnEHYzhBC1rI6UC3GRB8jv77h7JlgqWXnxk8PHrHUhdqnfkDdQXfa8TeyhxCS7bRD8b/XwEKvgGTcD++PtqXA4/jdY/PGkNRdWMj6d25GF/HZ6+xhcD2kDU5+x1y6xqTxySPXMwogB/9sQ8kr+eVRSGW5X5teCFwpwd/kd/JcOjOTQ7QM/5w1iisMjBTsnFAkvfB2pxNfgVMMSXc43p7ZXQCvKtn2PWBoQUbfmtu8zNpY2DNs7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI2PR04MB10714.eurprd04.prod.outlook.com (2603:10a6:800:26d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 05:39:08 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 05:39:08 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 4/6] usb: chipidea: imx: add wakeup interrupt handling
Date: Tue, 25 Feb 2025 13:39:53 +0800
Message-Id: <20250225053955.3781831-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225053955.3781831-1-xu.yang_2@nxp.com>
References: <20250225053955.3781831-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI2PR04MB10714:EE_
X-MS-Office365-Filtering-Correlation-Id: 74895982-19da-4911-96d8-08dd555eb91e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fLYob3XmflkrChSbLs4znPLhpvGkTdinbj1S8Kw0QEuNVihYGYv2e1GqivhW?=
 =?us-ascii?Q?LHmXM09s7DJOOGR+/IuIjk+X6Bggr/ZVCbOve0jwcM+NsP/LgsKKqHxWOPjZ?=
 =?us-ascii?Q?yPJrg3Nsvr2j/BX9vgC6/x1TUtqH7A03DM5xHtYVBnNqg3HLxAqSublEqfgI?=
 =?us-ascii?Q?pJbmAsK/Z7VZriPx6McUh7lUiJODTw8DazFHtPq3TInFroPCjFL13TJg9C/K?=
 =?us-ascii?Q?t3i6eWS2Kz0ghWigGkSvlvxkT8oQJAY7pUShwbqIYqexm/Id3hB/oo+FAAFW?=
 =?us-ascii?Q?pjWmKn9RUJXGFz0CaM2KfM6N+X02prAge85eXppwcRKWUUSz6puIbePOb3o3?=
 =?us-ascii?Q?As3YyMF9qZBtPKY+3m870kwR7YBm2g6MWRNdmYBGgnFD+vgHNoxftR4XVadl?=
 =?us-ascii?Q?SAIZRBMa66ljBqnv1mGgYHTgGwGLnxHIOE1RN9e7AvktCUaZqhtdn40xqf4Q?=
 =?us-ascii?Q?zfNCkegb3ElBrWzgunYaelMkIrL2tu62lDqU2Gqsj747CIo84M3Se3rOFSuC?=
 =?us-ascii?Q?il4P7+M5AdYE2qVzze6hS9SqQp9GR80gS/hIonHgW0VM1vpP56g8UUZoNSE4?=
 =?us-ascii?Q?QwPZwbuJR08ypKsjYwkRl9fVXuHPhwleH5YEmHLB02pcTASRQEiPYJlBjfM0?=
 =?us-ascii?Q?PLTGYnPx8+COERKK7P0mGZVWGCE31/zkzrxwJ7dVnUhongbMYfk/Hsy31LUb?=
 =?us-ascii?Q?pLil1Xo6NZLej+j9518Ovn20gcrfE+PvAhTk0XLPb8IldGemqx3m5iS6WKEM?=
 =?us-ascii?Q?5VGqMY3exGRl8MhPInUNbk7HzCPVnEOk9vPfaxPTBlK7ZuFtzbMpHUkyO8Y4?=
 =?us-ascii?Q?vYlOd8LW5MzvLEW+SkACvI67xvrzb7AahHKWQKvfCgCYDjEycF0XggeU1XGX?=
 =?us-ascii?Q?dzyV34lmLNAi6g8HVkPmJKLtFpljokTQstte64KTCuCvlgdErqVCyXhhB3wa?=
 =?us-ascii?Q?qk+Y4DjpgWG6i30U+vd5rq8Njq+0FdhcxUqfFRPgOC6unQTxtdrvRVczmebO?=
 =?us-ascii?Q?AsPrbqu1IuRUcs+j8VyBDDSafBucdw/3sfc64TYRIQUB+oAksaRSnDuQB44r?=
 =?us-ascii?Q?vtn2mXNV/c+R0fnidI6zfZiqIS/2RkLmQNRp+9k6HrcSs7TWj0TTxKwdGGJ3?=
 =?us-ascii?Q?40XHjtXKYvh/uVqpmaaedkmHSVBZQ7QGBKePST1T3VZRUxPHaX1kYy9tZbAq?=
 =?us-ascii?Q?jS9zfvk9AyudMjBNDolsA0aE/Z2nDI3Ldkh1Jcgkjl3WlWD3l4sb/j+UHgJq?=
 =?us-ascii?Q?cPQW/eBbQaXVsoVHQgFbRAFFH+ySa0gIuvf6bSAcp+0rokTvpkj7zKi1Ty99?=
 =?us-ascii?Q?4nQ9XTeGCTA4n0rrwTc2zbecP/KPdNyT5shEb6e8imWIy/sAICC8wy2UXDYg?=
 =?us-ascii?Q?Z5YKeBu2ubb75X8KS3ANbWf97M2tj307Se23lt11fiLv3mKRLTRKupr/zMqH?=
 =?us-ascii?Q?xC2ESxyZ8UPsYPL7oMMaH8nidahwW9hU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9WGIMI/tJG0uMLO7w0vjRLSZUUfHlyQL5BzBkQqfgd5v4cAwjxqWnXtwEtFy?=
 =?us-ascii?Q?2UOcpwh8GQ9p29AEzqGF0+RsIb0MKeK5qEAKV4GlqTdGCCdpmnEJXfAjB0QY?=
 =?us-ascii?Q?387lWy5DIooEs1gaFP5Lk+ku5BWQBzF6CsLk9vl6X77AK6BRfi1GtQvDa+0q?=
 =?us-ascii?Q?6goFvuiomLPos2n096fUF4Kd15TP6MyWyJLgbcERqriy6jEdgD3vZ0eL6Cd/?=
 =?us-ascii?Q?1LX9fiRMTunETE27G7CygPiiBrzLYb2ZU5G32kOQedonjhuzp1WfGCzid8ig?=
 =?us-ascii?Q?vooKbaIhLKQndCrJrWLZY4R1Vj0CzYQ+hsiaVCEty3D2x8fQN/sAY2fIfZF4?=
 =?us-ascii?Q?Mu49xBB3jD640JSbRgG57umuHS604BfXJq/l/7kQPis3/jFa17O4w6nybRir?=
 =?us-ascii?Q?CW3HYOi7RlaIC3b92YHqC6LoG1rRtQDfLapsfAra1xG9ohkrsMaa91R9WX6S?=
 =?us-ascii?Q?aGHT96Dhh0aqGOiC2pWvbiIVxMouk6CF/mt8mOPwJFGW+WHxbvMTY/DaB6hb?=
 =?us-ascii?Q?aTnrDLo7IO6uAa4GphCe/QREPCQyNp8tDkk8r8xg4a45xzj6ms9iOOsfHd3/?=
 =?us-ascii?Q?8xMn4KwqVFgXMTpTutdvKCFOofwZq08yBW87AQWMHUF0pKoVMBl2GT1nAon3?=
 =?us-ascii?Q?aQ3wsCBRDJ1stuyvMHkEeQ40ztykkLaYCo0mAWPfsAW7M4LXyP6lbtm52QRC?=
 =?us-ascii?Q?c+Yn/N1bc3clzo6R9rLLW9AaMONGVn09dNBy1JqwlaPbb5ape8wyYWgKIsN4?=
 =?us-ascii?Q?DTBM5vmTciUwT/CsrTIDVBAqFwZKk1sZL/ne8tzbFY7u1t2PVviZnvhxlKg9?=
 =?us-ascii?Q?dTvrBALrB1YQlAcdulZ3e/INp32DeNSyjpjfKx5va3k1335BUws9S4/bJV8M?=
 =?us-ascii?Q?O28OKyu//R4XnvmnnPYo9m8AHEkKNa5Hcxsm74klpm9AqN7SdplGBZyTf6Zj?=
 =?us-ascii?Q?GY6byZe7UXN465juD1ocvTopkt9asrZpvVe1RCk6T0gY4k2vbtmYyNnHqjhV?=
 =?us-ascii?Q?tA6/BF8r0A/CKoUvNbcbCYfipCo2qgeivslLF5HB0Ji8ybR0OUxXoMYh6xdc?=
 =?us-ascii?Q?g7YgE/yoA3QND1JGsax1Eu6cRckG1nzuuJ4q8tIdEB3b9JQLWBN7c/+khLZI?=
 =?us-ascii?Q?8f4d2UPoG0sJ+/5JuMNRN5PSinHI768IlAaGzX7mqO6vMjXdohOZsKYOzL1Y?=
 =?us-ascii?Q?JE9KRZZDLruYeQna4rYYie21O0Qi2h1D4Jh7HmhD5vpUtyUprDLGyjL3+aIp?=
 =?us-ascii?Q?3ziR3COgs1n2JNvMBirUYPCD/ri0Du0RaO6eG1eqEkPnG21qXSxsXwDmGicn?=
 =?us-ascii?Q?1zs7gpHXdXLADEIqcn+WosxNxAK7p3D6C2ImmJUWx0ycWv0VL3URg6iSBJq+?=
 =?us-ascii?Q?YO1nftCoQP/Yg9PJXZtsoYGOr+2wpjcMtC0tO9ooRnZVgnIIuiAXTXWMKkEZ?=
 =?us-ascii?Q?3wl4spc8fYrY2aFeN9cq3BvSnBVUSghR/BO1ciNsFkKRz9Fd54K5Ru8UVqv6?=
 =?us-ascii?Q?1whPLLZ50Y12widF08m4fCiT3xwYQY2ZicKab3TDZJOrENQ/ccMCczLG8ZW0?=
 =?us-ascii?Q?ZL0S+JkUm27SnYalBy3WCrcQ62xSu6QfLPjuuMsx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74895982-19da-4911-96d8-08dd555eb91e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 05:39:08.1745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyHQVtgx/u72bycU1tKWCB1tdBE1EYWYC9INNrYh6CPeKsS47fdlx5vvWRO/VfaPmGbm8JTGMJuS1eMj3K0Klg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10714

In previous imx platform, normal USB controller interrupt and wakeup
interrupt are bound to one irq line. However, it changes on latest
i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
This will add wakeup interrupt handling for i.MX95 to support various
wakeup events.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
Changes in v2:
 - rename irq to wakeup_irq
 - disable irq by default
 - enable irq when suspend, disable irq when resume
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 1a7fc638213e..b36fc8c19748 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -98,6 +98,7 @@ struct ci_hdrc_imx_data {
 	struct clk *clk;
 	struct clk *clk_wakeup;
 	struct imx_usbmisc_data *usbmisc_data;
+	int wakeup_irq;
 	bool supports_runtime_pm;
 	bool override_phy_control;
 	bool in_lpm;
@@ -336,6 +337,16 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
 	return ret;
 }
 
+static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
+{
+	struct ci_hdrc_imx_data *imx_data = data;
+
+	disable_irq_nosync(irq);
+	pm_runtime_resume(&imx_data->ci_pdev->dev);
+
+	return IRQ_HANDLED;
+}
+
 static int ci_hdrc_imx_probe(struct platform_device *pdev)
 {
 	struct ci_hdrc_imx_data *data;
@@ -476,6 +487,16 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
 		data->supports_runtime_pm = true;
 
+	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
+	if (data->wakeup_irq > 0) {
+		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
+				NULL, ci_wakeup_irq_handler,
+				IRQF_ONESHOT | IRQF_NO_AUTOEN,
+				pdata.name, data);
+		if (ret)
+			goto err_clk;
+	}
+
 	ret = imx_usbmisc_init(data->usbmisc_data);
 	if (ret) {
 		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
@@ -584,6 +605,7 @@ static int imx_controller_suspend(struct device *dev,
 	}
 
 	imx_disable_unprepare_clks(dev);
+	enable_irq(data->wakeup_irq);
 	if (data->plat_data->flags & CI_HDRC_PMQOS)
 		cpu_latency_qos_remove_request(&data->pm_qos_req);
 
@@ -608,6 +630,9 @@ static int imx_controller_resume(struct device *dev,
 	if (data->plat_data->flags & CI_HDRC_PMQOS)
 		cpu_latency_qos_add_request(&data->pm_qos_req, 0);
 
+	if (!irqd_irq_disabled(irq_get_irq_data(data->wakeup_irq)))
+		disable_irq_nosync(data->wakeup_irq);
+
 	ret = imx_prepare_enable_clks(dev);
 	if (ret)
 		return ret;
@@ -643,6 +668,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
 		return ret;
 
 	pinctrl_pm_select_sleep_state(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(data->wakeup_irq);
+
 	return ret;
 }
 
@@ -651,6 +680,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
 	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
 	int ret;
 
+	if (device_may_wakeup(dev))
+		disable_irq_wake(data->wakeup_irq);
+
 	pinctrl_pm_select_default_state(dev);
 	ret = imx_controller_resume(dev, PMSG_RESUME);
 	if (!ret && data->supports_runtime_pm) {
-- 
2.34.1


