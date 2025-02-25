Return-Path: <linux-usb+bounces-21003-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46E3A43532
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 07:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 255053A341D
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 06:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6C9256C92;
	Tue, 25 Feb 2025 06:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gks3lEz+"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33A524EF8E
	for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 06:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740464860; cv=fail; b=OwVG+RfdUnN7L89lToACQ05cALPiEu7HbkEbNCIpfoKwduS/DEd1RoFrH16RuTDvadYGvZ/knaOlg8ImzULsoJR35HaYEFOkxOrzXe24VknWYMwDahf9yqcODeI0M9KeLCdmpGne3jUcqgeKa1CUIBOzxutCtSJ66y4yDoP9TfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740464860; c=relaxed/simple;
	bh=GcN2Y2uTsa4XjtlSGjGX03UaJUpFPv/eGQWr+2k/ZAY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FL/9e4N0BEXOHsDMxoIQm/XyYTlSGEihUYbXpkbCFoB2O7Nvtqk+EAKZ1F1pyZRB4kPSuUgW68FmgYcaQZq6xRY1j4IFbXO0IzSX+tGd3QufF+IP9yQ9ZVGHQSMyAQllRD8Ne3T1Bqq5B1epfdviuwVHeWi9M7Omr7nOgCxebs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gks3lEz+; arc=fail smtp.client-ip=40.107.162.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YASzKDz9wPWqKQGftRihd0fN3OYmV7Db/FCRPaoVLCKkNJGtRwhD7Pgjtg2uDAe2oUfeogIHExhT/aFY3UIPbqijE/C38cMehEUZc1GyJRM4/4+ZovWPDBephzbWHYkb9HlOpH/6naB9ud2uuaD8Sx76NV5T4fSRdfKuTB1TbTOMVpVi2ui5eCqonsPbZw4yXv3SfMrOdMsq9/qHPPn90tOkUI/rwXg6N++AMI2/zVScUle6i3IcCaGXKwbIkkxZgOQyNnRl47eHLgVNMWt9O3IC0KGdGVO/fHpCb968l8U5oKNMIds8z+QzEEzC0Ttwvc47JPgyEK4xx8hl6QCY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qG8cnVW0ZAJTXhk9H3zMaSmUHsIleBdR2Vumv4Ptg+4=;
 b=L7RIvf3TmJwWHlBqlHP1mLDntRF+AnxYA0ThonBscaSZ7ISVCwTO+9wyqM5GrCesP/fc3lJQ+yLriH+0sKRxgDCGZYK/HoPqre578FYx1gGybr1Sf64ANC+7VoTHol1GrHs2vm9PfRCyEgsZICVlQAChbnoZSibOJIZyWkRH/lJpxM+rXjJjV2VKNTfeB4S0MLPma15vPs6XRESjFQtobKg+ndK/ARGWluwkNbhFkX132wOtkccpLosCgt5m/nhUNtsX277lrcaK/fXbs3eK2gjU6XX5YO3PdEQoITJZl/YXBRJDu34w47dxVaPDdl4yxBS8yTPAhHUsHFFuwahUUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qG8cnVW0ZAJTXhk9H3zMaSmUHsIleBdR2Vumv4Ptg+4=;
 b=Gks3lEz+Rh+j8PSpkmgAC9nh8AKlZTUpy0kghartfeaO4as3iDbprKeHTkBMVkpkC6Ub62xWFZxJ1DPPFkVNOPzWvMkCB9x83AI1ynaSzAS6LWI2hDg17oszSLyiuwBeZ84uBSmbdWhJ1kpXWxHzvy0gA50wMQ+zKEk+RbrYfTzyitYnPR19Y5XSXb6shtQdGtmLEM5GfOglOScSY63rhzYm2soR56j9LM/PNNsQOLSzl9XXE6P2yy26rJeW5zUmV+fpgkTx1q3FoykHyuMQJC2VF1M6S6OfvBcn5ru2+AeHuy+LAj3Z7dHVKGeM5S2zRENePNRC/YgkbsjrKBjfXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10328.eurprd04.prod.outlook.com (2603:10a6:150:1e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 06:27:35 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8489.018; Tue, 25 Feb 2025
 06:27:35 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] usb: chipidea: imx: fix some typo
