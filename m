Return-Path: <linux-usb+bounces-31194-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22109CA601D
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 04:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5468D31AE02F
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 03:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D66E2C1584;
	Fri,  5 Dec 2025 03:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UxUTR8BY"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010026.outbound.protection.outlook.com [52.101.69.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2328629D267;
	Fri,  5 Dec 2025 03:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764905334; cv=fail; b=HvsfU4++Ol3Ll4hiKW2J3a+W/Zpqv1TraP0xgo44XVMWpmecf6VJcQT8GYy78SAgRouLjyvm5DJRwqmhqrfs/dU2iAN0Y06DJzvC//HZ8ijS2DoVs1LwOFzB6pBpnghdC+q/hL2ZrVCSmMlidCGxegGh6TGDMcdRc5NPA6A0AjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764905334; c=relaxed/simple;
	bh=hc0aqAIhKgIFUjOwMf0ZsTqTdIL6/23HfaPtZ9sA6rk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jb6laWMfzzLExdzHAtIJpo1EBpHvOyNczmpGJnUtexL452JVdksVEkXF8/gtTOkPAG3gtZ2obOBI/Y244hb8KdkzcMbaeEUhFrpndOQIQgBHF6vi5PLstudpICNX6uqCFvf4FxedCnMWbgzQc0eQ4pzu5/YWaE4XQ/5WEoRrEZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UxUTR8BY; arc=fail smtp.client-ip=52.101.69.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzRC5GsegB8zFWwO/xFmWT+XQ9xxJPHEE2kViv/fNZjIGRph+5Te8r2ekSjtxnftaeq//AyWUYtRia5huAqoZrINW1znSccFsjA+lyq3V2I4vRho5vSPXRs0cbFphnAz78fomdfiYlcO/ECysr1fcCF4Vys/698sYLtn7iHtNnIMKaQVLx5f7s6oXFhyIvCfCWNxISiTyL8Rc5qqfLvO/vaoZ8YinlsRhhL6+UBBdANAhMGOSZk7QGnX57MHUIEIJWSu6CWbXRsGuNdKuQrlxjIFMiKlBNJGTNIgcahcIZAxYSWDQh+jFfrVw1OFAIIw4fnY4S9ZdYhsD40BpUZE2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcWCrNpP/smpnRhbC9/tk8+P6hc4iTs7ka4jKZTYFBs=;
 b=mXaZs1hunTKOIXHFZAWKLNj9YdAVNh6bgr9tEVCNVPXUgm/X7RyqlHCdB+8DB8dRiZCy8CkiR+V6xrHy5iJU+IhyhWe2FTCelIMCxhEOwjqkvH+vJ9CDGJtiMc3IhW1dSumRrbfXEPJUpfzhcFjO9L69JKJGPhXnKwZbSfmeNa+apHWOaXQvBWaP34TJeqM1tD0iK9/VNIAT8a9qr5p5gMn8lQZ/ipMzV1Jgp7Yg5d0zWIBAMgbl1YwGXzzFVBnVlhn6n3MdC09QAG1sFeYhmwEAkUlaPz7IHY1ZBQlqlua3O7/i5L8b2ZPabpJZSHydAKnb6rfhrgXsfjaJQu1A0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcWCrNpP/smpnRhbC9/tk8+P6hc4iTs7ka4jKZTYFBs=;
 b=UxUTR8BYhJPnVX0GmSCj3qAwXnim2kx72XQKTEpQPW6JuWKCdoUVznlIsBbHrOc+uGkdNfJ0v+J4xkH/gVcOo0PuH457ryRdkWEP4g/FjN3PWdgTxoZsh9jsDouBBZCCefqsnjgJ3gGBJ92UUnAuf+iKoSe9Kzbr/LuqJvj8Q4p15rYPLwuEGWQal+ec29njuAmiggQa0WNasBkibe7v/PoNOukQxTNu3GuhprGkBHRTIvopr/AC8VWHCX8+GXlqqUhGZdQnx9Sf64v+3fqkDTBRr3+7/M87ChjH13ZV6rwRAa0C/a0USWpmmi6hyPcWNp2zRQhUzyzaLrp6lAamCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9SPRMB0022.eurprd04.prod.outlook.com (2603:10a6:10:366::7) by
 AS4PR04MB9649.eurprd04.prod.outlook.com (2603:10a6:20b:4cc::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.11; Fri, 5 Dec 2025 03:28:49 +0000
Received: from DB9SPRMB0022.eurprd04.prod.outlook.com
 ([fe80::8c26:6739:46ea:171c]) by DB9SPRMB0022.eurprd04.prod.outlook.com
 ([fe80::8c26:6739:46ea:171c%4]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 03:28:49 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: [PATCH v2 2/3] usb: dwc3: imx8mp: rename dwc3 to dwc3_pdev in struct dwc3_imx8mp
Date: Fri,  5 Dec 2025 11:29:41 +0800
Message-Id: <20251205032942.2259671-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251205032942.2259671-1-xu.yang_2@nxp.com>
References: <20251205032942.2259671-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To DB9SPRMB0022.eurprd04.prod.outlook.com
 (2603:10a6:10:366::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9SPRMB0022:EE_|AS4PR04MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e8cc69f-0ab5-4d28-230e-08de33ae67d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|19092799006|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3xOunPpP56H02VfbmDMNlwqZyAowtX+uurSQOppexF/wOpzZMa0NL/O119hi?=
 =?us-ascii?Q?vXZD79bfFPUZRJyiFUx2G450vd6reeQXpOCsHS0cyLfftgGozdQlP8IhA7Zn?=
 =?us-ascii?Q?7stFoei+4FkIX8AplijwgMBAB6Ky9Wu7GzCE56yI90KolLcKVGl4Nj9D9JUU?=
 =?us-ascii?Q?YIA0Tl+OBtXXXoPAQuLUBusNpPo3dm2pJNym45XkpyuATthN/K1VwEe03Bvi?=
 =?us-ascii?Q?i9qN+1I6M2t/Uk/fnDn/ypbAUWBLzh274AOWjOK9b/Zq9hP+8B2aZ+TbehPG?=
 =?us-ascii?Q?rIrFYa7dW5OK5Ks0QwOKeUiua1+Qhr9Cso6B8ZobkQecBA01X22zjN2vlfbL?=
 =?us-ascii?Q?RCUwKxjeox4YV648KlT8uQei7mghjgH6i1ZhSywcjVRnGDM2qY0or6GCt51a?=
 =?us-ascii?Q?44nb8rPeye0tI4nbqQ/ILSP2gvCyesGzIaSblnlAuYaS6V7hNdCqS1acjGeN?=
 =?us-ascii?Q?cQhFdgk9pcqL6WZ2/wIE/V7BejG+8UEkdmvIRc5DQzRLWcJ40Ae21BD3Mkbf?=
 =?us-ascii?Q?rHm8d/C9HDlL+EqgD4SgaAbU06QkQHRYNE6lifbH9LxQYp8tFCEn+rzb+6yb?=
 =?us-ascii?Q?Y+ovmG/W2R2uclRFZxyZMMLoGCP0Acb5WlZ+T2e6tclrLAa4Lm1szPEMYbWk?=
 =?us-ascii?Q?LaiTS/tiVbHXt0Yl3+xtJwnW/W7Py4sP1t3p+C5yefOesqtuDmxMZFiT5JAv?=
 =?us-ascii?Q?Hud5HxDnUxuzS+AtOzbr/t/lVbboIu0Is1F3Mq60o+PR1xiihCVJ1H1LiyFs?=
 =?us-ascii?Q?ytUPDMBzhUydFE4YUO266j5ty3LTDWXbHz3XJ7GJLgoF5a+804N9//P6uWMq?=
 =?us-ascii?Q?yWQR9yahBzhtM4OggM1HCZvdnpKzBT1cjmpT7TWStdXh3dJB+RT4kO1fVKhv?=
 =?us-ascii?Q?ta9auMzxtYKlKr9u1VDwlBh5zDSYa9R6Ni7jJo5OtsezzQSVI4yOQqpfU35V?=
 =?us-ascii?Q?RLawWzuv/RgF2hN/ZLIZsf5k9uB8NdrB/rKhGQpicwmX2h8wDbXAovlhSAWM?=
 =?us-ascii?Q?76uQQVWim+KREZYlt3WgOqTJ2ORziBYyUvy9G2cSonLAZ1dX3s61rJawveHO?=
 =?us-ascii?Q?WK+J2dtedMyx0v49ncadLKfGvdjNDL0mElG58guYz0JtDeHMkpWfyV15dzYt?=
 =?us-ascii?Q?YSUn4Cs2JDRlffB2JGsiw85o5jWto6H3z99IbsTjTEn4mIFEzalBVv3SKhd4?=
 =?us-ascii?Q?K4L9OAaqZKagqvHE5PczybbYRaS5N4opKByaXd+t1PEQF6IzgcHfX2DDs8e+?=
 =?us-ascii?Q?jQBR3kDLuLddckLmRHRXhGppgYuZ2AQZUc8RKV+3h6glNiBtp359VTK5P4T1?=
 =?us-ascii?Q?B6FiwXbMdu5Z63A7kuLy+qdfXVOKpcFmbjwtDH+hrl3thrjIm114iS6vB69b?=
 =?us-ascii?Q?vCmwYwgutu13ythESv+iFO0lGFKhDNlfTcarP3c4P/3z7yQGe8uEL7jc6RBn?=
 =?us-ascii?Q?OgQd6LzxOP4lwEmEzF1BAVeRcU5HYnLL3PB8rd6j7CrtzNUUwCERC7uZJpju?=
 =?us-ascii?Q?7AHSyvoYoDfHIj8yR0ONnoDs+Tw1cu+uCrui?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9SPRMB0022.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UjILG4MA1G4MjukLYfW7S36RLcxB/EV6pgiat/jhBhEL3qU/bIbyOoMCuKW6?=
 =?us-ascii?Q?TyzaYCBlbeyxBnCcqTvGcavL0zAFPc1yzfeWeYK4fF/dGD+Mv6LsU5st1mob?=
 =?us-ascii?Q?+yki8PTEXKL4aP8TefCWz2il43IQfg9CmolrteBXyw2DgzOVoK4Nda7GEPW1?=
 =?us-ascii?Q?L2R1LHgi6zTtkCmT6ybCExyoJEQHJ7j87dS00r9LdxUFVpBC75G2/K8YjIci?=
 =?us-ascii?Q?VpVkjyCk4j1VR6CAbm0zVLjpio4b1+4rLb0+4NEVQFeSX9fmJCRbFNCRwyux?=
 =?us-ascii?Q?21jSsRZ/F+pHmTiVPYakBQVLb5ES6HK//agozY32Qksww8/1a1hxc/EELfUm?=
 =?us-ascii?Q?WvSV/EydpLL5jJSIPKCTXAeNRsomToWE61JV2i/C/oQnvUkqAAtZYAyZH568?=
 =?us-ascii?Q?OmKWVJDfyOzIdhGe6YwpT58rUWvajGXDaK5rd4L8hRk8szP2YueekyA70Vi6?=
 =?us-ascii?Q?Nf0sK2fCyWRkS8jNb35Pyl6XX9qwjC0rshZT13nPVSq7JbHfxPOeGxfYVwtB?=
 =?us-ascii?Q?jAgWQRs4vQdE5ccwHTctssTChL3iuruUBv4Vkmry05XH4JC2sWaSDSmoIqth?=
 =?us-ascii?Q?i9ymIb8/NVShimm8Se/tXAZcW6D3WeoQi6wx7pR23ywPmdAKJEIJ81d87piw?=
 =?us-ascii?Q?2dJ/yC85heP3Pp4tmySIWt9AxuRuohEfqZg00Vf9+j/JdJv4J0zhSFdFW9XI?=
 =?us-ascii?Q?Fa+RH7rX/mtm+iCIglMOtu9lATCNbECGjhCBOzdHpuL6zaeA5S3OoVzUhx+T?=
 =?us-ascii?Q?SfIVe3vvKE2wESVAqUbqhMkZpAOPwUP6RDIi73pcU2MgBpMv9UYb0eE8FMNS?=
 =?us-ascii?Q?qFzVcVuLYfcsNncC4QSUsKEnAgqOmptBekGGOArdtG+IhU1ZHAc3Q5gKXGuT?=
 =?us-ascii?Q?Yko1kbQauLOKQBKfUbe0nQO7rjfAOw2X8yas5Dqc/Za8TqJH/PdtuZClhvQC?=
 =?us-ascii?Q?cXEtJ6a+Z16OuSFai1rDJ7+UOFwRJPBDTMybI3xEqZ3+c42AmqIkmTHSAyTT?=
 =?us-ascii?Q?PTo/v1gjD/hmT67Xqjv/uMVB3CNfcti0fq2wqeHNVchYqQ2b1DOGCIRifNWJ?=
 =?us-ascii?Q?/o55hPmilqt34kEFGk4ytHp1pAGiBmsBCjVhFO9l9Qapku1a957tY40sYrgG?=
 =?us-ascii?Q?wRci+Rvt2KqaQqSTfIzr7WOf5vNu877UYTfx8HLsNHrfonVc81se1kX8E3db?=
 =?us-ascii?Q?RnMeLCjo+iEnFk8WHX0YbG/tO+Te2/yNr6Oxu5Kw+DPJ3436OCpUxsy2dF+Y?=
 =?us-ascii?Q?RHiyCFL5w+KXC1Db+QP61FMZCKRM5cp/xj1Wv1f1z+yJzKWZuUjWzm40enKW?=
 =?us-ascii?Q?AK2ooZo9r7yJGsbmum/hGiAZ7o7NGqD6xaBxZFey2KHCMnVIz7JVBDodtoES?=
 =?us-ascii?Q?S1eqTWOlaa+wV4KBmm/BfqlP6l8BbXMrKBZOQnDhcYTddNpSsiVGM+vkXXCp?=
 =?us-ascii?Q?uzDaJXiRqHt2L97h3esEbUOzEfBU4If3jS2VJ3NB+G0YoMpNT2GojwVMShVJ?=
 =?us-ascii?Q?6ghXtigp+U5GfDXeRLGjqHZWFUuYsyVcMg63tCFr8FspTSrc3350RLPyHlv/?=
 =?us-ascii?Q?4BG6aS2GNwb0yxUlmFAA6nKsKRu3DzxvgxMFhxsv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8cc69f-0ab5-4d28-230e-08de33ae67d3
X-MS-Exchange-CrossTenant-AuthSource: DB9SPRMB0022.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 03:28:49.6981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BespcJKBPvLgdv6pom+Zbp5CSc7ZGpyQ3nmvVJbILpPBuALk3z6xrH8Y9PDkCTPl0qZ3d6u0A20iY5WoIKpVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9649

It's confuse to let "dwc3" represent a platform_device, because "dwc3"
may also represent a dwc3 core structure. Rename it for better
distinction.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - new patch
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 050da327f785..8bece4baecbf 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -51,7 +51,7 @@
 
 struct dwc3_imx8mp {
 	struct device			*dev;
-	struct platform_device		*dwc3;
+	struct platform_device		*dwc3_pdev;
 	void __iomem			*hsio_blk_base;
 	void __iomem			*glue_base;
 	struct clk			*hsio_clk;
@@ -100,7 +100,7 @@ static void imx8mp_configure_glue(struct dwc3_imx8mp *dwc3_imx)
 static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx,
 				      pm_message_t msg)
 {
-	struct dwc3	*dwc3 = platform_get_drvdata(dwc3_imx->dwc3);
+	struct dwc3	*dwc3 = platform_get_drvdata(dwc3_imx->dwc3_pdev);
 	u32		val;
 
 	if (!dwc3)
@@ -142,7 +142,7 @@ static const struct software_node dwc3_imx8mp_swnode = {
 static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
 {
 	struct dwc3_imx8mp	*dwc3_imx = _dwc3_imx;
-	struct dwc3		*dwc = platform_get_drvdata(dwc3_imx->dwc3);
+	struct dwc3		*dwc = platform_get_drvdata(dwc3_imx->dwc3_pdev);
 
 	if (!dwc3_imx->pm_suspended)
 		return IRQ_HANDLED;
@@ -233,8 +233,8 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 		goto remove_swnode;
 	}
 
-	dwc3_imx->dwc3 = of_find_device_by_node(dwc3_np);
-	if (!dwc3_imx->dwc3) {
+	dwc3_imx->dwc3_pdev = of_find_device_by_node(dwc3_np);
+	if (!dwc3_imx->dwc3_pdev) {
 		dev_err(dev, "failed to get dwc3 platform device\n");
 		err = -ENODEV;
 		goto depopulate;
@@ -253,7 +253,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	return 0;
 
 put_dwc3:
-	put_device(&dwc3_imx->dwc3->dev);
+	put_device(&dwc3_imx->dwc3_pdev->dev);
 depopulate:
 	of_platform_depopulate(dev);
 remove_swnode:
@@ -270,7 +270,7 @@ static void dwc3_imx8mp_remove(struct platform_device *pdev)
 	struct dwc3_imx8mp *dwc3_imx = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
-	put_device(&dwc3_imx->dwc3->dev);
+	put_device(&dwc3_imx->dwc3_pdev->dev);
 
 	pm_runtime_get_sync(dev);
 	of_platform_depopulate(dev);
@@ -296,7 +296,7 @@ static int dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx, pm_message_t msg)
 
 static int dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx, pm_message_t msg)
 {
-	struct dwc3	*dwc = platform_get_drvdata(dwc3_imx->dwc3);
+	struct dwc3	*dwc = platform_get_drvdata(dwc3_imx->dwc3_pdev);
 	int ret = 0;
 
 	if (!dwc3_imx->pm_suspended)
-- 
2.34.1


