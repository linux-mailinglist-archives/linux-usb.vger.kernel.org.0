Return-Path: <linux-usb+bounces-25351-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 188DAAEF4E8
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 12:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC19817921E
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 10:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335B826E6F1;
	Tue,  1 Jul 2025 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gpEIaeII"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E2426CE10
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365276; cv=fail; b=DIpci4DIUkNlohR10Pnbnrcos1gO6Hpynlp2oLii+mnY64gQeRo2YN5tcg/kgbSYeX0+NySCnjDE1eVskf04DUXXD2MMtPZIb/l2GIfcIN5VGV9078e6z+pBuBlQEgELyBKmnQZSnU1lEEL6HmHcEC8KGMHLZff0aRvoMsUEkJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365276; c=relaxed/simple;
	bh=QcUmFoBQrdGiV5wCxLM+JV/5MCZRKOQKPdIBzDViOlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IS8/Jj1a5Xyz3nNiY2J6miGG5rAkVdOmnZuLaFb0uVSbyarH+NB/V1IpCjvdRD164rYuh4K4p402q8/FJv/YQ95fhSTOhxDqkyCxzVqUhc0HAy+UDdpntYT+/fKPxa90XVG48WJLZ/gOR2wVJENbGdWiHOGlKC0urjenPVo3T3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gpEIaeII; arc=fail smtp.client-ip=52.101.84.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYXLWPSU68LKGMuFUvZgyDB6zHK+349zLRvyA4ydVwFds//vZEdl9SGGt+VdRCD2OKQ1zO+5Q5HE30A9GEAvQaqnQ7ZygE4fRSm5GPHL+jY4ka6wtwhWHFdfOo/KtKv5zP2UvxXqlVv6JKrltYWdFDsBZFtfvAMMhmPOYcczdvCEXsH1aA+hQQFqsVYm+0O7FrmYdkSa9BvT5VxXQvdUjewksRIZpxahZ65pLrb2DWUjFYnlz+ucSOa9Z3BOld24HPTzDmyIdkLbdyXYnLvGkTgNfDjCyyb3BXGA3ZtPlRIx10rR0GK3p/mpDywdqi5C4Aa8p1FhUa81fi+au5eVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtGU2gixDByWglZsy5dn7ARCJsmzAJptUgtBEEu6vO8=;
 b=jgRD0X0ZRS4JdI4orPaIFBLJo1GetphMGDnV1e6VCTXjvOs1GdBWJEKwTnuWrIZMh0X5wK3LUVbXpRoYNfER2L0sXYbnj44zlHvBTztoSoXFoLwyMPnaemjPQNZXlYSI1dcKTQR5J1qdclcdlparKoB7bG6li/p8+52GhrnpTmSmU1dBMmv87SWRW6n1xNOJKphOM5x2/PGiiYcHTwvT6zUJsS9aFCARe1dukq2Su2v3t//SvET8lj0hQu01OXGMc3nHQyrc8taYkiPN/9f2hc6VTqo0KGBHmjsMTUvSC2+aJ5Go0iP/hlgvFkC12C36djjETjtLETcHMTPM/E3Z5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtGU2gixDByWglZsy5dn7ARCJsmzAJptUgtBEEu6vO8=;
 b=gpEIaeII3ukqh/yLU0vHuB8+jpAJ+t7HWiQsrE5I5PBo8fZhjPaUE6O4sdg3Zgl87qOJFXjSdYJ+cFQmQMcXP6wbPD9G9+iVFbN1Z+Mcnetu7G6KD2reHFfsEBmoxj7owle29njKIALbteqBYz6CgmYV0Rnh9utm67C+s1Wkc2cvqqR8W17Gz4R9PkB1QV7a/Qgn5gakSwZ9DkVeZP1hK+vF8VFkxOtuT4Kbz5DITP/NNdYlJUCNNcJWyG9yARkscnetI/ZZ0F9D2A2jlg4/A72mJLmQmT2RGOFQOxPTgg2Nw9OK5DiT8RenDQV7Qh8DYdp7FrBZNUdYrffVwVPWrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB8931.eurprd04.prod.outlook.com (2603:10a6:20b:42e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Tue, 1 Jul
 2025 10:21:11 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 10:21:11 +0000
Date: Tue, 1 Jul 2025 18:16:23 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: mon_text: find valid buffer offset for iso transfer
Message-ID: <fornnnolaxn5zbw2dnepq2higyf5vw4dkdn4uptgz6tuki4zoe@wnclvwajtila>
References: <20250627105651.3653231-1-xu.yang_2@nxp.com>
 <8a251c8b-5ec6-4238-bdcd-8d8001fd06df@rowland.harvard.edu>
 <zbxioq4jk2ykd3alu5j6igmgzmsuainlwelhvl5lhz3iczcqyv@uspbdfpyj36j>
 <57695560-d6ef-49bc-976e-836ddc903d13@rowland.harvard.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57695560-d6ef-49bc-976e-836ddc903d13@rowland.harvard.edu>
X-ClientProxiedBy: FR4P281CA0374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB8931:EE_
X-MS-Office365-Filtering-Correlation-Id: 9438e1ac-bc41-4f58-454c-08ddb889006d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|19092799006|38350700014|27256017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wP4/vUvTX5+ULFFilH7wwrfsiwD2wG8dwUkwj0f6LyVtqf0Nbc/bsvEc5sSN?=
 =?us-ascii?Q?UrEwM3BXEAD017n3+hxytsIUJda+9oZhBOr8u00MR26y5iv3MnkjksjLGmJl?=
 =?us-ascii?Q?dfWE5xpSSs/e4fuXQ+vNaNZ0xKbrhtImy1x75JuLodSVLrLaMeoMeV39Dv8J?=
 =?us-ascii?Q?FGydiGNNyMKmsxpiVSQ61P7O2G6sfIvWaYnnVO+0o8O3RylE7EY1seArwXa+?=
 =?us-ascii?Q?P6Ahh9CW4IK/VX9WjzSJdsX2gJI2lChHEWZMNU74e0soDWHYeFLrjEDFBLdf?=
 =?us-ascii?Q?fTpMSRHAJD1EmuV32HG2z/DysV0SNfbRET13Kc94DOD7HTqk0jVOpXc0uHRB?=
 =?us-ascii?Q?k5asi7j15JIP32pWCEZSKwYJFNuwG+P/YAPq2/SIZlBe80SxiBtWcEpvrRE/?=
 =?us-ascii?Q?FXe83RhLGCDuRTGYW7H7ZrSfayrC2vGt3pReuiZcKooz+09kBxADjYmPA6OV?=
 =?us-ascii?Q?QA6Fvj0mStGDO8R8wspFLim3dyz0Dl/vnlhr4GCK17lzvuX4xuWm58h1/LD7?=
 =?us-ascii?Q?NcTAkp6rlmVBCiWtKKFc6JbwB+0JJ49dZQnUw9jRQLSG4Xv9XFM015vDLfsD?=
 =?us-ascii?Q?AcrGFaTTbd+tWx+N25doKZwk7BhViXK0UD68U0B8bKZw8fqzYVxY34EOdevH?=
 =?us-ascii?Q?CAW5oFYoSBxcQk8B5m3+/4osWRSCyBcZqbj1Bv1V/ohcE56gxDD8JSKFFqzi?=
 =?us-ascii?Q?iGbWo8LFOgdeV6cstcAla0VrFsGRMWGoAP8yZYnZ+Yxb7zpa5G0Mkp3UYnTi?=
 =?us-ascii?Q?nZfKQJj7i0D+pp2Sn1yx9udFpBtlkvIkmyCuyFkE/NCwnf5nxmJoytLt0YqV?=
 =?us-ascii?Q?y4dtitBIfiIXKmRioUSkBZpH3NFtYX2n3Nez79PQpQ0mUZXzSon1ZszC2ik+?=
 =?us-ascii?Q?/VRWTiS2tXWZ765hDzZDgaE6SihQk/AoCKtJr4yWJv/Se7Fk1/xxfzCrHAoR?=
 =?us-ascii?Q?0G8cHMtkcHUiHkDxtOGOQB8dCbQtbqn/AcWu4j/M/Chd/+2nxmub7WDDg7Md?=
 =?us-ascii?Q?Cu2RUD4YJLt1YNyS3YenwYn4sz2QUQnzv4JB5RfjP1aO1kzfJYmCsVxRg4Ym?=
 =?us-ascii?Q?OCeciugYs8C+5Kmz5AkGx25sbJm+Y/YXeMIKcv2cbScmLm6AP+JwaoVilIpN?=
 =?us-ascii?Q?1qx5sFaHIXDvAwVY9z5GLeDZJdRd+l2Bk/YZDFdrI28p6U/38Jk6n2Fe00U2?=
 =?us-ascii?Q?s8dXSRdsQZiRoQTLSo6vao2rhpGpN1tLzLYrc5KcDlNqY2n8QI+gvr9r/hfY?=
 =?us-ascii?Q?kmeEx1s4RsDDqMITbBEoVLxBGqwhaNAP2tfLf8OS5ywFgLyRYC6GNxDhi0J7?=
 =?us-ascii?Q?t0t8X1oXh9qRBZxRBWhwWfxfLbo2GnA7s8cVyauY8JQ8gCaETjAT4L8gTIaR?=
 =?us-ascii?Q?BnETB7ba6zqNs9Bg+YnRdaz4TTxXP6nU+Rp9Wr2SRkoGMvV/+Q56/nskKc4D?=
 =?us-ascii?Q?ilfIQrnHy60JGvhDXVSZTI+FHUkkrmb7+zwQzZH8YUOcYhsGlz/O5307mW3I?=
 =?us-ascii?Q?Vmvv+3o1ZNcuZrw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(19092799006)(38350700014)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VyoFVoVP7EB9/9Mr9YztQZ+sA+ga1XNn6DGTSJU+klSLEusEYiyLbTC60chs?=
 =?us-ascii?Q?ZRTAZOXKLB3dQfZvY3xuNSZ+EfWiVhWKgiTUwZMkYzjsKRy+VIYwCTwEmrn+?=
 =?us-ascii?Q?KI/jnc3ApSslx6U5aC5j7XF+eWqY7wmMKuuSF/no/uBFHsAPDP8YRzjygVld?=
 =?us-ascii?Q?TSX/E2TTE0CXjlDeiAdOMq/XEf1bI+GN/i8DIbbAVsP+x1GkfAw+BQkA8/n+?=
 =?us-ascii?Q?E4k2ZmqDcv6WN+rZohPyeK+xveyWJjh4GfMELD816xcvXvPTm0rUA+8yYBPr?=
 =?us-ascii?Q?wWutUI41VJL6j7T+lxiODJIa0b5SiN7qzIcjtuUQxgunZl4vvEM5TkDlbh6Y?=
 =?us-ascii?Q?K0veSieU/YBSfZFUwtr9dmxuUOjyRCBG/37c6FwqAoluDqYeK05Qqphj4rqZ?=
 =?us-ascii?Q?l5LkhFLqyoQy4iBf+AoAaN7es/pr+vFpw4F5nH9XM5/N06+HjGmT3YiLxyIU?=
 =?us-ascii?Q?HmJNazyXaUOEvDPSa3fYH675x3ArKHb4Lsq+WdMeM3Kmy6EsIG0fyQ8UB7Qr?=
 =?us-ascii?Q?qnyZENSMAqH2+/+hB6w2mNhx1jf6GNTDO2hKPWO1H1aAlDzMLyxZiP3gfIBE?=
 =?us-ascii?Q?m0b2NcXnvLbuaeLvHWXBVtBnpmJfDCGDxYk8QudwW2mbe8IgLZ3HmsyZ5KQD?=
 =?us-ascii?Q?3vTYIM8uq3nVBNj8j7ltGoPUfXwUcg1b26ZDn1wGTDq/Zim9nMLRGjcf7CyJ?=
 =?us-ascii?Q?0K17fCp9HYOH78KMgTLCHp/vWqzeiT+/PF+jFusmGvikZWhEljz5z3UE04Qq?=
 =?us-ascii?Q?vW4RpgFF+w35aSZ41wHZ9NdFqHjeLr7YNgxQVugRx/tcGTgY2Pw5efqZ6yMV?=
 =?us-ascii?Q?4Hyyebyyh1efASwIu0qvMHa5DKFmJ3VGENfGX4GDb3HPUiZrF97MARrryG6u?=
 =?us-ascii?Q?9btRDqX0CkQlZXq+DFhwz5dKRsoBhjKmidZP8iEF0o/goHQ9akUMT5xGtGdy?=
 =?us-ascii?Q?7I/0oM3taVOv5fviPPfNeLDQxIMqguDvfLQ/ZHJIl7AG5FL5Pkxliq9Tks0Y?=
 =?us-ascii?Q?tsZv4KvNq5jwBdwWHzHR91pJBIFHj/DwmUh+zG/cZid9IeJMZsEq5G9xy/b+?=
 =?us-ascii?Q?aUMSIimDiCY5QwSmrUXlwctjEfOmBAkFCTZ2T6Z4voW/J9F0IqJSK3WqukRK?=
 =?us-ascii?Q?Bg4vz7mrRYOqOlBJBtXYB5D+bFyIXqhFi4xc97cT37l35DnW3sgmUE4e9/lD?=
 =?us-ascii?Q?Qi2XE3SYjObehwE6dZv+HU/818yV5Vua0fAgxYYuE+aFGz/wNWvb9d9Z4k2C?=
 =?us-ascii?Q?M9jHmYVvjxQnTCWZ6UkvD2xkzxc3LhPJJz6fyZX4BtIUxOAirMnmaVzBXaBx?=
 =?us-ascii?Q?AT19W6cS+Z1iL/JMzwrVSNFHdoc4QPHYD0N+NqLp+YRgLSf0runBB4v0h6h7?=
 =?us-ascii?Q?kzYH238VBPnRfMcdEo7tAWklMEIqvUaWZGVIvbRM8vUjqi4FT3Ef6Yh13F0y?=
 =?us-ascii?Q?BGdPh5/uiOsBJPyeSGPw7M/k393RGYS6Y3hPyjF559+gOTYH/EdOTkF1DAOV?=
 =?us-ascii?Q?svWWy450hB0vC0SxndKpYXAjy09hBCYVGrl4IbyOH122cXvjHeWLTkkqtAp+?=
 =?us-ascii?Q?NNoE+43ze6N1zzonBedbmummvNnq85j5Y4jduuAX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9438e1ac-bc41-4f58-454c-08ddb889006d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 10:21:11.5923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cp/y3/y7042PXaM4g46uOj8mHgIwxFTnU6UgOSNFasA6uGMZHyNXvQ3NKKskmDHHSeqoCCuNCo40MgHateTlYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8931

On Mon, Jun 30, 2025 at 10:26:56AM -0400, Alan Stern wrote:
> On Mon, Jun 30, 2025 at 05:13:31PM +0800, Xu Yang wrote:
> > Hi Alan,
> > 
> > On Fri, Jun 27, 2025 at 10:28:53AM -0400, Alan Stern wrote:
> > > On Fri, Jun 27, 2025 at 06:56:51PM +0800, Xu Yang wrote:
> > > > The valid data doesn't always begin at the buffer head in case
> > > > iso_frame_desc is larger than 1. Otherwise, the output info will be
> > > > meaningless.
> > > 
> > > Not so.  usbmon intentionally copies the entire isochronous transfer 
> > > buffer, even if only part of it was used for the actual transfer.
> > 
> > Ah, I see USB monitor only copies DATA_MAX (32) bytes data for mon_text.
> > For mon_bin it copies entire transfer length data. So I think whether
> > the data is valid or not matters for mon_text.
> 
> Given that nobody has complained about the way it works, after many 
> years, changing it probably isn't really necessary.

Okay. I just want to remove some strange info from the results.
If so, we can simply skip this patch.

> 
> Furthermore, I suspect there are no usages where the transfer 
> doesn't start from the beginning of the buffer.

I met it many times on uvcvideo use case. That's why I want to correct it.
The UVC header is 8 bytes which will show very important information when
debug the issue.

> 
> So overall, I guess this change won't make any noticeable difference.  
> But theoretically, how would the user know that the usbmon output didn't 
> start at the beginning of the buffer?  I think you would need to update 
> the documentation as well as the code.

Does the user need know such information? As a user, I don't need it at all.
I just want to see the data transferred on the USB bus.

> 
> > > > +	if (usb_pipeisoc(urb->pipe)) {
> > > > +		isoc_desc = urb->iso_frame_desc;
> > > > +		for (i = 0; i < urb->number_of_packets &&
> > > > +		     !isoc_desc[i].actual_length; i++)
> > > > +			continue;
> > > > +		offset = isoc_desc[i].offset;
> > > > +	}
> > > > +
> > > >  	if (urb->num_sgs == 0) {
> > > > -		src = urb->transfer_buffer;
> > > > +		src = urb->transfer_buffer + offset;
> > > >  		if (src == NULL)
> > > >  			return 'Z';	/* '0' would be not as pretty. */
> > > >  	} else {
> > > 
> > > And how come you didn't modify this branch of the "if"?
> > 
> > I looked into it, but didn't find any ISO transfer usecase using sglist
> > to manage data, so I skipped it. I'm not sure if my understanding is
> > correct, do you have any ideas on sglist?
> 
> I'm not aware of any use cases like that either.
> 
> By the way, this code runs for both IN and OUT transfers.  But for OUT 
> transfers, the actual_length field will always be 0 (because for OUT, 
> the buffer data is copied before the USB transfer occurs).  So the code 
> you're adding would skip the entire transfer buffer!

For OUT transfers, the offset will finally be 0 instead of the last offset.
But it's better to check usb_pipein(urb->pipe).

Anyway, many thanks for your comments!

Thanks,
Xu Yang

> 
> Alan Stern