Date: Tue, 25 Feb 2025 14:28:43 +0800
Message-Id: <20250225062843.3930041-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10328:EE_
X-MS-Office365-Filtering-Correlation-Id: 33289cd0-5126-49b2-6862-08dd55657e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YtiQPF5o7rwyticBHj+tmGkvVbXLZLdlIdXvg3JJhCiOJeZM9ooc7NgvYOmC?=
 =?us-ascii?Q?Q7Hn53/cH3RvQdblQ8CnjnKAkjy6S+/j0tA0U4Y3yZ5qVmwxvDfbqpQzb+4c?=
 =?us-ascii?Q?RFZ/fNhTUQ0eQ5cuOb/a6y0B5GshSHntuU8tM5Wrb1m2sy4mCVO+jfpeuUSi?=
 =?us-ascii?Q?ZytyIDbQ73yYRf/ZvTT3aJYkXM54hQR2Hst5nSsdySk+X7OWlOyGmQf7Nygd?=
 =?us-ascii?Q?p/EZBGqQ4JgrwqLDVyXgyBOO27VHEAqaccnWJ6leiR4hIjh3DMUcSoxTyHvj?=
 =?us-ascii?Q?917npcZ5c0jDn41C+CJQvbiVxYo2mqYIyucL2rcR01PUuUUB5zC5rImO/Wlq?=
 =?us-ascii?Q?dreAihhVvs9GmV7ALWl8RrD2wsJPebneZQn7pm8zpOa+alBzc2oc4cNDwYX+?=
 =?us-ascii?Q?q8ezqzdHTZZELKMGeFU2IV3A7K729Fj2IIOqBhTZKNn+Refs+M3arvFsUHjA?=
 =?us-ascii?Q?LqjwxC4IoHUL1ORx53DtOorCEmDlHsLMyzuBXytkMF0dp7h/DeXGVWdDU+Od?=
 =?us-ascii?Q?ZCQyhyx+twUoDJVnOAGyrAYDKCjRCD91B/0bbscGNjIhOMOEcuFep08k2WfY?=
 =?us-ascii?Q?+DvrIi04kAuRJ0xnWGL4prRAxeh/Xa5qUsGde2u6vj6rYaRjumqtnzcv1YOb?=
 =?us-ascii?Q?GWzguY/ohV2TD2OehCSbAV0iouEKkip5e4OuClHln5R9pknWVqNLn1O5wfno?=
 =?us-ascii?Q?otcsilA4jg3NYEC0ozbVVp+QKldvnB//eLF4oqaQMGvnUo2/QJuoHdroKaIX?=
 =?us-ascii?Q?VG+6zjQbh8+UA03ZDrNZSo2E2qVbsm1z8TVo+HGLQ70IZsbw3LTlSMxQp6Q/?=
 =?us-ascii?Q?h/hO+dcRANYi0rOBnAfpoyUY8IXgPWWktGQkNA9Fv5BGrDlZXZHQc/sG9J3y?=
 =?us-ascii?Q?pXTORsl5xogkihMFbyj4mcD7fEi6EhJtE+Yxn2O/3RFZx93yD2QAwYRsyD7S?=
 =?us-ascii?Q?v6fznoDuB1kL1lh8VEC26db0G4v0zBiwn7LBb1ToiU9VXVazAS0W+jMl+JoA?=
 =?us-ascii?Q?0eC3bc9wCpEsKzACWCDE2z5thsnxzOVrOTlAIMW68JkgoiiEA8+d2kZdpNU4?=
 =?us-ascii?Q?9h+ENxcPaMKQoSMLzY3b4r6sGhZeAM7AvaCvqEYjzG1vrKtQrz1mvpK6Od78?=
 =?us-ascii?Q?obDeONt5nEqnDKJowOyBAQEBQiirl2YgW8yA4mHuM8NBCvuhH5z73Y1FKkwd?=
 =?us-ascii?Q?MwPpSMJhf8enJcxwnwcnHrCgz/2kNqvFOSyVxj/JGzPM1jYvMsyCBCSuslhA?=
 =?us-ascii?Q?pJq0Fa82HKIHlev/cWVbY+WEMi3G42MvTMlHPKxB+IEev01eFlyFuke1fWqH?=
 =?us-ascii?Q?UyQJadrhEsexJymX3DsLycxKm7rKHo6HQLfRw7TtL+A/QQZC+QDpVCAO9ZZc?=
 =?us-ascii?Q?+toDJ8Yi1nrW4/C/VQLXcF4oMYhw2LM+YYR5bBvoKYBFX93Ft2AINEcY0HEX?=
 =?us-ascii?Q?fYbstlHxpOjIVucR0B1Ve1IMaPVqVPHA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+5qDs1o/NPUmGOyadsZ4GtWQq9cRMw4ArZNOm95Dr3Q6qeIXx7Zh7KGo9Y1z?=
 =?us-ascii?Q?ISqTRfPjC/nq6c0OkFSgyYpzQeZi33XC5rFRTeX3UveKQtnCklze/t3wF+qq?=
 =?us-ascii?Q?UiZ2gSV3GsvI2gDMHBEaGWZb6Z+0OBj5Lt+hVlkOIWU2U+5E6+CFtftLEMFh?=
 =?us-ascii?Q?twr5yNMD9EMmpGimdXAIu6WZDDJN3isIQuQ0/cLdFzH3YP7X+iJTNFTTmwE/?=
 =?us-ascii?Q?jPYRulK+qEUkOazJ4BkRh2W4fc0x3Up6iSThmKaAKsGQiSH1lyt8tYRdPvvj?=
 =?us-ascii?Q?pcRXlgvC7s0k/GvT8SfO1tVPtdhtbgYt6C4tKht8DgbMC0WkQZ/unTcqB5rB?=
 =?us-ascii?Q?efVcHbbYtgnsALRFXLmj1GpJaBtj8juWuvqUklTOxF4mTt0KZDELIvn3hAV5?=
 =?us-ascii?Q?M8daNTfcLXaEz/WKXqm/WGLpVoq0P/d/XF4p+hLYKNLJW/y1Qljmq1iYzoOl?=
 =?us-ascii?Q?cP9ngimGm7BI8hRCgpGLZNqfyUFE5+D1pXOEwupV/3sppfEE4/AMrOZvGAgU?=
 =?us-ascii?Q?iy+kfqE2JpW73whidfnuYDLOCLIw6fzavocM86CJi/eZYVeUtCqSSrTCbpqO?=
 =?us-ascii?Q?UEau6FEoBbsGWMaEvGn6NvT7IZJUWQGPc47xmMlm4L464I1pkyL+GMMu+0tI?=
 =?us-ascii?Q?tRmI1kIONfLUJ6HD++cb3KiW4nq6ceqkqAA0qIYqCAkhjPtk7fIvhzAWq3IT?=
 =?us-ascii?Q?TCI5DYP3QxbPJHyR3FF6fbebj0bZCV1+pPQeeb7kFxb23OtJ/MMiYr1XzuQr?=
 =?us-ascii?Q?h/IvZ8/UZ2miAxHQ6uyrPu3CHw21Df6UJkkpjnZlblUxmEbiPl1Gd7CuirE9?=
 =?us-ascii?Q?Jm7DByvwbG9lDVbDY1cMuKIuUNSo3Isv/4TMHiVcl07J5VL+vVAoBVwegRkr?=
 =?us-ascii?Q?ByyXsIIKU90Gl7/idHwKbJzm7an6nKRSdVX05bL1318gwB+p3utg7W7ACf9O?=
 =?us-ascii?Q?lZ917mkDvI1eAWEcmqduvMHY/Ke1A6QXwFF9c0nj27S9dqbg31o3cJ/I53/Z?=
 =?us-ascii?Q?1siUZJ8t3l4tnDR6jRAkvZLMCKiwuYWeoXDxj3fe95tAlsPdGoP2dUC1GCqx?=
 =?us-ascii?Q?DvbMWkBRzw5jyoDtXkjz/pSW64wxBubpPvUedFES6b1crEAP2EmGhjFmyzzG?=
 =?us-ascii?Q?HCJx5RbnjT6ZOA+7pfF52CsSN+4TMzdCPD6RSenqNZ4s0877OQzPzhbOxf0y?=
 =?us-ascii?Q?kxspFwXKX6QIcGAog2O74KxslfQRma+hAPjDNMi/APz0RRrj29DU/BVLk2y6?=
 =?us-ascii?Q?MPGijHDH0C6xM6fz7MHBx35ZGR/ud+N7O0kMjE8JMtqc2vVz+28tcn2ED0ir?=
 =?us-ascii?Q?rQXsxWG0GZzEE8OfMLllkn25m+ydNu4A5zuZ5PxUpmwNgZe2v+ekDOsK4LSX?=
 =?us-ascii?Q?vC9zhARthO8JzDKK6SZkDkjYeJ3/JiceHA8BbTRfxqp62w0w4uiYGVlsbpOu?=
 =?us-ascii?Q?SG+Ksbu6LCejPVB7/ViTXxNci4ILGQFjsG7fga3zp5qkbedc2mcbYAG1ATKs?=
 =?us-ascii?Q?K9e9twTQf18L2zSNNc+RUmQFhtd2Iaj2U+Hj5EVfg+6kgRW3o4SMG9oa5vKA?=
 =?us-ascii?Q?EPJ2Yns2YxRopZB8qYRxKcXqkIv6Jryp8c0C2qck?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33289cd0-5126-49b2-6862-08dd55657e12
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 06:27:35.5674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4U/2cuiQJVZWifWKrH75EpHY/2fOtPqP2MxOSmO/Hya7iyop3BOmWuCE1y+38lxuTsbIl+C3TlIx2xoy154vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10328

