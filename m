Return-Path: <linux-usb+bounces-12853-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1199944DB6
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 16:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC3E72857C1
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 14:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96D11A487B;
	Thu,  1 Aug 2024 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NboTPQll"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33A719E7D0;
	Thu,  1 Aug 2024 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722521501; cv=fail; b=VFYBtAR6mCgB9FUNomNPCgmi+9ng9iG6vI+ucZn4runhVcQV1zCM2vn+jcZM/T3Ei6j3dV4f1Vraeo/WSO8oNodmm1re/Y/O/sSHN3OlwTb3BT74J0LXS3x4eUcD+Sqf6M2O2gYyT1cAJQ5Lzb3vkACKY+RZ5hnjxPZ89pBIzkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722521501; c=relaxed/simple;
	bh=6GskInk8hd83dQdn7BiJMU8PiYPCCsQcsZdkQtjRcMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BWVAcDc9z3PWWsVbMwJNOPGAGx+yrFAqQsM2cEaONrHjZ5ykoQGrAflL57yW2n4ZKPW6LROmzlmk5GDOQhzPzuPh57GsA+yhBxLCU91pcftNU2gfKJHwCPCpTcdeKSN4JiMwvn8+aPjmZb7EtjQMpCHlaR+YIfY0+EVFJZJUlBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NboTPQll; arc=fail smtp.client-ip=52.101.65.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SF0qObmciKVsxKToUzdYGEqerRd1snTn+TWo3Frh+2xN/lM4GbcZVzB2mqgV1zPw02HVj/AeiuvdDmxJSq0cpphBMdj0iqB5bZhqji+CY2ucH6CEytgNYPC11hOLT3L9hXAkmzecLGn3EEfu1VkKp0zVwqXUfWQGZWKGzPF71KO/S//G8Cl+ZkkKWyhpbixACkV7iNBdqVnDxF61tnX6+fwsYIN1CQIgJh8SrMOSHi2FvZew+D4rnLY33cSPvZeF7fLw/f3qB6BFFQNRzXMhiXQh9w4nUB4S4D9JLoZ04a6E9BydPuKDf4OESJSCA8vw15scJzn9Ds7C2i5XVMBnvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+OH6WrSlH3RaL/PEXVK92Oq1RTDAxzwK5+c92fo5tA=;
 b=jv/+2AXhGpOohtUqa23Ncs83oNNHRecySxlXCq1XPbbfoPWoC08d+ppLHhKt1HS104Dy0nVC9e6m/lykdlud0LSJFO8ynEXJdesL/Mr7Rhu8Mzw4AoEPFiAGkG1V4HGb2Te2uS61nSXSWc3HLyaSLDEDMRyxyZWf0jhaJRSxON8Aq+4uI3ZerRA0qBcG7DtsYTPIbQ1mNVaFexwsNQvm4oxTNmHqQrkMl8+JjSER2OrQX3Uwwfp+3lxV40Nd1rBTtmiODHAGaaEWBdM5S6bbSy4LMz0kU1SI1eyctnPR+8jphuuYc9+I0UXOOqXThx6hEr6XL5Efrtq7BV8da/Pn8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+OH6WrSlH3RaL/PEXVK92Oq1RTDAxzwK5+c92fo5tA=;
 b=NboTPQll+UCZVKIBSu/XORAUXAGX/2OlpckUojSYUhTPP1YfXk23dLfGA0ydTlcU0vNmghzs5DKqTxhoaFiduLn3zUg0uUwxV94uo7Vx+svpfF1sjBnkk/ddN9xo44HsaeYZmmxaZjYK9bZEiLyDR4srbj8KTk0AI1tWflFiSV6qFmwxyfH4lXOOREb8NJhxbPcMwQHBQlKxQS1bxD1+Jvs3LPJSuQQdpCxJjjzsqIMsI4UsgivZwO/0Yf/pUSGS9YY8ue3aX4ySTkbZIdpeHStQv5jrQnQRMuSvO7Bo+xu0vTYzANPD60689RkAI9NB7irY2YJgKH1B0DwUAFSOng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GVXPR04MB9831.eurprd04.prod.outlook.com (2603:10a6:150:11c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 14:11:33 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%3]) with mapi id 15.20.7784.016; Thu, 1 Aug 2024
 14:11:33 +0000
