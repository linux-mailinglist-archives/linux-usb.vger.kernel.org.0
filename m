Return-Path: <linux-usb+bounces-21670-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5107DA5D811
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 09:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC95216B3DB
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 08:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF120233D92;
	Wed, 12 Mar 2025 08:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IQGp0tQw"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013034.outbound.protection.outlook.com [52.101.67.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC714258A;
	Wed, 12 Mar 2025 08:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741767884; cv=fail; b=XvdfL9LraCjCtCp6gTI5415SDdJwniFvsW1Ox06a447l1aa4WDWv8lO20X2Zgp8zjHNSLaOs3K7T6qd0SGvBx4eis9bjMTcVaIbIwlm//S7Q5by/aLOXp+sICvpQfhTvPXGHEm4bkDIgYX6mHrxr/VSgDtLWxgiD18ZVytPCim8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741767884; c=relaxed/simple;
	bh=Ha07FKOssGK9S4qdT2tni9u2+ohnxYNr7MG+s4h4xmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G1W0kaBVlcTXkIsy/Irm3fti+YZBRqx074FliW+0CjyrKF6575tm12CpNcPYPzTy2tPVWspFmBAD1gkjOqHa//xRBIjDETX6DkXG3xiXEf04VW8BGlIUJ+PGU2GLkQPWtqYBtpeb9FiQSmhp/24Jgln0uzqCCqACAy/l8E5+aUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IQGp0tQw; arc=fail smtp.client-ip=52.101.67.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyFLaWgSrnPTeQwnHlaCEfkCZA518NupmPUU0x0XnceTN9tjRm/LUP3RQ+TxJrdi+HimFsfcuBYm55D5OCOGOf0cP56J5OHbTAE3pmOOZnsDyeWJQzqnmTqfhMxj6UlpvU+N+68V8iUs3/8Gv7422nB0c/B5adWzghDjEQrPogkwKiG0yrHIX/zRehIj1R21SIxPqWSCl2vJVNfJzp0t/1yRHrp7odahnoSz9JUQCGZ4uH02eVgRT11GbgbwBYg5/DMo3ce0z6qR/aJrBXBmjdOJEDmUUZ5mJr5H0iD9MuVFI/Au+cZbYsLoppfTZNLc8eXUstZ1XYv6K0cKx3Y3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nBKYZtXBfmt5TzWDrIslplyiICv+MrK1Z/mdk4wAmI=;
 b=Nsd/q8xxDmS1/ZkRFY88WntLseHrRWnitdaDqTYwzDMsMbCHxB05pJEI1vmxTxAUR/907lZIyDiMPKHXxPlEQoMLfkoAbLrNJgE1dWtv5dxyG1UGGAUYc8xbRe030pjRUXtIj20ABFtzK3YPLTEy2m5mD5Md/XECOFCqzpJjpZMuqUDDVuNu+dQQnsvaV7vxY2pZ8zLZYrhoMRB6a+Q7htklopO2+03sOti7pKNWEEd30b+FqnvIPPThEscQ9kYvWIcaYetu00otjYINSTtoqdikmSWgvQ9x09ly/Dbxn7o8JXYjYbMwsvbJ2593q2CHgQlxgQ72RRMr+S70wKGA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nBKYZtXBfmt5TzWDrIslplyiICv+MrK1Z/mdk4wAmI=;
 b=IQGp0tQwqgGfOPYLt2XgvWL7svA/hO2zHO0IHI3oxIb99bHeZ2wZyrJrHXIhdDa9KrCpce1bL+5Lkc01+XgSGeC3x8eo7c3kQABvdguuPs8gs6B51c1//v/xmu7BFQf/pTV5xmEENIYprqv49kRk5k8QMD0LC/MqfEON2pSSIWSeNevgL7emtg7l5qZ59CXfBmmZy72QzGSuJ5QPOAv3CJ1eyVukEjJVfyLSXl6KDjrY1RKBaUR6E6FcWSU37wJciDgZw03uQQw1dS9B2TemoRdwLqWoL1eXjZaXv2cYVKplVptwxylDPlAOp7+0sELeil7YdOM9aXw29kpgYXVpFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8617.eurprd04.prod.outlook.com (2603:10a6:20b:438::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 08:24:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 08:24:36 +0000
