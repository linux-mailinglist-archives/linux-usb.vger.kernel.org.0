Return-Path: <linux-usb+bounces-21240-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2578DA4B6A7
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 04:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D49F1890DC3
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 03:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA791D7982;
	Mon,  3 Mar 2025 03:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gx6SjmF2"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2043.outbound.protection.outlook.com [40.107.104.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFDB4A05;
	Mon,  3 Mar 2025 03:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740972729; cv=fail; b=gIxCYDv9LG6m6eTZqkn75L1bkX28OJp9LsclSDj5YSm1KAnod2Z/CoJackV01qhDejx4g28LfeouNtc3sEyWG7OLUGzCbEBr6DDK2crggJBZVfT2LSB+0LaVcpVMsaYAp8FTEWcVqCGAsZTNYoqKD/pri2gYpYFd/z624sVzDqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740972729; c=relaxed/simple;
	bh=DAtSxaOdRYCXP4jN9V62/hHJMTrwgUwkHrHxstoJn6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s9G1TNAT79K20qvuqqoP731+m0cHkKBUp8gGbrUR0RHHkL20lUVktf9+zCzb0gG3F7DadTgtBbNSpAKBSmRnXXm1FU7r/e9b9dkRwnVaxsH5x+UDAh1ZbtsShlav1zoomo9mVIxAZw8A5E5tcG9ttCJZmBugsYeaj1qKTW1fj6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gx6SjmF2; arc=fail smtp.client-ip=40.107.104.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymGdCDbAkq+Ffa4EZTl4mbktmAdMWkPmvPRcLqutAVUU4vXDIQzwFng6FEn1Un6NfqBE+IgcmkHk8UZF/kG8xV+2qOzvHKmF0fsqU+IupZSEvc+o/myJoblZusHEmQrg9P5Vp/4z9Zu7O4lvQTmmSfzEYb0tulo8JB8IIBchC8BkVw7Uw8YA6WjkqO6mA0fqVr7pmUfa/t8p6T18N3Ebq65Td+Td+tLlXS9DA5pwT1HI3ZrvvpUHwlErMTgf0ogODv9gDeOwyTSXtGYTIBAFlpKB6Y+9j9M034nnSPvoG86Z8D1W+YzAPgE7fuvjBBZ5DOOMVcP+rLmTefNjTuf+Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6E0dMvaICnce+h38O+oxkGGmU3SLGTl4kPdVDzXya9w=;
 b=dWjt/dvY3DtBXxUfBonC3dP56hKLqgMbqytEO9CrhnhvxC7np0o5+NuElNTx5dS4OQkdxAayMSiRn3bCsAXJNWZIY7Gpk9eYqpJQi155vkU30yOtFx4X6hJlTeXEeO2sXKrTtd7IHJbo+KABISEzZ7XU1fj2zh4NuHucLgIvLlth3/8rR+h/vHjprStE/TrQUMGCGfdflutSOcY+KIfkfWMdK4vAebZ7qdrh2iTXvTJo2a3JRcadz2lPMU4BZblVDqkIsjXakU3U2NVRboXumF8iXs4vMqt9mDxEuajQEF/cZTLEghrcZKIe2kmxfSzD1km4qGxdg5vFuNFTZiY62g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6E0dMvaICnce+h38O+oxkGGmU3SLGTl4kPdVDzXya9w=;
 b=Gx6SjmF2VfBrZ9rx0JRj0RAZbNMzTW0skH1vDdiF5m08LWJwWXccPViO6syjjGR//c2WZ3mM6O+HAIjtiIrURyuJilOwMUdZsDoMZnW73s4fIxRFahX6uvXfxOM4isqgaorIRasPQvbKgey6rJHILkh/kKeGcBs/MUYs4yxnuqt7IDuPDscy4U5qyoNfTpvP8PnGO+ImOmKbx0YlIgATOe7+OSvkfmRjlwDUGZI0ZNRW0Vk6/TNEYjgcjk9Z+M0RvOuvd0oXMQeGD2yV25JFDpDF46Jicj7VLTDXfNzZLYwCXUonURdpTfJPOZhHlOgjdUl9jY8jZOYe4WyMrNyD7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VE1PR04MB7376.eurprd04.prod.outlook.com (2603:10a6:800:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.28; Mon, 3 Mar
 2025 03:32:04 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 03:32:04 +0000
