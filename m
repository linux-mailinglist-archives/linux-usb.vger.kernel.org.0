Return-Path: <linux-usb+bounces-15886-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98950995D6D
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 03:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34EF0283DF4
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 01:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814231F957;
	Wed,  9 Oct 2024 01:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XV77vDXE"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219C55674D
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 01:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728438688; cv=fail; b=qDCQOtjSVBSHPYPU7o+H4jJHNALoFa5vPzHMIatNk+KpIvmnyck61povrICgAKJwYHmDCa7r5bcl39KH0xOQEuZs3FWvw+ZfuF4vbKZFW1qkasLfEloMbhaVUkw5/tA6SHf5nV/iyx4CMedDJAcGX4FT4f2nLlEIo4t82UAi4yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728438688; c=relaxed/simple;
	bh=U8xSNJ5dGYvI85x8KiKwj/zC++K+YWgeKWVZpiKFf8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J3ov9nqeE3UXgYLIVmhqY+q+CU5ETXP8EpTjmSzD8WaypCYmZ373F7kesygESWjdAL19x9YiUxbHSF2xiDE+zp05l1nymMlhs9OZcRkqm2UVQgYYLatGTNCLxRItpiwSCWuJOXjcFyTFrXgbSnC2yCr9l3bedsjlx9nzLAmPyAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XV77vDXE; arc=fail smtp.client-ip=40.107.22.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxZdj4HofrrNcCCgRhZ8ZLqf+rdE4od2W8bvs2X9ZXe/l6zp7M5BkCE58f1vBAHP1Hu2dG35VA9aU7us93WRTEPxzNwRjMArMxMgmBaFXgi8Hzx4k5RYuqdWkIQEu09vDBeGE2EbwzxOAe0Xd3YB071n/6syG3nZUohoPLnKTRFGHPsH1SLRAImo2AqUb4KWkDaG8tNLeHvgjfxaK0cgwAq7xLNDCzoq3q2rSlrDjxIYRGbkFdw9lyXyd3wJGBqIUnccJSWGnggMTc9hVu7dA1lpj1bwDkV9wWnem5w7b1jox+Jdr/B98Gr78LVlLC5B2tE33LTjDKUv52gOAVuZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMu/CWHylRmWwsiK39A+p23rqdrwYhWX4c5KcJZiGg0=;
 b=fFj0BgkCUyCRIRuwSpBQfo7iMkGvlUgjJakCU4qz7vwcwK2CyViDrOHHNdF3iel8QV2O0/ehZ0I8Ai8vdKrUjkTayuehD9+hahiVspoJlcC4edisaneQUToU5M0MmVk2FlInGd8f2iCPJcUGp/KTgQpcTLnuCF527grqX96XVjBuNCYt5KekvpL/Ti9+A0SYysLPeIVTUc5JXAlzGhGLOcMSsy1wADIjHxzruJprbYoO2Z5io9/3hlkL6dagyNbEx2SyJMR1fnfVUriy/pHvA5fhO3tSR9uSk/YHR0Tu30be+pSauAqU2zLvRRgvmQuvkA5EQS2E7qM+o6UbYvzQrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMu/CWHylRmWwsiK39A+p23rqdrwYhWX4c5KcJZiGg0=;
 b=XV77vDXEjQWsppTTtfY/J51jDdoPSyMSFIL3YysUsAGA/lKnzKfuWc2f1CCXSHLLuz3//yJYn8b9jrU2y8M3sn+8t6kBnHgobv7bdq1Kj87rqVCSNpT1Vh12lHNVD6TTRnZe8MTfAIYJtl6Cua44QLKSb8gLNUmPXfc81Chvj0XsM5PG8JbV0k7uCy8QKQs49G5LZRKR8kGDP6F/kdxuu6DDdnMNtfPvwIAI5ugAH2OxAhIEyddemisXzgsBa1/ygmIiSQo+ja7y6auC8SxNcDlZ1D3Yp2i3a3mXjuc5PUU0EPT+alDw418GZtCi3lEWNNhppMq3AKz+mdQS1IGjQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7763.eurprd04.prod.outlook.com (2603:10a6:20b:246::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 01:51:20 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 01:51:20 +0000
Date: Wed, 9 Oct 2024 09:49:22 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 3/3] usb: chipidea: udc: create bounce buffer for
 problem sglist entries if possible
