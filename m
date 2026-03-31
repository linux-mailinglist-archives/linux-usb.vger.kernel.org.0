Return-Path: <linux-usb+bounces-35713-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OJ/G34ty2n8EQYAu9opvQ
	(envelope-from <linux-usb+bounces-35713-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 04:12:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1683363536
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 04:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF5A13046053
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 02:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22933366DA5;
	Tue, 31 Mar 2026 02:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CY9QFg92"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010004.outbound.protection.outlook.com [52.101.69.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B3A364E8F;
	Tue, 31 Mar 2026 02:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774922937; cv=fail; b=U4ygfRbQMec19lt/d607/IQ2ZpVFPXkCYZHtz3LaIR5+qarc0X1aR4uLI750lVM7vtzBC2WFaLrkn0XDKbD0dcRhVXMh9sCspFQ4UwqsVMtGt/cfbUu/0wNXEk9jD/upoqdnmVBEouXx4gGhjR5JOef+5h0nukChTzEfxO7jd0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774922937; c=relaxed/simple;
	bh=ggcxT9b1hscno7s9A7HHOiC2rGQxzL4Hq9zSYZPycis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FDq9V9N89nm23LOjCrqQwqK0yFw2eqtXshtuQWI8PfUH/g8GdONNmycqtI86bPFSgin7cJ6/XobK7S8D3+UsPJ/GaB/aGjlBL1REhwApF04dx2oetnjIg5aKsqiVSfmPI8O2I+QYkbEuHIBryGkhsfx+ZEs+0hB3gydzSEYNqko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CY9QFg92; arc=fail smtp.client-ip=52.101.69.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Do/IUxo+sHCim3LHJDaGyUTTTpZLiJ/4audped8wEliXAj3Wr/+i+XFytJb39Y7dzLgDr+GsHQNRVlZ913NKVA0bcLpr5YLZvRltf+WHQ9ACYwjWO6+D8RCQWMwEVuV12Wf9AeLgHQsKCVCFNw7XeXWWh75tnBVci3HsPR/WOitaqp7IxZo8N3HBh1hm5BpgCJR/7TyHRmQeNXM/LVIF396xVAguLFBnDOS4BLubnwWaY6WR9y0HlvVbcNN57LsnznBskn2v4HNSl2TRYiS2uB/z5/aFzMkN/VSaH4k4Jk6wWP1b3PZpCRuRNVnbmsjc0vE0+wdZ+BF9nnRII6Dv6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGuHp8aoiuJPe47pC/cyQ94ZRW6sKC4jXqn0AUqdy1k=;
 b=LPnwIWml1knkquT23+Cv/pTGArHV4jUdYuixFXuf2Dc6myvkwRJobDn9UtPOkHXYYVpqO1bcvZiGKltaJvBwIn6Sv+9ihjrvyXSFPDhv9u8Zh/XxV4hjwq45emZSdZZNwxNNeCIYPrMt3nip+mABbYIjEkB+AmoVxkGSKXjOik0a91ay1jmzuGEJ18c9vz16kxPMtRld4U4rtkSitexcxIjHenDooHGc62ZBb8L9AWwf7ffmv2FGzPbIRtCOYPxWXE8a5CxBMGWruEnMfXdCkolKKLXuu9WbjgoIsdp+qFW0qhylqofYyGjNn3hwSj0wIAcFgIbZXLbIfSIRomxaiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGuHp8aoiuJPe47pC/cyQ94ZRW6sKC4jXqn0AUqdy1k=;
 b=CY9QFg92JqDKfWlZkSSlsl9GIzVOfDbD0u+9ATA/iIqfzwmJgXree9PmriVXIIYI0wR4ZkYXDYS5TgiOodAGZmHgc7kpI63CAGW0GFJCp0zCTaQUYY1fOSKEzzx0n+LBYWUKR17yy0pbC/kMsqdfQFSOV6e/83+gwhi8PKEWRMBqt4tsJMwxVm2BSWqPTBzZCzt9FgS4lyTXXKcNe2klXXTWzUBnyY1OASbMFeQUY2X2hAzpidKXF72I4yEOjqVuRmtZqp5J8ADj2Wj4ch940kZu7uIy85DyXIiWCxxbeXmr1CN6aTVjdaC3odo7zOt8Sb6BEg+KJXJEg9oWkANo0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DUZPR04MB9823.eurprd04.prod.outlook.com (2603:10a6:10:4d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 02:08:52 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 02:08:52 +0000
Date: Tue, 31 Mar 2026 10:01:00 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: gregkh@linuxfoundation.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-usb@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: phy: mxs: manually reset phy regs after a warm reset
Message-ID: <bjwcc3nextkwac354nfx4yfzwx6s6nuppv7xo6mxbgwu3irhrn@xkrezogzqzjg>
References: <20260330093133.973785-1-xu.yang_2@nxp.com>
 <acqJ0Q_Ux8PvGT7s@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acqJ0Q_Ux8PvGT7s@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AS4P190CA0059.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::26) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DUZPR04MB9823:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4f1401-35ac-4313-594b-08de8eca7457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|56012099003|18002099003|22082099003|38350700014|27256017;
X-Microsoft-Antispam-Message-Info:
	8hNWh9aGOuOzGX96Iw5xmWbFkdlR1UP+lWUqV8PJaS1GQjN2GULdi7eZ4t2iKBHcVZ+r1dGVBAQr2Ghy4V2j7JFoLkhZdx2zK/c+l/RSr8UQ8GpKwM2sIkAEWcLXaR2GWHOB0Tzf7TI2/N2WtCxH9AsxNR37x92ao+NPSUB+Mvz/PqRaZfkPW+yEFREr5GCTPnTk3xBn/DmnpTJhFZXH0oYmS/+TqaZfzORrtUfWKCYeYbVQsVkMB0Xm4XWIcns2aCiQ1w8ygyP7dfeUGWMhTEB3Fbq9N/RnlTARvFq1H58bBQ5hST2pK6mhbdqrZEVYPQhbOtdP+3pDyHcDrdKFrxOemNyqolDVBjC5ZmZ8eLSLAMbq4zmGjkWcyk1s+uygv2wO5NE9n6VEl1xKnEbtPmMonu7BIeR9XvCM3G2OB6VX357N96L/2k2TbY8fTSkVBoxv9XPBhQUPXlkHPseOp2DjvbyK6rDutJ9cLplsLBRuzjx9giK3R2fq75ZXCMbAf/AerxQlK3/2zXancyRJwTy/NxJ985J/bdlJXCi/Fw3ngFkFPp2eFudy3Irb6I0ds5hWLBJ294MlB6UFNMd8Xa7Z0XlfA5VWKs+YWoU5Uhh/AT2OSiH6glLedfbucNnpYvrnVToVAFEgtuSXm0HY5PU3ZOTkaUFOV4Ws1Mo5tMNofqxodlfeAumPvtWsWet0K/9XupOsaR8t+xxRmLDJmL0CkBthSLvSHpTM579W4yRJdJijf54FonCH26st/3j+uGs2Sxyv23M4KMQp+LaU1UWqxis6X4ULiy6Q1PkD5yDFyqL6/SOLSVZ+P595T1Pa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(56012099003)(18002099003)(22082099003)(38350700014)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EwiyxCnyUH7Ad+6t4c+0rlgyYoZlvomhYRqPpBx4g3kG6HX6e6/nb6RCmi61?=
 =?us-ascii?Q?RcYXZpt8oaKyuVnvnDHyc8Y42GAzS2q/GHPq6NE9k7VjPfy3Jwlrm1EL72T3?=
 =?us-ascii?Q?sijAPqhS0us5sNMsxAh3wbDHPu3GMsnpQHgtyJfQk11IQqtvumh2sxIODGyh?=
 =?us-ascii?Q?AYvZGIWywo+aWslaOwnEW9N41lPp7VPeNCJToXTx/iuC7aJhgykIWYfwo/xI?=
 =?us-ascii?Q?10s/dfmD5QQLsosR8XIh/Kx1LNQ06LzjgF1ttWrcjWSfat+Y+U4LmG+pS8YQ?=
 =?us-ascii?Q?ICtkeAAQo41eSKSxeq9FO30eMIOIQ/FZk5e4Jg/j8Rsr96ZA67a2aYkDDGbl?=
 =?us-ascii?Q?FuDyR1rgkOO+Q4MDsbV8EI7wrL998BYXGtR5igLKVcXDA0roWxiaKUQGFaCy?=
 =?us-ascii?Q?/ygMEdC1UrHrw0xuqC+NdZ5KjbmaEBx8wWhlBTg5B+P4UuVNmTP9Srm0PsYE?=
 =?us-ascii?Q?KeD+39arIHMAleGLW8YLgJUtcqKshpPwaxmjILxV4US1iGPvqq4dXuW7KcVX?=
 =?us-ascii?Q?dqw8b/G8MYPANNKy8ugn3xpWA87GiI7mreeJigu9SDkWgB11K0Uh4exkZ7q5?=
 =?us-ascii?Q?nW0ubUcMv/vcT8S2e41MujZMw1+bLDjERPir4QtO9yBkCRgSTiqB0Z5SHm9T?=
 =?us-ascii?Q?DjQJVYtxowuPVpbMcWlyu46EGRUetpCTk7ef7FdxsAt6LqUCRsziw3H3ALiV?=
 =?us-ascii?Q?i30vAMysbj0rWdCGGvDtmlp5AWA/bXpzh2s5HNRY5tDwJOv6acW2SogMf1UQ?=
 =?us-ascii?Q?9phxNAsqmB1GdLHj1otRXlQ+n4z1SQJ/R99iMeiriSV/5XkWlYwf07c2WnxF?=
 =?us-ascii?Q?6XUCxByGNgXQUTuM85TPO2mV2dnaTRjactbrCmXoYmM+Z6FYtOepx/V9c/HZ?=
 =?us-ascii?Q?9vnHP7O5bfZUTlmtnWr+yOdDycfWLOkGptiCDiltF7CYlExaeywDEXCIkDWh?=
 =?us-ascii?Q?/uvgqycmLdHuZSDqRhJr8ZcC/PxDWfR2tAOuHIkOKV8IBvLzIyZEeTtfEl0Z?=
 =?us-ascii?Q?FUoHnfK5I367q0JL/vYAIHSe/DLXJ0EwGVTXaLx9QuAFxjq3DYk89y9CVBvv?=
 =?us-ascii?Q?tveQPAHvz4MwRrS/Tmnfi//bNj0Sua6Jvjh58WtMPcmoyu/9iCmpD/6AlAeL?=
 =?us-ascii?Q?bLNvGiPTwINwgJ31BnJbZdH3TUxoGg2mWBmSrcTK0MDKOkRmfQfbc575TC0A?=
 =?us-ascii?Q?vBrIgarl6wjeB9hdenTTb5OcYaDxJnC33+6+TIQLJCWDCKepn0JHQi5q/kXY?=
 =?us-ascii?Q?jhB/4AFjmE3SvDLby3GV8OhaFQJLkQahbk4kP+s4aNQTjYk+PYIml73sfSyw?=
 =?us-ascii?Q?rjwhz+0R4uQ5PA5UksVyLSRJcpH9GhnDVYMtO6VDltfv0Wpd6coY0PYlHnES?=
 =?us-ascii?Q?lGeOp7QFHF9V1GX6fMRRfWBg9iv/0c0951I1F5Og+GXJqqg4Ut5+AkIFtJ5H?=
 =?us-ascii?Q?+SWN1W1gB1kvVJKfUGTrLFdDizYXHQ/vbO6sENRU8W8eQWp8oRfjMbX1l/+i?=
 =?us-ascii?Q?w9+ubrl5eAPKqz8AvFuF3uTaafws7tKsTqmsiWTt6ghFTYQ9FivwGb4dW+7E?=
 =?us-ascii?Q?qaxac61Gnq9CvUc11Vf68k/PfLQrV7A0v35ru09wkbozl8YvDis6Ot5uJlHI?=
 =?us-ascii?Q?yh8BdFBEKyCO9wSyWjfLE+H3yKuHNxqnY/LEjY61VmLpuoto3fbPWdtmqm20?=
 =?us-ascii?Q?ueNPhgyfSHLfiJ5RQfrGpnhMslexf3p84CbGAapc9LWHVSn/lRKRsalaMxUy?=
 =?us-ascii?Q?PRLi2d3TYg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4f1401-35ac-4313-594b-08de8eca7457
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 02:08:52.1409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCVKm1GSXox2KNgihv058L8+WmxISP/uQthCltbvLy63LuQL313E9c4/C3IzJ1NcUll1NCGtvfBIngHuE7uKRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9823
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-35713-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: D1683363536
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:33:53AM -0400, Frank Li wrote:
> On Mon, Mar 30, 2026 at 05:31:33PM +0800, Xu Yang wrote:
> > The usb phy registers are not fully reset on warm reset under stress
> > conditions. We need to manually reset those (CTRL, PWD, DEBUG, PLL_SIC)
> 
> Avoid the words "we ..."
> 
> So need manually reset CTRL, PWD, DEBUG, PLL_SIC ...

OK.

> 
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
> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, mxs_phy_dt_ids);
> > @@ -248,6 +252,11 @@ static inline bool is_imx7ulp_phy(struct mxs_phy *mxs_phy)
> >  	return mxs_phy->data == &imx7ulp_phy_data;
> >  }
> >
> > +static inline bool is_imx8ulp_phy(struct mxs_phy *mxs_phy)
> > +{
> > +	return mxs_phy->data == &imx8ulp_phy_data;
> 
> don't use this kind check.
> 
> Add field 'need_reset_reg' in mxs_phy_data
> 
> imx8ulp_phy_data = {
> 	.need_reset_reg = true;
> }
> 
> if (mxs->data->need_reset_reg)
> 	...
> 
> The same logic for
> 	if (is_imx7ulp_phy(mxs_phy) || is_imx8ulp_phy(mxs_phy))
> 		mxs_phy_pll_enable(phy->io_priv, false);
> 
> add 'need_phy_pull_enable' in mxs_phy_data. (new patch for it)
>     set it true at both imx7ulp_phy_data and imx8ulp_phy_data.

OK.

Thanks,
Xu Yang

