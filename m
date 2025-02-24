Return-Path: <linux-usb+bounces-20980-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E6AA4273E
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 17:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED6983AAD8F
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 15:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAA326137B;
	Mon, 24 Feb 2025 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hsfx8ccN"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1F6248897;
	Mon, 24 Feb 2025 15:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740412715; cv=fail; b=PMSywKUy9V4KzTgA1Z1uR1zzXfmfCo5qkMT6wzXpVWFlns6a7l37Ybw4OWpBUIY9FsSg3/TX8sbUzV4QzPH92ULD0qlWHZ0K0wKKIHZtj7m222rsKRg8/W1KsM4NbH8dGSQ4wapQsWzGXt86rvOyPaATYbCahE1n5CmlUx5pJRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740412715; c=relaxed/simple;
	bh=9AVZ3hqnqFrb4f6A2Wm76qyGzMlAkC1EvLPYVnVbkzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nHeu0cpKiTy8FkmwRhJOqDS2QFGokrucZSkeL8mLJuxDaoD6lkjlPNiXGif3AA0nGqj+Y7yn0ku98E0SKCpp3Y/Heh7gzdpiSGYKaLrMTv6o+5eiDumSgG6+5j7dX6ErZyC7Hcjo65mI+tZchqZDuQ/UHofiby9ahHejgit6bkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hsfx8ccN; arc=fail smtp.client-ip=40.107.159.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NS5uoLOm/93VoihTQ3sczM2HrbkapLefHsLN13dGwop1A4pWuKHTaESUXFVspoqGcn9/c2eozz5uXGqTrFZ+p0wWjjP2ZDERcHpH9zzv9IAbPK6NmasD4Rwz7Ba3D4m6jDI/guTFwxZs/qrQBsTq4xfnmylPo2T2KxxSpFLZBLMxpjBbiUEdwyLRuztpkHcPzcsyZUytyDemLYfiC5Akhw/Vdr8c8naAoYJYq4ztE5DTcpUH1N9H612HYxr3p7SLVoVuDNV6CCROMMQclNliXelFag3YBbN8uzQvFdDllqCrROv6OI7LFMA9utiqAhffjp+EyX6EP6LmILDvDktL5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pevezh8nS0j4b6Qku2xY7DABGSFHCB4eMmROdjDA9sg=;
 b=JS2ej7d/wHHhKuEXGP4GSl916QuMhT+aLzDpiGUpSjtgMxOmMqYtQLYy9ibDIUNf/chdd2Ug65qzaVihTvrLE2qUeFkxPCQjsUkqoVQ4S5If2NrB/juFJ5c3cowVksr0HWfdgOC3F949lraa0T5OXDTAIXErI8iT6JfEIhum50/yWbCsW173z7pU07OI9nEg4m2mn35RtNqXcOfyeLKN+r1AHB0FhKhKxL7+CR69UQtefoPQ9hxWeusrNnWodXEKR112ncIgMCtju1psxh/fYmXyBl2l4YlbYkuOLAt56Kmqp1p+IDVSVeRuPgkpUh/hM/Is2opv9TXMjkEyyo/Dgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pevezh8nS0j4b6Qku2xY7DABGSFHCB4eMmROdjDA9sg=;
 b=hsfx8ccNrtozmSn7APNt1a8JEKmAmHb8L8B/dHY2oMBCkDuF3eyFkznlTeX233g1S+bVgSC2QxI+39m0AzTD3Qo/8HoiKi0aceyzX5jXKx+ZRwvf2Ee5y/0Fuv49j6bafsWrxItQpPCxyI8J0AFP9ZQSkH384Vp/+GiCJYX84X7vVSVfpqlgbXDWleNT6+wr4Vn7Btdk3TgTQB6lH+e0LbgoXLS6HYLtBtQWPLWm3iMdbtAjVJGtm4fVvUbWKG5GDVvOWEpTM+qVNxv/3Lrp+VPxm5cu8W30tLJdqagN/DMuH813lVm8w/pVDFp7mbfTMuxFScG5xEZaXEViF5SDFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10490.eurprd04.prod.outlook.com (2603:10a6:150:1e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 15:58:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:58:27 +0000
Date: Mon, 24 Feb 2025 10:58:18 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 3/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <Z7yXGgrX6FVQjy2M@lizhi-Precision-Tower-5810>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
 <20250219093104.2589449-4-xu.yang_2@nxp.com>
 <Z7Y+gqu75xJyjy6n@lizhi-Precision-Tower-5810>
 <20250221032348.sncjhnldj6ecgeou@hippo>
 <Z7iabsMl4ilQqrXN@lizhi-Precision-Tower-5810>
 <20250224110751.7666zcafbyakvfb2@hippo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224110751.7666zcafbyakvfb2@hippo>
X-ClientProxiedBy: BYAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10490:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d900caa-7b69-40b4-5af6-08dd54ec1394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j+JrOjZ/P05jP2pEw09O/8fiy8xyUBX5titnlHe+Qq3IU4cS4bsp4/tq/NMF?=
 =?us-ascii?Q?Um/HU2OGoqeR6tySgT11WLgHPULVSYGXV7jutaWNPcq5TpwHK+pwepn2KGQA?=
 =?us-ascii?Q?E+CKkfz5zdjP/QFMWIRa0JV/pz7kRu4WYJ6DPU/ybXb5zo6STveXlqffazsT?=
 =?us-ascii?Q?1Yekmz6PLxt21MM8LroLYEtqtCOhJi5T1A4lF5eLeW9rnSKpTja132TfP6PC?=
 =?us-ascii?Q?DuIjsJUyUpZm4tzpuYU/BdhZnoIXcW1ct4x3GKvE2xKl1RcpmnwYQNM2uVpz?=
 =?us-ascii?Q?IseB4IbaFKnCizvKB8um76HQ1anIFUSOBAFL4rYbyk6hfEgzzhOj79s36V93?=
 =?us-ascii?Q?i/xc4yVmQSfDLAcgWgz0r4vBdw5z0LkKO33sfHhS4HF8T4fe9/CZs9MQkdy9?=
 =?us-ascii?Q?jyCdTLNycrVDunDLT2yzi0ML54fXtnKTYsThM37YqFnnRN8PcmTNM7nimTeV?=
 =?us-ascii?Q?W9RQBqnrFQpxCxLXnC7q0/KcGcc6I5BF1cTKptFWoTat4/P1PM8mrDcu38It?=
 =?us-ascii?Q?Yggxqyt16ggGsuNZkXjlqLNgjFME5dxPUE4NGWxjmWTPbMBLC9j1Gs/5tyGr?=
 =?us-ascii?Q?7AMrAnC5/7+l0x7c7RPIAhKeHOPY1YVMT974GnBoogqxm11PlNLABMvkri6x?=
 =?us-ascii?Q?+wI9/BcvQKnGr9+/gw5am7qlYcdjyqBxbDBQOpVJmCtr7395jmYBidecRFEw?=
 =?us-ascii?Q?rnqYU/HBd9Ud1GQuRswMnzsMzA34h9QX+kFIFzKYSRWfZKZcj/5SDORAiPp2?=
 =?us-ascii?Q?kySZOGEk1nJZ+UzY7tqGByc+Lb4UUo4g2ylgJLYR4iwRVJbEG+vJ+7Q8cqXT?=
 =?us-ascii?Q?293tS0Q/2heEOojs26FJdDZLlqQ9bT+oJNM/GYb0dy8a8fmwE0rpVjMTpxRq?=
 =?us-ascii?Q?ExR3BpiA3BvaPF2A326FOvKZ2h5qDnhbEljvCNZCJk5i2vPXXZGUjw+1bl5E?=
 =?us-ascii?Q?C0ulBiQMTyVCbqbszA/wqU/DfhTXtgAKVT1A+hL9LudsFybm3K/lPYfI91+d?=
 =?us-ascii?Q?XH1Y0GXaEiZC8pFDGl87XvNK/L5aN24k3KXsEeIK+x3ba098t4HuPfalbmcZ?=
 =?us-ascii?Q?mIELOmHawYIY4qpCfPrCyEMMl4TG0W+GlmK3LY3pqhA5ivURCBFUisEMq/5A?=
 =?us-ascii?Q?kkoZ0KeJ/iRfK/+xg6mW8Q7rb6+Yz6odl7bd4AbXxEmRmkgibLW2eolin+uI?=
 =?us-ascii?Q?bkMmGnn/hhEMZDduCaBlP7KWvSQVl7lwguJuegzayz0eOCl3qx6e35vlNaKH?=
 =?us-ascii?Q?bKMlQ+PUMWFOisimNLSxMjXgucXD9G21zt1Zrajvyldzncmo0A0Yy12fWSxQ?=
 =?us-ascii?Q?fV2Jj216kMsHNXvlyvo5DOvEQO2As+vXnevwUhPcjTXJqzr8/P+aJgxdFOPq?=
 =?us-ascii?Q?2/uSsEZ3rWPWOB2Jb7vYgghUVrSKVIk4XlclhWaEK6ARkkG2k86k2S8/ZXeM?=
 =?us-ascii?Q?bMdw9QvpI3mbvGZW/2SA8Sf/Rpaz4F9Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S9931e5joU3sCRJovvsSohAVZvaYHg78DIp/ocesIJeRvob+Zg0TLxnmiWia?=
 =?us-ascii?Q?5O9HZj9hr0YG9jXbMWJsvW/Jc/Weryzx9B7zN8UdKa+5E8d6m+1pzEK3rcAT?=
 =?us-ascii?Q?uT+nOeqlwob3UIc9ooq0uCNjNvwTC6kId0TCKwxJjbHyYZNOchVojsaJy7ET?=
 =?us-ascii?Q?Fst98BmoaLuRP04xPHO87v5lkVDPi5bm/gMfgKfPx3ebqbygi/TFUP9Vn454?=
 =?us-ascii?Q?SYzRT8Acheu7aEUYyDMk5Ui+55wFYBaSQR/sgMxymkdWZIAsZh4fLzzE5ApQ?=
 =?us-ascii?Q?65m0uT57PjrEjX0Sbe+CvnRIwnlbuqBH44ffpLNjSW4yNJ+6n07hI1yPNBg4?=
 =?us-ascii?Q?1q4GU5+D+DFlptyWtKhz9RiymOK8HD8mH+vXUA6hSrkNXuXoZ5YARShfMSb9?=
 =?us-ascii?Q?ybioFsxwOetUBTaHu2TcQE+Wcskwm+lbXMS7y6uob5FG8chY6Uo3Ig6/G6ne?=
 =?us-ascii?Q?tnWA92JntVG7rnbHHw7iQmqJydtAgaHUPYrJrFRiu6Lj72lMWwtw1hCpyraZ?=
 =?us-ascii?Q?ykDjgybO9FiyNXNyE4dA+SqYHwgi5bNTvfSKrar2WwYnfzbmC2Gw+5qHtjY9?=
 =?us-ascii?Q?eDeosaz9rTxxxjbGBh1zoCK7+xMNgaiz6h0kEe9Eac6uOnUJuxXEEIdfPW8C?=
 =?us-ascii?Q?LIE5HuAF8dIOFwGs4r20pVtgN4t8zxllksWlGmSQUNAnGtihmsYMjRSyJFz/?=
 =?us-ascii?Q?DgG4QoLkeQOMaj11OnmUjaZ5HIUI86RNdpR4+GzJRHs2dEZ4DcZAWn2uLn4k?=
 =?us-ascii?Q?HB2ia/4+12ViP0BfUCfSJyOshP6eJkSUmQ4VA0yKQkhP+exN/fWBFKUW8YMv?=
 =?us-ascii?Q?tpMUGwy8b+m69/5RuSUSkFeh/oML9VxVMZDMeNllyXhxqEdSHTIU5y7zb9yI?=
 =?us-ascii?Q?Lty8Pf5IfC/iAM4SqIbl5BY8cXgDvwnQTe/kthzUCuh3QDLzDfhCKTiDw0z+?=
 =?us-ascii?Q?Ulxoc3Ce8PZM5TB2N0fTXXmSx+5C8/mp8Ia0pkSWuDhF+YuGfbiCITjMvvhG?=
 =?us-ascii?Q?spQHELerTWrLd8/Cjlt/7/QIJ3J2dc9JhQWeOpsMcV29q+yS90MEyGQVdXiS?=
 =?us-ascii?Q?aoZQevGj9YtfLUJQteFOUuA+vlIg6xdxgAwPdAdFtY+phmu9oYiK1J+rEvFp?=
 =?us-ascii?Q?cGiHCAuPX0bvDznf9sJF51bIfyn9z5M4BxTwXwmwFyA6X/8e+XTBvYOiI2Cy?=
 =?us-ascii?Q?Ks2Vo9Xpgel2kWlhhAIaoEuaEqaLZbjWxJqh+9bQJgd2yowoYw1G6v/RuVV1?=
 =?us-ascii?Q?EnS2k5/wLPZhQSPZvml07zZCdM/F+NfixrV93itZbQSavnTYuub8tiM9rI0h?=
 =?us-ascii?Q?4fCEDAeLwXXxS5uvhHb/2V9YVwglpM7LLvVjOTZUYfcQTpH3/xTGI5rfhN34?=
 =?us-ascii?Q?f7Y3d46AYs/nRceTsyvzw3LHNVatqMwhfGA34gp1G8MMPJoGYqlz9p0HrB+c?=
 =?us-ascii?Q?7bwXKD186uowgYFMNDpjN4roGN0B1/48LTb/sWDV6KYmJzDOVfHJLPbXidLh?=
 =?us-ascii?Q?UcfE5NUpNZw5aHe8U6Htus7qIEktS/IW2s8DpU9qO7LyYgnteZ8dm0xAiQzE?=
 =?us-ascii?Q?F7hSB6TstVr2kXwuYwE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d900caa-7b69-40b4-5af6-08dd54ec1394
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 15:58:27.5925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/KGX1vstRE+N9Bcyl9Nfwa1CB7UU5E27FU5Kg/ytCH3ru2kRnYpCAgamM54WflPU7N01b+s3e7g3MpvcfhvNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10490

On Mon, Feb 24, 2025 at 07:07:51PM +0800, Xu Yang wrote:
> On Fri, Feb 21, 2025 at 10:23:26AM -0500, Frank Li wrote:
> > On Fri, Feb 21, 2025 at 11:23:48AM +0800, Xu Yang wrote:
> > > On Wed, Feb 19, 2025 at 03:26:42PM -0500, Frank Li wrote:
> > > > On Wed, Feb 19, 2025 at 05:31:01PM +0800, Xu Yang wrote:
> > > > > In previous imx platform, normal USB controller interrupt and wakeup
> > > > > interrupt are bound to one irq line. However, it changes on latest
> > > > > i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
> > > > > This will add wakup interrupt handling for i.MX95 to support various
> > > > > wakeup events.
> > > > >
> > > > > Reviewed-by: Jun Li <jun.li@nxp.com>
> > > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > > ---
> > > > >  drivers/usb/chipidea/ci_hdrc_imx.c | 42 ++++++++++++++++++++++++++++++
> > > > >  1 file changed, 42 insertions(+)
> > > > >
> > > > > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > > > > index 1a7fc638213e..5779568ebcf6 100644
> > > > > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > > > > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > > > > @@ -98,9 +98,12 @@ struct ci_hdrc_imx_data {
> > > > >  	struct clk *clk;
> > > > >  	struct clk *clk_wakeup;
> > > > >  	struct imx_usbmisc_data *usbmisc_data;
> > > > > +	/* wakeup interrupt*/
> > > > > +	int irq;
> > > >
> > > > use "wakeup_irq" to avoid confuse with normal controller irq?
> > >
> > > It doesn't matter. It can't be confused since the driver is different. The
> > > controller driver is core.c. This glue driver is ci_hdrc_imx.c.
> > >
> > > >
> > > > >  	bool supports_runtime_pm;
> > > > >  	bool override_phy_control;
> > > > >  	bool in_lpm;
> > > > > +	bool wakeup_pending;
> > > > >  	struct pinctrl *pinctrl;
> > > > >  	struct pinctrl_state *pinctrl_hsic_active;
> > > > >  	struct regulator *hsic_pad_regulator;
> > > > > @@ -336,6 +339,24 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
> > > > >  	return ret;
> > > > >  }
> > > > >
> > > > > +static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
> > > > > +{
> > > > > +	struct ci_hdrc_imx_data *imx_data = data;
> > > > > +
> > > > > +	if (imx_data->in_lpm) {
> > > > > +		if (imx_data->wakeup_pending)
> > > > > +			return IRQ_HANDLED;
> > > > > +
> > > > > +		disable_irq_nosync(irq);
> > > > > +		imx_data->wakeup_pending = true;
> > > > > +		pm_runtime_resume(&imx_data->ci_pdev->dev);
> > > >
> > > > Not sure why need pm_runtime_resume here? There are not access register
> > > > here.
> > >
> > > It's needed for runtime resume case.
> > > When wakeup event happens, wakeup irq will be triggered. To let controller
> > > resume back, we need enable USB controller clock to trigger controller
> > > irq. So we call pm_runtime_resume() to resume controller's parent back
> > > and the parent device will enable clocks.
> >
> > Please add comment here. why need in_lpm if we can make sure irq only
> > enable during suspend/resume pharse?
>
> I have checked again, in_lpm checking is not needed. I will remove the
> if condition later.
>
> >
> > >
> > > >
> > > > > +
> > > > > +		return IRQ_HANDLED;
> > > > > +	}
> > > > > +
> > > > > +	return IRQ_NONE;
> > > > > +}
> > > > > +
> > > > >  static int ci_hdrc_imx_probe(struct platform_device *pdev)
> > > > >  {
> > > > >  	struct ci_hdrc_imx_data *data;
> > > > > @@ -476,6 +497,15 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> > > > >  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
> > > > >  		data->supports_runtime_pm = true;
> > > > >
> > > > > +	data->irq = platform_get_irq_optional(pdev, 1);
> > > > > +	if (data->irq > 0) {
> > > > > +		ret = devm_request_threaded_irq(dev, data->irq,
> > > > > +				NULL, ci_wakeup_irq_handler,
> > > > > +				IRQF_ONESHOT, pdata.name, data);
> > > > > +		if (ret)
> > > > > +			goto err_clk;
> > > > > +	}
> > > > > +
> > > > >  	ret = imx_usbmisc_init(data->usbmisc_data);
> > > > >  	if (ret) {
> > > > >  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
> > > > > @@ -621,6 +651,11 @@ static int imx_controller_resume(struct device *dev,
> > > > >  		goto clk_disable;
> > > > >  	}
> > > > >
> > > > > +	if (data->wakeup_pending) {
> > > > > +		data->wakeup_pending = false;
> > > > > +		enable_irq(data->irq);
> > > > > +	}
> > > > > +
> > > > >  	return 0;
> > > > >
> > > > >  clk_disable:
> > > > > @@ -643,6 +678,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
> > > > >  		return ret;
> > > > >
> > > > >  	pinctrl_pm_select_sleep_state(dev);
> > > > > +
> > > > > +	if (device_may_wakeup(dev))
> > > > > +		enable_irq_wake(data->irq);
> > > > > +
> > > > >  	return ret;
> > > > >  }
> > > > >
> > > > > @@ -651,6 +690,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
> > > > >  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
> > > > >  	int ret;
> > > > >
> > > > > +	if (device_may_wakeup(dev))
> > > > > +		disable_irq_wake(data->irq);
> > > > > +
> > > >
> > > > Look like only want enable wakeup irq between suspend and resume. There are
> > > > some questions to understand hehavor.
> > > >
> > > > 1 driver probe --> 2. hdrc suspend -->3 hdrc resume --> 4 controller resume
> > > >
> > > > 1--2,  look like wakeup irq is enabled. maybe controller have some bit to
> > > > disable issue wakeup irq, otherwise flood irq will happen because you check
> > > > lpm in irq handler.
> > >
> > > It's not true.
> > >
> > > We has a bit WAKE_ENABLE to enable/disable wakeup irq. This bit will only be
> > > enabled when do suspend() and disabled when do resume(). So before suspend()
> > > called, the wakeup irq can't be triggered. No flood irq too.
> > >
> > > >
> > > > after 2. wakeup irq enable,  if wakeup irq happen, system resume.
> > > > ci_hdrc_imx_resume() only clear a flags, not any sync problem.
> > > >
> > > > But sequence imx_controller_resume() and ci_wakeup_irq_handler() may not
> > > > guaranteed.
> > > >
> > > > If ci_wakeup_irq_handler() call first, ci_wakeup_irq_handler() disable
> > > > itself. imx_controller_resume() will enable wakeup irq, which will be same
> > > > state 1--2. but if imx_controller_resume() run firstly,
> > >
> > > It's not true too. Because WAKE_ENABLE is disabled after resume().
> > >
> > > > ci_wakeup_irq_handler() will disable wakeup irq, which difference state
> > > > with 1--2.
> > > >
> > > > If there are a bit(WAKEUP_EN) in controller can control wakeup irq
> > > > enable/disable,
> > >
> > > Yes, WAKE_ENABLE bit. It's already used:
> > >
> > > ci_hdrc_imx_suspend()
> > >   imx_controller_suspend() -> enable WAKE_ENABLE
> > >
> > > ci_hdrc_imx_resume()
> > >   imx_controller_resume() -> disable WAKE_ENABLE
> >
> > Okay,
> >
> > I think wakeup_pending is not neccesary. ci_wakeup_irq_handler() can
> > simple disable WAKE_ENABLE.
>
> Right, wakeup_pending can be removed. However, it's not that simple to
> control WAKE_ENABLE in ci_hdrc_imx.c due to imx_controller_susepnd/resume()
> do more things expect enable/disable WAKE_ENABLE bit. And usbmisc.c doesn't
> export a function to directly control WAKE_ENABLE. Therefore, I still need
> to use enable/disable_irq() for simplicity.
>
> Due to this wakeup irq is only used in suspend case, I would like to add
> IRQF_NO_AUTOEN flag to request_threaded_irq(), then enable irq in
> ci_hdrc_imx_suspend() and disable irq in ci_hdrc_imx_resume().
>
> For example:
>
> ci_wakeup_irq_handler()
> {
> 	disable_irq_nosync(data->irq);
> 	...
> }
>
> ci_hdrc_imx_suspend()
> {
> 	...
> 	enable_irq(data->irq);
> }
>
> ci_hdrc_imx_resume()
> {
> 	if (irq disabled)
> 		disable_irq_nosync(data->irq);
> 	...
> }
>
> Do you think if it's feasible and better than current patch?

look better. Does ci_wakeup_irq_handler() always happen before
ci_hdrc_imx_resume()?

Frank

>
> Thanks,
> Xu Yang

