Return-Path: <linux-usb+bounces-30009-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED796C2B932
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 13:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D0D53B5006
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 12:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E462FB99F;
	Mon,  3 Nov 2025 12:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iv1JwmIQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AAD239E9E
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 12:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762171699; cv=fail; b=bI/zcG4Y71GV8wj8tCuJQWdj3bFHvgVdNbU4O5CQ9cxd2vjksJXcAYl8sJxHp9dPZ8KcFXwUDcoIk3uOOiPqEpHYyxgQpYwnv0NxPr9H2OnsABjbGHeEnWIV492Gw1VCW4Hb2c+OfCCBw83sd6rDhvgXpQzPiSQA97BqKKDVuEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762171699; c=relaxed/simple;
	bh=J4ilLQxAUoGnJlTI9e40YDppUclzy6o5sKzZgDBjpK0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WOdYgBVz/9nA9CVq9kIQAN/9xne2IIfXsaW6YD4b3fX3GEyVqKjFESnKWzkPRRBiRQrbWLHwArsMO8EyoCglJ9Vs65H2SrxuJ1qQh66t9DFi7V8QrMY90fGUJdeKFeL3ThxNJhSu1CX1CS2ZU0aqo3v4/Th3bc7/JnXEEJZ4Ya8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iv1JwmIQ; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762171697; x=1793707697;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=J4ilLQxAUoGnJlTI9e40YDppUclzy6o5sKzZgDBjpK0=;
  b=Iv1JwmIQoDZFcZJFRuOycjg1tVf3Qg6fVCzv0Ic+Yc709DY+4l4Wjqn5
   ltRQ/sxRyv0uoex1tmBHVO4gDKTk/w8o5l2KMkQ9pWUhCwf6oRa2soFlr
   7DpXEAloAkCnL+Xg1Pyh3WgL3JH2VrWAktWZ+fLpLXShHnzNZbtSL/56j
   qtr89IM6l7Tj5JRYp2YjbU5H1rGZ3OabIZy+wtrnGqm1dgdckpDqHNe+/
   FUbVmSFpbPVTFSmXRVuR4824rbdBURoUC4qEB28av+WIKMq0GBAjaSLuu
   8ap9kLpkis1fAq6HuOHiEjevOvlSlEmisynasKyi62fxUzY6BV3vVK/Ub
   A==;