Date: Wed, 12 Mar 2025 16:21:01 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4 3/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <20250312082101.z2uy6xm7xocinqdz@hippo>
References: <20250303033344.1251076-1-xu.yang_2@nxp.com>
 <20250303033344.1251076-4-xu.yang_2@nxp.com>
 <Z8XjPhl4jYdggDKr@lizhi-Precision-Tower-5810>
 <20250304134221.s7wlfauibd2gc5zo@hippo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304134221.s7wlfauibd2gc5zo@hippo>
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8617:EE_
X-MS-Office365-Filtering-Correlation-Id: 5260c7a3-ba67-4e8c-fcd1-08dd613f5350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gexPUnqaI8t6RCGprGlY81xL7Idq07sRil1YzezfPO+4wUOtRyc4HLs/zpm1?=
 =?us-ascii?Q?aArPrbQLLa5OK5TLzDcvLXBK/iGzTziTykHw44hdsdbcKnnPg5jPh4vvazcx?=
 =?us-ascii?Q?AtMGk6x7I3c/di84vTnopfSsxcKe/cgzlyX40Bh9mP25PgBBEX/mdKIOWqW6?=
 =?us-ascii?Q?xNd6tYpu7HRP163eo8Z4qS8yOjrXOCwUeNatg7blSIQU4aaJyJnD5erFVid1?=
 =?us-ascii?Q?C03vGghh4ohdsz5pz3CugqewCkVZxq5JDmMbRZB7kt2fUgiJug66/XsRtymw?=
 =?us-ascii?Q?giym1D8dZfZN5DKFfjgOYBH/AMukrEUpnKG1rvAc33ZEeLdBz4Qd85BLLjzl?=
 =?us-ascii?Q?bXwAhBuNZqY2DffFSlHzWcAzOtIuCXkW18skPRWbNUx8ayxhZwNHIFA4erkM?=
 =?us-ascii?Q?K3cYxUDqW2mTdrcJT9M3VBmxrrkssAkAzh2BXccsFAsNMmNd4UXt3pypXKjD?=
 =?us-ascii?Q?mOUGRQnZds6Bx8jyNQrgRQQsL/+/g7ZRepyf/+uvzbVqp1Z64JjtuolZBDbo?=
 =?us-ascii?Q?8FdOh6ZPdyyeWfaht5S6NFK0huTP2aLi8dWpNcZWRNQE/6XhO+mWXJpvkOvz?=
 =?us-ascii?Q?XlVtoQ++0MnXaHdJhY2aN9zV0NH8s4vjNtraFA9a1YW5DR9YswjCsudIQTKi?=
 =?us-ascii?Q?hMe1mk2PLRl0k84KYmhwycWXYKq8/08EtSsobAK+facjZpD3crujCSa0Jp9m?=
 =?us-ascii?Q?ImoRjUQ99q+8K6R5APdy0AEeFLhf9KkVZOSOgAIXwd0TdnJybq7558fqjvzI?=
 =?us-ascii?Q?YDc1rPj4NaHQEdxyPwh4aKIrlIa38IuaMox4jQBqz8KEu/J29tbbbHB+PE3h?=
 =?us-ascii?Q?p9wq1JByo/VWaPGS38stNWOs7wX26bEH8vpQVem+f2J2b2uAJakVnT+9ITCd?=
 =?us-ascii?Q?mV7o3xmXDI+FcCKs9K0oDwlsDAg4JA0NkIB4eT8ckWD61M0KrN0MIF0UEvb9?=
 =?us-ascii?Q?vxmRFxppwA2FOmXCxYeQEgX0GArCnFL9rrBckmw5gxe0OBzG8jdtYxIdiAeV?=
 =?us-ascii?Q?z3PupClWuOZptRf/NhoBNlSCxde7XsAbJFW00ezuzSEV9ei/j2CwfsLRGAtT?=
 =?us-ascii?Q?xzQeRNO2R64wt3Yh6GcUN9acXd4Fjmv++jElrzRorCybxAoQulj5CTltr2QK?=
 =?us-ascii?Q?Vg3IpAejbvI2fay4OICUQJXJN4PkuK1o1NmKD99U8AHVP2hzVDtzYo7QNbC4?=
 =?us-ascii?Q?NH/i57kTaQFTMH/X3qaMgKpBYDrYk8JSzK+cI/OammMAtC4xVIR3m/Kt9Aim?=
 =?us-ascii?Q?deHmLtrglkaoNMJ+U31mYGnnrXRmfnlrkUNFN+W8pMeZB0/qF+J6TYEh4cuM?=
 =?us-ascii?Q?2GKTmknUMT2bsHofc8UUQGAUO866n2GQxs1FSelNAZetW8G2Yv7rjTEGYXGV?=
 =?us-ascii?Q?PUeU05BU/LRrhNFqTOrLzTjc8RhuKtXbVRjBIviCs+KzrnyvaBRH94L3Jrk1?=
 =?us-ascii?Q?3FhtmFbs/tGICzcUvbhovf2U8hCXSSUL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?onnYzrv9O+gw5U6di5azkaupCDVDVbhQHUBT17dw098gqCNzNX3wnKfuv2wb?=
 =?us-ascii?Q?6SCY5nXkeviZts+B02coH3JhRozoDyhIPMVMKy8I9WBFiV3t8AwObSkU3EdR?=
 =?us-ascii?Q?6BRdPgUy5dbxNRKryJIOg4emsFpCpXK5qvAukllaMelWiO2LNfQEad0we9dM?=
 =?us-ascii?Q?fAk8ZOI3NjuGQmgoIKaH7Mp/sGEOsvURUz68qEp1BKPiyIHOB+I9UkGSvQj3?=
 =?us-ascii?Q?4BgzWE0jQiWs+Kx9RZnqL1Cqv9FXmaKKueXUHVDxzmANbNWmSW+N3tz6+Zcb?=
 =?us-ascii?Q?P4HV5Txej/QjQUSwTa7oi7svUxas7LgZGGDJIzJUy7WJuKcu5u5EGoN4iN5w?=
 =?us-ascii?Q?to5iToYp5e9WofGTN/I/6bsOjPbBfbBtndOzk3ZN1XcOKZMWMHBfT2aPgQVf?=
 =?us-ascii?Q?5TB+MpX2yPLSdDFsSepokoavAX/e1G5fZzfMeXSbuxDkwnVAMBXITqy6HTJh?=
 =?us-ascii?Q?oahUr5Q0sNcIlY8n7AKalO26NKot2Q4LPWXUCQSXzcXVrZTnIyB6Iou3dB6Z?=
 =?us-ascii?Q?jy5Z1JAkEZ9idgiR4PF/ikCvfBsGb9bQVCrBa4I+nzj0yMU5fEYB34eqwXMf?=
 =?us-ascii?Q?Ueu7NEoEg/8cXlxCxx9rQ/BfftISFsSFtNUG6ud6bjLAHyZfgBR3tzt1TB+P?=
 =?us-ascii?Q?3l49LJ5FcYVU9jgCqsPsUaDXegHdBNmkRBCoQS5tgozjIKpZrz54u25f2VdD?=
 =?us-ascii?Q?EpTB21pOZj6z3nI2TjAAfob65wsZ101Orez+GiYtVjlw39Yr/8kUj/TTpsh5?=
 =?us-ascii?Q?KN6FAqWeUeTHGllrrlIcqMSWThhkQeMU5FxrZUmA6LkAA1uQb4rPLasbRnFv?=
 =?us-ascii?Q?cn0gnpkFxY6xe7JDpwriZO2knps35xoLMymIBySeOG3NMo1/ZvjjFxS2uXhz?=
 =?us-ascii?Q?1PaQ1yy53L1uhm4lCztAIO4XFRBuiYTB41IMk2peLAIiRQV+l3wltrpC9sWa?=
 =?us-ascii?Q?V7n/vaTFMjKSCWZl3ncCQjNZLiA+qSoIFSJP5KkSntwkwUX8ByQSZHTeDJiZ?=
 =?us-ascii?Q?oOfprtW9bEzjLpUe01V6sIYW0L11nd45nRKnL0btVcxAK1j6vYRD601LBuL9?=
 =?us-ascii?Q?QypBNAcfdOL3aFPT+HmANUu24w8Ky6mn3rCIz1H4ALsegGAM/2geeVfr4Kz+?=
 =?us-ascii?Q?g1pNTEYt9y++8zEYzT1ArErrqXkxMzIwzyrTkRCNHfOWYmy4E1I5yOHs+h6X?=
 =?us-ascii?Q?ZJkkTiGe+lHmAuq8UAreHKBfDC+v2W1olqPCqLEctbwjbKi1LS39TcZnzR4U?=
 =?us-ascii?Q?OCrAUos+M7piw2X4NqavgOGC8u0A60DLPUEIRNvbwDdnjTQb8iYTDQkHoZy2?=
 =?us-ascii?Q?lAetY0AngdrTVdzijQQMo3Lf0lh7CsbmRRZgwWhn/jM7r8R5Saa/W10B6+af?=
 =?us-ascii?Q?bZltIZ7U472Ax0VZWiEFWyB4vGKUL6XZvPOiWZkUJsjLo14vnMtSmugWpNvS?=
 =?us-ascii?Q?+wS/HAvbO0v9iXp3kqKb9eIuBMiAEiVmJYspcVOtKri2KemVwZU8lea3YVaF?=
 =?us-ascii?Q?SR7waObP2LcJw5/F6XuTZzA3HWfY7ffEk2lyBlwUvwBBbpLvQr5fjp7VIs0U?=
 =?us-ascii?Q?E2blaKhshYkVRJBLI+XH4Oo8p6FCb+wRQS6C6XIB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5260c7a3-ba67-4e8c-fcd1-08dd613f5350
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 08:24:36.8231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7orbMtYFbsyCuY1AUFSmUjdMMcZNg8RTzui8TiTqRYZgW5CHfxprqdeAsUOQG/AXeq5eNVBEXO8bsMbHkwPjdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8617

