Return-Path: <linux-usb+bounces-31208-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F47CA8206
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 16:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88C0231C903E
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 15:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5A3346E42;
	Fri,  5 Dec 2025 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RfqT+acj"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D52329C5E;
	Fri,  5 Dec 2025 15:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947552; cv=fail; b=SZMC3fkOGTUhLp9uNc6QAL0bAeQl8ttvRU49jmzlUZUe8p+79ahoyygEJ4cbdRLQM/SQMmPe3uMHM6uum9CD3Cd4j94eBI79mucvh//Y90OK341M4DWg7BqotNpyizrZUFC6+wElTQLDz0y11l13YHSVj+tmXu7cF2cfH8lo57c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947552; c=relaxed/simple;
	bh=WxMR/LKu4ekYoOWxorLeFlW3ygmy4lRAVjTe1ngVpaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qgrMMry6KHhPjiRnPnq/6ZoRw1hrXCwTH3M7NCc18mefn07HTGA8v8noPIZeU9oarch+tORvAI7aJnU+PZRyQa/cGGucxOb1IoDJZsoGEXije9FxJhHjzi1nPXtGHKcdKSlP8LlJC8Ljr11MM68GpK1ppGQ3aSNIg2IGWxPxrhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RfqT+acj; arc=fail smtp.client-ip=52.101.66.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4zBQsICyCTOdUig7FsqU1PLIaSmrByvWmMgzFPlifjponr0Y1rNLXYMOcSBzaHCsMeLO+Muleoe1fGp1SfeUor23XcfHbyfzVc7mXd6qre2t8akLSK8mrQx0xXdfFEc/HoTS4FeuLvaKmgbJ9pFHq7C/QylqmitioU3CjpiDvgULZ8+aPmtctiPrxfSGR7Hszb356BGX4O6J/sXW9Jaf1BpPuNgQ9oHmpHec0VlUzCoVChDNXgqL982wqM0KqHkJz2oIa2gw+Ry/DqqNBlW56m0Uw6SSyPN+sgo4rxD7wByXmdECJAs8TcFxj/KoVnF973QRx37rh9bNkrvT9theA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4VnFOJSnBCySgcVyAkoAwokFV1vpjEcQd1xySJrCzU=;
 b=TLrjm2iPGELCJgCqmg0rUSBYXzEvyWhTeXmAvKfpskxA2SKhNpuLEUBa7ttXE50E7xgMFJYnrT7gfboHIS39zQrOR4yH3TKdu+/JDbF7PaxuSeZP0LNvEMPbkrcuxkQPdZoFiZpuWQ3mqLQydkLZ0lpcANWfENA2V67B+nvgBQXkfUC7IWH1mK5OMCAgbVru4AxhysX9lro7I1dzcoCvaJ2KSPfCldXkB61UJym66WvzEKmcJh1Us7XNXXQ6oWRFxqAPnUHfmk6xjh3VWYlZRis7vNy6bcrW2TLRA/HWTGpTtNPaN5v6/YhfYk/wotoojf+7jNIJWk6pDkKdCSr1Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4VnFOJSnBCySgcVyAkoAwokFV1vpjEcQd1xySJrCzU=;
 b=RfqT+acjYJhnoJZ/3whJioghTsqYcBg1poZkiTlv3rC1i0lcY8F319LqroQt1Y7Is0WHyvfY5P84MPqXECcUs8Ha+oOMUN6ut4JYGCw2+WDoHOcrtUhqOlRkXz5AqpH2FF8s9/qLTafgHvXtUDAa6zc2ZTQzv4a1IR9zasPUor+wWhS3haz9I5uZknKRjwEa22oRehmRgXUx2kgfSwT9ty8sp0MqqxqMKTYYysgUpLIDDo6toH/trwlDT5D47FvSMB931HaN3ICGeBmRPeq6ljO6gMOev8eFx6+YdEcnVlTApwRvrrBwtzcMFQJ1t+xK7N8JTczEgaUPcO13EiCMkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8863.eurprd04.prod.outlook.com (2603:10a6:102:20e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 15:12:16 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 15:12:16 +0000
Date: Fri, 5 Dec 2025 10:12:09 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH v2 2/3] usb: dwc3: imx8mp: rename dwc3 to dwc3_pdev in
 struct dwc3_imx8mp
Message-ID: <aTL2ScHJNTjj9AU3@lizhi-Precision-Tower-5810>
References: <20251205032942.2259671-1-xu.yang_2@nxp.com>
 <20251205032942.2259671-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205032942.2259671-2-xu.yang_2@nxp.com>
