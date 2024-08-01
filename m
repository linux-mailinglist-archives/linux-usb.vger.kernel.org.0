Return-Path: <linux-usb+bounces-12854-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 219EF944DCD
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 16:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 941171F255D3
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 14:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A2D16EB7A;
	Thu,  1 Aug 2024 14:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BotdY0ck"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2845D1A4B39;
	Thu,  1 Aug 2024 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722521865; cv=fail; b=QJiE3dpp9zmrWBLc6Orav69CCgTVKTISEj0ekHDs5PyNfUS5UfoGOjrn3Ow3req1dJWEVagCYEJdfKQMfp81VbbKmR2YT/vz57HwRBRHcZ6N4A3I/YE48ukmzpX9bkaeJrrlMd3eHdl5gct/+qCnzWgFEjM1fR2P0ipve2oTjnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722521865; c=relaxed/simple;
	bh=G0riEwA/1K8d2D2X8gcdUSy82bjJ3pPZFjCQGs4sBpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JEKm2QeG6jv0M9BAJErHMHzw3OcThzo44eblZcNICCJ2GGbW+XzoiPDsDYqI0J8KI0SNUV6N1xyZfP230uAnKs5qGN5JT4uJ6Q4iGtxptBDrgP4zNuNTtBeNFLdtHZG78ldXYgIMKF12J8l6AG6Ue6Zr5TbCF8kp3tTAipHntQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BotdY0ck; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBg+yaA0YZdtBSK2tXD42APLmkH451ZX/VN53bNf1wMjDb2JVTXfA/mbmKW7sQRRQdOqTdh0pycEOny2rCb6W8lSxnxV8IaZj/LQgqJvk2FSSq+pUgimXfC4vTERj2pdiOTuJ23BAQ5OIt+B2Ce/5zWe9i93GbobBPg8Cz51zASCtefTurGcjnwvUR+o8U/dkVQ8mpMZmZqqYciX9W9THbn6i6Qb1IVzfz059lnzLXk9DZohTNDg08VtVJwDESlf3fVB3Phw46fyhDDBG6cIxCTu81IxMln9uKc1t2CFzWFBgbJPrUTmO8cVlSDhVnUhI/CafAzSmwcTr1IoIl39Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JE5V7YIfmJNfWGybE/X37C/ZIkMrTGrwQ7oXdOFalxU=;
 b=r0HNtOWLaaXhlTm/6Peo2KTUj9SHdBXI1P2UOwlqHsW1CmIq7Z/65hbc7h3AWXbpax69ukULMfhmha5vCzyaphs/REvh5NgD6C5CQ903SSO9WW6yEm56EbrxVviLvA+twMhExn8ulhackLHpHd95El9XjFalnVtJ9ELL20Gw/k2+k3CZf4jcENlv5+hGTkCXqZcXftwtiCeA7XDrbbAtnOGXUCwvQPdIqn4aMhnezpzKgSPdlHp14I5hbXJxfuzki5gNksifl8lvuu3WqU6z9bdIl3HghsejBBedR6Vf7DbbslQy9R+nY48IOZ1Dd0xYUllMBptVEDpUtnadicHzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JE5V7YIfmJNfWGybE/X37C/ZIkMrTGrwQ7oXdOFalxU=;
 b=BotdY0ckK4Au1xhMu3orRevMgW/M/v859zfppMT3Lha33boO4bC0uKPle1luJsuzoM9QXmoCJYHopAN7vvu6d29mvJIzce+A2xcwYMxO+4sJP9E3IYgUOTf/CtWU6rawti6vmWG8RJB8Bi/5Trh4Bd4wIfqMGp/rsrxfJZDR+c4hugL2wem6qbaA3PS4qqcUtw6k3ajPXVOHyeaMrLpBGz3bHsc1c2rI7Ugkg/zpmXATSjYwn5mNN3vH3wzj8RtOh2hhiyUTUtaWrwOxNixFqZlwMj26tkEOAdeWL4bda28rTeReMdhDDx8dOiPDQWafPu7DxKLr1xhQtKYwvu4qxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GVXPR04MB9831.eurprd04.prod.outlook.com (2603:10a6:150:11c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 14:17:38 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%3]) with mapi id 15.20.7784.016; Thu, 1 Aug 2024
 14:17:38 +0000