On Tue, Mar 04, 2025 at 09:42:21PM +0800, Xu Yang wrote:
> On Mon, Mar 03, 2025 at 12:13:34PM -0500, Frank Li wrote:
> > On Mon, Mar 03, 2025 at 11:33:41AM +0800, Xu Yang wrote:
> > > In previous imx platform, normal USB controller interrupt and wakeup
> > > interrupt are bound to one irq line. However, it changes on latest
> > > i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
> > > This will add wakeup interrupt handling for i.MX95 to support various
> > > wakeup events.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > > Changes in v4:
> > >  - warning if no irq provided for imx95
> > > Changes in v3:
> > >  - include <linux/irq.h> to fix possible build issue
> > > Changes in v2:
> > >  - rename irq to wakeup_irq
> > >  - disable irq by default
> > >  - enable irq when suspend, disable irq when resume
> > > ---
> > >  drivers/usb/chipidea/ci_hdrc_imx.c | 35 ++++++++++++++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > >
> > > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > > index 1a7fc638213e..2baae9e6e673 100644
> > > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > > @@ -6,6 +6,7 @@
> > >   */
> > >
> > >  #include <linux/module.h>
> > > +#include <linux/irq.h>
> > >  #include <linux/of.h>
> > >  #include <linux/of_platform.h>
> > >  #include <linux/platform_device.h>
> > > @@ -98,6 +99,7 @@ struct ci_hdrc_imx_data {
> > >  	struct clk *clk;
> > >  	struct clk *clk_wakeup;
> > >  	struct imx_usbmisc_data *usbmisc_data;
> > > +	int wakeup_irq;
> > >  	bool supports_runtime_pm;
> > >  	bool override_phy_control;
> > >  	bool in_lpm;
> > > @@ -336,6 +338,16 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
> > >  	return ret;
> > >  }
> > >
> > > +static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
> > > +{
> > > +	struct ci_hdrc_imx_data *imx_data = data;
> > > +
> > > +	disable_irq_nosync(irq);
> > > +	pm_runtime_resume(&imx_data->ci_pdev->dev);
> > > +
> > > +	return IRQ_HANDLED;
> > > +}
> > > +
> > >  static int ci_hdrc_imx_probe(struct platform_device *pdev)
> > >  {
> > >  	struct ci_hdrc_imx_data *data;
> > > @@ -476,6 +488,18 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> > >  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
> > >  		data->supports_runtime_pm = true;
> > >
> > > +	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
> > > +	if (data->wakeup_irq > 0) {
> > > +		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
> > > +						NULL, ci_wakeup_irq_handler,
> > > +						IRQF_ONESHOT | IRQF_NO_AUTOEN,
> > > +						pdata.name, data);
> > > +		if (ret)
> > > +			goto err_clk;
> > > +	} else if (device_is_compatible(dev, "fsl,imx95-usb")) {
> > > +		dev_warn(dev, "wakeup irq is missing\n");
> > > +	}
> > > +
> > 
> > Suggest add imx95_usb_data, and new flags, like have_wakeup_irq.
> > 
> > 	if (imx_platform_flag->have_wakeup_irq) {
> > 		...
> > 		ret = devm_request_threaded_irq();
> > 		if (ret) {
> > 			dev_warning(...);
> > 			goto err_clk;
> > 		}
> > 	}
> 
> Thanks for your suggestion. I might have different understanding about
> it. I prefer to not add flag here. Given the following points:
> (1) the wakeup irq is optional, the USB controller can still functional
> well if properly set. (2) I may need add imx_usb_data for each new Soc,
> however, it seems like unnecessary. 
> 
> > 
> > >  	ret = imx_usbmisc_init(data->usbmisc_data);
> > >  	if (ret) {
> > >  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
> > > @@ -584,6 +608,7 @@ static int imx_controller_suspend(struct device *dev,
> > >  	}
> > >
> > >  	imx_disable_unprepare_clks(dev);
> > > +	enable_irq(data->wakeup_irq);
> > 
> > Suggest check data->wakeup_irq and other places.
> > 
> > 	if (data->wakeup_irq > 0)
> > 		enable_irq(data->wakeup_irq);
> > 
> > And you should check enable_irq()'s return value also.
> 
> I just find dedicated wakeirq mechanism (drivers/base/power/wakeirq.c)
> basically fit my needs. I'm going to switch to use wakeirq. Then I'll
> needn't to do such thing manually.

The dedicated wakeirq mechanism doesn't suit my needs well. It can't
pm_runtime_resume another device, and /proc/interrupts show the wakeup irq
triggered many times after system resume, because it's a level type and
the irq doesn't get disabled at the first time. So I will keep current
style.

Thanks,
Xu Yang

