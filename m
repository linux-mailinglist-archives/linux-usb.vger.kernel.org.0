Return-Path: <linux-usb+bounces-32191-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A32FD13973
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 16:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18E8430ED6B7
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 14:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE442D97BA;
	Mon, 12 Jan 2026 14:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TJxlnRDo"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBAC2DA75C;
	Mon, 12 Jan 2026 14:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229772; cv=fail; b=ZfVcgrBLoH+xo+jc1EODpsUOjDEYH3lYWypfEDzx1gGU2jJQXEE4HWWqMPYzCU867had1aFienpIiIkI0YZQQvWyaUGi3Kh6rtmegWefx4D7oHQc1D2RD/S7RxbtHmzD8nLM7+g9uBAkrM75NghqNGtzFPFqvgkaK/bPkOsoVPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229772; c=relaxed/simple;
	bh=VtygrPhU5wTrRKgeLAbGvxhQ9jmLzxS0hMX+Q4SHssc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Xf7r4YgNx8+A0XNIsWST3AbUgoreuro18KW4lsx7yTQyw3b28Di5QFYTrovrSGmGnyZVZ02Vhon/HEF2g8/Ar0Ka0456W+d7krefcBDXxkEn0BbXwNq3K7t1GgySaH7gTsm1gEaGBlAUhavEjlANz8NnELo8WPySSiazWQo5VFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TJxlnRDo; arc=fail smtp.client-ip=52.101.69.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixOgfbEOAsyScbDRTmLkg7hFsrUmwNqmJIc3nb4fYQnvzjG/Uq+CMyPg71Sh69w/Nbb2UPK++hhjdPfTg3S1iqovFZr5BYPBUBU5OD14aZyxuZJpsvEmXz8gNovc1ik1BPpXQ2VBsOTwOmmC67YWED1qyovAqUHXxPWmNp58eqahuZ0/pS/+MV7bY3P6dAP+c0PXApJL8kDqaNKo6w070fxF1qLa2SWAPPOIdPKdKo2FUMuPkVmt5uN6MY1M3e/4ptFdMMW5iUw55GDX1mksCjqkOJth9Pwz8HC3WuZJo8c0ZmgE4u2PJg6FHxAXCDnjCHKp+XPMuJdy2Q1i9tzNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpDJ1aM2j3bTO4WuAldeUKVMzdB4oHg5BCunZ0VVY1U=;
 b=HhlfvlC3rkf8lQM/uvrk2QzDSQTrC7uFzlwJixPdg8OY2ZxRBIwU2X5wK79NZ9M/4NOmXF8bcbiaKM/kqgq61ugMKiMU3gucGcQ5ULOdKnmbajTQ8umJn6gPLCkz3H2ymtibJZnY+90l1L354CsrPAWPZH10LtoTU8L2R0WyqWo0YYrOTYfN2o/F8GPm0iW6rJMW+z4OIw9vbO+TINmPpYvcSAjMy4tiK6XBEsvv/wignaehshb+h8MRCrgA5LMmwckswoKfx3FrEYR353vV12/ia/l1FhSkb15w2BnvQcjs0DJ1UEcmWqUrII/ORuMtDjqBJ6f1Mp6Xkrha/elFKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpDJ1aM2j3bTO4WuAldeUKVMzdB4oHg5BCunZ0VVY1U=;
 b=TJxlnRDoNFmPTGbJbFSZKQxAoXLYuWs++CLdgINUahF9M70MIW5hcYMwbnjV6c0Xd2ZdS3pNeCBI3vtf/tDZ1a9FYZNrqYlhZkG3fjE0R9+B+4U2anb5MZ4a1JRoKyIo892plynb7LTUySkBBBVsvySf8utqH0QnPOEuno3vHo12dlCAIOpcXe4+8rcErz5EZbURGmuCTEUqvtJWU2vyWVU5bJ/71SBB74FAE/311eyT40ygomyMFT+0ntXZGN73gyYws5w7by6xl80E+P91gpU8URXi29pr70rem8sSJDe+YFyv5CLNCNVOIkxi9QMJjP/8tV7233xi8iTUghrO/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI0PR04MB10855.eurprd04.prod.outlook.com (2603:10a6:800:25b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 14:56:08 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 14:56:08 +0000
Date: Mon, 12 Jan 2026 09:56:01 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH v2] usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for
 wakeup interrupt name
