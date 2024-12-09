Return-Path: <linux-usb+bounces-18271-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5758E9E9BF7
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 17:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFCAE1886839
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 16:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1162614A0AA;
	Mon,  9 Dec 2024 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bBYozuJQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2089.outbound.protection.outlook.com [40.107.104.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5348114884C
	for <linux-usb@vger.kernel.org>; Mon,  9 Dec 2024 16:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733762485; cv=fail; b=plbkkzc0CYXtzQlN1dwI4szedifMh3EK4O5S2o89RnzsHk1OuYOfJ5oPFRT/u+zDrphouHdVvcT4gGeByyFKM8zmBCy5vtbNqrVdlFmi+PbNs3pqR38OkUz5rvo47M/QHXbeP0kBJE/nDDmEv23mFE72FS+pixT4ltLzT8cFFs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733762485; c=relaxed/simple;
	bh=0rPNxLesR0RwnUkdPx//VyNc8bIT3NRuDqd9oaIS5x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hL1fQRDYMq4Kvy1jjbH2H5XE+/wOHq0UEgzf9ccC+Xzq2VmsdTUx8IXfYo/v5SjrYfJM83orLFtbxlK28GPV7j3r060g3YfKKE/64KsVIWmRgXZ3TWJTt/KEpmTqPlKW98Vx9EAOMfkVIKIDh9Uiq6XgoFB19ZjrUc9xw86wvs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bBYozuJQ; arc=fail smtp.client-ip=40.107.104.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTjbVsK+gr8vLFJ4fLOMxW5Ajd4P2OfObgHMkVhIx2hOzD9tSHmz3pJxq6GriHjxN5eHOeAJ24qz0zK4Q0UnYk/ak297bFv8zCzKDX5MIkx+E7hr7VstWMgxjT+RUwdDJrv76P33uPxh9/baa9sl6kZyrQ9ZV3D346/RNleFMMmpSMXPGObCJnG1mUoIZ91s/WiqYxBrIlcTgntlIY7Y5zN4wdKXUmOg9zDor/kknRZIogK5q6iR6uEMKGcDqjTkg/QoCfZn02FGoz1pA+k+3LfQbZuuvHJyRAyHYl16h6MfUDSpgQfSC7Wnv6YMP/zIZzmXGZxJFifh/BkV0IFDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F67+Ff3B3ep6b2nUauMEUTAwlWrdpijqKpii/kNpWDU=;
 b=t/qz2BEIfOO27mxc7Ah5bt6Wdvqwi1qNnqi+k4BmBBmB4RhI2a8/cI1wez/NlEPzSQz64v9KD4GR0a5ebhH92z9HEcPT4PebQpx4y3vfZHwaIpiqdAGYL7WOI1iODvorxo4JQAQQ+PxZONi+ECYcOQ5hV4vGOBDWDmyyDgcBnGZdXnnz9xOmunTdSiBI4ba9pXP6U9Qo3iE5dKmjTdfET0/msvqR1ZkOGrkMJv1kehN8UDUkTW5RJ9y3DMWVjgbDAun7yq5xj9Y5heVM+hCna3H3ZdvvODiywL1f8ZmSRC2F+TVr8Oks3ZUdTp4GlyCLOXVr0Yshq/RFoAjlp8/HpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F67+Ff3B3ep6b2nUauMEUTAwlWrdpijqKpii/kNpWDU=;
 b=bBYozuJQ74o5ZPIlbmbKzvXvTH5ed21PjBe9EFUIglhc1VgrgEkTtcpbHbV3PUCnrWZyviBFKGfuxdduQ4jbd0Xo96AwbF1iO5KqIfxrvb0TSA7bGM5YiPbBLipyzW/SDduIvSxcAX9dfchj0oOQ2OU4Dxf41ENSrNaLei1q/QLNNlKsD8yl77U99z5MijCNZxakV5SbuSgQUIRJOkRdvWcFL2+s8aK9vKERHBTlXB6VSFzm10B6zR4SSbQAwOtu6/SxVSjnN5Nxmmr/RxWMLl4T0FXue9R/0WWA/aingbpXLzMXLa1zYO+TnODviNbmJHi8rax0IkZHZK/155e0VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7878.eurprd04.prod.outlook.com (2603:10a6:20b:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Mon, 9 Dec
 2024 16:41:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 16:41:19 +0000
Date: Mon, 9 Dec 2024 11:41:11 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, mathias.nyman@intel.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: host: xhci-plat: set skip_phy_initialization if
 software node has XHCI_SKIP_PHY_INIT property
Message-ID: <Z1cdp9MxyXJ3qP/w@lizhi-Precision-Tower-5810>
References: <20241209104149.4080315-1-xu.yang_2@nxp.com>
 <2024120913-exploring-pueblo-da0e@gregkh>
 <20241209111014.ea3te7uwm522ykor@hippo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209111014.ea3te7uwm522ykor@hippo>
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: 25639f36-bbca-4273-fb72-08dd18704eef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s/a7yKOauQEMQodmSqxI85VxXbLF8qy279oF4QOfzAysMCbNDTuY2mNsqOxS?=
 =?us-ascii?Q?NPaRnWRVKvWwoTs9p1j6a+mrCuvNzSaczPfWCr6TmPy4G6FU/MLNT3y6d/O/?=
 =?us-ascii?Q?gUAPt86rFXJWdzEsSO2K3mKxsYej+QkZ2iwh7FaFcRuTEfMJzY040Sp/X9nX?=
 =?us-ascii?Q?4eeOA/WbbBF+4uWi7SI3wrJo9sfNDb8ZorooT+GPR6tM+lcx6/n1dsYl7vCu?=
 =?us-ascii?Q?8BDRmigA48L/ktuUifS1Gm7JBvNWuKxKHNDMBFqNFce1SIS9gtgGli05zuWO?=
 =?us-ascii?Q?N2TBgXDY/FFLPFYvNvwM/B3LxwEPKe9fEqB+LO1ZvXJMTFgb2XHrhSW3fyQd?=
 =?us-ascii?Q?4Dh5vScBzVYWiD8aa3Ua3gG/94OV/krnr/2kV89ELWc5hby/EfFRYt3l+d8N?=
 =?us-ascii?Q?WLOBbO+0dHolql8PZNnBoyWKJcuNnxrapA+V7peYJL/fCDtCVD2NRl/+A7CJ?=
 =?us-ascii?Q?r2HcN04C4vWBp9FN1mh5r06KdCtSmUDpxsoeHQHrtX0OzngVL1eIwpk0KpE/?=
 =?us-ascii?Q?1FqJgwBW7UMRGozDh+uKsfTT0O0d+UiQ7srwAcqGWVb3Rq3v2yhkTFlGiPxa?=
 =?us-ascii?Q?Srr1KgOv05RNEoq6/V+68bpZ+Obn4ccX4KUkl3iSdeP2S4h7sBYH7ja/Ig1z?=
 =?us-ascii?Q?L7nlzVWTV32Nga2N43Q+o3xsKXIZyX+gzftXB8RgwGRJ6RWNMXAwF8DEQDsv?=
 =?us-ascii?Q?MXG8lwmxtd2jPcs0nDTSliY60xA2fAEhgrA9YJDeqk/jHAwmVY38Blq4iTWR?=
 =?us-ascii?Q?5NrPA3ctd0F9LO+aXOl65AmCT8arFNAL6b0SyuUfmZwoVtf7LIbCMilCVSZQ?=
 =?us-ascii?Q?C0ju9F0x81ozRWC1v3LVK/7mNFZBpulhvG4KzfXUlom5XN6fqnhXTEmOR7GF?=
 =?us-ascii?Q?wH8KL4hGpJVOY2WHoQ2hLGfLCwyxC+M1iZRf1hpTK7+GyxO52YZhRJ/Le3Jh?=
 =?us-ascii?Q?V/Fpk3pdhTyKaNDtac0vx32/2J7rpHfTBb9Ig0Hd08UymbslAylaGu6NoEfY?=
 =?us-ascii?Q?jvsedeCv29cfujHKYFxFOY5b7MJN3PVDkPt/CuPIo+GiCK4r1ANQ4e4sKnrR?=
 =?us-ascii?Q?04zSHI7Ew6obyR6OleDoQcRZZY7dRM9zUPGK/qB5pzAAXLMLcRWmH5UsGMdj?=
 =?us-ascii?Q?9NqalRkOlZqSOfkNTJDiABrGpaH3mAe5dvnGQfJ7XeSmrJYvxBz1ZKbbGx53?=
 =?us-ascii?Q?BTPK/AeGuoIoqdn8Y1JoeoPsz8wWxuCejryhnq1sy4FpPWnKV5nCEq1nCCS6?=
 =?us-ascii?Q?A2TF5LEER/XyZ7MED8AArWjq1lfcjipKx2hXxvqF5nGXa73vEiOh7nY+1Q7z?=
 =?us-ascii?Q?l8/XtHwfUc02P0EzRy8vm8uWRSX6xvJQ3q3kIVYopEPuUoEal1nExTcid2CC?=
 =?us-ascii?Q?eNOYTTJheC/Kb3WhZ+mdTnm/5LEiOfSX53R4XXYxJLWR3QJfwQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GNKwG2Y/7eMIhBpat/jdipYgsGhfOTa/6XCTqEv66FtiaiDREdRmvdXFj/wv?=
 =?us-ascii?Q?mRMYjidPR9MCVVknHMUTdZHlv6UG7U4pc87z3CzbL8tkmm2Vcia0MwbAR0Vn?=
 =?us-ascii?Q?GP7yDNGIj1RUU13rl0e5e7aohivsnLBF1di53kMJELjLAQoSQ8pYSUpbrc1/?=
 =?us-ascii?Q?AnH3YTD3wngwZiY2hPLokN8FGsriKWzIbPcridqk6veNXdrMIhO9UMRr6l6P?=
 =?us-ascii?Q?PuemAh4n1FMpF2pzTIeUMo/8gppfrE6uBogwxg2Ltm9K/Nq6j49kCuriGtv1?=
 =?us-ascii?Q?w5p23mSZ5zoH6fQWfftGOkhok3rgGjLe8BTEno5fAThT5Ynp985U7sCLpOmQ?=
 =?us-ascii?Q?TdHWP5WhC/EP6iy/TJ3u9Y8mdczvZEUq0uAxklQr8A1fOmMXpa2yx7ujrHyj?=
 =?us-ascii?Q?e5JICCLU1gpwNvqdWipNPRSdK+bKdgMCaTNUI3DJl93UN4eCx4DSLBxXH9/R?=
 =?us-ascii?Q?VFba1+rhzsmWwqkj+sJ2yzFN6kcvNmFLm/UzSReHdtbIM8z2R0QxfB2YACBz?=
 =?us-ascii?Q?qZXCFAC4vf4rRXn9HVzEBcFxncaFDdCXlc5pNVdF2X6Rx5WPAkVHaZikKZoD?=
 =?us-ascii?Q?3wxdeGvPjW2a3Mg9GjuKS2lVR/tCY1qwqjY80aY6atUK3VD59CIB38KSWtZk?=
 =?us-ascii?Q?h7HvrOfrifWrm7HaUqdp/N8+4aU6oQg0lzfEsieYVJXcY1ZmjuBuFb1uhEzn?=
 =?us-ascii?Q?rybEdPmuS2eSI+2dNxu83yO35+mGuwmqEIHMkGtwdcTaPo2n4teHXYdJs9SI?=
 =?us-ascii?Q?Wyph3FapxoZzWYpeyJthcd7Pb2si9FQFCAsq2HQKvkXEoaLRu3+7PD/ieTnH?=
 =?us-ascii?Q?pF9c+pdeD6m3KB6DBmNdcCmqLLa+F+76rO5QXgoVuve/v9pj2cfWyfm1MStK?=
 =?us-ascii?Q?wEHziHyEWCo9oY/cXH0qlmn86MxF7dZAM5w+mfOQCAGkCOUkYsEuqgDbl5ni?=
 =?us-ascii?Q?a7spG4qINr/nfjGxNkuYUEFWkRAz2meE3bSDwTkF9zGCdLXaprkggqoui1rx?=
 =?us-ascii?Q?nTvctYLbDvGtK0t1aZDMXBpRA1L+dEm+178K6gQM/Dms8HTQ7AaR5KHBOJhV?=
 =?us-ascii?Q?LZUDf7R3EcYgQZVWqsYY/ZYKFuZxV8JHSUbT6Iq5zY0tGKr9ql/tGyPSnPiM?=
 =?us-ascii?Q?PAiV6l/TVJinmZKQBWp65JMXLJHO3AEmJ6lcLQiNRt5SH3pCirb4DSTOVkx5?=
 =?us-ascii?Q?JRzfe625qCu+cH50zc9687/e79ockJkwDX0QoXlSU3S8oCyQkU3plDjTzwAf?=
 =?us-ascii?Q?8jt1slKdnV7TrsdUw2E8asM5SpAcmBb6W2sj87MSk5WRWDxKxmR9Vbg1Y4nD?=
 =?us-ascii?Q?cHeyvY7B2JL+emhu4XYlmpZNA12Sf4kbDc8QUwvzZg5ArpUUzTdFCauQvxK0?=
 =?us-ascii?Q?C6Gn+gaR+HFiIuZao6HuMYpo5tTLiFmtdziDhfT3CpOyLvHFvxe28sYWbBgW?=
 =?us-ascii?Q?xeZ3rrSHnCTTwMCyK62FwBZraFUGw+ipeclQONjMCofkdsJcDeznO+gmuMme?=
 =?us-ascii?Q?rwZOnN6HhMFdl12Yy0LlJwHZHr0TrbQV6Na7xZVHtyNP+zYcgljBZP4LAovQ?=
 =?us-ascii?Q?UWCGoyEhkAJSzQPmUl9w6ryewBixN/LIe7ZGAJj6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25639f36-bbca-4273-fb72-08dd18704eef
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 16:41:19.8115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDIqLZREu3aXY0Cv/ei34bjC3d5c11rtH6TVY0LPg7CBd6ndh6+JLlYQ4aCvU1lmsPmUlF5gUjQq90/FVCF8dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7878

On Mon, Dec 09, 2024 at 07:10:14PM +0800, Xu Yang wrote:
> On Mon, Dec 09, 2024 at 11:46:59AM +0100, Greg KH wrote:
> > On Mon, Dec 09, 2024 at 06:41:49PM +0800, Xu Yang wrote:
> > > The source of quirk XHCI_SKIP_PHY_INIT comes from xhci_plat_priv.quirks or
> > > software node property. This will set skip_phy_initialization if software
> > > node also has XHCI_SKIP_PHY_INIT property.
> > >
> > > Fixes: a6cd2b3fa894 ("usb: host: xhci-plat: Parse xhci-missing_cas_quirk and apply quirk")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > ---
> > > Changes in v2:
> > >  - fix indentation
> > >  - add fix tag and stable list
> > > ---
> > >  drivers/usb/host/xhci-plat.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> > > index e6c9006bd568..77853b86794a 100644
> > > --- a/drivers/usb/host/xhci-plat.c
> > > +++ b/drivers/usb/host/xhci-plat.c
> > > @@ -290,7 +290,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
> > >
> > >  	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
> > >
> > > -	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
> > > +	if ((priv && (priv->quirks & XHCI_SKIP_PHY_INIT)) ||
> > > +		(xhci->quirks & XHCI_SKIP_PHY_INIT))
> >
> > Doesn't checkpatch.pl complain about this?  This is still not correct,
> > please follow the proper indentation rules here.  If you have questions
> > about this, please ask your coworkers who understand the style
> > requirements for Linux.
>
> Sorry for wasting your time. It's a mistake. I made the change but it's not included finally.
> BTW, checkpatch.pl doesn't complain the format. Not sure why.

try --strict option.

Frank

>
> Thanks,
> Xu Yang
>
> >
> > thanks,
> >
> > greg k-h

