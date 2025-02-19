Return-Path: <linux-usb+bounces-20838-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACA9A3CA12
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 21:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21DD617D54A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 20:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386E623C8C6;
	Wed, 19 Feb 2025 20:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="naA/2+Vj"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000561F2C5F;
	Wed, 19 Feb 2025 20:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739997340; cv=fail; b=WDpKxJuknDVT/x0z1Q1bdoRWumvxWm3tXXFn9So2Hvm4v4y8stFGeeQjjl1oekgWLaIhRiVnj7hGdmsUcM8QeQkLIdqmwpasAk8PoAQFM9ijLiU73oyeTCSj0iJfQEAE26EItMRfAE709hi+XjtrBnq/2xiesOupKxWKE3WbKzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739997340; c=relaxed/simple;
	bh=Zn6r6NC0BCVttAe5ybLZBvv/4b3gTeCji8A6Wdy9o4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bCzq+oQRyf0/Q9D3vw224Fd+eDbyDCoBWdJULyiN0gvzWG6vrzeX21m91Ih+Stm4i0msGwBFioetSQ6nhDjs2TLFXpPSSqWepi1WL1sKSeABtEIlNnEGqqFKG0Qj2YEVv1YmUTdLfxAxI/VRINaBTPawBHBb59LKB+H3EFpqLyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=naA/2+Vj; arc=fail smtp.client-ip=40.107.20.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUVv7M5BFs5S+PvWag/Cv/avk19i7SWGTbV0Sv3QSwJBDe9jLjKNmxsPk7IgnuHO5MF/jIPaWR9PSE7M3Oq+FajdZ3MFIguP7WmYZIfdW1e2BcLxzx7KGYr/MunNfGk2RQmuiB7ILRn3HEq+F2XddTgfiwgXADF6hkxshG1fMKQaLjGNKsZbdWzG3yCUPwaoYVUV7yjPLfUCD/8Nz5f8SPdM33htoscEgj/MCgVLYxGYtHfKtcXSFX5pBTpvOutafPv9z7a2ZWGx88HrpGB2vHDt1Xt/uEOumt00dmLfH3jnpUiuZrHHYiOKvaAp0x/c4C2zB58w3Ai4f2MOYZE9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HH/EOIPvGLbBVxiKNTgxH/xeR2LLWHVYUH3cGX4UuRQ=;
 b=a+qKdU6MOq3PWMELRHzlBGGxKS4CTi6Pg4yOt43Ut6fMDhQuss+oGC2heaMJOZ6JAYiBVRjpg9gUdomuEcHXAe8lIKUHgfOeM1N44Fvss4TP2Hysrml8mHN2Vw+sI309moowlcJ5q85T2b8F7+Qnlb2hBICEhL67VcQr/lUOtths7FvxTO8SQ4P7xaRKWle3qHhe2dBdFbvlS2XbXAnbtAI5r+wXht+/S8jGFV0LRsbgEJYt8nwmYiCtjh+RYKmLoMOh763hFgmhd+Rh7T6RGYrOn+1/8D8u917EgFikmGYp+Ep4Ku6PDugiprG4IFxOM3FMQCmY1KSuShfJDGrDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HH/EOIPvGLbBVxiKNTgxH/xeR2LLWHVYUH3cGX4UuRQ=;
 b=naA/2+VjoLLyweLETBHSocAy31c6eRyWdVW+k0+3TKsdAhpbdJXsEq11lOSnD8sAgrTNtadFfkhNB20SMB7pyorMLzjJqMbFzpi97k4gOcCiA01v12mf8je78LMx0AipGGmN8J5SsBRyuTQ9mHV7S+XGDYNsbF8DcA4qN13rFhnb/1+8/amg3xGfqO57K3fcX+ZUlVvJ0TLw/Xp++/zqpR6AzF4prDh+QDy7bOtvVKudaJatIpyfuJlCM+rLmU/3oZYPEK6CsOGZ0IWxJkHEtK/2g2PghQ01PgvtnFjn2ROsP/PX+jUk5OiCg5cg2Lor4QVRXjttC6GJ60qrwPQbYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB9804.eurprd04.prod.outlook.com (2603:10a6:150:114::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 20:35:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 20:35:35 +0000
Date: Wed, 19 Feb 2025 15:35:27 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 4/6] usb: chipidea: imx: add HSIO Block Control wakup
 setting
