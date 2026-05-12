Return-Path: <linux-usb+bounces-37307-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mANZC1v5AmokzQEAu9opvQ
	(envelope-from <linux-usb+bounces-37307-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 11:56:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2945951E215
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 11:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 50C4F301ADAE
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 09:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89904C6EEB;
	Tue, 12 May 2026 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dy37VpQt"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013029.outbound.protection.outlook.com [40.107.159.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDE24C0433;
	Tue, 12 May 2026 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778579701; cv=fail; b=IIYql2W+/ELRArHKeKKW8EqkUq+m7VCZ+V5OiAerdRBuSNeBzaykkBJfYlYM2w7uUz+c9EGmwpLefa3cl6/+rS+BpEGSzqJWMAgZrzUe9bgtn2O+/jFrxhyZtECdCmOyrzqigNZO/FqqFCigWDXcJ5qOaP/KR4Qebu3DdjF8yaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778579701; c=relaxed/simple;
	bh=et4IQM0RaxqlveJsjNtTz0OcHTcLn7vVOUJVTdnJWbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UINEkc3dZsRdGYtXTgrA5r377eEGrA+KmAVqGpQzdPsF3GlcJowEgxjRyMWnWTLYUvTn9WbLtdTV/MGkEGxrobLyBodAZhlm6agVFN+B+waffoFM007MLc262CM4W4uE2sWxNaKoEA5QiuRWASHK+foZd7h6ybIYrXfakzcfb4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dy37VpQt; arc=fail smtp.client-ip=40.107.159.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHRAPIcMrJmN0CIc5MADjsii1nQpdBqvIU9N3Di6Qz+hsqU1fW5RoURthTKqSgzmyHw4yxhvDOts3QvnDnFg4TNqdM6+M3Dw1SgOkcWYfs0qdFZWCZR8xkjVYBsAJiXs7qa0tnAC2z2Q6NdP1B3Yte5qiyXCbsHPz2arOXbcbYdvtnM6QhqA+Fi+R8SL591VY5uLqy1xwn1RftF9WWRvQk2JzAwn4JkDE9JHeKpXAYB/s8Nv4etMdmUsZkvwKpeMmd0PCD1kJCkcT9261kOOdXzJGBMrN1DYBU0a5GL3TeH5Dywee2doJ3tn+MWvhNQz3mv8ORCRuOZUhgsi5aT16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHEQybcyh2jXtO4gZAavHtnMdO1WHd/gjEPDaJ0CSR8=;
 b=Nb7efpmoRKBrhuW7x8hzXvOxUYpb8qGmbB+3TVH0/9Re4YcJzMcxOy47BFWgq/HdjnfD2J6GHPh4NXEfX9EGrFupAxmZ9HN8EtauM1Rcsqg5d1qatPXF9BPYVXEQPEwBC8cBgTT/51q1g/E4vVf+Y18qZp2BxY6UMdcGBbM3EDSLHLO4Uez6O+b7T1E4PwdfVYW6LB5YZ/vWv96bT6c0GBP+ehEuEFR5s9GEFnBU6Ku0u3dCrA3oKD9ogitY/AUOgMb4oOd5bcyEdXDUSlT5VBrVvmKsVCdOwTbscvu7XcMdRSgRJSRHH8lMWTUtzxIQfDTWYhP3ZBDgVEMcAZrkjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHEQybcyh2jXtO4gZAavHtnMdO1WHd/gjEPDaJ0CSR8=;
 b=dy37VpQtTbse5DnlKlBEWm8vuH3g2kn9Os4fFvxJWaEhaicSB8dhVnXHF890pqfKQ4HTmxLkOq0ogtM/KAN8Q3LqC/QcjV9tYH80WMUSu6m+k9zWnjmKiAOoGSXAXEz9nckq6GMkpgOLV4A0jHlN2x85zUjjxGeuX8wlXmgVBxLQB2HsbHbUnVA6e1P8B7sWeESP+91qxRT/CICVJNx9OMw6t0Z+fMsaJMrDyU4HgNwHOIQ4oXGQ3N5vYqBqBB2E6mMA0RP4pNrz8YON+hgt/64MWnvBSKDKYshlV0seuU/WafE/b7+aMke2tVvbIXFNkj4bFr6WvYOAULHCx2tEBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AMVPR04MB12673.eurprd04.prod.outlook.com (2603:10a6:20b:775::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 09:54:56 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9891.019; Tue, 12 May 2026
 09:54:56 +0000
Date: Tue, 12 May 2026 17:53:57 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Franz Schnyder <fra.schnyder@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com, 
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <5zz6yhc4ymoccovibmjlse2l2d6y3g3dwu5r5a677rplpfdnwu@fo2ed54hqzeh>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
 <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
 <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
 <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
X-ClientProxiedBy: AM0PR02CA0192.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::29) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AMVPR04MB12673:EE_
X-MS-Office365-Filtering-Correlation-Id: b04fcd20-4669-48f2-e8c2-08deb00c8599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|376014|52116014|1800799024|18002099003|22082099003|11063799003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	QigG1U1r+OqNOfPlTM2hDfFCoxYnQ1PhUFtrysmSpwnsfdpYqeUtxC9jtQwScScv/twWln6D2X41nrzniEzRsK/gpg8nEx8cbKJy9d2dFmU3r6wKEbtgZmNVsFUfc8Gw3jqJTkd8uU6Efs9bgQRQQ+UM1ZN+pDTska87g3W0RCvMWj9O03m4DbMkEj5HCiywGXJ4S7VYgUPnz1AVTCwFzuGrxNfcjoYaXhNQOuyBWxE0aTAjTbRcPWg05X7tizi3bjnQ8V5C2ajfvwkJUGswId7RwYS02UJsX7PKwF8e8UEkVb2OCzxk45z7o+i0Td0ZOpMW9SNArQCLTTxTvbq1FqB/ctKY9mDWAH6OtSMDuidTtTb5uDqn/Q3n0oucNGXluV44CTbgiUPPsTFISf4Air0dm4eAEUwwjzGehQrSzyDYbap+Ut6H4qdozGrmxHBqMXGYHnvO3BWqPawIj5Ios/CjI36pMlgjPjiLjE3vZZPfm4eD0oUVN+y/0n0E0VCZTuxqlwJ8cpz6ubY+vUj7BEjtIVlbodNR2DiplYC+0K+tXFGUJiaD/i4sHBoJI+ptdNQiXyGZBG5V1mpkBJbvY4UeUz2JHKHopYnqxUWH+wDCriNkFk714NvWaUGvYTQhKoqwYhba7IGqNrH1VbYq2XF75sc/421qtnlV746gVyIvKdLwpTEnLsCU+VuA/fdpJJcZIov5cJo8TuyMBhhjzyllLuBk4l/ZXf5GzlGlo2kYKpeU8MqxOp2wn/mrSK4u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(52116014)(1800799024)(18002099003)(22082099003)(11063799003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vq+3kp6c1I0hoCZnA35Mb4AZUBhtF/jXnFCBxtxPp1Yt5LPKYr71J/a6tEZM?=
 =?us-ascii?Q?8WoQhKaQCOC60v00T18NpNgpCSqOuAal0CKONqDhsoWdZGRSw9INYFlnVtFE?=
 =?us-ascii?Q?8SH4C2oYOuvjXfzotYCPRed34enRKkND4/VaOsbwhT6Ew03Rl3St8sC3nP6c?=
 =?us-ascii?Q?DODezZM4HLmzr6Iz07ISGBsjNZkTxho1ADfi0EXo+JQMNRNHIpNVdEm+QBj0?=
 =?us-ascii?Q?g2wkkLco4o1kLiCHQkPiCdmdEfSnHw2NT2RRaJn8/REWXM8/2EgCRRzqWkR6?=
 =?us-ascii?Q?zeDc3LQatczr0LAuYaXXY2PiMQgjS/KMgOAatjJzY8HgoVrItn74GkfMFSE2?=
 =?us-ascii?Q?LBLgrMvxQapUA9jZSq2Bh64N8x/1QXuVIiy1jL1U7bDgpzO9Nl1JKgdejw3P?=
 =?us-ascii?Q?zM7E7SHLrL8MmPKU2hspAxWgf0ucjr9xq71d0EKMSqCzlR4sSOyiWryYyTIc?=
 =?us-ascii?Q?xj1sFks9mp6I9te0oF/D2Udi+4La0QVjIIGSKKXB1xaAsIZBazjrDMLu0aSd?=
 =?us-ascii?Q?PUEXyDjMqFw8kAybasX2nGEuZZweVkziJOI9yQQuLxdWXwWqS/cXBQvEFCPm?=
 =?us-ascii?Q?LoBjoQA5ArkFm2XwGJNI53QQv70KyIRowwvyNPMirm2yXBemA69uv02J7dDB?=
 =?us-ascii?Q?o00iYOYBtu8+Us49Xc8N4LEoPj3wY+A3xuymogcGs2cAypJbVyWVOrI+Dtfj?=
 =?us-ascii?Q?eN6BXOTKg4Yg5lVg8ZjAWg6e587RsGOWVi40oU8PHw4UFgqHzukPxRK1UHiF?=
 =?us-ascii?Q?a2XCK7XPz7xf24dsKGQLZsvoPGtYx5lRT329YMDJP83/5usnTXw6GF2mcj1p?=
 =?us-ascii?Q?2VGMzAG58JGLcVWR6zvxlS0ugWQUU9U3+GKJoKLsSNjumogdvbLQCUoW+bV/?=
 =?us-ascii?Q?ANW6OYa36ST0xxFktfBiK1p7/bc1s9aLzV+zrPbFVv5a8CaBe3kgWiYpeupk?=
 =?us-ascii?Q?Q13fv/CiDOPWvj6/DUPF6lUX55yP+HwVExNgB9/P6nVuIeQN8mGoHxnjXudx?=
 =?us-ascii?Q?Z8iXQI7vasUFbXbrbXnEeK449Z2gSyOE6UMnwWoOuGJIVbj68LT6NlyoQcYw?=
 =?us-ascii?Q?AH1VitkBVI5TsRmBtb2ucFOGitajALYL+Z0nwEntZ3nQeQu97IiyUd0GWMdJ?=
 =?us-ascii?Q?p8LTduHXFMenxFb+ucq1P41axXHKcUj0PaFTZeryqdXzB528UbDR8JChW3bR?=
 =?us-ascii?Q?3GnGIBvoNGNSYA/U7N+Wb/FCJGmjzNXd6OpbwWTScYpy+EBa1PVxtBsAkzGW?=
 =?us-ascii?Q?2IcHZk8BPnUT/vRpu09Q/tXIY0wzGpXQ8RjH3hDFx1LzG+aj2MGhHy54DwJ0?=
 =?us-ascii?Q?Dj72aXcIvV+Vrws7Jwcm4ge6eojtVWy6NLunp5XPzFmkfaWZmRTqi4LorgTR?=
 =?us-ascii?Q?18VHiXzx+Y35zgZ8QJ22VNRMsfEENw7FCt70aFYaRToGguffLKH4Fwy31YZ6?=
 =?us-ascii?Q?+PDR4hHcxJlQL2sSwFd7xhTKECI7gUcJqrNvQxoT76yylk1sewUB+LAi4qyh?=
 =?us-ascii?Q?qqnoAi986bNc38R6aIC0qt5mhRd3/KWVh6tVzgwN2CmlsXbSCoZr3uLAu04d?=
 =?us-ascii?Q?nsk7/SI4jP8yNDX/HAya1QE7WpCvv4elIRe6YGn/Eg7fIHQ6NktUP8nLHBtI?=
 =?us-ascii?Q?wwPD9xHy++U0R+gG+ljs2JEOH6rZzAiMBOdGXpGSI2pnjb9EVcO4LK0PMvky?=
 =?us-ascii?Q?mBauz0QooNQq3xr/ifD1YBCO9pqJ0iiJ2W/0nMP5/M3IrMhv1ZVAdY7NiHKM?=
 =?us-ascii?Q?NHWFl3O+jg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b04fcd20-4669-48f2-e8c2-08deb00c8599
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 09:54:56.3305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7zf61BJ+t5ZndxY6+B3jk6eoTQ1NQ07ufLo3y9sA9AHJqrnU7gp0IKVn0jrjIW4RJ1Zk2xfRNJH/Dv8MgHg7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR04MB12673
X-Rspamd-Queue-Id: 2945951E215
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37307-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 06:04:49PM +0200, Franz Schnyder wrote:
> Hi Xu,
> 
> On Fri, May 08, 2026 at 06:54:40PM +0800, Xu Yang wrote:
> > It's strange that link->status is not DL_STATE_DORMANT or DL_STATE_NONE at
> > the time which means the device core may not properly unbind consumer devices
> > or handle something. The patch does a simple thing so the issue may not come
> > from the patch itself.
> > 
> > 1639:	list_for_each_entry_safe_reverse(link, ln, &dev->links.consumers, s_node) {
> > 1640:		WARN_ON(link->status != DL_STATE_DORMANT &&
> > 1641:			link->status != DL_STATE_NONE);
> > 1642:		__device_link_del(&link->kref);
> > 1643:	}
> > 
> > Which kernel and dtb are you using? If it's a downstream repo, how do the USB
> > controller and related DTS nodes look like?
> 
> I was using kernel version 7.1-rc2 and noticed it while working on 
> sending the Aquila iMX95 upstream.
> https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-2-69c8ee1c5413@toradex.com/

I don't see any special configuration in your DTS. I modified my configuration
to match yours, but I can't reproduce the issue. I also created some fault points
during the probe process, but still didn't encounter the issue.

> > 
> > Does the issue easily happen? Does dwc3_imx8mp_probe() eventually succeed?
> 
> I did various boot attempts with the commit reverted and couldn't 
> reproduce the issue. With the commit I ran into the issue in about one 
> third of all boot attempts. So most of the time dwc3_imx8mp_prove 
> actually succeeds.

OK. I mean, does dwc3_imx8mp_probe() still succeed after the kernel dumps
at the end?

> 
> > 
> > Could you add "#define DEBUG" in the head of drivers/base/core.c, rerun and share the log?
> >
> I can provide you with the data next week.

OK. More debug information will be helpful.

Thanks,
Xu Yang


