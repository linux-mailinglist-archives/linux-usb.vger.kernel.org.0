Return-Path: <linux-usb+bounces-33918-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K5TFkAEp2k7bgAAu9opvQ
	(envelope-from <linux-usb+bounces-33918-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 16:54:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C031F306D
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 16:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AC6903038410
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 15:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E5637B039;
	Tue,  3 Mar 2026 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nNG46dUl"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62874372EF4;
	Tue,  3 Mar 2026 15:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772552906; cv=fail; b=k6V/xWGoqOch8YX12YRIlQhUoUn7IwkIA/7CbJ89vOcXbt8cx3z6R/xl3kzrgFJySVmLlZYlIWWjmJZnaYT2ainlGDEBx/MkfTnLM19QeVkggPdCa+4U12Yk/AeR8Y076S/rYK/V5CKpxB7JzlwdzeUtPP4d5SG262dXL4Wo8TE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772552906; c=relaxed/simple;
	bh=Q81R4HBv1MfhLR2x13Ezty/HKLft7QlAGW2CIbaKh2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RQlnwXa4QWTk3BsPvTVaSQywZH3ZSy/qYJDHkFz7YaPXzmdaNSLGxMpADpFHfKbuv95ZNzuIhvBaHxBIMel62pYIXOAc8Kqg3qisaubVfSI3z5wqOrT0zGpvERVPFCqtjwQMqKiNYcsGIkKnWN/CybW+YeYBuIQpM9VG0DF8Hno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nNG46dUl; arc=fail smtp.client-ip=52.101.84.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0Zzv8q959RRQ52h5XJ2K2LBD5mJE1/0vDiLifNEZU7LAg0ny7j+6dEWnYCXUDwnAteY0gn6edNcF5vLoH3TaeI5JFejqEnpoptPR5MaUI4LTVXfoTZ5pueuBEze3ADPOzqEm24j0dZgA+1+nYDsWoVEWqR0NPKf71L5cXqbfyUzM+g7MREoPUeoB7krnN437iEBpidP3SAW05ESHJOTXQD9cNlp9r49BTlxwP+JB2wDRwPTtHebByjaEq2oV7zpYrqLgqTZDyBmvz6p0cZSAwcTowtMhdxt9OMSO7OqCrdFirdZFLnYC1QT8U5x3ZS/juSh0ss8uQ1DvMGB6Oj1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOvRRZIu3dOalxlpyIBev+itsJMfx/OO7p7fyF/y53E=;
 b=ZFKybpNSSnkWkHHVqA/I3OhvNhTOUJT2/o2k79fuMUNCB8qI03uxLtSzq5c9DBIWxTeitHIhcQZNbKoQcpc51OVc2sVKsGmjMEVLIXlpdEIFUOY1Kg4O95WEUfwYuMn9TYFjhnv6hiqKsUCXfWFhXJQhlnGxDJaQMffgZc+yapP/dKsEHplJdT0OEWrl/1wahmbjg26qtaKMtdkQFYhLE/cSD0U/1RMBcmCacWD25eRsaPLSGutyAnUEQk8f73n1T6DNcrC4vy0FnPgTIN1MzRuA9DCT3d/Kc88jvTpYVt+fmegvJAnj42e5kbfwyaaubv8msSc7VMZO+ZkQLzvvOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOvRRZIu3dOalxlpyIBev+itsJMfx/OO7p7fyF/y53E=;
 b=nNG46dUlAhovQg0b9eDi4ZQ9LjD/0gHUyqpn0BryAK/bFDPScWZzgmla/w6TOlZadgdjOqHB5fB7UxlR/itL3W6s18QkP1XL83CLyUsriHMV2LVP4nA2EV04hZjKMF49PWzVeCdN0ObNQfjLJE0ir26aguMxEcXOwC0ZYbfahRMst/1jsvvIEShN2VdhY1Svm0dMlAElyUBxAIZAyWyorQSey5eQHOIiJ1lYnRyeaQl59TmXydlg9c6d1aDiGuKZIWBPSDMdRYP+ccq14+Nd/Y5RAP8Cdxcoc0h29T15GWrzcy5IyW4/N1Vs2qNcFIvh6DbLfdRaNVVrpvJpnDARKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8242.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:48:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 15:48:20 +0000
Date: Tue, 3 Mar 2026 10:48:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: dwc3: fix a typo
Message-ID: <aacCvuqHDR2rbHmj@lizhi-Precision-Tower-5810>
References: <20260303021559.4021177-1-xu.yang_2@nxp.com>
 <20260303021559.4021177-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303021559.4021177-2-xu.yang_2@nxp.com>
X-ClientProxiedBy: PH8P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 910b8576-618f-41bf-392f-08de793c4baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|19092799006|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	9KpWfUsfixU5WKaoA4uyrgGRjYdAm+4htHTks0ibedAmWvB3Twmcz1jcMZxml0IzjIFzl9LdJJ9BhKmZ6tMv/WCDgwDTGBwpRtxnJxl8wZCPokZ1pSb5NiwzE2i9HhEIhAUO39Tr/mVXaj+IwwzrhTMZmv0PPPXWWMPcxxr7TzPOheyWqP1w6TX+1hnRbQasMkhvEBQjwUKCBTpxm31jhXTYWEEqv8z7rOr6HiyClfhg42n+n1tPv8t9Y34W8ba8AsDnV3MAJPZ4bCPSFU9kK2s3254vHvUAnFQY1CoOPOZD3c5TcvkCdWsjFoGjG82y4x5sT1zIN8epFg7VGPrhwVlXtqbMVbES/rlCsBQMzVX2ZYGh2fcYPN/qxsjHT0Ynh7Em2if40ZiITAgxmplVzcrmQ92BsgCZXxt5LEQfYDyS5flOQrswo6GMHgQywdg6aI/Kek4heMn6EguC7SecH0uEd9qf1WNpwc/6jo2LIuieBVADzf21Izkbra4gnBZ2pa7j6D/04BREAGc0omBnNWUwsWFY9gH0L6LclgtTvyEQwcYMJAKeCjfnS9Yg1ZZ5nraecPTti9Mz+THqSZQMX7Ovr+bcmJh6TUrY+nx1CgXRbWDNEkIMBvHIWErP+CkZB72OHsjjRxIDHSJTpmO9Bu2RVoslUcZUuGiErG0rqKFumkt/NG9anwWDgYbmskexb9ifOYDAc8O49/W7SDWStKo2/gj3YqQ8RhANZfY1MWyo0uvkTyH9Y65yC326vZWBDu1AMBwXUTM+CTb4PQtjQVE+3KmJcYgYU/4fKAzNjDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(19092799006)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pVxjfWTHST3xNt739EM/y0NH6jvi2+xWs2Q4GFvw0leV3sPNE6Enk68BzMcr?=
 =?us-ascii?Q?KI9yUpMUelgfPUL7ggSGy+QCEesnq5mn+qzzEta+dkZmOk+C8HiCFVLBDbva?=
 =?us-ascii?Q?5gSE0odIbEBuJCJMJzXMJ0bQQVCfQjiUEPftH3d4TXttJblhnSkDI5zTXM/l?=
 =?us-ascii?Q?wMyIx6sGIcnloevnvsqqBYLYpO9M2vju2Rx77Y6XWsEx/C2CP9HidQpyey+q?=
 =?us-ascii?Q?RlSzEk6W5xROPWdx2QVLJmDfjuhx/F6dfEu8Miy3eC/cOdxNcFdvVbbBagE7?=
 =?us-ascii?Q?SJopQAVz6NTVr7uqfvR5a0MzRtdDvo2aR3PQIuDEGIv9qDdc2A1LueBk/QgX?=
 =?us-ascii?Q?bos3rsh21CRW4rU5WegYfBG98K5mvvFvwjaAeQif+94iWOZPs73IA4AGJfDP?=
 =?us-ascii?Q?4eM9byz/Njfuc0apzCrd8yOeOVeW6iPyBbq466rqGd/+0Vp0rjRXMV7tIv/P?=
 =?us-ascii?Q?XAHCp3Se1ezmewSvV/eEgCU1YtpIQD8+tlpa+zNutIIWX6YyD0MSIgCKXgmQ?=
 =?us-ascii?Q?BqBtLoUEVWR8e5D3JKnYM6FlYwG9hyfJSyWufhKMNTiqFMujKoP9GLcs+LWK?=
 =?us-ascii?Q?z4w7WqqY6YQRn36JwM9oNiOtVUtx2u4IhUrdVGsywjBN1LFUjlsLJLjGEY6f?=
 =?us-ascii?Q?t0ynRHMgZSSMcmqQFFiwLaIgedzG7UiuBUifipnVJ7PgLtYElMaZ/CrlyaQJ?=
 =?us-ascii?Q?ZECP/Ox72DDZHCrXzL4Lm/WKecQjVHAnNiZqXqKW0N+OZ5sgyHpSjZnkVlMS?=
 =?us-ascii?Q?QDDu/ruSzpbq/Zv5vhH6tqU7tR269NFHD8MWaYEaIi4vVbI6yNWrTtReEtiB?=
 =?us-ascii?Q?wy813ziRZJTLBg+fS4kkCF0fwcNQFfnlGoE3Uz73DmVmCSbTxmB1ofcy8UWb?=
 =?us-ascii?Q?Cgs9FRooNmDGr1u3ehiucNyXXyRcTXYYvM2ZelkAn0HF33vYYXbx9g+7y91e?=
 =?us-ascii?Q?OeE27Oh02GqyZL34Qdn57VdY+f6Kg3MPrCF49CKv8gMer8/+z0wzi0JYoCpX?=
 =?us-ascii?Q?a9YSek+Mf+7R0tELmPpnTQ8/j8iUIsVssGNugmqEwqXVGPJmvw3dXA9KNXcA?=
 =?us-ascii?Q?dlv0RnJwpCcTc5EFQ1MmsJBGbhedzgax3/6uXeh115sByh1/wXPspQ9EkwBO?=
 =?us-ascii?Q?+xtK7NUay1LOQSAKn2oGnFaacbTd95v1s1IdwUvvRcboMdlFQV95p+FaXt9T?=
 =?us-ascii?Q?mfeqZ+b7mtYv1p69kk2CPymnhTpEF7yUP0Nf5lHNTZkdvWcYqvgdmYhOdh3D?=
 =?us-ascii?Q?TTSeaXfuRTK5j5i7BfAqavLJC2lMJiKh14IRMsRfH9fgXPDC/6u9EFK4y8+H?=
 =?us-ascii?Q?DDUUdrAHfgiTKwE8Jl6ipNPIADO5LgRrm8mIsOeYvg2zGt5/VmSr5yKpyAer?=
 =?us-ascii?Q?HoFSUj9pOtRdUhbOgp1q+IW0hXeaILavw/BbEd3X7S9MafjB3QtpxBzSB2PF?=
 =?us-ascii?Q?jiL9yvJ84e6sn0CW6FgEjaeMsPsFffx7XLHQHfJp3ux36BTN5fPlBsSzKvsT?=
 =?us-ascii?Q?9F8/n5K4NduISQkX8JqpclwiaAHtkMNBXnhIn7hWYcTiTojtR5FgWw1bxM8H?=
 =?us-ascii?Q?Zx++vVQ3L0WGjq3YjoDtP6zV/PhCSAz6G4vOCDHhXPaLk8Qd0kr4vQ82z5Nb?=
 =?us-ascii?Q?8Xt6AZ5rrUrnV/8jHXGtXfSetmtSikOe/bHvzSTHvn/H4fD7251R3xhOpyqB?=
 =?us-ascii?Q?MzG+nKKLSdcxUsfthMu48PzytSGjzSRrPspHXZqUVo34DKGu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910b8576-618f-41bf-392f-08de793c4baf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:48:20.9526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjTrSPKTsB5wBnMsgs18JZGRSG/PL1tSckDednpH5X7sF5kl2PUJCoyOESjo+9UzAK5uos1wW8SGaqdIeceJTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8242
X-Rspamd-Queue-Id: B2C031F306D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33918-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 10:15:59AM +0800, Xu Yang wrote:
> HishSpeed -> HighSpeed

subject: usb: dwc3: fix a typo 'HishSpeed'

Frank
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/dwc3/core.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 7adb8e74bd84..41cfefb34abd 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1151,7 +1151,7 @@ struct dwc3_glue_ops {
>   *			VBUS with an external supply.
>   * @parkmode_disable_ss_quirk: set if we need to disable all SuperSpeed
>   *			instances in park mode.
> - * @parkmode_disable_hs_quirk: set if we need to disable all HishSpeed
> + * @parkmode_disable_hs_quirk: set if we need to disable all HighSpeed
>   *			instances in park mode.
>   * @gfladj_refclk_lpm_sel: set if we need to enable SOF/ITP counter
>   *                          running based on ref_clk
> --
> 2.34.1
>

