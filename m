Return-Path: <linux-usb+bounces-37123-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HBEKJrC/WkpigAAu9opvQ
	(envelope-from <linux-usb+bounces-37123-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 13:01:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF154F56E7
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 13:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 071533041788
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 10:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90233382E1;
	Fri,  8 May 2026 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c57m5I1o"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013011.outbound.protection.outlook.com [40.107.162.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BBF32AAA0;
	Fri,  8 May 2026 10:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237737; cv=fail; b=B+8KhZO/lvqOFPWJoWIRqdvr+Xnfdqpj3FEXTebQIE0eo9A5qmMXN6XzcXtx0KdPPK0yudIZylce2Q70duEq1CtOyBJsAB/zgLcNHau7Ie7S0UHY2e2MV1nEPn+dScBxMBKH53MmEVZLmNju2UtP9vCWA+A7nrlmnoGLujkiukI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237737; c=relaxed/simple;
	bh=danX3tVIJJeXo8N9myBmA1Azel+LDkd2lwodrc1uhRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qpRyRtgrszgA6BtKnYTdXPotcAEfX3UJbIS39kAqOEkt+a4mZV9+dO6IpqFGgML5hJTU6FEQ74V1wlBEJSvjUuQId7vB8aN7aLV8nLZzFhrJtQuWD0qhpOqpkxQKAxcB/52D9WLwMoZREZNfIXqi9aqF9gMGfmJYXFV5de6uCE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c57m5I1o; arc=fail smtp.client-ip=40.107.162.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmjbK+UjI8otx4r2v9jglwo9Sp7Xax4WXKm4x9qM2N9qyHytYLcb7PZ/dK2+7Tuz3D6CAn7LcjZ40Yfrga8sSy8lOFCRBxO+Hh7PBeA4KkaJw2n6ICxE/jWTZ3cr3uzzR4EKzkO35ttcDeMAIRv0Rf7AZkLRRXcvyStBOmcAWnpx6brm0ftVNsm1nUVXViyCMGoJPWXAPzIY5qwQwW0OmLtndQamtj++83HVqH91Yv3aY/TjFlu7NOqiGUQSxY2sq3+nsg+UBuU68pEEP1QfUPVE1mvxjB3H8dl11mf/isHiiDkw/CGLd9LouglE3mwrK4hYWOn3XfvGMU8bn/y+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjWJnreqtFTxNsZq0wk4jLyvdTxmmVD0C4te3RVc+zs=;
 b=BOx88kM0V1Qe35TK7llw0Pv2w7gC8uwaba8HKfAsF0hqvs7H3l8NBVaxZWc52E07s+tn/SRfbG8obbe9KpYRVzbvebJcIEJKeDEPd6yvk3XZd/sQ1CqSZmyqRSTGg26vMqnSYLuWpfOl6RX4aTCaqB8CUC9mm0NC1kAfDpl/jmhsHoa0UH4AQKtFTYDsvY2U6E3PAMdTBodgqq6mqwdbVqQ7Fj/50bdxVQsPX+/dqgxuoGjvvVyYrTLGk6lSdw8l5aZzBvJvqoAJfv/xlGHmf7kcLLtW91VzqFeXGLLketO21Z/CBYDlmA6dD9lwWIjPYq7qFa2WTrqxlwvMUCx7mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjWJnreqtFTxNsZq0wk4jLyvdTxmmVD0C4te3RVc+zs=;
 b=c57m5I1ojZnqgkklb19HfxIea9d6tj5entUML+dKkpWLN/xGQic9HiF+LpAa0K8jrpX8njgOHo+0d7YKuk1MS0LjDq+DNoTptgjgVsSVb3ck8uBChscxS3FXIrRSKBJKBealTWPJ1P8lhsJIg6EFfDyX9tdrfAvkkUzHWaFPMhJpya97R/ReGjL+wAUP8Cp3Vq2ymjtwi9m69CS13wYCtaDSDqQqzLn825obB2tSm5CVezzehkCULxN6KXTnppSLZ4vCoSM1zxyy9ZUYJj1/6YIjuMBkJiUZ9g8TDXoEAMBo8ED/oO4F+MB3CnFxOTH4ssUiY7Oux2z4TLexkVCZ8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV2PR04MB11349.eurprd04.prod.outlook.com (2603:10a6:150:29f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 10:55:32 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 10:55:32 +0000
Date: Fri, 8 May 2026 18:54:40 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Franz Schnyder <fra.schnyder@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com, 
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
 <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
X-ClientProxiedBy: FR4P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV2PR04MB11349:EE_
X-MS-Office365-Filtering-Correlation-Id: b9adceb6-83d8-4ed3-f3b2-08deacf05315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|19092799006|376014|366016|38350700014|22082099003|3023799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wuCNAmGJ4v7QMzulnF+e7iTF8omkXg2X1P/4zfqIZHFNXuANDsh9OnlSP6kjFu+7UItu3p9UCMNHFn1/9vOS9WNRtIeZK+bff3ZvWY46S9Q3dYpNYvMoQGfjgeEkrtdHaVHmRKJRuINQxTh9eggTj31KUNhEnkcsGXELn2xKOPv5VvNbaUb4WpjKd4M/7AavDs6z26QLuxyTUIiZHDsrF5qRJtWchzOguuWEm6Get1sfa7uQe8y+yT/ikHC+0eLIMPht7vCHzyNgXmHcg0n3/ZmoOpWSHhM08kp/wwfSboRyJ7kei9dNPaaAONzvlX2XxyQOODJ1fXHcfxTBjLRUtczeGt2yj2j4d28TpX7av5Wt8k3Jnu0SAsC2l8WTIpxuJtwWNw9Ye1yMhr4pPaPpII9c2EcMzV2iFi1ZaKswSNw6UcALeiuNh1YHmR0TPy87sJOJvAGFumor6FdTCAY5l8d51jTJKPSmzuFu4g/DtkJbsgWKZ/wE4tPKb7L7qm+j4CFG09p+ogwGAZEEiZA7qtVUFDU9NGHLjEqHGffLynS45DiDjW9+SrMcfHUsBPdXM2veFzmDdbbBVzoch2WjeOssQaPgvrwcHiF6tbnfq8eToojy8OP7r3zkuElOrh6pmQiJL44dtRFqrtL/OSYDf6ubqN5sF7C1BI7Ny0N/XzGnba7HoiZZ+nhB2MYZyec8UgpUYL49D4Dp4O6oeBDJTW1SX/2anJnwfEh8rfz8DIrTCBB1TkmazDVAmskgVhBz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(19092799006)(376014)(366016)(38350700014)(22082099003)(3023799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H6zkeSItdZI3yQyv3guCywfAkS6oMGer/5PNUIHSe3i/QXdo9hstZ2hMamEz?=
 =?us-ascii?Q?k8GOUlI4hoeET3nqcWq8BrhktM1qeKBoCS5wtjyVi6xliVwwfttpO70l/hNE?=
 =?us-ascii?Q?OfIhNiHujPJd2TwuUJR33gkJQLyOiHvitSsvTY0Vh8Z+29M4D4cvkmqZmcf9?=
 =?us-ascii?Q?kTm6mJFsGIbeiHQqSWJXp7hZvxUtt2DoEyV1SF122OP3IHodzDUlUhvYwvcL?=
 =?us-ascii?Q?KzCUl3HvDhBItSAXAzUWM0CNprbTM3N/RCzKJ54/hCdIDDK5TUO6j5VXkOn2?=
 =?us-ascii?Q?d0JfY70RJS9F6eJ5h2HMLWJ5FcMwL8hYFnZLeTA2rMN8tusWjkkOSbHo4D5+?=
 =?us-ascii?Q?by9SaowCoFS+biGPYbJiORWZ4ZCipSTqSm+zUu8hDBF7UKB9RTCX1VpV3J+F?=
 =?us-ascii?Q?wt+elKFjNqBl/6xk7n0vKRUioqHH3jr663Q+grcEQ1d7pthWLTS8d6SGqll4?=
 =?us-ascii?Q?92/UuWMOvADHQ80QhExCl8kmPQO/LsrnWGWdxisbeC0vAhvoc6sWjI59aCkm?=
 =?us-ascii?Q?S4tmRiZaBybJdCmzyaP3lOLnmFyadMdlbNjjfnfmY3f8Hk6X+mXeyFc4ujTf?=
 =?us-ascii?Q?Ns2mmUudfiiu6C4pKAUd0Rk4uHG4ILoCl5pUiDSHdVZgdnTVPAD5PIB2Ofc6?=
 =?us-ascii?Q?/m4x5G0xHhdAQbxzZARKpJzc6sDry5ik7coFFYpt64nuMlMEYDDUeMXn9bis?=
 =?us-ascii?Q?wgMG/rz4eTMioZKq4TFVO8/Eh8047c89HCduxFdzjsZ5PIJFqWUL4zbeammR?=
 =?us-ascii?Q?dDAroj6IkC4cohHabxKjcuG+42dywgl4lho6mjYxUbPSVR1qjmBxZE//F4pt?=
 =?us-ascii?Q?i844a3jnWBMvfWovfW9n8fO2NYF6bI11f3NOLAWSeTEnwfG0gSmvTTMhoaw4?=
 =?us-ascii?Q?mpA25U0Ay9F/t/cT6IGl5CVB1a/2OJReyK17DnFtPioxdRX5e379fuQVxe0v?=
 =?us-ascii?Q?d9mAVC2nyQ+KTVpRxo96G/yoiu+Jg3OcLkLGoQtoY1Mk09YDscT0ZONv0nrF?=
 =?us-ascii?Q?3GrRKphO2+io/UrBaccbgZKUOIVULJvJlybPCGRsAh4MIZTJGowJwIedWcv8?=
 =?us-ascii?Q?p4sBCwt1AGSQOxez8UBhpKtWF2i9C3bXV6by7R6xOno9hsbC6xAfDOqglPzg?=
 =?us-ascii?Q?Qykr0rDxVwksjt5HJUBCq49UFQGLZ3qe6XTqplYZRA1BxTIzL/oeJmW+YaAK?=
 =?us-ascii?Q?UXTkIE8CU9VHfur77+7UGY+lzbq0Z+1rALD/RXsdxuah1WhXwM5EfMPJIXyJ?=
 =?us-ascii?Q?WHoYhFXQiJCffQNViHg/12xAZglWF2czysoBxrEYzS32x+QS52LzSghnsdFh?=
 =?us-ascii?Q?OdfctogFwjo3NY+95YQUD2WMULD57pMQ9OwqVMZO0zBfY8sx6GXFCFcQoOl0?=
 =?us-ascii?Q?n3JUecS80MFqUSMSbyurDKPnibNAmbhLddhg9giDU0GqPxfCVzVWCafbkEPS?=
 =?us-ascii?Q?hg//dEv+jNDejjo7QqZuohz2iMa++nDFoI8iWdhxLqTjlKcpGVNsntmNenvp?=
 =?us-ascii?Q?NGytmX3727mY9J+4drdnjykQHdUc/+uXYtERuI8djADZ1lKy78lbB4UeGOhQ?=
 =?us-ascii?Q?XkzzWeHkpedUSwaaYa2qJRhAl9PvZDEhzIifOfRGJ45iHkGGCDxeIt2DGiSE?=
 =?us-ascii?Q?kyl5os4v/VgJAyvqXj2Z/NECs4jyg6eoTSvhElgxqeoWefBwMWcIuyUTOpKl?=
 =?us-ascii?Q?4nL5TfM6991dgqeKVKAVx20twV53EjXoCH5N41R78rH+jt7fdpniI7JEt/7w?=
 =?us-ascii?Q?gWZoxnH3tA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9adceb6-83d8-4ed3-f3b2-08deacf05315
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 10:55:32.2184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPmlIqDqO2G1IVmD0c5EinaJGzZZMz5XG2vIMfh3yKHtmFJNCFTDo7Ip1v0+xYGHbNLAv8oKWx5MniPTwu9V1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11349
X-Rspamd-Queue-Id: 1FF154F56E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37123-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[synopsys.com,linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,dolcini.it];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,synopsys.com:email]
X-Rspamd-Action: no action

Hi Franz,

On Thu, May 07, 2026 at 12:46:08PM +0200, Franz Schnyder wrote:
> On Thu, Jan 08, 2026 at 04:14:33PM +0800, Xu Yang wrote:
> > Do dwc3 core auto suspend enable for device and disable for host
> > , this can make sure dwc3 core device auto suspend setting is
> > correct all the time, the background of disable dwc3 core device
> > auto suspend is to make its parent device suspend immediately
> > (so wakeup enable can be enabled) after xhci-plat device suspended,
> > for device mode, we keep the dwc3 core device auto suspend is to
> > give some wait for gadget to be enumerated.
> > 
> > Note: It's a temporary solution until we switch to using the new
> >       flatten model.
> > 
> > Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> Hi Xu,
> 
> We have a kernel issue introduced by this patch on an iMX95, where we 
> use the dwc3 usb as otg. This appears to be due to a race condition that
> occurs during probe, when the parent attempts to access the driver data
> from the dwc3 child. I saw your work on the new flattened model driver 
> for the iMX SoCs and that it will soon be applied to the iMX95 as well. 
> Does this mean that the issue shown below should no longer appear, as 
> there will be no parent/child dependency?
> 
> Do you think there are any actions needed on this patch?

Thanks for the report.

It's strange that link->status is not DL_STATE_DORMANT or DL_STATE_NONE at
the time which means the device core may not properly unbind consumer devices
or handle something. The patch does a simple thing so the issue may not come
from the patch itself.

1639:	list_for_each_entry_safe_reverse(link, ln, &dev->links.consumers, s_node) {
1640:		WARN_ON(link->status != DL_STATE_DORMANT &&
1641:			link->status != DL_STATE_NONE);
1642:		__device_link_del(&link->kref);
1643:	}

Which kernel and dtb are you using? If it's a downstream repo, how do the USB
controller and related DTS nodes look like?

Does the issue easily happen? Does dwc3_imx8mp_probe() eventually succeed?

Could you add "#define DEBUG" in the head of drivers/base/core.c, rerun and share the log?

Yes, if you use the new driver, I think this issue won't happen at all.

Thanks,
Xu Yang

