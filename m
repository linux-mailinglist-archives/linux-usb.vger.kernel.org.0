Return-Path: <linux-usb+bounces-30884-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EF3C83BCB
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 08:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B7243A201A
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 07:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354D92DF709;
	Tue, 25 Nov 2025 07:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nZju++r/"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011034.outbound.protection.outlook.com [52.101.70.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F3E2BDC03;
	Tue, 25 Nov 2025 07:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764056208; cv=fail; b=MYiOGSGCCDCKaAH1P1DnibwQm1b3xlCU/4g0EmC2vf0UUDQHoC/iXkYLDXe3HbJ2yYrbj84kju0N5kl/uy7dkURgCVbv+afyH7P6CpDyqUrTnjscrJXTIs4v4niTOCoPG6nLtoCicnTDmXri/dUkViCVCl9Q7H0O/pRx9Mo2WFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764056208; c=relaxed/simple;
	bh=DLx+aZs81mcYSgW410qiIyaC79VhlT4XJqgq/UEYtM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kBTqhZZTKZTtnJDMJcvwdVxzkeTjxf9QZ0glpsl+oNW6MzdQVeM0N64EXxaxwKc46BUHbK+HMp1YDKquqwhNjamScvXYYWtCpPS/b4mu3WSiI4j7o1MJpPVk+vt9ZE17AybCLe//7+e0uboZ9Uj3AJDjxEK+EQg+azHdA+wquIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nZju++r/; arc=fail smtp.client-ip=52.101.70.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUNnLgBLS49hkAmOgKKUjTxXHBY1/ITKU7sM3VFJgH//RchG7Ipn/BU8a9ZFNAYjx6Xw+0OVNhvKhRJ7fbA3dnuREvmbdkuNkrZB1akTPn/Jh44ltcXRSQ19rbRONWyhBBnG0tIm1TsoDpcVLOl6bIW/489i+Uq+9mvzQNDi+QENW3J+rT8VO5O3buE8yvVOc7wgo99LVfghNnTrEaev5zdM+fEhj4GISGqCVm58GW/P8dhuqruySnSOix4OBbI7MnERhPxNsamdAtBbEI23qfNX94SVC/M62+3iI0f6A3yldUbA9eIH2qBu/Wyn9UkTtnwdasjVXzAharYxfvHkrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZMzd+MvejOHZ1ZY+aZED91LEhiDKc77v2+/rGDQGGo=;
 b=G5O0anCSAcFIn87IFjvC/s9Aeu0oyofypk42hsXrPeRIjvWjyYwYdU9lVBFINHgmzbAV5HyZMdXgD3Msp5EjVUSNMskqge4Eo+pa9DLmB3PRbjy0PpGLBeqdGTOzP5ZXvZDc6SaHzsEfU/03hcnAUtr2P1PrzwM3MtVwqaz8i4xwO3QmyCznCaD1ZpCZCzgNbUSaSZ9DqUoEVN5BFudAYyL/2gqEFCVtqCocAHwOW4VC6F+1WrkobKQ2ky5aB9aSnpGwwTRPpy/8fJBiDrjDtiLwhwNxHw9x471j+AaS3HFAt7v+MawH5CkHdLCcuzAXJaqKWO+QZS748c0AtuEKjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZMzd+MvejOHZ1ZY+aZED91LEhiDKc77v2+/rGDQGGo=;
 b=nZju++r/ZgzkDy0wa3zJMxZ0Sy+YIeIVH6wx3cbH8UNA1dJUsByP8zkzQj7lcjLFWqZTIQuGKAjPtWmyg4HYD86A4VHeEnI9ooxZcjMhImJqWM4SFQ8UDgVNsA/FnCXwCQ5iIcucjBT5GKhIOkhiCPlqHVwBTIQ9DOhbZbAU4Va2KbCHBFAYuZZNfLazWF5MMr+GdaHwXcS+Rn6f3hMPC2kXUPEgu2JCX5XKvbCXqDmbYrp3PMAw5HEuGHetvv6eBBc+f3HdTFao7rpYAquBjYGwx0JiJ0ua7fsx+ZVATtHcSAHT2c5LCM6deCZV0e8uj/kk0kJFIr8L+Aa541/2XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by AM9PR04MB8620.eurprd04.prod.outlook.com (2603:10a6:20b:43b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 07:36:43 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::67fa:3e46:acd8:78d0]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::67fa:3e46:acd8:78d0%3]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 07:36:43 +0000
