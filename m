Return-Path: <linux-usb+bounces-35546-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCThAOVmxmnnJgUAu9opvQ
	(envelope-from <linux-usb+bounces-35546-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 12:15:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D37B343331
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 12:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F7A730554AD
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 11:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356E23E4C88;
	Fri, 27 Mar 2026 11:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KRHLzgc9"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F05B336893;
	Fri, 27 Mar 2026 11:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774609373; cv=fail; b=Fh0UvrZf7uDCrEuM84e3ErwCJiMcxyQdG5p0i4GuzJQbCSVTwHoAIF1yUhREjsFhfGHXmYi5m9FA3VHHc2cQtt01GrMiNa7FJRb5G2CaBwi2PIlXlkOJOa/RtQItt5Eyb1JdMMiyIHBWWhMFepjNgaCwyXP8CO9IUe1AFV0uAGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774609373; c=relaxed/simple;
	bh=iXSfpavRxOEqdYEKEXQ0pDobn+5K4e08ciD0kS0v6ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=myrTNhQyFlh6Uh8kHXtdZP2ebKQB7J3bb9OC6D5ugahOaT9gi5+HBVFdJ8HCdsTB41bVKQ3DMFx9SWtuICg0DqDQvooUGbm/ZwXrH3Tc8vf3cBofTExwXpQLHaqW1XjnSHWzpWma1Ox2WKygbcwOFEr3Qzwiwk10tsCBiXaQ0nQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KRHLzgc9; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRyqSYNpGb8nl6Civ+OPEaWzgosgS4IiJ7nnEKFqavrO1JwcIJalOPdvSMvxChakYj2O6pl3Jpk2sfpztGsGqwB4eE/AuXxMEtlPbhQH7OmhBhfnvLsC2qWEq/bDN/CXNRC57J+34+DaHPQ20ckw/V48Gn2NmYzm88OtGLU2t4ULxMQYOCaIp8dOS9AnWtGUNcjPj0JeCDpZ0va2ZZRIRX4hzngxq/5iSm8HSjLCfmM7+2eZX0RWTmkdFpNnKg1xPC3guJVkD8q0zM0Dnb1samufnAdVay9pv9e5QTTuSUU5CefrfAJN6PRWBKfEY/VCtf8WinJknIlTUMYcGe+2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdIIz73HVAtrzDJuUI7NI1AL98ckvLnbmMX78k3TzyQ=;
 b=mXHEm4H9+k1MaZDc37RHbYc3j9+jCHp0XYJsmzaXyUEPjt0b0C1fMxPvuUK0/Z1WJJ6aoh4cNcuCbATBlZ1LhIySGLPwG5G/o7g9LeaY00wimfV6Zg6vdXwdmoK3Dpy1Hx1p/+kYQ8fadmFDm3feTJwNQuF/gyX5JTRd1J5VM3UDzPpCBVKPvmLMj45N7x2FjZ+3xt1VeupVl5X6wzGzd/e4ymD9bv45i6cxGNe+9t5p46tcFfSpCCN14RJNXwodJQ+oznfwrhbFnKZsYhBzxMITlbYpNkYdV14PUNflZ2QNshTAgiCV0FNii5e01hbMmf8lxND1sncVK9heTOw3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdIIz73HVAtrzDJuUI7NI1AL98ckvLnbmMX78k3TzyQ=;
 b=KRHLzgc9Hxoeo7KpjHC61StZt5D8uf/nrHoxB9iOZ1mHddKJ0/OuKbbUYViuAHkY2t4OVj0sFDSuhMkHbkcdJUIYZb5BPvKn/FJK1xUwefWYYuvkmyboa55InOaumjaD54LsQndS3dO92sLOSw8BeW9UmlwPf0O7DtL022U0W8VD09KAY56TCCPewpZQiPy4cM+2np1dTICF5El81wynUq45ilc37BhmX2C+z7yC+pOBhqTX2mPEFJHGUCOFArkwmn1UadIPa8nka5RJsdP3en00Zfo+tpi7pe/h7nUmXk2j074LQ0fPD4RD7Xsrc0ZiOwNlttoh9RKGJlCSvADYpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB11920.eurprd04.prod.outlook.com (2603:10a6:800:306::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 27 Mar
 2026 11:02:39 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 11:02:38 +0000
Date: Fri, 27 Mar 2026 18:54:45 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: gregkh@linuxfoundation.org, jun.li@nxp.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] usb: chipidea: core: fix device mode not work in
 non-lpm
Message-ID: <7n6s3luk32sk36y47u6axedhysnrrin3radc7mgxh2pjzwdzv6@v3yu3tg4moiq>
References: <20260319095716.634568-1-xu.yang_2@nxp.com>
 <acOKAeNKWT86veM+@nchen-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acOKAeNKWT86veM+@nchen-desktop>
X-ClientProxiedBy: FR4P281CA0259.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB11920:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d9676b9-632e-4cc7-534a-08de8bf05bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|376014|366016|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	6ufGkHx9XRXbOr6kmixiDP3rxYW2vnCmWup8q+GYMQBX46opyKYZ36QgwA9cxoOKOFQXAyjmqlEC7qww+kHmxDCh4myA0tWRArxu6G62NetBVje1O3tDk2dm9N/FceCIAQtqq/myFkxIHOZSD0SXE/NskhannDNDdyraZVM/O1fAXd1sXtfC8oesqW4b7wKDIqhxq955mMGknMzRWqTzrQ1zutpSgJHHZcP0i1KNTrln4NRWAgFuuHM6pCsdUzZctbXtATmPtZEYNjPXUuxgILAxDTrLXQ+kn6ORzvo85ldSg2B5wBozTGDuw0ZG5ocnGHU8sfcXuN/2VpXUbbC2tOACVG0ZtTNSAq/gjzQ4jvudtltL5kw0iwOZ5EamWIFmVu0ddj/ZCG7B7uqjtP2EpCplZ1Se6BzE0qFKlzqA1Y+4Vy/DximQyxMxo5aD5lvLk99fHrGI8N3puZyYMMGqtjQVfLyQlW/U+IeMXNRcir2ZAWJANKpI86xsPGRzfDxbhSJgwzRX2h61vsy2PIwU8x9pDa8Hc2IpTpxIqg/sqW1msJAwY/tSh9nw4HAYk2fwfniX6X3Dn7kTd63Rj2+oHIVCh3zs/a+yrdK2HNAbLDLPQkRQOVzNH5PVWz74fhQaBDCidvV1bmjiBY09AVfn/s4j3KjIP4az3dZLpLAcJQNVX5T+tkNXx3zdSCXUe53OOW3Hcq6EWXQx+X91aWCrk6lj7VFjyNfnXv4u8rK8Q/alsZx3uKYud13yQxe7FEdn6gtkSmJPmNXqB1zZUK7u1pafHGohyoV7Q3jP/Z9Yegg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(376014)(366016)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oCxvH+DOyycuAfIxLd/x28GKIlmkPgLVd3pjjbfVGDZ9KceA3vLTLfStpjdP?=
 =?us-ascii?Q?msiBOtPoqmTszzCS5OMoC2twMUGqZsUWD5h3M6qTRBmydFNVLPWwDvS68SNZ?=
 =?us-ascii?Q?HDfdD+pVt8CFBvGdo/XSQz2hJsr+2ntMX2/wTgPt1/+jQflUONSpt+9NG1OT?=
 =?us-ascii?Q?DHQcxEp/bR6C5Mee+EBtoQtRSnWowrU9BbnYfBwBsWbW54MCMc719DUZQ9w7?=
 =?us-ascii?Q?smaYxO3j9671BzLqck6ia0q1N03b4EGEjOvO5semv47DIIimh3sqqe9TxDXN?=
 =?us-ascii?Q?ksqOx5N7T7FxyPaK63DiB/K/dbTdiBsHbONyvlVxOC50Rk9n+1Vb8fJ4mmpy?=
 =?us-ascii?Q?yGOi/1agrIciAFZRNuExWS6awm0cCY0OghUYF/N4odT5jomWVs+YlSBhQuQN?=
 =?us-ascii?Q?hx1Qt6DPH8qMZqnIT1iPOePfSvl9YwUcqnbzIV12EN20dkeLQUjJil8lp9s+?=
 =?us-ascii?Q?sLRykLNrCpDounGDFDE5fAg9FBjkTuJWLr+3Be3fC+0rpxfTQjOlH2yULN55?=
 =?us-ascii?Q?0UWEsJYr7YTC4HBrugHyC2M2FCm2ANFm9qDSFoM/ult2/+0GA444QxT15YKL?=
 =?us-ascii?Q?HZnWFGd9RwOBx6K5MPfMEbw3tXNEhSzy+Q2uU0Hf/oJc78iBvrUs4E+K9umh?=
 =?us-ascii?Q?DZ6+cc/UAT4xtaawNBdndJpUDZPnq/gLjp9rugwL9n6GrzDgWcOT5+WWjcY0?=
 =?us-ascii?Q?NBMFrrAxtXsSUUAw3fv6HEoJ8m0j4Ooe+4MmpV02qXMnYGQHWLLVQ+kpG0B3?=
 =?us-ascii?Q?ksveOE+UorAcHWPPcDIjSBLGU6W1Rs99ePJ2Dc8vyc7AoOMkva8oikU2E8Bk?=
 =?us-ascii?Q?mad5bcj8ccs/cEcf1ean2/GLkMIuKrySMYdnzH3PH3WU01IsnL7vHZjt8/5P?=
 =?us-ascii?Q?ZuE1vMJlRZjoqedtHCqCnMoRB8Vo0J24csBSzTpoJQqx5lO5M6wOst/RS9bi?=
 =?us-ascii?Q?V9bMrZubz2/ta0ixTMhf7yioznIMmRxnlCbTLQ1KoM81qXqDvawLobOp+NV/?=
 =?us-ascii?Q?18HB317bHlAswxuuBkEfyRdM1Imz8SXEZ8XJTNeGFSN+or2dhxKIXgBXQZ5g?=
 =?us-ascii?Q?uDSjPWre3oN4GpiRObQ5jlsHyl/7BB1EsSSiP3s4NyeUgZa+qLe/x88Nrz/7?=
 =?us-ascii?Q?siw5M7Del4fR+ZuTu3SnFQ2wlm840F699TemtF6CKS4+L7RL5dRkfFfq0+bR?=
 =?us-ascii?Q?TDwyKBjNLOQX2DwLqE349j59ZB74r8sKXBuGOjh4eV/wS0vgesc4Rw3we5+1?=
 =?us-ascii?Q?7e3WhqbRZgr0a/0OfGsgREIEwDVmFMdb45cYUKf0w6ZRFCZItkT/G43XOzIb?=
 =?us-ascii?Q?uZk1u3h4jsX40zSx0bEQwgoeWKC7mD3igMDqzzcIEQVpLA0+M6fNNKJDJs8r?=
 =?us-ascii?Q?zTtj8mNGoREhO6OxPtIfWze7Kfvqg0q3Xq7Qydn/A5qAqUKs1tXdBeG+rw9r?=
 =?us-ascii?Q?Op+0D41ts1FvMJC2WB4BW+nguXsczfjyBQQfyBqYqYAmVrI8GM+kmauKLWBv?=
 =?us-ascii?Q?PVssuHsL/9U/PFqLF/yaSvncCi2SN/X5/qMLJ1KJL6zUEP1GY6OzTxXI50oJ?=
 =?us-ascii?Q?6XaN5bXpjncDA1oZ81DT+36PR1TYHcMhBwkoPVrg4ASzWMKSh9S0JXO1hDPD?=
 =?us-ascii?Q?OaqKiq9mgIwO2DnAHn0G5Q37kmGybZnyFsBC5/nMOGVuqpti0+8DNcUwOu6d?=
 =?us-ascii?Q?lO4gVzTvJvKWCytggtHPtzYIYVIAjCvFgCucOlaGPgLHfNJnAAHiRBNGVQsX?=
 =?us-ascii?Q?42iVLugSUw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9676b9-632e-4cc7-534a-08de8bf05bfd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 11:02:38.6933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxDoTd+VAfvGU5c/f+9TdDxSxwXnj4+YNRa1dPQOHUfpbbI6qVtqJMUxFrSpMPAA1EMPamj7XMDg2MeZ6Y40PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11920
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35546-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0D37B343331
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 03:08:49PM +0800, Peter Chen (CIX) wrote:
> On 26-03-19 17:57:15, Xu Yang wrote:
> > In current design, we expect 2 ci_irq() to handle ID and VBUS events in
> > usb role switch, like what ci_extcon_wakeup_int() does. Now we only call
> > ci_irq() once. However, this won't bring any issues in low power mode,
> > because ci_irq() just take the device out of low power mode, and then
> > ci_extcon_wakeup_int() will call ci_irq() twice. If the device is not in
> > suspend state, the device mode will not work properly because VBUS event
> > won'tbe handled (ID event has higher priority) at all.
> 
> %s/won'tbe/won't be

OK.

> 
> Is it possible change ci_irq_handler and handle both events?

Yes, we can change ci_irq_handler() and let it set both ci->id_event and
ci->b_sess_valid_event flags, then queue a ci_otg_work() to handle them
later. 

I think this just unnecessarily call ci_irq_handler() to handle lpm/non-lpm
case as the final path is ci_otg_work() and it will handle lpm/non-lpm case
by naturally calling pm_runtime_get/put_sync(), otherwise it relies on
ci_extcon_wakeup_int() to achieve the same purpose. 

Both methods work for me, may I know which one do you prefer? :)

