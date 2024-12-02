Return-Path: <linux-usb+bounces-17986-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB049DF8EF
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 03:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29CF5B211C1
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 02:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EFD22098;
	Mon,  2 Dec 2024 02:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h2/Ff+Rm"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CC518C0C
	for <linux-usb@vger.kernel.org>; Mon,  2 Dec 2024 02:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733106939; cv=fail; b=qie0tl3xtnlLQu0j92K4jbngxWyA0ND9vCG4razOjH2UsAbrAfUMZOtL3lucB27XXVz67dqYRJGwt6MBh8GS8G27osCVrMfIlG+YX+m9WGnOnmy4bpk14QwgT4TsPboHNF+gc46SFCnO3o8Nfp+pitUL+c7wfVlWW3vT82DmrrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733106939; c=relaxed/simple;
	bh=ZPnJAO03tUJRmqvu2pzpyWENLcU3810DLKgSMfkZvto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JZOMhukGa9BSxCm3Yqg28cPEId6vQN7IbywRgQNvg4Wi1i5kK2DBZAHA2+nuxB264VVH96uutAh60zGbSX+3iXGjtDPH8Qee8mOzeG0E/BvIxubGJHhipZ8i1citpucROwm9ZKCA/J0tUnHC1OYSUuoVO38zwCySGVMdvySZGk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h2/Ff+Rm; arc=fail smtp.client-ip=40.107.20.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRSd3gjNmFIJoX3x5qTny09jbzgMZ2/fbQoiFXlzgkSwbv+ZG/2vMT5lrntTj9sGIhqAQmbLXwhgzt9JurgJl/Kh6+jFrPtSZ5r7IkIh5kLbNKz6ZEdmIk+tQgV7pqVmq11qqV0RBLuoZ/mx1ABBIqPjaLGE2C0Aj17REaNzQU1gOjI0b7wSAo+OD/sLL6sTtpWxrQ4E0tG0UcvRKxJqiSaOLpI1riW/A9remFlYH3r5545TdAuCcaBVz08WsP6vpyha7aEXcwQ1LNeNd+cr+JlX78IRwNFzDcNKYbp51uN4XsD/o17oT4rMaBduQdXMWqnceW6b+R7Le0p+v2MnEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EErwAIabML0S1dsvMpCWYmpuIZB8fzYsIug9q1J+nk=;
 b=hL+mwPLVrdzKmKr/AiRhmO2pufLDqHmdTOH6zDgF0a5hC86NkT15+YLDyMLob6R1ypQRnEXZHNGpsj3V+YEE1oqQRRylWhTSOmErM6P7kmh2Na9Q61xkpk9wnYU26WEdrcttn0s8xnoWDxIix5jQ7fal19buCF8yQ7JRn9z6ojXHsl7qpz0aCs2zYstSWdN69bfRboiDEeSued3xxK/3n9QNqEKKZi/bOV7QgZxAjJP9Ic4IjhAUotuqZhKcQCXiub6Mx6lU2TPmw8/BzAjVo5meWz/IjvVj/Bt0pRZofO6cEJnrA0m91m7bsFPsO20dgB/l42SBPjxeU8SVJMLRgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EErwAIabML0S1dsvMpCWYmpuIZB8fzYsIug9q1J+nk=;
 b=h2/Ff+Rm0tyWF/AvB4Z1oOoT6l07y/6Rnn60s5AQqa8tXUboFb2m59ofcQwZ3/lqIayqZNOgUoYDK/N08f5D9BGGkpfKuRmra0JWplh30DVeE/2L1C+z04+FUsp+05YzZ0XAv8jNQYztDS7nt0NSgFOLV5H/Fpeq9+7yeMtHQjeU1FZ57QXgkhOo7pEiIu9uxrAhlozdfNcgQX5vHsY98ovZ1GgxV4Qsy5RzbNMyqtbGcU/zjnx2JtKYG+kiKli1PqCwdqqOyvKSgAl9sAyHRlOTsv8MrylOCFYoSC+/vhpzRJtudvPKy+U15j86dGhgbzN8A1sMJDm+MF281dRFDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10083.eurprd04.prod.outlook.com (2603:10a6:150:1b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 02:35:33 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8207.014; Mon, 2 Dec 2024
 02:35:33 +0000
Date: Mon, 2 Dec 2024 10:33:11 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: peter.chen@kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev,
	jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: host: Improve port index sanitizing
Message-ID: <20241202023311.2q6bmef7wykymbno@hippo>
References: <20241129113318.296073-1-xu.yang_2@nxp.com>
 <2024112946-undercut-ivory-5fe2@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024112946-undercut-ivory-5fe2@gregkh>
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10083:EE_
X-MS-Office365-Filtering-Correlation-Id: 96882b73-8ce9-4b15-ecdf-08dd1279fefd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ts2YRb3zfycJM/6fz95J2ociumwH90YylaLRuxRpB7uxRsuoP52vGO1wBNkT?=
 =?us-ascii?Q?s58wYE8TBjRBYeXmMh8z8urQ2lZNRq4N/hSMEq7U306TYJgachYEggeowUaX?=
 =?us-ascii?Q?LsGmDIvZyev3YmUyaBERojtHd7NP3OGPh1GNVjf89OYLO2NTQIqFk2wmfllq?=
 =?us-ascii?Q?n4L3arXpvadMVNDE75Rs3y2zbtwX3RtI437Ukc4BXiq0hz02+l6+RPRaYFRD?=
 =?us-ascii?Q?bwSpiJ12CwrOD3x0/+N22ug1w3zLVFIo52g2KfrANlCmEUbtpk1Qda2yaMQ3?=
 =?us-ascii?Q?s2PI7Tb/HoRQUua3lBEVvvjXSM29JNmNvjFEYdCd+6FiiZBd+9+S7GsN7NNl?=
 =?us-ascii?Q?i8U0av7Jn9bMVvVRO6JJLDkLjFJysmOuZBhyie4EIjP2908aJXmjFsXDWOaz?=
 =?us-ascii?Q?++KgHx9hvTLJxDNiH1LfILsQwXLT/0pDnZh3Czn/4AFP/4ubiXbVtq0+cGOh?=
 =?us-ascii?Q?1V1aC6r2wb/8Ab7Xjm11WxoKJdjrdxYgX/M5KRJeOi8eBr0PpQY1V3YNMXN3?=
 =?us-ascii?Q?dAQ13ZbyP9Yj9jEv2BcTLoUvXsih0Mwlj2ZX9hBzb6CgXZRfZU9DN+nsN1Zw?=
 =?us-ascii?Q?n9akInOrVs4XzWTDdK4nVpaoVLRZKjeEwHqCypahEQtf8SBKFI5Pd5niOYTR?=
 =?us-ascii?Q?em22hceQX48LvPjGtwxNyIlAt6cJ2RFIxltko550e5GPFpwY4MEmZeu8Tyv5?=
 =?us-ascii?Q?aaXrdEUh9XLAO28G0qsym6H1jsJJYlJAHJrAExfP9wzaRsBJ6OsSe/urGCbD?=
 =?us-ascii?Q?1NO8GRZDBMd2zGx7/4yo0WUdAShIt3PIKXKq8RI90OY2MlD+qAengHYOoEZw?=
 =?us-ascii?Q?1v/W0vqcX6r/feWGfczwdoIqXYOTyFsgWFEqjxvdMtFKqa45W73qrYS/GDRL?=
 =?us-ascii?Q?0z61o43y+86ghNQOYti3MfemUMbVfxevE1HpJWbYC74V0BqgHtUVoDD5Imh0?=
 =?us-ascii?Q?8lZp+3espEdwYoXQwk33ks4FcKk8M51vq1iW5Du2/wATOSRYU//IcvqbkMQS?=
 =?us-ascii?Q?s5cmaR18h+9vOqzRvpydZtnJX7w7J6y9HiCiCPZPfefqExFkoapW6cw+sthv?=
 =?us-ascii?Q?lrtfakFP+xKskYSLE/G4TCwkqqernIdcjmUEUFw3zt7ZRwre6kVsmfzjZO+e?=
 =?us-ascii?Q?pQw9myWtIcTqdOXiMo88BnKp/xvoOKlc3ltk/LlH4QDQRQtLtSoqgOyFhGnx?=
 =?us-ascii?Q?uolSz9ULOZDOroomtkKnZ93Jqg3kIgABiZW9hZWSVFZsMUecbL97Qa2IEfrR?=
 =?us-ascii?Q?ICPLF+aJ6CiHe90R3fallBZwXDG4BoDNIRYmrO27J97F0ELhXhTNn5luERDv?=
 =?us-ascii?Q?V/1LudR9Dx63lrHWZvt/uS0/kLsSOjZRP5dVfRWVnqhxrrcK2DZ6j6G/eSY2?=
 =?us-ascii?Q?Ajx6r4jyJ1yPFfXwWAAyv75B7Nu1ZJr+/7X9saeDGGT/JxTFKA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z6ggGYvYaYtPQmLHVNoQ5AGpprj9hgjW6q2GxIWhok1U/CgmTFXGxfi73e5k?=
 =?us-ascii?Q?KgoQKAZIt4J+nKYhj+AdylaVGh/rp55XJYxxR+igcWV3u2fWGEMLru9A2DhG?=
 =?us-ascii?Q?L2Qin++tGy1VGh5J91+g49jpu3rOsZCroMjMCSRiXVQeDvGjpD/NxoQyygNC?=
 =?us-ascii?Q?4UIKRgMGVVpEMjX7xNfK6aFKFg5Ozq1kmhSf5j5fbPyFATrY7EP7Dwuh8/BW?=
 =?us-ascii?Q?HMAN+kjNxRuOKtx9F33vw3eVEznrW6saBO35MJLCeDI5uMp82inbQ7LI9L0z?=
 =?us-ascii?Q?WM9QNiMH6BJzUnbEysJxaob4xhYe3ahk97kD1n96SE1/ZJT/X1UvevrwlF+B?=
 =?us-ascii?Q?7KT5Zhk2I+xiqLet4PpSXM0axoL+43EGy+/EUAZ+hNSLa0hO43J/S3GZ56Ft?=
 =?us-ascii?Q?eXPXSvVzr9qIuI9vULkbTo7Rcqnlb6AFJ0brfFZed4ncuZC8Z8qTgEbAsrlO?=
 =?us-ascii?Q?5Mq72yzV9/tTokPVmpmg6h6Ff6QSrPo9oj+ezcu7lKNceEJRnQ/mPUr6XLse?=
 =?us-ascii?Q?c4G5gduSJO1N8KdKpZzIMqO7KJHKuNE48amT4f6CmT5MDtz3h0N1zp86WaUb?=
 =?us-ascii?Q?RgpR/CvAtnIu1dMA769j+tYlO3DDACSnOiSpiKyLJsZ+GB9llogvsJU1MjDD?=
 =?us-ascii?Q?1xqDebZKbkQ4sCj3/qsI+KzTFQsjFh3M9GbP6Pd4R8Z7y8hd/4vmaDUT9nyL?=
 =?us-ascii?Q?CDmsP/a8xmSls+3qYC/arRPVYrjj5McSfBEB8XOeuSiuNv9EGpa9BsCCdf0Z?=
 =?us-ascii?Q?tVdFfmSSBBgOkxpG/UROFuKOkPM0K/tRTon4zLDCg1JeRkBWBi60/cFj+UIy?=
 =?us-ascii?Q?ouaC869WhQLlLlpwjr+mh/rrj8seC+VjndnARVFNXgQaJLDfpqKGO5oOAR4w?=
 =?us-ascii?Q?9LdUwOp753fngfKsCZ7CR6k2tzS1cTct0OmDTaChtJLGUzyeei9aFT9glf05?=
 =?us-ascii?Q?5fNs7MgMZB2zA2cpxpLmHKS1Y62n3d/SAfRHvem4njyJzVC5C6WjDx5at245?=
 =?us-ascii?Q?vHtP4elA3oeFhlOiQXWLKWG0tyJyiHE4Z7oT6fAm5jAO9lfqNDxNiq0EEV74?=
 =?us-ascii?Q?5MjV8OCDFrOdHK0OwsHKmgl5SLJ42EXsQ7Qav4TcxGKpYeuxqTj4TQcXiu11?=
 =?us-ascii?Q?OEP5W/iyzmktgAKu0c9yO96JR/lUhS+TMhmrhWeShAW6huygIXCuxkoynDH4?=
 =?us-ascii?Q?cqw9oiZkW8KeqOEBaFLT3iAyyT2rH9nVhQrg3nSKlWvzoxhqVcjOr2nJv3pZ?=
 =?us-ascii?Q?Qa1zsojuzKa4YdAAmTHpnzsYd41YrysFfDhTXU7biujbz7UtrqIUFiMYr6g/?=
 =?us-ascii?Q?Q208VAP/dsnjulMMnh/H2OFFoh4dU/F/FsB7LPDE9m5KEx2Gkk79lH8WN1MT?=
 =?us-ascii?Q?IBe5ABQl9fcoPwNhGgbQdu2BJ9nWRYXBozzL8//iM8tVQdcadDZ8W37uUB+T?=
 =?us-ascii?Q?iPEGmqTRYzaUuRPhG03t45rdum3iHaCk9MSghGeNytjzJ2sjvivsyzFcX5Ev?=
 =?us-ascii?Q?gWE+b4ulVAc8ha88oXr04v/cKEuFNreaBmP6vHJorLobqtv2zHGV+5lWcxNT?=
 =?us-ascii?Q?gLyogTQbm4h1a39BjB2iFMlM03rvW+2tfzn8uvIN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96882b73-8ce9-4b15-ecdf-08dd1279fefd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:35:33.6613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RyCkTJewYXllI/TEkkWl62HdksikFM79jTyoPO6zHGIIH1ew0TC1sz36Wu2HyhkBkq4qOgIlPKLDcopYT6rzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10083

On Fri, Nov 29, 2024 at 01:14:35PM +0100, Greg KH wrote:
> On Fri, Nov 29, 2024 at 07:33:18PM +0800, Xu Yang wrote:
> > Coverity complains "Illegal address computation (OVERRUN)" on status_reg.
> > This will follow "846cbf98cbef USB: EHCI: Improve port index sanitizing" to
> > improve port index sanitizing.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/host.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> > index 0cce19208370..442d79e32a65 100644
> > --- a/drivers/usb/chipidea/host.c
> > +++ b/drivers/usb/chipidea/host.c
> > @@ -256,8 +256,14 @@ static int ci_ehci_hub_control(
> >  	struct device *dev = hcd->self.controller;
> >  	struct ci_hdrc *ci = dev_get_drvdata(dev);
> >  
> > -	port_index = wIndex & 0xff;
> > -	port_index -= (port_index > 0);
> > +	/*
> > +	 * Avoid out-of-bounds values while calculating the port index
> > +	 * from wIndex. The compiler doesn't like pointers to invalid
> > +	 * addresses, even if they are never used.
> 
> The compiler does not care so what does care?  Why is this needed if it
> is never accessed?  This comment is odd to me.

I refer to Alan's comments[1]. So the compiler may report this issue on his
side. On my side, the static analysis tool is Coverity from Synopsys. It's
reporting that port_index may be bigger than HCS_N_PORTS_MAX(15). So
illegal array pointer may be caculated. 

[1] https://lore.kernel.org/r/20211002190217.GA537967@rowland.harvard.edu

> 
> thanks,
> 
> greg k-h
> 
> 
> > +	 */
> > +	port_index = (wIndex - 1) & 0xff;
> > +	if (port_index >= HCS_N_PORTS_MAX)
> > +		port_index = 0;
> >  	status_reg = &ehci->regs->port_status[port_index];
> 
> So this is used?  But what controls wIndex here and how can it be too
> big?

The wIndex stands for port number here. Actually wIndex won't be too big.
However, the static analysis tool just see:

  port_index = wIndex & 0xff;
  port_index -= (port_index > 0);

and it think the value of port_index is now between 0 and 254 (inclusive).

ehci_def.h define port_status as below:

  #define HCS_N_PORTS_MAX         15
  u32     port_status[HCS_N_PORTS_MAX];

So the tool think illegal array pointer may be obtained.

  status_reg = &ehci->regs->port_status[port_index];

Thanks,
Xu Yang

> 
> thanks,
> 
> greg k-h

