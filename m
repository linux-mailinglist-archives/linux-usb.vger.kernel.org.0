Return-Path: <linux-usb+bounces-17144-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4459BDB7D
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 02:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12912284A95
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 01:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B5918C03A;
	Wed,  6 Nov 2024 01:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XGbS+d6p"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D64D18C011
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 01:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730858083; cv=fail; b=G0XWWs9KJiwEUgHjNdmxVtIxCMR0UoVcJRhNWLnh4qymYfx5Yr7qrAh59gOPRzNGbh0dRD+JZgziJDpnA6UgEjVkVrZkIYR6tYOVIunZpu6iMQ3ii2m2Sr0BXX86aTt8vfgrKoxjKB4dv5GWIyjufHH9INOjCKQ+6mxjlCF5QoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730858083; c=relaxed/simple;
	bh=zT52IcQqqAdVGjf6bJk/RShZzMLmJjQPnS/4mkbae54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=roYLTjgF5x2H+PzH3+6J7N9mvpY5LqAcKB0AAwYLF83fnU2+GuwH5DKLU8SgGLWKPGPBio0gMhG3++LekumYBLfkMfKF1nSlNxm4pA1zUSGFX1AmBaREzFtZnCEwsKNspulaCiQm4YqfggyIZwtP4evxafOPSnIlZPyoHeBP0Fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XGbS+d6p; arc=fail smtp.client-ip=40.107.22.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+wHTBnp3fX3S8wDm7ahVWT587dJTgUOwhWZCKHAlmq8yJq7jrKGr3CbrfHK3C2a08cBIZIH4cktk8WQb9VYQ6bgb1T9GSNBQvhf6V/UO9mCdJKyop3AafbumXMp9lpURaRR0UXEEFviHiinwJVH6qao+8bffST+3r1qishyLOnA4pAnTzlzC/nhtTy1bbiOd/on8t8tj0xJ9lKY3crQUFJUyMQvZBmX50S7d0PaJtO0+pPs6dvqJXmAgcrQh6NJzYg+Oc1BYYqanOgL/4rDoBc5/CYJhdiHYgPkD4PiynLsmbJVJEJM5It/3xaH2SW669J8VIHxmeP1N/6ebTx8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YB5jt07gX937C8kzQ24aTITxdBm6EK131vswGnTVadI=;
 b=qa3vtPodutcUnrr1jorktnJNeJNr2nEY6mN3g1THGCvaJMWT8eH99d+GqwvOvosTAVZQaMyGdhPjhmqCFNw4reMgryKGWKZby9FaQy+bf3GgpB2hee+3KRXKkmiDRvqRWNUEIxzOkuohSlTwRUgRKOKD7sUOH+gd61OTC5++SAHtufYR7t6hQ2LtJ+B9zVZacn2HbMkdcv5t5rW197HIYi402zzvxx8CD7SKMcXAqFHipiRMM9no5P2iDz4wC7lwsQsCAs8Uysx293CPDNa4flA6c3VhebylhJqjfcrYooEH07vAglKFryDhTp9B+BJm/7BnGNSyWiTei1kkHvY4cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YB5jt07gX937C8kzQ24aTITxdBm6EK131vswGnTVadI=;
 b=XGbS+d6p7iiEFWFhnEYoeAr33MbCduzbQr5eRfCKFzQyEDFMmAJm+e/nU3Wx2q2fhtHDpdkZBD39W1Q+GLkWKsB6nwAv+Or+mbhR24m8tKDb2t3SwSodqIIGEd/FSF3OokL/VRCltbmR3i1i44gj42BugRD8XX9eohSi3+TqyHlt6VUvbU8hbQNtx8ezSq3z2hrlvjWGhorEKi2aYR12SgWXFf2N4tgkcU+0qdlm5xv82YERu54KEDIO7BYIuL5Rh8Xb0YXIqprYTaOOD9AHkd3jvOUXKYVTETuXLNlRpqDMvry4lHGFFDRLSFGciFAORJMVa5IqVpKcCMHHK9Jktg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PR3PR04MB7276.eurprd04.prod.outlook.com (2603:10a6:102:8c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 01:54:36 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 01:54:36 +0000
Date: Wed, 6 Nov 2024 09:52:23 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, d-gole@ti.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: dwc3: core: avoid reading register after bus clk is
 disabled
Message-ID: <20241106015223.xreabx5vpo32p3yy@hippo>
References: <20241105071426.2411166-1-xu.yang_2@nxp.com>
 <48a687c7-24e2-4815-8cc1-d223b38e0e55@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48a687c7-24e2-4815-8cc1-d223b38e0e55@kernel.org>
X-ClientProxiedBy: SG2PR06CA0234.apcprd06.prod.outlook.com
 (2603:1096:4:ac::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PR3PR04MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c3b383-a29c-47aa-6afb-08dcfe05f7a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pp7b8AINHspN1ZVHoi8pELC1TLNZwOMe35Q170JVahaHly2+gX6bby89HUxT?=
 =?us-ascii?Q?ISA72RAT1LCaaufn1CDloRS8S9gpmtTp5YAXcXN/XdxNwUfeAkIx1ykYpH/c?=
 =?us-ascii?Q?U5WjhG+ETxvqzA0Ag3PbP8hvk4UM7tJtIwobwnWjcvGKuLAr4ar16WJy3xhB?=
 =?us-ascii?Q?J3Uaqr0n7PbH/5j3OMkGj0zkiAKVaHivM9E6r6qHWm2bNXlvb1Jjf3qeyn2p?=
 =?us-ascii?Q?ILTWYxjm+sOv2rYcOfnmIp43b/ZLvqmqy6TACaIj9/ODh+ZGBlvwPQ7j/NwC?=
 =?us-ascii?Q?ik90a/84K+0ZUCr+rnK//U7GQpTksqrNrmH1Tpy3y8IfvvlcR85DY7oNMluA?=
 =?us-ascii?Q?mlffX2Hg1pzXtYjRPif9132+4jwofCbKoSh2yeO2e0Zk6sjr31dTdQkeCmRR?=
 =?us-ascii?Q?uTLRK4zO24v62sinhzKhmsfj1Lem14rn+wP1JDk4tKslkZ6L1za5RzBskWvu?=
 =?us-ascii?Q?njZMcIUFTaTiCr3vmuZmYRPXVkXfKTbri2dM+wiOQRcFJP/b8+K6/WukcHD9?=
 =?us-ascii?Q?Ti+TB/aQl1auyyA0uncLXUtyFWnw7r2Rj0mJRj16wQ82tJBFhzODbBuCRPL8?=
 =?us-ascii?Q?kvXVrEr3AqRIMwJeW907Zb/2TMENnCc07MkVcPaXboypv+VCuYTGty0AhVFO?=
 =?us-ascii?Q?gnH97HEDqKXIv4zM6VT7qj1m8g526oGVFX4aGO2iqW+IZCHXE00oLXLDMz1i?=
 =?us-ascii?Q?9bTxHip/BQDjhmxMK4glKS0/hPxWkF26wwMZGLbFJs7Jl0OrcHvtK8DWX8p3?=
 =?us-ascii?Q?EuvxtwmWjUzyKHqMZ3Kk8XiiEqcu1m4+UUNvmaM0fKUG+ihZl3s5mEnYDYc4?=
 =?us-ascii?Q?z76auBgvBHNz1N83ieKVNESYA8Vp+cj3seohRHdqsFY9usCAMYPLEHWTgEp5?=
 =?us-ascii?Q?GhsExFVz1mym7ozO1Ezco0WVEhYcOnrqnnVQKZ8ub/7z1/ACufsEnQqEQ7vM?=
 =?us-ascii?Q?1Il8saPCskJAxGw2M/Y84rKrcfHnce1hqqnnTefUNmE7YVvd3w7pPNQ3r9R3?=
 =?us-ascii?Q?JYYX8oMrEg4cNWNrK6xyHO3MzL9Rzl9QObfC3Qah0VceNOMOdmR7kOwb4ln6?=
 =?us-ascii?Q?9+2oAMsM4f+WcD+iDropxMY/ZTr2BgIcjf9fmYAYqlv+ux+Mp2Gfg/AYyrfW?=
 =?us-ascii?Q?Z5frlGIqGqsf1QQNgrg+mbdsA5VOUpG6feLzIb0jZZbzNiulkt5gds9M/Xqn?=
 =?us-ascii?Q?wAndYC45JC2xe0ZIwviCZyzSLPxndGBAkXLdJOGrnMmc59rt1b/Orpx+sV1B?=
 =?us-ascii?Q?q8U+Qv5M5OrG/YiiYEoXiMlPbtEVaxQC386GZHUYxIyNniBZ6w3CA7ULBIq1?=
 =?us-ascii?Q?r7jxjyEYCLVjrqVhT594acsm5YoqLwSE3YbTBuHYlnwQn7wKsEwx3K6HlaAP?=
 =?us-ascii?Q?oqHRd+N4gAv2BG9otvAXa2R1+k9i?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bb9U/Xg2IruY0psBL0TEOeJty/7UEhjaAqCtvTF2mpkO4zqiJ7y+eRu0G5zG?=
 =?us-ascii?Q?WfO3iQ1eXk9Yo1XkEkpuhFGtvRpH7fVvaf9k/1R6oMrbHwtcFk6vnhhD44as?=
 =?us-ascii?Q?7Kim1p74LG9gYmZM+fQ8/6y8rc7LcHkyElUWVQfunK/kYlG4hcgOWiEjf56x?=
 =?us-ascii?Q?YDNmSvtW81gDQme2c4rXWP9/V9JFQTdx+ML+v9XrSPiMiX2MLol76RRkEiXO?=
 =?us-ascii?Q?HqOl46kcEDuO1pTSiiysEm1R2IdislqsELx5xXNNoYSE4Pm3ybydZznsQtok?=
 =?us-ascii?Q?h/bDlXG5qHcco72nzHv6TRYOoyZdbxk3mzggu3DLe32j+hXILxy6HF6v3kp/?=
 =?us-ascii?Q?jx5jhiXNrDsRal6DAl/xEBUl6KH4aQh4mHKOgz2mPRHZp0xfDr/g7K2NKaow?=
 =?us-ascii?Q?EUA8TVfNoBU/wdx0BpFBGrmkEPS8gKUV0quWmpD+MsbiYj59UfgENmIuw8eC?=
 =?us-ascii?Q?PMTvKZO1o6ocbd18x2MculsVZXNGLnRrwA2vexEOFGeE2Vm7w3QYmoKt3bsb?=
 =?us-ascii?Q?ryoDAJPl0PrqhQuQP246wWk5UhEB7lCyeOCmA5EwbWyYabk7ojCoxASM6/jZ?=
 =?us-ascii?Q?pvok5pFdWqxACa6BLlpvvsj4DjmNn6msDJYDacVfVQdyKFW1x19iemRPmyuf?=
 =?us-ascii?Q?wpRmYhJnbMf8x5xgqYIWuVXNk57TN+Z9cd378D6xXuttYYuonksYYu9n3Zng?=
 =?us-ascii?Q?BaZURd9JKmh9ItaV3p3SaJ6uTYo0WjOkePQdN+3TYz1WMZemxVU3MDdrfF3Y?=
 =?us-ascii?Q?Dn/+KeMSh8TxQKyD1KFuPnR3sMFbeqSXeJn1fF8FO40qi6Wc5kxw33kRlVe6?=
 =?us-ascii?Q?EhPRp1n9cOF5OOPruErFpKafnNs/0zFhspErLx4mK49f/t5elSLUqwDuivA7?=
 =?us-ascii?Q?hDmWS4e2o85ucMToTI2bCCL0CIx8VrOUM9+UFWykaZ5nCbcR0Ne3tjFC0kP0?=
 =?us-ascii?Q?YaoUquorhoJxxNZHyHp5Hr694hQFaVerj56XXpg6QvF6sY/iO5zndb11dZWy?=
 =?us-ascii?Q?ejRwTMQWdrsMPJkEH5v03fIrjQOsgTUg/LQKyZeMl7s16dlViivnO5wQrY4L?=
 =?us-ascii?Q?895z/k0tpKthIHW9bWvCZb9kQlPOlXo6KNi1pAuYH+aB2SuBqs9bxa01QClN?=
 =?us-ascii?Q?PxcPSB5Hj1Mt7aiCuVUqu5DXOmnld61d4VqJvhttATb2DoOtBPP2oo+kN+nl?=
 =?us-ascii?Q?JeecqOX/dJXAxXzWacsrKNaoGuwJP9OKRQaWtd/dzFftYQ+dkmSxVdHRJdos?=
 =?us-ascii?Q?6zAKA3+xyEBdEZlTdrPZcZWpwn1dj5QbAXI4yEODBGtrKe868y1rdiJZrnAU?=
 =?us-ascii?Q?9YypyusZHnlDavsDW+nF7AD4tNk7/X20JWh04WxVpOCL8qhDvPmOINWNsodx?=
 =?us-ascii?Q?vF6d4ZkNJbPttkqYgM4iAniWwgaJcTx5RBXIwQYDEk7vt0YDmyCL4MjKjVwG?=
 =?us-ascii?Q?ICFTkCw9IVVuVEBSR4vhjB6c9QZUxAYDVmkz+M2I2lDr0eYuUJHn9n4sp5Rw?=
 =?us-ascii?Q?Ro1sysUXDjL0MuvRf0vKveCDS27CpBoAtQnlCXOjiWkQzVfBgR/xi36LXw23?=
 =?us-ascii?Q?xPunYVS9LI6hlivJbCjMttKbISIAqDK7YhbcRpGi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c3b383-a29c-47aa-6afb-08dcfe05f7a3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 01:54:36.4302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQRzTetVLMYRaSCBDYX3pJ2RFQQ61EltlUEk6Y1KXPaGCt6N6kreu6pn4sFfixOhM5GWYGG5MXjBAT/R9rxfng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7276

On Tue, Nov 05, 2024 at 03:56:00PM +0200, Roger Quadros wrote:
> Hello Xu,
> 
> On 05/11/2024 09:14, Xu Yang wrote:
> > The driver may go through below sequence when works as device mode:
> > 
> > dwc3_suspend()
> >   dwc3_suspend_common()
> >     dwc3_core_exit()
> >       dwc3_clk_disable()
> > 	clk_disable_unprepare(dwc->bus_clk);
> >     dwc3_enable_susphy()
> >       dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(i));
> > 
> > Then the driver will read dwc3 register after bus clk is disabled. If this
> > happens, the kernel will hang there. This will move dwc3_enable_susphy()
> > ahead to avoid such issue.
> > 
> > Fixes: 705e3ce37bcc ("usb: dwc3: core: Fix system suspend on TI AM62 platforms")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> Thank you for the patch. But this was already addressed yesterday.
> 
> https://lore.kernel.org/all/20241104-am62-lpm-usb-fix-v1-1-e93df73a4f0d@kernel.org/

Got it! Thanks!

> 
> > ---
> >  drivers/usb/dwc3/core.c | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index de434f78c560..b0f1e32d426f 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -2347,6 +2347,15 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> >  			    (dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0)) &
> >  			    DWC3_GUSB3PIPECTL_SUSPHY);
> >  
> > +	if (!PMSG_IS_AUTO(msg)) {
> 
> This alone is not enough as device might have been runtime suspended before
> system suspend and we will still try to access the registers below causing a fault.

Okay. Good!

Best Regards,
Xu Yang

