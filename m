Return-Path: <linux-usb+bounces-32072-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 635CAD042E5
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 17:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDF9E3587739
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 15:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC67D2C11FE;
	Thu,  8 Jan 2026 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mDDozmjn"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013045.outbound.protection.outlook.com [52.101.72.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72441F4C96;
	Thu,  8 Jan 2026 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887160; cv=fail; b=LIdgJEgEjUgYIghhtMtisscfBOJo7FIfHe1xaktwsA9jYsmazNKT3UaC1ydsJSG9kWIXb3SYiHHkXT+IgCZIlAaCNWw+P5RQ/o0MKf6rRuXTJJHNaZdtTFzIuhd+Fzev+GUeZbaqvdNIrkr6CKovlqxwy92H1FhkbgmvsWtL8e0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887160; c=relaxed/simple;
	bh=E35brUboWqhP9v3+pM2X7+Y51D9AzJOuIKL1XuIvfPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Lo6EdhDuOMF4MPgukZx3/qbP5k/foCVlNfyGReczPD3JQnIephMxxqb458n8RRO6dUGAftbtPMZz2jg2JB5eVXVfEZQHG2S8UPgo82BTaLnRyXBjttJ/9Li7KC7Iw6as4o7GREw2DrvBudY9MjvFSKaITY3aIoXvsboqZO0HtDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mDDozmjn; arc=fail smtp.client-ip=52.101.72.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RaF7AgxGQCF04wmNdxoznyF0JSkhwvo/Z+B68TQ7zloQ+IBBNoZ5AMl4ELadv4CP0VYneT85KdB+Zv8ctyv+h7BDqG/1aegHPf82fX8DCrMX981XeGRDYxwbOILpOl/DMLrmDAbkx79P+49Pr8BBimQ8Inoqpe/+mmys4in+iW0NmmWwL0n/S/DI3H6Dq/OggFT1g8PEOpDCF+LLLId9KiekNgYJkJqrpZt3Tl/aIuCcRGHa6win+DieFbpEEQgA3joQcd78eZMOmLr4xOAmPItiaYMvJQrDi8Wl6zSdO32sGhBU92hOu/xYGE3Kf8di1UMQoM37ipVfUyY5eYpt3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uv12hnrwE/xCrwMlzRCr8JMFimc5f//NoJYxZtR1Kb0=;
 b=SouOX4m/gn6w53zgrl0iyUwC7z9SF0uElN3w/Dp12/UjoHMw4s8WjiY00b3CN9ZRzs5VL8dUlRpqLS9y3tS2Uy1rOOSMv+of4Wg7ZSKN0vrl2k6aSFEI1SBddr6tlGcUliUnAXje1XK7LpzMHSYLDZZDkiqI5zOKh6mJdw41ow3BipZ03xQVJTjP0LNid/8shyIJYQz26G++Nbehu+58PwD0yp+ZLjo6SuvxiWifGcF3IBh3A026Hdv/51e24+ZxafE0J7oU+L3gIXCg0qjle/LXT5vIHaBYMsalZyZ2dF5wWzaZMMI71UH/Uh7TUO8aynKAdcrdosG7uGn9wq9W9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv12hnrwE/xCrwMlzRCr8JMFimc5f//NoJYxZtR1Kb0=;
 b=mDDozmjn0lY9bwuOIdvFPgiUButRl9Ww9tVucMZjzkYVuREiRNMmYVlYITg8c8hRkacAVCKeDgL0fDxjdlyucDFVTampXSjnTBkCGUQIEMkICd7m+79aFaze8A9ySBediLw8CE9iksmWzeh5bMNYr39he+Evlk04jF8Rp8loZFoj/glyldFPrjPcpx4Blj0EWEFK3MB32Eh+xAPnQh7nLUVY4ASoXjUeKou+FboaaUTfjcrSPec0n86OwqwO7klKMUcY03Y3eFg1hhPMuSzXA3/SHpyQGfsiLcJU4KJlQ5SlWHXoAySTQT518qhpS8o101QhcQtIq3bM29slfQ68Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI0PR04MB10903.eurprd04.prod.outlook.com (2603:10a6:800:265::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 15:45:56 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 15:45:55 +0000
Date: Thu, 8 Jan 2026 10:45:48 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for
 wakeup interrupt name
Message-ID: <aV/RLEJQ0PX6DCAn@lizhi-Precision-Tower-5810>
References: <20260108103521.2139824-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108103521.2139824-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: PH8P223CA0017.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::9) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI0PR04MB10903:EE_
X-MS-Office365-Filtering-Correlation-Id: d4bbe116-b6c6-4170-8a2b-08de4ecd02d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hIY8WxiybN9Pi927AmTS9cNEkt+BrAPoxjWy/E7dskB2UuK65DU8pGcepMQ2?=
 =?us-ascii?Q?dyhKx8DRdNVC9lqd+/l6y2b8XPYNzVSK/CA53ZD/AuLVaK1N4aFlYZ7bEGW6?=
 =?us-ascii?Q?q5EvvH9qqQLcVavw82U2CmGezBvVAk9zcOgaMXfq1ftAo+nK61Jzjl4EzlcY?=
 =?us-ascii?Q?Su2rSoVFliNcXBfpC7PHyAIsLWcZKDTo8gCgBdCRJ5wMBcKXAZjtqZ1Tz2GR?=
 =?us-ascii?Q?qJx8W3ZE0ItBvb4FfkFlLN3WFHAXmqibtFSYXOEhkEWQ87+VsobutZE33M9j?=
 =?us-ascii?Q?KqixRvk19R9EbjOQS4UhwOsgc7en5ULEY2XKCQ4tiamRaDL8+Iu//D+viojK?=
 =?us-ascii?Q?H4VQk04bQIrGrIfRzCzyWUexUyShRwZD0PQ6OFLlDlwhOpB+c/NKXTyx0628?=
 =?us-ascii?Q?3ZMwy0QHcGZTnK/RNQISqDASBQyCR7rpm7ONSC91/9vUBriAuCudoFM4kJMo?=
 =?us-ascii?Q?hvJKuoWsqBabGB5GuLu4R5IqtbfLjIvSyjady0ch7aFhmvqlZALVyXmD9UV7?=
 =?us-ascii?Q?K7yt6ERt9HoS/rRcQ5xerqMwULhF855KtHta4oNjJRdLWw7ke+tlUPSkvX51?=
 =?us-ascii?Q?QGalRaJGKBNGyBY6bT6aqxuhnXjdMr/h4tOKF2briMVOC7/b2hn1IzyUXK1a?=
 =?us-ascii?Q?9x+UCr2RXcO1fUD71mcTl/fZc0QaQpbTTC6/4+/N7oeja8aAU4ty8fvpImmP?=
 =?us-ascii?Q?5U3JNdi+oOJOVAi2n1+lUWtWjvSqLXLF1XLh+Cw5L+mYpVOSRIdJ5CGPLZSo?=
 =?us-ascii?Q?zap9+eV5wHWq7eZnPKHdtj5xpvLfmuy0mTL1Da5XjaCcYjUdZaHk90NazNpG?=
 =?us-ascii?Q?A/3k7rrbQaxWZ0F7WZsJPcXThsW0Db3XPLQC+g1z7G9sTDNJOCja/8d2c7OE?=
 =?us-ascii?Q?pQTxtCRHx08OgUDGdgziVOGIqt2JSM8e/+uM/vcDTLLloKJ8bW920OBTDQOT?=
 =?us-ascii?Q?RjljfAAK4ohG7o8nWySfOdtUKy0Lovt+gixEVnvp+o0FhL+fyy1qkNoWWQjd?=
 =?us-ascii?Q?+pE5YNe7l4dJVyYiF06vBoNfHANDnAW9z/RPET3gdrOaP/rcfk6TaskaprF/?=
 =?us-ascii?Q?jyrsbP4KfrlmZPe85QPjv/hnu4JdQlkOWttsf7urQZ9Wx6B7BukdIFtHrLhB?=
 =?us-ascii?Q?Fywqp4ylBAnFCqKCjEbZibrMnj3JlM1ORpxYGqkxYL3rrNBaKboOW4fVcU9g?=
 =?us-ascii?Q?H8cMBQVBURu7+gqTa2mRyzc2fiPNtkjqWA43TiV9sjoET3NJ/GE1c3c+ru3u?=
 =?us-ascii?Q?TcK0P0De4M23dWe9UcrDo0mXF5DqJS1anm0zRarOct/Qvsoh3OAZU0gsudEK?=
 =?us-ascii?Q?+jSjWH1BUNEMe0hiTTt9ce+Ovm0F7vL2261eLiGgIWssUy2mdh/6Q2f7VD8K?=
 =?us-ascii?Q?3xFSvEM/cN8ZxxSFqYVD+2PIjDb5OAVU2Xr0w9vRoKhPyzwp6rIi1A4krwFX?=
 =?us-ascii?Q?qqfB2Xh3xg4NxSbDaQB2Gb2NbolpLF5xGaaHyAgns9T2mrT08hz9ZY+4SE64?=
 =?us-ascii?Q?ruL7fCTscMSrIn06aqYm8hINYexEtvlUkaCj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jdwZix5g8jVoi+Fo4yh2NuWWdKgwey8ItihePaiCtWurFTRl5+CClB/yfj6A?=
 =?us-ascii?Q?hFthx4ALt3ytoCBt0dQMouy/1TVtF/8vUyCQFFL9siQiGP+++jb8tJIW8GsT?=
 =?us-ascii?Q?n62T9WsSCXoFaO5pPkx9yArHo5c18XncmvaQltsZp9Fqrc9gC4hHaHBaQjz6?=
 =?us-ascii?Q?wUdz4tb4/IT/FUCTDPbaJ2YY3Rkx4c/D+o+fR2Py8x1iokOpACDT1Gm14wxb?=
 =?us-ascii?Q?RwhCPcW6yhHHqjyScSkeEtXw/6cjhsbUSLZvN8d6uwC/1e8v45NBhuqqKoqI?=
 =?us-ascii?Q?eU746fB6GwvuppsfsTw8rzjdpywEgzAMj69e0dibNr5IQ2TvR4pea5Oej3Cp?=
 =?us-ascii?Q?9i6pIxMjvQxAS0GwOex6WxQc7SVxS7YoXMmBOL3H9qwpdV6AeSa96tE8hu4x?=
 =?us-ascii?Q?l2777hK+5VCjEmcCh1kp3EpAMEeDggnTJyQxT9Klo73ONJPFue5Q0Z6l/iuE?=
 =?us-ascii?Q?wAREHDp9bQDqm905GkEv9y3CTRziLx5VGLRYbjLVlmzrgjGy0nyAAjM3NuGY?=
 =?us-ascii?Q?Ia+YCdZI9BCmdOxKgBGx/26ib0eDOvsjKMgWxZJBSzBh67CvHUY9gCuh/rsA?=
 =?us-ascii?Q?YV/Mc7QBdqVz+pzkXxYGRxAs0AGU0afAxtYVGTzjvSYsvnJzktPHdTNLqX8A?=
 =?us-ascii?Q?Z91SJiZMKDqCSVpIUqU/LkcRmyD0vvoeNQQfXd/qg2CWMw/SsSHb7s1J7aSV?=
 =?us-ascii?Q?LYVS2Zy30H0rnvjA/qxp++9BoaST0uRi32vwAD3azqPcHBkxyet1w8k9SKDS?=
 =?us-ascii?Q?pQ2eEIvxbqx2cUrSvB1P6WhjyOmc47KTj+QwFo2T6oYdz9WcA72cioHf4QVj?=
 =?us-ascii?Q?nTo26wPU9VOQY2QRB8SNayD6b8B91dnnxwavlpbFdDKsHqxd0e/Gdnb0fssI?=
 =?us-ascii?Q?3Bah4iUMr0kOS9PRHsnc5dwkLck1bfO7Kv6UlsZ+cKAp99w4HhoHAe43x8/m?=
 =?us-ascii?Q?uqY1OBWXA1GUXEZjfsYmAaqyqvjRwnqVDc+BAeuAXsNujMt9VfXi1NM70xfG?=
 =?us-ascii?Q?TKQhM3Dd7UWHQGTaRQxPrpjCic7ps20c++V53tIh6J0zhDkzvA+JIjZd1zGg?=
 =?us-ascii?Q?C31cvqJvwV2s3vC7b/arVyvKnfsuKSY0b+pY1mWeiUlFevLFhkMJP6bd9YsL?=
 =?us-ascii?Q?iuw9Czi7vwsrVST4EPiwE92wf3Ls7euGf6xvazoQ/P23R8AV2m8XoaxZ0Mbq?=
 =?us-ascii?Q?j6nLfFe8EywH8ovxWoTMMt49yuJ0uae81X15BDODEZn5YBaI5wIduPBGXPwh?=
 =?us-ascii?Q?JbM6QPO3u2GzPWdpi5QlqvrEB8E29NTDHtaWptjmJj42JLoOePysrkzI7OrO?=
 =?us-ascii?Q?YhvbXef4kfxvSyMKWPr+hU+DRcwLtrtQVQbVVeOY/w7YsX4BZoJkv2eAtb/3?=
 =?us-ascii?Q?4m0kgefwsrnzjsNascMd1ElxSCfCWYuZRMiQRSeR+typR0/vZVCUr9QiEA8b?=
 =?us-ascii?Q?fN8KN/eY22w8eB1PvlhCUD3BJSut/Bro7KFZXdCjjdRVddfnhw4Qd6jxEdgB?=
 =?us-ascii?Q?somfiycFLG2t6Y4ULq+Iwyxo5kUwYCk4EOeigee4O0U8vmVQLMMbDFqwkZrg?=
 =?us-ascii?Q?mo75NiIJB5uzDNgiyFnOthQX89VxyO1q0in9pU6vd6WZPfRXkwiJSNnRUmE3?=
 =?us-ascii?Q?2WM3FrDd+TPRQCzOTffgGhMUGz1HyZF5Tqvl22Ng7OQ4wFlGJEQoG8mp3sS1?=
 =?us-ascii?Q?N5PVudx881gsxWVa4e18Vo07yrerLJUCUJwU5l8hihxylZOsgwAZRjtqJxja?=
 =?us-ascii?Q?iJ8mzngsIg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bbe116-b6c6-4170-8a2b-08de4ecd02d1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 15:45:55.7886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErblhvphhqIje5oF+McsIsnFL/E0fRPgUZ9kO6NkWWkNGAbnZhJaIvd/Sb55TRyjhDMZGcIMCanhgpgWiTI7Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10903

On Thu, Jan 08, 2026 at 06:35:21PM +0800, Xu Yang wrote:
> Currently the wakeup and controller interrupt name are same. It's not
> easy to find the correct one in /proc/interrupt at the first glance.
> Rename the wakeup interrupt name for better distinction.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index d4ee9e16332f..e4345e0eea59 100644
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
> @@ -525,10 +526,11 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>
>  	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
>  	if (data->wakeup_irq > 0) {
> +		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);

Need check irq_name

Frank

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

