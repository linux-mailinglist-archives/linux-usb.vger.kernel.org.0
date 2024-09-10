Return-Path: <linux-usb+bounces-14914-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8CA974347
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 21:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C752EB24FF7
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 19:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF4A1A76D1;
	Tue, 10 Sep 2024 19:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FZ8BuQIb"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FE71A7063;
	Tue, 10 Sep 2024 19:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725995707; cv=fail; b=ssoYLw/KJQ/F+XGXKaphO6YrJmEzPZQbQght/ea7Zjh2V2UottbVbDzyf+SBpo6UaMea3CcjmITLY8pSFMUldAAZUnNpZZVuxHUnBGOuQFVbx07IGqXe9g3Cq1bycPmK38IsywoMR/k0zG0mtajyitfX4P+r1On+3xAng4+gdB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725995707; c=relaxed/simple;
	bh=AGhu+slaxZLRDijtIM067rR/8Zhdbn1G1Axj4pE+RN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dwrw1WMt6h9C1HoDrckb7M3TWLetTaOwK0/PR6MNXc/C8xi52sEMnpRoQfbXFAObRK5Skyt2XefdpB+uzOXtLjHANNEukbOuxWTUrSEhaVi2qbLoeJ8ixwCo0cvSg94fpHzgCWPR0UcJ+YBnBDsexiWvIbHtHlVPnX5QT0pRGu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FZ8BuQIb; arc=fail smtp.client-ip=52.101.66.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rqA9jkF5ZiQdhwmmD/0XrE44DKTbdONrFbGvkNNjV/m31pEdQ0ygVh6NcZMUaC7de6RdKEUS+LSQ8Jms8+/XrqAaK0FQyfmZN7FhCa+17Y/pLuKlj6fSDT142E2/HyCphwtRZy81rLxqi5ySa8AamV4ysTld6ckoigNB7kT8pqVLVkRdgEzlcrrdD55VeaTbFqwBrG9LsvUD+gxlk9GaoZQ4KHuFHSE6+NM9GSPwrO1xRAd9kCzu3rJAMy9gnbbe/NvF0a54eSD7Rk7WxKRueY4qILwnqSEsjSSKayt5zx7NM/qXkOtp10AlMjaV7ll3Z5/kgPV30l6/O8qtLQAVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YDjh2HfRxGbmVFu5E5Yni8l1gro8I9vF2nxMu2UTKQ=;
 b=ZGd4gx6uEWwvRfTH2hbfM5TFr2s5flB/ei30g1UnfaCnohjl1ra+42Z/rTuZzjICJk5NBAsydgh6qIFuV1cM8Hr26LSLHRfnJGBq1u2rT9CO+diCSf/0uqLYbCh773I6RwP/hHhp27NzxForZAK7EjBDLVZd6YMss/EV0vqGkkurwwrDjH7PVAydgeLpRimiiuLbT9/YUqGhIJ0laQILh7ZDpwIdJeXd7Z+RehmN808a5Zf+vgZ6hVcVi/IQYeKaKsvi3rKymJoi2tQAYDP0kmnPZsJkr99Gg2HzcCmEI45/p2wXxlTCIqrTX5ceHR/7STA1o1bZdask+JAjFk+/lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YDjh2HfRxGbmVFu5E5Yni8l1gro8I9vF2nxMu2UTKQ=;
 b=FZ8BuQIbV7YVTO7yjGDzku0jGzs6rjke1I38TN9NChwSeYNHlFmB6ORDmRAjW0KTR+k4Jaf9sRLk8tDBY3W5RV0fhKoAhEd6/DCutsAsgbd85iM+JCXy99CcBjPB9IL3uR2z+rXfvVZKif0jgOELCd7jsSx0pabS+G2kDMt7WdgPaXZCEr/YSTmiuSSR5dVnelS1qPArplve+qn+WrU6/KdBkJPvfpTHvpt2iPzfUkWe8aba+XBZP8cRZBfkwf5vIo7GFhF/kkMOZan3mJhMGpkSruiEMr1zZd8WCqNuaV9yC/sHbyeDTV7cf00yeISrdBhhEBSwts9hnw9rn30Erg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7561.eurprd04.prod.outlook.com (2603:10a6:10:209::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.21; Tue, 10 Sep
 2024 19:15:01 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 19:15:01 +0000
Date: Tue, 10 Sep 2024 15:14:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, jun.li@nxp.com, l.stach@pengutronix.de,
	aford173@gmail.com, hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: imx95-19x19-evk: add typec nodes and
 enable usb3 node
Message-ID: <ZuCaquGr+ocHmD6x@lizhi-Precision-Tower-5810>
References: <20240910070339.4150883-1-xu.yang_2@nxp.com>
 <20240910070339.4150883-5-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910070339.4150883-5-xu.yang_2@nxp.com>
X-ClientProxiedBy: BY5PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7561:EE_
X-MS-Office365-Filtering-Correlation-Id: 4924267d-c322-48cb-7bb4-08dcd1ccde3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CKORi1yUZe9xCyjry8da2nP2x80xlvjkuyhxHl831EmBXWy4fdqro2jVSUF1?=
 =?us-ascii?Q?stD4WUr5ieSDjFCwExwfMVEtxmoZgaC+yAmJ3G4vgb6Eq6jYsydKtsk/igOt?=
 =?us-ascii?Q?00vqwzWhS7XuUll6ON2opR0tQcZ7Ir1ar0BV21zsl4aBi8QTvEHgZmmXNo+c?=
 =?us-ascii?Q?Trxm1vgCfJPXeq8miUyGNdnLDQHx+dtTdonFGaPNISuf2lWtUFc93mkMjsXu?=
 =?us-ascii?Q?u+bhcywV9DHpYNr3xeeGGahV7wvWp807gWw5P2/S1rmWxTBs0jgdq07HuOxV?=
 =?us-ascii?Q?gbxp92v/ZaPvAPXqmt1embMN2edOwi29Jd1/c/2ZTSS55jcgrdcI+XojjqRB?=
 =?us-ascii?Q?pU4w49igg8RapTVi8/Cs5q/d5qTtYtHLMZ5D1M4O2El/80M/gBROZOvprzy0?=
 =?us-ascii?Q?0clIub+cXVYlNAxQ51xKzd8M1btPAoMc0NrKSaA8n+jFH9om36WzF02BoP5v?=
 =?us-ascii?Q?fSvDoVtNQ6Y2StAjPgo/onTtGOEbuWQMTmo33KhKn6R79QihPueWwBGuHQKE?=
 =?us-ascii?Q?uJCyfZThcu2wKy2xb4FVOjh3RlfhkrBI4IYXD5qG7Rtmj2aOgmGrQRiH2YO3?=
 =?us-ascii?Q?HgFPO7y2+WTGDtmibfN1xdAxzUbd+cfPh/jIh98l7cU2CkRJOnyFJa3BxuxU?=
 =?us-ascii?Q?4b57/db3oNKOu0u7V8yZt+Lysod3MT8KRUgfpIx1YR+Pb27MjoVsG/8URRWv?=
 =?us-ascii?Q?OpTa/SMBHGSYOqRkDRVLJZXOdjwT0hRFoifLYLkbZWRDkQx2ZzSfzI3Ejj2c?=
 =?us-ascii?Q?jevOpgabim5qJ+m3WSJhcGpMROuSKuznJ+uJRpbgLobbJWtdYQNU3o+POYju?=
 =?us-ascii?Q?oubTtUsdPZ978LL+Pov0f/WXZJHYC6XHatTGCXrYmYdzDGq8BNGgNB2LEUSe?=
 =?us-ascii?Q?Nd1AMZAiwCgoDjwk/aDaszXVKeB8TtHzr8bn3b6jTuT+I3DjDxXTJrhH1ly8?=
 =?us-ascii?Q?xKCDEzlHy9Pj8cc0OcMZzdXdViKzZ9hVJTxBFHoKJV2Vo46IVkFKja5OtGGM?=
 =?us-ascii?Q?j/83i0ifTxOwaDMKCucvn2dZxMyG5ChjNq8UHOiDAqjcx/bynxsK2lndRLET?=
 =?us-ascii?Q?FHt/GoDQRkIiblkykcXHrpcHK3XgyZKELqaGF4NDSv4ivJV7XV+Tm3g4xWOR?=
 =?us-ascii?Q?3WdKGyJK1ZjSoJfXpsWpGekPT3Z1/FJl7zIZm/k3acEXPfrVUWhR1dATpDuU?=
 =?us-ascii?Q?8ZdxhTZ6tsyswRt7tRvm14Wcsb4t5K1x6gzCsAzBMg5cix9/oSPAAu8e1R4n?=
 =?us-ascii?Q?YAarIs2uDzRD8g+IbAM7aOU9stI41QXrc11P6TH7fum5s5FSvi/41E1Fuiwr?=
 =?us-ascii?Q?UwZ7H3rZBBCxfapOF1Sv5v1I1QxC1rB4EjJjpbc4BtOy/cqQ2zMlH/U7Ouyb?=
 =?us-ascii?Q?3C/31tlpTVt433HE9xZkppi9xs4NwKWT/YAb+24PMcahc3J3WA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z88RvTSKojFu/7ONPFAwAq0PJwmU+bWl4ZWT/CMVUPp0TgTOPTRWghmS4yur?=
 =?us-ascii?Q?k5ao7m9038VGO4XzgYDBVlKrDxd07RHFMTgq/7Oxii+9iCI92ZNPk0YX0Fl8?=
 =?us-ascii?Q?eKMEb+/jMnYLvdqTI6hCoymgqOHM865SCtGTQN0n8frX/ca1K6pjSi/DiAh0?=
 =?us-ascii?Q?S6lHVdHbBqGsKinugepVM9oHpaqV4jVyhLDCSYyuBjDLDb0OOCYww235XHV4?=
 =?us-ascii?Q?zDqFiamaMov/n7zaqR8d8g/J6SvsBkWwTzeCJ4VGOwoz+d/mZUmAaCZWg908?=
 =?us-ascii?Q?Kg/FFFlSxOGR7QDPS+24Ex3vC6vteo+vBZeTtBe+Q1iFhe88puKKXS5HXmpf?=
 =?us-ascii?Q?F9zpza1B2BeGYJtqHBJ+wk9bLi0A5OH8Ks/NA5tidmPXypOYJZqDgZVr8gE4?=
 =?us-ascii?Q?cYiMezvekBezmySMADDgP1cmHOjKZ2IXWGdjS5B/jKZDRGW0Ee0m0LhU5FY3?=
 =?us-ascii?Q?dNmMU7iXKWlKeoDBaQJ4DSf2nRq0LiX59Otto8p2TJMn8SbrS7rFadFGCgB7?=
 =?us-ascii?Q?63ApYwngY1q1rDBccMXcThVvk3F47sqqUre+dSGcbMQFmxYibJl5V/6XLbOi?=
 =?us-ascii?Q?tV/NJe9VS2+MbSzqULrq6Pb4AO2SWUxEz9U778Ovy+D40DRcQ9z3HbKzYjRa?=
 =?us-ascii?Q?BvW25rfMjRHBkRo+rCVImsy4H7grWwHJMR+9MjOjVyI/HXN8mISaA9TAz3H/?=
 =?us-ascii?Q?HE20pUieiiKOn8DF6U4+Q+GSsfgbGI/Hz65eGjv+jaJvQKKQ1lI11dmzR5Ab?=
 =?us-ascii?Q?Tx7JsXcOolnV3riImqDgZoUx79N+WJzPY2cZ+NCK+bdiGx2cF7wHdFyHG1wf?=
 =?us-ascii?Q?IIZ0Tv4qhZpIfHvVgFe4wBia+0QZZquNUVBpXD5X7BRewbpI/BCso4iVK+Hb?=
 =?us-ascii?Q?uGIXbY0zPQ/3KIfe957NlH1fCVjOcLg6l0/lIE8J9z0Yn+bHz9JZlcGC69rW?=
 =?us-ascii?Q?oOd9tvHm5/ZgKSIkqGPaMafB7DSlU99XSFg6JHBAatZhn8BJuc92NjwdAl9v?=
 =?us-ascii?Q?EiIIrKP1J9Ozb3RAXHwFWxXG4NuFvbcCHDg3PsXaXPxCe3UOcglzhLi/fLvN?=
 =?us-ascii?Q?sYs2sOYcy7Z+5dsBlXkkmU0iseQndVsGaJOU/z1wrQY1b8Tu5eKLp0otFaCt?=
 =?us-ascii?Q?Omoo603l6azeMcsr4C2dFGe2h4LU+DpS1OV6wEvEqpsBb0HhobMa9efs+tqW?=
 =?us-ascii?Q?okTe3T/BqXo4e29XiIv2DcCtjUDgT9tndQFSNMXzmvy6Aloi3O+O1soQkdq8?=
 =?us-ascii?Q?6JSwTWPIttS4/DR6TOMxNGCoWpdAKNvveue6gRiNlJdzWTTQqmbCi1ZFxF+h?=
 =?us-ascii?Q?EC9BH99l17Buz68ef+Opd1W7M8eWN70JVzmHDf56GR2LAPqUJ+wCJeojzMUf?=
 =?us-ascii?Q?k9Cu7Cc3+y2rMtcotEhVcHv8gGuWsvLC+bZ7tvCsbckuRh7t5EzxfC93JvCe?=
 =?us-ascii?Q?CkEXYI4Mq5qNQ3uouw1S8J5lHV3ghpMtfDgv2twWuN0X6Skm1egqzClLFni3?=
 =?us-ascii?Q?zqh47pd9EqavvUiBt8nUmoWdvdP3kOg5Zbs5EEdx4uQ4ZJ8PKdgPYR31n80f?=
 =?us-ascii?Q?U8QK43Ql3+rQ6XF1w2GWG8SHoNl2j1tj3W+mXBrI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4924267d-c322-48cb-7bb4-08dcd1ccde3c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 19:15:01.4404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/aNtCKy1AUaGbhAQbtuxQ0vbscPIJide4sBsDSUcugxH0elWkhaYZWodbXYB1QI9iITlgnbHU32KhJCyb7xDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7561

On Tue, Sep 10, 2024 at 03:03:39PM +0800, Xu Yang wrote:
> This board has one Type-C port which has USB3 capability. This will
> add typec nodes and enable usb3 node.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v2:
>  - no changes
> Changes in v3:
>  - no changes
> Changes in v4:
>  - no changes
> ---
>  .../boot/dts/freescale/imx95-19x19-evk.dts    | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> index d14a54ab4fd4..46a9cd3d4403 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -5,6 +5,7 @@
>
>  /dts-v1/;
>
> +#include <dt-bindings/usb/pd.h>
>  #include "imx95.dtsi"
>
>  / {
> @@ -99,6 +100,48 @@ i2c7_pcal6524: i2c7-gpio@22 {
>  		interrupt-parent = <&gpio5>;
>  		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
>  	};
> +
> +	ptn5110: tcpc@50 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		reg = <0x50>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_typec>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
> +
> +		typec_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
> +			op-sink-microwatt = <0>;
> +			self-powered;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					typec_con_hs: endpoint {
> +						remote-endpoint = <&usb3_data_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					typec_con_ss: endpoint {
> +						remote-endpoint = <&usb3_data_ss>;
> +					};
> +				};
> +			};
> +		};
> +	};
>  };
>
>  &lpuart1 {
> @@ -128,6 +171,38 @@ &pcie1 {
>  	status = "okay";
>  };
>
> +&usb3 {
> +	status = "okay";
> +};
> +
> +&usb3_phy {
> +	status = "okay";
> +
> +	port {
> +		usb3_data_ss: endpoint {
> +			remote-endpoint = <&typec_con_ss>;
> +		};
> +	};
> +};

Please keep node name alphabet order
usb3_phy should be after usb3_dwc3.

Frank

> +
> +&usb3_dwc3 {
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	usb-role-switch;
> +	role-switch-default-mode = "peripheral";
> +	snps,dis-u1-entry-quirk;
> +	snps,dis-u2-entry-quirk;
> +	status = "okay";
> +
> +	port {
> +		usb3_data_hs: endpoint {
> +			remote-endpoint = <&typec_con_hs>;
> +		};
> +	};
> +};
> +
>  &usdhc1 {
>  	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
>  	pinctrl-0 = <&pinctrl_usdhc1>;
> @@ -245,6 +320,12 @@ IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x31e
>  		>;
>  	};
>
> +	pinctrl_typec: typecgrp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31e
> +		>;
> +	};
> +
>  	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
>  		fsl,pins = <
>  			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0		0x31e
> --
> 2.34.1
>