> 
> > 
> > Although 2 consecutive ci_irq() can work around the issue, do not do it
> > because ci_usb_role_switch_set() may or not be in low power context which
> > make the ci_irq() purpose not unique here. Because the final processing
> > is in ci_otg_work(), just directly queue an otg work. This also refine
> > the logic for more clarity and not set changed flag.
> > 
> > Fixes: e1b5d2bed67c ("usb: chipidea: core: handle usb role switch in a common way")
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Jun Li <jun.li@nxp.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/core.c | 30 +++++++++++-------------------
> >  1 file changed, 11 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > index fac11f20cf0a..1bd231a852a1 100644
> > --- a/drivers/usb/chipidea/core.c
> > +++ b/drivers/usb/chipidea/core.c
> > @@ -618,30 +618,22 @@ static int ci_usb_role_switch_set(struct usb_role_switch *sw,
> >  	struct ci_hdrc *ci = usb_role_switch_get_drvdata(sw);
> >  	struct ci_hdrc_cable *cable;
> >  
> > -	if (role == USB_ROLE_HOST) {
> > -		cable = &ci->platdata->id_extcon;
> > -		cable->changed = true;
> > +	cable = &ci->platdata->id_extcon;
> > +	if (role == USB_ROLE_HOST)
> >  		cable->connected = true;
> > -		cable = &ci->platdata->vbus_extcon;
> > -		cable->changed = true;
> > -		cable->connected = false;
> > -	} else if (role == USB_ROLE_DEVICE) {
> > -		cable = &ci->platdata->id_extcon;
> > -		cable->changed = true;
> > +	else
> >  		cable->connected = false;
> > -		cable = &ci->platdata->vbus_extcon;
> > -		cable->changed = true;
> > +
> > +	cable = &ci->platdata->vbus_extcon;
> > +	if (role == USB_ROLE_DEVICE)
> >  		cable->connected = true;
> > -	} else {
> > -		cable = &ci->platdata->id_extcon;
> > -		cable->changed = true;
> > -		cable->connected = false;
> > -		cable = &ci->platdata->vbus_extcon;
> > -		cable->changed = true;
> > +	else
> >  		cable->connected = false;
> > -	}
> >  
> > -	ci_irq(ci);
> > +	ci->id_event = true;
> > +	ci->b_sess_valid_event = true;
> 
> Why both ID and VBUS event are set as true unconditionally?

The main purpose is to simplify the handling of the various situations.

The usb role include below types:
 - host
 - device
 - none.

 1. host <--> none
 Above change means ID change occur.

 2. device <--> none
 Above change means VBUS change occur.

 3. host <--> device
 Above change means ID and VBUS change occur.

By setting both of them as true, the logic can be simplified here and
ID and VBUS otg work will check if a real state change happen by comparing
old state and current OTGSC_ID/OTGSC_BSV bit.

Thanks,
Xu Yang











> 
> -- 
> 
> Best regards,
> Peter

