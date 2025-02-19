Return-Path: <linux-usb+bounces-20834-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E924A3C6DB
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 18:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B272189C47B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 17:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C77A2147F3;
	Wed, 19 Feb 2025 17:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d/XwY1Lq"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013003.outbound.protection.outlook.com [40.107.162.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C931DE8A8;
	Wed, 19 Feb 2025 17:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739987905; cv=fail; b=KCpDFSIqWSL/5sWuOgDI+evQw1wTG9QtJkawfkJsWhW3GtZ1o6DMC1uQsoVpMsSzRXX5JpXB7367/7423iuXDDEjD9oqegqpUeQDdmbF2kvVwWUzuqWVUNoms53CRMOX6l6aSLhahqBkNuqhnq8IGEkl6HHutsxZgrHO3BKtpU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739987905; c=relaxed/simple;
	bh=TsMO0A5zlH0f4t5LWy4QNXFsVQUqvXcJjwHONURPiNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vERqyuCk3pEW55f8IDw9ask2K1u/SrH65HGvi2Yp5mTlMKZsxNwMOgXGQfYs2Jx5x17Ha9zqGNBXspkOymJkXJe23U/aJ4tHNdpJi9iZR82jWxG1FUdg/OCnxMp+paCXsLIsa02GHUY25vZFNoq2X0wW+ct+JmFXuP0jdKN1xgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d/XwY1Lq; arc=fail smtp.client-ip=40.107.162.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgLtw0adqYLuXrE6p2ijy9cHc5BgQAKZKPl2g3h0RW4sE7HWR9DiQ776Av/joiCbeifmW05JNc35njG1NBQ1gr1Wdz4t+ZOoDTeTXYhCbWrAyYgTBS5KdEHmlvoSJgCLuUXcMEjQdle7gvP4AD43vDlWifa99oElrOKKboyEtszVYgz/WTYpIrUINb4ZXZNkQY4hoXLSJNuibuBdWq1Hm0ZHtD/zsqToY6WcETmedRhOAYroP/v0XxnpR7FX5AqWpXMiqP0r/dt0Ovto50jGfjU6ibofo9c+aHWLy+6GxFKLOfEH6HHFJG2qSH7YWQnoFp/IXLD4k4aJsObrIRWnnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05i6/JSzecBiRWUOPs1lk+p7FzMy7Jvk4kBoWF/QiNw=;
 b=xb8YnyKY1nwKfG5BezBrC8RGpIfuO14VwqBcJMB213CMg4OMqOmCiZbViIUrlQjQxB+c4WkNNxAEimDPwlmhWVUL9CgQNlXa4ZOzzVDDaeeiHhe7ZaxWdiOX3kSpzOXmww6OFK8CT0cxg9LMwM1lpyl78JPWVNidXX4FP1MKfSEKQ+BvnsxuTHCjsJbzJ44e3d3TPNKFp3Ffwfsam/ro4f/8JkFD8gOP6qIG49jmc6XBjzHM4LE+f5pa56XX7GImPwjT7szHyHUkMSIYvh+8lowdWkbILeB3KC5lfXs88SjjV/wQeQNA0Pa//D0ATPxeH9uDZ0iClpBNin/a773VCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05i6/JSzecBiRWUOPs1lk+p7FzMy7Jvk4kBoWF/QiNw=;
 b=d/XwY1Lq7wEO7rbAQpWu2nn5Esj3aFIfSpzvRe9utHXWUfIUy185IjdDAxymfyeN6HNyKv4GtdMuvGyBd2VzGQtoDol6VCXnj3qYDjxxn5YIeB0Ja2+xgqiCDYF8LvjZxlsGF5Nx2aq0PZbACOgKoLE+i8NtdnleqPieNdMMGdVd1Tx3BxHnH9pC1XwH4ElPOqM/fvXVyEHVrJl0I7HAWGBGdn45cJjaatPFyV5Bn5sbBy4dIbZDwoCi8bqVl49En5UHPIuEinCpk+HWEXQqnzbY4ATTqm0l+rnMeDJNnppk4KaKmBtSrmIiO0KssxE7QqUOiH3uHKTrwY9gs94CBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8484.eurprd04.prod.outlook.com (2603:10a6:20b:34c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 19 Feb
 2025 17:58:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 17:58:19 +0000
Date: Wed, 19 Feb 2025 12:58:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 1/6] dt-bindings: usb: chipidea: add compatible for
 i.MX95 platform