Date: Tue, 25 Nov 2025 15:29:57 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH 2/2] usb: dwc3: imx8mp: disable auto suspend for host role
Message-ID: <bj6hroepwqflz5z3wabxacfhxltt2u6x274gd5v66rihosy3my@pzgq2e4v45fx>
References: <20251105074504.1427926-1-xu.yang_2@nxp.com>
 <20251105074504.1427926-2-xu.yang_2@nxp.com>
 <20251113230541.wbzt6xbine5gdmpp@synopsys.com>
 <7kpf7gnftumdwdowutryjz73nkap4vp3cfisrigt6def4f36vg@ijlj2eqwzsip>
 <20251121003742.q54ouezxhghmpwgn@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121003742.q54ouezxhghmpwgn@synopsys.com>
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To AM9PR04MB8825.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|AM9PR04MB8620:EE_
X-MS-Office365-Filtering-Correlation-Id: c7cc6002-1220-4d55-33ef-08de2bf56112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|19092799006|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cIG3j06Q58oV4x4jOiAQcRrhWwnrDD/zB9wdL6NP41Ymz9pv9V/pmVbBY67P?=
 =?us-ascii?Q?5pFPL62kpsBkxSbGMl3mD/Gghd0xm/MOsGVEF10i+NIga6kS3l0LLR/nGDrM?=
 =?us-ascii?Q?r4Y642O76ywVb7OKbBqk73hPF16uqCHjySIpwFABy5kCi+0Xh61PNHeOlaCT?=
 =?us-ascii?Q?eB7TAQYXuy1K4o+UWxWssTz6v0wy0KtwLSOzblo3psdFRgOtI8iib+ZgFktd?=
 =?us-ascii?Q?9UM3tS2AXugn1WKFWfhBA/q+XcwyIlgrM3NYO2kxMC1649C3iIQHABexhHWb?=
 =?us-ascii?Q?seRvD2AHY32SnPndZiCRTKIQA47ZWmfAomcWO+oxJcLTayv1F/bA4EImZPvH?=
 =?us-ascii?Q?9AxcVyW9c8EzqVe5JWg9/uiAaOHh5nUeti3IkI6eGoaMZ1Q/MTmnbSaqShE4?=
 =?us-ascii?Q?Gfbl4Wtw9Jl6oF9RAjt1DAVziRrvFy1jT7Qr6L6IPRj3fT9HajkW/CSuumMJ?=
 =?us-ascii?Q?8bDDpFdchMOVs1WwnpSSpMx1MKdFuHz5sbr3AJm63RqTpmz5V1ORrsdezi90?=
 =?us-ascii?Q?24NisaQRzQda2R4i/yasqfVGm2EiTmg5tusv7TgToHeGwxucSsJVY28gWXr1?=
 =?us-ascii?Q?7oBdS17oEEc+jWWM9mOi6okq1mTpwycdAsuWOv3o2mYBWVqXRqySZYrrFH4Z?=
 =?us-ascii?Q?U3rXwPp8fA/CfOS65pvosMcrVtbNd88avnbf0++rj+xNKjRgOjxpmXIZO8hE?=
 =?us-ascii?Q?RZ8KTcSDmcig1H5DLrhx3slzhkQkrxykethpSaz6sZSuhcOMhY5tkQIurswg?=
 =?us-ascii?Q?Yb51s8QQv2l1s/rLT+bER3rvg1rMoUPyaZJGeNJoyPKq2EtfEECjIvhQ+iuh?=
 =?us-ascii?Q?+x68e5jpfKfv7ScHX4gfmNRHUnUn/BUvFmzdPZfLU+VRP/iOP0txMwuojsHP?=
 =?us-ascii?Q?NkTd7wKIcaw9chLmUK00OrQN7zos90CrvU4UccBGMntDsK4KZuchi/rtJqc3?=
 =?us-ascii?Q?AFHsdIx0XOB5YOQh4eW6yxX1Jssq2jvOH8qlM7FeTBe3+Z9EKHwlaV8PflEV?=
 =?us-ascii?Q?c6VqUQK/k+hS9que05Qi45rMdDCOAiId6pqqXkdpw02N0aKZexUGuyvfkx3l?=
 =?us-ascii?Q?gcp87JmAQB7nbtZvkOqdpQRXCtQ10dx70zvm6V3ZWwhlHVofExE9594uJi7R?=
 =?us-ascii?Q?UEjvYTUHX239pyxq3Vb5vfoGYe4+uvnHuoP8N8XK9oWpAqVb1rXbTCKH/Zuw?=
 =?us-ascii?Q?NqaBXZX4e5upJsqupn/YaUd7fKo6Jk/vhdlNaedWca+aSmqvwJi8x6cecGWK?=
 =?us-ascii?Q?gMENFyGG7AGPpfb7pGspg7IvEFHVvRa0an1qg9/C9bxzNhTL2qx4hQquMAT4?=
 =?us-ascii?Q?vCIv2xusMtZ9ScFw1wh5+bF3b6Mk0TvQ8BFJTQQgxdG2yvLUhERi+BLBTcKV?=
 =?us-ascii?Q?DbVeiZQ7phhZPi0af2mACcmbjKyNYLNkMcN1KVBsQsXHgjB8O76Q5PT1sXRN?=
 =?us-ascii?Q?P3wUqQoRtcMeaT5mMCAw6Dm1+HMiQvOZ7oP7jvtpY1kSeDoxZ8x7R7ctax1/?=
 =?us-ascii?Q?fNQ/Hayiat62QXVwqWUEb7iLLkV7lj903t43?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(19092799006)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6cYz2CC/wAAwhC5/+i3WI2OnF8Ta6ta5zV15kT2JWMFUdApIKU99i9zFrhBc?=
 =?us-ascii?Q?qIDGxtLf1mk/mgkdu6TJ98NPAZOJ9FwvK2O9WGxpR8fDwyejENZibYy0a/wC?=
 =?us-ascii?Q?HXSJp1ZsDwTOiEgRq/5Ci9NnCChdbKN8WPgIGkejdOoNS596DsiI0ct739IR?=
 =?us-ascii?Q?MWlv5VVFPtnwFYBVag+tAOdrqNa1itSuJSQKVfJ6yZpoBd0s52JcigP+MxJP?=
 =?us-ascii?Q?cpuVjGMshC7Zc8wQlr8rQ9yAEJG1xxTG7sxWeKf/4U2CURccJGQLY8MVzKZM?=
 =?us-ascii?Q?d6n5BDbOdG6GKE1Y1HnB7BS38Urs9VXao1MJEeEDVGdhWmQphP2CE0AbbyNk?=
 =?us-ascii?Q?bT/zarn/i3V+ThriCCEJwav+sYjZq7XDJIMPGAEX50X7tcOUHlMA6cH8tc1r?=
 =?us-ascii?Q?9SEfNj6oQnYVNUz25mXNd356oqS5stymaY8bWEDMugfEYlzA0tdxhlvgtzGp?=
 =?us-ascii?Q?ITsVX140iIYvXJOcgNJY2f+80f8zcEScEyPyAAj3uIk36U8SZ3OBSs0OKjT9?=
 =?us-ascii?Q?zAc8Mj14FK6meksWXoWuuLB59n4s9bU39qNtSfEZTjWDUkUNz+zuCQUH5sBm?=
 =?us-ascii?Q?fRGb0Hi4ZgFX7DnGfesCzfsEIdKH446kaUBJq9z6OEQ0Hqa5un18chBJRzvu?=
 =?us-ascii?Q?NKG1JzrT85THELuXCvC/Qu5CqTYYphswRkUYUPJhgXmJV3I1G9nxcoNolUQZ?=
 =?us-ascii?Q?Dugnz6lY8AqdySXWuj4+heDlaCDD0nZ5LP6ZstAL/Hm7ZpPtuc1MM8ARvfT6?=
 =?us-ascii?Q?UY9gauUPhzcKuXoVTMF3ZSTDhVzu5Lcb7nh65u/Dg0vjMmWQw1rK4jWOAZvy?=
 =?us-ascii?Q?5zKxKt1wVigXfrIgsPY+1Pvns+y42rxEIF0PnMd55J5s2SFTuY9y+amjnqaJ?=
 =?us-ascii?Q?DJ8i0QcAJAXnoY2J50WOI48VoerznsUHmqAc+cUR9RBh86PzVEqZZECfan1M?=
 =?us-ascii?Q?VMLds3br/OQ+tAKrUlZnNfG9l8uJ2ukf+rGBs/hARh6M2dFblzvymQk9YDc0?=
 =?us-ascii?Q?y5wKNI1mq3xteEZ0cXkKHmI2WLTBXFt1K+RXNFFK9aqSMm1QSALPznR3RBCh?=
 =?us-ascii?Q?pd7dn9QJKFpevzZcsleBfVYg+6A6W8crrZKGykbQKBMi3F0M/tAksaqPsgvk?=
 =?us-ascii?Q?/K9xDoRjxjOl+mqNhLSkfWg4cLW/RL3TcW30G2Fuaw39j+1MefX3zduXojhB?=
 =?us-ascii?Q?4WDxdyrWYQdgaPQgfyI9cIWwoHql/oEtiEpAJiiMum3vLLOwvIHIYuw8IEur?=
 =?us-ascii?Q?t8Mk5WxHCEAyYjpsSiANdGnHiX8h7XEBCyoxF3jAk7pu11rTbe3jdywlOgw9?=
 =?us-ascii?Q?9JRrKlY90bZYKr3XFa/AmnYDo/DSYHJPKB01NclsxmuydkSo4UIK5a242+Jy?=
 =?us-ascii?Q?OzenDwxBY40nyWWzw8o588Id1hLQuYJWa2oS+9t920cLYH3pRXb8eRWrDPh5?=
 =?us-ascii?Q?CRMzehgRO0SMHXXwvPIPNw7Ss82sdcSbUBYsL76HnRWiktNqio1p28YrKdn/?=
 =?us-ascii?Q?HaorUZCUWoC1XU4X/tte2lTmaoMAiKMHUnF7m5ORYpDV3b8jL5q4vdnUdfve?=
 =?us-ascii?Q?+LbtSmFLsA1AAAUV3voGGE8YjvLWl8DVPzx1hA4Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cc6002-1220-4d55-33ef-08de2bf56112
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 07:36:43.0955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Z9nYZ8UUnESOYafP1wEZgeArez5XbwM/FFpbzT2s3grYNBZvVPvkkJsuhrZuKXDr5/K7hqvYIjX1+5KEyiodQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8620

