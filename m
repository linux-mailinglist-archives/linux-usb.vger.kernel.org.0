Return-Path: <linux-usb+bounces-34584-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IILMe+GsWm4DAAAu9opvQ
	(envelope-from <linux-usb+bounces-34584-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:14:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DE92663C0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F02B303B189
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5112118FDDE;
	Wed, 11 Mar 2026 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oFxEvwfr"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011062.outbound.protection.outlook.com [52.101.65.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7EE35DA57;
	Wed, 11 Mar 2026 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242058; cv=fail; b=jhHSGTrq6U4+Io/fVM4es19o8+UVo7moPl195mEgWpgjNtUNhrUExcYI6auacoBLyibkVQB37szr2Q4iCt4vuZi314C0L5ml1F8ngJrLNKAbCHM8VV91YZ6R+1i9nZqnufMdolmwz/b0ptbCQJX3MlzvbxyX9giDvMyq8RIOjJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242058; c=relaxed/simple;
	bh=1giawrnMBVS6+/gZz4gLKz9Kmsd9SQGPj9IHhzVMJpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PG3mUQBLntYUELd3kMQLO3QqgPspO6BoUukrcyNB6/ewBlvrkIiwbwwaoy785yO433KbNKHQo78WLPUOf0Z/Eqy7wdLaOVhLBmbi7Zy3gPGDRDaW0vxhTPrp6FOrMXAabWJ3PgNaPLuk/06jXl4LskXB0n2NWKuQQ8/oNLSoYpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oFxEvwfr; arc=fail smtp.client-ip=52.101.65.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZMzhqbun+T7tMyqXzRkVYbvv3R5277PF5SCB//3O+TC+muFPzdIfii1p3IOoAl9Zs6Lfi1cEuMHe18a9jVlf3au/P9GNbmsSpRQX59uxy2sxKhzA5ozOPIACRlBL7Nf/k30Bye5YpUlLwPV5MiwywyvnmRo2VtzsPBeDuHvdE4yUlcp4stdmZu7rMul1qEOW+iTcQ+5YLtym2HcblBSjAK/63XOq33u0431heEQv8+PoISFdT1ozvmFY1f3hWwEFtm04U3Oj5P9whA1EgAz9Knu8j4O1lwU5EgJiKQ52WDc694jZEp7tu8Y0TIsJXNqufa5QUMbndk+VwlWIszw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPn7hjVymammlp9YAsYPCPTMkiAsD024MwNkWrlbYjY=;
 b=px76+zQPoHLTBJvo322BW4rp5cnUF4SoSu42uQBQKBi+PbXvexSDdIs2sNP3NkZcz6R7TmBi/35RUEwMe6bNSKvdR40C338QuG2l7hZtSLpmDuoY0bbo5byhzdeUMKgK2HD9l1QSenTbSTMEWBb0S/mz18e2zih4i0Dry0GMD6hxNvyvLIx5Wmm4NQHvHkrPlIRBjwaY5j6Xk3Ycq3CyEif+DFYNuGbQ60gPIztkjZk0i2VFyAM5SE8eexQETcY7D2FnltZKjR7+UOeXyNDh5p2pociUFrZSA8vyk02pw2HdH1TxXRpEDSJD8F530FrDCThrBthXJ4eLjXhiNUFtxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPn7hjVymammlp9YAsYPCPTMkiAsD024MwNkWrlbYjY=;
 b=oFxEvwfrcP891uEj6jNJbAbyRoCW5kEn1v8JrJ2XbXJx88nG+AdrYBXB49ByHwOYSdFfniOpQJgoOktK8f+0I7qykXfSdlQfHmlXEwpkueBqFkN3nig+45nkwTTXhAWaM7o35BOA0hOI8slQrs6a+KqGW58OHwIMIIccZ2wJfPRd3WqjV7M+Ycu/ZoroJditnfmX0EI4FahwPk9yGhtOjnHeOEevd/2suGTgqjmgR+35IwU/eUKqpjZRFT18hnrVSXiTYjRrMD0JX6cy2T/nuORckBcYMNuwZXRt8x+Kwpy7Jk/6odToTZxDc97HOARehYlzCjjP7vTDWskhvCx/Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7658.eurprd04.prod.outlook.com (2603:10a6:10:20d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 15:14:10 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9678.024; Wed, 11 Mar 2026
 15:14:12 +0000
Date: Wed, 11 Mar 2026 23:06:26 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: nxp,ptn5110: add optional
 orientation-gpio property
Message-ID: <rg6zvwx25ds6tmsdjwi7ruirobo4nnkprfhjqwrcnoievgaac6@m5i5potfltwr>
References: <20260310-support-setting-orientation-use-gpio-v1-0-da31dc6cd641@nxp.com>
 <20260310-support-setting-orientation-use-gpio-v1-1-da31dc6cd641@nxp.com>
 <20260311-hasty-talented-shark-5fdecd@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-hasty-talented-shark-5fdecd@quoll>
X-ClientProxiedBy: FR4P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 071b5018-a60f-4b19-c92d-08de7f80d94e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|52116014|366016|7416014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YmBq/Fdi3QnHpXgcFbB7wKXf6EPTkdk/DNrEbC9tfu7GQTtxWirjApINhmnptdoGSAfgtqrW8EcTucecQny/7tPOTmMlSduEqg/60i1lRFnKr+pj0S5rNFPCNYHllQA0cHuo8ICnmzDiHnqldBLZQkeb9cttlNiE9DXBs1ZiK5qwHKNO3wXM6SQnyIqGmTNyWjH5v/awjWBV2ymHAt0SDtkr3Ea5F4qEmGS2bnAJlKc4bGZs2DiWwrmz6unSczH74H+6FLyty35GoKhZtwV/5Gs1+G7qyzxuP5zY9SCXZ7hqkzjrKT7VUtilg9M3w7H80jf1GPaz2Ig1wXxQUdD9NYgBESgfWCVULkwRiYGm+T60fAzXiB4gTwbmgeCEtjXHmvB2KcY39izxUv3jWyeKrM+4pTQovAlC9rm3DWLHsBtDee1WZbJRWwjUCLzbQvy7q0To6bjflkC6adDPuwaqAR4H+zFYMdmL2wfR97XWwmTRGIdyT3W1JK2N7F4jN1hOVWPagatCQODrGEEEmwwOC8FxkrJwNQ3jDUw+KliirlhhKuClrFbh+5N3u/d22U0QmRt5VgaRqeGL2xuQwttaE1Hf/dry7ecmFhiWV0dHDUtIGhUtXJr9wIx8iPfdLTI+yBexA2C1KqMz9+smxt4wq2d0tp5fOdlWwrzWSGR414ydzJfG2S6+WqMLMSK3hf+48UJfkn5/Cll0dQwH0ibSD1+BEXNLFZ6BPZs54ENHltDWJI4jHZq6B+/AywCHTTkMQx94kH4mEdHIhteaV9BDDzpmA8BweGs7w0wfIPFKP5w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(52116014)(366016)(7416014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wuu/7CD44cdZ9AB2UIx6W05SeY5ORwfT+l8XnnRXLVYO3O0TqTTkMC0x++km?=
 =?us-ascii?Q?gS5d+lij7D4Oezb1MP+iQRoadnfibQ0/Dl/6t8ns8WbFTN8hFct0JG+FMlXd?=
 =?us-ascii?Q?MUXWjqsVRUm5ESPJ3TsGEMVlA+262JktFQABbUZp4wEPCWsluOTee4f5py/U?=
 =?us-ascii?Q?m/2oQXEgqX2u/y45r9GntoqpHAlSEp9JvR7421qH4N/2eSnftlM4Y8/baxSs?=
 =?us-ascii?Q?G8PncdJ1PmXaaDKL5J5AnHto4tCr5y3QKaZgAgBz1AMc/CUqg2jygE0ADT2o?=
 =?us-ascii?Q?UtLfhDu6qleAzIi7eC+hnTIgudDNNSzfHIDBNOm55Y8Bp2SxvxyaH1kWSpyu?=
 =?us-ascii?Q?cWcFzDnJm2ZPvPVSS0mmdOJ4q2XxVPzqFQY0GrlRIezH8Krc2NCMpC/uyVoU?=
 =?us-ascii?Q?TH7ov2T4IlRgu8ZQZXTyYfbsS7XqUFk3gXz6xuwkW7Vwx/BSh9dhk7+siOCO?=
 =?us-ascii?Q?PZJR5HYcqDmzG0+9exE5Y58VbNXLKayy2c32rrdC63CG0aLKXd0m0jYswN2l?=
 =?us-ascii?Q?aVzV/JDpoKwrx3Y9T3nTzA5WiNWS61+xzK7TVLjtGmD31MbW4wqL61rQKpEz?=
 =?us-ascii?Q?x1Wel9c479tlpP4/ECmCmrPsFXxQyYT+lM6Drgva4+meqY0L6r/27NuoeGVw?=
 =?us-ascii?Q?z1GpwfS77WcGZpOulbc5qCnC/XWzJUW+sysPuqnM6G3e5H2gUNFdAbwnoLYz?=
 =?us-ascii?Q?vgiU7r5T77Fn6KrCKCitcK6Zzx1nLTDw1VIsVpvkLzmQkcLOw8Oa/vbrooha?=
 =?us-ascii?Q?K5BxH2d58F3ORs74mZ2zT9psUAdZk7UO1ZfIrP0FnfnxJdPB/Ym2VH51Y0ii?=
 =?us-ascii?Q?yQ4CTQTcDdhnB6LmBx73m/yrao9C45ima+vBWWqeJBki4LVH5ZsRusD00gsv?=
 =?us-ascii?Q?zMwxZ9hP3qLxjydH41p64bUf3IoMrynB+9RrVHAnvzFaluIFWvd21sM6CBOE?=
 =?us-ascii?Q?xK5dpUt3kZj8Z81i+RoMOSBBcRI0ouXK1MXxQFyKuCJFgqk27XcY9Tlpciyt?=
 =?us-ascii?Q?en1OyEpNEr+rxfFjkHBEVRZhXChYWiNqWarXUn0EbgjxpB8Ki9pgBJMWyA3t?=
 =?us-ascii?Q?xaDmNzfz7yYYiB02owoLybQG16NFBPzCm5xjYeqE+9MpLAQm2uu6noWpieK/?=
 =?us-ascii?Q?qFvLNPxfXaJD5JQbWn4JZG0VsVoDvNXqSZ/5jgRy0W/8W+2Yb7LriO7rzg/k?=
 =?us-ascii?Q?yLXJ3q3IdleemhM6fTWE2ptaLH/OI8MgRp6yKXBh+pdTiIMNJdcPr20FZhBr?=
 =?us-ascii?Q?ODvVuqgs4O8LTkBbi7V2q+cmkPJ73zQHQhjq6hxRNVmb6/vchrk39hCg6jm5?=
 =?us-ascii?Q?77S2YiGgustfqBiuEVHEA5Ei/1zZCHS1KwSpyFyZkGMpMMFC57Av34Ymn35G?=
 =?us-ascii?Q?DMsm9mwI59MKTTzxU4ooEU8lqox8vXf3Zo/cMlrveLAQWUFl93Exs+2ppAQA?=
 =?us-ascii?Q?xdKixpiekCd778HfKEfvRqmiBGrRs8ByBNdN4MomK3AyBGUHzW1AXubAtrH1?=
 =?us-ascii?Q?5p403ezgBRImTIsBz/kKfK3mlv2KYZQxv/UVmpfqS+Hp6aqhD9qO6sp4z4Jq?=
 =?us-ascii?Q?pQ7ojRDDH3CEAS96nafaRFE6Z/cg8n3YbltnJ2v42AiFKoqc1Ld6KhKqGXV7?=
 =?us-ascii?Q?CtDK/BGRORkkZAgT0kfxChCGtYuP70gSaBPYb2FUBpHPS9aVMx2G++4x1P5E?=
 =?us-ascii?Q?74A+21H50wYQSRkCI4EtigPLPEJptEznYRrrLFi4w0mYrIbzOC9YT5n8KJEs?=
 =?us-ascii?Q?drcpjHFzuA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071b5018-a60f-4b19-c92d-08de7f80d94e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:14:12.2050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ediO1ZVQO3U/QApmvy6Mf0nz8qoLR0i0E2dSmrDLv5YD20Cyz+ZljK7Bmb06AaywkCiuhdB7uQiTjm+retXdBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7658
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34584-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 66DE92663C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 01:59:10PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Mar 10, 2026 at 04:13:56PM +0800, Xu Yang wrote:
> > The Type-C chip know the cable orientation and then normally will set the
> > switch channel to correctly configure the data path. Some chips itself
> > support to output the control signal by indicating the capability in
> > bit[0] of STANDARD_OUTPUT_CAPABILITIES register and do it in
> > CONFIG_STANDARD_OUTPUT register. For other chips which don't present this
> > capability currently there are no way to achieve the orientation setting.
> > Add an optional "orientation-gpio" property to achieve the same purpose.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> > index 65a8632b4d9e..866b5d033f4e 100644
> > --- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> > +++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
> > @@ -26,6 +26,11 @@ properties:
> >      $ref: /schemas/connector/usb-connector.yaml#
> >      unevaluatedProperties: false
> >  
> > +  orientation-gpio:
> > +    description: Optional orientation select control if the chip doesn't
> > +      present "Connector Orientation" bit[0] in STANDARD_OUTPUT_CAPABILITIES
> 
> What do you mean by "if the chip"? There is only one chip, so its
> registers are fixed. Why would this device sometimes report it and
> sometimes not?

Yes, you are right. PTN5110 is the only TCPCI compatible chip in this
binding, so its registers are fixed. I forgot this truth and thought it's
for all TCPCI compatible chip. I will remove the confused words.

Thanks,
Xu Yang

