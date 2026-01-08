Return-Path: <linux-usb+bounces-32077-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAA8D04548
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 17:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3908030B7A44
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 16:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBA424A076;
	Thu,  8 Jan 2026 16:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XT2+mREG"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013013.outbound.protection.outlook.com [52.101.72.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786442673B7;
	Thu,  8 Jan 2026 16:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888979; cv=fail; b=Y8YujvnZSjXhcSUgk6CG1byY10rX37iVOFgET7fV0cBBlAAEp453tfZZOV2hiS+Hfip6KxGmdS+0OLFJejdJ7qWXLdrJUqv3XeTFCuOfHgam3r1DCOUilePOQaVxgUg5PeQ7luaeYrOIpNLGH4C8x8ATjbQsrPUlxlUhBVHNxFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888979; c=relaxed/simple;
	bh=iCiOnVA26KFx2P4qMvqnZupPOSXuWMrL6MIkur6iyuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PohDrkcD0KVATa1/d+eClsWuUtKEIzza3B8u07Srh0qWRxttfVrU4qDh9JLiv7J1FRW0ws8zVqehVizIvapBfBZULPhrYxXQsKw/J2itul7yGtdNPhhClRgPhIxLUklL51sg0I1TDzA2RyliR38540AY0ySudUl8G7ofDGFM+QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XT2+mREG; arc=fail smtp.client-ip=52.101.72.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kabrrQ1spaCIbNBU+ZD5HdEWDnyIFxJiWravWafYy/iZXtrlLVZG50UTpE6lt+4ekWbdh1gI+5Dwdd3oI/3FYSMO+jv1T5CS7leWfzbOgt44bBZVheuoUL901T4b+2bgRmnWZlkT0GmeISnCn7Rl+njw1AmWZn4MkgyiTGW0jv52rSdw5AqWqXH5jqqjvsPGiza7JEMiUQDG3HYo28KOoV2XiJYtLGM/Kt1pmdR6nhW+q1xYfL7ydbbVw9CrGfCQem/PdTffbYy/7bWxbdpK0uGdSKM9b+i/9JwPpgviwyzXAGfXRRSucsPoZj0nUwwnmKSWgaAdqb7pqjkbl8YDWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8ju3tmbhB0CdbUdK+DtdNguZiZPVTvUrNzz+uyL7So=;
 b=wIe6kzA1L6ETnW3B5JF8yV4tlF78jGZm8Ttjj7cWsLQM1sd+03v2bSFb21aJ0yQorniRwyg39LlnX52mvqtPo/lu2BbMW05nOjcMLTaMUGDKcBAlb1SmoCDmEGnUCkCe9FpliDiLi8EDe7CalaKiO4+6u2pDPZQ+CQu6XnombQ/xu1etd16DwbEQlhFFexWHw8j6Iqp8FgSclgSDfT1suTUKj+MPQKFEpWKncgZiEQH2bKxqpzHphcsuPdD6M4Wa3AbPa96j/Wyb+Y9cVFOaP8XATJ0MV3iRHjZ+4klw3Bc4f4QmX7Bepmx9A2ZXXiE5VuaNQFh3UdTC+82z2zT4Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8ju3tmbhB0CdbUdK+DtdNguZiZPVTvUrNzz+uyL7So=;
 b=XT2+mREGg2wYm81HQm1CzAglDfBZBjxMLOkqB4uxvAyocau405eYG/aWISPtlDJGX8xgiRu+uOvGwxyjC/awnvIRbv8Ch9UpVpBPmRYeM76SyFF3bVl1Uy7kCTzaWFKkzGjUclf9gB64qkASaDQi2IKS8O267w3DyAz8DzlDBorbji42UYV/ru8eLfSYS9sxMUcoOYtsI9tv3Ehxx5oZRdSbNUAXSVi4wpjf2IaaU2yxans/x4SKd52kJgJ7m4wqIu8d+Dc+v/p6RxltK2MwGM7YlXl5hm+tKyUgDhbVUnsCc3pFeaUmZCeirpqhYjWv5/5GDErSSopOQ7sVEXIi6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA4PR04MB7854.eurprd04.prod.outlook.com (2603:10a6:102:c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 16:16:14 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 16:16:14 +0000
Date: Thu, 8 Jan 2026 11:16:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>, jun.li@nxp.com,
	imx@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] usb: gadget: uvc: retry vb2_reqbufs() with
 vb_vmalloc_memops if use_sg fail
