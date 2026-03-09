Return-Path: <linux-usb+bounces-34272-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADwROmyYrmmBGgIAu9opvQ
	(envelope-from <linux-usb+bounces-34272-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 10:52:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B7C2368DC
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 10:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57D973028822
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 09:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0AE387368;
	Mon,  9 Mar 2026 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="RonxrFUB"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011056.outbound.protection.outlook.com [52.101.65.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFDF38551E;
	Mon,  9 Mar 2026 09:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049953; cv=fail; b=dfALGbthPhkuEl+ypGXjDJcxwFWX9zn8ASunt4m1mDj+X8YRltbBorPXWNMfglKv91EnQ+H63lNok6yFdUZz/i2p+w1nPKxFERI0YUgxe0yAtBK9aXtFBMY8lgG66yridyrSqTlCrXaqglJH8EwoEbmWwlrvb7UKowexumusZQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049953; c=relaxed/simple;
	bh=vqTZpDkWsfr8roJkFYj1vBBazghep0WLPy6htPV2ajs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mmjVIbuj3qd4EbWgAQVDfRdVvc2fEOmdFkgf4bmx7WFWOCCY4nhI9zr5Mq+7i3KYXSnq7QFNRaIoVp5tJph297JB3pAXn7C0jUvEqOCd1wcs3VZT9R1fK0MZ97w/Du6k3pYUJUoiZQhe5/ugX8gdg6WbePjRM1AUSWvSHgNSri8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=RonxrFUB; arc=fail smtp.client-ip=52.101.65.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYvL9KFaWMTOCTbH9FITkjwiDk216WwTZ4QhlBYnSSGNj2Q7/izFtAmUQs5N+cXyw5atm/fkZf7NLVpPxghyosVJdo/ebzq7Iq/EtwSAb7Lq1raxd1TPPjGfgUJztRaxH2XsNBhtGmj+d2CneU7172SKRBF7PFwI9vae778hOniXXb/22WS+jQwxnkaPI0ZrljZk5R+Z+lkPmWcxDve2MgOEyi9HHjAwknfw5+L0TlwhXiHLB5f67YN8j52Fzozk0lDGQK2E7MH2FU884tcrDSWXwHw8GeMmTFbHUoE0GHQASgHLxAbIIY5wwnxgwqEJepEWSsFwetrcfyquBPVzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqTZpDkWsfr8roJkFYj1vBBazghep0WLPy6htPV2ajs=;
 b=fieecVfmFVxRFcvWBkE9r4eXW5HErDW1BrP41heyJJHyDQkXPMM9D/JTmb8zOGCs6soI486eKPvUBr/nY3TXlIhPQAjno9xzjzAQNqClx4USAwADmNu68yZKsdtXcu6gLi57NlsuFuBZ7ZGujo4pSdHnzfPSvlq7EvWyaPW6OFe+H7m2MqjsUaX5fXWf58wfL/0S35w0dLA2gCiuNbcTUb9YqKm1Iqvscq/mRSeOvFDE7dqFOu0eAmS/HGIsmYPNjekTkkhpgi7B41Nec86KwfRkOMmLB6/rYre/gMug9TyccTEtH2qgyJK6hP44Pc5P++aQXudh2WGBrXlgHuMEbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqTZpDkWsfr8roJkFYj1vBBazghep0WLPy6htPV2ajs=;
 b=RonxrFUBn0sZ1uSeadiKNFl2dqgyuQgoncp5yTierVqbLtmw04b1JvHK87DblBs9wRIH42O0zcXCC+VSWTapde3PsCEK18OG4knehAiKWKJaFgODExadhlKcC5qN0IO/lGMQX1GiBWoopGfAB3EgyD/0ZE6P2hIn5gSXiCZQQHl/rG3FI1jYarud6yzjFuYUgfeEljKBXvPGL4W3av/D/SQ1DN7v8IydHswXNY/4HJaZsyO8Myyvesad5PuI+gYlW3WPJGmtVbkL50wGbO8hmYf+VkDDglXFi4uhe4VDE/RGhK3urNv4uOXqVFywsCuRFzoTB+ccH9kpIABNMNgdCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by PA3P189MB3368.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Mon, 9 Mar
 2026 09:52:23 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::9996:4371:88cd:bc04]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::9996:4371:88cd:bc04%6]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 09:52:23 +0000
Date: Mon, 9 Mar 2026 10:52:22 +0100
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jura@vukad.in" <jura@vukad.in>, 
	"malin.jonsson@est.tech" <malin.jonsson@est.tech>
