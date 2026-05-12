Return-Path: <linux-usb+bounces-37308-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCtiCxf6AmokzQEAu9opvQ
	(envelope-from <linux-usb+bounces-37308-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 11:59:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6A551E2CB
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 11:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64C31302A6D2
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 09:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9BC4C0433;
	Tue, 12 May 2026 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZT3I+dv4"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163064B8DFB;
	Tue, 12 May 2026 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778579943; cv=fail; b=Gnm3gBA4KXlCSLU5iB5l/Qo+rJq9LxBt2RtHKJGe1U9q+x56hcq1SFCeyge3szWv5jFQr2wHkuMVIoHsrX3uHLvRJpaJCPxJMNflRapZBGaUyIG0R5W2VMCg/zxV1FROP1aP0iSOpGK/Dp9CVhZMbpDgB743tyxoKPiC6ITxmUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778579943; c=relaxed/simple;
	bh=o891mQLbkt2hea/Nl4923pdp9Dm3wYlMGEI0s2Qyu5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NZW4v2IEFUVZHoF2W7RcYBqTPD+01qqBVmHnUNjBrc8Ff1fFV4DjxzG/ew/oHfMqwf1GCQ+HvGUDl7WhDPcivluHbJAYHpWuyt7MxiD2xAGMhKQoXaEIumNtUGGVPTCZpkWZqYpvLpVU1B4DzC3m8JcRGQzVmVqg8D1MgtnmBGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZT3I+dv4; arc=fail smtp.client-ip=52.101.65.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kt20Grc66Vi4VcVxpSxaeYDcbNxBeQ6g8Qn+gIW1pVrhMQkzhoLwnO8Bes6120nfH9iIi+x0zD4q1im0Sl7A2Dz2P1I1alIMoRWorWADQ66FXmXpPjiAKqVDBrJar4/ArJKsp8p1iv5twztVqa9XutZbpPiIFze09X5RbTK+bkQUlyXxfyyBSgKKu6/d+mwnU+Z0wAyh0DWmm7rar2kZw0UWCrtsbunu4CbtmIIUFKvKofEH/PDsC/MADRbYCT5goY9OZiz/61SQaF9INi5pfdNKlYQBuMkNovLNMd+s62kcjfCwkEaXogr80/yq/R8s9LfjloEqzMTAPi1hZBH4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHxEhSh2+MLoqJi5tR8o67bSekR2JxzBP6x+oRqfZNw=;
 b=nlzZ9WYavz3ybX+sTtpJ26t0SAQQI0ZfT6FWxKLD4YM8LlHljoA8030BZuz/wtE/KsEDlnTtk4vaLvTrWsFy4gqzpWfJN+Z+7yarFZtY297rNcqzQmxZHAAwlN7BmtkL2jR0N5qwCK7cbZ84swNEQucZw3pha6y694SIJEOIFY2KjokvD16fI+vX+S4VbCTKGuzet1QSnVHBVWpjPP0mR4zChRh7adEJk7Onfg0fPKyuMwPqEW3PgctH7uWHK6H2WbWLilYDEzZt2dTpJ3F8eWj19NZIqHmLG8yUfI7bCwhWpH6ynEpB7BmPcwF6tMm+CPN3Xw/8xjial1qtVl5OiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHxEhSh2+MLoqJi5tR8o67bSekR2JxzBP6x+oRqfZNw=;
 b=ZT3I+dv4G7IenUm+Ciw5ppEMHrbqCyfLR9D0EKiRoZE1njkIapWjVLhsk1GN6M6PCv7iXEn6YhhP845Vn5RXPQFgBmoHm4wCKVv0+YaA7QV+9oopHfkVpBBRFnfKwQyF9hJXyOCfSV0W2WKsijAnYTbybOEZhOaqz2MSm6Yi5V0y4wls0UGXnDnZwAqV3okn81KZ2yhnUl5d0gBqAcrKzcCBd5fYWyUXx89Sv+1Zei6VLj4QspmaFuad077V4hK6hnj5YcXFee9rG2zJKOsccQhoFPQzL1cxB+gT3B4oNb2EmZtQuND27cOSDkAhK615R+MYIoj/iLNoRhwnvg6u3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS4PR04MB9483.eurprd04.prod.outlook.com (2603:10a6:20b:4ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 09:58:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9891.019; Tue, 12 May 2026
 09:58:57 +0000
Date: Tue, 12 May 2026 17:58:02 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Franz Schnyder <fra.schnyder@gmail.com>, Thinh.Nguyen@synopsys.com, 
	gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jun.li@nxp.com
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <5cj6k3i2oemrxnqg4eztrnanvtgqvfx6gruy4u562ihokneazx@hfg7pyyev23r>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
 <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
 <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
 <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
 <af8stIGhzVMfhyIQ@livingston.pivistrello.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af8stIGhzVMfhyIQ@livingston.pivistrello.it>
X-ClientProxiedBy: FR4P281CA0302.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::8) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS4PR04MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: 16cfa069-4ac2-4046-1256-08deb00d1554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|376014|52116014|1800799024|18002099003|22082099003|11063799003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	ydaX5ZpGOfbz2YvJygW8AIKQw0VQvbqRzXBJez3PjWyvnTidlCTBHsNql3fckOV0AhG7pDMbdORjbzl94/uE6af2WniIgsrgdGJdVrWnMJTNBopYyhYqLrMVMXGoEs6Zhn++UqYKu2IeHrQiTJY/Zh+bfrAYl+TpI1hqJ0BeGwIrEzJhdH3VuHZ9TNcyW2HW63ofFZH3LMQkQpyUDkWgU3jLPg4/8fJFVLVTZkNPXwHnbAH5MkD76eZPfkX3h1sQA1/Ykxgkzg0Wk4sN0xOyH//wUOf1E335PF4f7P1peGai0bPsgyaPdMA34eHJJN2K1V5wRImLWTJL0cbCpSzD4BAsFuNy7NYsSjTjPj+7n4VHxDNaJxDzR42tLxOnjU8S/7VSYfv6cPPBfEe2NlX0xyWmPCOpMNfouZtsKjuLmNYE9N1PiZScQOmWUYhzPl/sVmpyNHApNIvaBpVyvVhm4m9iMVWKkhU1rN5zg9V/d7i/zM3AfhphKGH/Ld7NPWgryIPjmtIAM1xbtDaZO3uE0X8wrHH2PMijiIxWgXfgmM5DMgwARJmZKLhAONG7BBx+CgDtG9vQ1d8Wl23uT98qsjLrXIpWff/1KmKED7tWeAQy5JuP8dJDyxEQFSrCqDvEZ0wo70w+NTRgjo8X51fg8nU8EHH7/Db6ylnq9KGK0mblX2ZniByzD+A9kzrB8d2tesnGo96QS+jVqCYNKZvP1+6u+omOZUjdQn1Co/E7uRjbAjJ5t3W6TlmGbx6nSfaE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(52116014)(1800799024)(18002099003)(22082099003)(11063799003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tM4yqlGthlis4ZZraJCCZ3/H04w1nyvKWkn7HSy3dNnA7MXxjd4QGZ94Wkpq?=
 =?us-ascii?Q?sIDfQmdPXPP6Th2UUr3wF+0HVR1rXx2GCsxCybEAke40rKlKpkOL7vC3Fgp4?=
 =?us-ascii?Q?ZnAyjNIPRpZWJy26Cb5+MNr28e5eswt3+VSIugvHABUXjlx98tgQldEDJLcC?=
 =?us-ascii?Q?ookyu9Bcsj0RqSzvMmSud1RAWekhjmrf/Vj1nlOs3aflQ2Uao18c2rgrpdIJ?=
 =?us-ascii?Q?yW6FI8xK/CnxAHkyqxHf+XPfEOFeyFcPbKZhC/aM7dtj4mGgAi/keiuMRifG?=
 =?us-ascii?Q?W/KdxAa4FgRQd05NstMVNYpLgsWLlcVbIalAciQ+8oxykYtuDWvqE7fx8SPs?=
 =?us-ascii?Q?IGch+CO9u7+HimdkSw0X45ZDe9M95g8sE7dBJuSpmh7xqG15Os17HcAoetlz?=
 =?us-ascii?Q?dpog2GodFLV1hDOw5bUWG9EG+P4265j1+INVStFGmXRlFzezheBf1dDwjsNF?=
 =?us-ascii?Q?Fak+H7d/TVf4l7PrqLMWky9VLBTYvRUj2Fd6qQ3a4O5V5stiWTfOFfpTT3I0?=
 =?us-ascii?Q?stEgHpSklhegCt3SZFlFNX6hQdZ1MZ437LVnBFzOF0YUch8jU2/ImXJH32nn?=
 =?us-ascii?Q?yCzCAI8dWvd9mNC81w33cEdt5R1uLr4yStsGXtv+LZkFWtsXj8l9DwXHgdyr?=
 =?us-ascii?Q?Dhv+tJeDAHFbUEvYDEPwbPRK8j3lziPBTpFu7AHqe9BKxbWSEv7QtCKk8Of1?=
 =?us-ascii?Q?wzZg3bZBpgNsEbgwRMnK0z/TTN+NImhgV3klDFZiSEQl5veW+jaaf2Z7b2p6?=
 =?us-ascii?Q?mkaONVfBlL1Ha18XWkOKan2iOnZm58LYSAFC82oBk47kkRoGsMPtuVSZ/KDu?=
 =?us-ascii?Q?IxKYheBkKDDXFLbbTIovRJCYtWwF+dp98F/d27dseSPlfAQhk2/mViDTYNrd?=
 =?us-ascii?Q?XP/xP2ckrL7Jbxgal6fsxpfr6AmkdPve5WwR3qL2W4sg9+mlxnzpByR79B7Z?=
 =?us-ascii?Q?YZgJLhcuH+yqQboqkiVsdL/rIXFC5zup4Pq50Qfvd+A/noxKXT6o2M5o6BWH?=
 =?us-ascii?Q?kQYSo3roAxx+42AJoVVPd4Ga5Kj5gl0DbxIl0vDJZumZE8OYT5+6aqFRL9eR?=
 =?us-ascii?Q?tfAIO0nzNS7LQe+LAFj2d9syrL/tlDWg8RAuqH13NYo11Wxf37p16T9HtXaX?=
 =?us-ascii?Q?txaKYLBPTWUwzz1T7Wxi0cQQHK0gIFiyWsLNE8d4YjFQkY6Hyps8xqGaGzrw?=
 =?us-ascii?Q?8rg2qU7dC2qJmaXAksZpOafSq5qo6tyfTI5XPymafWl1xc8U57bsAOGxTz68?=
 =?us-ascii?Q?OJJGUZM6qdb1HzPx1uqgo253bGNO5iqb3RMBrvtfGD/dt6WI4pJ+xGPCVYYJ?=
 =?us-ascii?Q?3YxuvFjGoaZAO/WfzkAYa/K38vDIoj6KXFnkSCtGQNooTAeSjhVAcaaRkdUi?=
 =?us-ascii?Q?hAa93M8nGRNqJPoBX9xJ++5ZaRGW3KB1hdLo+2pOKJacNfuxtRt7/1C2bc97?=
 =?us-ascii?Q?hNJEQA0rViXncX+Q+nMZuq+AMMhkFsYb8bfZh46mz/p6+OZ9htcxVpArfgux?=
 =?us-ascii?Q?sCBU0TyKORUaeMEC/iX1rgq1pPwFjwcGwgk6NvTvgstFTPK5uGt3fjhDM8i8?=
 =?us-ascii?Q?6/c2QPH3fkITfX1x5SKd7NhQfVBKYsFvdFyVEsp21LVMxmHff4jViqomGbg9?=
 =?us-ascii?Q?AW4k+Lex1kXcLSTJYF8mkgq5W7yU+AkPUuQb2RXX+7g071RhgVh64zD7JzU2?=
 =?us-ascii?Q?pznlrfgPGIQGZ+orb1ssq8SQH0myndZGM3ZkedWenORDgjTP7iGMjLSv2Hm+?=
 =?us-ascii?Q?uQSYVqyBsw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16cfa069-4ac2-4046-1256-08deb00d1554
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 09:58:57.3483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SL2NAqruUS43nLemEtdO1Eq43u0W6xtZFBrxcNMkqPy6Pk4TkZJSUVPLzDgheLwSD6b9dxG47/qs47KGogUXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9483
X-Rspamd-Queue-Id: 9A6A551E2CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37308-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,synopsys.com,linuxfoundation.org,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 02:46:44PM +0200, Francesco Dolcini wrote:
> On Fri, May 08, 2026 at 06:04:49PM +0200, Franz Schnyder wrote:
> > On Fri, May 08, 2026 at 06:54:40PM +0800, Xu Yang wrote:
> > > It's strange that link->status is not DL_STATE_DORMANT or DL_STATE_NONE at
> > > the time which means the device core may not properly unbind consumer devices
> > > or handle something. The patch does a simple thing so the issue may not come
> > > from the patch itself.
> > > 
> > > 1639:	list_for_each_entry_safe_reverse(link, ln, &dev->links.consumers, s_node) {
> > > 1640:		WARN_ON(link->status != DL_STATE_DORMANT &&
> > > 1641:			link->status != DL_STATE_NONE);
> > > 1642:		__device_link_del(&link->kref);
> > > 1643:	}
> > > 
> > > Which kernel and dtb are you using? If it's a downstream repo, how do the USB
> > > controller and related DTS nodes look like?
> > 
> > I was using kernel version 7.1-rc2 and noticed it while working on 
> > sending the Aquila iMX95 upstream.
> > https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-2-69c8ee1c5413@toradex.com/
> > > 
> > > Does the issue easily happen? Does dwc3_imx8mp_probe() eventually succeed?
> > 
> > I did various boot attempts with the commit reverted and couldn't 
> > reproduce the issue. With the commit I ran into the issue in about one 
> > third of all boot attempts. So most of the time dwc3_imx8mp_prove 
> > actually succeeds.
> 
> ...
> 
> > > Yes, if you use the new driver, I think this issue won't happen at all.
> > > 
> > So once your work is merged in the imx95.dtsi we should be fine.
> 
> To me it looks like a regression that should be taken care of.
> 
> Maybe not relevant for aquila imx95, where you did reproduce it (the reason is
> that aquila imx95 is not in mainline, yet), but from the USB point of view this
> board is very similar to other boards using the i.MX95 SoC that are therefore
> likely affected.

Sure. I can't reproduce the issue now.
I'll research it when more information is given.

Thanks,
Xu Yang

