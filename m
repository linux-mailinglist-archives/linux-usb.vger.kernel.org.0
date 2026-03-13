Return-Path: <linux-usb+bounces-34718-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK77Mkxzs2kQWgAAu9opvQ
	(envelope-from <linux-usb+bounces-34718-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 03:15:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3256227C9BD
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 03:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59FB531F877B
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 02:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A380A33DED5;
	Fri, 13 Mar 2026 02:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EZKUrwQW"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011053.outbound.protection.outlook.com [52.101.70.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2C533C502;
	Fri, 13 Mar 2026 02:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773367878; cv=fail; b=XkwldB9iirS4axFHQjbk3f4+da7BSl1m98CsI9aMHK0CyvN2luDiTyX69WZ6g5rHGePUHiJEF2Tp02AaPwhQz6u85Ree70DpkEzJcz6pGEh+B3MfrQjcIVddaUZlpJ3Mx1MlkLSS3C6AWYi00bHrULGZBzmuwM29ZAZNFswevpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773367878; c=relaxed/simple;
	bh=jUC78+k4EWcwDuPe25cUmljvzB8U8qAiaI5VVX0nTYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gxqz4cCkmVMunMjXf0MgNx1EzcB+wVS3hqMMJxtxLr8wWchbOGx8Dszv3w2tXCXcY+N69qiUhFVj2XdcBLvVMUB4hR43cucbFGqZI7hvLdhsv8/UtBfxUym6AhZ8xkrYYD3OchJp2ojiR6tjoTVTtnOlc+dpD7J8boW6YW/8ftE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EZKUrwQW; arc=fail smtp.client-ip=52.101.70.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TExLfAfhP8tAszV5RG1c2ZeK/qQdTA/HbdgluKX6+daHyxMnDijLrB30QE1x0KoSO/egyrJ35Tgwbt5O+q2OTIkuAwNqGnoPPjBh1bCDVuvcj6edL5LNJyD350jzeQCaHT7Fv2sPH/Jtz9YboRZ5FOd4/O8WFIoghmE6OwnuaYLRv96vxV9vosW+oDnTslkQ949ghkXUFovA0dShGpQQhFtdlTmlar4wyu0w7mJmBQKzdNJXdPHgqXGqE+eWmAWJVOpKhBazlwaw2woCYpyx6K1DAA5auFARB/zuEV2kktVsfPjvX6csqwQp6ukmzIc3nJFYGs+yVFelqLBs+zbM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4n4t1xwkhweCs9OXZdy5DafQK/x9uHP1DmHf/5Ly+8=;
 b=pFBn4pDXuJ6a8fbhzsWuquGtnj8m7Gqd/MOnJoW9C8lRwHg1/oAKyjs/OHvzTkJaFLIPvShBemKeebkjLXH/FkEBWvCRd/7XM3WYbR3jOxBvynGoMX0B+1yRb1aHhKezhR+BBzHq4ajype/qHobySzd7ZrRvikC9imkTarHEokmzQgQMU3HlNvrXntCOapkGRdL2v2ROfcC2SiHE3ZiGYPsxBnap/mCoOduHujdjk1/f/X2SQZbEfMw4F3aHeT7MgTRMqrCtYHf/zwa8747yNGQiUP0YNFwXPk99CqUVZTUzkvz/WP9oMaG95XWkfRz3pE0PhrBdqdRLlI9kEykctw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4n4t1xwkhweCs9OXZdy5DafQK/x9uHP1DmHf/5Ly+8=;
 b=EZKUrwQWeljcYRpvU084H+N189M8RRjTAwHkDdlihqi0ZNYlLh1s3lEplZfoS9x/eagpQ0CfkAqBJS6HiQWJut8ciBXBuiQBEWdM8UL+Wt9ZjB/kZgJxoeWQ5qzwcyX6HJYGqzwTHEyj7fl1iZ9VcQZw073xTMud8rTrZdhKhhLML6QCu1RFIfKKfBUG2hzLS9Pez80hrFCk16c2MXPx1DYHVZK7/vPtW2JPZ5utGZsTsYlr8yOguLEBwTZogw5XHajRlk4xh8bw+iBekIiu3j1VONECCWT3CnMmh+xRIdPlRmKWzrrYSOgoz19VDnQGGehm6ILjc+IkMQaoiFMZLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB8074.eurprd04.prod.outlook.com (2603:10a6:10:24a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 02:11:10 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 02:11:12 +0000
Date: Fri, 13 Mar 2026 10:03:31 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: tcpci: support setting orientation
 via GPIO
Message-ID: <2leugp4tlfx2rgltqyp27olzn2xatqmk55iyfdd4qa3gpcnv5a@eag6rqwsi2lt>
References: <20260312-support-setting-orientation-use-gpio-v2-2-59c523a09f12@nxp.com>
 <20260312191243.3479247-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312191243.3479247-1-Frank.Li@nxp.com>
X-ClientProxiedBy: FR4P281CA0415.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e417fb3-fbba-4e2f-2404-08de80a5cc8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dN4cbDE8GkoT0N79iqKcKNQZpVp/1AbuoQl3rlaHSac6UlMEXzjYyq5TJvHebvKLDW3jgOJt/YYmYYQHtyEy5r9NPv3V8K2Sjj7wFTXiOlxlIMizpt4HXJXVfJK3xDv/Hc3eYjlrFFtehWtJ51Lr1K7jX2bk4Hg1W9hVZ1i7ikBpz1JOwZQRzFZs1sKhnLeHL+NAcn8RRuvUoFWQhYtN0HSiUENmme92hLD3ruWmBENRn/ZcvkibfJHHpTIk5QTeQAM/jW/mz14Kjmy+oOl1sBJzMev1EWcc0ao9QtuBgXNgE2d9lt7kkVhzTLpThBM/wXlDQxwkhYYDpbTt0qYf74oMnb1IN6Y+7TbOQLrnc0Ycwn454kFvbtGPyv2F90JXw9ySwgAPmnnHrM7p+fS3aW1twafWtRm22M47bDe4rX8KIPI0N49Nj/Rg3B/GbSMHRVa2KSKrZGdKNbpkiBiaoF7L9qjMjqfSSEA1BPBTHDmDLKW2UzvJGU2+L56tDhII5qPceWpLwmH4eMNOc8MOaxsJZ8+6ONhvD/t2HmZ1YQpZcoM92BLnU4qdZX+oYzS5YTDue8d+w679zn+pmS7a0ACdIBKQCRjM2BfwRwhn2K+4m5aFLjbcjPxCXzrlKKjkM/dEGkVDK5IfLjQ4AMRYMn/hY8MoCubcK0dokpSjMfNfSvL8S3SRwKQadq3rDdNuPVBOvHZBUhxWwizvA2vxzj3iCc29pH1gBpoD9C/+lxuQC9MHoadsILWQ3xOiQVoyxzbenahfYxXOutp2IUar18QzbGUaU+sZC7E5nYrkVIA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N6diMM1qmaFXqhQbujfxegvt7zWmjkvX4pdkd3k1RIxeLytoRsjIFYETJ0vv?=
 =?us-ascii?Q?qy3bRfnNG3ywrE6pna/33M23kCYmqNhNfebMD52fb5WdPZrMOEkLMNSaK1X7?=
 =?us-ascii?Q?yqWwrv+pAxYj/b7Q8IRyt2mlYfmrCI5wgEvSvMNN1woj1FdlAmdnT5/LTQgT?=
 =?us-ascii?Q?vLI8fz8bnIIseGnn9/CkEs1iZWRslcWbMwS7n0+3XiRcXzBEzIrwLY3sPPFD?=
 =?us-ascii?Q?lyH37+FuN20jEZ4CU131XYbBPE4ig3TvpDA2/O/JkLkzzavEcsfvxZwcZhJb?=
 =?us-ascii?Q?voU73PvXS17CIxp7zFY7UP4/weHQjYggoxxv7J25j9nfczJQ+AaQ0h8wKmU0?=
 =?us-ascii?Q?dNww/kDbvcbt7zKtANZJbTS9cAGRFw+QQyq7cb34qPTYCcipJSFCotNFw0gi?=
 =?us-ascii?Q?5PtRW8CB+7EUoaJwcUZeZUNaOUHaL4BzsrlbQPbrnqTUGjcg+bqKofWWcZg2?=
 =?us-ascii?Q?28J8PWF2VaShzVEaQDKB1Z43VmgiUyNY3ePLfANUajNGMxyXehXGx+bQn8VZ?=
 =?us-ascii?Q?Bq2BcJDzyEyYqErdXDN+bOKjdlgzXcB+RoM8pG2Ptt87HROtuNycxZU3x5Xa?=
 =?us-ascii?Q?/TPQh5xAWh26sFfmiV8Fz3IBtnbeKqELYAPL0hDwz235SR5DZUalkXBEwdim?=
 =?us-ascii?Q?qvAWmD7PkR692zjOdS+sasDq/4ylu9jr0HL57cNCBz3BdHl3x6zaHwHWa1+D?=
 =?us-ascii?Q?D5JSlhdbG4pSsFUjQ0Mxh3oULGVlXVwa/DOhKXJx59AEX2OQhkW8ly4YRH5T?=
 =?us-ascii?Q?cSr/UNZcMr6ogSmqfD4xgoKsyKSJw5QANt/AXEJOKOeEgFz0jMyXlD0SzcNk?=
 =?us-ascii?Q?FEwYsSB/7Eb6/dy2gzYz6ltXlof/c97zUnFqcLtss8+5azhKfdxOAyzBw0RW?=
 =?us-ascii?Q?H9Lcyl9dE/1BpWg9Qu/k1XCbYMLP1R5WjZwiAinb4i4Fp1aB+nUZ/mN8RtTX?=
 =?us-ascii?Q?hSVgEM6g/fY4yYYw7wCflZKhcg6VxhhMJ8dM6mibEY2iThS/La8nX+FZzMv9?=
 =?us-ascii?Q?sQ3f7HvBiRNBfFSVNMRhkSxMxu5cpF3We1Roh1/DaTaaK3kKftnbnFN1WkFt?=
 =?us-ascii?Q?MqtSOSe/1T6r5q1um7VbYU9uo6gPgqm3T7Jv+B1uO0JLawhZvFoWZCKNyl2H?=
 =?us-ascii?Q?WuIacHswJr8hG/R/1OZ20CykH46lvrXcRZRUenym8BVbg4U1cJNSEpAEQS7y?=
 =?us-ascii?Q?rzCyfMefJodlCi+wDMcCGXeQ9DNIZO3E6218+PsQlbOU/tkQBoG399mynMwJ?=
 =?us-ascii?Q?e4pcePy6SHUFaSqSM2v4e2WW/4XJdJr5iRFVVhVEq0Ue4smTrqs4F2OgBCeN?=
 =?us-ascii?Q?SDGdmmOlm7RHnh/fh+yGleN9hKR3jw4mLhNd0rCpckDzxbSnQw5uZL4D0Iz1?=
 =?us-ascii?Q?wwYz27egzqqfB/i1Vszco3KDYiYYBUVQ9RAVsdFYXjrSXA3DK0+f8Cttz7ax?=
 =?us-ascii?Q?IVPFAtisxuz9dgfu7iW0YlFRQrPSAiEAh/OW/ClDC97DRe6hYFZISA+pUriw?=
 =?us-ascii?Q?6o9WsatHJ9bh/V4BDcdx+1lgyBF7yF3bNOaudoPm0xeN5s45lcBxfoVR9ZeH?=
 =?us-ascii?Q?lw4C89mnSX0wqAikKcAVHbmz8F1qFKg9od4jO9vk2hQH0go3pqNj49uq+nLW?=
 =?us-ascii?Q?CL1CaBv9VV+88Hpz3UQcWchgfNrH61uG7x8d2NhHavSTg/LSETNfaYgl11pa?=
 =?us-ascii?Q?US4FMmpwhreMA2j6cVEsw/5aj/H7mwETTCsZ0+7UUGphRHOHMoQkmEdB7vpn?=
 =?us-ascii?Q?Z4u7R7oIYA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e417fb3-fbba-4e2f-2404-08de80a5cc8a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 02:11:12.3833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCXFBFxLxoHQau20/uA4eyZsQQWG+KkXbRdZHhKG4cHv8PS8HyaAgJch9qplsSNUohagB1D36cHBk54z/yRoAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8074
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34718-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3256227C9BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 03:12:41PM -0400, Frank Li wrote:
> From: Frank Li (AI-BOT) <frank.li@nxp.com>
> 
> 
> > +		err = orient_gpio ? 1 : 0;
> 
> AI: Redundant ternary. Use `err = !!orient_gpio;` or `err = orient_gpio != NULL;`
> for clarity.

It was "err = !!orient_gpio;" in V1. But the AI-BOT complained about it.
I will return it back in V3.

Thanks,
Xu Yang