Message-ID: <aWULgULDwhfnxW27@lizhi-Precision-Tower-5810>
References: <20260112110408.3263954-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112110408.3263954-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: PH8P221CA0061.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::17) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI0PR04MB10855:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e8af58e-6622-4ac7-9bd6-08de51eab82f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BSP2uN44zqkLGTmY2tbh3LCroUDup73Y2n0LOkmpNF8o30RDco1I6/MzV2Ma?=
 =?us-ascii?Q?P8YUvLdo0RSswfbifIc6VoSxIJB1uNkIfhPFNJKFtuItz6byqX1uFZY+kkca?=
 =?us-ascii?Q?tcONlbokoKdY5Kd4AYzXUiE62b3JeT9jPbVqWjK81rR/loM1V61T9cuiqjW2?=
 =?us-ascii?Q?3TnvJxRMZPvw2ir9Fh1z5Hw2q/IntJfEmqHuH91NRMTeQfSNls7Ma3zxA+Iv?=
 =?us-ascii?Q?twnh7cos95k1MOQB4XrI2TGUL+TTBTpwRBD6BKioefKNAXT6RUUXp6IheqUp?=
 =?us-ascii?Q?AWOTPegwrjzB2sf/AEe4AYaxD+M+FUs/2d6+D+5eQpXzCWobCequxnwNObfb?=
 =?us-ascii?Q?Fi2sEUpQHEKcvdhIlkAXinSWNG2wm95ZRTEUXMPG3R7I2SengkCzbbkBvyAQ?=
 =?us-ascii?Q?cbOq15/FwmO5o3wPUNj4hNlx4S67rrbh7nx7NNjK07mWVGw9qY3Nag20c7Ol?=
 =?us-ascii?Q?AZwkVquuY41/whV9ojepwa1QPD1BKz2rSXcZrw6sQz4VgojJz7g5wDzZR2cK?=
 =?us-ascii?Q?fl05N0dio95c70RHXB1avWgi+xiuY5lcbHrLhRhYXcXGnQwNVLH8veUWzeac?=
 =?us-ascii?Q?I3BHAl26RMjABd8WsfsdoHWpSLhqFjH/JuPHmF8ppQzabhTOCG409hA7wjY8?=
 =?us-ascii?Q?G9VxHV3FVBnNURdrVKjpSjPAeEHswGes/AKWcGOwzrfPs5HnMy5FljNUlozF?=
 =?us-ascii?Q?CU3t5qpJV1e64OJHZrgNgM1t8Hd8uGp4jjNji6AiU3PqAeoQKG2oYjqgmo77?=
 =?us-ascii?Q?p3vxAkP8iriDUNyHrVjcemR7ezfhfDJBkC+zW0gQLayqlKgJnIR/ATUPcfg9?=
 =?us-ascii?Q?SkaMABgXCRxbbYIHD5Favc9qtN6i3sSzILvk4emNMZDgoTuysLmAa65+n8SM?=
 =?us-ascii?Q?pC0We40borAV8RU2dlS/bS2IdSOccXKCA/kNDagn6YuFMpmy54Hynv6dWthX?=
 =?us-ascii?Q?KeUuiYOC3npP4yxElVhRVFk5ApAO7oFBb43Xym4y1elAJbQJYdlsTmmbbim0?=
 =?us-ascii?Q?y3R8Q7CKQehBIl2pd+d7UNRevCX2577D1+Zc9oFwkApj/bsRkCPhZEAYbWld?=
 =?us-ascii?Q?JFSOkrcLMc7DdVF0Ac3/WJ77VadFmnlzjc6gkII9shlrOun7i7ezUDstcVyi?=
 =?us-ascii?Q?N7x0ELYHrFT2lzXTK9+Zd6Nkt4PVBZcZ8OUKUDyWVRDk/b1n67xeARZdNtuS?=
 =?us-ascii?Q?TUHux4DG2MZKEEMFETAV0QSdwOMP0OWGeOpjLOXiOJA9dsYuLcRFL9jZvNKm?=
 =?us-ascii?Q?eApYxcfS4w6tHFuNqOPy9ANpuJ6XlmQYcUI84nPYB2CZylTznvX3N5xtwzt9?=
 =?us-ascii?Q?uSawl9pvB4vBXWWis9F25G7wxSZtSzUw0u3gJlUNmCqhGiD9/YNN+yuyspHw?=
 =?us-ascii?Q?0siCxCjo0ntk+T+zoDjWIUddd9VDqc5a3wyFdI8uWB8lFYgMD2jTNAlQuzCv?=
 =?us-ascii?Q?utJKeD7E2W4lh5/WtuvMuU60c8qYN7NUEPcI+SVNJIjPojBYr4Sab6cHb0ZK?=
 =?us-ascii?Q?VlWs9fG45aTpueLB4x/qYZkoK/yVY2N4vARE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bIZXUKOLg5yv3OwPekmtNezAlyJ9xmY2UIVNMnZUaLFlnWJLkuGUeiiv2Div?=
 =?us-ascii?Q?TFX4vohOLpi5B/25v8sTnQMbrwr/DV1SsPqZHN2soJMn7nJaBJuv8e9ID0CY?=
 =?us-ascii?Q?zCIdVAUXvxjUkBd4FF6+Xjo2o3ckzTQJde5ESDZlI7y02lavjSHJSOe4ARLs?=
 =?us-ascii?Q?m53hj1GUCoB6ka5t+h/aH1pfPjI4cWeL/zE5b6K0EFT0BtkQEYBoz2B9OnGk?=
 =?us-ascii?Q?29zXZppSAWG4Cd/KT4gOC3aX2rxL3vog2IlLRVKbO+8X88iTX4lxvuVNKsnp?=
 =?us-ascii?Q?+IXE4JvQuKADogCnVF5G55pXgZ+sCk22fEfvKHdcQ/45s+agbFXpgkH1h0xq?=
 =?us-ascii?Q?BKraLZRjd4For7H4R4jFbAI9SUuyJCJszU5yHWiMONhXd7TNKTXYqHSv1zYr?=
 =?us-ascii?Q?6+uCd2F+ofqSPQ9/hUHadAcWaLtEDOUuAoOTersrlpCw+DhUdoHDOhIh6GUj?=
 =?us-ascii?Q?Om1Wfu+WYK5XKNCHnQek4j1KRJshNkrb2MsUy6fqUwPtcAHRiKQuJgtLdcz7?=
 =?us-ascii?Q?S71l9hXb817t4tWEEHfHy/3kQNgGBd8xq5Gj8dBWBwSuZDHY3oy49a7l3cdo?=
 =?us-ascii?Q?uqjUbwB4OCiby+M72U+ZMMETZhm3JATkVGX2/P9g2V006e8F1bL1prYfmX8H?=
 =?us-ascii?Q?fpQgqXhsSpmTWIK3eo+Vtg19//NgZLBaQgMq2srdxw3F0EnthMrrR/UgKkLx?=
 =?us-ascii?Q?/2L0sc7FKiibliYHvfz1XREWPMkPYiziyt+ZB4JdXfCUk+UMD2Oz836s2uFl?=
 =?us-ascii?Q?MSL7vtjBsMREE7q6JQJIBMcj69KGRniRzBio5Qd/pa0m8PWKAOcYb2wzxs5q?=
 =?us-ascii?Q?rhKD14EubnI2yQ/q3Qtbcg4Scgc6lX7diu+vVKJeW8uWWsZPBfgpA0L+ZQZ5?=
 =?us-ascii?Q?DSYG7Y25sovUyvF1yXAK92DXPr+vhGtENl5q+EgmaW7eaPtm96YfjjN+1qYd?=
 =?us-ascii?Q?O4o6cD4Ln8BAjIPnWpnh83kDQkQTXuKBm4wTnmN+ODkcXRiX+5ga/RuS3ceD?=
 =?us-ascii?Q?lL73KvJChKQ/y4AC5mSbAvf2Y7GcnZmmCloJibJwykMwBJ1NOZTT9pj9X6Ro?=
 =?us-ascii?Q?DP3PiSZFOrMExk2sIQN6VsBva17gZXrEe7BrBfMyW+Kd4OP9a5kMmYA4jE9T?=
 =?us-ascii?Q?KNMKiQHY90qMiRQDw1kmN1qLtsw1YOWVaX3ocTIqOB4BZ/bzePtef9xPjcoa?=
 =?us-ascii?Q?F72ff3Jxrc3JOFZ5QbZsj2aBu7dBAgrvjURSiGX4sdrZaCX9MKW4d8Y9QIh9?=
 =?us-ascii?Q?wcxEoRzPrCU7nQ33tZ6Fu7mgsa21EM6I6XUybF62MA7s9gM7L0Etsb3yco7x?=
 =?us-ascii?Q?quppINZ1BvcnE8SdtrRhzYKNT/k40/C6V5OlgOJIR5iKnVSN9QnIVUi5Mnay?=
 =?us-ascii?Q?k1uzv06GrLQb7AI2xRLa9eZsH4F7IzxYZm4aI9r8/e++PUfStpYAURuOQ5VE?=
 =?us-ascii?Q?+Ou5uWy9A0JrrmnXIYyVjjWKLkKUda8cHa7Zo2Lc6BL9OZ1ULfQ9GmElZTH8?=
 =?us-ascii?Q?JT7O4VAF9U6NvSnwkM0429Uv8dN0lRjLnEmsw+G7Oi6mx5Q16QCXe0WkCF3y?=
 =?us-ascii?Q?C+DzZXbtswpQF+bmz3xdlHGEdvC2HIILfiM0YdhTxtLyp7GJYNeE19LY4zy/?=
 =?us-ascii?Q?LDNzYX9iFHJigdh1HhL7zwWG2basSUFbEpeZV1PLIPIArowinYkurKzUMtYS?=
 =?us-ascii?Q?fRHDUlJboWH60xjCEsFO1E+9hj4hgENjRbCmQF0lj0W26VbK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8af58e-6622-4ac7-9bd6-08de51eab82f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:56:08.8763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0s6ECLo4AbucJwkmnloTqv52/EGMqEplrrWQ/GpwB3GU10cKvB32SccP7Wt6r0i2pngb4IwWiu83qze8Y36bMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10855

On Mon, Jan 12, 2026 at 07:04:08PM +0800, Xu Yang wrote:
> Currently the wakeup and controller interrupt name are same. It's not
> easy to find the correct one in /proc/interrupt at the first glance.
> Rename the wakeup interrupt name for better distinction.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changs in v2:
>  - check return value
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 9 ++++++++-

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index d4ee9e16332f..56d2ba824a0b 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -385,6 +385,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	const struct ci_hdrc_imx_platform_flag *imx_platform_flag;
>  	struct device_node *np = pdev->dev.of_node;
>  	struct device *dev = &pdev->dev;
> +	const char *irq_name;
>
>  	imx_platform_flag = of_device_get_match_data(&pdev->dev);
>
> @@ -525,10 +526,16 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>
>  	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
>  	if (data->wakeup_irq > 0) {
> +		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
> +		if (!irq_name) {
> +			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> +			goto err_clk;
> +		}
> +
>  		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
>  						NULL, ci_wakeup_irq_handler,
>  						IRQF_ONESHOT | IRQF_NO_AUTOEN,
> -						pdata.name, data);
> +						irq_name, data);
>  		if (ret)
>  			goto err_clk;
>  	}
> --
> 2.34.1
>

