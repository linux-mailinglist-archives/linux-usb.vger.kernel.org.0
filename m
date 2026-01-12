Return-Path: <linux-usb+bounces-32181-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A78D11D6D
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 11:23:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DB593030D9E
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 10:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827D02C15BB;
	Mon, 12 Jan 2026 10:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g2Kpz+0y"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D032C0F81;
	Mon, 12 Jan 2026 10:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213138; cv=fail; b=OT+ovO3Tntpe1BFOn5eSWhsNFH+fUTs1xdiltGalS/goAJkHk/IChGFOhkg7jvYT+oX0H7bevIDLQ3rqvyobQVhlzi7v+L3DL4CHR0FLzPxe/TI7vmzLAzcFfr8kLc1Jo5DYPz2QDfoe2zwqj221xv/sEf66I+Y0ajV5TTacxjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213138; c=relaxed/simple;
	bh=l4eeoJqBr+JDi2wQyBaWCXPDNkSsM/GDa+gCtm2M4uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EWU5eiAg1RImo4eBODAV+zoWpUumyq8DO3Te9EyxdEBPhRSLkBWdXmz7ABhpBbqciq4ve8fwxcnroeZ22oAs5I3O+GJhk3J8A9WbOU7OlfxmzvT9DUEkKPIINFDYVLIYZ55ppDgyGlFfpgocw9KnO+uQK8zDjUAg+vFwYvTAYtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g2Kpz+0y; arc=fail smtp.client-ip=52.101.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qa7BNtV+ZfcU5+F7ZH98DKiC1mqVnU0e7OK/SM1ScUcOl3yalxhzcOYkaqhtyeTAKKsMkrBJnT33Sqph3xP18V7ViSFiGrVWJiUOMmj5AnQXp68zR/tz9N58InqPFIZQ1DF83XjC2YrplQWkb5GGLLlZbFaEQfd5O2m6mULCYx74hHdtcbp7UIAAvPVRVUp6adIt3OO0E64tnQS+vkTFmMguru+7UzsWJav2cWrDmJ+kxWJOR/j/X7/Nub9pw0lrm8WEBi104jpKOFzibBbh0yPkQWCwSncBjr9vgP5HaBSfKV6sPBgcX+tIT/cz+audXq6WBxcrjp72CFmiR8Pdzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=La7vhpckIi/SspWsyQr/fK+xaQkNATBhPhAGpbbOW0E=;
 b=u4F9btoox5pXeMwZrl0Djwx2H2T4XAwIUfrayFJ6lO3GsohmXdaObYQg6XsdO/N1v0GG/eUZyYVV9ahGw4OhAvAX4NplPOzhXMTkq+xFDiuH7Qsm06ojCqjtMLyi9RFfLfDIPgm3xwbky0Hmc1Tgbsmx+gW8vdYeIsSdkDWZVbByEpHU7tjspJyytfzMq57PDao6kng0lu17gmHIq0ExUZVTIq1wV4SAYc1wg0IV/Jyl+mK9Iwu2naJXBRTkpIBduS06YzDu9pf1oclEFwab7rxjmq2MgdWwKRLK2xdiMB8R3DymT163Sk1VvtC7WljziVbN5JyN5xeqViQmOu/Mfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=La7vhpckIi/SspWsyQr/fK+xaQkNATBhPhAGpbbOW0E=;
 b=g2Kpz+0yWgCzBNPgetLny4D2wgsAeNu/KcQN4al0ucc9JGvZYlh7ng+TQLL07z2IPN369mEKOIfDcuJJmm59uvqpxopEcLP7Kx8szCrMF6wM4DqQKzy5sKSIzq/jTQ3GGKtfaRiaYDa3idlt8KUvcjztXJ3y6IxHwCKzYvQU3jZue/qpdHbdtAHX6PgQA3HcIQ6Szc/XztsduygLKR6qNEpZdSnViY2+sWCexSQgoxuvMZnzkRvBMyYgl3pEyAUqIjxspfqcxc4IeWStc2R5wy3p+colGPhh5wkUSNOB6kqGBc46udvfXUsfmrbZcXoENXKBpSkypo68mmwhtFhCvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB9940.eurprd04.prod.outlook.com (2603:10a6:10:4c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 10:18:52 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 10:18:50 +0000
Date: Mon, 12 Jan 2026 18:11:35 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for
 wakeup interrupt name
Message-ID: <gmesaz5t7wmkj4n2pyauluznowkzatazn2hnwm3uwim3kx62uz@jlgk2aum6llt>
References: <20260108103521.2139824-1-xu.yang_2@nxp.com>
 <aV/RLEJQ0PX6DCAn@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV/RLEJQ0PX6DCAn@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB9940:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c85385-0c80-4228-1ffc-08de51c3fad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bZPPkMuO3F5YsC7V6oLvDoCiC5z7MbRDGCh3QciLbOKmz1eIv03kTiptycIy?=
 =?us-ascii?Q?xsA3gt6mvq5t701tGaV/qkgsdbH5iR6mk1R2EAQ7BG57G4jKl9nPbooIHqVy?=
 =?us-ascii?Q?KvSXZ6suwcH9wsyVPrY9nCMYvDwgXH/eh/2yiTPrWs380ULKRJEqDl/pnO0p?=
 =?us-ascii?Q?fB2L3f7jAS2GG5nkeUkgQy7TmgEecNbK9tYxS9+yRk6g+cQlGCzewHrZzvxI?=
 =?us-ascii?Q?m0GklvzE2Wk8hmCRl76a82WnBsHcUHPB5RMNqHaEhNQ1Qm4JEWlqjSzeXS/K?=
 =?us-ascii?Q?hQCdcvsw1kbluwqteLb4H/Qu972DauTKqmYv2FS+z5uwKhLEPl6+YxT0wpWn?=
 =?us-ascii?Q?Evy+Uo7NTlG1Xrzrje5anSOyQDhLi73EHVAcKf6Qt8WNwvBebdGgWgjpYpdo?=
 =?us-ascii?Q?6vZlVdLgjADlXzkPkCuKMP0ATitWjXvw/jtF9mOcgcCR5hKO4g0+QsPd1nb9?=
 =?us-ascii?Q?481PR2m3sl09uv0ZtgnispFjnmCoA7LOhOeqeoSZwF9Z0FTBlRsDtq5u9WwP?=
 =?us-ascii?Q?mzScv668t9Amdq3/nLYq8TUl2vPPXQW1gKO/Gme7ydAsMeale8sUU0+LJtRa?=
 =?us-ascii?Q?ufpKj9cfDrHg04ZO70WP6OUhF0fuOXPHEXLUb4ZvOYWIbxZFVqOWUxXnrIwb?=
 =?us-ascii?Q?YZLsgvCeKFg42odYEc2YXDWAdglsmFYdGdWWyGwzgBHQDnuA73uI+8lE+H3r?=
 =?us-ascii?Q?BWeSEgEkf3TdJqX/pJiT+3iLwBe9W14CvXckBOU6LUF++r0T0Up1edZ+fthE?=
 =?us-ascii?Q?N8Md0aOQr5cLHcGGnqLApUexoEgoVqVaTU+JSQ8XScqdz9O2RY2tFWJ7sQ/h?=
 =?us-ascii?Q?GQ/Eo5A9Zz71K3pje5ED2CIlvCckSlRIvOKKK55BVvpXUm2lJn5hwqWoGZKl?=
 =?us-ascii?Q?tefWKzXj3YTtAyVpM0zJAsTv0HB3iwvrQ3eiP49anDVCv3pdo5NyTKiCKPw6?=
 =?us-ascii?Q?Md3he1fukQYcTR9mK9dS8p9aHPP1qpWJ6kC6QxMW7LfzETNyvj8Ong/SQkr+?=
 =?us-ascii?Q?+lvWSOWBzPaBhAwsxkcKPW8keK/y8LJYzBrPNj8PNHJl6A9RZwSUMDf33o2R?=
 =?us-ascii?Q?FGN5QUzuSf5NsMzW39V197yl7NHkpFFjxkGga6MJADmNSiJUKgGxaQwrHrjy?=
 =?us-ascii?Q?78LxX4arTCTLNXWY1o/OFLPuv7c2uliWFQmBz/5N73w0ewadvKReq2KNWSsh?=
 =?us-ascii?Q?9CybnK2Pu3mrZ31FU2U51V3DIFhBWIxFggDd519atP5pQQcI3IYBjG8rz4zA?=
 =?us-ascii?Q?5mXQXTWztFLPS+pUngYdHiaDTrg16Vr0bH5/sRYce1EDe6hOarj0rV1khCmc?=
 =?us-ascii?Q?/W5vO5iGi02DpNxT4q3adcIG5yFKs27DvoRWO/DjVw9hWroNuRfjhHxhNYWK?=
 =?us-ascii?Q?GnjEE9houcOHVJ18soXEQ7HA4AuCVXoybEQm2VEkVUjXHaui/BeTo5xK2jvr?=
 =?us-ascii?Q?5j/G01QHQlJFN9LcNoVHQi28kcgi7ENTM97nh816ovEeky3dEr5qfoTv06WQ?=
 =?us-ascii?Q?aHCHdJuERr/8nCOlrcU6VVve53mMtZwSAuNN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qL4bFLM2QGPolW3vcsvmje3mvSNPOVBcNbaSqwluEyOCwIV696veg6rhkV4v?=
 =?us-ascii?Q?qv08msD0RVaas2D09SCR1W+ENmlIsDhAgxfvw4tvlPsejcfZTgyF2m7U7605?=
 =?us-ascii?Q?7JjptiXRQkjV3YXo3ZlaN7CFe7qWak41nBrGSHH4rU2rNZL50STO9ZvSTCY7?=
 =?us-ascii?Q?LFJ2UI7LDetyLQXw6UmWookeP6XY9MAVuh/BJBMAm55eWInwFIIzH8V17lRv?=
 =?us-ascii?Q?pVR0LFi56+nEOziGlsYuP4PqE4f8IM0OrmZ6MpyJlZgsIKiIclON1Gjr/wHZ?=
 =?us-ascii?Q?daSCYRn+meM6stxbX4/Fkq7UQ1dUHg8y3acg2muU+LII9kXk+xDszB3tzVyT?=
 =?us-ascii?Q?c8is5OIEMWdgZF/AtjbHikHWWVlw9NhuMxNDxYP2KREZmSVs6+o9S0XBfzGo?=
 =?us-ascii?Q?NpI7LL/o4HYI/xn378WbDQoy2OGmlqXLiIU6nyK42+W2d5b1vi8VuMaMDZEP?=
 =?us-ascii?Q?6FrTilHWGDEWBHdMWBfX63E3GIg/VvuupcDpcvDm04Wl/awB310Qm0J7AdIT?=
 =?us-ascii?Q?Gpn94Ic9R7QZ8P2t8vZhrvKxevabXMw7oMfgUJieJFScgRzU0a/FDGV9V3Xs?=
 =?us-ascii?Q?ik+1ExWvW2Tpm1azoZ4Ld/2yEIbgF0y1BYW4ksoBa1TbZ8w34VvG2L7qJ88Q?=
 =?us-ascii?Q?TducxtIXpNKm+/WNYT1eWfT2sqG534lYF/LOvz3D47o/lkaXyX8VapvH/OpR?=
 =?us-ascii?Q?+whha9tQraHAiRBjcEkafIsbXaSKTY6LTuVa1SzrpjXscTnveXJwcb4A4heE?=
 =?us-ascii?Q?onPQc1uJHL8Je93ryCpNANw/51OlkSof0ft1pZ/pm2/n9NcasKXIz6avf+jd?=
 =?us-ascii?Q?8Z8Cd+fA/RRXbVPWr4CPiwnv84KexkRTLkGv3FVyk2J3J38/GhVQZ9u2BOZO?=
 =?us-ascii?Q?GsNiiX9f03a1ai8k2LRLZRY0PAttvFAGPNZ2V+S+nqhdkGeQvzVBtlxlF2oZ?=
 =?us-ascii?Q?Ih+wv67m6EeCL0fgI0Zaw+NLO8hki/ixw1fw2zTg7eocjDdrfzcdmIKFN9FE?=
 =?us-ascii?Q?nNoMc4f/C/wgA6ebSDIPtaHIdzufLksITRc9rFb9tBBwXB9CdU66f7ZOVjeY?=
 =?us-ascii?Q?1bIffYCQeRbxvKu/SsD5fRWJVX7Q/C7nLBq8h3lvsy/BoIUPs96VA5d8NQCa?=
 =?us-ascii?Q?7cXpTn+Id1v3EOyfZYokYoQ5r5+528Nfat8gUDNLhHRJBviE/8zV1Uux5+gB?=
 =?us-ascii?Q?K0GVDmEDnx1sJpm88JQd0QE5U81KIBPOdqHLTgUUnJmxSgY6bNlYmMTG3JdI?=
 =?us-ascii?Q?oEXB2GWgNix6LQ0j6ApiLI1hddEOgPmkIWggWgwpO1MHpV3yISnaqW0fvMOy?=
 =?us-ascii?Q?C+8L9ofq+cVJhEQUZw0e8bo5KUzW822wT2V+Q+tks09pw2NmUb5ihNNNTQmr?=
 =?us-ascii?Q?YpnmMUKZ7pz9pEYoZ2lZgHlVciRf7ox/3kYmVY/lm2f5AFYa/yj+nHihTytU?=
 =?us-ascii?Q?+/dp/YNkpkGZaJJEUOyzmqFoJsTGP/NO/BykbyeiKP1otnzDwMS/Y/vXFHeu?=
 =?us-ascii?Q?dObEoU1upywb7XXW6pYboLGnouvcVchpPBc5qXJ1GvlC2GctubsZ2anXDSgi?=
 =?us-ascii?Q?c5FBj5h22IkfeK7vePGdyyRpXlw9tz2C7//DeEOFAjXTETV8ENhGcMRdf7on?=
 =?us-ascii?Q?H/LDglRyCBliy0fAX/ILA3tAs55jisP4S6da1PLp3DiW11ErRgnvwFQW/0lw?=
 =?us-ascii?Q?iwzpFH/cXa/BIxQ+3d/r1daKYSCpUhdf4kM96PgDOqi/EOPb4/9gsbdfbpnU?=
 =?us-ascii?Q?8P3S4ecR3g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c85385-0c80-4228-1ffc-08de51c3fad5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 10:18:50.4260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBzHe+iaOgZSi9U2ghklLkTefG3RqEcyd+C0e9aM59o0n3xAdFCa0lqGbecSRTxjKY3rTzJqp4+3m/Eqy5C/xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9940

On Thu, Jan 08, 2026 at 10:45:48AM -0500, Frank Li wrote:
> On Thu, Jan 08, 2026 at 06:35:21PM +0800, Xu Yang wrote:
> > Currently the wakeup and controller interrupt name are same. It's not
> > easy to find the correct one in /proc/interrupt at the first glance.
> > Rename the wakeup interrupt name for better distinction.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_imx.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > index d4ee9e16332f..e4345e0eea59 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > @@ -385,6 +385,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >  	const struct ci_hdrc_imx_platform_flag *imx_platform_flag;
> >  	struct device_node *np = pdev->dev.of_node;
> >  	struct device *dev = &pdev->dev;
> > +	const char *irq_name;
> >
> >  	imx_platform_flag = of_device_get_match_data(&pdev->dev);
> >
> > @@ -525,10 +526,11 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >
> >  	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
> >  	if (data->wakeup_irq > 0) {
> > +		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
> 
> Need check irq_name

OK, will do.

Thanks,
Xu Yang

> 
> Frank
> 
> >  		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
> >  						NULL, ci_wakeup_irq_handler,
> >  						IRQF_ONESHOT | IRQF_NO_AUTOEN,
> > -						pdata.name, data);
> > +						irq_name, data);
> >  		if (ret)
> >  			goto err_clk;
> >  	}
> > --
> > 2.34.1
> >

