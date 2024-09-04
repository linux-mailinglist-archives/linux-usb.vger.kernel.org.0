Return-Path: <linux-usb+bounces-14628-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0F196B1DA
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 08:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2E221C25812
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 06:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42C113A26B;
	Wed,  4 Sep 2024 06:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Om/Q1BOX"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F6684A5B;
	Wed,  4 Sep 2024 06:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725431737; cv=fail; b=EO7wtsw07X9Y61Mh2m2kM810+rTJVz3bQEuFjqSmdoPXvEWmHVzERtjyA7YOm0FeH/NnKnJlnl9vkPiLugmWg0DzNmoq5pAmiR6am00p348tA1UvpQSrKk396p4VfCxuWOL2jDJIktR7PhwMVTjP5gJ1KpcWf+47vEztbtnJtvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725431737; c=relaxed/simple;
	bh=jNpQbDY7yN/iHdfGcbXqdzJCPsTnnl3wPX8NUwXaFAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U6PH8IEqj2wqZYMCirt48fRyPNGyi0R5pzb1F9ZVy86Bqvuij8jRXDIKALCoDnzh8mIbZovYymfuTImUq4tZCIVkdTF3x/jypYvYPfVzty49vOFhhcNLKxOeUM82MBF/cWHASrlGFtWRjMxC+4PkrKoOamT3lVf/YtujNnlgHz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Om/Q1BOX; arc=fail smtp.client-ip=52.101.66.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0DPOLUfcmECtc3xLZc4vlIqu7YVizzG5xTEtcpcT0sFrnc4qGu5p7Uo1Z6Mzc39c86xZNBVr25DMYOMHnWZsJBq7B8lqu+vfxvLhTkUDLeg/0JA1tS4Mj/njmECdCSSiR9WwllRqGw0iyp/7YVDjWZDXcsk6178LBML312lOXcrLOX2j8IaAf7biVSXF1EsBbopdfoAdlrQJQCY9rHVELGCUpoKJ5t+UnNy55Y4+Q0tsOM92NXj6x41aZjqM3a9ftLsWSNYMRmGGP4oT+V0MvLJw0L8wdrHO1SmYNetIurxc5mca7BhGGT/s4XiwsQNhcGCrjVGs4bFOZP+BEfX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKN5VA4Rtqc2xpY12vpVMU8G3OjC40SUQ7yEO59OXgM=;
 b=XXv9g8Hg63beDLqS/mIlf3W3HesN/6U9wkY77iH2eDrcakww6862jbTzNU36ELJAI1i+CwfEDa7nwrWEYXM+INdaj/GtgVUE+Ux7Th67G/Lb19yY9H+HFjHcSBHPTqatonGn2uSSOIkmk/NAAkqzk2fCHXBSrG6nI6Y8WCBVlHXktQAxhzwxzKja1iJ3q6r+AZuP28DOKgAuSyISOC9Ajvm1iwUY8LFT1+XddZcNDT16fphOxUTJFO1MQJIkrg7u8Ycx4pVD3fqtcMKO7UKN3bASlHCVECM0WaDVgD9gcHn3CovI9xrNg0zGoptiUzs7P7p3hGuopgECz6LNYgUJCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKN5VA4Rtqc2xpY12vpVMU8G3OjC40SUQ7yEO59OXgM=;
 b=Om/Q1BOXV/O18Z/t/+0xcH4DGai3w4YCDLUW+9mlIyI5F/uIzZOstrBF3DjsQLf5zY7WfaNyTSmvAxYboULamEOT/fcKp10/XawU1HFjvxhj70fj45a2JACetxUUZh/CmHJ1wNvAUFPTsi0kZTJH5F0H+/OirVUg53ns4D6yKCflRKvkUdKZuHMEPwHT+J+UJRPM9bCVTI2ne+VlvxiHj0jXfC2WENWTpd+/NV1Z5nzKaDS9vifgezvET8OZe7X1B6Wwlpb2r4uERS9PxRVmac+o5rdyDZYTdoeq7IC0jVEZq8WvGBYIefc5lMRaRQrncVQKe/WxDjsvFXfo6GX4Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB9144.eurprd04.prod.outlook.com (2603:10a6:20b:44b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 06:35:30 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:35:30 +0000
Date: Wed, 4 Sep 2024 14:34:07 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ARM: dts: imx7ulp: add "nxp,sim" property for
 usbphy1
Message-ID: <20240904063407.qjvevd4xhvohg4cd@hippo>
References: <20240903075810.1196928-1-xu.yang_2@nxp.com>
 <20240903075810.1196928-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903075810.1196928-2-xu.yang_2@nxp.com>
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB9144:EE_
X-MS-Office365-Filtering-Correlation-Id: 972e00e2-162d-4552-2790-08dcccabc580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cjUCfK+L4Wc0FnbHB8Ca+EJxtuwCS/Qz89CR12Dwhsz/MVt/ySVBfpvwfkW+?=
 =?us-ascii?Q?BhlHhIKcqySYj1mQZC2HgrA7tW+f+CDTIeRVM/gJKlWCQsdSUm/TCG/KycQn?=
 =?us-ascii?Q?wRw0g5qcpdE1jxfM0G+AvNq6iAShhLvMAvjf5Eii4xMIxLDm5nJ+MHt2hdz+?=
 =?us-ascii?Q?4LlE4olGokJ/li7cPoEevu9ZG1XXbUEHBibgJMqT8i/EaLcOp/2GSBH0eoNa?=
 =?us-ascii?Q?07MvYppTpacHvNVD0NVtNX9a4VUgYOQ9wKffuKP8ZmT+uAO2O4n5NWfXJxjF?=
 =?us-ascii?Q?2MKS8Q6ZgsnG0abk7upaKUfExsPPZ4IhBPVlwSh4GnvKYVKSZrVSKNCWkAdS?=
 =?us-ascii?Q?y884dk5ekn71iambp7hJt6Yt8qsskSv0WCgyJIXKjxqvJYw7QeTdqe0SNRp6?=
 =?us-ascii?Q?vY8UCFkOCah1Acs5B1DORRr10PkY7SkCzzalMWYrlrV/PuYsWviPiUhS2rr2?=
 =?us-ascii?Q?h4JAiEoQ9lqVAUEIPmEXM1sakZ4xDMTTICLqtiEGWkF6fsuThtepolMzD5TI?=
 =?us-ascii?Q?zlzoCuuxebp0hYhm1QcqIFUa+IL/DEi1OVMhuPVLiSG0ceTBagBeYnvRskpf?=
 =?us-ascii?Q?d5qVoKFs9kVYVsqDKqYwZseaE438YTR6QbRzRdyTFglrvG5RpGlKukOLsX/y?=
 =?us-ascii?Q?BmhtehBfq3EImCjhE129Lj5U0kh7OJdaLXGomcayG/pYJJNJQ1yqzBgzOBoV?=
 =?us-ascii?Q?aMjoa1GIuiVR+yVBUjlxFlNUV4qlSKiNJ7UUynWz8tU/k93tmi7CDMW1dchc?=
 =?us-ascii?Q?ZRvLf2TYD2qCdw4A349njnCI6lORliYD7qDH4rHrqafLAindg7aXdiTox4nC?=
 =?us-ascii?Q?ELVyE2C05fFVK4QE/fDxfJ0jNH4l6tVst7zn2ChvyA5lRDzf8u7lItRnpvRQ?=
 =?us-ascii?Q?P0erd6Co09MxkW8pj80lj/0LdqCOj1O9zn5RbLjUuw2TeWW3yYB4Ge8BlLgO?=
 =?us-ascii?Q?dET9KA1W2hlZenjjAd1tUdbRK70dJeTO32wwkt2tGcll35J1xr3mCKtNIe72?=
 =?us-ascii?Q?sGZcVIqwfhjTuahx5skvrm7q8tqKbg9kLq39fRmYEP7Meazo9CiLkXKFToAd?=
 =?us-ascii?Q?j8GREzZ/s0+3gPX78Da7jrxwWBzquVXPlkAjhZ8kjL9doDm7az9daMvYzdNH?=
 =?us-ascii?Q?zcgtqXe/apxkn7bTfZtnG9b53IVfYVbsQTVv3AIgPx1Dn1AP0nU6YPnD6DBS?=
 =?us-ascii?Q?QpAosDUUIzF0x8wMvBXQ7j4KUD6Ggh+Tr6oU8trfCbysus0NWW3rb8uVK6d7?=
 =?us-ascii?Q?nlPmjXT8ky9tYlRSfGkPLIwZIulNPX9c8omLUTwH1DVHnaAITtsWP4s+SmrR?=
 =?us-ascii?Q?aoJt7tH61fJPlNaHLSm5575yvHEuKpLKPlsBUg9V4T94o/ehXmxH1zgSqVS1?=
 =?us-ascii?Q?ejIxLM8eMNeaiH1mhh+b1Q64t7GiTb8aFixHIuK/UEElESTSIpIXMZ2JSghY?=
 =?us-ascii?Q?jGogJG1nfUc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WIQYW5arMid3ecwz3SvOsrNDj1KMMq9rhG8dXk1xD94eD5qQgb3+uUW6Qy9I?=
 =?us-ascii?Q?N0X1Rp+3brAYTuw8yuxOeMoogye8I2n21hVPhbyCgOx4N8rQbrrrsHFirZMV?=
 =?us-ascii?Q?zYVwcL0NfE6YsSa5yoKhI7aBWMlx02e6nCp391iKeBNrMrxI9MoJhBDolKng?=
 =?us-ascii?Q?xpk9rnS5mzo1E+3l/wz9m+12DeQCMlIXdHkti0eo0/kE0CdI0JMuHQX8c2Ku?=
 =?us-ascii?Q?vTgGK6NamYKvsZPrtg/nUe6FTOBfIkWxZW/ms0xPw1WTLecv0M2YNSfCh258?=
 =?us-ascii?Q?JgVJd+wHsPY1kUvAacRfO3sHjMSLFtCdRAC8TK5zkWRoSI4UlkXC+oxc3TdB?=
 =?us-ascii?Q?oyaMNs4yMdD6I9PVU5nMnhCI1WPlNjOZ3c68rCCAYS7oAOBG2Q/obInCCd19?=
 =?us-ascii?Q?n3d5VwRDELJBnKZX8bclVTod3jc8P76C7LIApt9+chIG014xGcyFjDRyd2Yf?=
 =?us-ascii?Q?+gKNuciWjAWUEGx1ovroInxrKr8NBTwrku0vo8tkkFv466oO515HdvAhOqz1?=
 =?us-ascii?Q?AtWZqxO+oGrNq9AgueFo89uYB8B+tC8IZw5QP4hqHCR4bSNkkC/+qOr7WSo7?=
 =?us-ascii?Q?dA/nuzOZDcB6LZAAfqr0sm/nsGf6CLRPqUaqudai7yJLZiccInUej5KRGXl8?=
 =?us-ascii?Q?abIZaqWYAxkzRQY9nMv8p4Yqg4zccaF3w36Ko3OxsJdxo+4wn+H8MVTW6BxN?=
 =?us-ascii?Q?xHqOt7yVOznb8ovf/D7hGMTSopILObnWV6ragYRMJqoLVm16t3iYrcAhQ07H?=
 =?us-ascii?Q?ockHa31VLUih/qLb9rLLIYwQep1jeXKEC4+i21ACxTWddIcLk4d2hMgM7dw5?=
 =?us-ascii?Q?yfVDecHEZAz/7KgvaPG46GPtDa+plAivbhuKK2zv8ydEx9dUp/Z7+89L+tb3?=
 =?us-ascii?Q?w4HSlgnpd5JqFd7GWnbincgWLN3ysdD79Q2nqixIaelqZCgqYZoLOfytBdgT?=
 =?us-ascii?Q?g23kLMz1t/WNZU+41zkmAg4Vc8uqSn+RdOVl3Rz8VmqplW/vAXdbeScBCyv+?=
 =?us-ascii?Q?W/QBNTtFX04zp0WI+PtJLcKYCRflILw++sA+BFrEnTrJw0K/hSdPaeovtOA8?=
 =?us-ascii?Q?qxGkJDsKn7g/uoYEDjxyKaHPW8g9AMftiTKJspA9z1qUg3YyMnjIoboZ7pRT?=
 =?us-ascii?Q?QKH761sKi6gv4iohcyLX5rDCWWKErpBqWaY4h1P0KGltNyGQfdVJ+UQevh7+?=
 =?us-ascii?Q?JsyoiIcY5hU+RFu+E2lLejnXPtneVzyJJKAOzD4ZXlWx/2WV968t2rAQV4/9?=
 =?us-ascii?Q?nROX4u8nHMgXYSZ+SqHPydNg1lza+7WVOOi6R3ogX1P9e3D6SDn6Do5fdqMI?=
 =?us-ascii?Q?HKNvpMK9XuOtVV578vLTULGi29Z+72MhmdmxoqVxM8/0DgHOYJJie51qiaX8?=
 =?us-ascii?Q?YFOkTNqilb2VRv9I4N13Ed2QDVta8MROq9aos2SmdAxoD1sDLiblRsHxOf2o?=
 =?us-ascii?Q?hascWRDqIKV/0FrXmjlZN4+0YAbDch8hkou78fbrbNdG9c8k3i/f0Wqz/I24?=
 =?us-ascii?Q?B7vctShy0e/CxY1CulTaQI1Y85bZbezOTbZMZw/4go428LbEGLcekfclZMoy?=
 =?us-ascii?Q?bkIHCPyQ7kUbjovAqGkaoc4KbQsKKiVJgE/ppLQU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972e00e2-162d-4552-2790-08dcccabc580
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 06:35:30.7761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNBztcp/A9WTu6jlVneGZiU/1eX7KSn36eE17GtWJwyW12vrlohiYl0SL/USSkShHaubyWZs9InS+hMArIizag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9144

Hi Shawn,

On Tue, Sep 03, 2024 at 03:58:10PM +0800, Xu Yang wrote:
> i.MX7ULP need properly set System Integration Module(SIM) module to make
> usb wakeup work well. This will add a "nxp,sim" property for usbphy1.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - no changes
> Changes in v3:
>  - no changes
> ---
>  arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> index ac338320ac1d..b093f2a447ae 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> @@ -214,6 +214,7 @@ usbphy1: usb-phy@40350000 {
>  			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&pcc2 IMX7ULP_CLK_USB_PHY>;
>  			#phy-cells = <0>;
> +			nxp,sim = <&sim>;
>  		};

The dtschema patch #1 has been picked by Greg. You can pick up patch #2
when you see this ping. 

Thanks,
Xu Yang

>  
>  		usdhc0: mmc@40370000 {
> -- 
> 2.34.1
> 