Message-ID: <20241009014922.j2jkn4inerqjqy63@hippo>
References: <20240923081203.2851768-1-xu.yang_2@nxp.com>
 <20240923081203.2851768-3-xu.yang_2@nxp.com>
 <9da1ef03-8e29-4564-9d81-4ac7cee1ddff@ijzerbout.nl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9da1ef03-8e29-4564-9d81-4ac7cee1ddff@ijzerbout.nl>
X-ClientProxiedBy: SI2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ffba27-9220-4bfa-b99e-08dce804df25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v5qjBY+rIokMmCBnrbCM0vqh13DRo44LO44Bwp9Ib+fyPGwYb+KIqYvaHwAW?=
 =?us-ascii?Q?hHZA4hxXyTkTxUJdKum2296RoxApm/stvC5D9Xl2S8gPEPmYpmAbiRsAp0FU?=
 =?us-ascii?Q?Nq//A/xHoVpTtlHYeq3+7DcofjB3bvXVpSdiCi17MK/NyxVVb5iLaSKG2mUE?=
 =?us-ascii?Q?18hOPlfZHq1xRCZvvyb5dkN2d7dve+JaKaJROrXjalxMpB0ypE/A7O0mC8M2?=
 =?us-ascii?Q?S0ed8XXd6jDdAY/mrb6Dl6wGWN1DE9ka02IRXwQGQxwFYMu8copXeXZvdcUK?=
 =?us-ascii?Q?XMRdyJ15Ac45hG1EqlMZvaNtc1rjK8W2zcVBe675YqcVEhUcM7QREfDwJwdr?=
 =?us-ascii?Q?0QixJmNwe3FXr6lQos6azCcwW03Hj5JFUVILBTPpKFz9TcYDXQfe2ZKULwy7?=
 =?us-ascii?Q?WRcDAlwq5bZ54uvtqh33DTYTi+lKoTazT5wYagwaZZ54yVucB/5PHp9AIgEk?=
 =?us-ascii?Q?bZC3UEP2oUW48SPYUl9sLdQ5FfC0rxUexRPhCZrU9lN+0ZeQzFsDB6SU35/o?=
 =?us-ascii?Q?OqIXa7A/iZRMF94aFOInj4MOXma/Ns3QVE0PJw+wPo6dBX/EuDDT4/+MhUwP?=
 =?us-ascii?Q?g0PyOvnkriKLu/huHcZ1ZsN+ppIsAdCVC+k6BY9UvPPuLLSDi/gGjtk1HxRX?=
 =?us-ascii?Q?T9BqPVpV1poYXS4nM0VjPT/2ytt53gw9FeeNSzm4VnJJCaVbiiNoSFjBRFDQ?=
 =?us-ascii?Q?zNf5IJM/S7hovfwOe6/YjqXly9Lm+ZIzGinsILTZoJ0lJqD5vilrfZOegORx?=
 =?us-ascii?Q?QPHsnbfusyt//gYBQ9BuqSQrkTVvN0tQ2uSHQrQP2yMo8u/w/YWNb4ITs6+T?=
 =?us-ascii?Q?zWR7F0Sdij6VuRqBVUkNBPkvAYjWu6cN1DBYM9+J6lURDoXKigOe+9F9dXZ+?=
 =?us-ascii?Q?9ZDVyP4uIzq48/wAsegCldY1+r68Qa0eGJt9VLcUPU6ghOqS7TTxCbAtAXSi?=
 =?us-ascii?Q?LjR5Hr6mosb015Dtoj7LAPDNGqx8v2TfStZlnp3AaVyP+mXT86L0Ua57AymD?=
 =?us-ascii?Q?pSr7chYdtMJQ2onZXtKlYanttHz50yrb1ar/ngcx/cf47Ft/fxEFSqneYTLN?=
 =?us-ascii?Q?MbJ7fvw9MeKpMGfkVZy9dwSEZxsCSof8JzDDPf55stsuTG5hl3R737Uuv9US?=
 =?us-ascii?Q?MzK20bjCDuioul0BB656b7D3DUv8YcZgJi4ZXUA5Ay+rPhbbnK5Xe3Pe22Y7?=
 =?us-ascii?Q?4RM4vyULqwQ9fGZsBWVsm5z9wNOBMgdxiFYBY6IA4tdTaVz9wponCP9yTlee?=
 =?us-ascii?Q?RYs57eCnjSv9fX0xV1KGZDeJ+3mgZZiY5J3vJ6Q92Enkop44/Lrn3X120A/G?=
 =?us-ascii?Q?EhJLvr1gRpKMGvk/mXk5kkT4gj0WhPUdV8xzqGRhpEFSqQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uuc6LFvpoiI8dst//9XnQXcqiwZtwhBV58grpj1pOhRK2o6QZoPKzLPdfDyJ?=
 =?us-ascii?Q?dZJZE2jGrYK25ZDm9SrpmRFJYdrex05L7NeBKSeTpTTVOAQbZedJguR447Fa?=
 =?us-ascii?Q?h2n+ntyscx4XyRrgSEGfkmCtZS1WgzDLLBprgMCOu/ey/71W5HDn24KF0Qos?=
 =?us-ascii?Q?ywbdodIJNuVSeRCl2h3JTidneM1tfLSWZPfGj84wtKzVZBwffKdqt452m6+G?=
 =?us-ascii?Q?HEsZX3tTYh7f8ZtsP8DN3lh2W4GGYCPWPiaDcxzcmHST8l7ZJ/iQAm+tnNe1?=
 =?us-ascii?Q?lv2D2fCxPUFpK2gHymqBbyU0VlYn3whnazPR3DlApZtKyiWyNw7cj9z5Ylvt?=
 =?us-ascii?Q?GnxBHSzS2k7MFnF+PM/zG0qFrtcFdkmq+EwMCtyWV56ZsKaOizoneKXieY/y?=
 =?us-ascii?Q?6SgBOAVmXU5qWnQUjRfkmgAodLCdm58UVfFdHWqvkCRfpLiDdOCK01b5dhgJ?=
 =?us-ascii?Q?gDzJEM0j8yXewY5salLxl7SDK9sOzhenL6d4bgeogJ5XciQWkyxezJEv/4UJ?=
 =?us-ascii?Q?Korsy5uXygV3vcMFO4e39qoOfK1ktZd5SgxrRXd4tSOkGkPtFGfu6lf9ofVj?=
 =?us-ascii?Q?gp5Zp8Zwwoxtm752MExZkEtXpbL0gjq9lvIvW7fiRU1+WA/9mBrEKd6vsoxy?=
 =?us-ascii?Q?sfbqINfrJ/YfTsOIggABnmk7iEORKxFJvaa6mQsGTyDIUQQb3f192wac16vA?=
 =?us-ascii?Q?3ioLiy0Q2vmqc8uJ+KUq/KvjpKhFdu4AbUMupHIFeVakvowgsYdAgiWBtVpg?=
 =?us-ascii?Q?JuWv3Yhk7/Nti0/2jsObnWmWTEmCZQXnvCrI/GTED8POr0fsSuzWCxv0050S?=
 =?us-ascii?Q?IgjkLwz+bTYY/ay7sJtbxF3HwfBbnPSlVTWUaSBPKuHldlYmq6O2+uBc0N+Q?=
 =?us-ascii?Q?jGHmWZuo778S3mMDCL122KLRu174P8nqwZNfuzu69+vFBmy5da02I5Klfsuu?=
 =?us-ascii?Q?2ht2DBnIzc7llplcznFNHiegdKDk/oa5JLkbitSPp9nlW37F4T7fTXXzAT3u?=
 =?us-ascii?Q?qtKObez87kK7O1BEg6RI+wiwPDw/loZczH5s8W1c45WcWRLzJMqegK27WpG4?=
 =?us-ascii?Q?ulcvSHI24D//x1Lli05S4PxroJ6U96WF7hBNO90MCIQ4H0quI2J7Pjkdf10D?=
 =?us-ascii?Q?ZboNm05LwDyu57LIaCeC+oNTQ1MXZ0xUeymD9F7XQ8jNh391Bn17q0T2E7a5?=
 =?us-ascii?Q?RD+Y4ZGlORzeQh7OzII5vevkl3mKSyrWJSj//aXHh1rqBDiefnm6nVTuijmV?=
 =?us-ascii?Q?HZgY/j0FnEUq6/jOW5JgACIimbYliE2rDd5LsOvET9FQqfSeFcZLKgNFt7BY?=
 =?us-ascii?Q?TZ5SpB1/bGKTWGiSifSUE1urQsu/pSebc+l5fnGBvznOorvxL525Da7BdLnQ?=
 =?us-ascii?Q?Q7Pije3m5Zai84NmKegZLkqDJzlByrvJLwhJOTCYUKSIjyr6uyEnAqeoQm72?=
 =?us-ascii?Q?sJxR4dpTjmtV6MBg/T7Z/6HEul9xpKK0UP7hveVMD2VWGSSaHT4LIfJ9Z3e+?=
 =?us-ascii?Q?qXh+Ag9NTZQq+pwF3VrKijHC2XfRNXK5vcy3eW4RXKTDmybImkypZCRDZ021?=
 =?us-ascii?Q?sLZpsyz+WXu8kYJ4Jagu6fOsiuS9a919a668Ehg0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ffba27-9220-4bfa-b99e-08dce804df25
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 01:51:20.3566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2yrTs0Lxtvhr2JXh6rQJahJjlp5vcL1oFHBq8ezSoqoWM8K1TjN0H6yJMsBcFXC1/PQ8s4kqC0LATHyrratYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7763