X-ClientProxiedBy: PH8P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::10) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8863:EE_
X-MS-Office365-Filtering-Correlation-Id: af869684-8154-40d3-b9e4-08de3410ad4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a1U1tAKxmMHluJTbB7BdTllOutmpehr0PGm18aLQzqwiqxRCycyiHwySF60U?=
 =?us-ascii?Q?1KyBP02HIaHenb2vf8pXO3sIkuiX/oWDVDAoPIBzmPMtWsPcfHJMFyNBg5oF?=
 =?us-ascii?Q?qAtINSYSQG4Re4jutoYK3NcQRM6uT+e+oTL54/4HvmlG1J+ZR3M6lChCARFM?=
 =?us-ascii?Q?gs+BgsrzI2WF8D5SZDPEB9EwgAij2ohptK9kMr3+pNZ647KMzRN5GiXxNH3C?=
 =?us-ascii?Q?iOksLhxCvRAZ6MN6aqVnppCX7jv1luuz/Kiz5GzKEMsVfcq378F9AaZZVmY6?=
 =?us-ascii?Q?0iM14ULngBUL1EyU9LsMIp2ETyFg2XEZT/UcvrTRDTPnDC4sFljOmX8iVkqF?=
 =?us-ascii?Q?4NPA1FOFSKd+lDatWodf0HUhUrcGc337Tbv1p2JYqDpDWzC6fT29pAI4lvVK?=
 =?us-ascii?Q?QgBpko+4QxlFRnpPTCRu365PRoDX3t+AxrRg+dHDQyIIZElBD+AckWXyxCxq?=
 =?us-ascii?Q?+zJp1Dul085vTPFdNmJ0v53EWkTUvdJIvH6EN7Jqbk1Hai/x4ZetAopPYGqy?=
 =?us-ascii?Q?BH8m/cl62svfQ/vtF6oa1Lm+QxVVGk8b2EBT8G7ELSqjS9gjqZJEh1RyutOy?=
 =?us-ascii?Q?zwsQ2gLNmygEl1RQ8hzfKEEsGY0EIMAfqu0nCE/B1qQBaJabH/FLPi+3EHA8?=
 =?us-ascii?Q?CuOIZXHWg+0h0Z7ZONOkpibGO3svNVAi8mbFH84o2q72WiVOIRMPK2rWIIE+?=
 =?us-ascii?Q?7gD1UEM05R9AaONYLXA1J4+6CyvBbDHLaYyk4LpMfYC5l6H8jyH1Jk5wnlIv?=
 =?us-ascii?Q?MHAizwtMtKatW5bocopLxhJiNvDzOhOeanoTa6+o+VQV7svNgr56o/W905BV?=
 =?us-ascii?Q?1juorZnMUqVhg4c2sRTUTacE3ZzaywPY6Pr8Dl89N4qceuD6AkLoFj3Uzcm/?=
 =?us-ascii?Q?qI1yQvPPhZdg51TuhEwVDlVgSaB2+oYqcF6l+vXV+ERWP77cRWXi6ugGeRws?=
 =?us-ascii?Q?XhEKCdHrUNL1RYAp+FogkIVxHZbMhKTCnivM6aJqiDGA5PnNwMF5icgTMyXs?=
 =?us-ascii?Q?ea8EtOgHp63B0giyXZXO6+Z+MQbv9ejqkGUJ8+61QmWGG86sRYz3kWle9XRg?=
 =?us-ascii?Q?0Li5LorCRnjC31sWL0m+XARvM1hdmByueqgIqC7cP6lPiB+zBGxkGY/HsK+l?=
 =?us-ascii?Q?kZDaeEmxbMVKUBTCtN6PrsCDEKWo9oDJ4KJWobdoz94LswQ8DFb9+U9m9sRW?=
 =?us-ascii?Q?rDTlf88ipE7/7vebHa9Ig3ikdCu99xt5aBmTswcXlxjCkAujA7raip3CJuJS?=
 =?us-ascii?Q?9Ej356EvzbKmyuzKc+HdMSMOD8hTDRmw3hy+3NH2MYYQ1eiff9+PvlazIS/0?=
 =?us-ascii?Q?EfqmSZfXuWFKTMBnJwQYFxN9oEOJQKozxTUITEQ/wetYFXl2vsnpWEQFEZp5?=
 =?us-ascii?Q?SXCEkPxP0getEaVHSblTyxvycxEE8w6my0zO7BUbJa834d6HyZJZfiBaNYwe?=
 =?us-ascii?Q?XUCtxrswyD0cfHcG7MpxXv3V1isln6DEnfMS458UZxF/8+p8S3x/RD2RBZhB?=
 =?us-ascii?Q?xSC0Tk03xuDI3skBEdUXVvy83cOzMKNPGNMu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6GO74N/N/Wyf8Xo2aK7wzmzN+BX/FzMh04+5QpVIfRYlPuDitlNpNlSTTuMq?=
 =?us-ascii?Q?zWNkY7yoPYH3CEzcpDp9b6GiFhBsqODGsOInyY0WuHJueB+gzEPloIzME6Nj?=
 =?us-ascii?Q?EYHvS9ksAfvUqS9kvqQJCK/9KH2n09h9Nwtky+VuD7M2iW8MVXBO6mYmgVi/?=
 =?us-ascii?Q?tGmIzKtxeRAMb8KlQ2QlWWPRtKbfm6e6OlJ5WdopkHKD3Ux1UtodgjKbXr8N?=
 =?us-ascii?Q?K4Xc4Qlw1xFL6Rk7L8nR3Irlcl4mi/6TuI+PpwT6qA4l0Q753mqL9tDu513x?=
 =?us-ascii?Q?gDx2NxAIc9Q8raPXjwUgxrz4nqeanZ5xjSYJxIkmjOb4AK6rWgUs4tHMUK1O?=
 =?us-ascii?Q?8XfPwbN22ybpghU07z0Qxw74ut2eXtlqF6fJWTyUsIhB8mxH6+Yxt6wd1PYO?=
 =?us-ascii?Q?Rg3ADEP+2TA0Ttp8l+FmJdUt6NaRg3Ycz+D6yez1P37zhTzt5abGHFAt/3KZ?=
 =?us-ascii?Q?7HcXa+c1jM9Rjs7Wm1/DhBrGkNpHM3FvZYASR4vTnGd3T+ue8EcVaalCfjow?=
 =?us-ascii?Q?87bFATUmw/s1tYmaClWZ2afoo/zE50Rl30BG0xowZ2fyD49nIMF15WmGgPwh?=
 =?us-ascii?Q?sgDveTRX6QXQ77jn0dbDmycXWDWRfMzk2Junk0cvNvJ3UOPXAQXKd7ky/1Kt?=
 =?us-ascii?Q?FPv7JztfkOys0IF75rJ2sYd3qZ1DHyvHB7/7CrWMs3zXy9idWil1JvXjTExb?=
 =?us-ascii?Q?LSaRj8T8BC6yJYwcD4SOD9gUgb3SgBLPrdAzlhQoYoYequ/2UM3HIBniRz8s?=
 =?us-ascii?Q?ybnEeRpuqSSZHr2AoP1knM4bHPPsijID9AHmUC2O7O2GiHdHzyS5kh2jdZYo?=
 =?us-ascii?Q?1edA5NdRLIYRF0Gyb6iWt4JyVT7vAxEAXSM+bPKYd5PyzmhBrgGVAm3Um7y5?=
 =?us-ascii?Q?xbcFvckBxE9Ty7bumy5XsVAezSuE0T/BGqR0a4XQ/ceaxovfaBpMpYztW9xw?=
 =?us-ascii?Q?tKuKi5JU5KVlIFH9RnCW940mgMsMTVXnszFiQE9o6eYe3k1xsZO1Kg431fIf?=
 =?us-ascii?Q?3XIbAu2L+q2vp6iMnD4Bfmixy0DeHvGpLUGwxI1KwjuvZ9nQJAsNP8HAc2DV?=
 =?us-ascii?Q?RICNMoVBhQa/49t2Sv5vv2xuBUYOQ7eNvOGdCg3GOf6GtokNWRnJup70dO3I?=
 =?us-ascii?Q?Ej06KEiVhTVSApjLFBN/3TiADpO2X1iT9krm+WHafwzc/f/qyFZu3lK03Ft6?=
 =?us-ascii?Q?XmlBRgJFvRuHr9/dPOFeGe2Bs0MPlCMHTs0bOjefCOoVCNZ8JJEP8sxqISku?=
 =?us-ascii?Q?pO2GsSBPRpUfpuQhfrjcui75fYITgf2lMnK/KBKCGrmWiLmqfT+9xiib7vG3?=
 =?us-ascii?Q?sNkmyKLq7k91ySRS82/DnaFBozqmJTtoRlKruxKQ1fzbsPOJQ+JsnKp1kRzL?=
 =?us-ascii?Q?S3xH8rWuFvR0NTmLb3JOx+7zFFhHkqMpoqqDbjJQ5iCHgIKZSW31gt5aEWw6?=
 =?us-ascii?Q?oMBkDzuO2Bg+antjA2ZtVoi4sF16kKuvneC9r1NLTAypkqRuviD7/QyVZnjc?=
 =?us-ascii?Q?PxgtLPCisWNTP+pYgu5XjSNge1Z+Am0rJZmEcwREUWxRU81i/DTMMF1fz1zh?=
 =?us-ascii?Q?IL8cEA61KMlU6XIGPxJwFZul5H6STV2NRqD9CoBc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af869684-8154-40d3-b9e4-08de3410ad4e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 15:12:16.7256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2DsJqmfXsdVLA+sKGW7yDhQUo6oZKVSQNBoPrcgXnaiIA7UZIpS6mHKI3EJWVF0At8ORA74XdraQrUMMDStmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8863