On Fri, Nov 21, 2025 at 12:37:47AM +0000, Thinh Nguyen wrote:
> On Mon, Nov 17, 2025, Xu Yang wrote:
> > On Thu, Nov 13, 2025 at 11:05:43PM +0000, Thinh Nguyen wrote:
> > > On Wed, Nov 05, 2025, Xu Yang wrote:
> > > > Do dwc3 core auto suspend enable for device and disable for host
> > > > , this can make sure dwc3 core device auto suspend setting is
> > > > correct all the time, the background of disable dwc3 core device
> > > > auto suspend is to make its parent device suspend immediately
> > > > (so wakeup enable can be enabled) after xhci-plat device suspended,
> > > > for device mode, we keep the dwc3 core device auto suspend is to
> > > > give some wait for gadget to be enumerated.
> > > > 
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > ---
> > > >  drivers/usb/dwc3/dwc3-imx8mp.c | 31 +++++++++++++++++++++++++++++++
> > > >  1 file changed, 31 insertions(+)
> > > > 
> > > > diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> > > > index bce6af82f54c..80a431cb6fed 100644
> > > > --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> > > > +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> > > > @@ -158,11 +158,31 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
> > > >  	return IRQ_HANDLED;
> > > >  }
> > > >  
> > > > +static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
> > > > +{
> > > > +	if (role == USB_ROLE_HOST)
> > > > +		/*
> > > > +		 * For xhci host, we need disable dwc core auto
> > > > +		 * suspend, because during this auto suspend delay(5s),
> > > > +		 * xhci host RUN_STOP is cleared and wakeup is not
> > > > +		 * enabled, if device is inserted, xhci host can't
> > > > +		 * response the connection.
> > > > +		 */
> > > > +		pm_runtime_dont_use_autosuspend(dwc->dev);
> > > > +	else
> > > > +		pm_runtime_use_autosuspend(dwc->dev);
> > > 
> > > Would this override the user setting everytime there's a role switch?
> > 
> > From what I know, the user can't control whether to enable or disable
> > autosuspend feature. So there should be no overriding problem. When
> > user change autosuspend_delay_ms, the delay setting will be kept
> > everytime there's a role switch.
> 
> Should we set pm_runtime_mark_last_busy()?

I think we needn't explicitly call pm_runtime_mark_last_busy().
Since commit "08071e64cb64 PM: runtime: Mark last busy stamp in pm_runtime_autosuspend()",
pm_runtime_autosuspend() will do that thing automatically once dwc3 device is idle.

> 
> Also, if pm_runtime_use_autosuspend() is set, make sure to unwind with
> pm_runtime_dont_use_autosuspend() on remove.
> 
> > 
> > > 
> > > > +}
> > > > +
> > > > +struct dwc3_glue_ops dwc3_imx_glue_ops = {
> > > > +	.pre_set_role   = dwc3_imx_pre_set_role,
> > > > +};
> > > > +
> > > >  static int dwc3_imx8mp_probe(struct platform_device *pdev)
> > > >  {
> > > >  	struct device		*dev = &pdev->dev;
> > > >  	struct device_node	*node = dev->of_node;
> > > >  	struct dwc3_imx8mp	*dwc3_imx;
> > > > +	struct dwc3		*dwc3;
> > > >  	struct resource		*res;
> > > >  	int			err, irq;
> > > >  
> > > > @@ -240,6 +260,17 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
> > > >  		goto depopulate;
> > > >  	}
> > > >  
> > > > +	dwc3 = platform_get_drvdata(dwc3_imx->dwc3);
> > > 
> > > It's confusing how dwc3_imx->dwc3 is also named dwc3...
> > 
> > I will rename it later.
> > 
> > > 
> > > > +	if (!dwc3) {
> > > > +		err = dev_err_probe(dev, -EPROBE_DEFER, "failed to get dwc3 platform data\n");
> > > > +		goto depopulate;
> > > > +	}
> > > > +
> > > > +	dwc3->glue_ops = &dwc3_imx_glue_ops;
> > > 
> > > If you want to use glue_ops, please use the new flatten model. I
> > > don't want dwc3 to be initialized again after of_platform_populate().
> > 
> > I understand the new flatten model is a more suitable way. Considering that
> > many i.MX devices are using this legacy unflatten model, do you mind allow
> > this change firstly and we will switch to the new flatten model in the future?
> > 
> 
> Do you have plans for this transition? Perhaps this is a good time to
> initiate the process so to avoid having and maintaining this improper
> code while we still don't have it yet.

OK. It's a trend to use new flatten model. I do have plan for it. I'll
prepare for it later.

Thanks,
Xu Yang

> 
> BR,
> Thinh

