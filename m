Return-Path: <linux-usb+bounces-12690-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A6C9429CD
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 10:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DDB6B21F96
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 08:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86921A8C15;
	Wed, 31 Jul 2024 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NSGnTeTG"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2079.outbound.protection.outlook.com [40.107.105.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D6A1A8BF8
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 08:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722416283; cv=fail; b=gB0eND7v/QAO5Qj+h+jH3ZKAgO/iYpXu5bs0ONWIr5vsJ8coduwfmZpQ1nbMXhErCskhV3SduCHpbEZXIe8fbQZZPKOjJpkpO6DuBFYyZ8QwINd47wPmHKexvyyPvwkE9Fkv0JEYJIJbqW7BUeXYErNHXIjVN1MfbsgojwFYUxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722416283; c=relaxed/simple;
	bh=nViZSoexEhrZepPWXv1J45A4la/RGBXD4uFbwjrujhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fjizIzMqPu2lb/eo3WEXj8IKbjgahCi0LHJ6EtRsIigH+VDZmZXvwXCup5EjDnS4UYQQaiZvHWnU2yU+1nzs5lFcBl6kswTpJNWVIc7Ej8+VVKhtTJ0PXn0dnbjvmEpOURT47JbMO88Ym83CHy/gB2TZsfUcKWs3Rd0qY9A5RoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NSGnTeTG; arc=fail smtp.client-ip=40.107.105.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LB1sE45HtB2P9Cn8UxQ5ceFMkFtNzN8HxrU19DGr6paZb+MuCTgkTu4hMSPzi/B2rUR+Br0OgPXyA7kkVVFGVXwqfsYW3tXtv9hjXP+qmpYwHHoTWgzTbvURKVnuSCif+gTpx7QkfhK0Aly37S6YxMYcqOmPrsNz0MGB2O2fyrunr3f1rnrGx+zXldNAmJKGckI0xc/QKvpZMw6Iv8b+UmtC2/fzkDo28V77xOjs5BooKhik3UjmGv2oWGhnXpopaeeMXS8GcEJKw5I6Wi7a4Q4vW7LvnB2KNXP/qoqVXgKJ0GU6YTgWfFQeoxDRwVY++1KlYnP9U6txvVnIarYonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgF0A+vTW8nOSH1nxwfztYsXJ+vhCLWCIUEZVZXmnpM=;
 b=gkODfe7iy/4FqPL1YMrx2aF2z3XtvwjpWU0oDZCf52vn21OixNx//VqpvhhqbPoonWDyot2KIwCkho6iecCcKvok0r8VTe5KuEEeGsAc4s0dAcK4Plh5YDWYKbySeSvdgIS68RQxP9Vs/g5CLJ4mCNGUEpFQhDnCL556Htq5Of6kqyeEL/tO0YqB/uKthUPVodUPXf1KgM7hGj9Bwuu+yRk7oztmg/Sq6/RARTfn29T77ULlpmaIjxaztglwne796TWPitdl9pbVZKg0C4FJn4qOPt+ho/Q07E4QtAWA4e/z4jALd7Gd+fVHMtWO4OU+lk5TUz1psL2vqUJm90ii8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgF0A+vTW8nOSH1nxwfztYsXJ+vhCLWCIUEZVZXmnpM=;
 b=NSGnTeTGEOqbIFaeAPvk+5adyIg/7iHpCzRHNzXjm4YjRGhol8Gteo+YiZ27MG0hXtPHLhpFTcAx6lace5Zhol2ixo/70Rh740e1RRXVRwMOoTHQF2cJ10Iar4rxAEnSHnTgOhH1DeNV1BmjRflpzpZJRG3QjBf0ixbbwSfymcjbumjMUDRGwQWAFadEP0cH3nvxqZiBVTrq34GVp7andx5S29gB1d36iEtliyB4mtHUIDrCcv7e10HqEigDr3CsHjjq5QXF9Sd9rUFaOeVHDJ8pZA65PoxSbCHyv7W/IU3KQKSvOWt6e5EyCFRadW16ukXkNFAVk227AC0qd6KLhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB9723.eurprd04.prod.outlook.com (2603:10a6:10:4ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 08:57:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Wed, 31 Jul 2024
 08:57:57 +0000
Date: Wed, 31 Jul 2024 16:55:24 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, jun.li@nxp.com,
	imx@lists.linux.dev
Subject: Re: [PATCH v2] usb: dwc3: core: remove spin_lock/unlock_* to avoid
 deadlock when suspend gadget
Message-ID: <20240731085524.kdxub25lv2yvnqn5@hippo>
References: <20240527170413.1107831-1-xu.yang_2@nxp.com>
 <2024073141-demeanor-amniotic-8f01@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024073141-demeanor-amniotic-8f01@gregkh>
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: 248b288e-ef68-45c0-9155-08dcb13edf5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eSgYpSMmCUslk95E3MBZfCKNbtzfPb4wD+iIqGglRR0mlQXHIF9Ne0u+lS2D?=
 =?us-ascii?Q?XRIHIJKem+RK3pPcAWPBgHxoar5lMYBhG70XITdXH8xVGNFAPTAy7Etec6Hx?=
 =?us-ascii?Q?0EabgqVTJoqNFuPTqLSVq/9FMC0uqBMQAgs7js1mNxuXMD4NriN0/P+wa/F8?=
 =?us-ascii?Q?N4GbNDG1zt+lip+TdrSUGnYc1BhzQ7Bp1s/6ykMYbofSVkdFmYhd1sx8pW+c?=
 =?us-ascii?Q?bieUb9tzYYpCw6q65DPLuQnss7lPYPyzqOMQ8/Q8CFgBpCRTazLv/T/vqB1l?=
 =?us-ascii?Q?jj0/nAvL8OYjNoA/5YDnsWErbX4dKbvW6MTLMeOMs1saGbtky6sJUMJo2/Df?=
 =?us-ascii?Q?61wgZdmj7jr7jSE1FqOX93h/fMkl5fkp5Pt9RocBlwQChOg9P6I5G7PutsET?=
 =?us-ascii?Q?rMB9xSKfjjAjJoUF30q86h65mUTviJeIkqHU+fAUTFHlOGN/qeY4fmYT4psw?=
 =?us-ascii?Q?XJotoxcIGeYTQinGypdYd7QB1pGaIlgfhOcEDvhRuY6l/Mjr3JdzCfOpYLd9?=
 =?us-ascii?Q?zLVy0wr4H76kz+MrBCDLYopuKpEifcFaKr/3iBk+oV750h+vyBLtql2hWdDL?=
 =?us-ascii?Q?/xBi/dm1JQYsO9rgfRj/zJfArlFzx6By0yZP9OhOhsnTOd29qoXvzx2e1RaV?=
 =?us-ascii?Q?Cv1T3xk1ebwAR18cCjrs85VGlTj2O+94UEVLu1xbNmG6PqGNmHUvJemp5vEh?=
 =?us-ascii?Q?jpoekaaM6A0Tqs2InnY/p73eRDzyoRoYij7Ylq3DxyE6AC1FXtvhh9iNZkh4?=
 =?us-ascii?Q?iJUZBpKNvi3/KIcfk33nkjlirGyexNSDwUVhrzixRvxLfhcpmlYDULSKQ0dW?=
 =?us-ascii?Q?C9K0gcOngN2RWQM7QnWDoTPDPqmhL9gS3cH46SSVw48YkepJt1K+h2UDwLU5?=
 =?us-ascii?Q?7Nj6dhIymL9PtRIxW/OPGJICOwmoPJewDPgj3e+pjwweA2hfecTROHMTkGGB?=
 =?us-ascii?Q?KMr+Dig71U3kECOnTU6pVYbZo+7XlzobDSjj1wIg3EgLKqJlXDBEvPp+jZxH?=
 =?us-ascii?Q?hI5InM7oVBb5N8zliPorhOttv4SDKghI4ItOWrrbGoQbB2A+YJLOj2Uh2VRF?=
 =?us-ascii?Q?xJy2cr6DipyqI2AvXMxb6h98nABR/sJbu00kv1V1fMZ/Nm1eCOGW6hILNXcT?=
 =?us-ascii?Q?/CTwzCNepn7WsYw+37UWVROXv8vKSn3c+/8GMcAejy7+PNAchRuxtIkM0CtH?=
 =?us-ascii?Q?WfDZct1VJFD5fI3z3nYYmEThxvueHpCwNuXzxVjXbf766PrmzrVrNZ6Q3C/C?=
 =?us-ascii?Q?vOnkIkxCvnNwM+9guEMd7zG19hmPqJvUrma2LxtbUnx0KYzNVwHLt4t3g1PJ?=
 =?us-ascii?Q?Cr9IitD8+jVnTAkzM4eDSR4xMjbqL44rhdAUp1WGXIcgGTJTTmXkHK6DOEMD?=
 =?us-ascii?Q?Qu362Mw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nwt++F1hYTGgr5bw3Zt5T5BFAfyv1WM/6Ps5bGummK2h1AQ71kPCUNCKgKnc?=
 =?us-ascii?Q?FjruSTmENpAwNETiK+Bto+VgILOYqEIgtFpkes62FK2Y8dSL9nCb3AzeUeCD?=
 =?us-ascii?Q?DJ1ujefrWfYHXSyRS18EVqu5C6hFLtH9WwcrTZ/EtsEIcAfVxbad1CKqWy7B?=
 =?us-ascii?Q?3wp84XVzmo7hq7jA02JGKTUepC8BLZMlXGI0o/3tZFIomEUB1s86MHY3Avdr?=
 =?us-ascii?Q?wbzWgq1zi6YG8USqBuYjPzEBSUh8HoXGFT2GsL5eeI7YV170VN37u99lDRZ6?=
 =?us-ascii?Q?P5VWekMqWfeh35lRYJ4LhOmVg4zMSdiW8vXo5luZ32uIB52yQan3hjNzcHGW?=
 =?us-ascii?Q?GbMM5n4VSiuvbjU7dZnBP29d18+I2/YLqRyO2MJL2fsWK1QTY57Ym2O1L6Hz?=
 =?us-ascii?Q?dKFeltlfpyZ1/gEhzPm7CygOPkqXQJaf/Gw7hnnfPmdmuoC2VmeRXUMhA44X?=
 =?us-ascii?Q?Sg+cMflAOI+c1DmKH5Yfu1euRFtP+pCEU0Haaph6eJnKe5USrnSO4dRpQV5o?=
 =?us-ascii?Q?Ah81niUUvMcVp/RxotsWJCKB44cPgHDzyNVV2uptMhqInRQ01aX6kj9kZHL4?=
 =?us-ascii?Q?zYFH8oKdDLhP9RAhkTN97uwmT7bAyaH6MuHZiGB9OYwz/Q8F/v+DXwfBIMo4?=
 =?us-ascii?Q?AzcCWavfWRvPudi3T07Qv0Kb9bcJ4eqUSdzqXylTKhQawIOUT75JtZGXlUFg?=
 =?us-ascii?Q?sgYjEt5gl8uHy2gDizDeElmPOyp/IFRTpx43CFjpSXFlHc561pB9AXYDPTuu?=
 =?us-ascii?Q?hS7U8IUNrcxtnsKIWLUoJdRHmcGxbH9UZm0yJioHko12zB8qxSue7m7ltBVM?=
 =?us-ascii?Q?ABpGdlGwDyCuNzRhe5SkxyKi6hYC16F0KE1JmD3CCKN7sE7+RBSqB5N1bH1T?=
 =?us-ascii?Q?Rj8E2MhUOfBB7FBsCj1rfGJZv5DAiSdJcinDynu2sD+O9TSwJbTu63y16XN0?=
 =?us-ascii?Q?HSukfzsnFWgQT8UuX1jtpDlo3xdfZSryX9wHsDMcxTW3EX/P/fyBp52D7bub?=
 =?us-ascii?Q?WMo1LJgmYBzEqVt0VABgie8iftb6FY4uWwdntp5nwqljKikRQg+Atj5so0RV?=
 =?us-ascii?Q?eGsJoZVNnznZrvW0sGBD57OUSEY2iG+TDVujjCE+cqVoC6dw7EcqJeKHFung?=
 =?us-ascii?Q?71bz9ND4z2HHPWNbsKpatxx1eXlro5kcLr4r+LwAsupGFWqtfqhrVTOMMW7a?=
 =?us-ascii?Q?LWSuDUHZHVsaP6q9eUhETa2m0Qz9iYWdRm2X63g4lsc6bDQrPUkLDnHKxc8U?=
 =?us-ascii?Q?hKNgCI1RuwLeX2FdBTJqCxO5ANRC0yvc67K4bmApyxNj3G8jJRkruowHye+B?=
 =?us-ascii?Q?ZR0ObMyDd/bGK2AS18t3xNopZu6jxENi0zxLg98cUSw90pcfa2f5kXZSOtTR?=
 =?us-ascii?Q?T+au0PHJMw8PG5MdwoRaWyw7agr0J3bWJS+8GKbUaPfehjrslkw4qz0g0dqk?=
 =?us-ascii?Q?2U2al+/njYfGSo/sd0p5LpPvAJDOpiPgSmjAqRe1akZ/CKd19O1GAtkc1itv?=
 =?us-ascii?Q?pKMjC4ICi9zMWwx88rb6FOleTBPknnz1hmTk18tTbIPB/lSj90Y/ii9nchA4?=
 =?us-ascii?Q?pnNz6dDP6ZIF8gtRBAsSHB0CR9hNVMSXdd/wLOqt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248b288e-ef68-45c0-9155-08dcb13edf5d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 08:57:57.8368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6D0DNi54sYAwkpQcfjPUzHrRYg2MI8ujtJJjDArMzw/azZacJfN12l5qpGPL9LNBqRkKprTo6T49+Hh/VPqow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9723

On Wed, Jul 31, 2024 at 10:30:54AM +0200, Greg KH wrote:
> On Tue, May 28, 2024 at 01:04:13AM +0800, Xu Yang wrote:
> > In current design, spin_lock_irqsave() will run twice when suspend gadget
> > device if the controller is using OTG block:
> > 
> > dwc3_suspend_common()
> >   spin_lock_irqsave(&dwc->lock, flags);      <-- 1st
> >   dwc3_gadget_suspend(dwc);
> >     dwc3_gadget_soft_disconnect(dwc);
> >       spin_lock_irqsave(&dwc->lock, flags);  <-- 2nd
> > 
> > This will cause deadlock on the suspend path. To let it work, just remove
> > spin_lock/unlock_* in dwc3_suspend_common() since they are redundant.
> > 
> > Fixes: 5265397f9442 ("usb: dwc3: Remove DWC3 locking during gadget suspend/resume")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - add fix tag and stable list
> > ---
> >  drivers/usb/dwc3/core.c | 3 ---
> >  1 file changed, 3 deletions(-)
> 
> Is this still needed?  if so, can you rebase and resubmit?

It's not needed now. 
Meng Li sent a better one and it's already accepted.
https://lore.kernel.org/r/20240618031918.2585799-1-Meng.Li@windriver.com

Thanks,
Xu Yang

> 
> thanks,
> 
> greg k-h

