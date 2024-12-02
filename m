Return-Path: <linux-usb+bounces-17989-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB89DF90F
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 03:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EED77B217B4
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 02:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2EB29D05;
	Mon,  2 Dec 2024 02:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eiLelXTE"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE8D3BBC5
	for <linux-usb@vger.kernel.org>; Mon,  2 Dec 2024 02:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733107961; cv=fail; b=YUvl+hatnv/z/kMJdUB1l28hSyFwJQQqyj0pOQ2X/E7lMJgtZjpzBZ4F6eeLn7O1N4mRkO5VkezDSkZWiu3V9+S/kKlOAiAjIvHTUgs9wDy4fnoI2GKlNv8vG0/SvD68RHitR2S44OaXlF865ekglk6aGY/6+7Ta4ok5x8VjHUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733107961; c=relaxed/simple;
	bh=omhMGeq+PM9yIZwozcJr2C1xLpP1fCU3lI6hw7Ri6/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RHa0d4YgwrQgXxtASl0swOOqynzUeEkJIC/0pLUkwrUB0ECDFSZKLwe9fPXJXS+5qwIBiDe5A2zmorjfG/AnDRqV2TIvcU7BvWSjbIVLcYzwho1KOrLw5GeslcEIa1JBvcx6qRderon3qCH/hOpHD9SmaFvhBNyVI0evtKlV/mY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eiLelXTE; arc=fail smtp.client-ip=40.107.22.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UW6EglbhCaZXcVs/dxTTwwAgUnvSprxmVivWLM0zaHSIP47pxyXbOo3Op9gdCQyPqO0luPUi0w5i5SmKpExc0evM78kE/LizCb7a+WQjUnM6GblJg6PiLEYHPKelRND1VmsSvp4elpwIWcIgd50sBQ6Dt9Ag0CrkZCob+DMhjvDNJBASAGTjlB2Md6rYQRN7U18Pj8mDes1MyGV6vhGy2MMjSZp8/Ynz22ucrhUjVrC8ccFIzuPN519KKeaNzK8Gp2ylLxotVPWYXvGrpu6mVr2n/R+2945gKzBnrjrkyCPkSeYh0UDMhnn907kn6xkoh451ZSzSaPqGJ0WuiDK6Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FS50SZVf2g8KaZ3bnAzvACOUr7zp964fRdyGjxGD9Dg=;
 b=uOuYrZXZjNmejGZP/FcsDM3com8jDuB/8S/gaQhu7+6maHJplhwixjjqC2wez4ihFbR8DGo3wsbY0zlff+hKwA+J2d/NIBmL+Sbf8W09wo5kEUnijyb3kYv271tvzZZK/U+JqNil1dGwg1Zq2H/pUhTBGSfPgzkDa3+vxvDRpw88sktpRwsdR+9heQLbe1I9ZnfPTT9jC6IpjwpZgZ+WQbtWnDshnkKRA0Yn8adMX451WWCUXVKZZt2AkdH73izLTJV8DjHfjRtTJT+UyFgqD4PTR+nbfP4+faonl/nO13gpgW+q6zERNcqM+i2uNBez5J/cnztE7WyTPwj5mAcewA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FS50SZVf2g8KaZ3bnAzvACOUr7zp964fRdyGjxGD9Dg=;
 b=eiLelXTEX8j+Fo6CRPX8BKeg/VmdBpz8dcLbSMXZXkQRBSMq8yqXz3sI+XJWPJFiDRx0AC8a+V3+qEhu1yADnBMyyy5RR5AstSNLwc+QMal0CSCWaIHzbnU/X5j/Nf9ZoK/bI4kVicwHpkbgbe13BKbuTQ3cBFXo0GNOS2WNpcyvPQpRYpIr5mb3yPAraK/yvCVw17/5zk6TafUZYTWY7ArkYEw0UDAfaNDSVz5ZpeAO8BThUXpwIvE6fL38taOx3sucBAuVHAk+gtUitLz4cWi41j/0HDj+Opa0f2wNqbXFZ2tQsltgp2MdEXWMCprsy8uyFPX9UXO0MxEIip2Diw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10685.eurprd04.prod.outlook.com (2603:10a6:800:264::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 02:52:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8207.014; Mon, 2 Dec 2024
 02:52:37 +0000
Date: Mon, 2 Dec 2024 10:50:14 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org, niko.mauno@vaisala.com, dvyukov@google.com,
	stanley_chang@realtek.com, andreyknvl@gmail.com, tj@kernel.org,
	viro@zeniv.linux.org.uk
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: core: hcd: only check primary hcd
 skip_phy_initialization
Message-ID: <20241202025014.2icxhr5lmeejb5er@hippo>
References: <20241105090120.2438366-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105090120.2438366-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SG2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096::11) To
 DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10685:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b1e7205-4735-42ae-599d-08dd127c60fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qzHz62hV5mydkt0FxcknY+f4+33sVGNLn2P4rSLZTqW4ZnkmzcZ9qMbLiamo?=
 =?us-ascii?Q?PbfZg2V9kBvACepLEYFTTGkcUjGkKWGXgmKhI+Yt8/oW2JrVPtqrxRDprHB5?=
 =?us-ascii?Q?6qFxGt9qGUIEUscwlcBXGRTZSzcw98PsDNFDXen+PhkDsAMZGKl9lEo8UztX?=
 =?us-ascii?Q?ZaagsaWuL27fWdPyzPPwrAN+joepF8iWI44aLYc9po85hOrPeswfE6HOfga0?=
 =?us-ascii?Q?Fba/uvSB8FxpgigQ0pKAo3dewy1+m67USvQcHUo1MMngsJHKPyvjadn8l/Sz?=
 =?us-ascii?Q?AM7wGLarEKnBd8RmVaPMG+X4qN2z7ORtOe/dmgjZ5gBCrpkPXnScEb+kEd+x?=
 =?us-ascii?Q?DepUnrJayLH9FRte1yaCr2gXR1CuV5nLrkfaIgMcL4Lv1wto0Nxy3IQkU1P7?=
 =?us-ascii?Q?1c0qw8chCmrJTS9KEa/XeAUoepQHb2GQLqaJn9l6+JdOYONvbM3BLhOZNM/S?=
 =?us-ascii?Q?UbXz7RIdzjzCvrbpBq51atE79qmt8ZyWNiXHl5MAz1fUQLkQ9OTrSBMybeGt?=
 =?us-ascii?Q?h+w90t9QcIXBzanH3cAOPFa1VCblQahCbs9sZy8JmCkFbjw4BTrU5eyU94Cr?=
 =?us-ascii?Q?JjUKfuXL5eSSE2gnjg1mzrdoK+uS1BwtZ6ByBrqiL/P3d2QetKgz8YBOxlU7?=
 =?us-ascii?Q?WN7o9Y3MNv93DB6iZosgAFljBD+18NoDc1C/o3j6GPZDGewRCSCkh4Aj6sX2?=
 =?us-ascii?Q?vz6akf1RwD7xpfe6XAAW53dld7HaOAOZ5xEO+Z/BPZ+2igtswKma1ZoOyCjA?=
 =?us-ascii?Q?+WiasBTegFVttM7Ofn8Dwbul2yO4yTVxBPik7rLORyal/l44Z4ydvHrNmJ1Q?=
 =?us-ascii?Q?1SDxFXzQ+lYHeVp5JYQQbPK+AxCtrPEuvFDmb3FHKQVtWvYgJKsda1OxksBG?=
 =?us-ascii?Q?EE/4/P3ZOvIn0ImF28XsHiTvrF0spa9pomhFiJ7VQCond7eGSZ85SL0UOt+i?=
 =?us-ascii?Q?DicmM3dIpvvz6ZoiwAYGbQ0zPhcbjJ9L+o8Y2e3I9gde5DUlBPO72rp0e6uw?=
 =?us-ascii?Q?5RuYIlKY/RFDYccF47bx/B8ty+dJhRmk2wFrDtKylXvDoqD/0iJlfEvfw9Jg?=
 =?us-ascii?Q?7it4JazH2ErQ3uRXOM75Hb8ULfK+iwuUbAoejz6aZBv7YPEE7A2hMsSL6GnV?=
 =?us-ascii?Q?8gVJqMQi5ZiYYrStoUbC68f0IVlbOrpH41RzZKsVj89aMIH6VmqasEcd58UN?=
 =?us-ascii?Q?acyuZ4yi8WJxCbqmLwpNI00l2e4yvQP4BQejeRXGKtoZvp4vfAB2jwo4xNsU?=
 =?us-ascii?Q?rAUkHU6v92rgSv99Bk5OBEfTZfgSPpSFXlXm5JLhCJ39knSrs7mV/YTjVbxO?=
 =?us-ascii?Q?cNvqDndMBVbWF5Uy4LB2sl53E8HlbVOx0rzRuzBC/UDNh9WlhhN6CfJbS6cq?=
 =?us-ascii?Q?42HGOF6wJQEGSPtW7zWZHIAZYAVcHKSh8H/w9sZDvUOq3Ch7eQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UBWSLNP/SITLt61OXzYcWIiDkjn7WXMX++du3oCRXky8sHl8QhoCOQxDSbaR?=
 =?us-ascii?Q?C2BqojwJlEEI7tL4inVRfV296t3ORuNyCDVuuZVrxj79bTqbmg2fEB5cPJAu?=
 =?us-ascii?Q?++DLXWfJBK61shJWhlkf3ctNuEH8cfUKR2CbfWAnbGgyckOBeoqN4zsneLqc?=
 =?us-ascii?Q?b5dIZgzu0IN86FDoH+rJZGtXtukf7GSChsQ0/oxTeaQLyLr01TreKTxCy9bP?=
 =?us-ascii?Q?BPB9ajdwShsMLLYNMAa3YhwgyqZ8ntQrqHG4KKIC2mgZf7lVYHghAnHJUqfa?=
 =?us-ascii?Q?lSt1mh/LEMSnM5QXweQCgh4QKq+Sa/RrPzAdIswjpR3C1iQdDpGDpn75di9I?=
 =?us-ascii?Q?50pNdWq5a5hFdhOQgWf345K+C4Tlca+Dn3bEPWXrY7PzE0lkOdvzS6DJswF0?=
 =?us-ascii?Q?LS9BhMq3efl1lp/jMcyieMU0LGzrNeMPaljpNa+tl6M70a9IUHyEPiLT6flz?=
 =?us-ascii?Q?Dw9iYLRFgsvq6NgdLMz3LCgWrk28qbfaCFKcoNBYRszBSafyx6121KCLRWhO?=
 =?us-ascii?Q?p5zJxZp9rGWd1WCnGCz0g7TkjFPWMhHiLOmLo1+F55sMVMID/q1ntHU1rRK7?=
 =?us-ascii?Q?tbKHPxPJNLZBnbgRXgwaM0K83SEslBaP/HYdlvDbUkgddTeaX01YRzf8MYXj?=
 =?us-ascii?Q?sQ1zEWBax52Nd/dw7xmccP2sYG3xJ5LaYVWk0O8n2WAEwewOQ4vUpPsuIgDe?=
 =?us-ascii?Q?jEUAP+Rcc8epmgYjDoMxQZ+eXBCY3diLmn/n9SvUKNkDnBz9L1BUfDS6vnzQ?=
 =?us-ascii?Q?F2GGjOOYvCrmcWCPUnLpETVbE1eu+IdjKFslzhkIrMDjNah/E8uDtDiATs4Y?=
 =?us-ascii?Q?Z5Gq06RhwU46lyvd+ZNer5ZCttruV5lRAOyhRBzdwOvdNDeXQ/BlN3DLqEiA?=
 =?us-ascii?Q?BvN+HsgNBy15x9wcWkym+fX9mHLM5kMg0EBemvVDGEpCF3EYZuJ2wV5oj3I0?=
 =?us-ascii?Q?SejOaHJTC2pfUf9nKHcFPc+A/jOEBTBrDlG4JeB5HHRKD+e7TZbQN9eY0CeP?=
 =?us-ascii?Q?qCVs+fMOPpI+hpP0KltwIDvPvGDn8C8kyB/+KeKqiFnkpRo9ZohZ8HIR+1iG?=
 =?us-ascii?Q?YZinCXzPZUzbzKC1pTE9LvNXHMnO0DtS91wgr3f4G/67qd5ceOrzlh0UjFkf?=
 =?us-ascii?Q?IgdDadSIggJ1KXTLLHwZS4zZxFeM+oQkl3b89S9utPS2Eiwvpq/h/FcLVpgM?=
 =?us-ascii?Q?rkfVN7pcBnsJ1hMgG+OxgO+5Xy+FGavtXL2L0CMF/1Q3q5LLtZXiD4cxHznd?=
 =?us-ascii?Q?uSfwYc8VtV2sAl2/r6Il1zuM+Fe4nG2Ra1N80SE7fHaC5+ZOZtZ7lYRBzbs8?=
 =?us-ascii?Q?mJvScmbj/IppsEsMgvBQmozK/mBrsFXAAsi4x7O3jSsRmmqtY0vgFJXbRRs3?=
 =?us-ascii?Q?Kzfqz+jKoGloUwIUHi+U0VLINM1fWgKr/8cD50lmwB1Xra7x/PRiTy/A/1xG?=
 =?us-ascii?Q?PrkimTSxho/DqZcW78LLt2Mkp4RCDV/kQO+a116KfV9Dl96YxpmREZRY0XgN?=
 =?us-ascii?Q?mDYM0X5BMrkwVrdD0bSIhisPV5YYv49VPiFSasXgTPzzIXwJd7LbbEIgLrzc?=
 =?us-ascii?Q?wAOk7qr7gR9upbYosvIhhr9TPtUbfaaWAp1AdE+L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1e7205-4735-42ae-599d-08dd127c60fc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:52:37.1883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiSwjVgh0ynpT0cJa7XORncrwdQYTRxc7T3rBGBYRb/7IvUD2iACSrjL1dKXdsFwx7NDaneVQ8EuMz8oVGs6MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10685