Message-ID: <Z7ZAj+PrNrBuWx8i@lizhi-Precision-Tower-5810>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
 <20250219093104.2589449-5-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219093104.2589449-5-xu.yang_2@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB9804:EE_
X-MS-Office365-Filtering-Correlation-Id: 21aec8a2-0289-4325-e889-08dd5124f647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Il/wfSti3NsB2ECeRMVj0J50xRnEc3UrSVY74/ZeOE+Dx+mDgO+U2LKMZXdQ?=
 =?us-ascii?Q?UhucZrRz7DvJ2+Ajr+CPuZwZCk3WAafdGkePEU5+GKTKDS5nICP2YadV/48J?=
 =?us-ascii?Q?eDxbXntWUTaZ3niQP1LwrBk601mxpw77fCiB7rBmnh3HpRKcN7YzdibbwJXV?=
 =?us-ascii?Q?icT2A2Xw9T7jTa81od9ocphEitkbKWP4JvCZV/npv1v9pDCu2jnuqmA0riiD?=
 =?us-ascii?Q?5gP3KHxSx7WkXGKGJMqJ1LaJIXus5l+fBeU0jOZckE1HTVt9MN1WatJ1rTcx?=
 =?us-ascii?Q?2ux0jKEe1ErhpuUU9lswvxOukZKrVjRrGyZMgsKT0uSsX4LAWlmGvLZgiwCg?=
 =?us-ascii?Q?tLEBGYXY7GmdUZSEDU91tMMAsVJMFZuUC4JlaZPwvbAAs2I1o2bP3xFDLVj1?=
 =?us-ascii?Q?XwlpdNsocTc55iI/p3lDkCgvIqAKoUqXGPKbhU+d1C0GHeXEQD+K3qSaNqiX?=
 =?us-ascii?Q?UnHqwCqvSa/Q0qy7vbWTSzwm4Ia8yj7PvEQDV9KIxqXFOW1cQh62IE/KgLql?=
 =?us-ascii?Q?pvCQwqXLQQww98t5m1OYnssApRHGx+6M1tLP4CF7owI7U+WqGtU1SdhQJPjN?=
 =?us-ascii?Q?t/edNFSUU0I8kHyrgwK67GvE57W92Wnx5/raJHwCtcOvqAlrZxnYYB8pQuGh?=
 =?us-ascii?Q?VCxzUsswG9a631yS++WbaR8pU6Ac7uzbZdT6g0beLV2y82qNZx2AiY6M2Hsq?=
 =?us-ascii?Q?2LrURdQgXzRc9yd6Nwd07VqtXisdnbzm/f0duXSJT34XnU2a95mo8qq+SkY9?=
 =?us-ascii?Q?w2IPhXKxjtqT6yM3CHx2j8dNK1aeksb+hjnYIEyiAZoJsu7WNpw7S2wfh/kr?=
 =?us-ascii?Q?wLVEbN0Yk1wYPjz5YSDDhqAvbJ2z5MozIUPnfLw8A6eJv+Lzb7Ve8IJRvL/2?=
 =?us-ascii?Q?fDeX4y0gitMfpjXysvTzaaJ31W4cit+XD51gYayEOVoxJuinHdLr4kaPXHxP?=
 =?us-ascii?Q?nKmGeWXmqi7tqJyLcC1i8S8qa4AFTq+aXFm6qnU7RwhbFIrZ0GwPckXnLQ0v?=
 =?us-ascii?Q?23f+OSdCU0NeobDXzTcGTbNxFvkp5EO6X/sqMGG1Wl7GG/nkA2LXZx6aSuPI?=
 =?us-ascii?Q?BkHj3CtYDTN6jG9GoY/QTn9GIFCNj4V2oU0YRbTOY7YxvVtRjJrPkzA8qnZk?=
 =?us-ascii?Q?vAgDfSkms8IsLYbi2afz8Fh2yjZ5M/YQq/sjYbcpRvrPgnpiRJRZGzFb3Zon?=
 =?us-ascii?Q?QThbsdYe+FxHIScB228cZDlIWZVQKZ+uf+asZk+tejYmNuUdKAZMOVFvqI1O?=
 =?us-ascii?Q?vzWHZMnOIfBKtM4UoQg7iF06PGqtz5K3PBwXYqJBtc96kXIjp+DygmTLsNNk?=
 =?us-ascii?Q?XjsVozUjvYccFeP18ZTPbMlSddpiNi3Da5Klm+Kj7BkEc6PaQSb28KdbH4XW?=
 =?us-ascii?Q?WdKsevBS5WNEhXjJFZLE6vPCPQNQtkUIBZInwBnCVmki4SlTQbl0rvML8KeJ?=
 =?us-ascii?Q?jzZU3w30yvQN7emGayQ823K56vKOfucN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HcMo0aIQ/HZa4QryBzRCG/2rXrdqG/wa+y5tOHh5WbjM7F6kYzWYE5G3dXuV?=
 =?us-ascii?Q?/Egxh/vVfB2k8qvxO5JZoHFFjgDavcHfURZGIaDwBeFbe1IXxgXQNUprqi7Z?=
 =?us-ascii?Q?GpZbtQcRriJQB1HQy9ADDrvlK7P5Ehr+LN5HDZOWNfbD98zslkWZlljxRZT8?=
 =?us-ascii?Q?gAerJDYaXCwe6U75nogYA6Ddq+YxOvMTCZL+yNYPrE9wOU/QK4q42Kp37jnc?=
 =?us-ascii?Q?VC7qmiX9mEt1lcnvJTaCv9P2gch3xdmaiM14/IVS3daKY1oYhS6tZ2FnUk9R?=
 =?us-ascii?Q?XFVyQ7HErkotVbZb2lTm0CspzwZrn+SZEJuyR4z+JPB11nl806vVYlMfhdOt?=
 =?us-ascii?Q?tVvwmskDfCmnnWVXB+tTRvlr/b6+oIub+Yjey2/iIVt97C+SshWc89nTjNa+?=
 =?us-ascii?Q?g+wQxuIRBntLiq6WcGNzGldjlrQkvmr8Gkr8KZnSmorhxevstQlUNV1pzoQS?=
 =?us-ascii?Q?02lvWURdGYd9Rkfy06HK/1oF7vLnIgia1yCuZQ91xfrVkGlsSfVkLPK+Sfn/?=
 =?us-ascii?Q?Kv+/KQv19/eFeUJ44rnFdx4qmBuK4pgar4zSsaPiWqOy7BeQ560AbqdzqNww?=
 =?us-ascii?Q?ZRo+853etl2Bc8fikQ9jJAEtpyRmbVl+TbKyP3UhTBzsQzbTVR7HG2nNEsv7?=
 =?us-ascii?Q?tdKBxBgrmHxvQCP+hN76m54mIMgIHD1zeVI6/2Moat7CkrlduGWO9FNBT/ln?=
 =?us-ascii?Q?Vuqv+dqXo6JvX4YN15MEWC1fl6yTcg1hoGXQgeIBF3hG9R/FNQscVx3UsOy5?=
 =?us-ascii?Q?4LzdHEvpNlsmXX5S4dgyPGjxGqcN+Sx5WvmI4WsBVjCHFaRQ2ZsmjGuBYJxp?=
 =?us-ascii?Q?ZUJ8lwUWb684tzLaoOLSKFDCUR6E+4ayy5KpvmDxyhpR7L+1rF7kY1CIaHNN?=
 =?us-ascii?Q?a0z238Z9/TtBolFO0IeppyQuFTrVjwLNQF0qQborCnO18RLQF/mXwGg0lTz3?=
 =?us-ascii?Q?FVUs3H4FpHeDlp3s0Ip4tUO0Hf7IA2zHQpDUol4McjcLjfzsdOqz+rf0NHJZ?=
 =?us-ascii?Q?AT7+qQHvOiTWl4FrHYNR3Jtkb0rvkgoKKcEUxrmdjhscoGcKsPYy2VnUO97T?=
 =?us-ascii?Q?wvaikBq1Dog0k1ciFCpm5IBoKDBvuek6N5RxjWbty5WYEkEtlfEOjgRxT5kf?=
 =?us-ascii?Q?euKqMpCXTg6DrB9uXCGPau7BOy/C8jBVUCrPBM7EaVUfbo8GAzoTwCKDyW5t?=
 =?us-ascii?Q?NbZQLnZ4tjNA4rng1QNpQQgUM26cW0Yn8zBzoc90yHEKayiA/pKXk2oUfGN+?=
 =?us-ascii?Q?maKlJPj7py48GOQ8YtrAD/r7QXKx0LU5y/3oBd485JwO+BcYROqiSl1hDMbU?=
 =?us-ascii?Q?6gk8SJ372Y/UHwkH0hzWrT8gUhNbQTHLvSQvICAjedrVZpFVN2aR3Y1FzUXp?=
 =?us-ascii?Q?PByiHafhsAupJLrLRmo0myeMQ/fU/wYFii15Y40DVDMISQjRtpsSAuthi0/+?=
 =?us-ascii?Q?9u+tw84a+vUJ+2KVlydxCksiT1Wkj8okR6uMfYDpxPclqIx0e8rryLBhYaSM?=
 =?us-ascii?Q?oYcz7PWWDOUS/QfJVyPuD8A14UWULasMUVI9LHchWF47KI0uMJdTJWfCkP6a?=
 =?us-ascii?Q?fWrLvgvAuZ51oiv31S2Sofmc9NI7dldJVnM56dPz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21aec8a2-0289-4325-e889-08dd5124f647
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 20:35:35.0453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1R2XIWUxOhb56Szo4VO/zhWbCS0QtBqZAzqZggwyMIVMOQSrk9GIvI6SYC8Y12HeK4Cf3AZVEgE1cIJDZVmBRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9804

