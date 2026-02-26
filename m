Return-Path: <linux-usb+bounces-33733-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAvdOjwmoGk6fwQAu9opvQ
	(envelope-from <linux-usb+bounces-33733-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 11:53:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 960061A4A1E
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 11:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 381C3302EFB2
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 10:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5584431BCA9;
	Thu, 26 Feb 2026 10:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="T7ZzLhJm"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011035.outbound.protection.outlook.com [40.107.130.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BB9314A9D;
	Thu, 26 Feb 2026 10:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772103192; cv=fail; b=ru3bO9SeYW/iMZLkT2O9Ex+Vk5H9m48JI9odhBsysIVIfeMkmeNF4z6h8u8qtBi4rzyDHAzLkj9Q3Ks9Z04Oi6wa+k7+PjWiaoAasr7HuK7u3Xq8aeY8/QNNsNGSXmqCzYKWuT9k7dXoqQ4G6BQGV+YOWmol38UJcVXfCNcTddo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772103192; c=relaxed/simple;
	bh=uU8bsY2kEVwmNtE7yu6eeyqMWjEj8DUNvy1F4Rn/w3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dX0JmoSILgpQsaQMisOp+76SBnWQZy4bxuhz+f8Wu+r1lttVbX2iVih+PeAWU3hUesk25p/6CjJn3I9Si4pD72w0VpjLi3Ep3/j5sRcB6cgqzG+hlpRumjMj7syjR942qxwbdRgBgkCNE8LgoKMk5vu5Egw9TbvS7bo3bzX5lY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=T7ZzLhJm; arc=fail smtp.client-ip=40.107.130.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ep1SrkCbxEQ4F6ADXDmjrnoTkUL+wdSQnM/wJ5MjkYahPXN3kLLfK0zbez0uS3d3mCAgVBi/rBmIjD3Jt57TpFHt9aBnM4m5s5/KMEpNv2WhKeB9oEv9dVlUytdruEH+HTjF8pYLlhmmuH0KPnzV2FYqaG28oUiI7S+MK+8DD7JDon4y/HupnFyq7QgcAMhpw2hUPN7AxrvojORxOqg2v+aj4ozquI+rI6oz05LYOBydNWQaiWeGYdzyhX/dEeIeWTLkFZRlrJvqMjyUbrzXTvRlvpqEnO9FrWcV3Skn7srKefR94MpxolG09Wuv7EKRsJpOnc3mjzgd0vCYSyJdHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIoEswi3rfFEhcOUwxAMlV3DGa+UyCj+aWUQXZlW8PE=;
 b=cGTJihLTIdCmXC+aQEmEsGO4umx3sbkM9aUBanMrZSKv4khfjBLM3a9p4Nfm5UGnopg9BqbauVhfWUtNCQ+RnNLbJHo+cnORmsPq5PPuN4l8UR3tQdtSHW7rI03bI49DZoNnrEsZGck6E+JSv3t1C3LygNEaUz0m+WN1QjDEzFxCvi+nFdT8v8aCwO0JydY8R2JcCVnQym6NMowFmBcoIxg/el8yWigjbN648CCNRu66X3BEa93lITBV1w81U2Patdg5xWsJxR29Y2p93t9cs9DhmhOT0jg/b+6PD9iezELaLQOIau5ku/k34IfcNT2FXbKvvXR6d39omx6zsQ3rRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIoEswi3rfFEhcOUwxAMlV3DGa+UyCj+aWUQXZlW8PE=;
 b=T7ZzLhJmbqtbtHNjyGsLacmd9jPUwjTbG66mMUfh46fCcRX8wjx7kisR/v5Nne/Z2SOvLF+Xz//oaVSstqydrknSUUricgUabNk5lPa59yXesuQsOfjbBdmj98T1lPgwbDGxmSZ94cDW3y2C4NdfCYyN0aU++1PN03L+gzRjALMnYF/8RBkprl4nkX84I4FZajJtxsa+LjJDoXQaXCqDHeDTV9Di6pXgSFCe1A7AD7zmckxkyqrZ3UoxrMUXzcU3N5I6gXe3efvZsfs0O+rphF5u87u7SPp4ocTD9Hocy2xJep+LTZ5TZ94iCkt8O3Kx+2wqwRsMSPFsxOskmntBFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by PAWPR04MB9815.eurprd04.prod.outlook.com (2603:10a6:102:381::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Thu, 26 Feb
 2026 10:53:08 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781%6]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 10:53:08 +0000
Date: Thu, 26 Feb 2026 18:45:29 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Fabio Estevam <festevam@gmail.com>, gregkh@linuxfoundation.org, 
	m.grzeschik@pengutronix.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: port: add delay after usb_hub_set_port_power()
Message-ID: <mfzphpxztcy7nxfqwcpymzvgvqkibda5igsakvups7p27ozdrb@f43ziou5jl3p>
References: <20260224031909.3546487-1-xu.yang_2@nxp.com>
 <CAOMZO5Br6uEJ5ffq4JCary5p3Di+bF4MDmUtOEdDqpU6xs6VJA@mail.gmail.com>
 <2r3pvujs6vdl5si5rnplgnezw4nllyunshipetvztowkngkv3h@glsewrhncjvl>
 <d59d063d-4116-4a5c-a29e-6527aa4eadd2@rowland.harvard.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d59d063d-4116-4a5c-a29e-6527aa4eadd2@rowland.harvard.edu>
X-ClientProxiedBy: SG2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:3:18::25) To AM9PR04MB8825.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|PAWPR04MB9815:EE_
X-MS-Office365-Filtering-Correlation-Id: 94852bac-a290-455d-40b0-08de752539f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	S8ZrbP6POxbVpQC5KFYnGD3ZNHdFO0Pzed/ocwBhePlgkqcSHnAIEp2zJDaPKibT/yNG0VR3h9ttnGV9reHcR24Nn02/cBXRZuHCrGRAMp29MLQG8R2dITOOec6Ta7EFT7XPmZ2PjDAyiZK8SHNH62G6KAujBNGsPGbAzB4HFaYcYREDGB/fJRgjW1ED0SLB+tNATjDuSDUFOLx2P39ICR+/awg9CX/KTXDPe/TWQqo/oqsg7bZNQLAamJD247GCdKNdMcEYi1aH7KylW4ScXbEFuimnzqAMKlW6C1YDiCF1arkd0hYhrEHBu3xDDcaX88mioFv+b/Fyf/4XMQq0hnsBFq0Is//1/yDaep3fZi0zqviZLtuRbI5hDiv7TrTM13v+akEsGCqX3v+0OoyimzD9qRE+bObwIrAYqpG0ubHxyA78lB+oOvLDhaO7NT/6D+9WnqiLuRkqBbp2rjP0P01HaaLXyxj7EvjFHdlo2BXUb9bcf0fI3YWCpz74AoYxBGCEcDNjk1p+cU4xmV0hCTU7w7FBrhQuBNZn39N58ELGkmer1O39lNEiR3S66g9dJHgA1khSU9ETQpDpzC0aP/+e06vE9uDFiQTKSeYME//8SrLcjl8ZFdFq1tXaptxm9uG9syV3N9b5pOlAwQW20SxMeZ63SX918Ow2jkALQnkKruTd5SuIUGWY0ZAQKzwU7pJKI3aO3GdjB8aZqAChYwIvvKG+tn3TitU5qaXcgoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UIYJ2zLYGZq2JzrvRW4UDGwp1y25bOu5XzPBd93i+EoSIQFe2Q2cLS/aFay9?=
 =?us-ascii?Q?NEO4FXAKKS2USnZRZ7xvjGqBLB/Z6LXXZLfGwPv0D2LtlwOZYvnzkXuGznSm?=
 =?us-ascii?Q?E6DjjW+heo9/9WSkokjw07EdXdQ3wOmhC2dqPrTIiWEk7r6mC50gym2RkWsA?=
 =?us-ascii?Q?q8zoAaEGUwCk60UESZrhU6UL00MAHmkj3OG5ZwtaVPxCkR8Qmm+3F4A/F+68?=
 =?us-ascii?Q?SOkedpjCcN6zrmsKpGl73GTJ+2CjyJrZqTaafqAmM/Ol5yO2Z4LfEBNYIGKX?=
 =?us-ascii?Q?3jTN+AxJw6hW89BbjG8LkzehBM6gFoQpeGcrapKxFHBpffy/Aa8LD3S1UlWg?=
 =?us-ascii?Q?Jlb/JUygRS9kXWKPmjm7W5BiaBSVWK6rHFBNr+ydSkjvE/6yMsfMlddSGC6I?=
 =?us-ascii?Q?9FvQ5PRkSwVQe9ydz6JAIX7Mi7WUACsLSaUnAsEb4LxdURJFb5jiqMGIhVjN?=
 =?us-ascii?Q?xao38XpCKo5h7RalrvqjttOBYiErwLOrMkZFiLvoOSlVLgNglmEq2e3waFJ6?=
 =?us-ascii?Q?eY3m6tURqc0Xkzo3vhNBsW5g1ggDJqLEOrrRtgGy20Ndl9CKDM/bGjUEZshH?=
 =?us-ascii?Q?zWjHiaMfucqZ4odW2jncPfvyi48NOzaoN2/WeefY/DDfYcQRvSIOvGtAuNaI?=
 =?us-ascii?Q?qQ08MltW8Y4zOF69ddgqkiBZ5ARfhcN8pyhFo3LDNGZwM5jCZNjxxqcvJ2bN?=
 =?us-ascii?Q?nwk7IdudvPExhy/OU10dsJJjlF21tDH92Ysw22mB+jn8hzuixoof8Vv6EkWx?=
 =?us-ascii?Q?wHUMFPgHwY2nezVrFWgXnPZgU5QVh+a1u7aq27pllIEHPzNm908NYx/I/p2Q?=
 =?us-ascii?Q?HRQdvUJnIyD1+MD04/oN+0kv3gl0U+KHmzmoilQMcQBLPuc1s2Z6phQqwi6z?=
 =?us-ascii?Q?oSS2aAn0gHXjvSt8wFyyWC/WFT76DwWvtYM57ysYuj2gQzpcbkGXzkSM5Vvk?=
 =?us-ascii?Q?0FR5c8feRJrnDXcEV4WOIKcvVc3VFb5iJd3Exe6dhJsSN29g6eThye6odZEV?=
 =?us-ascii?Q?MN4Fe7DhUnqpOrea7agptBQ3P0fPOhuLu5Y8W51iEj/Ow0hoI7+3YiqFXO7B?=
 =?us-ascii?Q?/ixePKKdRTIMgnKwOA++q/2PfdkWbHBu8dC+LBj17ngvt6F2L79s0ZFTFT0s?=
 =?us-ascii?Q?6ewN3ndLqq0jHq03CnYqJl5e2cQSpwZdZFTCC7uhdLyl6yOu9dmovrDIsRzy?=
 =?us-ascii?Q?jZKlkH41uU0vs0r+zq5ib78aVSglcVIYm4Wrb9z06o1jVBqcidutO3ntpzVy?=
 =?us-ascii?Q?jAkdxI5MvM9lBKykeADkZ1Z65r8EURBtWf+94R3LamC5/bjh6tPbknZnRSHB?=
 =?us-ascii?Q?aU8RnxZflz8cpTPV1G9IaGGiFHzx7V1QmwKbmt/6KNk9DUPHzGP2ybz7fBwS?=
 =?us-ascii?Q?SxorRh6bNFTZNjc9SgrB/lLdVGo5Khr64N/v7gT9+FSjQTZm3BOVTUBx4YE8?=
 =?us-ascii?Q?xxKXibcSevoNiR8IxZXkqQM99EaQ8aCUpGyRtsHezRrjC3DW760GgTUQDvP0?=
 =?us-ascii?Q?FwTGOshWq17CpqyUR0mX+vOmUdEwgsec1IRrl+SB75/Ad2nqbBthTSliQttY?=
 =?us-ascii?Q?ZVG0IVORPE5P0dPwbR51Cd1utBU0C898XPdxQySVkcm9/mx02QW4Q452o3GM?=
 =?us-ascii?Q?1LaonQ61hWb/q1d043bpxUuZpiJjznp6lpl2fZ5Wu1tuWuAblg6utEtuFyv5?=
 =?us-ascii?Q?RRX7yIBmUGUkFaQJ4a9B/C3lyemM5Pr1qDrxHz/xKy2EZaC4F/7Jlrt8rzN3?=
 =?us-ascii?Q?Iq1F+NsK3g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94852bac-a290-455d-40b0-08de752539f2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:53:08.3429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4V5zuB1n4KVhjGVHkYEkR2hp16ZXXm0zei2bY9IAXwyLYGQ6MH5vlbGTPfRv9uOZJXrN0kplHBrZpyVEejs/gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9815
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,pengutronix.de,vger.kernel.org,lists.linux.dev,nxp.com];
	TAGGED_FROM(0.00)[bounces-33733-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 960061A4A1E
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 10:17:43AM -0500, Alan Stern wrote:
> > 
> > For ports which VBUS are not controlled by PORTSC.PP (always on VBUS
> > regulator or Type-C controlled VBUS), they are still powered on after
> > you disable the ports. This will cause PORTSC.CCS still be set after it.
> 
> That is arguably a hardware bug.  According to section 11.5.1.2 of the 
> USB-2 spec, when a port is in the powered-off state its transmitters and 
> receivers are disabled.  This implies that it is unable to tell whether 
> a device is connected, so PORTSC.CCS should be clear.

Thanks for the information! I'll check the HW behavior with designer.

> 
> > When usb_autopm_get_interface() gets called, hub_resume will check CCS
> > bit and check new connection again. So you see new device is reported.
> > 
> > Below patch will be a workaround for the issue when you disable the port
> > many times:
> > https://lore.kernel.org/linux-usb/20260223-v6-16-topic-usb-onboard-dev-v5-1-28d3018a8026@pengutronix.de/
> > 
> > However, it will still report new device when you "cat usb1-port1/disable".
> > To fix the issue completely, I guess the usb core needs some sync with the
> > port disabled state. 
> 
> Another patch on top of the one you mentioned should be straigtforward.  
> Feel like writing one?  All it has to do is make the hub driver skip 
> handling connect-status changes for disabled ports.o

That patchset haven't been merged. I might be able to do this sometime in
the future.

I just have a simple test, to skip handling connect-status changes is easy,
but to make it work again (echo 0 > disable) is problematic because
when usb_autopm_get_interface() is executed the disabled flag is still true
(so the hub will still skip handling connect-status changes) and the port
won't generate connect change event given the HW is buggy.

Thanks,
Xu Yang

