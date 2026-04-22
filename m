Return-Path: <linux-usb+bounces-36417-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDwTIryy6GmIOwIAu9opvQ
	(envelope-from <linux-usb+bounces-36417-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 13:36:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F0144576D
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 13:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE5843022322
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 11:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFDD3D1CC0;
	Wed, 22 Apr 2026 11:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kXormyA2"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5E33D1CA5;
	Wed, 22 Apr 2026 11:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857528; cv=fail; b=XiU4L7+siQbdhnWdNuTWawbcjaojRT9c4lJLgcJrPV+6IUBf0GP4cSdLkpwb8BTcuGX/iftucs2iRp5FHmFZAF+UyjO38vemOshfGmMEs6P1t7ZXxomkmPNaVGQDj+Pj22EC+e20x4A6tiKyrTlnXTqGpveMkc7045fshMaJKEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857528; c=relaxed/simple;
	bh=Z3LgIHOf4i5262wo6o6a2oZH/iiGghHy22G0RTe6KeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B627tQ+svtq7UdKjDw+Z1eJ166O3HLorcFNT4IsWx1dz9IluW7BF3de0vEI6svk4IW/X3VhgXjymIVWU+Fn/kWHSKsBcAg4FkXs8+CzuTH8zsYo/nckVRVbAwOtWJDVrOGHzSxjqGgdm2Flyf4KMEAE2Dn3/y3pnPAbm7rR3/TI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kXormyA2; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKzeWRgz/sifC2qpaY08wAVutUaEQ7Gy/WDAjZidEUD96JxonJ6QsqJPr5R+dWZon+M1yhfWP3qNvImkuKKVB5pPPNPv1qxitOqV+WDIT6xlEmufI7i1u3reLK+w0YDIswrmWzrAINWoz810xv+ktXV4Ll52DmBsUZGqPy3VM1E6IDMot1ap7qQ1d+tnWXDxB1N8j6V9HA2VLOupsz3+R1vWQdBGWG0nBn/IPwuC2WiNHKx7dw/8K9V45/NDjkYtcV0b2+huNQsSJ4dtfoIzXcOEvBa25Avk7O0zu2xXx7ymJcQc1bgpM0EvvahgBTvEsQ08fVvCkjI1nn64oySoHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRDzRsPPae5aeL/rEEkKKNgLiUAreAr7P08x/FNsIp0=;
 b=VT+zlxKh9CyY+BqHw9bcgTx+q4dvm2TTP9MsbK12XQ3MtKSNYtPmFw4MtiwQXU2O8ITDBDgdAvElSDPRZiU0GYfZJbTcrtzITxPunSpsqyWAcoQDGkpLb7UmCAUfNyVHa/Q+mgauPT6iSY7A08EMOGfJR2HrSUT4Idjm42lJOPxCMAA0pV7bcSbmQ9EoIj+PD+xwQ85Y5tEKOfiVkpOjRs9fTXvowj9Gi+V09rg+A9mDpFp1WtwO8N4/o0yA9VCjOz87915yVNh3nZCmLcZfJNcIwk2JwWJZXndhrx6RpdyPGH34KKuusKt8iTDxnHhtehPfO3hepgObc7zu+fgDUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRDzRsPPae5aeL/rEEkKKNgLiUAreAr7P08x/FNsIp0=;
 b=kXormyA2defXDNYd4sfrgH0SsyukbTvjelEkSmY1ry9k1faAqslGHNJ2qnVNGZjPCmfZ5PD+ucQyv6NXn9CevkhYGJ/OLxir48sCjFSm0ffRVFNuf0QGxZpYmJujq1EERezr0i8CouM3iOpWUG86CNbYTJnnTMp2+Y3AvF3SlN4GZiwluwSaGDtaL/OJDBS3CdqmjQd3grGEpqqihYW5qJ1+TI3LP9k0Tl1fjicP/YkErMDmekZgo8aYG0EWVEryM/bUdnElO2lWhiub0Fr5oue0tSvYJHcGel90rxr/WjwTDnKuZMPAgy0rPL4SrBgdEaN043JLFTkt83iwHLDtSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB10599.eurprd04.prod.outlook.com (2603:10a6:10:593::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 11:32:04 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 11:32:04 +0000
Date: Wed, 22 Apr 2026 19:31:16 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, khtsai@google.com, 
	kexinsun@smail.nju.edu.cn, hhhuuu@google.com, kees@kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: gadget: udc: skip pullup() if already connected
Message-ID: <5ybgpy342zdtcudp3brizuxyisrv5zxsfegwawtaxyvlncnvcn@htqd6bnqdv5j>
References: <20260421082050.1260823-1-xu.yang_2@nxp.com>
 <e431e2f9-ce24-491a-9447-1b872099ab25@rowland.harvard.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e431e2f9-ce24-491a-9447-1b872099ab25@rowland.harvard.edu>
X-ClientProxiedBy: MA5PR01CA0241.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB10599:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1e07b4-acee-4dc7-eddd-08dea062c718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	brdEgkCDInf71xEMgCNsVB6E7X0UhB9pUFELroyytbqSsdU5p+kh0HV1Nip90spVo9CX/ILbXmno6zHBNzYzmm5diXjhaDVXPdhIViPcpxnJa0eUHNy7joHg3wL48YeUmxOugq00aKaxVLoRc1g1UAwViY5/mkqGIAsIzqdH51/UNzevzVfkB3MCGa8mUz0vOmQkyCoFwJ9m74hOZx98L2gbWJfoo1GanP2Y0pym/qeV3XZstrPRCQ1Y35PstamMBBbINztlQ4D0dyathR4rqALE4zJVA/AXlgeNg215N7CglINzpUPzWa8goFiXOnA306R5TEwE0n7ISd80+B+Y/SUrf9FXmf8twgFJtcNaBOh6yhmr9yCy0YdylXHPVyz41nJJXiG5lZ0ASv3kiWLoMXLtrluXH7ztKf+oa/w2Ol1lbxbZQGhX83bpwKV7b9GqnMs7NuiWOZdktMzY8cIHRBUuuVMX8O0AOuIe3PHihTnNeEHBD3EM5g1Diep1MlPE/AJgvN5NfNkUMp8R4Cfn2XBpyFlOBpNGnINkxo5nlZ4XyudWGtvItfKcHXWYHxuW4c5tF7Xx7TA8nTmIzbHi5gZmkMXTbq19D+jZTii5632J1Xn/ct+vabZsiGP8dD8SwT3u1umPinkMSl4hbPBUJ+QCAErGvi1jmtpGO1sqJqWNH0bYthnaatEDWCJYbJwKltTNag3k6C/UmJKOeuK9IgM7b+qM1b7rpaX3E90wTEPl5E+LnwO7DSwzCgfP3y0X9saulZKkjx3S6NNdnSwnIjEEnUxSra+vkbOgR5rwXoY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qdOiYqLuluIXIARHadtXqjvvbjftNSLNknqJjFbPF2Q0YUKQht98rJD3YbkS?=
 =?us-ascii?Q?BRmH07zWVe7MYrYMOkA1rRQg3h1uM3xwHHdAyN7EET/8TFNqE+ro14KyaT9i?=
 =?us-ascii?Q?ivLY3TcIj924mDAWi9qR3smL2ut4ifU8zSoOFBzLmZhwsWvAbeqr5k/Si9kV?=
 =?us-ascii?Q?LpHlO6ueRFq3LB7Cu2I6M7uVo2L2KJAuJ4eeG8Z2SaXtlUTKGa1pSHxXadwd?=
 =?us-ascii?Q?jRaoBT9VGxTSAeS4YcAm/tBT7aICNTyfz7JIIlkYZxYwGLonsXRgmcHkjjuK?=
 =?us-ascii?Q?OvNs/ikVgA55C71TeFdByztt37wGOurzKTEK6EciBnjZ14SAmXjUsd6yfh4w?=
 =?us-ascii?Q?iz0opGT3oiaB1qm3rMvmROR9c9UWrylrcKKtjcaABRTsYej1qzfOmoywYkNs?=
 =?us-ascii?Q?6X/LampP/qE/ioMNyr5Vmwm/LgszZybDEjuDvo1Pwq3930+mh96ANhQ0P3I7?=
 =?us-ascii?Q?9fniLnUCMpWGORTp4YT8+Zw7ZX/C3q/zfsrYe+cN+1Fd+3qtGrxhRwZKRM4s?=
 =?us-ascii?Q?EEFR0N3hKpsK0dTYApCkJeMT/vGNs7qPLCb9Ng4RwDtOmhPgBzwcFs7JvtKv?=
 =?us-ascii?Q?HzDLGcztRU2aWM//60j/tuFZ3DVhNN3r5VagGcdXlsIabyZY5/ePCymle88v?=
 =?us-ascii?Q?PKbglYrbiz2D2JkIRkR+vC+Rg44t/lFo+N5BLntZ8UKqpE/gGWOl/RGZOggK?=
 =?us-ascii?Q?04buSnfiia+BEH9tO1DPWIt/zmn8RuX/T1+jlOMHp/CyFsbaVAE8CRKqYGym?=
 =?us-ascii?Q?Ycwx0wpXMzcmWodEyDV0yTmlZAiudzDb524Cy+oBJPtPinPl157Ky2VfZYZt?=
 =?us-ascii?Q?B4Xq31gv+sL4S0dmfOXLtheSoGMRlfjoAfpvray1Rt5exY0HnwPyxPmp+1qU?=
 =?us-ascii?Q?1hl34y4d+eevr4VRL77rSOu1qWC1P03pF9ThX1CSshfsuZ9OobDLVeafDuzC?=
 =?us-ascii?Q?vl7ZFJHGrUqzIVVMEp5y6rLzhLVkyk+5hPrYLcQLMmtlpNJ3l2gqoL9u2Csf?=
 =?us-ascii?Q?+U90jJNU9ZlI9PuYa4XYDjCGog04RUolxMXarf0b8SJvi/b3oaR/NrnMEtzd?=
 =?us-ascii?Q?mOSLTJwF0FIp3zO+eOk8IRNHD2G/PKsDN6OYCaiKf8Da7dP18DJAc/96tH1k?=
 =?us-ascii?Q?i2MBJXADj08NDQsRTnJsh9kVhgnIlqnVH2rdnZYSk4RAR2itdBnqO6WPfnjs?=
 =?us-ascii?Q?ULY8Fep6R1MbuWfg9obBdr7pXm07qV9yP8iCrlFZlXCfgYsIEGm3divUqdSv?=
 =?us-ascii?Q?oP7upWWHVWIBP34VyHprbe0W9/CbzNKFuWM8XR0vIC6LGZctn+QiU1cdXpcA?=
 =?us-ascii?Q?sfU8sXMRkR7FtCk6ZmLiuj2mBmX3ueC7NtzG2P7KGTiwVvsrIhoICe58aGyt?=
 =?us-ascii?Q?aHUISSMD6abkeizStW4nZ+/5yGrUo/rC/sF+GnRSvZRd5PzhM7a2MIJ3Op2+?=
 =?us-ascii?Q?U+dQO2iRvgVjQ6JKukzws5cuqhuZj2dhWp1VnJNYWM3BG1y3WsuMHhY6rQNp?=
 =?us-ascii?Q?RA6IG5EUSM5ETBZlEGgFKTprQc3wtq05TelkNiYzesMAcOFFxck8tV+hAhZq?=
 =?us-ascii?Q?p18MOK5J9t0W2j19c5Zkri2QbTMTJNF2xmO7J9GQnxQ0mAgM6LsZT/bVuSsd?=
 =?us-ascii?Q?cjSWn5Syk45LtqHxxY4JtUJYlRGBFW9be4X0q+lDzs57V8F9nF8WGWTdW3/k?=
 =?us-ascii?Q?mtajKFbQFeQdQLBX8icSE6s5tXwp8tTTp51EodujNAo0r6GEKTdZTI2EWxIr?=
 =?us-ascii?Q?snGlQXQ9Nw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1e07b4-acee-4dc7-eddd-08dea062c718
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 11:32:04.2295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIfs2ePhsqhhAsWOvQ6QMB0KqoL75ao/0uqEN7mtBrZC8nKbdkYjOU938zML/LxrXWsPGH/2QchgV1VuE+9aJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10599
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36417-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 87F0144576D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 10:37:53AM -0400, Alan Stern wrote:
> On Tue, Apr 21, 2026 at 04:20:50PM +0800, Xu Yang wrote:
> > The device controller may update vbus status via usb_udc_vbus_handler(),
> > which tries to connect the gadget even though gadget_bind_driver() has
> > already called usb_udc_connect_control_locked(). This causes pullup() to
> > be called twice. Avoid this by checking if gadget->connected is true.
> 
> This patch is wrong.  To see why, read the comments just below the end 
> of the patch and see also usb_gadget_activate().

OK. So it breaks usb_gadget_activate() as usb_udc_connect_control_locked()
return early.

I think usb_gadget_activate() needs to set gadget->connected as false before
running usb_gadget_connect_locked() just like usb_gadget_deactivate() sets
gadget->connected as true after running usb_gadget_disconnect_locked().

Then it will work correctly, do you agree?

> 
> (Also, is there really anything wrong with calling pullup() twice in a 
> row?)

It depends on the device controller driver. But currently only a few drivers
call usb_udc_vbus_handler(), so I think the issue hasn't shown up.

When you look at the pullup() implementation of some UDC driver, you may see
they do more complicated thing than just pulling the data line up. Such as
cdnsp_gadget_pullup(), dwc3_gadget_pullup(), etc.

Therefore, I think the UDC core need to handle this well to avoid calling
pullup() twice in a row.

Thanks,
Xu Yang

