Return-Path: <linux-usb+bounces-12277-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5DA934FB3
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 17:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E3931C20F11
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 15:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E102A8FE;
	Thu, 18 Jul 2024 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="YQp0y6qw"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012036.outbound.protection.outlook.com [52.101.66.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C8713C9CF;
	Thu, 18 Jul 2024 15:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721315592; cv=fail; b=XNH8v5KiB8DvSFemWYLf2e/UW/WmJPAbgT5xeQZ+rN9Tr0Q+DUqjuJfxyK/tyX7vNM31CdtzcK0Xe2SXw9DS7uOMCn58CBIL52CaLYyiCC6AqB8Lvl9M0AClMnfZBOH8xYtk5+/zTiJmx3/+wkdfaBjG8zlRJuRbHQCFO3fmtX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721315592; c=relaxed/simple;
	bh=Tr4FPw1cHJ9Qy/GNoTjjwqe98Fz6uOl05Ge4sUk9iVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V1GQ+0UUR4tzuhBG9ksGH1Tib7m8bfCfHZadB/gkSupiN9A62u9fGYCrZizK2RO5z3dwIzjU3oOBrO1NyzyY8ugAd7NnPCeoOSbna3oDBvs0ffBxJEo35AnbWrDaXlR0Lpl5VkDmN68AkgKQG97fg/X+bFZVUY2soSXRvNjKgKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=YQp0y6qw; arc=fail smtp.client-ip=52.101.66.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdJWWEJlVhN7+PrTdvmr/Jbnk8arldGtzYBmjib4FKR+mMe+qMi7J5EUDc6zYlaokxX6WS5wtTduZfT+NIkbhQi8oQta6ILkWiF/PUPI1K1uHumGd30wdVePfI+fLxtGS8+Vn+JPWVuaLjvv9l4KA1R4gDKDYnt6e41fiq8X4unHrk639adutu6qll/nVbyAcdJjlTj0xhMWpClcINLb/dhVSlTFuk2KiYp3U+Fwfvp6T7yCWibha1JUdlrSGexXovX7ETXdhLqaLSoiROqMKpgTubiGfXVWMYBxkvro/NU1XBXCgJ/c8zlB+19TH3Mr4gj7wwp0wEMX9rBPX7SiOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcI91chJCd7UH0xe8Spm97L1/jQMroAJa4zCG0ZRby8=;
 b=R2oCnPa4M0EY3n9zrFkBbUMQgoXtP9G6IDVaQaXH3kgxKbs3CBWkPyZO93GKllQo96UoEKmHHxCzaFcIikMGV9Z9eTgYHRS4Wy8A78d+SGogquLaxK9hqWNYUhObGzNG1L5RNOfjEFJJpTnHHYgDqs6v3njlz+2veRFI16EPA5pUqRJJZXh4ocB1AIYSViARaBTlgVLMUigjirN69wC5bgdhHdVysrsD0gocQBH2MnhMybWFFqdiPEL89ciMDtDnWbHp2fEni0WN4ShzeVScDmGtwKtekOoZpSMeRE22hKIS3fjOW6jSAehiJs/M5kmeBQcMFhCzF8cpW7/oT1OMTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcI91chJCd7UH0xe8Spm97L1/jQMroAJa4zCG0ZRby8=;
 b=YQp0y6qwRozDk2zgF4NuCZX0F8UaetB/5A7WprgDv1C7QFHYwcmI4e/GhaGimh2sa8wle9epUaGmtfKRtjLT1AlytfKFNZpPirY0pItq7fs5QooJEvmKXvlKQTxP1h7zc2m24RTzLJqQfVrMuoX0GcjctgGzkdaL4Sn4smoQVew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9277.eurprd04.prod.outlook.com (2603:10a6:102:2b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Thu, 18 Jul
 2024 15:13:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 15:13:06 +0000
Date: Thu, 18 Jul 2024 11:12:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, peter.chen@kernel.org,
	herve.codina@bootlin.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH 5/6] usb: phy: mxs: enable weak 1p1 regulator for imx6ul
 during suspend
Message-ID: <Zpkw+HLGndoP/0xW@lizhi-Precision-Tower-5810>
References: <20240718102637.3964232-1-xu.yang_2@nxp.com>
 <20240718102637.3964232-5-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718102637.3964232-5-xu.yang_2@nxp.com>
X-ClientProxiedBy: BY3PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f96f0d2-d0fd-4fe9-7ec6-08dca73c2053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G6ws+ZhUUqSz97wmb87YaLFjDTHR6zLAfJI+R5dBrn1yi7LbNEPYk+cDxc8Z?=
 =?us-ascii?Q?SNlNyltyndOIUHISn9W0mw8gLAWT8Y+45ANgOjn4peIcLtwgodFqQFshYzmt?=
 =?us-ascii?Q?xjSQ6YTV6MRMjXNuZmnLZWfL4GL/bvJ8mV4Ah9SdInxBqS5q7M6U9G+mUoEF?=
 =?us-ascii?Q?Nf5NMapgB+iuIecFllUUwO13O3K02rTt5KmcLGyf0rrXx/wBRsHaV3Iizwj2?=
 =?us-ascii?Q?BEbzWpnysW25jI4oEVGoy4L7qHpVk8ECmFW1Fn6Ih1MaB+It1gahxMNQ5F3F?=
 =?us-ascii?Q?UjOKEV1AJlAmM+qdOZo6TrWn8914gPMebPzYDMvVkVmSXillqb6ojq4+p/Xi?=
 =?us-ascii?Q?htibc1sj9WxObnvk+pQBAZPMfQpfXxIntMallXb9Xt6jOwf0ROjGUsvsggCW?=
 =?us-ascii?Q?jxeiiY2lMzomJ4hpyH5eFllFKeJn3wBreroMs5aWEAjnSqH6gefMdFkZEN5p?=
 =?us-ascii?Q?8nAFgJSzF8o3SKmZkBx6X2KyEJJmfQLxl40teEP9lGr3gVsMu29rNE+YcRAa?=
 =?us-ascii?Q?zl8j41t4yx1uHsbKOmoBihx5fpdywn/vpZi3dOf8K4rHHHckvIYXD1g9HLuo?=
 =?us-ascii?Q?KJ24My/vMnuv7UuSi/DTm3M78Qf8aqaZmK/0aUWLTFmvl2DsyANjiAuICt/T?=
 =?us-ascii?Q?3QDQaIqXfXHfhQL3CV/4SEyY+hJn27tEh+sPHBjC0qyL+OwHBYq7IJctJkcq?=
 =?us-ascii?Q?I3wAw40Upf0IgXqcis028DXPjvWQko9valTGnwMwTuuUkZBQHP9yvqkgjY7C?=
 =?us-ascii?Q?KdjyzBGY61DK+ShIKyjZq/HxPF6jQmErR+lxAcy9sKeCW5oERdvYb76d2HsH?=
 =?us-ascii?Q?3z1qMlQ0BxRZCnCKl2G/i4fnQdu04e6YfPE+K4r5kZ+/TyRqk/xTp8uz1zSF?=
 =?us-ascii?Q?s2knDKPWaRtYe+R2po/lG7K9uq1HVq/kPJB868VFkI7YKNze5pR/sIK4d3td?=
 =?us-ascii?Q?IU7CboxulPs9A0/sp5vBflMhlNqN3yP9e99BRo9uvdijGei/0RWm9vLFgauX?=
 =?us-ascii?Q?/megiJNFr0nHpHemWHEM9PzZhKVul7bdEQxLWuq7jI3DCN8cqK0cBLMFNzW+?=
 =?us-ascii?Q?Y7lyYZv3gmrLtJakNPg7QudRDdVqsNKdF5i+1Wbr07+Ae547k1dkqBqQofOz?=
 =?us-ascii?Q?HXRFb1TghIZ70El21hsYnZLuqpcdJjk/SqudaHwQ2SWawdlV8GdtcNW5GKg4?=
 =?us-ascii?Q?WIhHzIULc6llBM9TAieHXBB5O7JHATUTYYpxiS9BylzeMWzhq8Cjy7SUPfxz?=
 =?us-ascii?Q?RG9AHOQt4YGoSEraFKOkdqJPOgTl4fbAJj+A4TpCHQa+LfOHLy21Skwy+UMH?=
 =?us-ascii?Q?Dunirr+/lbnGkaphLM0P0TN8f3wblVtAjUM15y04RbIhnI5H30Ryg8SKEf7y?=
 =?us-ascii?Q?Q8isPmZP2mPEQSuzy6rwfDZg9gH/W1JxNdDPo+fiHU/3ceh0nw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lMSxnoZpzq+ERdEqq+QdDMwbBUjwNjaNWGfcvUeRpQDTu7qHdUAXgRJWthA5?=
 =?us-ascii?Q?BAIwn/IianUSd92B+W9Lsiz7Qsem/fK2rjRP61XG3IkF+8MepBSt7LkCsp2V?=
 =?us-ascii?Q?dMlqgyceiJLTjnI0K46v/ryAc1w20dExdG2M0H5UaUNRWDBMeFJEOQ2OD+rN?=
 =?us-ascii?Q?wZdfRmrd8oZgNsbbjkgmS1/ea30O0zLHdEyVEUW12LXAz5XyrlIpkTO18jWd?=
 =?us-ascii?Q?lfEhoR0FwWIwYu4w9hLK1ttL0Gta5oMMbS3nuRczGZQEcimi4yk5nQyLON10?=
 =?us-ascii?Q?UwNpq8DFZsVMWgqTh0Sz0mjr7EBfiEXnfbPWzvLcGnA2gwwCAe8u2NM20CM9?=
 =?us-ascii?Q?DEyk1jIFbVgrDvJWGptvX65cznvHCdJzK3f8DrRlMUl5neZpm0YZepbBW8l3?=
 =?us-ascii?Q?EpLiaIhVhkWqNKWJzHj6rKB4VzwPiCczbRl4duFDymqNn8tU00BNb/QFIJOu?=
 =?us-ascii?Q?1vWml8T8ntQsfZ3Ownjru0pHnbW0/yKYomTQ0a7ZPU22ic+vgvfD2i/1XHYQ?=
 =?us-ascii?Q?FzOis0FoA1K4q0eT0XCnbKBoZ3L+UWXCr/a/i92wocGHExpqBugfMJ1HO+q+?=
 =?us-ascii?Q?Jn3X9qIfBiRcXKugXwXpbyAKFFgj4By1REwlWfXsdtZeKA2EDF9Wz5DrGfoq?=
 =?us-ascii?Q?YnC7jbC12A2MvMfu/8aR8qkX6Mk7KxEZ3LliGWoDpyIw2vb6PWJk3wemGuQc?=
 =?us-ascii?Q?zTj8Lm9J3aBYcJZFBW9v4vRMlW5cUE8LNNVj4PefyhZWIuAWT7ygLUKx1084?=
 =?us-ascii?Q?cKrMht+c2aaoaDFqEX5EKzFIBckzSiwkTO/QfitUyI1Rtmooj+jZ0qH126OJ?=
 =?us-ascii?Q?wFMz29bvEAoJXRez2Ddc7uFl+b0W2EiqtSWIK97sUW4Qw3UHVPesGSwSBWbe?=
 =?us-ascii?Q?v2J+Mk8GgIDgDwgMBBTNk+T6eEQQjDE+vCqPXubaKHjJhUYF52lhAvwDM+yw?=
 =?us-ascii?Q?/GvNp6AVKbkB7Fh/MzZka/jjTLTbngG1zIw9y5kKF4AHrZsfitCCvgqKinqX?=
 =?us-ascii?Q?55Qijv32jfWQca5dMdli+52z3boU1M1Ix+mxAV19NG0gDr51acB5LaAgRAaK?=
 =?us-ascii?Q?OLYjPFFezN2k+0fO3NhmBEU+F/yfrsXXQIpcUn6etvUWbfb1q30sL667fs4S?=
 =?us-ascii?Q?xSnneotsk/DfE4o7RBWiR8rETYgIZI2aRqIhE+5X5xNSwRBXBzlgXL44XAEs?=
 =?us-ascii?Q?iWjI0m+zpeHFAPj1hz1X2t49jvUJNYnP0qjZubNtX4L8a0vDbGil4QlUmKRV?=
 =?us-ascii?Q?q8NU8JmhQ/DGGZx+MKbmiP8ZNJeALklOFtPx3WBF8QqnQ3oLGFkFaqOTA2ay?=
 =?us-ascii?Q?FbZYmSJCNyqXIfkZDPpkivFUSxLdw8MPaH/rI3v+aNyak2tS+WSGdGm5SqYb?=
 =?us-ascii?Q?MYSVVVkFpZMAVGXX0hY0Nd/6ra5U1ECgl3UMcIe+HURoC9jD3LLffduGmKJF?=
 =?us-ascii?Q?H0jyOZv5czEt0ywyVJClnmZf+dhW9pP+isWPfM8yp0/py5F4OkCkidJXcqdU?=
 =?us-ascii?Q?c/XnqFfnbhAurkKmfQWmLa2lC6o6d1o1rbCSs28a1HNXhMCVkqi2aRMtbLEo?=
 =?us-ascii?Q?4CBxrSGfqTSFXulZ0oU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f96f0d2-d0fd-4fe9-7ec6-08dca73c2053
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 15:13:06.3272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xwgg9BtdpM/Zau3/a0/Sbc3e8gmNpCiNSrPAIVYTSxp50ZzLTeStOD8iwK2inqysoiqQatWLR6/3N87J9H9CZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9277

On Thu, Jul 18, 2024 at 06:26:36PM +0800, Xu Yang wrote:
> For imx6ul PHY, when the system enters suspend, its 1p1 is off by default,
> that may cause the PHY get inaccurate USB DP/DM value. If the USB wakeup
> is enabled at this time, the unexpected wakeup may occur when the system
> enters suspend.

1p1 is off when the system enters suspend at iMX6UL. It cause the PHY get
wrong USB DP/DM value, then unexpected wakeup may occur if USB wakeup
enabled. 

> 
> In this patch, when the vbus is there, we enable weak 1p1 during the PHY
> suspend API, in that case, the USB DP/DM will be accurate for USB PHY,
> then unexpected usb wakeup will not be occurred, especially for the USB
> charger is connected scenario. The user needs to enable PHY wakeup for
> USB wakeup function using below setting.

Avoid use word "this patch", "this commit."

Enable weak 1p1 during PHY suspend if vbus exist. So USB DP/DM is correct
when system suspend.

Reproduce step:
> 
> echo enabled > /sys/devices/platform/soc/2000000.aips-bus/20c9000.usbphy
> /power/wakeup

echo mem > /sys/power/state,


then some error happen. 

Or just remove it.

> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 32 ++++++++++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 627733a982d1..dcd032678814 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -71,6 +71,9 @@
>  #define BM_USBPHY_PLL_EN_USB_CLKS		BIT(6)
>  
>  /* Anatop Registers */
> +#define ANADIG_REG_1P1_SET			0x114
> +#define ANADIG_REG_1P1_CLR			0x118
> +
>  #define ANADIG_ANA_MISC0			0x150
>  #define ANADIG_ANA_MISC0_SET			0x154
>  #define ANADIG_ANA_MISC0_CLR			0x158
> @@ -123,6 +126,9 @@
>  
>  #define USB_PHY_VLLS_WAKEUP_EN			BIT(0)
>  
> +#define BM_ANADIG_REG_1P1_ENABLE_WEAK_LINREG	BIT(18)
> +#define BM_ANADIG_REG_1P1_TRACK_VDD_SOC_CAP	BIT(19)
> +
>  #define to_mxs_phy(p) container_of((p), struct mxs_phy, phy)
>  
>  /* Do disconnection between PHY and controller without vbus */
> @@ -197,7 +203,8 @@ static const struct mxs_phy_data imx6sx_phy_data = {
>  };
>  
>  static const struct mxs_phy_data imx6ul_phy_data = {
> -	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
> +	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
> +		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
>  };
>  
>  static const struct mxs_phy_data imx7ulp_phy_data = {
> @@ -243,6 +250,11 @@ static inline bool is_imx7ulp_phy(struct mxs_phy *mxs_phy)
>  	return mxs_phy->data == &imx7ulp_phy_data;
>  }
>  
> +static inline bool is_imx6ul_phy(struct mxs_phy *mxs_phy)
> +{
> +	return mxs_phy->data == &imx6ul_phy_data;

You'd better define,  MXS_PHY_POWER_OFF_AT_SUSPEND. 

	is_phy_power_off_at_suspend(). 

Actually, you just need know if phy power off instead if it is 6ul phy.

> +}
> +
>  /*
>   * PHY needs some 32K cycles to switch from 32K clock to
>   * bus (such as AHB/AXI, etc) clock.
> @@ -891,18 +903,30 @@ static void mxs_phy_wakeup_enable(struct mxs_phy *mxs_phy, bool on)
>  
>  static void mxs_phy_enable_ldo_in_suspend(struct mxs_phy *mxs_phy, bool on)
>  {
> -	unsigned int reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
> +	unsigned int reg;
> +	u32 value;
>  
>  	/* If the SoCs don't have anatop, quit */
>  	if (!mxs_phy->regmap_anatop)
>  		return;
>  
> -	if (is_imx6q_phy(mxs_phy))
> +	if (is_imx6q_phy(mxs_phy)) {
> +		reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
>  		regmap_write(mxs_phy->regmap_anatop, reg,
>  			BM_ANADIG_ANA_MISC0_STOP_MODE_CONFIG);
> -	else if (is_imx6sl_phy(mxs_phy))
> +	} else if (is_imx6sl_phy(mxs_phy)) {
> +		reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
>  		regmap_write(mxs_phy->regmap_anatop,
>  			reg, BM_ANADIG_ANA_MISC0_STOP_MODE_CONFIG_SL);
> +	} else if (is_imx6ul_phy(mxs_phy)) {
> +		reg = on ? ANADIG_REG_1P1_SET : ANADIG_REG_1P1_CLR;
> +		value = BM_ANADIG_REG_1P1_ENABLE_WEAK_LINREG |
> +			BM_ANADIG_REG_1P1_TRACK_VDD_SOC_CAP;
> +		if (mxs_phy_get_vbus_status(mxs_phy) && on)
> +			regmap_write(mxs_phy->regmap_anatop, reg, value);
> +		else if (!on)
> +			regmap_write(mxs_phy->regmap_anatop, reg, value);
> +	}
>  }
>  
>  static int mxs_phy_system_suspend(struct device *dev)
> -- 
> 2.34.1
> 