X-CSE-ConnectionGUID: 9F/CRRZKS52pcUci6CQK6Q==
X-CSE-MsgGUID: K+O/XLRUQcCbyMNmK5uioQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="63259296"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="63259296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 04:08:16 -0800
X-CSE-ConnectionGUID: CZn5eU0JTWuzBqppMHVOlw==
X-CSE-MsgGUID: WxUR3Yt3SLCdGKAYe4nfKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="186530655"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 04:08:17 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 04:08:16 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 04:08:16 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 04:08:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1mhSw+ARjW1vkreyXrXkreyPe8UbRk54Z/LWnWQTw3eCyePLfpZbSqHKHrx1cppvsVXLuxWIRfRgzzfbm4aoKY4ytZte1M8vYcZxS4nIJcaB8ozjt7efyJ1vHU+40GqXSbwEgdHnt2Uvche3G35SH1lfKBJl67DH7k7D2VIZgiPOZUXTLTC7TDCJzR0+fY3BoSnT/pL+yFn+Tn9zqSzIeZwikuYAfDaSS7DUAv00HcMDOqCP02VeGPjlUFzI+hOpYS7uaGxVMdj3hHVQ9zFrX/Thhd3q5cKOWOb+ItD9jAlsGgoN6OF+34G6wcOwZ78RFK7IwarR0kVRCtfKiMEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLpaCxR5n8ZdOstA6CbtoxIrDFC3LmaB9PYtYWOafgA=;
 b=JLU639cMwqdlh9QHSkepiXEq+pAK2aM4SKKOjUS6ERdbNVnxmzWWdPNvUWB+dTliRvfCMiMpjN7SxbteMR/+Hxmc/YHf60axmbS5vdsCPu/WmpFXOhRN/KkMdMF7aYWUdCQGKYOSI9zM1PPk5fqo74ecIVqnRs80iQPfSRroKYtij/eVfPI2Z1gvgPpaHGuce3EKz1TyvxYz0bZfwNlgmJPK0HwxtaGK1u8spEFUcxA/8zjZ5nhvhyCDCcAKvboxDP6XGJq/VCnhjL90X+5RYqKLsA4XXbPeaK7GP3q/jT8luf9CFhaWkSZ4h1x6ElO4rPH2XmJmtRAhrofRisERXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ0PR11MB4991.namprd11.prod.outlook.com (2603:10b6:a03:2df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 12:08:14 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9275.011; Mon, 3 Nov 2025
 12:08:14 +0000
Date: Mon, 3 Nov 2025 14:08:08 +0200
From: Imre Deak <imre.deak@intel.com>
To: Frederik Schwan <lists@tty42.de>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>,
	<linux-usb@vger.kernel.org>, Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>, Mika Westerberg
	<westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: TB 5 Dock DP-Out non-functional
Message-ID: <aQibKLARkpPVLckj@ideak-desk>
Reply-To: <imre.deak@intel.com>
References: <q7k73t5utfjrpuf45ynig72eojpixepjqccvsfaqt6rg4wptst@se6ekc2eg3sv>
 <20251103055659.GD2912318@black.igk.intel.com>
 <rnp5dzfud5feidxi2qx63cxezukyszuzpj7v5f5gyoqtys3uff@e72nlrudjzxb>
 <20251103102639.GE2912318@black.igk.intel.com>
 <lerwgbxoidxvfv3ajszi467rupujg465ukh3fcokihxpv2ikjr@rbke2a76anld>
 <20251103112648.GI2912318@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251103112648.GI2912318@black.igk.intel.com>
X-ClientProxiedBy: DU2PR04CA0024.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::29) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ0PR11MB4991:EE_
X-MS-Office365-Filtering-Correlation-Id: dd614fd1-7f34-42bc-bcae-08de1ad1aa0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?94hyNvFslK/4KTcACLmYOJf6PoTug1t1xw+6tRvjAyKdIJ9KabwLU30b5N/i?=
 =?us-ascii?Q?4Fjg1hPRvr6B68+0dRqEPY+o4oFkUFecxA2OAK7pXfd8t6k/4Ppfhd1Rcoll?=
 =?us-ascii?Q?+8PwCGnpCztyTTVYeMYjkiu9SItI/vFTpROGYCJuE8TN+dijuFe8UXYvS/N5?=
 =?us-ascii?Q?VbsM6/cXRYcdG5VAbazzYEvm5Gnh5SCEaY3lYdaff/kCF3E49dxfJ3bNxRrM?=
 =?us-ascii?Q?sVCWKxUzP1ppHGGhskEkdcLcFVvrIhCzzB5ljqYMCHSESnvUmjibdgqlucw5?=
 =?us-ascii?Q?njh8/TEDtlc9IlAvY7v0UYDhJb5haTbco8ydPqzUzl5l+P260xwr52wYGT5b?=
 =?us-ascii?Q?YOpRpo8ZhuBdSFRw3OOvJi9nLtoXLEnAsatsdunoic9kJegSQMd+6KPEBmoo?=
 =?us-ascii?Q?3cdkw0QWzAT+GZ4MEG0W3IYuh8PGfbuIiJS3Q8CDwsce7vWlGMTfZHFZWdLy?=
 =?us-ascii?Q?qCiEEQ+1iUKYdrlQUmn1IjZfPj8tB0ZzrAuM4g/RcHnOHNfbK+AAGfo/kc3B?=
 =?us-ascii?Q?ALLwQq7Z+FMBp95U0DVxSA/jXcQdLbu/3zXGQJuaLIEAvG6moU9dFtCf/xj9?=
 =?us-ascii?Q?vyhDRZzsmtazCfZ/01RPlJsb7TYc2Ak6cliJeHVnRbu4zeO512TEsZGjfE0f?=
 =?us-ascii?Q?G/x5AbhHLFAKH/0GQgTxyLLCIXiSZ/Gx58PP9gOfNCsw3tDRihG5TFKrCM7H?=
 =?us-ascii?Q?pcgE8g3cOiOsislh67ijKmHAeejpV89CGWQ9diqK0prj7Gfd2DSFeX/u1pjL?=
 =?us-ascii?Q?DxpzXPvx1uEu/maQxsKnInruPJS9wgbwzDGvDPjX5+9u2OB0PyJI5Q61eDVB?=
 =?us-ascii?Q?DlV9EDRl67TQOzSOdcryIfcYADU8UD8waqeUhdMhd7SGxJB/lhlVpSaMx0A7?=
 =?us-ascii?Q?4oKUUxr8u8/+3ydmuwSoBuaLHCuzIdgsP1h4psednKwYDODWPyryoBYhy1WT?=
 =?us-ascii?Q?f6srdPcDlZo0Q5L8soeEaimGDj5cTZu3v7IDKday2mPk522C4q7//UXJ8W8Q?=
 =?us-ascii?Q?J7nC66YHhnVi1yEus8C7TLNY/64o9NRbVUqx+2zoyfjYgxawkrfyZv/3CtQm?=
 =?us-ascii?Q?3L03dBDV60YdfaKPtWrl0EloL0p/r6Xrpj87xB2sD7bPAzJkdjxlhLZoWGBs?=
 =?us-ascii?Q?oTvqVYfWC03ifsGpfKGWw8T/+/WBRv6usKS50bY6dHmPBxRCmOFsRdNeE1wj?=
 =?us-ascii?Q?tXqz7beizGQKo65SiRVNuio5ICYNJ2WnPd0lI+RWQLy1lPxGlmLE4rN9lXkK?=
 =?us-ascii?Q?SoJ0rQdReTObfW+g+OcSiVmJUx6nE4r7GO4s8m6gzMB2lkLxMPKoOSp1t0in?=
 =?us-ascii?Q?Jm6G2pSjfDLAajYc8KiWp8k+BGOFtALBpl3hIDhNWeJz5igFbtiZayuBRpkG?=
 =?us-ascii?Q?OTtK/CmI2RoTCbo1xHm0hICMoc8noYqM4Wlb8DFiO5+08y62Sg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4845.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Z6NIJzpXSj+wN5Ibt9wHJA9ELckzzBtiWGNvpgP2jAPRV3ckAfzKOnYLptm?=
 =?us-ascii?Q?6MFcCxSQu+dyStU/q94M1VavWLXAFYfu8xnhPg3o8lWqYQ+xivCudOXJeSxv?=
 =?us-ascii?Q?WDPv3KAOITzxDm8blLc5Dlq9MCVpLm3gz+DtqgdI/rGz9awm8TY1L24sBLEu?=
 =?us-ascii?Q?AWFMFRRCGy00FgrZQZpeQhg+JixHjrdfIC8dDQ192mKFQPYW+zij5Nnelb49?=
 =?us-ascii?Q?zZCco9QbYYF0xhq5wiFgp+pCii7gwY8mp2hq8uhPlxahtVujJ9V8nDJQcMCF?=
 =?us-ascii?Q?FNWC5IZ6VM+PLVxHzwsCFCzH8gMtv54LQ8U3N6Gf3RmFw3WjwwIa1f1ziB0a?=
 =?us-ascii?Q?tzfeA5iY8BdpVJi9nTOfwrcQWw7ZIO7it81ZrpJw5Ct8lt/RDpDNO9SOTldE?=
 =?us-ascii?Q?Zzt/0ty/2pwqGvti23NO7XguzlYtlFvrMhnJw+UMry39HtHkLV6BmpZurul8?=
 =?us-ascii?Q?n17QZp22J/UP+OYsS392ZnbQXmFvnpqCxCpxnvZRmyZnbWQcOIm6XsNDtVhO?=
 =?us-ascii?Q?z1lQYI0OFSnaFyDiaTK5v2Q9PEGJnSeeofHL+qFGR8S4/eerBXcQ6YpQaLEC?=
 =?us-ascii?Q?i3TA4NJZUgaimpgbvV91DgbxNtwyA4WtPNeMeYzhiInWhIPmLgk76J0jArKt?=
 =?us-ascii?Q?DYb4cUTDvwWQ8X47LQ9uu6jRenYcdHJVmKl2lRDQryj38DwkVLT0jn0h8Cmj?=
 =?us-ascii?Q?k1EMHMYUdsQX8XJ85yyjcFurxztqLCqDwk112i7rE/HCGv6hRlaCOhgguvN8?=
 =?us-ascii?Q?k6BRupLj3zeggkkrKaumIGOzA4VUBO8v7EmYKRZxwcd0zfUIgJ7mDq4EYNwW?=
 =?us-ascii?Q?+qZfi22G15VvuU1eMQGMubmrrs2OkgjJh/0rLLDDOj5d4yn1twwcCPghc5pL?=
 =?us-ascii?Q?VaXV2WARmKrOo9b9EPHN6ovW8E42FNK3rUfH+xT8pyOPutWG0IgRyEo7zE+C?=
 =?us-ascii?Q?1HLX3Bd/Is3l2lJis7IOabJWFTMpjupbDDldUQRnuQPxifiyDoSYM7RQxU2v?=
 =?us-ascii?Q?kN8UAeDwq8N8vYk/YMDscwENgOehhPR8ewrtgsy87xAfbOMXSHsMW9r6N6bj?=
 =?us-ascii?Q?Ynals1Oz97lbsqnwBfd/mKhb3lULLmRxMAhpzDvHJGOY+xvsN2T06HZdejyY?=
 =?us-ascii?Q?tyMiIOWzZVcjvzbPvX/PBdDBHaWuzFUPUFOo7enQLvCepcgks45nOjQUt0ZQ?=
 =?us-ascii?Q?q+vE1M6FWZTxsDPp7mzkd3fQumzXjdhtJtvB2HSzTy+RUXsin7kJN7WggJo2?=
 =?us-ascii?Q?sPOrqIf8lKMCJo3ruXsbQZarYHopZ+jDxQNYD/kWmaWsEjJGRe5gA+Ghotlw?=
 =?us-ascii?Q?dyzP5TFOojExtXGc7FaQmimm/+klfeXpJrAweV0j0WFw+Lxyrxdxt3hM+thn?=
 =?us-ascii?Q?GNcFLpGOZOdAAgZ7D2pIjH8e2G1+wesdB88KnGYUjy9uH5ePPc1o8zWiYhQe?=
 =?us-ascii?Q?aAZQl5r7XcfZsVZB8uwITPoOHSUhV86fr0Z06c3nPijJk26YC2IiYqR+96ro?=
 =?us-ascii?Q?hREsgqvFOOVRDHulteMNSEQ38z7WUQUYXAfkG+lBuLPo32/1bvZDBbEsrg/s?=
 =?us-ascii?Q?pLrGqCVXkViFFlo27hQk9OkY4PeT+TL28Lrn8ReTxJavibqPlDQIIKZM9pTf?=
 =?us-ascii?Q?sMGxicvHYO968qfeCCSPfknyK8nOa8HdVdmGpzF9xM4M?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd614fd1-7f34-42bc-bcae-08de1ad1aa0d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 12:08:13.9800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coUa/+NTU4IIh2fq5iRcEc6vDlT5wLnu138cvk8H9K64N4WRzd4SrJbNsSb+u87Z8XbSFMAPsyah0VQu6KfOKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4991