On Wed, Feb 19, 2025 at 05:31:02PM +0800, Xu Yang wrote:
> On i.MX95 platform, USB wakeup setting is controlled by HSIO Block
> Control:
>
> HSIO Block Control Overview:
> - The HSIO block control include configuration and status registers that
>   provide miscellaneous top-level controls for clocking, beat limiter
>   enables, wakeup signal enables and interrupt status for the PCIe and USB
>   interfaces.
>
> The wakeup function of HSIO blkctl is basically same as non-core, except
> improvements about power lost cases. This will add the wakup setting for
> HSIO blkctl on i.MX95. It will firstly ioremap hsio blkctl memory. then do
> wakeup setting as needs.
>
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 107 +++++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 1394881fde5f..f723f8670bb8 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -139,6 +139,22 @@
>  #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
>  				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)
>
> +/*
> + * HSIO Block Control Register
> + */
> +
> +#define BLKCTL_USB_WAKEUP_CTRL		0x0
> +#define BLKCTL_OTG_WAKE_ENABLE		BIT(31)
> +#define BLKCTL_OTG_VBUS_SESSVALID	BIT(4)
> +#define BLKCTL_OTG_ID_WAKEUP_EN		BIT(2)
> +#define BLKCTL_OTG_VBUS_WAKEUP_EN	BIT(1)
> +#define BLKCTL_OTG_DPDM_WAKEUP_EN	BIT(0)
> +
> +#define BLKCTL_WAKEUP_SOURCE		(BLKCTL_OTG_WAKE_ENABLE	   | \
> +					 BLKCTL_OTG_ID_WAKEUP_EN   | \
> +					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
> +					 BLKCTL_OTG_DPDM_WAKEUP_EN)
> +
>  struct usbmisc_ops {
>  	/* It's called once when probe a usb device */
>  	int (*init)(struct imx_usbmisc_data *data);
> @@ -159,6 +175,7 @@ struct usbmisc_ops {
>
>  struct imx_usbmisc {
>  	void __iomem *base;
> +	void __iomem *blkctl;
>  	spinlock_t lock;
>  	const struct usbmisc_ops *ops;
>  };
> @@ -1016,6 +1033,76 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
>  		return 0;
>  }
>
> +static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
> +{
> +	u32 wakeup_setting = BLKCTL_WAKEUP_SOURCE;
> +
> +	if (data->ext_id || data->available_role != USB_DR_MODE_OTG)
> +		wakeup_setting &= ~BLKCTL_OTG_ID_WAKEUP_EN;
> +
> +	if (data->ext_vbus || data->available_role == USB_DR_MODE_HOST)
> +		wakeup_setting &= ~BLKCTL_OTG_VBUS_WAKEUP_EN;
> +
> +	/* Selet session valid as VBUS wakeup source */
> +	wakeup_setting |= BLKCTL_OTG_VBUS_SESSVALID;
> +
> +	return wakeup_setting;
> +}
> +
> +static int usbmisc_imx95_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
> +{
> +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> +	unsigned long flags;
> +	u32 val;
> +
> +	spin_lock_irqsave(&usbmisc->lock, flags);
> +	val = readl(usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> +	val &= ~BLKCTL_WAKEUP_SOURCE;
> +
> +	if (enabled)
> +		val |= usbmisc_blkctl_wakeup_setting(data);
> +
> +	writel(val, usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int usbmisc_imx95_init(struct imx_usbmisc_data *data)
> +{
> +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> +	unsigned long flags;
> +	u32 reg;
> +
> +	if (data->index >= 1)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&usbmisc->lock, flags);
> +	reg = readl(usbmisc->base);
> +
> +	if (data->disable_oc) {
> +		reg |= MX6_BM_OVER_CUR_DIS;
> +	} else {
> +		reg &= ~MX6_BM_OVER_CUR_DIS;
> +
> +		if (data->oc_pol_configured && data->oc_pol_active_low)
> +			reg |= MX6_BM_OVER_CUR_POLARITY;
> +		else if (data->oc_pol_configured)
> +			reg &= ~MX6_BM_OVER_CUR_POLARITY;
> +	}
> +
> +	if (data->pwr_pol == 1)
> +		reg |= MX6_BM_PWR_POLARITY;
> +
> +	writel(reg, usbmisc->base);
> +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> +
> +	/* use HSIO blkctl wakeup as source, disable usbmisc setting*/
> +	usbmisc_imx7d_set_wakeup(data, false);
> +
> +	return 0;
> +}
> +
>  static const struct usbmisc_ops imx25_usbmisc_ops = {
>  	.init = usbmisc_imx25_init,
>  	.post = usbmisc_imx25_post,
> @@ -1068,6 +1155,14 @@ static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
>  	.power_lost_check = usbmisc_imx7d_power_lost_check,
>  };
>
> +static const struct usbmisc_ops imx95_usbmisc_ops = {
> +	.init = usbmisc_imx95_init,
> +	.set_wakeup = usbmisc_imx95_set_wakeup,
> +	.charger_detection = imx7d_charger_detection,
> +	.power_lost_check = usbmisc_imx7d_power_lost_check,
> +	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
> +};
> +
>  static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
>  {
>  	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> @@ -1289,6 +1384,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
>  		.compatible = "fsl,imx8ulp-usbmisc",
>  		.data = &imx7ulp_usbmisc_ops,
>  	},
> +	{
> +		.compatible = "fsl,imx95-usbmisc",
> +		.data = &imx95_usbmisc_ops,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> @@ -1296,6 +1395,7 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
>  static int usbmisc_imx_probe(struct platform_device *pdev)
>  {
>  	struct imx_usbmisc *data;
> +	struct resource *res;
>
>  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
> @@ -1307,6 +1407,13 @@ static int usbmisc_imx_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->base))
>  		return PTR_ERR(data->base);
>
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (res) {
> +		data->blkctl = devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(data->blkctl))
> +			return PTR_ERR(data->blkctl);
> +	}
> +
>  	data->ops = of_device_get_match_data(&pdev->dev);
>  	platform_set_drvdata(pdev, data);
>
> --
> 2.34.1
>

