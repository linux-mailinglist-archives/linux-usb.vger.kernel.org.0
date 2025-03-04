Return-Path: <linux-usb+bounces-21345-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA1FA4E375
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 16:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF9AE7A445C
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 15:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242112641D5;
	Tue,  4 Mar 2025 15:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GNigUWZN"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5892B25F78A;
	Tue,  4 Mar 2025 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101663; cv=fail; b=kWgxZZXqpv0R446sO2STILBY+hpPbdjwU7yNpqFp8iTpigjxHkCHUZhZfOOGKKPZAc/Ir3oHF4ssSAdTIkQyoAydRhBsJOeRelRBeREzyiZPR8qOYYlxsV6ncmDy2IE/mkBRJCQ5T0DFncyrAtzSQuSMXly4BC4e9L/0oBFi8X0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101663; c=relaxed/simple;
	bh=nnbz/CrZzf75gDY3eDVFg08VUgF4XLpOIBFsG+PRV6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j/r68oCVAnzaMXruUVg8vBrXGMMIH1bVVc9AYmZN7wIcmAv9yTVTwHUqBhFG2R6OM36nZ9+udk7FLGcgwFMa5Nxi7DLFWnuQ8eV4XjibWeVvqtdJFMNhqIRUfP+2YZUp+nNiJ2qgqrYDpJEkRggRzTNhKnNp6CC7DThbXJt/QRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GNigUWZN; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKCzBk1nfVF4bq8NyE6hyh/poekirnk3KUY2pBkbRJZnMIRahn/OMp1eqPUeduFiDk+wcN6srwH7fWtojvg/NJN0kq/ASAiuJq08kZk/qW4XnwlT6mJHKPCiepDxeFa1U7s90H+9gfM6tZZneW0wDQLNjvpa+MyLy5H298h8GrzrEM5Qw7vFF+6H2umFI4/9HSrQoaUT0FpyHGSF3yNC1FcxsgsA+3eoSzJ4el20C6OSEytaEhG23ti8I3meSmIinvo+wKtLtXI+U26n7h9EpMRWagkdMx/6BRGF7pwVcJk8upBA7BtbMBgp7QHBwtQYz4N7xJBGVXbfMcX9ZMDlQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z64VTuQV5vIkTN4edYZ84kxtOPXiPy6TeQsCib2LeMI=;
 b=Kun1JXnvDSOOwOyG8DG/IMUGldegduLe3tfKwlTieXA94j6g4WvxddoLd8pTOxHy+GBLb/36Xna5bj2OW7gFywSJjD4Cp66Cy3uD+tBLsOJRTbfEnyjvABpf+6SWNmKuqKf6WJIs2eWcVDPoMmRqa9NWX2SupvgGYA2ZYJpr/ml7DVWe2ZR6BY5fh9ZMfOtswg3Kr3HDjTuM0QcqiZrz0Vxl9yQPS2XmpTZmhLn4OUxpIUyxlsvoCCA5Vf4AhvLHfMfNz782SKzrydSULYaU5zlq0B09zgke+I8bYpYzpb9KX3qwunff3hM12xksEebf/M31vCMxMC37D5I+/qwQdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z64VTuQV5vIkTN4edYZ84kxtOPXiPy6TeQsCib2LeMI=;
 b=GNigUWZN4ynxRTF4CZy7TO/RwMcAeZJSuqtLgGF7r9WbFXzynCgnvLArLxYYjNHRD8spfUEsoll8hfSpKGivcG0PoxWrW1e8va76yTaxp1AXzTJWnJHZbxEe163/vcWgv3HjvDDF7XK03B1YuQTDrMG5/xMdq7tbwl96BfCsSLmcB5JOo7trk3YlDNJWJa8cOZsWZg3snLcZZuJQHWtfouCIC/ILTygEGDTAr+0M8Gw3V7gTCv3aFKGZ9kraq7rN9BKU3jhGZ0dcy+Nmu3hNgcJL0YmOhiwOWhQMMbSRm04Bsx5kfqbmMViL0oBZ1aFbOAYTS+bMApCR1Gs2W4s50A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8764.eurprd04.prod.outlook.com (2603:10a6:20b:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 15:20:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8489.019; Tue, 4 Mar 2025
 15:20:57 +0000
Date: Tue, 4 Mar 2025 10:20:48 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4 3/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <Z8caUE8k33HoOHOv@lizhi-Precision-Tower-5810>
References: <20250303033344.1251076-1-xu.yang_2@nxp.com>
 <20250303033344.1251076-4-xu.yang_2@nxp.com>
 <Z8XjPhl4jYdggDKr@lizhi-Precision-Tower-5810>
 <20250304134221.s7wlfauibd2gc5zo@hippo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304134221.s7wlfauibd2gc5zo@hippo>
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a50c02-d3e6-4e57-62d0-08dd5b30298a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RvK/LQ+WYC8n8Pc4sACDa0oanE7npaStZuW1FVSeRB9TZevTtuLwGMPPGth+?=
 =?us-ascii?Q?LOocrD50ZDdsvOt4m4Oa6Iayzq/ETE2VPtWnAks834+PN8MjkgA3iuE8C6f7?=
 =?us-ascii?Q?bt9g240JT0Rx5TAcUPGevVX9pEmbwCfjIRfUd+PwHe96zRu+PvUdX15Y7c6S?=
 =?us-ascii?Q?9xaGjksRQx+xaZzGZhMMi/s3EPZ0iHo7SQ11DpouXsgaH2g0MpIzsEp4i0Dc?=
 =?us-ascii?Q?8tgpBFYmnrbUvu1w4UCRC1DtSh9Y9dCtIdMEZAbj/TXZAHuNyGQoz9ldtvkG?=
 =?us-ascii?Q?W2K65VEhtJLItfPK5lolkR54rnX0Ct+7nT74yMrgonDIeDlYEnntSV6r/7Bw?=
 =?us-ascii?Q?h3Cx5qel1nNF0pOJIloM1JCdESBBBFmxG7uDy805IxxIdOB9zmS83VbABwAy?=
 =?us-ascii?Q?T92TP5L4U1FcFgqrjoRmAiPDCWE1zzJal6NFGv9MQxfqJJj9YRAAdnf8DbiC?=
 =?us-ascii?Q?J9JWUbEmETtEdBUd1PTMWGVVdVBxdcZWChEoFzcFFamF+gnV/yFx7VzZICxc?=
 =?us-ascii?Q?2VNhucsBemtF2TsH2f8dWyCT4AxofTOecApWvWF2hvRFc7Hm4A04ftc4eT8B?=
 =?us-ascii?Q?bh9+kxk0Yf6yQuKxb8S3vl/6t4F6mvYlRJBkH9f/a2fRO7YtCWLi+uFyhg8H?=
 =?us-ascii?Q?vsEQsgdKHu3EqPcTGDu1TmQZEN4j24CV6PJG3fBUUIFwAx4v/wlH9GQpe0o/?=
 =?us-ascii?Q?POKZBXAFg5vQU1DANZnHj7gA7RiFh3bx6DObevgXv/jv/KoOCk9nkakClUMO?=
 =?us-ascii?Q?Myc8TIOincAlacE0/EfC0Pk5CS0Ef/UW2gdX8ZgvK2q82atCL1zDbxdPPc0r?=
 =?us-ascii?Q?2bTAKVsUVRTRHMIelaXLINJn6dXCD3rbXL146k8cCpjcKXaw1Hq9wwnuwX7U?=
 =?us-ascii?Q?QT3ao63vBpRezRMvVAX+Oy3UUWa8WSR+h8mqGmM1Tt8ioErB0XfYNYWegHm1?=
 =?us-ascii?Q?D7pUT6VE8HLnY7J+ODiWVmz7Vp28ZS3hOW5VEiapXbjv9EEvFOLEG93YUH+R?=
 =?us-ascii?Q?3RONVlBPC5ZGiKu+yA9b2u6kCS/5t4an+W5vPFYdsdhJ52kOWM4ZbUWqPZ6G?=
 =?us-ascii?Q?Cru5aRyhV2PUVksUBdIPQkJf7zoH50icEycTCx84oFPHv9G88QwZe8or747Y?=
 =?us-ascii?Q?BRznivcmwpxa+nlzMKsWC+fa8h7Un/TX1+ZKK1T8gUyqBVpVwB/y04mhZ1fu?=
 =?us-ascii?Q?1LihsnBfVzP9lMwJtjEx6PYzmB5xYVZGkQrt23OeYtSyO5UzpAyJva0Ykp7S?=
 =?us-ascii?Q?pp3HZjY4AQUM1993QXrH8Ex/ZZyzXCDGO6egYZ0MDou6M3fOovFfIFdE4Jzp?=
 =?us-ascii?Q?6Pp0ZxVPRFO0GaCTF54fPYYnJM0WtEx7uh9SjqorN+i6EkUJ4lCoHjvXZnnm?=
 =?us-ascii?Q?Qf6cqTsANeGl3y6cjKTT0KDhxm7Q5fuPjSJDTJLXRgrcH2ZZaNKrdJVi34u3?=
 =?us-ascii?Q?BW0cCdEapFa4vI03pfmB24wUgYhsyUel?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zgqTh/c9kfgGtkMuTbt7noDgAxqsxR/wh5IJOatOzl9buL6ebTanHktXMQaT?=
 =?us-ascii?Q?eYpIl9JQ/lR64st5rRl/B+L6XZG25vwputVhDf8znA/2AbCwcbW2gm71X6cz?=
 =?us-ascii?Q?7dDwHf9tShK5iVbWH/X/PRC3y0CU1me+BCL3qu7J/F3/Pwx6gMniH+1+x1y9?=
 =?us-ascii?Q?gVpqbW7R+WaZW1z1IvKjP22bZjpIFYfSslf5Uknt5zZDJGqy36wsBVpdI+2e?=
 =?us-ascii?Q?HYCianexQP9NQ63OYt0N/A6TqMoOomEmSKnRWArnOgdzr4M1WxnnGPXj19DZ?=
 =?us-ascii?Q?8uOWVB2O/FL/Tshl4H/wu/cqdrUoUyMoqCyddRYVF8FOFt3g0cdvo8YBs1Vx?=
 =?us-ascii?Q?N3j0jqfW6N42jZKcnScm+T/9ocNcMHSRp0qT2D/3A7C64rL8eCUrZrZ2Hs/e?=
 =?us-ascii?Q?DVjhJmmnv5pfaQymVsf4UmfwgjRk6uMjN/poAIYkwou7ZPIyUvMD0HDJuQCS?=
 =?us-ascii?Q?ycdAgbZvFYGJRS36u+w9zszFpwvf6biwFJPZBVEAZkTdRRy5WndcpgppFGi3?=
 =?us-ascii?Q?zmd5wo+HAAKP6KuimnG1eTrgP65Dz0TwaEc7fLxxHJZVt9XQ+djK3+nt+QgO?=
 =?us-ascii?Q?wN1acNAFlkh74mMR2FEO4ZlMqkYH8d7dxFuWqlNUEfBqSAzyJyCUvTmj1LQm?=
 =?us-ascii?Q?4w48OCpFiHgcapzuLrhSsma67V0Cfzkfvd3O43yBX/NOFZM8AlWV085JCP3R?=
 =?us-ascii?Q?2fPgbkLx7BMa+Mi1VRsRv2TbrWgxBomy/F2OaiRv6WhGiRE0L7C87SH83fn4?=
 =?us-ascii?Q?VJBe9KOpxbgS/Eifr19OrSI7l5mG1Bbojv57BDHrCHBt/NfKSk3iHHaJmtLF?=
 =?us-ascii?Q?PG0mHnONpVueTfn3H37Y5hcx0z7fqQHuFkHD2VwTBoeD1jLF3Qvj/MHrOU21?=
 =?us-ascii?Q?20wDpUyESYeLSVIIZfAYR8hL03lZ4/d6cgabm8e/Q0NMJcxnffKm0jltyZJO?=
 =?us-ascii?Q?qwuzcNPP89wL6eQ/B4VjmKJlWelnUxBXhHP5GoUwL0X59GR9KfbigrllT+79?=
 =?us-ascii?Q?MfLeYUq04AX8oAMdeNqVpsey6MqcqGsNGP9m2Z7ZNrDeED77A7CPMVUT0Hxr?=
 =?us-ascii?Q?YcNEujDOwmWlIvQrk89oxwJO6gFY5NHsUB4DEltAoogB1vYIAwxdfKAg+2P/?=
 =?us-ascii?Q?S8MTBBF/3S9RmQiKoKRAnm6m3Jw5OcQdiiU9OIPPKxsBsI006hrugh3d0tVx?=
 =?us-ascii?Q?MhRK9O/SPIK/kh2F5MBBMrDUmb935la4veM0CjaNfyhUR72QZz/v/fO8a8+h?=
 =?us-ascii?Q?3SShFpMOT2o1SNWgmmWezVHjC4iuiMzZr56r301NMueBjukDVmiYXUqBj0vV?=
 =?us-ascii?Q?C7HrHy88FbTwEgFHF9uW7LOw4DNJqu3w5WtY1e82oeKIkmHwHxFEp0Tt6eh7?=
 =?us-ascii?Q?i1waoXw9XIqzqRME1/Nacpbixz1zeA52aiBCwNAHBnICrKcLmYREgQyq7+Sd?=
 =?us-ascii?Q?LwyQ29dFl7gk3rygVaEfGNOeul3I2886+WI6EwA1G8J0g3R4vHNR8lyBm1M/?=
 =?us-ascii?Q?EJ3LJT7mfW9aqv5PRtKSmKlJeCib3mX8SunrgA9rK+kyRR8vh1AabQiZUCtU?=
 =?us-ascii?Q?3+vRes3CrLQRGL0mVjwBYkwpV9lwNH2vOU9x+p6d?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a50c02-d3e6-4e57-62d0-08dd5b30298a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 15:20:57.2617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NojQJJC68VSQclMwC3gVnvJDAZULlR5f1Q3DKzhjlxpwlN51EhQ/Ts9vJ8MhUy7i14AnYnR20OgFwLmXiGTkcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8764

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

You need add more code about device_is_compatible(dev, "fsl,imx95-usb")

device_is_compatible(dev, "fsl,imx95-usb") |
device_is_compatible(dev, "abc") |
...

the below code will be simple

	if (imx_platform_flag->have_wakeup_irq) {
		data->wakeup_irq = platform_get_irq_optional(pdev, 1);
		if (data->wakeup_irq > 0)
			...
		else
			dev_warn_once(dev, "wakeup irq is missing\n");

	}

Frank

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
>
> Thanks,
> Xu Yang
>
> >
> > Frank
> >
> > >  	if (data->plat_data->flags & CI_HDRC_PMQOS)
> > >  		cpu_latency_qos_remove_request(&data->pm_qos_req);
> > >
> > > @@ -608,6 +633,9 @@ static int imx_controller_resume(struct device *dev,
> > >  	if (data->plat_data->flags & CI_HDRC_PMQOS)
> > >  		cpu_latency_qos_add_request(&data->pm_qos_req, 0);
> > >
> > > +	if (!irqd_irq_disabled(irq_get_irq_data(data->wakeup_irq)))
> > > +		disable_irq_nosync(data->wakeup_irq);
> > > +
> > >  	ret = imx_prepare_enable_clks(dev);
> > >  	if (ret)
> > >  		return ret;
> > > @@ -643,6 +671,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
> > >  		return ret;
> > >
> > >  	pinctrl_pm_select_sleep_state(dev);
> > > +
> > > +	if (device_may_wakeup(dev))
> > > +		enable_irq_wake(data->wakeup_irq);
> > > +
> > >  	return ret;
> > >  }
> > >
> > > @@ -651,6 +683,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
> > >  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
> > >  	int ret;
> > >
> > > +	if (device_may_wakeup(dev))
> > > +		disable_irq_wake(data->wakeup_irq);
> > > +
> > >  	pinctrl_pm_select_default_state(dev);
> > >  	ret = imx_controller_resume(dev, PMSG_RESUME);
> > >  	if (!ret && data->supports_runtime_pm) {
> > > --
> > > 2.34.1
> > >