X-OriginatorOrg: intel.com

Hi Frederik,

On Mon, Nov 03, 2025 at 12:26:48PM +0100, Mika Westerberg wrote:
> Hi,
> 
> On Mon, Nov 03, 2025 at 12:01:06PM +0100, Frederik Schwan wrote:
> > Whole log attached.
> 
> Great, thanks!
> 
> From that log the last BW allocation done by i915 is 12.5G:
> 
> [   51.572497] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): bandwidth allocation changed to 0/12500 Mb/s
> 
> > > Regarding the script, that's odd too but it could be that you have more
> > > than one host router there (it is not clear from the truncated log). You
> > > need to build the tbtools binaries though.
> > 
> > I do package tbtools for Arch so these are available.
> > 
> > tblist gives me:
> > Domain 0 Route 0: 8087:7eb2 Intel Gen14
> > Domain 1 Route 0: 17ef:a583 Lenovo ThinkPad P1 Gen8 / T1g Gen8
> > Domain 1 Route 1: 0108:234d Lenovo ThinkPad Thunderbolt 5 Smart Dock 7500 - 40BA
> 
> Okay this has discrete Barlow Ridge TB5 host router.
> 
> > tbadapters --domain 1 --route 1:
> >  1: Lane 0 (upstream)             CL0
> >  2: Lane 1                        CL0
> >  3: Lane 0                        CLd
> >  4: Lane 1                        CLd
> >  5: Lane 0                        CLd
> >  6: Lane 1                        CLd
> >  7: Lane 0                        CLd
> >  8: Lane 1                        CLd
> >  9: PCIe Up                       L1
> > 10: PCIe Down                     Disabled
> > 11: DisplayPort OUT               Disabled
> > 12: DisplayPort OUT               Enabled
> 
> And this confirms that the DP tunnel is up.
> 
> That tb-bandwidth.sh script should work too (or tbtunnels -d1 -vv).
> 
> Anyways, from TB perspective this looks okay. Not sure about graphics. Imre
> do you see anything?

Could you please try booting with 'log_buf_len=20M drm.debug=0x10e
i915.enable_panel_replay=0', provide a dmesg log after booting and
connecting the same dock+monitor?

If the above works around the issue, could you please try if applying
the 7 patches of the [1] patchset fixes the issue (booting with those
patches applied and without the i915.panel_panel_replay=0 kernel
parameter)?

These same patches rebased on v6.17.7 are also available at [2] or in
the latest v6.18.0-rc3 based drm-tip tree at [3].

Thanks,
Imre

[1] https://lore.kernel.org/all/20251015161934.262108-1-imre.deak@intel.com
[2] https://github.com/ideak/linux/commits/fix-mst-dsc-panel-replay
[3] https://gitlab.freedesktop.org/drm/tip/-/commits/drm-tip

