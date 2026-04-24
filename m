Return-Path: <linux-usb+bounces-36466-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPIzI8cV62lKIQAAu9opvQ
	(envelope-from <linux-usb+bounces-36466-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 09:03:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9361645A7BA
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 09:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6B07301A538
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 06:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1567F363094;
	Fri, 24 Apr 2026 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Cuk3J2UY"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013061.outbound.protection.outlook.com [40.107.159.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28F53603D8;
	Fri, 24 Apr 2026 06:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013918; cv=fail; b=FBgn0F1oE/rlNSo7HWCrcDvhMXxe3uwGn6W2VOXHpgq2f7JtaWBJHL2qlAfVvjwj43CLWWU6KTBYhNSP2wDfZmY/79TxYTcg4pnZg0EMsQFINA24FFtSwU01/ScW0CSdhwgmk/LaHaTniGZuOmRMCJn1LWHna9EESCxJjMRnBTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013918; c=relaxed/simple;
	bh=EiqeO3k+M8T9DZK+vtfolChxL6wXfa9Lhtkifo0/rUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gpq5WejyTHfGlk1Je2OGme5aO7oekyeLGlc3MK498flRfbtAAYSHJ2xVXxoRkhDeGTEIB3NFX7/jHSgkkpzp8dWmdkXDEKkUmDdwEpv+8dg8TdClrgo/AKEV8ElzCEIaeW75cmlakxazkwdAchCJNLPjJd+E9YwKUNo3xudRAb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Cuk3J2UY; arc=fail smtp.client-ip=40.107.159.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XU8rbQwRdwJoyoprBGrU/HIGJq7Myd59wkK605z016BY0r0r1Cuj/Wah5jVU0RPqXsueZhlfwTkhtMOfwI8PIWezdr6qhPVQdOU5GlNm2uvovKsUVt1WvN4E9HijV5NMjZqekAd1QOxOplND1qJR5lfFeGzeFoukEHZ0uIfUspHmz5a+n+zs2boeGCdTrbpN9jmmJQpRl/t4B4RpAfP048GyHAq6+Ztt8mJ+BTEBKNaIv/VXO2iV0HHKsZx/31uNk5pIttE2hunA3m72VsSg2G2LQiLplq+QUlNG+gcYCHCEd4Hsi7dZUbVMK0n66t9BPrEFfd7gQqfOhZiXpw5Xrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yA5ET+ZwPHQ4H2TEyzueToMmnGVmH4EJUqoyWvv/iNU=;
 b=AtMQr0cS2h8uUXAri9sX94Hhf7Y6NhSYOfHGZPOix2kPcLZYrWtSf5mqPYJntEP5bl1q9Hz+uhX7ZK6aF5w3yoORo+TDgrKnqW+sSMJqWxk/uxgQ9ymVSntkKW/FApG4KAQYd1DFW508CCbLWhuJFIzuv3+Z0ytJFLzSxFIt4aLadp9MdbbmulnxNzxnfXq87F2DDjKkMsPjP0yhiNhIfmMdtpEpmxhJhtnJEDvwT1ljkdpDq93gbxZOPiRJHRQ6rLhTsYyoil7NMAXutDuS5F66UxZwI1gFuM2UeYroIq5j+Lk5SoKfKI8/zeDfugE37wspQTGMso8n3OdLN3VEkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yA5ET+ZwPHQ4H2TEyzueToMmnGVmH4EJUqoyWvv/iNU=;
 b=Cuk3J2UYvGyKlyO9zkMrnBfdoesyVURaT+gTAYFEDDRX3ffVhr2oui9kLI6XOA8+A5z8rYt5xXE90WDPHtk9W7fI8X4sN11TeMrr4fL+ATK3yPROlxeIOqXoUb0JSLjPcrZzq47Loq0Vh4ZWpAImgHvAAMVK2klA058pESlHImomKNezMmM3J25j2SVpl/KzjWDu5PbAbifieZwRJz5YR+ssb8PETsmWJavbj5RCeFw1EmZaee6kizMICOiv8fETXheU7Uy4xr2VGz1O6M7kkCBGxOOQQ8t1ry3gGP9bNcuylf8GSA8Fb96gBEjnu3PqTqNQ/pPkaxMlILmFlWYwIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV4PR04MB11308.eurprd04.prod.outlook.com (2603:10a6:150:297::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 06:58:32 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 06:58:32 +0000
Date: Fri, 24 Apr 2026 14:57:45 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: badhri@google.com, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, m.grzeschik@pengutronix.de, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpm: fix debug accessory mode detection for
 sink ports
Message-ID: <xnvkyhpedche2msiqctan5engvbhnymcsug273trou2zzynqvy@apgubrthohoe>
References: <20260420030317.425022-1-xu.yang_2@nxp.com>
 <d9f89db5-e2be-4326-b57a-c8213eea675a@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9f89db5-e2be-4326-b57a-c8213eea675a@google.com>
X-ClientProxiedBy: AS4PR09CA0017.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV4PR04MB11308:EE_
X-MS-Office365-Filtering-Correlation-Id: 07191b2e-5324-4dbf-86ab-08dea1cee51a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|19092799006|1800799024|56012099003|22082099003|18092099006|18002099003|38350700014|27256017;
X-Microsoft-Antispam-Message-Info:
	Z9PnUvcSYX1KB/RAKpBS8S2Q2j4cd2MepP2HO3gx/fAFguWAbuJsiuy9y6s7H8PSQFaIq8s7NAeew1Jojs8+F8/pMY9uCdj9Ftr5RUOj3zUVE1SNVZdIOlwE2ocBaOIPSGwy9rjlm/i+BPjXpAezQ94K5hvAoivFNpkbvsluN76PxrN4XwMnc5RdS6sab6+Z4J4/ZcTqkdXBlVuYmDP9a11KMJnlXw+HNTph1MnJHb9FhVJSe4XlVZk8n70x0L1f+pjt8LepLMbWqstelSI+XXdg3I8bjxQAQ5GRedl++sGC/SncD73x+PgXcIJSDjPHUmRjtrA6l6tb672N0e46Q6we1V+AL/YKJtbciV/97Wras7eBP1FLE9U+yenHtxLWc8YLi/IRmonUiPh9uJVU9FbiF3/NTghcuB2HxJM9sGeh5jLQOl4o+iRxZmhM1WTKccdtiotfE/sFHvJKUmpZZSJfqADZ+cqFqJ8wJcuezCO87oH7axwzTtDJ4S29RA0reoCBZJx8De4FGAXVQzdZI3D9efBxKC4A87BKeG2uKTXCwhGTBx6lgyOvVZeh2FcQMPca4cgzbQgEo4qqmB49U/Ay19mJI1UKtuyWgGUw4KvSHZPx1vLPMu/2cf+4OL8E/TPFjM1H9PBNhDejAi9U3XzMgEvEZAuA+ghV8WWSWeb3w/iNLT5jodFq472vlqdxGsa1EXhbg1nAlIazfkMnlsL+TesFBSh9riwsYGrAg6NJHMnxf6XwHlxzQzKxM/Jufu0XdkpvoLHcCFup3VMoAjFwco3ZGrKP9hFp0n+xcdq4HV80kzSdXts5l7Yp+CjT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(19092799006)(1800799024)(56012099003)(22082099003)(18092099006)(18002099003)(38350700014)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cCSGNOns44Vh+OwOb3zIWhJp59df//CIRVRQtUiBZWeh+wWVmVmnepdKOofA?=
 =?us-ascii?Q?4OruSA+J11qSaWHKx6qbzPk0MWwvi/SFnGTT9irhd5s45gT3XgxZepLN7Yt0?=
 =?us-ascii?Q?t04fjW9mXYpJ54h6KkNRz0qZZ7WMbd7g2s5dPVfedadFKh8TUWJrww9jU9Qk?=
 =?us-ascii?Q?SLEBSBruz556jBDD7gFYq0RkYE6zFF8q/B35N4BrlA9+jyVR2hDbHfXK33MA?=
 =?us-ascii?Q?FLjAFdH62DCRG59l1c/f27MOXPtRvXG1cUHCw1nynD56/KXfhmsNcKo57NMH?=
 =?us-ascii?Q?QMZcrNaVJBKXsA+70kw+1RrPGc4IAzaDJ8s7BRCR4L68XlnLE8jSfA4Vol8h?=
 =?us-ascii?Q?JlvYiaXmQv0ChKkGIB4fnwe/QAQeETcOSV16ZrQXiQEZByntLhrxvVK6t4oE?=
 =?us-ascii?Q?NSQwL2bzYvPRR2eT4nJAKoZPhOWjI7lryLm0eNVOIIXmt+qQX3h8fxRuR+5s?=
 =?us-ascii?Q?Cb8eXu+ndV7gqXQ1x/b879SLuKOKqewNQivy/x/mJoBiQwwGydURT84OM8zW?=
 =?us-ascii?Q?8HOD8v9bEVVj7xmVmHJGgQXOQddXC12sk1sT0oOzjJFlKFeelDYZKbgLmCcm?=
 =?us-ascii?Q?r4TAZPlF4Gbc33lucXUnAcXrQ9lNXnC+0MXwFGE+IvJydq2N+cGK0qYuVUhC?=
 =?us-ascii?Q?o4fCA+GtWiRkm60TyxaLAkG2W8/6FqPSWxo1jjqQaRoICWc9uRXXAk0RF7Ii?=
 =?us-ascii?Q?cnO1V90ZOr/TQNp7BmR0sFGKj04BaJ830TIKJHQpfDHdjdVG2VUSnYrUSuFX?=
 =?us-ascii?Q?XfxlKNPa8wAHHnQglIrnKK5VnvlyUUkp78+IcU1atiQK1o1/oeQ0UMDBXrk8?=
 =?us-ascii?Q?N/gd62III+RxqG8/k3Yi3dhDVZPWB4gjk61zPZbtNrysOe/A//q5xBPG2XlR?=
 =?us-ascii?Q?oW5G5lznQVAzlqCDE67puM4TPgym25On9dLWVEoM84No+yB1cq8lxsAAkYJH?=
 =?us-ascii?Q?ccVfwxM5O8pMZ6kNoJbYMzLBAAJBYus5FkKSsxXYy1G3cZjZ8JY/wFn0DJCR?=
 =?us-ascii?Q?iY5qghP0+wzCpoi/O2gBggl8L3oolCh9b+EZCEA3v7PGzncHysi6+XMOroU1?=
 =?us-ascii?Q?Df0CApZCy+6MhUrAmTXY7rTAHCztqqKJRsnlFShvfHrP9B5AsXtEEa5diLKi?=
 =?us-ascii?Q?FzVdUdBmoAcBGdExs4DWHhbDVcPcZNfJb8K+RhWO0KnYiUU3gTmQaAHU+5Om?=
 =?us-ascii?Q?bRB3hgZxynr5sox1sNTyMqGPg4Eiaz8bh/Wmt1oDFci8vkjlUna05sl8IMPZ?=
 =?us-ascii?Q?BAPVicuSPkCnmWfb527mJ2g8EivP497ovAEb1yPiogJGmHdPEYnyJpJhlYFl?=
 =?us-ascii?Q?MUxyfIOWirOJ8/uixuIRwIBqcW4Hq3uYv2M9mtHgAoccsw3dN6L9iScS4wai?=
 =?us-ascii?Q?hcZaO6v2+BZrSeE/zwaLaz2YG5B1mIAS7WjhHcpTbDoOldO6YsqyL9WPy0hW?=
 =?us-ascii?Q?UUisYNifapjG2Uz5tS3d8WzI1ZVFoHtuFToZbQ7hBbKM1MeZZkXUGRYAkjmr?=
 =?us-ascii?Q?8+uEjObYsNXoIoGcTlKHOEkG3xwu+OOJvFUdIimZpQ7ZXcmyC3qve96SB9oc?=
 =?us-ascii?Q?KZcmTMvG7rP3Vgk7yJtlgNnDx5T+G0gzLheHlHridqoOKLfm6nR2HYo3DGjP?=
 =?us-ascii?Q?3bbjKyjnh38MyCLNyr7wC0w4w5dWZ4mp81wy+j/o4XpxMGvWAwfI4aWyWFZB?=
 =?us-ascii?Q?Dmf5tyKIV42BHO0V/IEaQ77oSiZay42DJI/EfAfkqFA4yVQSBAEW26tdZNE/?=
 =?us-ascii?Q?9/W9+UIJUA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07191b2e-5324-4dbf-86ab-08dea1cee51a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 06:58:32.1837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AZwEmFz7tEi2/ssKHarDM9MmUbOynxMbwMbaeCQdRLp0amyB6xEi58TtFshxsOAA7AsseeyxA7yPUaevDtTqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11308
X-Rspamd-Queue-Id: 9361645A7BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36466-lists,linux-usb=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email]

On Thu, Apr 23, 2026 at 03:50:51PM -0700, Amit Sunil Dhamne wrote:
> Hi Xu,
> 
> On 4/19/26 8:03 PM, Xu Yang wrote:
> > The port in debug accessory mode can be either a source or sink. The
> > previous tcpm_port_is_debug() function only checked for source port.
> > 
> > Commit 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into
> > accessory mode debug") changed the detection logic to support both roles,
> > but left some logic in _tcpm_cc_change() unchanged, This causes the state
> > machine to transition to an incorrect state when operating as a sink in
> > debug accessory mode. Log as below:
> > 
> > [  978.637541] CC1: 0 -> 5, CC2: 0 -> 5 [state TOGGLING, polarity 0, connected]
> > [  978.637567] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> > [  978.637596] pending state change SRC_ATTACH_WAIT -> DEBUG_ACC_ATTACHED @ 180 ms [rev1 NONE_AMS]
> > [  978.647098] CC1: 5 -> 0, CC2: 5 -> 5 [state SRC_ATTACH_WAIT, polarity 0, connected]
> > [  978.647115] state change SRC_ATTACH_WAIT -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> > 
> > It should go to SNK_ATTACH_WAIT instead of SRC_ATTACH_WAIT state.
> > 
> > To fix this, add tcpm_port_is_debug_source() and tcpm_port_is_debug_sink()
> > helper to explicitly identify the power mode in debug accessory mode.
> > Update the state transition logic in _tcpm_cc_change() to ensure the state
> > machine transitions comply with Type-C specification.
> > 
> > Fixes: 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into accessory mode debug")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >   drivers/usb/typec/tcpm/tcpm.c | 19 +++++++++++++------
> >   1 file changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index dfbb94ddc98a..1ee00025de56 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -732,9 +732,14 @@ static const char * const pd_rev[] = {
> >   	 (tcpm_cc_is_source((port)->cc2) && \
> >   	  !tcpm_cc_is_source((port)->cc1)))
> > +#define tcpm_port_is_debug_source(port) \
> > +	(tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2))
> > +
> > +#define tcpm_port_is_debug_sink(port) \
> > +	(tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2))
> > +
> >   #define tcpm_port_is_debug(port) \
> > -	((tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2)) || \
> > -	 (tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2)))
> > +	(tcpm_port_is_debug_source(port) || tcpm_port_is_debug_sink(port))
> >   #define tcpm_port_is_audio(port) \
> >   	(tcpm_cc_is_audio((port)->cc1) && tcpm_cc_is_audio((port)->cc2))
> > @@ -6360,10 +6365,10 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
> >   	switch (port->state) {
> >   	case TOGGLING:
> > -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> > +		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
> >   		    tcpm_port_is_source(port))
> >   			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> > -		else if (tcpm_port_is_sink(port))
> > +		else if (tcpm_port_is_debug_sink(port) || tcpm_port_is_sink(port))
> >   			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
> >   		break;
> >   	case CHECK_CONTAMINANT:
> > @@ -6371,9 +6376,11 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
> >   		break;
> >   	case SRC_UNATTACHED:
> >   	case ACC_UNATTACHED:
> > -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> > +		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
> >   		    tcpm_port_is_source(port))
> >   			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> > +		else if (tcpm_port_is_debug_sink(port))
> > +			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
> >   		break;
> >   	case SRC_ATTACH_WAIT:
> >   		if (tcpm_port_is_disconnected(port) ||
> > @@ -6395,7 +6402,7 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
> >   		}
> >   		break;
> >   	case SNK_UNATTACHED:
> > -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> > +		if (tcpm_port_is_debug_sink(port) || tcpm_port_is_audio(port) ||
> >   		    tcpm_port_is_sink(port))
> >   			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
> >   		break;
> 
> 
> Thanks for submitting the patch.
> 
> Please can you also add changes in run_state_machine()? I think we can
> replace tcpm_port_is_debug() in SNK_ATTACH_WAIT case with
> tcpm_port_is_debug_sink(). Also, similar changes for SRC_ATTACH_WAIT case.

OK. Will do.

Thanks,
Xu Yang