Date: Thu, 1 Aug 2024 22:08:56 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: Re: [PATCH v2 2/3] arm64: dts: imx8mp-evk: add typec node
Message-ID: <20240801140856.cadyjvjoidexaxqp@hippo>
References: <20240801064907.3818939-1-xu.yang_2@nxp.com>
 <20240801064907.3818939-2-xu.yang_2@nxp.com>
 <lzbqvgpla2souin67crolhwyun4rxy5r6ax424xnd7ypuottjf@hyvhzywqu4u6>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lzbqvgpla2souin67crolhwyun4rxy5r6ax424xnd7ypuottjf@hyvhzywqu4u6>
X-ClientProxiedBy: SGAP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::25)
 To PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GVXPR04MB9831:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2ebc61-f4b6-49b9-a66b-08dcb233d78b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u5Nxw9GejtOi9EkOA7mj6iiwsQ18bMNF2T6S30f9j90DgSk89XcKZr7XxVEZ?=
 =?us-ascii?Q?xJ4uBaR0yvdF0MMBUmkWk77jWrYEneUR9do/HbiVryOxaxOU3Z6iNwIBSv6N?=
 =?us-ascii?Q?wfNpdRW203Opt/rVcRfW5hMhYbQVX+b+UQeNPEtlTKohZjQfX96euEW5cVp4?=
 =?us-ascii?Q?O8AkU6raGS1g3wl0WqG/3IvylA1uyYtyIjXNXbfxXd2+flOboBQT+ZL+nRjV?=
 =?us-ascii?Q?NdhijtallyaruVgfAlAgzTdPOY79ncVzLBVRF0uDF3JGYGlzgTBGrMOw5gRi?=
 =?us-ascii?Q?dQ+QYBD2Z01Z/7nIqSf9v8NMB6BNQyloGW9iKrkK4lwHhZZiU8gN0iqp/B10?=
 =?us-ascii?Q?jtA94ajnj60UygLG82HJcIeCt6uAUFkjV3b+A1LeW0kCMprim1KGayKK2YTq?=
 =?us-ascii?Q?VQcae9EstKO9NAe2/8QHr/uXMz97rD7Je1rz8BUGt5B9NAobnmZ3LR3VurYi?=
 =?us-ascii?Q?56BhIQ51DbshIbeBgb2+jDOiX5QFKLogqHZlz8vAdKk8qCbLXMv6GrdcM0yo?=
 =?us-ascii?Q?SvJN0l6cbDb9tSThpesggVmtpY8MplJz/iMkxVAq7ILjQw1pqy3H8hNjlK47?=
 =?us-ascii?Q?5dAfbefH0iprjK3eGh8VuQSu/sNI4Q58q/dn8/CRsuwl0qoc0TAveeZ209Pi?=
 =?us-ascii?Q?mB8jvssgaEvmpdiFNWc75QRje+cN3eCSUSpmxde3lTGtJjnNwVUP3LfWzLsy?=
 =?us-ascii?Q?jYpSdyqWcvyjOixWeRCw+Off1DUjNZloucPZqs8wpd6Zqv6lNOJUS9UvyV/d?=
 =?us-ascii?Q?Q6bz3uuIJITC5i+KSBPu0oi0ks1y2SkJvSgnRbtGTClQeXbCWO9yRGww2aR0?=
 =?us-ascii?Q?oXqR2y7VmjH+FMJt0L+BI2gG068Z8/5jKPdH3RkSqa+PI+20aWRF43Xqfjpn?=
 =?us-ascii?Q?uTCWjf6OGhIPJsOILbs9pjRQWEARG9uUzU4Zmq+OSqUSOeF3qwvBNae/q+bQ?=
 =?us-ascii?Q?7NTpgz/y9XC4DUqTWBlQUxV5ZcphPvPxweMzwPW64QNfQ/aWWI+dv1qgtgyC?=
 =?us-ascii?Q?P5G+ugBMygUIBcAXwM0lY3aOECTySuFm/U60v0oFA33usbkGqhfy66WaBm99?=
 =?us-ascii?Q?J/2uo9zt5ktRcaOizaNxPUKzgj0XzAp8dR7wA7pz4v/522oeKqOqDR2VqSz8?=
 =?us-ascii?Q?kLMvGOmGCV5FfDrs2Zwt5iXVzPvSOPLIXkQk5YBsAw76tbZA16ePVhNzfmdf?=
 =?us-ascii?Q?PFsEWnilFoMojnG9pjT6hNWgrQVahgeT5WiUww5/Sg4IApGl9d8C6THmD8r1?=
 =?us-ascii?Q?Dwkevu+7goxDl3lC6aIAiGDEvVAZU9H5sqksRLnPyhcbGgtiLOAtoOBpNJ+K?=
 =?us-ascii?Q?U08Ujt2jyaJ1pjhkrFGYdmqZ+CDB/+oeMRy9Fd6xyxQyMd2CTLyf2wjEV3Pe?=
 =?us-ascii?Q?/wrkv8Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?68nKrd/b9uET2q+UTECa9anFabNBobgKyCcu1sjsAFgUWxncLkex/8R7zjkM?=
 =?us-ascii?Q?d7NUcKmdiJRCyL4VJV4noCHBx1NTHSj2sV3huLZ8D5b734TWBe1l800hn1lH?=
 =?us-ascii?Q?0HVuJ/o61fl/u4+EfQEgDh5M3c/XBUxq9w6ivvQzrd41fi2elOg0nnwsw1lH?=
 =?us-ascii?Q?as6ZHpgI1SbEPSIp+uQwg9Knoc9I71krV/XBH8q6gubuvTh2rz5YAfssJfU4?=
 =?us-ascii?Q?fswp+fEXXoaQwtWxdy4a0G0anlUIv2IExDwsQkRMbHSYCjQfgOVzq9XRD2p6?=
 =?us-ascii?Q?K4bZ5iAlG9J3ShcxWxq4IZc2kwEtZ0hAUsL4Y5UoiV46d4v4H8QjAOeBZ6y/?=
 =?us-ascii?Q?4Sh+6/aSgz6/nQNlgAnpD61FCiGj28J6xnO3pEs4mRA5KlrQwv4gZaUQMXwH?=
 =?us-ascii?Q?VQnirUw8WyoJEWzCzy347b/9lE5utYlI8KnyM33DX5rkKF1o5Cj1K4nKf+MD?=
 =?us-ascii?Q?g2X5nmU7yBQUQE5weuOKoaYtKmOeSbWHUjBvbQVBuhzq2qR8XOBREifBLhPq?=
 =?us-ascii?Q?PrtQPDMp2Mh48p3VcDS1fT3s3bBAsFk5x42YjZQUQ73vcrktQrB7vfwFbfRf?=
 =?us-ascii?Q?OjyIUGRgkxNo7JUNPSpbEPbFD380Kzl7K9WlZXvbL1RtKEQIHtYS3KI+TgSN?=
 =?us-ascii?Q?+QJSIGoR62SVxxRv43biuMqD2StwFzdehwd+Ia+TGIDt+dtXVjblAjtIgJX6?=
 =?us-ascii?Q?2N/1jxXpgMwsdsxd8Bnj8BBgw8ekizxw9XE/1MeLJ827VNKdSrl6gvUH4msb?=
 =?us-ascii?Q?i6cr2y/hKwpsBfH1QjNoM6U6AGvn8glIAqwjTUDouCXokbgoFQCyk9I/r5Nq?=
 =?us-ascii?Q?aDeJM3IdXBlp3xTBg6YG9kBFAkhKqkdHq5YXzE7oyfSJByMe2QCTIXsyImU+?=
 =?us-ascii?Q?sgdSuVz3jXrpPWMdWQV5Y2r/5Ps62Vy4A+eU8hCsNPvC0rGCTKSueKB2hzeu?=
 =?us-ascii?Q?4r/W2kvf65nnWde3/FLdQAE6w/cMBZExHdKZcpSFuQ3bk092rn7wGfKDWDHH?=
 =?us-ascii?Q?Yj57+iwGmyfErzWgpU/Ip/5m3g9E6KopE/cc+yAlFf+3juYnm4AbOVOg2kNz?=
 =?us-ascii?Q?NTX7vaidnUVuw+2fP0w52CSv2/Mt5sCrxYmnWRTQVtOxLN9iYKyLgoMnLM7n?=
 =?us-ascii?Q?Go2ZyKpAIVDEr+SxUjlbmWukCt/IZsaUfAgrAVcQDDWSgo2bOlDIfeeodiB6?=
 =?us-ascii?Q?pm7MQhzdDA2xGqThRd5e+6H45k3R8PPGlQ7LTvASYm8+7qodpFcCWEiTKqdj?=
 =?us-ascii?Q?xXUIZpZdgQ7hR4HFY7iMjhf6aDiuP0SRJiB16FS0/v9PYM2s9pKJoWtBMqGH?=
 =?us-ascii?Q?SoTWhiz+TRvXs+WuUCI6Qy4erag1NG+hSPX1eMx2dbyckolkFNtyFH702meH?=
 =?us-ascii?Q?aTkKMN68v2ZcPKY3/uHHMvzbmQjE2uGEglVdx0HKngBFHuElmR7Dtmq4hoa0?=
 =?us-ascii?Q?xqew+fnX2iO1aWLh6tP7Dd+SUqPuL36bEkhgaCfR34zLmAS2pi8SNatg0lqW?=
 =?us-ascii?Q?4fla+sfhJGDssnA/pkxIRsACNhrH8BDGWfd7Cdx8kzP25AaByjra1iony7t4?=
 =?us-ascii?Q?QT/dBRzPbPNExggrPzFKmYeiEqz0bKvOZ3Fc97lH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2ebc61-f4b6-49b9-a66b-08dcb233d78b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 14:11:31.3804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tw5QSE5BCY1BzmPBlblesIUZGyUp0uwsz9vsqhXtgYOIkSkbfcXlWA9IHW6gbmI/IaOblJBw6Msi6TEtknm5/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9831

