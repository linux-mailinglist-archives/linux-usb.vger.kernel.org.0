Return-Path: <linux-usb+bounces-21126-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10350A47600
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 07:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A792A188A799
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 06:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBF321CA0B;
	Thu, 27 Feb 2025 06:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VdKvW7Mo"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2073.outbound.protection.outlook.com [40.107.249.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6240E21B9E6;
	Thu, 27 Feb 2025 06:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740638278; cv=fail; b=iVt4rlOjziA2Zpzir2ZgKipOgBsRbbzVlGCAwymZFjRsYrQ0749hKolprEiwHQkTI9GOI+QpXso5jGwXeiIHbHbmp3lXz/NAJm2XBxyiB3lGtyldgWWh36HsKr3b8S5+//IwO0CKyDml4I/NXjyxEgS4gPaPBzfZuz85Zcx4sis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740638278; c=relaxed/simple;
	bh=tcA6+tYyNn0SQ3A+FuqiaSFY18FZqclecJi7GY3uMvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y9o+RbMBAJxyWYONdsJGVNLE2eSJf36p8evOvxi2MWTFkL5Kq7HFAYrYWgzOVz/6ngg/oen7Ux5dTLWXU48jRSDQp+tyFpqSOQR6RDOXC8xZlXwwl7rcTKpRkcVxbbMWHfGMsBv2Iyz9VYwHaSI5PCKlCnVzHKvZ5gziUyQou8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VdKvW7Mo; arc=fail smtp.client-ip=40.107.249.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFQvEaeXHgrpLP85Vrgl5gDl8jKHilvVbpzRaXdiIzPSh8fcsphfHeyXVUGwPIW+GDtBHkIDStpNiHKzXDxp86fcLDMUsZmp76joMgM1eBlcE4lfL27E3JuRaChWwl1MnOU4AuQH8BAKaMDPKX2/7xr4D8siwdJaMxV7af9LueXxlefz7bn8WYl6L0BJuyI6Vfd0g5kiWwtI7X3yBFrjHIIprwc3gmQMn3fTMYC9h+p88bpT7fEzOrYT3qBv61PR/2z5WBH1t9pTa4evs/9r1aFTTsYAJgguDS9LrOmhWP8JUXuwp1EQjhENl5eESHYTezGd5jwE3o/Q8SR5E2q0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kPdZ7qiNC933qAOzLf8T3Q562IwszDb1rIS+6DtgwQ=;
 b=SPlsg3c6H00KL5QdxXpEkmXjW1eFtbsdp/njr8etTYmFVk+Cz0rQpDvhPUh4N+GpWzrgSBLbmPbVFyLQgHkReY5gUOBVuuRP84/ZvGDVXQKZ/P4VlRbRStzIV+vjpmf0e1m3Ipf9OnOGiwz3dVml3X60ORUJmmp8K5LQUh94YVjKbVrWLUJr4K3mPclllA2C3wIwxdFSffivniL83uhmVXMnhKyoSf21OzW3zxxMHnonzAvASiC9VuynPcmxqHkv/hk0HP0j9/HZDT8KEzDPjJ5h175Ua5ilvmr5feUs/eL4FNpsSHKpXN3kzhwFZaYRmNbOqpwKX/S7LkBWQ4kVSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kPdZ7qiNC933qAOzLf8T3Q562IwszDb1rIS+6DtgwQ=;
 b=VdKvW7MoJuTWTl+w1DJF31k8ccHZcfcb9AvWI5Fj0+wuGWhxvspkR+OsSiSRSFHQVkmR8jn35yr5/jZVoUmOedPCwZlDr8u3o0vAFhcnXxUDVB+LtTqJy38u/3psXlfzFUnKIn/TL9H5hs/a0u9klUv80wxD4D9neWotDusmSbYcgrU6EyuepbtO7OlmqJ6TNRynAAJp24AUEd+vlVlGWdcXF2H4pU1gOCb5K3BQ9xncPZ8ih0USa781xo4yOpVPygiXpK3qt2oz2h3MSCYQstN+iYg6xamAR6ohQIlJbicwHSHFqEFOeZ1I4fEWNZ2M9QDg5+ZFrjCBdy4EV6nwLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7873.eurprd04.prod.outlook.com (2603:10a6:20b:247::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Thu, 27 Feb
 2025 06:37:53 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 06:37:53 +0000
Date: Thu, 27 Feb 2025 14:34:29 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Peter Chen <peter.chen@kernel.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 4/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <20250227063429.zlegnotxievb2pfd@hippo>
References: <20250225053955.3781831-1-xu.yang_2@nxp.com>
 <20250225053955.3781831-5-xu.yang_2@nxp.com>
 <Z7_bInsND2BpyOdX@nchen-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7_bInsND2BpyOdX@nchen-desktop>
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f69db7-439b-4eb1-d7e5-08dd56f94326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LvY5fgj7oAMR8jVAGMmV4j4vWFdOOCQyZx6O1VN0seVjrRWJRP69Lg5bPxeM?=
 =?us-ascii?Q?nsVC6l1ry96dvEEIcytQ5E3CtT+SlYPYAHk6nJU9PO9Baf8fkZE7GjVdoTJO?=
 =?us-ascii?Q?QeUu+BWyEzou+loZYw418bh+pUljmyO4yavkACEv5zOlGZEAvJbGVFXYhr3t?=
 =?us-ascii?Q?FlIKDbKMC1BeGvcVupS1X1wXOhqoH6TNpqcLNVBWmdUbdynBUy5u9lbsYrUq?=
 =?us-ascii?Q?Yuw9Y8fht5MSNAxGZDRZ8RcZYtMyG1idDHloMFDaT/OM5fzHH/YCwh8bEYf6?=
 =?us-ascii?Q?Zpli6oopGeG1CBnAdOSCJ1wPlPnludC45ll2lxN2HRyUuivqYaqXAYNdRc0q?=
 =?us-ascii?Q?EH0+od5O7b+uvu3B8QhxhNoUHzClkalJRlBM7n/jcESqkOjmRd/P5wYfIORG?=
 =?us-ascii?Q?t61PbYmdRAyonUrm4ndb5Aaqun9uCz/dJlpaEtHbOUk7P5dyQlGF9h4C37Dx?=
 =?us-ascii?Q?uwKCjaDByb197yw2bi62o9da+LhAnOAs8URzcYR6yt6WMv5PS+3dqFKdhi2M?=
 =?us-ascii?Q?vDu/9M04lADFW15Zkz0dB8ZhVLF1DrBoo4fhBjBEvTjnifYcthkCWLjwfltl?=
 =?us-ascii?Q?1uRB2iNPRXSXh4v2tK/7kEri0z3cYEqpBlFy6xGXMuDLmLeEl8e2JO0kwXHL?=
 =?us-ascii?Q?1UyfCUdX25u6rbDP67Yvo4X5+rdCEP0JbDv4Tcd3KV2x1IHGztUA3PsSpBfv?=
 =?us-ascii?Q?u8Vg6mYwQ3f5JXEw1tLScoAiZpUJDcRcKYjcCQxDqUM0X0Mp+PEIVs43CjPf?=
 =?us-ascii?Q?4n9HVEgwCrWfazfJhcrkDOvKlqdxKH77BmSDm6jK74ek1mRsWZBkFYYbkU/o?=
 =?us-ascii?Q?nQp6bSSNxgkiSUjhtrHsbsjTM0s+zwrw7CohoviQWg1HhRlOEeqjsfPmeUO0?=
 =?us-ascii?Q?BvGpRnZ9TV4vup78nYcN5fnDwLShqMsnZd0cQAlrryeA2p0auYqWcMIsHpFk?=
 =?us-ascii?Q?/Sh/oltfR2/G0gypvvjsRlv1tpV6xTlQmvCNHhd0zaSSLMLmULqDkHDLith9?=
 =?us-ascii?Q?xOOGgrak1ffWOxlcpmTDDG5DWktF/N5PUHBT7w/KscilunYLJv0SNUEiSqds?=
 =?us-ascii?Q?yX4UEewVP73fAyTGC2vxSdXZ7NRHRaqZZ9tbs6UTnPnO6cpVcb1/aGsR10sw?=
 =?us-ascii?Q?gNdCSB4e3XJ85faHS1pjZYhekJaD0EiUwQKD4p5sOvm8g9WO78NLfDJktVzR?=
 =?us-ascii?Q?Xelt9KQ7sq8xibIm4aVeL+5zJCjxCFSPfDHM6Hbp/lvAw3b9u3PlP18i+x8c?=
 =?us-ascii?Q?Al6Bjdb0gBZTxT1ud5RqDAl+ZvGHvAesvi8vUxI/Bz+map+XLNMieK6Si9Al?=
 =?us-ascii?Q?EEyj1OD1HUY2aJVV6Xr042c7bi9pYgaEBA0h6bgDeOeuXsGovb6ppsxqT4dI?=
 =?us-ascii?Q?wMEFHwhWLCAKAf5c6v0TxJk3vJavZakPekiB8j3uhFzzsnTrdw3cIUdT7SDE?=
 =?us-ascii?Q?bd5LF+BnjU0xZ4NL+TEp3yPb35suWKvg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3dgVwm+iTZ7cwxCcDoovlSN3Kzflt4tflXipuJjZNPpfK2ZN820+HrQzrBCt?=
 =?us-ascii?Q?3ubVJUkalulpt5Pf3JP4HXPX42aEPljPII8SSN/kFHFMTmcAiUfnTOhI0RHW?=
 =?us-ascii?Q?sWNxrCV7HA/52gKrlRKX+AbJUrh6JVYkLWegaB9v7IDkv9Y3jiAtHpRmQTBt?=
 =?us-ascii?Q?EQUi+m+6DXCIbuo1O+X3A3n4yRhIz0pMIMFm4VxJ+k+En55ksuEEaNimUWYA?=
 =?us-ascii?Q?0fRmIriYqO9BcTAhdO3YIliJOrtPQfJ71j9q+/pPfbAn22KvSNTGKtxRBgyF?=
 =?us-ascii?Q?Ye2Tpg2/sRj6LZcSkl484siVs8umSuUFekyj6aDE9cB10kBpvt+NcAs9Ogbg?=
 =?us-ascii?Q?pOybwF5fmCunaPLrzSN5t1399omsa+gLi60LHv5J/y3PiO1L4um4832Y6Kfj?=
 =?us-ascii?Q?hMm2GDu5OR1C+8Iy25GDvjjMyzX2wzfRvq/g55b/sfu87BUzoDrRT5C7Rebx?=
 =?us-ascii?Q?Ol/sRHqD+w+bdbjFUJh6bcEHIrSthHAmmpxRrFYNDhmsZtN7GpmUZ9YzV6oc?=
 =?us-ascii?Q?3cZ1B4kjWvmT0v0IkjMSRZHZkuCHBnwDsQrQhwgVrnbhOVFl/4hG1RCgtFAw?=
 =?us-ascii?Q?4OlJiUkzfnF4N5QV+9uTKa+URmDyjWl1A83U8wuUPx+ijH3wQe45AuqmKrLI?=
 =?us-ascii?Q?u5vwY6Ls6B4Hm1pnUyrwNXd5UD14Wil/Ls8+0GkEbSdP9EdgCTyGGOtBAI8/?=
 =?us-ascii?Q?TgGYQ2AgYLv75PIxm39mu6oN0C6edr/Suxf0kze656TkkXfhdYvF9yUrEzbf?=
 =?us-ascii?Q?Km9HAHt/4ApoB3lzvmhCgJfgq30zoGv4bbTcwJsi8k7gERcDnzY9eH9qgerz?=
 =?us-ascii?Q?FfHML3U5H1kzl8SCz2R5xRunMfzeLBE+knszBwGfchR4aA4TGHVJr7ssNrV8?=
 =?us-ascii?Q?tvhh7AQkdiyGA0iLZSIq3N6m87SrbfMau1UhVaO/wpt27jcaQqaLrJ4eKO8i?=
 =?us-ascii?Q?WA8kuJgW74fXN5Ir04BPaTv4gkaAIz1Oox2cfpaQ404vFeOeGtN0mE9375jI?=
 =?us-ascii?Q?19MPe/BPXeR6JRu2EZ0TRmubZum/3N6x5y14XSQTnibTG9eduD6IodDx9nUM?=
 =?us-ascii?Q?Zsd7QOnM8GkmYH+I1WRVQMMRoHrEgIgsr2h308N6Gr2e5+AILvyZ7SZI/b3+?=
 =?us-ascii?Q?7DUDet/NXbLqufHgBk25puernO5wIemGsCBm/4HSzxV3ZVWkuktf4NxJsHef?=
 =?us-ascii?Q?YaBQSR2hpMCpam3drrxClo4ihuQ6yBrPw6cNo/kD/8f7KYj6eRH9RPHeFjzH?=
 =?us-ascii?Q?ydpK2DSHrONDb4cmdMKUWy0KXqHvQlsHYsyylTBHcGfTxehdraltyWBWfz41?=
 =?us-ascii?Q?WAOtD485vsl6FVSXvXJMbJpW1L562oM7nHh6p6jqgpkURcPv6Bl+QNHCWKsb?=
 =?us-ascii?Q?/0esc1+hnjVTO/fjVjmBmBFRLK3m5W3scbv5iciNxy3tFI3FH5bEaMGLx08s?=
 =?us-ascii?Q?RsDX5vDpzzlaSY8qWf6qBCH2+yWj4mp4bcFAl8ZebK7lzg4UMJGgIz3TVSs1?=
 =?us-ascii?Q?nodj4wQVI1pTc73+65xINlt+QXnetUTa77pMR7Zu4v6YwChXmHfrciLLbYiI?=
 =?us-ascii?Q?tR8v77XgljpJklTVZLA9vNQwZrlaFmvnx3RBhKHO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f69db7-439b-4eb1-d7e5-08dd56f94326
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 06:37:53.1032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbzn0xVwxzPh3VtQbzoeCvaZvwPiPzwq6DqFhHMm609ov7YB8gepg7AttwEUu2yZcWZOdk1gd57OYvDMLTHivA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7873

On Thu, Feb 27, 2025 at 11:25:22AM +0800, Peter Chen wrote:
> On 25-02-25 13:39:53, Xu Yang wrote:
> > In previous imx platform, normal USB controller interrupt and wakeup
> > interrupt are bound to one irq line. However, it changes on latest
> > i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
> > This will add wakeup interrupt handling for i.MX95 to support various
> > wakeup events.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> Please fix the build error, and others are okay for me.

Sure, I'm going to fix it.

Thanks,
Xu Yang

