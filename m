Return-Path: <linux-usb+bounces-36080-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN3lIwhF12ksMAgAu9opvQ
	(envelope-from <linux-usb+bounces-36080-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 08:19:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E79C63C687E
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 08:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E344C3019B88
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 06:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBEA313523;
	Thu,  9 Apr 2026 06:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jhhvaAk8"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914A030F531;
	Thu,  9 Apr 2026 06:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775715572; cv=fail; b=d0sX1fB6+pGyPyr+4jNhHtfZY1la3qchYehkxDF0g0z1mVoEzTKYOvZEW2T7or0vYyfroKJyXwaJxT6nnvOAKKPRa/cp75jvrdCHvpqFzw6QE8/e5W9J9glJ3sSaOQIhJIkGhkkXhUiDndAZzBTgVidvR+sCN4V3cAWlTp2++4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775715572; c=relaxed/simple;
	bh=ffos5oD/hxa5oySKq7uca0KuCFgxZuzluVozUmkmAjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UQ0HGiXyS+OayLdo0NXEqzuErtVdO6I0V4EZEOjpGwINfJ2kTOFzjnSHAJ2zmxnM3UrpTfKsa2Z9gmC1tiEQkiz63AatB31tYLoQbM2jthBNJOinD3LRvkldz361dXTflK6xDQzimcSKdIUDVFtNtEAHBLqeeyUy72C6QvvB0QI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jhhvaAk8; arc=fail smtp.client-ip=40.107.130.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H47x7bLGsI62LDR0g6g02FZyWdKnzpQ3XyhFyA2Ql0HZ+fwWVpAOBGXYC1wy1ogt/Tz/a2HKTVv/PCpwsOZo+ri9H/H8Bet0yJO8tElaDm8HPNvZpm8gGdvl5H3AHhXqTO7VjAzTz6YUZmfzPcG9KYk+ERmk3ATWqaxBy6V8rlxiVS7oDhogahtuj3w3J9njg4GHFAq3ANp5TIcAjlbegEXmyBLmIL231sKtb272Koinxwb/c21TWgeNDYnRuGUkwdQjDg1hn9Np9IQvE16jeFWjbt11qr+5FoSkjqUAtZnHFlDXhVCQMaIWbkW00XelrYx8wQa+Ju93dlUTXIYfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PJlBV62AgbPJuiBqAOSoI2ZEIOLa+DlOyyANsTF5rc=;
 b=AP3XmtZoaW74Fhd1zLYqJKu6GFPd6rvsn0SApGjCUcDW3ltlvcm6KbMvVEGYoMYFnbhYw3LAcgPPNuRye9PEKfYL+Rmqn4R1i4TTDWablS5Pre68QaR68x1+b6mvKEHSHZsZ5KfGF8TVPIKqq260jvniotQmwmnqjRu7pRRnBUW0dcKiLbapze/i/jREMiGwYHW1pRnEcVDuT+voKCiJJw2STdipGfzcxvo3nm0OUzTFnnYG0txMGze7EqL6BR0qg6j9TdEKn2Y5ogXd5GcQ0U6RGbiKIaUBLQPcgvtEueIQVYZDrDA1acXXpm35w8Au7j3ONckilxACfCiA+8q/wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PJlBV62AgbPJuiBqAOSoI2ZEIOLa+DlOyyANsTF5rc=;
 b=jhhvaAk8S8bq05W/BoRydWUTG5J9nav1sGRkdpALk5WF0REgLICT1j6+qcs420GrtmyEtjzWUgVedsLX7mnbauOH70iUE/NifdMiiJRVgZtPMrevL5wUQZUp5ShKCPtUvjaTOfDnQkdx7BgqysqlNkArsMaqOiuIQxurZj1UyzKW1sZV4BDyinaK4yU/FDOiwSowPOvWRmbVLph1wEifZOQ0Eq2rx6kyBgBH70L7eM5P17fpVFBBgXcY/tVJwK7d2K/dkE9yaEaoMcJrysjfj/azWWZx6t1QITUyBlriKM2wwQOUQXOEB1iyHhnjpu+MFGTjOjvoRgYDnhr96/O3Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV2PR04MB12085.eurprd04.prod.outlook.com (2603:10a6:150:305::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 06:19:27 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9769.017; Thu, 9 Apr 2026
 06:19:26 +0000
Date: Thu, 9 Apr 2026 14:11:26 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: gregkh@linuxfoundation.org, jun.li@nxp.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 2/3] usb: chipidea: core: allow ci_irq_handler()
 handle both ID and VBUS change
Message-ID: <nxj46zagq7udixsxaupl67ehekzsyzttnkyvvwwjzzzqkq52rm@kecaausbf4ab>
References: <20260402071457.2516021-1-xu.yang_2@nxp.com>
 <20260402071457.2516021-2-xu.yang_2@nxp.com>
 <adXqKIri+bFwIbwt@nchen-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adXqKIri+bFwIbwt@nchen-desktop>
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GV2PR04MB12085:EE_
X-MS-Office365-Filtering-Correlation-Id: 905f8250-5ead-48af-205b-08de95fff33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|366016|22082099003|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GOXKhwtZRdbyZZy9xugajxAOwdxWmuwti5q/QbaKXtafOGQLH/o5n+NUQ4eF8D8QXcKs/qkV4ypVNOv8ugY1hd5z0erp0EB/NQXcnoVczIjSL4udGq0RLQROa5Ancf/CMEHmYdkTTq+GlMuTsBDIDY9F8EojrkwETBNH9OAWxs6iqRFBTN85FRqI4r9B9tG5lAXgohW57Y0OWd49ETXOtWJ2gzGOOipS8ezKOH2UqcRNU4ISiezgkD6fh6r5s8OEjLedO/7Hg1DCn6baPxVbyLrVEk0C+828p2NxVXDofzqD2hjWLnXbuzUGFeRFoQ2o5s4ROUlUWSyvWbIZRryW3OkkmVHK8lathh4D33QFYocLloMeux2QAQZFYtlYFl6UNIBKS4095v9i/bHVpjWck57XcG7V8tLXjzlrYtEX47DfTElBn78JrhRhJdNbhFBmxRGrvcbmR8eb9m0xVyOpG7IoMai0c5k2fG3OhOClGHBEKXooUkpy2d/B4E3V+dzDjJCDms4qTZFV3DKnZaLluYcHtRI3TjgvZAScPv90RjJdV2Him4QFUpxIsZ9GzEVu1kyD/jq6gMv8Jx9Z4KDgAfJ7vuuRVtDunO0ZMCO3uaw0EnHqxdb0FUgt1H1kjuclqv9LSiPe8sYv887yqYPmcays9Q8ClBtncgIyCinafGdJMtJ7fWrp45u8vAbKFvEO67EepEXLx73EjFR4lsvUyqftGdPZmybYRBEz3QdSbRHfhFbfFHLvZLgx1+2N65q93ahMYjVdB0y1JVOt6KtFt/y9srUTDOwg7bX7GN8gwYo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(366016)(22082099003)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/47vJWUV2aOhoTiI5JPkfHNIcpz8Ofg3nMxYdMSkFsxfH4c5UhlgtcEi/mQv?=
 =?us-ascii?Q?241BydOKTkS/fJXtRVjHduBPPFBZj/3iRiiumpMHeJoB405cxoPd1QzIxWjB?=
 =?us-ascii?Q?hxaC4VlvvZR6TUDbycLT+JApHWoKLKyLbKram19/hkpDiVSrozsKrR9Hzyej?=
 =?us-ascii?Q?SCUBzPA4Cu6x8kunGlbUcZ+1KBSTx/WPx9KTCcTjWZDmaY6G2pCRUvBiIadr?=
 =?us-ascii?Q?yj33qrhmo2GAZK3Yxg/OErWirl4TU2Jhtr4iIz6AvWJ2XMhuKeSM4S508qBE?=
 =?us-ascii?Q?kLUDbcV8wCagofA1B+lbM2xrE/NSRX8Gb8GZRGqFl2enAaGiPC9Q5g+DUhwy?=
 =?us-ascii?Q?D8Xlo+e1gY3DSiajFN95XYuNNGooBc7D3NhJD3mUpZpR4ZlSoV8/vGwSWV7o?=
 =?us-ascii?Q?JnOJAQ65C7lhtSz5ndxvii+0BUu2vWonhTEzdHHUpuwaVTJ2/tDW7J6bCQhK?=
 =?us-ascii?Q?5tDACvc0lXWxDOZuLuqokkAYNjYuC2VegB08v8HJz6ZXOO74TTpkCDuMpfiq?=
 =?us-ascii?Q?W1W0+Je2TQL+nc82FrD8kAQxohAwovE5+/XsxLMST1ELRpfQii/rMt316Cd+?=
 =?us-ascii?Q?6jy3odUUzoNDsFio5JFyeKlSJ16LKkphGPXwydICKVywxkEBHpZjNk6Fi4p5?=
 =?us-ascii?Q?99D0YEN3jysg4FND0fCMGNujbDpigrtbkcjAbkh3rJbI/Y7UKAoxskr0nli/?=
 =?us-ascii?Q?Zj6iWtCjdcnuoZGQJ5c5ONCLtnGBpYVz7PkMtqZka3SIQqKWzdXJq8l7eYra?=
 =?us-ascii?Q?5n7JHUAR1D7dQ3lUgpxQQCgUPERrydOl8m+4O/X5Hh2jdKB+AtLT17PLs6IX?=
 =?us-ascii?Q?QE58fmbdAw57MTB638JPgawUpfBoE5sHZfshbprJfxQexPkXyn/ag0/JyCfu?=
 =?us-ascii?Q?/rsrfl5B6sRpszyRo32ZflOOxd3+r8V0K9g1tcsCDL/GEmAE/z2qZ7Iyacvv?=
 =?us-ascii?Q?XLY048jJEoVrU60oUu8OUOQ2c1Lk4pkg+klPDHv3IrYk6JSk6keXw/v8YCqg?=
 =?us-ascii?Q?RuD/4FpHi109KEqNmAH9vhIr97Tit3/HDYKSyY5fpzM5EefWD7O9gnGT2l/+?=
 =?us-ascii?Q?EBcsSq3aMtNJTgArkn1ogzaMYlBr1YvT/f8bd9UEElCwFX7ZjXViA/cuef6L?=
 =?us-ascii?Q?E9yrp0s2yq9yDkYS0887V8bemDCyraG5C+JzTw4Ljntg7YjO8Zpo0ZyXFGkr?=
 =?us-ascii?Q?7kqL/rT5dmKSU99CI18VtdsVlLLXm10q5fcm66LwZfieRr8yTk30m4pZOOkm?=
 =?us-ascii?Q?C7XVz2Hvfosf/DiEHpH6KdLX+/1XlvXcmUo2OOgry0FhMYlzZ3tMP5+Jn4A/?=
 =?us-ascii?Q?Fq2UnTbRSiRoyrxDsvABlmu7HMKEGZ+G31iB2ylzZ09X/LDMRPJ7BovurCR7?=
 =?us-ascii?Q?ealDRwIYSPHAzHyMWEJK8OLlilSgeH422Q93tRG2z9HCwiQ2nrpGP9Iq5dbL?=
 =?us-ascii?Q?sFwSFB/68kG8jYm74xaTyEiBDYaspBgZEbuIG12DDgmUTpnOtVjwDpdI6fLX?=
 =?us-ascii?Q?g+fP6xUnzQTsDI9fytfbI8pLbnloSIjrn1PPtt4FkicbuFvy72BK1XXR6J2b?=
 =?us-ascii?Q?DzYFenIMChDuhEfZ4ztm+7XcTAZf23PsAJa43tbesZ0ujyPAYRHAgBLrRDbU?=
 =?us-ascii?Q?Oruqbpipj7D7EaI3kHEoBP2xsKNJUPx0KRvqfSry4XhOnqX9IeHj7yEkswq+?=
 =?us-ascii?Q?OMs4OOPqww8WSAnRqwegMkKNS3cjf9X238R8GNvIkP1qjNU8kq73J6Xss5+B?=
 =?us-ascii?Q?hbaPWGGchg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 905f8250-5ead-48af-205b-08de95fff33c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 06:19:26.7866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cn2PBbPlZZYw8TW53YuTqJsP4fz9c6OuMT+XbBB/36r55VwEOkUbUG+OP3eqLPlkI9teppRMWGUV5j9bExpWIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12085
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36080-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E79C63C687E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 01:39:52PM +0800, Peter Chen (CIX) wrote:
> On 26-04-02 15:14:56, Xu Yang wrote:
> > For USB role switch-triggered IRQ, ID and VBUS change come together, for
> > example when switching from host to device mode. ID indicate a role switch
> > and VBUS is required to determine whether the device controller can start
> > operating. Currently, ci_irq_handler() handles only a single event per
> > invocation. This can cause an issue where switching to device mode results
> > in the device controller not working at all. Allowing ci_irq_handler() to
> > handle both ID and VBUS change in one call resolves this issue.
> > 
> > Meanwhile, this change also affects the VBUS event handling logic.
> > Previously, if an ID event indicated host mode the VBUS IRQ will be
> > ignored as the device disable BSE when stop() is called. With the new
> > behavior, if ID and VBUS IRQ occur together and the target mode is host,
> > the VBUS event is queued and ci_handle_vbus_change() will call
> > usb_gadget_vbus_connect(), after which USBMODE is switched to device mode,
> > causing host mode to stop working. To prevent this, an additional check is
> > added to skip handling VBUS event when current role is not device mode.
> > 
> > Suggested-by: Peter Chen <peter.chen@kernel.org>
> > Fixes: e1b5d2bed67c ("usb: chipidea: core: handle usb role switch in a common way")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - change ci_irq_handler() instead of assign id_event/b_sess_valid_event
> >    as true and queue otg work directly
> > ---
> >  drivers/usb/chipidea/core.c | 45 +++++++++++++++++++------------------
> >  drivers/usb/chipidea/otg.c  |  3 +++
> >  2 files changed, 26 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > index 87be716dff3e..7cfabb04a4fb 100644
> > --- a/drivers/usb/chipidea/core.c
> > +++ b/drivers/usb/chipidea/core.c
> > @@ -544,30 +544,31 @@ static irqreturn_t ci_irq_handler(int irq, void *data)
> >  			if (ret == IRQ_HANDLED)
> >  				return ret;
> >  		}
> > -	}
> >  
> > -	/*
> > -	 * Handle id change interrupt, it indicates device/host function
> > -	 * switch.
> > -	 */
> > -	if (ci->is_otg && (otgsc & OTGSC_IDIE) && (otgsc & OTGSC_IDIS)) {
> > -		ci->id_event = true;
> > -		/* Clear ID change irq status */
> > -		hw_write_otgsc(ci, OTGSC_IDIS, OTGSC_IDIS);
> > -		ci_otg_queue_work(ci);
> > -		return IRQ_HANDLED;
> > -	}
> > +		/*
> > +		 * Handle id change interrupt, it indicates device/host function
> > +		 * switch.
> > +		 */
> > +		if ((otgsc & OTGSC_IDIE) && (otgsc & OTGSC_IDIS)) {
> > +			ci->id_event = true;
> > +			/* Clear ID change irq status */
> > +			hw_write_otgsc(ci, OTGSC_IDIS, OTGSC_IDIS);
> > +		}
> >  
> > -	/*
> > -	 * Handle vbus change interrupt, it indicates device connection
> > -	 * and disconnection events.
> > -	 */
> > -	if (ci->is_otg && (otgsc & OTGSC_BSVIE) && (otgsc & OTGSC_BSVIS)) {
> > -		ci->b_sess_valid_event = true;
> > -		/* Clear BSV irq */
> > -		hw_write_otgsc(ci, OTGSC_BSVIS, OTGSC_BSVIS);
> > -		ci_otg_queue_work(ci);
> > -		return IRQ_HANDLED;
> > +		/*
> > +		 * Handle vbus change interrupt, it indicates device connection
> > +		 * and disconnection events.
> > +		 */
> > +		if ((otgsc & OTGSC_BSVIE) && (otgsc & OTGSC_BSVIS)) {
> > +			ci->b_sess_valid_event = true;
> > +			/* Clear BSV irq */
> > +			hw_write_otgsc(ci, OTGSC_BSVIS, OTGSC_BSVIS);
> > +		}
> > +
> > +		if (ci->id_event || ci->b_sess_valid_event) {
> > +			ci_otg_queue_work(ci);
> > +			return IRQ_HANDLED;
> > +		}
> >  	}
> >  
> >  	/* Handle device/host interrupt */
> > diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> > index 647e98f4e351..def933b73a90 100644
> > --- a/drivers/usb/chipidea/otg.c
> > +++ b/drivers/usb/chipidea/otg.c
> > @@ -130,6 +130,9 @@ enum ci_role ci_otg_role(struct ci_hdrc *ci)
> >  
> >  void ci_handle_vbus_change(struct ci_hdrc *ci)
> >  {
> > +	if (ci->role != CI_ROLE_GADGET)
> > +		return;
> > +
> 
> Are there the situations that the ci->role is not CI_ROLE_GADGET, but
> it needs to handle VBUS? Eg, ci->role is CI_ROLE_NONE, and VBUS event
> occurs?

I suppose you refer CI_ROLE_END.

When the role is CI_ROLE_END, the VBUS IRQ is disabled.
 - If the controller keeps at CI_ROLE_END state and VBUS comes, the IRQ
   won't trigger just like it is ignored as it means nothing for CI_ROLE_END.
 - If VBUS comes at CI_ROLE_END state and the controller switches to
   CI_ROLE_GADGET later, the VBUS event was lost but the driver will lookup
   real VBUS state and do proper actions.

So the situations seem not exist.

Thanks,
Xu Yang