Hi Kees,

On Tue, Oct 08, 2024 at 10:27:15PM +0200, Kees Bakker wrote:
> Op 23-09-2024 om 10:12 schreef Xu Yang:
> > The chipidea controller doesn't fully support sglist, such as it can not
> > transfer data spanned more dTDs to form a bus packet, so it can only work
> > on very limited cases.
> > 
> > The limitations as below:
> > 1. the end address of the first sg buffer must be 4KB aligned.
> > 2. the start and end address of the middle sg buffer must be 4KB aligned.
> > 3. the start address of the first sg buffer must be 4KB aligned.
> > 
> > However, not all the use cases violate these limitations. To make the
> > controller compatible with most of the cases, this will try to bounce the
> > problem sglist entries which can be found by sglist_get_invalid_entry().
> > Then a bounced line buffer (the size will roundup to page size) will be
> > allocated to replace the remaining problem sg entries. The data will be
> > copied between problem sg entries and bounce buffer according to the
> > transfer direction. The bounce buffer will be freed when the request
> > completed.
> > 
> > Acked-by: Peter Chen <peter.chen@kernel.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >   - judge ci->has_short_pkt_limit
> >   - add Ack-by tag
> > ---
> >   drivers/usb/chipidea/udc.c | 148 +++++++++++++++++++++++++++++++++++++
> >   drivers/usb/chipidea/udc.h |   2 +
> >   2 files changed, 150 insertions(+)
> > [...]
> > @@ -552,6 +673,8 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
> >   	struct ci_hdrc *ci = hwep->ci;
> >   	int ret = 0;
> >   	struct td_node *firstnode, *lastnode;
> > +	unsigned int bounced_size;
> > +	struct scatterlist *sg;
> >   	/* don't queue twice */
> >   	if (hwreq->req.status == -EALREADY)
> > @@ -559,11 +682,29 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
> >   	hwreq->req.status = -EALREADY;
> > +	if (hwreq->req.num_sgs && hwreq->req.length &&
> > +		ci->has_short_pkt_limit) {
> > +		ret = sglist_get_invalid_entry(ci->dev->parent, hwep->dir,
> > +					&hwreq->req);
> > +		if (ret < hwreq->req.num_sgs) {
> bounced_size is only initialized here
> > +			ret = sglist_do_bounce(hwreq, ret, hwep->dir == TX,
> > +					&bounced_size);
> > +			if (ret)
> > +				return ret;
> > +		}
> > +	}
> > +
> >   	ret = usb_gadget_map_request_by_dev(ci->dev->parent,
> >   					    &hwreq->req, hwep->dir);
> >   	if (ret)
> >   		return ret;
> > +	if (hwreq->sgt.sgl) {
> > +		/* We've mapped a bigger buffer, now recover the actual size */
> > +		sg = sg_last(hwreq->req.sg, hwreq->req.num_sgs);
> bounced_size can be uninitialized at this point, if the earlier if condition
> is false.

If sglist_do_bounce() isn't called, hwreq->sgt.sgl is NULL too.

Thanks,
Xu Yang