Hi,

On Tue, Nov 05, 2024 at 05:01:20PM +0800, Xu Yang wrote:
> Before commit 53a2d95df836 ("usb: core: add phy notify connect and
> disconnect"), phy initialization will be skipped even when shared hcd
> doesn't set skip_phy_initialization flag. However, the situation is
> changed after the commit. The hcd.c will initialize phy when add shared
> hcd. This behavior is unexpected for some platforms which will handle phy
> initialization by themselves. To avoid the issue, this will only check
> skip_phy_initialization flag of primary hcd since shared hcd normally
> follow primary hcd setting.
> 
> Fixes: 53a2d95df836 ("usb: core: add phy notify connect and disconnect")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/core/hcd.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 500dc35e6477..0b2490347b9f 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2794,8 +2794,14 @@ int usb_add_hcd(struct usb_hcd *hcd,
>  	int retval;
>  	struct usb_device *rhdev;
>  	struct usb_hcd *shared_hcd;
> +	int skip_phy_initialization;
>  
> -	if (!hcd->skip_phy_initialization) {
> +	if (usb_hcd_is_primary_hcd(hcd))
> +		skip_phy_initialization = hcd->skip_phy_initialization;
> +	else
> +		skip_phy_initialization = hcd->primary_hcd->skip_phy_initialization;
> +
> +	if (!skip_phy_initialization) {
>  		if (usb_hcd_is_primary_hcd(hcd)) {
>  			hcd->phy_roothub = usb_phy_roothub_alloc(hcd->self.sysdev);
>  			if (IS_ERR(hcd->phy_roothub))

A gentle ping.

> -- 
> 2.34.1
> 