Message-ID: <Z7YbsvFMb7ZP6xFu@lizhi-Precision-Tower-5810>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
 <20250219093104.2589449-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219093104.2589449-2-xu.yang_2@nxp.com>
X-ClientProxiedBy: BYAPR11CA0099.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::40) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: d340435d-b622-416e-cf13-08dd510efe78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SAbiiWkVSj47whWV/VZTYMGB5uc5ajL5oDdlrkItW1WmhjYink+jB576Q8xE?=
 =?us-ascii?Q?FB7ZfbN4vrG1s7lUCjq3KJbnsSD6JbJ0XkpQRELXNTnsz7dQafF1jQd7cFVc?=
 =?us-ascii?Q?S8tRwrBqFZtZ5uYwCJeArYXYZrp4YPaIMmgi48WCmHh4ck+5aSe7WmvAH+i+?=
 =?us-ascii?Q?AkL7fED20Izmqsqt0Gzrl/MsUUeYKFN8OjnwLGBYfFKS3H8KJ0b+Zx/gxJ2F?=
 =?us-ascii?Q?tRaKNT4zxNJRlGHsf2R+BsWBenLT4hDtR+imKR7qxVt8moEG/x2tCDqtybvk?=
 =?us-ascii?Q?XWvuAaQuBS8SDQTQr6KaSKvKF8tbtPPMxbXp7JGKuZ+W89Qd6G6k+CgAJsk9?=
 =?us-ascii?Q?Gp3xT2ivGMSFDR0KlNlI+Bpaadw2hFgWJbhehSY9mLFXFnhtDriQCsbg9Gw5?=
 =?us-ascii?Q?1hjMhtpaOz79miQqrdgDU6PviwGT8x5Cff/b1HGv8SXpH7cJKvezTXwtJlBl?=
 =?us-ascii?Q?opmrChmaLjvNcHsiJjXL6vvh9r2qWleC+5fg0CYE5SWxyAhQxZNbLTzBmxzN?=
 =?us-ascii?Q?bH+XMzO+LTa3yk0l5ASSxOP4kWiVIhEJXWHxgSBUJ8XaN/MfHq/wzkuq4df0?=
 =?us-ascii?Q?gVtVlNSixuFHIuka25AITJApi7oBJmbuR+LS//iG00kr0EFutrU1O0C4vnyQ?=
 =?us-ascii?Q?pJ9xBlv/u1zBY5KGjcO/2ewffN5kBvgrzzcZcrNDvx455VE168NxloxgGLjv?=
 =?us-ascii?Q?WVYyBEuNN0p2dgs70kdaZKCsp5MQ2UBDyl7YqmrBu8VodeWZcFliFpEcuSyF?=
 =?us-ascii?Q?ivLGrf1EAZbvR++9X3KbnneldhRBcUnKkFRxTZ1h6x6rTvGkJBScQL18WDve?=
 =?us-ascii?Q?EfOu4YcmFrqUGLvp8LE1a4/RNv9FerLX+ek4AmVRyiOpMxRZjQEFGsYrLM4p?=
 =?us-ascii?Q?ON65jB/zP7qW/n158TEcmXVzj7u/Xo0eDU2YoPHTPx8Mj/McXyJVxvd7XTxp?=
 =?us-ascii?Q?kbhsv83hMKhU/Z0vd2ymJBxiaEChOver2+NBqQ45nBZZMeKjxD9s7myMt0XI?=
 =?us-ascii?Q?5pf9eippOr3blKpTGmbuWB6vGOuDTzPvSmCrqrCuH3VBjSwWqxMFFplZ1su7?=
 =?us-ascii?Q?aIAL6/BRD/G0tpK1UEqBtLUypCabDD9smztCWRoF/Cl4S0DOX1vlqtBnqFdZ?=
 =?us-ascii?Q?mH/UWCLS45ddnQBNPETp/HgzTmo3eDamYYLmAbEeT5poZJImlRc0WMAQBcWP?=
 =?us-ascii?Q?b4eqY4kv3umENARwtuS7Ax2sOvjY9LlOF9G8L67ewsLQBS7Hn1G0lq8pgcxF?=
 =?us-ascii?Q?2gEFDDpgJFFZ/ujKp6Z+3o5CPUuheY17TcVbadltOsKy+5YOn6eUgDtgCnez?=
 =?us-ascii?Q?3/uWqQxgWPWvXl94GxR/JPFVeNLFL5rXcrC1WLIncf4wMB7fEIE8ACjiK18x?=
 =?us-ascii?Q?0oYudfvlw+ksAQayRs9fDL681GjvkSHWDgLcPcL3ew4ZqB7Rg/byUahxpQbk?=
 =?us-ascii?Q?rdUi0ZOSWOprv4RGSkpiVAs9xfidVrXO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?afqyKWC3X+6KSdk3p6nFy8y+dnAAxIc753LLa+jLwbl+Xb2C4D/Th2mV5P88?=
 =?us-ascii?Q?OASOB4yTg8u5v9iD+UHu8jAKssTrnwxtGfaV/n71cv4xkVBozzBZ3aB2v1+2?=
 =?us-ascii?Q?uXgnz+4rTCTWeawJEbv99jUx1xDzmshvtZkMOocnBnU4QfBCbF2XsNlanzsw?=
 =?us-ascii?Q?6JZW+2mf6J56KBqEgqaaR7EuPbzNa3MU3BVYSK8mKRB0cTHzCm1znmG38pQ4?=
 =?us-ascii?Q?PucFMYHv1/Z/IuOR80gYJYGbpp7thzi3h+tVRh4nSsiMMIO3nkcmEkxlcxEu?=
 =?us-ascii?Q?98AJBXTusJA7SHQ3KYl84Vjl2vhDEPgqpIxb0n6+HXaRM/kECZ8dnFVBm8zm?=
 =?us-ascii?Q?/5qEW5E8IS5YluRszAR0N+aJAW7x+lKOKEPjLNUEKzj9j9uTQ8ASXpWiGM1H?=
 =?us-ascii?Q?sJT3Kvp3OdNt88oou9ke3l5/7h6oJI5Dy16QSNzhjDgrxeQhTb4q6Q/rJv9u?=
 =?us-ascii?Q?qFvxPlXJu8f7yGZuLGjdlVQGcGNCfT7esAIyXoTiUJkI2dJc7cOX7g2KOiOk?=
 =?us-ascii?Q?64pJ+omucrx63jy7QgLvJ1WyL3CX/5O8IBqKLEyhkh725O89OQcDbMPw1xr0?=
 =?us-ascii?Q?YNiH06iBTo2Hz1uE7H1aP2UWZFVcD6IgOsdhkAbzs4XwziTtGdNUCQxCp7IR?=
 =?us-ascii?Q?Tm04YpQzGsvOdE3pnJFgijYmqUmv+kzLJk/JiLDQvTnAKXHxduuNyj33Er5t?=
 =?us-ascii?Q?uLIhOSgbiSMDeYSbhUxEwz+DvuCDGNG3TiACLLSXDBUWNLV4X8lXkOCDLiRy?=
 =?us-ascii?Q?qwwOI3BnpPFZugonhBM4pgCmJ0VjPIZ3vOLTaR80cnzMxP/YhzEogZVkknne?=
 =?us-ascii?Q?vy3tvv3aZEu0WyJQgTGrNipa2LmAqnjG36Fc/h9rd1hi/lFYruQNv5xtMYwf?=
 =?us-ascii?Q?grk+aPgKALvEdbOqXxT7D/3yLPVsQTcH1WOsyGRGz/D0Y/SY2qGGVhYSCnXb?=
 =?us-ascii?Q?XE5Xit0lb9PILa1JveLDFV6W10NB/s043RD2Lh8p2yi+A9OpxmXvucEK4n/S?=
 =?us-ascii?Q?ibXuorQFB+HqUMvb8k8oVAEgcsnVoqeSgda+LT7CCyUYFaWNKXow8vVgyK77?=
 =?us-ascii?Q?Zw5VpHutzSGSNPachXiRK5USlT66BitjZueX7mxffgwJKxXCrZmQ9+AHFdNg?=
 =?us-ascii?Q?m3W+cT4EugVSiPfaM9TOsd8MrX9ryFIXqe4+q+icHpPYKmVAQ50m4XgaHn/F?=
 =?us-ascii?Q?HZ+W7GXkJkLTXY/CNv3YQQ416g5ieLrNB+JatX6/o3GG9eAKV0XABkl9ZZKA?=
 =?us-ascii?Q?eBRn462vjlVUdPhXUaMJ8qljTYugL6ad59wLdFPQqXyHanhmct8JczyOHmME?=
 =?us-ascii?Q?MLZOUfZIFwSsrDlLDP7QswOCA4JNaGiRBZ5KPMy5LsS0R6PDOOmqFrO2L9ZZ?=
 =?us-ascii?Q?kMWI7KdW3emauQ7v1hubdt3+OYIz3H9HjtdKm05lXt312Xk8NyO0Car9u4Hl?=
 =?us-ascii?Q?Ad4xpbjmH3iiDNIPeCJfAlw5PjjdUxzdSubKDa0Q9Wc28CnSS6vV9lgHAb/K?=
 =?us-ascii?Q?slTSkEp784tZP3Plg+pLUKgVSI68q5im/f7SP5uMBmD0GgezXAwOj7GpKnNn?=
 =?us-ascii?Q?hKPRo6YX53VGHbHSaMRAtc5ElHnlKM/RDEVmQWqG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d340435d-b622-416e-cf13-08dd510efe78
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 17:58:19.8660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +AkYgufUMs7zR57mkHM/EFoxIebE7fK41F+Tup+/XXUQp3hK59LpyyWDNdKluwtFsXj0VD0XnwK8GE5WJJ1IoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8484

