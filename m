Return-Path: <linux-usb+bounces-35712-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEy8EYIsy2n8EQYAu9opvQ
	(envelope-from <linux-usb+bounces-35712-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 04:08:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD2B363452
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 04:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAF8B302BDC7
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 02:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4A0366575;
	Tue, 31 Mar 2026 02:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Qw65OIyt"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445532727FC;
	Tue, 31 Mar 2026 02:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774922876; cv=fail; b=dxUu8YZHYgyAMc5vGKQylsP8IrZsIsPUeX9OQ3V0MPAAKe5mCW2zRW8odO/W0RZlCyVyjzXk2MnMXTifFSZKUGxBMkGMkT9NjVfcZTVBDegr/tjDMBZMr3fQIAnXKvKmO5s7hAAqBTXUvgfyO2prH6aw11xYI5giS9dXONiMbK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774922876; c=relaxed/simple;
	bh=IV8vVv9F9sYdHnYugn53YVQQ+KbYCSXdmZNBafCVPe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YvG9UTYN3geAzvgyxVN+KB3bFYahLR0eHeYNcN5Ck0KrZvoigAQUB2BTXJwNj+IPOKzCKV24Y1QGPvoEWIIUARAU5PQNcG0uQcjRF4h62knkwWA7liAGKOL/QsC+LuDBOBwadbbwG/LypK4yVkIyUiMm3mDnFdQfNa0/8+y5iKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Qw65OIyt; arc=fail smtp.client-ip=52.101.70.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRtBNlZ6YTnI6n+0DOmx19WieSspQIpWMiMgiZFtAGJbXI5oWiwNtVd//VA84u/D9Hpv9BwqLDmSJotQFF94WPBMEs/NgrFdLT8r8fm6ZJFgfI2V6GM1OehaTGv2TQNkxE7D/J6dmffyI7lAXWRgLaPpUccOAc7lfG/dzRt7OIb7iT95XXQoQqfg5Ry99re2wvAz+QEluN6DeG9tWPIBWMLrXhBOjV34u9+KzFV7j6HwKkg/V0lGXagmXHFwAaLlrCEJ+zyeaZ532IQAHCoWq8faYVEEKkIfz26ZrWS0OYL9HEQnU4h2w0LnMQ8QRfyHK7eSWEjQdAkgeUGgEE6rXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7qCjZhp45q9+XsTVoGu8ThSoEenEMeSixJPmuFw4IE=;
 b=yl5CjAUx22ACvqMcac12ZcO5y50w6cxPovGfsf3+qpZB0AXLyoQPllI4f8xxdpbSLvphZj+ZtZS6m3fGuLmvW8PLjMsa/wulycPbfGwik5Boh7SdxBiRNDplOxDMwGnTpDce8OOuA7Dg2XT5Pb55GPzzeF9mWC+LaJvpWmKrcKvq3Q461MmF/TREH9agmG1nd2gprimlFfzHIt99BRloL2MxzTZlIusaPBVU6DamJRq99WaKa0FzwChWBcjJT9UQcTHASAWxIxDkHSbLzuEp8NKL17VZLC6GJeifibrw83yfiDyL/Xr7nwN1cLsQDXjvPhCT4B5r9OlMPyZoR2Bv5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7qCjZhp45q9+XsTVoGu8ThSoEenEMeSixJPmuFw4IE=;
 b=Qw65OIyt2kDmZNR8MppghEEIwQqo66cImdQa8KCd6X9QKCNhoYdS+9RDQT6xnKdiyzU8FDzWc2D1LFQx43AmsGaV1shMkB0WlAEBGTtsdgbmQuw7JiAuORc22y6XMz0p/jdUqA2kRXEGYvG4RGi7eAw+BQbcVR5afuAV9n+CfaN/sUcifQfiUQr6+BsjsGvNvUW1xjISXujhTsfiWtGBmV3zkqB8jxUnSzhVrI/mYktKIHTkb+ubdQ9Vr/AEMVQNeYTr1LdIJ9faZ59QDLdfUjifCghZ1q+x+INQWE/Kq/hn4lGF7DdUCu41CXT1tXI2jxhF4LINcKPZzqoInITdVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DUZPR04MB9823.eurprd04.prod.outlook.com (2603:10a6:10:4d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 02:07:52 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 02:07:52 +0000
Date: Tue, 31 Mar 2026 09:59:58 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: phy: mxs: manually reset phy regs after a warm reset
Message-ID: <jgudhanaaqz6j6g2q6dmocc4zfkrkkxzfuomlepdvlvjc35nhv@r3px23y7rkoh>
References: <20260330093133.973785-1-xu.yang_2@nxp.com>
 <2026033057-sixties-erupt-fea7@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026033057-sixties-erupt-fea7@gregkh>
X-ClientProxiedBy: FR4P281CA0288.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DUZPR04MB9823:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d9fac10-49b7-4a01-938c-08de8eca4fc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	jYNlVsWnhgB14UfGb+o9GnuAlIr0Z5SYgk4ZNAPO8O/T4ZSMQv0AJxPW6V2ma8T69LzSZ1UfekkX1LxATCZiX1xMhq7T7Va31e2Pr3a7p4bQ7rFTSYWwxc9SFBcWa2dUEXz1eZPVAXzXMm3p9gM+J6sbMLEwjAkIeeGovNzmfUiWaO+s04qA5sYVBs3pGVg4cJeGTbz7EovI4PGjbInOM1H33fYjeurZ/9ptmBmEI2OODBk6+s1t0598WQO6MMmSrteTNI6QsDVsryX5c4aA5iTwXjZs+n3ULVzUYHpwbMRr/9+UQ7e+jaXS7corEKqeQMNnYZHTpJ8F6/Eyz1o36IsDTP/xsUksSi1Gl+fc0lv/j/fDn2X7uiSx1skOXLBIbxLy83X89MgHDkKvJ1XcKkNlgVvjyWaNl4sjgaLxcJhbcMP14HI/Tf4VNwDPl5rO0LiecF/CmZETqrc+WRDNeZArtKQvVhxrnTHZwqRd4CtXJxko0AQD4dTRoR7uEDwiK1e3/ablYodOyQv5h4mRPgt/6iS5kKxIm2FWoX8Sta4CkIFDCwKUcMLtRiuuJ5ch7QtjN6zccdIRXW43x2dKHId8W49ZR7bbHCoGEgALUMWf65lCVfRy7D8CxPTtrLDLrycLmurbmT0d5zaDISyk/1NrvgsYiKF70y2NewyhtklvtatpsqgDqOP11RONGGGCZaotPYvTuPInKTQIbigIJ5/PV9ViHVq3nj6CI2+Vn+PWN8HeyQ6FC0Jloyta2AyX+9bA8ko3rmMfzsjlHOzEOkJueLo1GDnlwPpIpfo/wI0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rBCf6qAw9d/d7stjyjj5lLJoBUG+ZfQoKHfLoJHeq+xdvc/P1vpc3KmDfXIf?=
 =?us-ascii?Q?Jgi47ZgOQ5BUbZsQ/k4yuWOhyDLCbcenyUHStHQQoUmUJJXWLxo7WxRA1pub?=
 =?us-ascii?Q?H3vT0Th5XTncAtAIcn2FrcuF1Wkl3q+vBPl65YV3WRtghYtTRAKCC5+FYqkm?=
 =?us-ascii?Q?H2bhRTFqHE57JCFEBQYpRqBiXlqJjzQ0cfVkyt784zSOwdCQzZgn072eEYQZ?=
 =?us-ascii?Q?pZJ0YHp2KcD5gdtk6qQg+DWBKaYb+TglFs/B8mjGRCS0E7V7T314FiFI8xKU?=
 =?us-ascii?Q?eubYjcGnDV8/GkASjNvTak190CmTChsfKfIsEa6BENOxGLfUxZGjB5zLxzkq?=
 =?us-ascii?Q?xQNEblrP4XDCder/fXzxA+mxwE0gCYThvdCQCxTC86asiacrLb5r7AoLJiXY?=
 =?us-ascii?Q?FG/RSJ/q4hndl3pZbuFekNUl0Tv/Cigj3MSAGWUQJ9lTi8pmMP30whafgs0p?=
 =?us-ascii?Q?dF6AJnIazGv+G4ElYZLiAobX0MywMgPVansuALryKfQbs+EyhUyvqEd97j0g?=
 =?us-ascii?Q?fhhmHnBRuH5J5cxZ/XIniKW/TCdBBy5yS1Ie8sQEeXUG9k7QhhPgyN15v13s?=
 =?us-ascii?Q?JcrjY/ital/6DOlhObWphR7x3pRvNj1SXZ07SKxq3C1w/1/sOTI+pbQnUgFs?=
 =?us-ascii?Q?5eD+jJa6laznLW3uYgRz2lf752TpgxHiR4MbNWoiHtF/38kaICyk7bkYy52Z?=
 =?us-ascii?Q?lDTSjtA9NNronQ0Lm9MyS803x/5aYhE0cwseT4oNdNkpFuHo7z5LDFqDnSQu?=
 =?us-ascii?Q?T8l4ecm8o7F6pK8eUW7X/mHxAS8N2N8LMn4tKk6SiuJM+MTzUCVvDNqhzaO+?=
 =?us-ascii?Q?hyfUpuj8q92Ho0uDeoidobRtETHG0wT1YoHpg4aGlWvs5t5QBV35wXT2+LU3?=
 =?us-ascii?Q?NoVQtQQz5jXOPCLT6VEfYTYNyaPhJU0rqE7a+MbfZtzgqyLs89rWl3jjUdLx?=
 =?us-ascii?Q?1u4nEIMKkL0LMgcbdhWUMo4dSr8/KCoNSftBfKsIvXAvcWyftPY3PEzGe+5y?=
 =?us-ascii?Q?GOJ5q6iMDePpFG1v/GvuBKmMV94U0fDpmIVsRySZInrEKGsrY9N5/kA9ZkKo?=
 =?us-ascii?Q?Olt2lN3VgiEsU51rGT1lA0i62ZedtaHbcNfP9jrtHyg9E8dMvbb/Dv98ASqZ?=
 =?us-ascii?Q?85+t7WFUUeqrT1fcCeGIsdtLi8IGW1/+5hgBuRQEd9o5L4KKOvPwK8tvEn2c?=
 =?us-ascii?Q?STsmv5ioWS2yu7EEBLA1CYoytptnIj+oMXevYW2kuPeQqSQXzdxT2+9vzPZf?=
 =?us-ascii?Q?3DIQCw8tXbiTRriOKggJQn2pboAkDz+iWM9siK5d+f+GOvTYZQphP6LaMs2e?=
 =?us-ascii?Q?/sFIKCW3G9DLs4RqvFlF5t3Oj7B6hXOh5M5w5EuR8X7yKB/tFve/0WRb/Wot?=
 =?us-ascii?Q?ioQQeGujDURYL1t2g6IbIG/wcxHNDIJrqfjsWwx4SL4ByDO081d6mr/19Xws?=
 =?us-ascii?Q?4/k/aFB5Jd5fGeLugdVTtyHkCG6wY9+qh8eUPP2nTZM/WNQtD1QrZBrRapWC?=
 =?us-ascii?Q?QjROQtEk8fZTIcESHGFn8orXG1GVp10CRHqq6bw6xcIc1nShxE2crBCxRiZz?=
 =?us-ascii?Q?8keJGmBDxvxyqjFUmnxq4Cxea4B60L0Vd+kqU8jAs0Hw7vs7Opb6dtsXkPgd?=
 =?us-ascii?Q?CS5uVT1XBaISVowuk445sK3hgsM/JfVcMp5Z6uBLYd3EwM2+/G23Uvj28UjE?=
 =?us-ascii?Q?F7xvbsZ7Ks0PhcomkoDlrwY2EtC/4rKm8y+m8xm9iQx1RNVIFPJanvlD/53E?=
 =?us-ascii?Q?Y86Z5GkYGA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9fac10-49b7-4a01-938c-08de8eca4fc4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 02:07:52.1875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1D+EomHuBkECk2p4UVIvL5QWjUErzXSAIydJwQ2CnAQNUIgD5LWS6mPPksn+PjIzUva2yNr1v1Nss/YcEDwgWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9823
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-35712-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9AD2B363452
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 04:19:24PM +0200, Greg KH wrote:
> On Mon, Mar 30, 2026 at 05:31:33PM +0800, Xu Yang wrote:
> > The usb phy registers are not fully reset on warm reset under stress
> > conditions. We need to manually reset those (CTRL, PWD, DEBUG, PLL_SIC)
> > regs after a warm reset. This will reset DEBUG and PLL_SIC registers.
> > CTRL and PWD register are handled by "SFT" bit in stmp_reset_block().
> > 
> > ERR051269: USB PHY registers not fully resetting on warm reset under
> >            stress conditions
> > 
> > The following USB PHY registers must be written by SW to restore the reset
> > value after a warm reset:
> > 
> > Reg: ctrl Addr: 0x29910030 Data: 0xc000_0000
> > Reg: pwd Addr: 0x29910000 Data: 0x001e_1c00
> > Reg: debug0 Addr: 0x29910050 Data: 0x7f18_0000
> > Reg: pll_sic Addr: 0x299100a0 Data: 0x00d1_2000
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/phy/phy-mxs-usb.c | 32 +++++++++++++++++++++++++++++---
> >  1 file changed, 29 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> > index 7069dd3f4d0d..dd42db8a0829 100644
> > --- a/drivers/usb/phy/phy-mxs-usb.c
> > +++ b/drivers/usb/phy/phy-mxs-usb.c
> > @@ -209,6 +209,9 @@ static const struct mxs_phy_data imx6ul_phy_data = {
> >  static const struct mxs_phy_data imx7ulp_phy_data = {
> >  };
> >  
> > +static const struct mxs_phy_data imx8ulp_phy_data = {
> > +};
> > +
> >  static const struct of_device_id mxs_phy_dt_ids[] = {
> >  	{ .compatible = "fsl,imx6sx-usbphy", .data = &imx6sx_phy_data, },
> >  	{ .compatible = "fsl,imx6sl-usbphy", .data = &imx6sl_phy_data, },
> > @@ -217,6 +220,7 @@ static const struct of_device_id mxs_phy_dt_ids[] = {
> >  	{ .compatible = "fsl,vf610-usbphy", .data = &vf610_phy_data, },
> >  	{ .compatible = "fsl,imx6ul-usbphy", .data = &imx6ul_phy_data, },
> >  	{ .compatible = "fsl,imx7ulp-usbphy", .data = &imx7ulp_phy_data, },
> > +	{ .compatible = "fsl,imx8ulp-usbphy", .data = &imx8ulp_phy_data, },
> 
> Why can't you use &imx7ulp_phy_data here as it's all just empty?

Thanks for your review.
Because it's imx8ulp specific errata. Let me add more info in the commit message.

Thanks,
Xu Yang

