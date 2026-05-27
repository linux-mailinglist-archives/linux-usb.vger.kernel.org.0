Return-Path: <linux-usb+bounces-38078-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAjjJmqQFmrqnQcAu9opvQ
	(envelope-from <linux-usb+bounces-38078-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 08:34:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4B5DFE46
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 08:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7AF983006099
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 06:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0056F390229;
	Wed, 27 May 2026 06:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Kz1Yr+1Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013024.outbound.protection.outlook.com [52.101.72.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369A638F93B;
	Wed, 27 May 2026 06:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779863652; cv=fail; b=VDfPda8ZEfqxF3+KxmMpr/4MlMwgp1A/9Oo2V+P6XSAu6KmbXDKmA7MFUA/TV9oR/8CN/Gcj8JIrGH+48RNKYNHNlz0c1jn2ZFEvU5gufTV1wZz8MNDhghsm6G5CAT0LObxsABfvT+uGQBd7dabkc4Ua7XXqGsOvbrZvNywMPyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779863652; c=relaxed/simple;
	bh=TEggMsIFvjWwZHbzWiQSpkmswz0eGYDyQIwcA02civI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PYaDA+7aTrCvO/MxxTGaflVH+5u6CrH733cZ6SpvCri9W4VDmoVZV4fpfz7lS8bcO7pSJNdYKway9cjcuTzaRhxW9bTkRn97m2K2r5yWzedsOPGIcLZSP51SO1Sp1pTTOSYroV9b0FeGappdujn0MFQVtrrI3UR+8fzfkZ22PRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Kz1Yr+1Y; arc=fail smtp.client-ip=52.101.72.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsQkHUJx1PrqhOUijkjwsLn6iT0eBgWRh9o0iSaQuLP6KKk4YpoOnHOCUGyXFR86Vx1SdA13/T3TKL8TigvyvmYdikSMbRTxDTjL3w6HzomqDEZS5/5YY2Q+u/FE0RDmiVbQ/TUTrOZtjlOn/SXLqVdmCpn/0q4GUFuRIUi0gtl5t0jF9ZMllbx4ntxy5iielhB/u8eWBeexA/v2RM1Rrqh6td84o2Z8k5nbMjjEqB9tPzYj4pMq8KY3Dg8HI8bEz8QWExm1AW0QYzBCPoPSMkHsODIAg2T7MvYWNtVc+T3yK/traFm19ksfz9CsrVMqjhoVVzLcXCODYb/Dfj3dGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mcKQrxcFfi15uuUNbZ/u4DCMN1Yr7VUlXj81ENyrxo=;
 b=LSWJf2AeuL9oHurnfz+QLpmIXOHpw9YPip6KI0bFjq95Q/l3qrDn7cSbNjvRskDzunqB7ZX6xDJc1bVek3JEHOgSPaxIYDLidUOBH9XCYZMap4hPxQdR4iDCbi5eX47vQpmPvwQvnYuQCQEOiSWpa2PBA6XUJ5lyLNAMjbv2I31uwjQgIhjbL4F4CHHfcPppnKfibEp7+HbIlhGUjENWHzuLfgqq6SPGLc9ZnaLDgDo7ArDo1ywtYSn0lz516xB2BqhO9AgY3MvTkzdE7sBH6sve9g2DuBkjZZ/os5vxpVkknKBMSp2AvxmAmMQ7FohyV2TUZ5tUkU7mFriZ0VWn4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mcKQrxcFfi15uuUNbZ/u4DCMN1Yr7VUlXj81ENyrxo=;
 b=Kz1Yr+1YlCpaIfedyR8EklEj/NsJBXpLna9ZNJ9uDD+4sUDL/4uEHPlibe1a+FbFCprdYJ4nS1l6x8XbPU6REJYflvpKAbW4R0W6uwxYtYEHkoMuf9OwJLyosdo7VaYweBf3XPoVAvcqYhxGyAD7AYwborbBQ7ILyqciZXUYeZFJr843KRrnRafFk9I+SSWzvO4KfOn9d43p7lwVVpm19DQ70X+ydZd+DgR4jd4WT49vXNAgODaWaTgajk2iD/peihp1BOZang/Lbe9tUWly4wheex7ZdXrWqrvYwh93/98yC331ihLohT9t4NyySexi9VuDPTrNT9panNW5s8S/rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI2PR04MB11076.eurprd04.prod.outlook.com (2603:10a6:800:279::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 06:34:07 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9891.019; Wed, 27 May 2026
 06:34:07 +0000
Date: Wed, 27 May 2026 14:33:05 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Franz Schnyder <fra.schnyder@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com, 
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <25fqcu6itk47tvm4qto7zw2r4cno7kryxi7a6lo6ddbxwzbakx@nj3ytoy44ynl>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
 <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
 <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
 <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
 <5zz6yhc4ymoccovibmjlse2l2d6y3g3dwu5r5a677rplpfdnwu@fo2ed54hqzeh>
 <6btg6x2bsgu6jzzxds3koyha3ucaf37apbshhfgpu2vxdgb5oz@npvm7tkg3bxh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6btg6x2bsgu6jzzxds3koyha3ucaf37apbshhfgpu2vxdgb5oz@npvm7tkg3bxh>
X-ClientProxiedBy: AS4P192CA0015.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI2PR04MB11076:EE_
X-MS-Office365-Filtering-Correlation-Id: 7822d383-69ca-48a1-244c-08debbb9f429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|52116014|38350700014|56012099006|18002099003|22082099003|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	LtLI1H+kDBUSAcsPbhEO66ZJb+dE/ezh2JT1VQEyyq5S3yjos8NzbeSqvKgBPtl5MFnGtPg0XGMUR0HH0envPUSqrb90+YdCekkDS9xbLZs/QtMmmx7En7v+BePIOAEu6fyMK8bw1fNyg/QTj+7Z3vKAREvGZ+dn9/LLIUM/SDEeOhA/hUlemez/yb7Zxm05hhTk6A3rCpWcJse/Y7ZYGnw3lZ9JK7AL/oY3yU9oCfCx/xzlXn4iP3TnjGt9MR+6k0DiHZIfHNDIPFb2b02E0Owg0KhhX1g8eJ0uXGZKBkNwD3r5GWmtliJDx4yV5acDlqZWWXpUepRT8u5yt2MzdQpjwQ94NsYXAo1GGKy29/oH7NbIkFTQ/EhVAejWMNZNrwxJAdJNNL8yJP7zL8XhqI0P5W29+MbgcAEUFIFMOMxqoeGDqqGD9u1JNyZWmko2+eijDORLOI0jW04b3ERkMqpqqz2Igs5J0Gy9YHUJ37WyYphuFWII+DElEUdLUUq73H3VNyBh5D7pSy6exoQo+LR8I72S078062CMethgiPIcyFwX6I5GDenUVzOhWfd4sW2tJohgREeQwkmXK6xWlvCvUyV+dheqrJ+HJSKZxfWb0HZarupY+eN9RmPJ0KkbcfEocSbVGp/FyvCwMM4/E4WDhTRsX6GbzrhjAg0s5G9eArgWpH+4zxLO8gOYWCP4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(52116014)(38350700014)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3r6PEVxWuFIgkZG1RJmOb4HrcwWqmcR4P55BByekOyEzK+C36mx3/cnCYUcY?=
 =?us-ascii?Q?SNR1flQ2eIn9rVW77e/sk0k4fdeJXud3Dquv5GixwJTgixvkF+Pp6F1cRh03?=
 =?us-ascii?Q?51g1r6mrK8IeuyiLvCCcNXXZsUPuH8xPDAldAN7xJ7vvCwSbV4lHDmE8ICkO?=
 =?us-ascii?Q?wOxHur7YVQQjO3kGuYxpKIWOA/S3EFJrTJUdSS5YHN51oTnBmZBFBEhSQmvp?=
 =?us-ascii?Q?gk8GO6do5grHOnfFsmLEEtZMMY0j777X4f889PBQGwYC4eDG/lgBH7wySzOH?=
 =?us-ascii?Q?Fti+gJUtz4L6kChnJzOJLxrKso5xKkDUX94iRMsQUcJKM8+M9Vkd6L1avjID?=
 =?us-ascii?Q?6wK4CTtr+hbudDe2q4PMFF6l13XBTMyaIfoiIQfF8sKI3nxLr87CwTQ5Fp9w?=
 =?us-ascii?Q?NldHpWSvLxs2Wd2AnAoiJppHw8NnOIW69nPMLprew/s6e/Jf6nIKq6XPazBy?=
 =?us-ascii?Q?xj7uTxO8ds5f6XnyJbhQMY8CaCUgyCdjBXMTGTauhW1+zCGjUYTdUv1VSLAn?=
 =?us-ascii?Q?GGLSyVBuAhTTOJxCN7DzNd7EEnJuRyysWNKtwPkK5cwotXROBdzbraDxSe4I?=
 =?us-ascii?Q?twO9WbtaB4YFXlVTZsO5wwj2jlPqJzq533+8bjeerQJYZtiYw9tdLjuUyMDh?=
 =?us-ascii?Q?WE8E1O6lfUO/jZwI4k2/B6wtMumQiQrVtg1Fx89DdEjms4QMjtXrSrC/tAu6?=
 =?us-ascii?Q?YRbYXFpb+HGwX99zdk+Wn6vZFnDWkhvm5pAw8KS4+rqQ3eIeJBRQsXeisAmT?=
 =?us-ascii?Q?48xUIBXe1aE7G8DOvsjCM97q8lHH10Qu3Ze+wN7U3J0MzMgYcFD6p8iWE72T?=
 =?us-ascii?Q?o1kRwwqxvHsfpgQk/gMr7oGEOkE/qCwodZnCHIdZaGmxorSoAWNcSUK6KYS0?=
 =?us-ascii?Q?Wq5Nwzp1SKr+fDMePLK7aL1t+LotcKnZCM/gHMWweCtVrcrFi+MI6T+MMY9K?=
 =?us-ascii?Q?7jBf5u9WYHh6ah5ZIO2gdMqen3A3FDYCRgR8uN0lGW6l5IcDUlHWS997HNXg?=
 =?us-ascii?Q?S0SXzB4e32fvdisl/VuKLs53A6zG7VjhHPLPhDauAZpwVkg2tTM/0s+qbWTy?=
 =?us-ascii?Q?FUsZz3aBfNiKKsApk2W86Ukuc1HLVjCIqWmi3hICFRLNySiICFeC/SSeF3xv?=
 =?us-ascii?Q?VL6mVtYu6AC5+D6/g9vzkCisQUhWU8J46VDRbAzcfIirmtSiA18ckky62SgQ?=
 =?us-ascii?Q?OFJYD5Qjzg6vgKYK3AG/UvH4CQXkxsl9/qqlq0IVy8WWD6WkSWbTWhYiJPad?=
 =?us-ascii?Q?xglSzJAupfrb0VGHX3wnFmBGicQ4u4vlEnycutDVNWTgG8GU7EPbS4gscgMv?=
 =?us-ascii?Q?CSoTWmIdvd8sYnJgu0uzvCKKZ9VznuGb9AtQfKvN9FWu+rbTfml6pd9kyqZ6?=
 =?us-ascii?Q?pphIy9/VqLAgMi+76J96r4x/aPHV9jp7Q+sCVWjAvJmEXyEAdGS/irVcvkGS?=
 =?us-ascii?Q?nkAYWFhTZWRU07hQ6ge/9SJjJcV11OTUHAryn2sQW3VSqSmJYFCXMc6Drcdx?=
 =?us-ascii?Q?yp6XVnd+PQqGmITnWPJvuT+vcBRK2WHYc6nDpqVErVN8fHbhmDKqUrQDoNGH?=
 =?us-ascii?Q?DsxToesNO8CMn7HQXH+AG/99utzO+yNGAC54i5j7KXyBIB++7egWu/FzhHJ9?=
 =?us-ascii?Q?14EdHSab95l0M3IjWngJpc7KNVOg4ZnFHLE4EM8uRACzZb9pFTSHUmcv3Tr+?=
 =?us-ascii?Q?xXKypAzISvQ2uRGNRVoTNb6r98rp/iUvVPnlwH4gMCbk9FhCnXAoATC9Lr7Q?=
 =?us-ascii?Q?6kFYDMQQeA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7822d383-69ca-48a1-244c-08debbb9f429
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 06:34:07.4926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45XgOLsfKthuOiJ0ngSbcLcN6V05QcDJRCLwT1kEpse5hABcUwwxjDI1FGKBi73RLcqr9mFYsp3mEXlzaZTskg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11076
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38078-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[synopsys.com,linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,dolcini.it];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim]
X-Rspamd-Queue-Id: 90F4B5DFE46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 10:54:58AM +0200, Franz Schnyder wrote:
> Hi Xu
> 
> On Tue, May 12, 2026 at 05:53:57PM +0800, Xu Yang wrote:
> > 
> > OK. I mean, does dwc3_imx8mp_probe() still succeed after the kernel dumps
> > at the end?
> Ah yes, afterwards it still succeeds.
> 
> > 
> > OK. More debug information will be helpful.
> > 
> 
> I've attached the logs below with and without the commit. looking at 
> what happens before the warning I think the problem is that after probe
> deferral the depopulate path races with the device link state changes 
> from the fw_devlink cycle fixup.
> 
> One important thing to mention is, that we build dwc3 and typec as modules.
> If I build them as built-in I can't reproduce the kernel warning so far. 

Thank your for the information.

It's indeed an important finding. I can reproduce the issue when I build the
driver as modules.

But I guess it's a case that the driver core doesn't handle well. I will
seek help from the driver-core community to see how to improve it.

https://lore.kernel.org/driver-core/DU2PR04MB8822AF9D63FDC335D80DABC08C082@DU2PR04MB8822.eurprd04.prod.outlook.com/T/#u

Thanks,
Xu Yang

