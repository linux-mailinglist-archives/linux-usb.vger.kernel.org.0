Return-Path: <linux-usb+bounces-35767-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NAHFlPazGnnWwYAu9opvQ
	(envelope-from <linux-usb+bounces-35767-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 10:41:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A47376FE4
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 10:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0229231B7ABD
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 08:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1543AF667;
	Wed,  1 Apr 2026 08:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jrouTvAW"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010040.outbound.protection.outlook.com [52.101.84.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF51C3B8BC3;
	Wed,  1 Apr 2026 08:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032243; cv=fail; b=Tk/yXUVKL5/zxgTuxbzWN7TnlXmTMmdgITll54PVxd374feYvPnDJASEyju968jsX0a8OPCLljIjZlMo3xxD3s22ZVwKUbmeizou0jJThDz9nYpkj1AURZE/gmcvYU0NQaRYOsziGgI1oPyYpslyCace3r98CZANfeex6acmNBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032243; c=relaxed/simple;
	bh=1ZjCGqJjTeypjhzVW/Cfzki4V00x+mPB4aY6chnJmGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N3CO0ddcHn72KzwUZfGTb/Z6iETwJ+1KXFuNkko4QqXFTlvd+GrapoQgsEqBDt5DcrjW78w+mQ6Uimo3hmNTg5qmTNWioOjbmCWR6lttprzIFz+ztKpescnVRd2+gT6nhI2dJunW/I7UkAqtEvwEqKLe5w2Ps9/xd/HMC/T0b7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jrouTvAW; arc=fail smtp.client-ip=52.101.84.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+0vo3lgHad4wwAM3Y4Q3couYaRT8dvzldRfGP7m68oWDaGG94W3vRGCR32K/ln4r3ddc2d1UV5YYMWpBBXX7hvhEKbFNk0vwuIttRsPbkpl2mo0t3zmwAMd7AGuU3vJluSkgYXtHxuG8lYrRFVoekl/m9T1JadMpKxZRcf5jRrx9dZj7ljTyToZVA7I+zWSgYQNZe7q9VO4gjOa9pmvL1RqjWo6UbgHnKvhKR5kBVckJ+2OK15EEzBB92Pv+VbLJf/15xvSDtExGzA7yxBc3fp2jL4QJjuAHpCWAmckBfqIpMTcuZT6FNZNwCWPJW3/0yrc/B55H2dY4Ssbea6K3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZjCGqJjTeypjhzVW/Cfzki4V00x+mPB4aY6chnJmGo=;
 b=C35Q3Cr2qvDjCRg4CzVZogoDnG38Mcxnkh9AzdbcYrmmBo1m/oBDlzoAUMufPN/tFwn1d1Elg/wvovwqqeGAKra7Y/FmWeOmrE1O4AHvX9Em+0W9JyoomKf0ekfE8HTbk6HBSnM5eTjaRuQmb0Jvkcsue+vNEDlEZdWZBeKp3cKHnhE2P+qC1JbwiEXmG6TApvc2dcls7bpkJP2xcOni43rl5pManwQpNZqFBknST3f6PGzK2/RUPqMzTmjVat6IXV3QTojgl+fTpQc5PXnO6gLdd8EVC0tuNkMGKg4U7fSmCIvvRxNkibNeUEtapPNIWBY1A5zTAALY5HRyHEuhtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZjCGqJjTeypjhzVW/Cfzki4V00x+mPB4aY6chnJmGo=;
 b=jrouTvAWr7D6v3Y7A3Ute11Mm4dDprb1CNWgb4s6ZOl8Hc5eufEHz7ljMoTeNvimfkSwdRsmbdFNXikKwJ4d8MOHqbhC+4GZHVw1BBH3gUICnWU7+lr4o42YJS+J77XrjHdLqwpjww5iZr7mTi615xw8LZIKsDtCrLC875XcklNyAuIzGXpFLofCB/ky1iFcYPm+FBgReFl0olGoJHa5HuGr0JbofGBz5iugkvclctWQiKF6k5WcT1j0wTMvprJgP17zGocfS5J/CWEDrlwCCybQgad0LFUblzeXowFfI3iQyP5HicVTVLsU0hUkU/8w9i5Yuwmj97kNCyuI5DzEiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB10529.eurprd04.prod.outlook.com (2603:10a6:10:55a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 08:30:39 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 08:30:39 +0000
Date: Wed, 1 Apr 2026 16:22:44 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: "Andreea.Popescu@aumovio.com" <Andreea.Popescu@aumovio.com>
Cc: Peter Chen <peter.chen@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: chipidea: udc: reject non-control requests while
 controller is suspended
Message-ID: <yel7zijkcua3cdn646fadp2pebatkbt4vracrpsbcdtmpahzxn@dhiapuctxbfe>
References: <FRYP281MB261885D9851351180B1EC037EA53A@FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FRYP281MB261885D9851351180B1EC037EA53A@FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM>
X-ClientProxiedBy: FR2P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB10529:EE_
X-MS-Office365-Filtering-Correlation-Id: af50f3c6-ddfa-41f1-fdb2-08de8fc8f37c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|56012099003|22082099003|18002099003|38350700014|27256017;
X-Microsoft-Antispam-Message-Info:
	Gh+WHMEu1r9ecv+uZZ+30lPJ8NTTeab422BPnTDQ7N7AlpVoU2M2Hkp18nzFttJQ2YeARhQ/WOCNNaCJjpWFBnJ0/vPpnbTozmDJ2vfqjGmhLzAwqRwQPHVdAU9MEh+xH2bD2yq/jtl83rnVee4jilOvOYTm72KUGGwDDIPUHWZT4rjqBzs81zyNcUMSrxuPr2zrRZAQAXmDTn7/7oguCAzH8iq2zB/4wcpEg6ENRXKH6XTiA7vnvYqhr16O6/ftGQfj6Zsi2DmXL/1pgNDrhoRiLi0biDrMIP7oaJZPg8/OZKNF/hVRxquVpCug6SX0qor4xVAGSvPNVKaSjWzo2bGTY3xwq/xeA2YsKAc4SbFE764Vdw6Mb8suj8v/fT7t3R2QzzXzKSxiOlxLXwHi4kofuZhugaYvzA7x3+TK7pLqy4HteerJSoONIRfijUvQH/iVv1dRxb3WtuMV9ilF5xONi0tXQyaKzfAAbuIxjaYERMywqCjH6aqv0Xfhgie/dUiazrtNXcp+S3AdavhV+9QkwVAOt3UnKspKoQq8fA95zqkYNt1faGNLR6oJ4jRU3TliZizPUp24VvadDRYZ6h2ZuT8xth9qwteeEm7FJQkq8dwnjfFQeSSQu9WmOHX6eWepbCJVr437g53OlXRjf5+1lnUqXmtz3GrxgOGPFynRId055ivYsPWL9vHpEejkCbLXSFvjINGj7Pi7yEk9+ZBbje/sZxb/sl2C7Ckutrt5Z1GjJX7ND9O/dUsHikmmIY9wQxLgakJxnSNVT16vz4SuXf2B4ANSt2gdw0JGYVrAIl2DeqG7g+ubtyENNeeQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2z5BEk2oxI+Y9rdwAuIPeORyOU7dhWsnJjsnTsr9TxtHf80uEa3S6sTZpktl?=
 =?us-ascii?Q?HVxMiYTtkw7dbCyWRUWRc8F87crVNz/huJZdSQv3NjSlbaSwOfYrgCz6HZGT?=
 =?us-ascii?Q?qOmKXIX8uBtLqIEd8/hVBUL9PEi3dD+lldjMIt8/4aZhKpBg8mk+J/4zkpIl?=
 =?us-ascii?Q?2acjkpZbo8ZuBUU4ZQuSQUpjLlyExgcBi2j0TWdahohb1rnCdiRkLl7+SXDX?=
 =?us-ascii?Q?g5SRM4fv+zRjevKFlNDpFdHB3sN/lchqeA4Yu89cDRE/elnQLzOwJ6YK+xy2?=
 =?us-ascii?Q?j0F4UkyTLiK9BvtBltVSZiapOymsjHdN2E/ww/ZSeAJ9S/45LhQwewrJ8av5?=
 =?us-ascii?Q?hUzWwzt+TXOTzK2GUqeEWLtpYdK939SNFmo9Msi9yhJA0Siqgr782CvpuBrd?=
 =?us-ascii?Q?8qIBA4kuzUdkQMbv+y0e4Q4zz/8HXrTCQhXzAA+XWJ1eBe7r3tE8UT7Sqob+?=
 =?us-ascii?Q?YMHpeYaJdJBOubz2XDhMAc6+D2xvVgxk+Gjl7Ozxzts+KEuGolVN+/HeUAPE?=
 =?us-ascii?Q?onPbG84GTK7+fCY/W659YJNnYD03UJbCGKM3LIZqJ14AiHseMKCYQcxzMN3w?=
 =?us-ascii?Q?p47b1TCZ1ke+mLqK3Ah6TmXyxuk6uE4QHv8EjuzrsLOUcFKXzcOl1gt/6n+r?=
 =?us-ascii?Q?uyWajqs0KGb4AIixee9BFRuqHo1fgk658N3UZZJUAtiSeMDPwt88UtiupJgX?=
 =?us-ascii?Q?cQreMpIA57LYqFaqC/tpr+BFgvEFAP2qLRsEpNevNT0DRdufoX3tHcba1Beb?=
 =?us-ascii?Q?qI7k8HIFhpvkXUdCEttubFYCKTnfHJ5hx8RlK3HATmxqFaGYa5sgPlntKH8y?=
 =?us-ascii?Q?1o78rG7xXbpfDhstnkku7uOjMtg1zexrc9+GFD7k0iv7CA8A2C8XlOApK1ql?=
 =?us-ascii?Q?aeVxyVRWLctADVPRyWQ/NGk9Nrc/23i7ut1wDG63t1ynoqZVcPIE13lnh+hL?=
 =?us-ascii?Q?NRrSsDB9LJmsdVUJZL0zC4BZgBC/JFCRsSc1znTjMJP5p2pbgYVmv1LmzaeE?=
 =?us-ascii?Q?dba2UMsAB0zIv9oeCm872Ps3+wCIp9MgSsHdjH5UlnzalpGVIPghltwVhALF?=
 =?us-ascii?Q?GfPrgz01Vz3uTAHFq04CpKQPgEzj2raVBafoSO5tZaaXECFDdHaIJeD/Qs1l?=
 =?us-ascii?Q?lnXfnkAZJpToWxeC8IoQCFyaClKx8sj3m5VTwAYHvxDnhavRwTwt/SebDt4K?=
 =?us-ascii?Q?qxQ8Tlq80Y+l9CI8NetTQ7XWZmmdMelMAJn6SXaStDNdahiCJ0RrRIZppfq+?=
 =?us-ascii?Q?MKif1zm3eHm+drVDlVSoDe19uPxSJR2TUeSM3XlyzbGG5ClQHAJkSrFwaG3a?=
 =?us-ascii?Q?Ms8YdUntNy5YxAztWTq6DWWdDP3a/lFsdRUNuYnLGPMNBV08QYii8VwxyUgC?=
 =?us-ascii?Q?L9RllwLGwT7xZx2YUbvA5IJG+yHW3R2oHIbw2/ZGz6TT4qdwppZvAHgqxFmc?=
 =?us-ascii?Q?2zSGz9qAwwYHkERqJzZHur0SLeMG+2iFOeOPBACxLOjQRLyRD5yb7INEw6CA?=
 =?us-ascii?Q?jM99E0U8/++AN0NO0Zfx/EY/t192knNmnRgJcwWvNb8y8aXv0cUk3/ex/yJ5?=
 =?us-ascii?Q?Nux4nowFEy3hE3WR+ykyplPyJ9FH46wOpwYDjlXNR2BFKH6DWHPqhuMfidnT?=
 =?us-ascii?Q?CBhXiK/RkDD5a/dMaVVHPF6dzMBWRFXy9geWYmvydZFOL2RWh6YDdyqolahE?=
 =?us-ascii?Q?RPOmSqvZys2Grq5aSuS/Uy0Ez35Ul9NHtX4l+lnM39FXvP6TaEhJGlKs2gda?=
 =?us-ascii?Q?4qtJr5SOfA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af50f3c6-ddfa-41f1-fdb2-08de8fc8f37c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 08:30:39.2867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeInIX+gb/uV7uSrKPuIYIK+6Ye6eqQTwqDwejLGxZfX3WQFHEvTy6EnZ95wJB0q2XCOgyk+rcKcGOFikT+lpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10529
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35767-lists,linux-usb=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,aumovio.com:email]
X-Rspamd-Queue-Id: 97A47376FE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 12:21:45PM +0000, Andreea.Popescu@aumovio.com wrote:
> When Linux runtime PM autosuspends a ChipIdea UDC that is still
> enumerated by the host, the driver gates the PHY clocks and marks
> the controller as suspended (ci->in_lpm = 1) but deliberately leaves
> gadget.speed unchanged so upper-layer gadget drivers do not see a
> spurious disconnect.

It's strange that chipidea UDC will runtime suspend even it's already
enumerated by the host. AFAIK, the udc driver will call pm_runtime_get_sync()
in ci_hdrc_gadget_connect(is_active = true), so it will be in runtime active
state all the time unless a explicit pm_runtime_put/_autosuspend() is called
in somewhere.

Would you share more details how device controller go to runtime suspended?

Thanks,
Xu Yang