Message-ID: <aV/YSGHubVjaZBzz@lizhi-Precision-Tower-5810>
References: <20260108-uvc-gadget-fix-patch-v1-0-8b571e5033cc@nxp.com>
 <20260108-uvc-gadget-fix-patch-v1-4-8b571e5033cc@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-uvc-gadget-fix-patch-v1-4-8b571e5033cc@nxp.com>
X-ClientProxiedBy: PH8PR20CA0007.namprd20.prod.outlook.com
 (2603:10b6:510:23c::9) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA4PR04MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: 307ac10b-f159-470e-1a53-08de4ed13efe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|19092799006|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZE3hloxPF3jJ+T12XkAdK0xpcFReoVnxVW0sJvl/1kzoD3ac99F3IrTl/bmx?=
 =?us-ascii?Q?aW4an+GeiD2ztO26glcVGbWyI1PCBAnWNG+NjC0XE6DI78EfvSJcWC4UhRy0?=
 =?us-ascii?Q?oRebAnVbn1NobsL1OrvFiB+j+8DHJr51nkcBwGRw3yGRii89X/PWHzvU2qkD?=
 =?us-ascii?Q?71wBBgsRN4PVXFDGkPKtmRbKcBOaGU4iYmRW9kBtpUeS6ZsqFbNcpeMuPPF2?=
 =?us-ascii?Q?R2rriLnQbBM1E2/B1bWASwdtMpfXk4mE45oAszFjKtfBp5CNLG9GJIOX5EuM?=
 =?us-ascii?Q?eE2gglh5ZxCCAITOSUmbVFSZRrEaYRMQXX3QlC1BivX4lpeMTl+63wdEocAC?=
 =?us-ascii?Q?f2rx/2DTbnwh2gXsZgOgJq0XzC7OjvXzdUFlatlweZ0PJtfdKmlFbHck5TpV?=
 =?us-ascii?Q?H+FloMIn7oGbOjXvTx5cjFBWwZJ8tomU/2w/R0Q91Dv66S3m5VSSg20maxNU?=
 =?us-ascii?Q?O5LxWqzkUBdPcKY6T83VS+zb37JoPKP3DRC0e5J0IViUe32V+MmnynQRSBLP?=
 =?us-ascii?Q?Ui9FMp8ILmB8RshObI0q1zI0Co584mn+qPBc42LlDgB7fMKWtS9yW92nBGTk?=
 =?us-ascii?Q?ww3PrSNq++F7y+35qnQgJpENMNdMHas9PItJ4a16Fp65LQ5S6AB/2r2omoKr?=
 =?us-ascii?Q?0UQpjTiNhWk1Hnl2Chlk/U2Zvo+KLO/chU9Q9vQy+9d0xvalTCz4TKJAi+Hi?=
 =?us-ascii?Q?Zc01I9O4vViu/JqoOa6H6uVh3yUGcXvK4eoa0KYSxYovQWn+ljBjFnECVDh4?=
 =?us-ascii?Q?PghQhVBdoWvyCAiks9lkYpcTccriUV3rq+3K7nRi38On3ZWdyyUmBcap8Lhj?=
 =?us-ascii?Q?BEZFrO5Jil1iZsOHzGKSP6aIPMeTtBeOQGpp/VQyY4ng/4wCpgGub1hOnZk/?=
 =?us-ascii?Q?lt2i8wlMZ4EMj9Wvp5ZMIjdnXPwvhIBkZe7i2sTPXTTU8s6V7Amb/qdaanF5?=
 =?us-ascii?Q?XjKbHad4SKj0e7EvpioZbKPsC60WSf797r3Dgx3+XKu+mCa/4PjBXPxlhO6X?=
 =?us-ascii?Q?uAWoFV3h6BJi4D6CFgoTIqZwjT7VOXpD2WkvbDgqpiwAI7b9sHy/Zuu9DrR9?=
 =?us-ascii?Q?zC4ARlT91mfDl7ew+r25bLr8oFT2tpX6mpar5G9fZmuZW+M4nk/AiSEIdgHM?=
 =?us-ascii?Q?Zknr4KDJADA+w7jj/rGEom5q4T1HSSTzrg/yuG3Tg28BiVJV5K/svQfoeR4u?=
 =?us-ascii?Q?l360v4WKiZGkBRriWtW0xiPRk5nrPTCYo/pJyPrTmRkrFPyDukrlxxjXM2Ig?=
 =?us-ascii?Q?9WIifSWEjysRCpD0NT4z1y9puCisEHtJjwqvQRkQdPYA2qkZwkbyldF6JmOp?=
 =?us-ascii?Q?SG/OmQbV/x87N29SWw3peg3w43BPUdj/8ffGHMAodkkyoAPfNVo0U+kNWuxO?=
 =?us-ascii?Q?DTMuI8Ekocd7y6Es097FIgBg51p7Ku0R6fXTdrzzFE/BgGYzpySLW1CvP8hQ?=
 =?us-ascii?Q?Rtba1co8jFpjR5O61MN/aT6LblcG53yAR6Hv6sTBQVREyGu9EueuF4DDfARV?=
 =?us-ascii?Q?WMMLZaYTUJYrdhTAsHXTVUZO2+ouArzQ9ZmWuEf/lb9qDQGpROWMvq9alQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/eKWKYQd0SbXl6+N5/YQzeHI3iat3qCpMVZamoyIYAQZgZKEjKIdWdKlkc87?=
 =?us-ascii?Q?VZZZzeqscpEOuchq3MCVoyUOXo0qFqCQ+1oS6AzUOZLt4jxLu4MmBCHIKgrh?=
 =?us-ascii?Q?wxXYZKYPWExAbHDIdA8lR9Pmv89fVd0s7gYL6g5plvh2z4zt4DHhjyDl6gFZ?=
 =?us-ascii?Q?LyCUpS31mjspYm9Tqb7liivdQR8IZDWTvVM8yyVEe5CEWrffMvXbhdETEZzd?=
 =?us-ascii?Q?F4Qjr7ZF+8D80CoWfoyKpEssDO+0Sb5MhGFlwwH8VN1FL6vEE8R9Df6H3hHE?=
 =?us-ascii?Q?vgaRjwtgknwUNubd5SvCK8A687PVSK/st+LlcGuRjaPx+qb9m7wPT32nxfBt?=
 =?us-ascii?Q?w/R+4pCQdW1B+dC4Nip+qGaB1pu0fNJbdTeugBqop7lZ/frZJ2pqMYsc0ZmC?=
 =?us-ascii?Q?YhX+Yp2Nr7lt/G9lNKK6J3A3PvphApdFiV8BCO7V4B1P51a2a6GTMPwm5jvj?=
 =?us-ascii?Q?4dFpB3rw8NADZAIm3y82wM5c59tRUV5eMZzumZKU43Fuws1EbNND4vQfNTRe?=
 =?us-ascii?Q?C0DAoGo9QL5LO18SKZmBNFpBFkMqDPRZO3gGYnkJ8Wr+dugGot2Vood/0Fgv?=
 =?us-ascii?Q?QOMllB+oxEuP7BujJwtAUCf1rnUk3iwMtxGm7+SFHw0p4dq7UcBG7VYwgU3l?=
 =?us-ascii?Q?ZdvG9aMojaoCuo0SsnmlGN1r4MtrLUBzgy2NP2Q8vebNk5CTZ7onxHSUwgSY?=
 =?us-ascii?Q?Qt9FYSSpximpDwtbs25UAYTlj9PEZlrH8RuUrJbwyG3PWnHCXSkGShvDVZeY?=
 =?us-ascii?Q?oScQBlnssZNjX8aHXccGWLSdlnrBizgHaYeztTsKh6FnaeeHnDcLjsWrLkBa?=
 =?us-ascii?Q?Fv7nzxeNZ6sCp6hrJBDWi+dhQACIqq3svbWnzaeJ171WceD/mPS+IUwYFnqT?=
 =?us-ascii?Q?WhJyl0eBxPaTUlnPhVurUX9eM0DrsX0oa7FN2At779U/WrEdaLxvaWWBPXQO?=
 =?us-ascii?Q?m+A1Y6aGDy7CPUBB7rLrTFr4qUMmGNcKMI4kSaMp1BbibkkU8zilcN1z+T2C?=
 =?us-ascii?Q?/TcQAWxhz0T2anerA2awcaH10oNHwWmxHExiK9h6JHSKGWYZQO8fGYjkY96s?=
 =?us-ascii?Q?gdnsacwub/Kq0lAm/edbRQQg/j0k1FHfpVW6BVScaKDiwanxi7IujfYgJND+?=
 =?us-ascii?Q?AqV39ez/Yyx5mrZDrZlHG11R9wigCXBoedqSYcVRiGFIG+kmiO2FXnn0Yw52?=
 =?us-ascii?Q?Bj2+I9d7rfinfJcxh3VDej9ctsNd0pqK1wCcswQnk1e6OkqMk7T8tFvViAWl?=
 =?us-ascii?Q?vHgqi6l1vsHk1SjSqWonWGRbVh4AC6bcCMjtlzUJxG+WLzYoFq+CoxZrolNd?=
 =?us-ascii?Q?PpTLobygirXtpSBfFQvhtV1yzt0/bnLkUP5nr0b2LY9oiY0TXhyJHUYKacQu?=
 =?us-ascii?Q?FBhQ/3g1JyWbnloDYmcv+IBj9rHucWTNDYvKBm1CaANHd4ynIwj8IlzsSxaJ?=
 =?us-ascii?Q?MfpfU0cCGnyKX4lj3M9EU53G0KMIEsRIA4VCt6q3ccy99or8s+W0JDX1n4wv?=
 =?us-ascii?Q?18SwpZ6aD7AnSFRD79iJrkYBn4sBgSksRpFCSCx/+mbKmVc6cPuCnmOqPfY3?=
 =?us-ascii?Q?Cd1UdPb9isBt9nXKNpNsGyKbHWsRi5DkfRCOR6BIBe4JkVHs4cg5JJYHlk+f?=
 =?us-ascii?Q?iPiNfX5nsjKLqLidOjmCG2dHCAdo1kZtx3b9l/CuiWmp+brwcU3DJwlanu1v?=
 =?us-ascii?Q?ss6VE8jRgplVS9To5DTvJSYz8inZbMyoKo1fOM+YQx+1C+MT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307ac10b-f159-470e-1a53-08de4ed13efe
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:16:14.6960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQwyfXDu3jMwr3G3JOLRI4KPC8UtOAGV+I9/TvkIfxRizROI73sT7In6Orfk09ZFPTkEIXL402Z9TpCVz7m7DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7854