On Thu, Aug 01, 2024 at 02:51:06PM +0300, Dmitry Baryshkov wrote:
> On Thu, Aug 01, 2024 at 02:49:06PM GMT, Xu Yang wrote:
> > The first port of USB with type-C connector, which has dual data
> > role and dual power role.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - modify endpoint label
> >  - fix usb phy tunning property dtbinding warning
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 104 +++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > index 938347704136..ef9b821a0ae2 100644
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
> > +		orientation-switch;
> > +
> > +		port {
> > +			usb3_data_ss: endpoint {
> > +				remote-endpoint = <&typec_con_ss>;
> 
> Where do SS lines go after the cbdtu02043?

I got your point. I should represent the signal route on dts even though
the driver doesn't use this information.

> Also could you please point out the datasheet for the chip.

https://www.nxp.com/docs/en/data-sheet/CBTU02043.pdf

> 
> > +			};
> > +		};
> > +	};
> > +
> >  	hdmi-connector {
> >  		compatible = "hdmi-connector";
> >  		label = "hdmi";
> > @@ -535,6 +550,49 @@ adv7535_out: endpoint {
> >  
> >  		};
> >  	};
> > +
> > +	ptn5110: tcpc@50 {
> > +		compatible = "nxp,ptn5110", "tcpci";
> > +		reg = <0x50>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_typec>;
> > +		interrupt-parent = <&gpio4>;
> > +		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +		usb_con: connector {
> > +			compatible = "usb-c-connector";
> > +			label = "USB-C";
> > +			power-role = "dual";
> > +			data-role = "dual";
> > +			try-power-role = "sink";
> > +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> > +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> > +				     PDO_VAR(5000, 20000, 3000)>;
> > +			op-sink-microwatt = <15000000>;
> > +			self-powered;
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@0 {
> > +					reg = <0>;
> > +
> > +					typec_con_hs: endpoint {
> > +						remote-endpoint = <&usb3_data_hs>;
> > +					};
> > +				};
> > +
> > +				port@1 {
> > +					reg = <1>;
> > +
> > +					typec_con_ss: endpoint {
> > +						remote-endpoint = <&usb3_data_ss>;
> > +					};
> > +				};
> 
> SBU lines are not connected?

Not use SBU signal.

Thanks,
Xu Yang

> 
> > +			};
> > +		};
> > +	};
> >  };
> >  
> >  &i2c3 {
> > @@ -704,7 +762,41 @@ &uart2 {
> >  	status = "okay";
> >  };
> >  
> 
> -- 
> With best wishes
> Dmitry