Subject: Re: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Message-ID: <s7bwd452qn7c4jblrfvbjwlhij3vuyqxzzij5yavbd2errhtfj@bxou7mag2wf4>
References: <20240603131304.233403-1-mike.looijmans@topic.nl>
 <20240604010256.4dxamwvcjxug6xfb@synopsys.com>
 <0fceefc4-2b3c-41a4-a6ac-d0b6dbacc1f7@topic.nl>
 <20240604230624.dk3pssivd7g3qb7p@synopsys.com>
 <23bf65a8-b3b2-459e-bee7-ca7c4e4993de@topic.nl>
 <20240606002909.f6a7fwfh7ccb6pxq@synopsys.com>
 <2j6o5atwkm5wl25adcusadiadme7gqpx4vqmscl42wnxgjyh7b@b5om47iesajo>
 <20260306020621.4o52wfl2ej4dxvdg@synopsys.com>
 <jr5jzgvstxr7galevtc7p45q4jx7pk62itv2yki7fw6rlivltz@z6vkp5k5sfj6>
 <20260306230452.rfnxcqhy4ehjuubc@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306230452.rfnxcqhy4ehjuubc@synopsys.com>
X-ClientProxiedBy: GV3PEPF0001DBC0.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6b2) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|PA3P189MB3368:EE_
X-MS-Office365-Filtering-Correlation-Id: 454e1e60-35b1-498e-d362-08de7dc18ffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	dim1qYX1H63pm9ZEWI33v5HEvJWELkXaO+YxgN+1gxxMO3/4ZqELMxOLCjJRqZeC7Zmq+sfkeFjKkOmC4GToIVR/W0/CX7wrYL0nA5agqOQXeMbdSl6yMFsME0M2zI0C57Ay+LnyX6J/3BKadiFb+eVkfbP0kvotc1K1QoImDyBiGGL5S6tFsdk9lBSNfkjk7tCjtDStD749JXT8RXkmNaJzKGOj1Hzz+O3zLC/8YNuBPn96Blem7ixdcZgnbNEnbbvs2jIQ6asZ9TTr3hIOX6PMu8iEkC5nBLm5A0zB+fhA+fTtCmgEDyMs84UwYvpVSYMG9OJVK8EvEZC5GxYqdoVZ12wIoUON0y4Jh7gOe8R017iPVBrpKleKZqPHgn7qAJg6+qi0T5Ziv+78YIYjEdewLBpLxRmwvaJBXKUAMUZGfXfUWlx9Dr9lqPIWtT09UUwqD3kOmLte7glXwI0wHHBJk62ED00xpbyInAElF+LEomeOhXNRnJO+r/RyFy5PQfjqIL7Vi+bLzx3Veu1eWj3WZVbyBWEtrcW84HTESEmASi82/SkT0xvRcOV6zOd+OdVgnctkpI8x+SmPrF8wnntysO17Z2G4Gun6en+DREqImGiVckIrGezZanjoVEVWig4DARwis+3+GHwutGCrFutjHexvTA98kGZixpZC/5qKGWQMzGVxXjtm2IP+eJrTvMTT7Z/uzkmFJP5EVLzf6OP2sHGH7Ed9HGlpC0XgJ5M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ICA1g46NsCPz1Q1RPxSJCgHpriln+zqGzpNBnUx7Ri+5M7UcNrYH0UBxurY7?=
 =?us-ascii?Q?m2pJF2HFKBnmr/TfhO3CzatPbLXVtKQNSxKa25mzZ74bBev6DmkWQPPDfDw+?=
 =?us-ascii?Q?MlKb3KRKwNMXk8hE0qllau4v4Ozy1FfMOyGL9EitO3pVV8KBNKh1X1ZFRa9/?=
 =?us-ascii?Q?EAo/NGLGgL97vTIgLMdrD3ODPtdwHKtTmrjOAOuBzMwa8/vbvt1MimGvfp1y?=
 =?us-ascii?Q?8P33QMqUIKARBZ4AYfOO47jY6JPB3nBnERPou1wGhI2P0UBC5xnnX4HnnEDj?=
 =?us-ascii?Q?8HlOrPSnWPzEhpK0zIdRU9d3FFFLwsar030Lvt9OzjFpAoYTJg9SgiW1vBcj?=
 =?us-ascii?Q?TVOmdbC4oLYLRExLInCOdw3gOUNturco4L+1B11ubpyWVxibSgSF4D5+Iela?=
 =?us-ascii?Q?Im2dxPYDRBIUXX7Oav8EvznOspCNbgOac4eeoi3dr//j0z9W1plDbdW5lUo6?=
 =?us-ascii?Q?eFa8f8yXI4CrloFkFZTY/Lv4h+k+WTcCyf6L1m+SF3HKrPCsg38qRnzTksxl?=
 =?us-ascii?Q?HMgvkUS/aJAtxWCKjpV6mI3EpSoVqIArDQb/XBZa53Kd+30XxX6Kp24PkLcD?=
 =?us-ascii?Q?/KeDtBoqhS4xxzhLWR+6NN6vJkPTaDeYTDtgfhCVogFGZFx/xkuRplfOsH2d?=
 =?us-ascii?Q?CkyhO49ixGXqwd9plRxLdMzvJ66HQ5C6DTFRJkfwmWfo3WafeFbtKUeHwb8C?=
 =?us-ascii?Q?3JHBFhXzJgeCk4XPsmvSPEk4/cpMnY0A7u00NWrFZM+/MPz8K0K1ZGwl7y4n?=
 =?us-ascii?Q?gTIX3rdT8extfLe06WBSJVm7gp6aNUnNTEt3mKPkmyK+iMB9xdqfUsX0U+w2?=
 =?us-ascii?Q?TrnOl7AYc8DW8jq9bXo+IBzJahXCG7axLKq8VJyR+C+E40FkyAuMXK/qjeC4?=
 =?us-ascii?Q?qSv198+DlbZfj2iMFPLB91t7AdSQCzFL6yzw9fs7DLluJspvrw48U+zDLs0J?=
 =?us-ascii?Q?50HvVKV9h1+ilB73tHYOxgKbWig9nT7ldrkcf1HearZAd1eHJMZutL+pc6oK?=
 =?us-ascii?Q?GEhKLO5TUmKlT2ED5X8O6mLEOdx6mBpq5ZYc1cGvTB6D+uFng/hl+gaQrfXM?=
 =?us-ascii?Q?5ANUzWuv6YZNqoSau3lwYa48RvS59uMenCttO3gfJvzpCe78bRr8FghCgsUL?=
 =?us-ascii?Q?ZQjjGLC6194phNZvvwN9RazLjKfUuizC+NdVOhUz23g8ZLsUhmcZ0DeFMKMp?=
 =?us-ascii?Q?UYmXNjXsIjcLKTwWYmFRR8sS1PgCmQoX9JGnJpHCWFyrik7w8Jb6QZoQaML1?=
 =?us-ascii?Q?utZFASitopb87Ft50djDVWtOvGdZrKg/Lq+5H7Qr2kOp+xqpSiWEX24j205n?=
 =?us-ascii?Q?2q11m5sz0otEHL0Qx8glCUE6V/KW/Qqw6I/AmftxYgIuAP5lu0+wsoNnc36e?=
 =?us-ascii?Q?muwmS5emCVHmXLbJSaJ8xeXEHp2r6d7uxeBsAqVkLV/TcBpwBg8XaK8LvSnG?=
 =?us-ascii?Q?FLL63ZZ0aJm3ubNAwyMYVB0n96ZKCWPIUKWp1YuXYCJ1WZpOF4oIFGNdJAt0?=
 =?us-ascii?Q?/P5raDiQKmN/6Xvr1+Lg3GjEc2LF1XE6U10O4DQw/SRO4D98OIvPpfRLcSCx?=
 =?us-ascii?Q?qHsUV1yptGDBrznlyW0kFN9KGzqgRaOfy5W+ay260aVOZguyMlT+G25SkXIu?=
 =?us-ascii?Q?nw3bvnYW0zF7oNx8YS0FE4Shd4BmkmRQqlpddTPbZjwY0uyb6rf237FV9S4V?=
 =?us-ascii?Q?gRrOPYlJV+wtQiWZlGiYTU7EugIWeXJw16nmJp+Atxsngj1UNc52Yx0fDnb5?=
 =?us-ascii?Q?bNNYcs/WsKP3yguaHbRMhIV/0ql57tytLjFuDm/A4loRNargqh7a?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 454e1e60-35b1-498e-d362-08de7dc18ffe
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 09:52:23.2919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TcgcZO+nNt/jkuAUFsPQ7ubZePU3hrkJXP8W8uBZqbQCxoL0tyfwn0hC01LVysK9LtghTEiiA+bIoShBCwktWRAab3EMNROsrUiLnJtkjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3368
X-Rspamd-Queue-Id: 43B7C2368DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34272-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[est.tech];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[est.tech:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravineet.a.singh@est.tech,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.955];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,est.tech:dkim]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 11:05:00PM +0000, Thinh Nguyen wrote:
> On Fri, Mar 06, 2026, Ravineet Singh wrote:
> > Understood, my bad, will send a RFC patch in the future.
> >
> > Regdumps (without the patch) are attached.
>
> Please no top-post.
>
> This looks like an issue with the integration of the controller and the
> phy/connector. Your phy vbus detection logic needs to properly assert
> the proper signals (e.g. vbusvalid/powerpresent etc.) on
> connection/disconnection detection.
>
> It's best to fix it there. Forcing every U3/L2 transition to be treated
> as if it's a disconnection is problematic. If there's a real U3/L2 state
> change and then the host resumes, the device and host are out of sync.
>
> I don't see a good workaround for this.
>
> BR,
> Thinh
Understood, thanks!

BR
Ravineet