bootlader -> bootloader
set_wakeup failed -> hsic_set_clk failed

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/usbmisc_imx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index f933fc70be66..4dc0bac8cde3 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -457,7 +457,7 @@ static int usbmisc_imx6q_init(struct imx_usbmisc_data *data)
 		else if (data->oc_pol_configured)
 			reg &= ~MX6_BM_OVER_CUR_POLARITY;
 	}
-	/* If the polarity is not set keep it as setup by the bootlader */
+	/* If the polarity is not set keep it as setup by the bootloader */
 	if (data->pwr_pol == 1)
 		reg |= MX6_BM_PWR_POLARITY;
 	writel(reg, usbmisc->base + data->index * 4);
@@ -662,7 +662,7 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
 		else if (data->oc_pol_configured)
 			reg &= ~MX6_BM_OVER_CUR_POLARITY;
 	}
-	/* If the polarity is not set keep it as setup by the bootlader */
+	/* If the polarity is not set keep it as setup by the bootloader */
 	if (data->pwr_pol == 1)
 		reg |= MX6_BM_PWR_POLARITY;
 	writel(reg, usbmisc->base);
@@ -956,7 +956,7 @@ static int usbmisc_imx7ulp_init(struct imx_usbmisc_data *data)
 		else if (data->oc_pol_configured)
 			reg &= ~MX6_BM_OVER_CUR_POLARITY;
 	}