Date: Mon, 3 Mar 2025 11:28:37 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 4/6] usb: chipidea: imx: add HSIO Block Control wakeup
 setting
Message-ID: <20250303032837.zdadveflvjujwe7k@hippo>
References: <20250227095348.837223-1-xu.yang_2@nxp.com>
 <4411149.ejJDZkT8p0@steina-w>
 <20250228091649.prmpcyro27fekgzm@hippo>
 <6777549.4vTCxPXJkl@steina-w>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6777549.4vTCxPXJkl@steina-w>
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VE1PR04MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c14f758-bf0a-49ef-0559-08dd5a03f74d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+H/G2WqGv7vwWdBdWnTuDewVjBMxyLSAp02Ri0y9vJP6O0kNqqQgX9PA3qM5?=
 =?us-ascii?Q?6MDfzWQfc0B1/RKW+6CLvqdhVZjBsQIayGieWPrE9MIUwdVpvGSeDdkEiUSF?=
 =?us-ascii?Q?e+Qy0EIhsuPdsSq5HwBDJPdapey0faKBZf9w9nfxpxMqd7jg1oOqUA6rIsKU?=
 =?us-ascii?Q?ZasJu9klo3pkiQGhJ05Q72y1ZAxYBwhWQ/NR8gmptxvu0IvwfBtKLnvrBgq8?=
 =?us-ascii?Q?sC6YCq1yr+9yafMamQEj64BM8hiVXbAL4jbFl0wwDkGhfjCBQaiJz0pd6ikY?=
 =?us-ascii?Q?vBjH6x+T8SEIYvOlZa/EXQFVDHiFlwFbsALNROiBCJRzaT0lWqI3XHaosTit?=
 =?us-ascii?Q?3wBHVPXVC3QShU/YOwfoi/GeR6unH4+36d3Vjq3pxJLh1GrYOESiFS/ifLmX?=
 =?us-ascii?Q?YnUQnErk3h0xXPAkBBI4jxP33rM75qo4bNfDbVGQA+ISAe6ZZ+XgerSOR9nk?=
 =?us-ascii?Q?Jg5k7J9OunZs9QJj2aiRXUdxS0AIepwn2PAEpQnPj20OuqLmGqWmw0BMM1KT?=
 =?us-ascii?Q?f4z15LKmd1phrshoIBXkE6t37+/fMfvOuo9W/bWedm7lkC2mdI/FO8jnIuUT?=
 =?us-ascii?Q?1A7JZsUcq4JhRYj9BA6DY3aPZRZXusPeX8siiSrhCnvsdxxFnhkXGXQh/M0I?=
 =?us-ascii?Q?fuVqDDBAXgOwWNQBJI9KfPOCgvx3P0XW/XeotpPgrMNEO4VoeIqjTiO/kA05?=
 =?us-ascii?Q?l9f1TKhe1sk0oDCwEwuXWTVUFCTpHYGL51QDPxyFa6SlQ+bVpXh60GrUoB3x?=
 =?us-ascii?Q?TUPlCUtqUSagEWTbpmqzuA98lBficp6rP19n4aYBqUrr/dQ4VAUhkQlptL0F?=
 =?us-ascii?Q?mhdzyqYChRSfvSEzaFtejqcT1n5tQ8XebkjT03jRAYnXIayl6pKePrmmmLVc?=
 =?us-ascii?Q?lFT/1V0UZh8fnyHvf2d2FDnEvlmN0R9ryPtt+JoNkNt44GWtvJSd0v+TEYhw?=
 =?us-ascii?Q?o6+1yM1oloAYBXTNstaRu817pDfvYUe+QFLFP4bz9z7j8w1QC5UqoqAd/Co+?=
 =?us-ascii?Q?FcLtuZj3OYlUkhSPfv8Cdxtj3d3SAOawM23QhSiwtDsmvEi8xDIZRmSjlpKG?=
 =?us-ascii?Q?ixZIBf/JGRGekPekdIPid8lc3HSTFcBbEoZf3T/GuUXV0ELObANQJOgueLpT?=
 =?us-ascii?Q?vSpOMH1p0Wkp2LCkCC4IaC6rYITIxYVjN9ZlBUoQY3lje0/P/SvGRW9qqCdw?=
 =?us-ascii?Q?IDz6DDKSSjSVkkpF546Tr+MgEGS4FF5ZQBRyqqIBA5OjlWv228/lJoZXfO8U?=
 =?us-ascii?Q?5OCPRVDoBwdM0fWtklOO+i1jnVT6QYv9rXvFuDILZZ4h9uNOPYaRmrEvilZx?=
 =?us-ascii?Q?au/RrVC1UzhjWXpdBDcSc1t23Zuo9CQPnGE2lK6yg1NL9V4RcF0V4IJLvmti?=
 =?us-ascii?Q?+hRzRNL7LgtCMDIv/Elf2P/zZiA3lJCm2cpyswCz+oUVPOUj0Q5499ow3Ln6?=
 =?us-ascii?Q?TChX26ZUAcb7jBHNkhdwb5Xk6IKHMPLC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9pZsLRbs9xqaLxmk4QMCC7VrJqH6FTNkmm1PnBimnjHloM/QH//gl52eqYw/?=
 =?us-ascii?Q?Y263NxYRwKTjLxcUCPrXMwVOlHsnlRAuz5sb7QRnHLkEqyOru8jDtxfMuBSA?=
 =?us-ascii?Q?SxO4OIEqiJDI9lrq9escEyhy9U8lhKB5PO2TMUkqLz7CBIoz8drJ0DhJ1eEK?=
 =?us-ascii?Q?ZrDcTxecC+QovVsSRW/FE10yIuuBYh6cRnslyDRneKuR11DsDhW+I6VG2Ft4?=
 =?us-ascii?Q?9IL0yNwGMm1oC+z5khE5A2jdIwnhpjOcJBKpb/xRKeMGO+wH44fG7c+s53WQ?=
 =?us-ascii?Q?nIBltmLZ6TK2lHJQqdAWpMO2DhfQjotDNJsc2hzq719eB57sbnkMPb9YcTbD?=
 =?us-ascii?Q?et+0AnT51K5JK+Ep18tUhMvzf130BAZ/5cf4+yFrJoom1SCsAeURC7hqnq6l?=
 =?us-ascii?Q?o0fdPUwdkA9uXtpyamx4l1AObxIquVFXr5eJT+fSZMBhpZDAW7+m0lbCgi9w?=
 =?us-ascii?Q?T+pgATMjjj6wqdXxEZxQbLJx2RXeI4QRjV7SG+6t9YVyC/wvL9PkocPHNtl/?=
 =?us-ascii?Q?vOgJAsTBMBTyuWY6JqPQ/qDp5sAadrXUq81SIRucYq/EU1M+UtAg0mr1K24C?=
 =?us-ascii?Q?ufcLmAcbr/iSR55TOYAFXhNmeCQVTPhXJzRSUQWJHQc5/kIkbGAK6F5uAkGt?=
 =?us-ascii?Q?v/b9RSSb6hM9sQeE681aUajMcbSL0rtlG2Cz5gHxI2Q8qlLmnsJzk0RPOgsJ?=
 =?us-ascii?Q?qdRmLXxul6+j6lzdS+XjXJYYNpG5mUSd2BRVsgugA9zrDD0SR9YdRyUhwDRW?=
 =?us-ascii?Q?Snr568+Atg1qGpOqRHgkeaBywFV1kxf4DqiaYraJEdSaNOGlvE2LneraOTfD?=
 =?us-ascii?Q?jOGGcskBKEs6dP61bjChOCte6etQQ8yHXbONNAzZIBKw9BAOkgyCNahRkqJV?=
 =?us-ascii?Q?yYnQbSCHlbZUHWVqwP1/r+nmykBHV2Sr6yq51jNctlZywIfbzLGtJjQfYhuf?=
 =?us-ascii?Q?Uj3SrkF5zg/tUdM3mXBM5yAGctLkzGUxv82d77k+nOs+KdbMOCO2cZsXKeAS?=
 =?us-ascii?Q?z+wMevXI9eMghZBsWTJx10ZqZxY/42NUFA53hDhuOS5azMLPOlS1Y2N2TrGV?=
 =?us-ascii?Q?F4oWJ0x8O0WUiKgWpf82wsADegiYXZkDG9HPHEj4U8jEeJm23Raq8x+t6gmZ?=
 =?us-ascii?Q?9SbTgX/THXcQwbzoLrHCAW0fk/uBFzSbTDFrnhdbY3q9Pm88PfwiFcuCyjRK?=
 =?us-ascii?Q?j1RVambp08bQmiU8VUAZPZ6CkPWAXWsiKyK9KtykgBdSyp8FuIOhGbWGvlJL?=
 =?us-ascii?Q?Qcv3v27yc23NY2clPB6F1vS57f1sd1zZ7i03MaPuQT/mqohK0qXapu5ovkdq?=
 =?us-ascii?Q?joXv1s6+XN3EcZJAibt6N5ZHe5nFgF7yeN3cZW4ty8Kb49bh2kLkpfjPZr0u?=
 =?us-ascii?Q?flWSe5EBzt4zT0EvYy4+tu6qgRWu2aHKfsM+Euv1IZga2PoMey7vBC+YdI7X?=
 =?us-ascii?Q?cAvCGtqqW51UQpnQF2ImBEeCWviV+a2LIXh4pL61jBRg8DqqTvMt+wc1Jpy8?=
 =?us-ascii?Q?L4wSF+QalgjrI4hDni0ihKAgntBPu4QDhnuI0Sjv8CTawOVGZlsFEDrF9QpU?=
 =?us-ascii?Q?B69YRXYLu26w3MhRRBpLXH7zpqSp8dgZ3ixuFP3H?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c14f758-bf0a-49ef-0559-08dd5a03f74d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 03:32:04.1793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LxldRJO0odGWM5l9m/qFVyXXkNgOFSbuVe7OkK5K3QMjMAaU2dKVDY0RWdeMlY+Eqs3sUVlRlZMq2t8m5MxUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7376