On Fri, Dec 05, 2025 at 11:29:41AM +0800, Xu Yang wrote:
> It's confuse to let "dwc3" represent a platform_device, because "dwc3"
> may also represent a dwc3 core structure. Rename it for better
> distinction.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v2:
>  - new patch
> ---
>  drivers/usb/dwc3/dwc3-imx8mp.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> index 050da327f785..8bece4baecbf 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -51,7 +51,7 @@
>
>  struct dwc3_imx8mp {
>  	struct device			*dev;
> -	struct platform_device		*dwc3;
> +	struct platform_device		*dwc3_pdev;
>  	void __iomem			*hsio_blk_base;
>  	void __iomem			*glue_base;
>  	struct clk			*hsio_clk;
> @@ -100,7 +100,7 @@ static void imx8mp_configure_glue(struct dwc3_imx8mp *dwc3_imx)
>  static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx,
>  				      pm_message_t msg)
>  {
> -	struct dwc3	*dwc3 = platform_get_drvdata(dwc3_imx->dwc3);
> +	struct dwc3	*dwc3 = platform_get_drvdata(dwc3_imx->dwc3_pdev);
>  	u32		val;
>
>  	if (!dwc3)
> @@ -142,7 +142,7 @@ static const struct software_node dwc3_imx8mp_swnode = {
>  static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
>  {
>  	struct dwc3_imx8mp	*dwc3_imx = _dwc3_imx;
> -	struct dwc3		*dwc = platform_get_drvdata(dwc3_imx->dwc3);
> +	struct dwc3		*dwc = platform_get_drvdata(dwc3_imx->dwc3_pdev);
>
>  	if (!dwc3_imx->pm_suspended)
>  		return IRQ_HANDLED;
> @@ -233,8 +233,8 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>  		goto remove_swnode;
>  	}
>
> -	dwc3_imx->dwc3 = of_find_device_by_node(dwc3_np);
> -	if (!dwc3_imx->dwc3) {
> +	dwc3_imx->dwc3_pdev = of_find_device_by_node(dwc3_np);
> +	if (!dwc3_imx->dwc3_pdev) {
>  		dev_err(dev, "failed to get dwc3 platform device\n");
>  		err = -ENODEV;
>  		goto depopulate;
> @@ -253,7 +253,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>  	return 0;
>
>  put_dwc3:
> -	put_device(&dwc3_imx->dwc3->dev);
> +	put_device(&dwc3_imx->dwc3_pdev->dev);
>  depopulate:
>  	of_platform_depopulate(dev);
>  remove_swnode:
> @@ -270,7 +270,7 @@ static void dwc3_imx8mp_remove(struct platform_device *pdev)
>  	struct dwc3_imx8mp *dwc3_imx = platform_get_drvdata(pdev);
>  	struct device *dev = &pdev->dev;
>
> -	put_device(&dwc3_imx->dwc3->dev);
> +	put_device(&dwc3_imx->dwc3_pdev->dev);
>
>  	pm_runtime_get_sync(dev);
>  	of_platform_depopulate(dev);
> @@ -296,7 +296,7 @@ static int dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx, pm_message_t msg)
>
>  static int dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx, pm_message_t msg)
>  {
> -	struct dwc3	*dwc = platform_get_drvdata(dwc3_imx->dwc3);
> +	struct dwc3	*dwc = platform_get_drvdata(dwc3_imx->dwc3_pdev);
>  	int ret = 0;
>
>  	if (!dwc3_imx->pm_suspended)
> --
> 2.34.1
>