Date: Thu, 1 Aug 2024 22:15:01 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 PTN36043
Message-ID: <20240801141501.yt6ytrf2gzmravwx@hippo>
References: <20240801064907.3818939-1-xu.yang_2@nxp.com>
 <3akk6hydu6iguqik3ek2pb67knihnjcepyxtbsnnasq74ikpsg@7txsek3mx5rp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3akk6hydu6iguqik3ek2pb67knihnjcepyxtbsnnasq74ikpsg@7txsek3mx5rp>
X-ClientProxiedBy: SG2PR04CA0183.apcprd04.prod.outlook.com
 (2603:1096:4:14::21) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GVXPR04MB9831:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b9cabc3-efc8-4b0b-d833-08dcb234b231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mOYee2wozZUWOK769xb+21Z2BkbVTrnQf5Y1Tk33fsCYSrKAAIdRMXV3fSMB?=
 =?us-ascii?Q?VAB1QbMBwPgGrBj0oVDws+JJE3mJRnbWqRVyDA3MOGfA8YF0Ks1xCjtI8pEf?=
 =?us-ascii?Q?wOx5lrKRZq3iWP964mUK5yo9xdWMFUnae3TrfZZlUq1Exbvi3wQE1s2Az6AL?=
 =?us-ascii?Q?AODn+jpsiB92edUKGnlfmMdb/K4aUs36/euhBTX6oabw0B4bTv8yOLdLMADk?=
 =?us-ascii?Q?rVkgmSAsrP7padH8ymrcV3S7VOd2AwtgRcrtVGbnWEmwpr+NFp/oDroXqp0v?=
 =?us-ascii?Q?7+aYRs+b/kZgDX1G6wsGe2d8+IHp+zv7lE6nQgibDVBQIv4VC6+cisiXv3cx?=
 =?us-ascii?Q?Fc88fhaqYpt7uKejk8qznPr1xvA68UYFVkr+IgVLgi847rLpYTpSjwqXi0rf?=
 =?us-ascii?Q?mcBGAMlaoswjq1rnt3h05nyiQBZSERG1860JHlw/YLCdPD0xKeRyamsPs8mP?=
 =?us-ascii?Q?cGPGlhi79V7juCY0Nvd2lObc/KibjpatknjlseWG/fLcvjWtdgfFNe8YmPMT?=
 =?us-ascii?Q?RQxr6d7W3EKY50qwu4Y9LEpGzSPc2/WSF4I5fXZi0WpknEi9otI78C0NrTTB?=
 =?us-ascii?Q?tLo0gajHVehD3ehGXXQ9S4DiRqBNnzNHV0lUC+8gl9q/WVDhHN39UW0AJb//?=
 =?us-ascii?Q?ladaKwzVIP8xwrNLuaLwjixJMJydY00ff9XI51WufgqJRftiq+6Z1dEUQBwP?=
 =?us-ascii?Q?A9zj8Uo8yAaDTYtyu9fgdojKo6ZYYp5vQFrbr578T2JIeh8YLylq66zzgPmo?=
 =?us-ascii?Q?KB0d7uuXAFOtilygCoL+EuFF6wIq2GWpFQAc090rXKrgTzj3MDDPLW91Um9y?=
 =?us-ascii?Q?MelAvtCDRg96UAOT4sWeniAWx0Azv4+ZYWiA/Os6ygAk+jSHBVLj//z4KV5K?=
 =?us-ascii?Q?UlQ4e4LWAsSkWNyi+XBTfBZFto7n4HHMyecSOjRJJ2EvHlrBIMx39GhbsAQQ?=
 =?us-ascii?Q?K1cy42S/7UTsS6kUgbDx4aFKn8Ph4nL4uEffOi/l0SJGzU+fDcf7zGO8v4/E?=
 =?us-ascii?Q?c4d5Ux6+4n3R0SOH4NiJ3EjtcibNmIMMrldVYSF0xJ2+s7fB55dsY7JLWVoK?=
 =?us-ascii?Q?d8ruSMcdIcm9OR118InV1BG6NvGs0PfadRowC8It+LBTVdw0AelCp8jbNgrp?=
 =?us-ascii?Q?v0uL/wfrsuGKdIXGALfyJ+fas0YhLRvDPF0TC9/WHBa8GFVrsC5yNoSDFcRk?=
 =?us-ascii?Q?G+J44iMuCrj+qOKPbbDJPIAFP2AjDg+aZ1WOHQWYDkUb7Dbwp3pS3XoqJ6rf?=
 =?us-ascii?Q?ncGIyFj6d6ccQHwZWhetVu4mVWIs8n3s2Bi1WaKuqd2BNNcmAuraN2fj9G55?=
 =?us-ascii?Q?MtdyneUb72c+OtIDkfaRmgZ9izzf+v+ZAag1Q8HfZ/zZ3fAGSR0uQ/dfkDLV?=
 =?us-ascii?Q?mtyIQ7I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SHfXmISv5GN81pO2uAWAdj5oh2ZvCgYDpQ6JoyQ+APYkSrbJCzXlGUMQ6C0F?=
 =?us-ascii?Q?ytjNzrT6/RGCHc6sVQ8iOj0FzYoL234nT5AugZaruYN+TYd/DfDCYa8AaqAL?=
 =?us-ascii?Q?j7Z63bcFQ7g4B5ReA+lua7yjBLn7cWQOiJLHIt1j70ITVNJpU2thauEpNueM?=
 =?us-ascii?Q?3wSEvG29rk3taUFBZ5yPaVksgMPhxNL0eygdJpnZTme1N5sN0K5EAYhNEoPk?=
 =?us-ascii?Q?tNacZ4RJ8+oRoeEciGMdzLV9Nq10rboDoF7bARZw+Ec5adZG9OaFnm2cqzfK?=
 =?us-ascii?Q?g0MidZp03gDhafVvEiGQ71QqBTZS8XLH6DEOYi/mujYF52p00ay095Xq6YMG?=
 =?us-ascii?Q?XBJtAWqJbw/n7Sxtu5lwxFWhib1el54Npev/iz+pCXZnKYZ85xkyGC4OKDEf?=
 =?us-ascii?Q?P2lUXkC/yp9SsTzaqAROLOgbxB+aKxLy2lBhs9OyVSJN6A7ZiaTd/2/48a8Q?=
 =?us-ascii?Q?OuJBANkkFFmYX2mp2ioqhF5vLB5rt+SjPS2U6JQ+jbdJJTsZ4kBYzyCGsXNH?=
 =?us-ascii?Q?4GJPGrnso2/by7vzmL2vS+YY15/UF3YlqyodL4B9ZNRiX5Lz9i6Hf1W4Oha5?=
 =?us-ascii?Q?39cIlA7grVOWZjrAQKQivyX9u+gIK0k++L0q/sQJ7XdJgmrKyg61zMu5Ao36?=
 =?us-ascii?Q?fI9jr+temWg6aH2YjvKjJCYV9KeaSzEfHF3FIJof1ydGMWP7lFdD4trmLONT?=
 =?us-ascii?Q?bn6nQLfdnD6vOOXMSsU8iHXIWCf2PspkthkoD5JcYJ5vTLk/tda+eE0Ku4gY?=
 =?us-ascii?Q?XSbe97wxh7HUlNIjKKk96LK9SLB8zRgXXn9+NwYr/YL6a6MRwJlFL8D9cnMT?=
 =?us-ascii?Q?u/ljZ2ovVjD6nPGDazEMn31FmdYBAVRHD4/HwCEzDeMimevw4UvksWmiA1FY?=
 =?us-ascii?Q?bULrE9Lf1rGEUZyZT9H3os+aft9v7dOAtc1qLZTYYvpX3XXZwW9A6zS3Ahxo?=
 =?us-ascii?Q?vwfH8CVJBpMzfRYIFvQF/QOHUIiwsm64+WBJcjkPXcReh5CikVT7Cwa9SYYG?=
 =?us-ascii?Q?If1qnVIvHSHVyLLmzL6oEQkTCKzbBJJjwHg5o7TYlp298qjgzsshYaj8su/o?=
 =?us-ascii?Q?5hVCU9DAmTB3AGN4xcxIaLKg0h/4c96g5PI5fkZ+6jCymbosBTaV3fvNQyeC?=
 =?us-ascii?Q?ZY0726+Ve4OAWyaF2GUOoCbWnFM0F8LMAU8qsu5glisJGMd5v3zHIXvZRqdd?=
 =?us-ascii?Q?WZCilk7jV9WIwguOZcxIOMiNCFpF9qhOfFRiVYhhKu29Xkd/M6ooV+B4Vwt0?=
 =?us-ascii?Q?p8MJ5niBFleFh1VSn3wtKJvfXjIRSycMJZMsUxWrKVO5zjaf3ZFNViBhaXhQ?=
 =?us-ascii?Q?DAj0sWDyg7HacWuKJ3ptA7YqtWThs2vCSQGKXN7F6ODqiEbUXh4EjOv+Kzvp?=
 =?us-ascii?Q?skr5i7+rZJ7qXQk5mLrY4HbKcB9hi30H+tejOHP22miXmJKm1UI9X37Rs7FE?=
 =?us-ascii?Q?9yBDNjp4Ekws49EVQ3SZBLikngHRt0P9HD2FrSK5MJ78upOmmzokLlSYKs7y?=
 =?us-ascii?Q?pawHn5X3f4vEmMvRhfQNAdSwok6dDP1VskALFusT2Jw+6OLLK+sevy4evFA9?=
 =?us-ascii?Q?rxrh2WQLPMRIi2G5JC0WykTJfxQOFptvbZ+VvjeC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9cabc3-efc8-4b0b-d833-08dcb234b231
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 14:17:38.0998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nWjhH0jv9JmH2mwkzaxIZd4RHh+XJ+Hfv1+iwfYqgjuY4gQOnOGAcmFp5K/gORwTlaPTgdom9DDumCyDs52gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9831

On Thu, Aug 01, 2024 at 02:49:33PM +0300, Dmitry Baryshkov wrote:
> On Thu, Aug 01, 2024 at 02:49:05PM GMT, Xu Yang wrote:
> > Add a compatible entry for the NXP PTN36043 GPIO-based mux hardware
> > used for connecting, disconnecting and switching orientation of
> > the SuperSpeed lines in USB Type-C applications.
> > 
> > PTN36043 datasheet: https://www.nxp.com/docs/en/data-sheet/PTN36043A.pdf
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - add Acked-by tag
> >  - s/SBU/SuperSpeed in commit message
> > ---
> >  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > index 8a5f837eff94..152849f744c1 100644
> > --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > @@ -20,6 +20,7 @@ properties:
> >      items:
> >        - enum:
> >            - nxp,cbdtu02043
> > +          - nxp,ptn36043
> 
> PTN36043 isn't an SBU mux, so it is incorrect to declare that it is
> compatible with the "gpio-sbu-mux".

Well, so I should create a compatible such as "gpio-ss-mux" and make some
changes on the driver, right?

Thanks,
Xu Yang

> 
> >            - onnn,fsusb43l10x
> >            - pericom,pi3usb102
> >            - ti,tmuxhs4212
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