On Wed, Feb 19, 2025 at 05:30:59PM +0800, Xu Yang wrote:
> The i.MX95 USB2.0 controller is basically compatible with i.MX7d, except
> it needs a second interrupt for wakeup handling. This will add compatible
> for i.MX95 platform and restriciton on interrupt property. Besides, this
                          ^ typo,

run check-patch --code-spell

> will also add iommus property.

dt-bindings: usb: Add i.MX95 compatible string 'fsl,imx95-usb'

The i.MX95 USB2.0 controller is mostly compatible with i.MX7D, except it
requires a second interrupt for wakeup handling. Add the compatible string
for the i.MX95 platform, add the iommus property, and enforce the
interrupt property restriction. Keep the same restriction for existing
compatible strings.

Fix below nit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank


>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  .../bindings/usb/chipidea,usb2-common.yaml    |  3 +++
>  .../bindings/usb/chipidea,usb2-imx.yaml       | 26 ++++++++++++++++++-
>  2 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
> index d2a7d2ecf48a..10020af15afc 100644
> --- a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
> @@ -42,6 +42,9 @@ properties:
>
>    phy_type: true
>
> +  iommus:
> +    maxItems: 1
> +
>    itc-setting:
>      description:
>        interrupt threshold control register control, the setting should be
> diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
> index 8f6136f5d72e..3678804a3743 100644
> --- a/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
> +++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
> @@ -41,6 +41,7 @@ properties:
>                - fsl,imx8mm-usb
>                - fsl,imx8mn-usb
>                - fsl,imx93-usb
> +              - fsl,imx95-usb
>            - const: fsl,imx7d-usb
>            - const: fsl,imx27-usb
>        - items:
> @@ -54,7 +55,13 @@ properties:
>      maxItems: 1
>
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: USB controller interrupt
> +      - description: Wakeup interrupt
> +    description:
> +      One interrupt for USB controller and wakeup interrupt combined
> +      case or two interrupts for individual USB controller and wakeup

Needn't descrition here. Items: descrption already provide enough
informaiton.  Or you can change first

description: USB controller interrupt Or combine USB controller and wakeup
interrupts.


>
>    clocks:
>      minItems: 1
> @@ -191,6 +198,7 @@ allOf:
>            contains:
>              enum:
>                - fsl,imx93-usb
> +              - fsl,imx95-usb
>      then:
>        properties:
>          clocks:
> @@ -238,6 +246,22 @@ allOf:
>            maxItems: 1
>          clock-names: false
>
> +  # imx95 soc use two interrupts
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx95-usb
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.34.1
>