On Fri, Feb 28, 2025 at 11:41:42AM +0100, Alexander Stein wrote:
> Am Freitag, 28. Februar 2025, 10:16:49 CET schrieb Xu Yang:
> > On Fri, Feb 28, 2025 at 08:22:19AM +0100, Alexander Stein wrote:
> > > Hi,
> > > 
> > > Am Freitag, 28. Februar 2025, 03:33:29 CET schrieb Xu Yang:
> > > > On Thu, Feb 27, 2025 at 04:12:54PM +0100, Alexander Stein wrote:
> > > > > Hi,
> > > > > 
> > > > > Am Donnerstag, 27. Februar 2025, 10:53:46 CET schrieb Xu Yang:
> > > > > > On i.MX95 platform, USB wakeup setting is controlled by HSIO Block
> > > > > > Control:
> > > > > > 
> > > > > > HSIO Block Control Overview:
> > > > > > - The HSIO block control include configuration and status registers that
> > > > > >   provide miscellaneous top-level controls for clocking, beat limiter
> > > > > >   enables, wakeup signal enables and interrupt status for the PCIe and USB
> > > > > >   interfaces.
> > > > > > 
> > > > > > The wakeup function of HSIO blkctl is basically same as non-core, except
> > > > > > improvements about power lost cases. This will add the wakeup setting for
> > > > > > HSIO blkctl on i.MX95. It will firstly ioremap hsio blkctl memory, then do
> > > > > > wakeup setting as needs.
> > > > > > 
> > > > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > > > Reviewed-by: Jun Li <jun.li@nxp.com>
> > > > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > > > 
> > > > > > ---
> > > > > > Changes in v3:
> > > > > >  - remove usbmisc_imx95_init(), use usbmisc_imx7d_init()
> > > > > > Changes in v2:
> > > > > >  - add Rb tag
> > > > > > ---
> > > > > >  drivers/usb/chipidea/usbmisc_imx.c | 72 ++++++++++++++++++++++++++++++
> > > > > >  1 file changed, 72 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> > > > > > index 1394881fde5f..8c30908c11ed 100644
> > > > > > --- a/drivers/usb/chipidea/usbmisc_imx.c
> > > > > > +++ b/drivers/usb/chipidea/usbmisc_imx.c
> > > > > > @@ -139,6 +139,22 @@
> > > > > >  #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
> > > > > >  				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)
> > > > > >  
> > > > > > +/*
> > > > > > + * HSIO Block Control Register
> > > > > > + */
> > > > > > +
> > > > > > +#define BLKCTL_USB_WAKEUP_CTRL		0x0
> > > > > > +#define BLKCTL_OTG_WAKE_ENABLE		BIT(31)
> > > > > > +#define BLKCTL_OTG_VBUS_SESSVALID	BIT(4)
> > > > > > +#define BLKCTL_OTG_ID_WAKEUP_EN		BIT(2)
> > > > > > +#define BLKCTL_OTG_VBUS_WAKEUP_EN	BIT(1)
> > > > > > +#define BLKCTL_OTG_DPDM_WAKEUP_EN	BIT(0)
> > > > > > +
> > > > > > +#define BLKCTL_WAKEUP_SOURCE		(BLKCTL_OTG_WAKE_ENABLE	   | \
> > > > > > +					 BLKCTL_OTG_ID_WAKEUP_EN   | \
> > > > > > +					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
> > > > > > +					 BLKCTL_OTG_DPDM_WAKEUP_EN)
> > > > > > +
> > > > > >  struct usbmisc_ops {
> > > > > >  	/* It's called once when probe a usb device */
> > > > > >  	int (*init)(struct imx_usbmisc_data *data);
> > > > > > @@ -159,6 +175,7 @@ struct usbmisc_ops {
> > > > > >  
> > > > > >  struct imx_usbmisc {
> > > > > >  	void __iomem *base;
> > > > > > +	void __iomem *blkctl;
> > > > > >  	spinlock_t lock;
> > > > > >  	const struct usbmisc_ops *ops;
> > > > > >  };
> > > > > > @@ -1016,6 +1033,41 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
> > > > > >  		return 0;
> > > > > >  }
> > > > > >  
> > > > > > +static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
> > > > > > +{
> > > > > > +	u32 wakeup_setting = BLKCTL_WAKEUP_SOURCE;
> > > > > > +
> > > > > > +	if (data->ext_id || data->available_role != USB_DR_MODE_OTG)
> > > > > > +		wakeup_setting &= ~BLKCTL_OTG_ID_WAKEUP_EN;
> > > > > > +
> > > > > > +	if (data->ext_vbus || data->available_role == USB_DR_MODE_HOST)
> > > > > > +		wakeup_setting &= ~BLKCTL_OTG_VBUS_WAKEUP_EN;
> > > > > > +
> > > > > > +	/* Select session valid as VBUS wakeup source */
> > > > > > +	wakeup_setting |= BLKCTL_OTG_VBUS_SESSVALID;
> > > > > > +
> > > > > > +	return wakeup_setting;
> > > > > > +}
> > > > > > +
> > > > > > +static int usbmisc_imx95_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
> > > > > > +{
> > > > > > +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> > > > > > +	unsigned long flags;
> > > > > > +	u32 val;
> > > > > > +
> > > > > > +	spin_lock_irqsave(&usbmisc->lock, flags);
> > > > > > +	val = readl(usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> > > > > > +	val &= ~BLKCTL_WAKEUP_SOURCE;
> > > > > > +
> > > > > > +	if (enabled)
> > > > > > +		val |= usbmisc_blkctl_wakeup_setting(data);
> > > > > > +
> > > > > > +	writel(val, usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> > > > > > +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> > > > > 
> > > > > usbmisc->blkctl is NULL if DT does not provide a 2nd IORESOURCE_MEM.
> > > > 
> > > > Good catch. Thanks!
> > > > 
> > > > It may return an errno if usbmisc->blkctl is NULL.
> > > > 
> > > > > 
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > >  static const struct usbmisc_ops imx25_usbmisc_ops = {
> > > > > >  	.init = usbmisc_imx25_init,
> > > > > >  	.post = usbmisc_imx25_post,
> > > > > > @@ -1068,6 +1120,14 @@ static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
> > > > > >  	.power_lost_check = usbmisc_imx7d_power_lost_check,
> > > > > >  };
> > > > > >  
> > > > > > +static const struct usbmisc_ops imx95_usbmisc_ops = {
> > > > > > +	.init = usbmisc_imx7d_init,
> > > > > > +	.set_wakeup = usbmisc_imx95_set_wakeup,
> > > > > > +	.charger_detection = imx7d_charger_detection,
> > > > > > +	.power_lost_check = usbmisc_imx7d_power_lost_check,
> > > > > > +	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
> > > > > > +};
> > > > > > +
> > > > > >  static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
> > > > > >  {
> > > > > >  	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> > > > > > @@ -1289,6 +1349,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
> > > > > >  		.compatible = "fsl,imx8ulp-usbmisc",
> > > > > >  		.data = &imx7ulp_usbmisc_ops,
> > > > > >  	},
> > > > > > +	{
> > > > > > +		.compatible = "fsl,imx95-usbmisc",
> > > > > > +		.data = &imx95_usbmisc_ops,
> > > > > > +	},
> > > > > >  	{ /* sentinel */ }
> > > > > >  };
> > > > > >  MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> > > > > > @@ -1296,6 +1360,7 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> > > > > >  static int usbmisc_imx_probe(struct platform_device *pdev)
> > > > > >  {
> > > > > >  	struct imx_usbmisc *data;
> > > > > > +	struct resource *res;
> > > > > >  
> > > > > >  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > > > > >  	if (!data)
> > > > > > @@ -1307,6 +1372,13 @@ static int usbmisc_imx_probe(struct platform_device *pdev)
> > > > > >  	if (IS_ERR(data->base))
> > > > > >  		return PTR_ERR(data->base);
> > > > > >  
> > > > > > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > > > > > +	if (res) {
> > > > > > +		data->blkctl = devm_ioremap_resource(&pdev->dev, res);
> > > > > > +		if (IS_ERR(data->blkctl))
> > > > > > +			return PTR_ERR(data->blkctl);
> > > > > > +	}
> > > > > > +
> > > > > 
> > > > > Any chance to ensure imx95 has actually data->blkctl?
> > > > 
> > > > I think let usbmisc_imx95_set_wakeup() return an error should be enough.
> > > 
> > > Better fail early rather than later.
> > > 
> > > > Some errors will be printed for user. Also dt-bindings has restriction for
> > > > imx95.
> > > 
> > > That's true, but don't assume the DT is always setup correctly.
> > 
> > Sure, I thought about this question again.
> > 
> > If 2nd IORESOURCE_MEM is not provided, the USB controller could still function
> > normally in most scenarios except when USB wakeup is required. So if the probe()
> > return a failure just caused by improper wakeup configurations seems not that
> > necessary. In this case, ensuring the kernel does not panic should suffice.
> > 
> > Therfore, I prefer to skip wakeup setting if blkctl is NULL now.
> > Do you have any ideas?
> 
> That also seems reasonable. So in case 2nd IORESOURCE_MEM is missing (only)
> for imx95 there should be a warning that wakeup is not possible/supported.
> But the driver itself should work without issue.

Okay. Sure.

Thanks,
Xu Yang