-	/* If the polarity is not set keep it as setup by the bootlader */
+	/* If the polarity is not set keep it as setup by the bootloader */
 	if (data->pwr_pol == 1)
 		reg |= MX6_BM_PWR_POLARITY;
 
@@ -1280,7 +1280,7 @@ int imx_usbmisc_suspend(struct imx_usbmisc_data *data, bool wakeup)
 	if (usbmisc->ops->hsic_set_clk && data->hsic)
 		ret = usbmisc->ops->hsic_set_clk(data, false);
 	if (ret) {
-		dev_err(data->dev, "set_wakeup failed, ret=%d\n", ret);
+		dev_err(data->dev, "hsic_set_clk failed, ret=%d\n", ret);
 		return ret;
 	}
 
@@ -1319,7 +1319,7 @@ int imx_usbmisc_resume(struct imx_usbmisc_data *data, bool wakeup)
 	if (usbmisc->ops->hsic_set_clk && data->hsic)
 		ret = usbmisc->ops->hsic_set_clk(data, true);
 	if (ret) {
-		dev_err(data->dev, "set_wakeup failed, ret=%d\n", ret);
+		dev_err(data->dev, "hsic_set_clk failed, ret=%d\n", ret);
 		goto hsic_set_clk_fail;
 	}
 
-- 
2.34.1


