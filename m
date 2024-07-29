Return-Path: <linux-usb+bounces-12566-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CF293F09A
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 11:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 894FE284301
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 09:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3FD13DB90;
	Mon, 29 Jul 2024 09:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RLutte4B"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D7913D63B;
	Mon, 29 Jul 2024 09:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722244022; cv=fail; b=YvM65Uwji1sVk+q8oeOo396Gm3o5rpqMfBuZ81QoOPBi1gX0SgwsmujFfelPlYILL742rfcX2Go2Os05ZF/RnvPvQ4jP6SblEphohqMQA9tfJO3YxoeE25VWcXYZ/jIBvRHdbxW2te6chxG4PwwM7WbU82ZV4kuRA6BOvjtHJF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722244022; c=relaxed/simple;
	bh=o6TPc1kNrgOOwTqkyUj8MHJsRWUJxpjunIxFqUgwWyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l8MPIjOBNvtW+bWtkwIcT8Bgw+9Sk+xEHZWT1KigI+p41uLG7VbZ0SpaC3QpEQ+431rsVe53f8AOzomvlwz4Qy0Dzhtls1gnNWpTx6ZTAz4MtgKxcYHhyoRO6UWoZdUqZsaGgOq90YvSHV85STVzIVXgVJgPzZUi/vzCysjQ7wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RLutte4B; arc=fail smtp.client-ip=52.101.65.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcZM+EzWroCUFahfp9sEsFQJdXlq8clb49llw5ChBRE4TVsq9i/zTCbZAEQ119GL11eIEp0/U20MGkvMvp4Pk8eywMuphe5mUsNdtwHACSnu0LmduP1gSkGVxDQ8ukF9lDiilf3yotofnebngUhA92Su31d4afYEQnGt1C6th/VwhDviLH10yAKaFdcn+ENluGcDsreQOEHIZ9Hkavt4foaz+QVTI09kA1wO34QqTQijQllfYnZagJIRxKStwur4ouSJCfQkNHWzIro/GMrATCBSy7g1RWLXQ65jYu1fpDL1pA8u5wjAD+kzqipNXzF+NqOn/Lk+eZ+6mg6GtdqNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNcW7ms3tG/fVrduBfOVEkW0Ooqw88za1ml4CRzQ2DU=;
 b=mRTwI2t5+kD435g3Sz0KDoPT7cv4brkBR03Dyjq7K/1PCDUDjwyxeqC5rWhncOur6k4y4CJZ/qC9xRuQAu+YiNR9x0pqrLiZLW82ShYbDddqxkoazpv0nPnCKjyEokH9hIprAf4V3BvNqbCUulRomulW4FNRcdu6Pr1SwSYPgOQffj2JLKnQkEB68UmdGJ1eCElFBdBnWK7c0v+e29QoobTSSD6F82bAQt14L/Zl0RLvTuBL1+/4eqdmuDZGHIcFbir+vOK4xelSBKXZh3AC9c7dJY1ohVbKl+dirJlX5QKGEvgE4jKriF3mS2B/NST6/+nzChJlACPuJKJCcfPUug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNcW7ms3tG/fVrduBfOVEkW0Ooqw88za1ml4CRzQ2DU=;
 b=RLutte4BKIyKl0XzJSPW60YPRCiUC/ls+FoTW4JWxb7uzyFScnQbHnprMkyozjqIQQWqfCPjqV5mKwSCD1YZLGcVpLa8gKGPiPZEVQ/8Bu3JbeidwZVgIMmHHAhT914a5InjD15qpCzmhT66jN2otBxgQTBPc/xX6eA21pnn6g1RMYaiG1WuiF54bPv7yGu+q4KEcFunjkKZHLQE0J4h6hkpBbQ3KivC3iG2RYRFkBWoVNKvnSgUNgaGsUwpsnGgvZt5WYpbOyuVGvp+eISd/c/iVXC6W4/WBFbYUXWIw2jt5bayYE0wOtGDGyVpXvUf6uxK3LTgC4LFnL2OIoQmIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10328.eurprd04.prod.outlook.com (2603:10a6:150:1e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Mon, 29 Jul
 2024 09:06:55 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Mon, 29 Jul 2024
 09:06:55 +0000
Date: Mon, 29 Jul 2024 17:03:53 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: Re: [PATCH 2/3] arm64: dts: imx8mp-evk: add typec node
Message-ID: <20240729090353.e3vvtcr4xtr7sdaa@hippo>
References: <20240729081039.3904797-1-xu.yang_2@nxp.com>
 <20240729081039.3904797-2-xu.yang_2@nxp.com>
 <f3645df4-b7dc-45da-8a9a-ea72162d1b0d@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3645df4-b7dc-45da-8a9a-ea72162d1b0d@kernel.org>
X-ClientProxiedBy: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10328:EE_
X-MS-Office365-Filtering-Correlation-Id: feffec78-9113-4959-444a-08dcafadcac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9RWRyyl4k/U9loUMkEtR9sVwv1C8r4s2A51UOGMoGqhC+f4hQNb4qk+g9OCm?=
 =?us-ascii?Q?lbQU5hUr9dKT0/HYBZoG76D95NEG3nlfA/OEYTRuTOrIexF10p6kvqp/UkAd?=
 =?us-ascii?Q?CxhlhFixhAbal7sZVR5IEYEsVCy4DKlKGBX3Hl6PaHV0XPH35RmV18BePX8r?=
 =?us-ascii?Q?7RMDgcVDy16m46ROHTbuR6XGxo/Z3KixsaU+Ac0UUIDxp0vvU6Zk2GYfbzmV?=
 =?us-ascii?Q?lPxz4muaWak+JpodWJSe8TV3bCoebsX26tjr7ksHP5k2oNXiMO48W3O9H7jP?=
 =?us-ascii?Q?60kUEG6bR7beU/td84SYhRNayCz0SQrylmR3A76hVFZ7+XTbXTEGq9VQFEqD?=
 =?us-ascii?Q?1/GRrk7+I9an05bvYE4aK7iwbktgpROKUeeLkaum/Q0K/H59/jO5XEgCSWtH?=
 =?us-ascii?Q?LLDvAaGPOoxBs3LCTP/LZk9DOBxYyQUnCjoBqHT8S+UC7pfCYSLWUAQWbO5C?=
 =?us-ascii?Q?AKNTVmJdMWDHJqLzks+wiV5g/mv7Fd5FVQ/ygvIIBnGOPRZCOlF9iqfNmmhX?=
 =?us-ascii?Q?Ic8xYyRlWh2ev2Y8IWMgeAjdWiHQkvTn6TvCZDMVTCoCtkJfeKYToyB1OPMm?=
 =?us-ascii?Q?/Bnsb+VRJz5LzpRRr/xuUNUIRZ/odpFsOmvFdAyF2ypVUTOaav4+jmhyR2nt?=
 =?us-ascii?Q?RpPkvaNOQvp4j8uOqhT3tzuAnZ4iA225sR9hYmF0+M3SylC3jnQ4s10/+mWd?=
 =?us-ascii?Q?lsotmTcBfu64TlguTzQstRHPJSwkDWotpaSghehUvka+3aMYVPKHAtqcngNj?=
 =?us-ascii?Q?WxXS0JFAj7peJmgpEyfePTsYTnf1pI6gd0G6ivkBXA8Qe1PmaPvDkIUQGRzr?=
 =?us-ascii?Q?UofxY2PNwrXpG8Ty3ruyLQnNeHIce2vcBNQ4Sh7To/U9ob12en64O/lybt+7?=
 =?us-ascii?Q?Q/INu5qIcj/AtEs7vswc1sJwApdOe7Q+4GbQAz+zUE/TmXfIbKM5h9CegslI?=
 =?us-ascii?Q?s2cJpdB/ORwdLs3sbN1VdGd1k/yzUYx6AgoDdpLWIxo23+xr7tZN0vRnGRcM?=
 =?us-ascii?Q?qRvBTVJrgBZ10ovYVpNoNVPJopPVQe0dWL3THkQW28ISsGfef4CO5WiFqR1V?=
 =?us-ascii?Q?STm8sZdScjX2WSjjXrIHCP7ct4hmfj9AphWng/zt56iBGmBzq+jJD5e13iKM?=
 =?us-ascii?Q?rrduSlyRtvqdNNclBcxcGiO/7MY5ncE/Lmrc7XjtYpieIKKr79UAplS7E4Bm?=
 =?us-ascii?Q?3aaHMmN2xsjNPPRSBTkFFyX/uut+rkdfCPLhEPa+PR/5LikcuQC1vpzga5F9?=
 =?us-ascii?Q?W1Dr8ReiRUzUNP0w/3SBVNVuJ2w8KMeFDHiU7nMJfqK/DW0LCJzWgJMzOWG3?=
 =?us-ascii?Q?U1W6ifgOsQjqZUyHwXUU9IEq60B6VQf/k6fLSlceVrVkhghm2N9nM9eF4zRC?=
 =?us-ascii?Q?933o8DwTrGSipoIZZU71u+TgiWA9sibdai8yJsLbVo596ANZtQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mRnM+bLVLUGiBfXOiUdS2z3LbKCXDNfYo1xdPWe9GfiJfAWm+tGuHV6d6X77?=
 =?us-ascii?Q?8ABRatxQ+IWx90EFVAKSU56RQDM/mlsKkf/+rlBa5cnfp5svKdStUeBbT36H?=
 =?us-ascii?Q?Rzdr9AOjSv9WC5GAUTuPAM4teQSs+gQFwnUX/RghucbIZ16WyncVdAGmyqPy?=
 =?us-ascii?Q?EElJB8TFEWVz35j8LPYDbLQ4WPqEXMS3OD6NCSKTt3nAH4YRoBcao0Su2HFm?=
 =?us-ascii?Q?K9RGSoe8E3F4R9FDrkXTTENsUo4wZH5Hqa9nT2/JAhkgrzMOK6QcC09M6aex?=
 =?us-ascii?Q?XNz4AQA3N7LMVa9EzIUB0fwV5hkfzeOasor40/2sfcfT4/YWVonIriuPglOb?=
 =?us-ascii?Q?1Xh0QFwboSGctGma5ibkfS5JUMb/wid0P/VmY5JyEbRCUNy4gQRmp3jzepcX?=
 =?us-ascii?Q?dt9UsiPNBlRigsH8reu8nSFS9mDxG/4RzYeiCQ1WqKTlBAs+x7R1nScHlf7E?=
 =?us-ascii?Q?xmfcWh75GNRFXCxtaO0RhDiQmbNTFTeQpqE5IDCCHa8L0yyg1xyTeP7WXsxE?=
 =?us-ascii?Q?Qsbcdms0AlXjrqv515w7mS/+POx134vb7ptYucntXU2ZJsO8Uc6nW0REoI1n?=
 =?us-ascii?Q?LSeXm4DLpoYmuiU9ntj40PHmvX27P4InJoUBbHlGQt3BzDBuGU32iMCQ1lFv?=
 =?us-ascii?Q?6GRW9UJyuc4YdFX5YVDtekOacksF4ScsrGXChaVVlie6OY/Tx5owLKfq1ee0?=
 =?us-ascii?Q?rI2XvwBpADhFI/zdKANNZqaFteWQtRPmkoCoDydHZVqEt4brFO/7oCXyb4Vw?=
 =?us-ascii?Q?TtfIGacz3fFtod/UCBJcE+nZOMju2ZxQBOriUPWNzQNkypeMi068GlKgIeJK?=
 =?us-ascii?Q?Xz0VmVyU6eONHGQr7BeW/pzAEopZ49owPGGzHm+2TViviNXZOttP53LYYixV?=
 =?us-ascii?Q?b7Jt6dPaUD+ZnXMjm0A7PdDNb4JPIJ+3ZH6w9gFhwAwsf77VtNdgL+4W0zjm?=
 =?us-ascii?Q?qyJe6fZ2fYQ5UoGuARvyJw8ficT+3NoanvAd61nIYBAb70iAMIxznx9XBNyu?=
 =?us-ascii?Q?OkLH3VLuZkqUF17HrTyKCvcfF2F6ZDXpQaGEvN61KdgJZFrcqFI/oMvBe9At?=
 =?us-ascii?Q?AF4J93CiqZuhx5QwRAAl6skyuRynU+je80gnKLCZkYpAOqVjis11gsklaRF0?=
 =?us-ascii?Q?Hzll4PCHKUkb8Vq+FXFGjZQLQa7RVXo3lEFhOZyTNx5/Ku9+kIIC6x539jRc?=
 =?us-ascii?Q?r5x4se4xfdyNtxQK7RGvfiEBla1KQ1DhsqounRncBc/0RoCVLON2abvofNLg?=
 =?us-ascii?Q?/IV24jZxaW2lSG2n5MjxnyhdgypGgpuIf8qw64l98TVQiLksF10HFPa4a+Hh?=
 =?us-ascii?Q?wKezv3nNSCmra0crp8FXPEW007aZ754IbPCu99AdBaZ6NotvUeXPa9ZsCEx/?=
 =?us-ascii?Q?JIAdsUtP2j8OtLKvzCKtWFo3MC/dneroL3F7YbV/AjTsDW4kNxXydfll6oX6?=
 =?us-ascii?Q?xtiiVvlQPlCYyTeik7J+2mRKg6TvJQnSrRy4t/9Tm5K0t/ki0XGHVYaS+jY2?=
 =?us-ascii?Q?c8Splqag1XhlckR56BmqDKJhoIGjZTT136zQIv6W5KtsCs5mhnqA5fbeKLtq?=
 =?us-ascii?Q?ZNGrgSOSPk6VkK+AEckk1+mIP/sp0yRWNUGB/Bqo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feffec78-9113-4959-444a-08dcafadcac0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 09:06:55.1874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e297pgjksZJFz94/D1AtgV/1SLHE7rT41KKGKLjwWCRQTkY3e7VS6FaKri3dvwsafNUjlcw9CJ3uS0sfM/CpBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10328

On Mon, Jul 29, 2024 at 10:17:37AM +0200, Krzysztof Kozlowski wrote:
> On 29/07/2024 10:10, Xu Yang wrote:
> > The first port of USB with type-C connector, which has dual data
> > role and dual power role.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 104 +++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > index 938347704136..e38b59af5f33 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > @@ -6,6 +6,7 @@
> >  /dts-v1/;
> >  
> >  #include <dt-bindings/phy/phy-imx8-pcie.h>
> > +#include <dt-bindings/usb/pd.h>
> >  #include "imx8mp.dtsi"
> >  
> >  / {
> > @@ -26,6 +27,20 @@ backlight_lvds: backlight-lvds {
> >  		status = "disabled";
> >  	};
> >  
> > +	cbdtu02043: typec-mux {
> > +		compatible = "nxp,cbdtu02043", "gpio-sbu-mux";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_typec_mux>;
> > +		select-gpios =<&gpio4 20 GPIO_ACTIVE_HIGH>;
> 
> Missing space after =


Okay, will fix it.

Thanks,
Xu Yang

> 
> 
> 
> Best regards,
> Krzysztof
> 