On Thu, Jan 08, 2026 at 03:43:05PM +0800, Xu Yang wrote:
> Based on the reality[1][2] that vb2_dma_sg_alloc() can't alloc buffer with
> device DMA limits, those device will always get below error: "swiotlb
> buffer is full (sz: 393216 bytes), total 65536 (slots), used 2358 (slots)"
> and the uvc gadget function can't work at all.
>
> The videobuf2-dma-sg.c driver doesn't has a formal improve about this issue
> till now. To workaround the issue, lets retry vb2_reqbufs() with
> vb_vmalloc_memops if it fails to allocate buffer with vb2_dma_sg_memops.
>
> Link[1]: https://lore.kernel.org/linux-media/20230828075420.2009568-1-anle.pan@nxp.com/
> Link[2]: https://lore.kernel.org/linux-media/20230914145812.12851-1-hui.fang@nxp.com/
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/gadget/function/uvc_queue.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> index 21d80322cb6148ed87eb77f453a1f1644e4923ae..586e5524c171f115d98af5dda43fb800466f46d2 100644
> --- a/drivers/usb/gadget/function/uvc_queue.c
> +++ b/drivers/usb/gadget/function/uvc_queue.c
> @@ -182,7 +182,15 @@ int uvcg_alloc_buffers(struct uvc_video_queue *queue,
>  {
>  	int ret;
>
> +retry:
>  	ret = vb2_reqbufs(&queue->queue, rb);
> +	if (ret < 0 && queue->use_sg) {
> +		uvc_trace(UVC_TRACE_IOCTL,
> +			  "failed to alloc buffer with sg enabled, try non-sg mode\n");
> +		queue->use_sg = 0;
> +		queue->queue.mem_ops = &vb2_vmalloc_memops;

How it work if dma_sg_alloc() failure,  vmalloc success, follow dma_map()
should be failure for vmalloc()

Frank

> +		goto retry;
> +	}
>
>  	return ret ? ret : rb->count;
>  }
>
> --
> 2.34.1
>

