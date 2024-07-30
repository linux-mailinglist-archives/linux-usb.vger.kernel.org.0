Return-Path: <linux-usb+bounces-12606-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ED5940584
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 04:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD4CF282A72
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 02:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F274441E22;
	Tue, 30 Jul 2024 02:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Dru6wQ0H"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7DA33E8;
	Tue, 30 Jul 2024 02:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722307869; cv=fail; b=ltEkmKbWXYZfFXiivrsF4ioa1P0JNOXwyhTumS8zfWQ9gDDzi6dlMTLDMB62377R+lka1choHucv5hml6lDwcGLDisUkIClu3p6r/4MG70A/9VCvk01buIGI+iJbGKD9nvbXu/Q8Q0jEFmXizReOy6R8SKpJ1eIRuiX9LPkp61g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722307869; c=relaxed/simple;
	bh=+8Lh5aIM4B0gpGG0ZZ9E0iOHmbOIx5TPRO3TRYiBAuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QMpou1l0HWwU9ZNqzJtzzpv5fLwnVK0yr7fiVFu/TSd6ANrgjR8Ri1bbOTmHx0m+JkPEs8XatDdpLGXiOsCMo6M4URIO4RCm6n95IwAtBuIe3rzgEDcJOvQfPcv3YzCRAMZYzGLSlqoVYN+gM84uto117K+p+UlZQTlj0LQ4eg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Dru6wQ0H; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtU7j+dV7OzuGE5qHKR0WQJ2mkxuiP0ay+uHB4jvcIN3kTh/HrtsPVMKRnQojKF1LmYhwsj0CnwM4VsH+g/Q0nL58bkXCCs84/7pyQ2SWxWRsQXQA45Uybyo4MyWAADTHKYEr3oV+AFfCNWAyGf0UC3h+ycZZEcE9jFuqn82raZgPJIKSn/sFVbryxkaYZsGhngapASJUBh8znVZoVtUHpg28gTfUagGx+gR/CbuKzTEPBw3xpI7Rt/JK+1xvO4HnINCip0SEDD1vg6zWMah5BA0bc3IiK4uWke9ApGCFKdi4iwcLgJiQajnk5X5ca6bx0GWcA5WkroH7QjZHEKRYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dknsd7jrKHMaVQ/tRNUPKiSpxLJAKE6nZ/cjxX0SI8c=;
 b=GSAdag8SUmu4hkY27eDGMJSMGxGjWHmk35i3pqNgDgjhYkM+NENus7vHNjCQb9p5uNYMgHeu0L9Ln5WoVShWVlY0AZSYgb8+OC+oM9mmhdMWpIONqjc4gl0NnapZhx2IAjuWOX0GQ1d2LswIRZsBEaa5aJes+GgYofrfqlDz5OMw2fTptjCjvwXxupADAe2SZlyzGPTiF8GJ54iJVmgiu6yAYGXKvM5tqfOcsDXzIxSgYc9q2xyQXfr5xceHJyBiywzNHeRr32rMnq1zWLt35pPaV+gs27vXWTc8UBTdIFkiXuayd7r15W8m/TAKinIF0Fs7yrETDrE96an7cf2aMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dknsd7jrKHMaVQ/tRNUPKiSpxLJAKE6nZ/cjxX0SI8c=;
 b=Dru6wQ0HCJzLoCm7IyY7J7btB3VhfSBPpyb7j9FRBVBwlDVahb7Og3ftS8Wcv1CnVhSkOeZeCyR68UJwlxAhbk1fWX4jmxm0GVCkPBjCg4HkVE3HMhXIQTN00TNBF2pcQOPFl6d+OJa19iE1v20qbLNdLo3fu2KFU1aPoI7e8IgFxvBOpE1PDm+DxW62jdytQUB/YVOj9IJsKPFxAnJqq/mal6eQ6GN77/z6OEuMome76e5rQ3+eIBa+B4bymeDLvr3wyG4U/Jpy5Dw8cn5NZ7B+gCrp/aoZjYfXQtcycNrT3DspHHwPFLAfzcFy5AyJXGER75YH6YVlpURyI4vldQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VE1PR04MB7247.eurprd04.prod.outlook.com (2603:10a6:800:1a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 02:51:01 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Tue, 30 Jul 2024
 02:51:01 +0000
Date: Tue, 30 Jul 2024 10:48:03 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, andersson@kernel.org,
	s.hauer@pengutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	kernel@pengutronix.de, jun.li@nxp.com
Subject: Re: [PATCH 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 PTN36043
Message-ID: <20240730024803.zvv3esqynjwfpiv6@hippo>
References: <20240729081039.3904797-1-xu.yang_2@nxp.com>
 <172227905062.1346514.6301429778096950851.robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172227905062.1346514.6301429778096950851.robh@kernel.org>
X-ClientProxiedBy: SG3P274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::33)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VE1PR04MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 701c7f6d-6f27-4b27-dd63-08dcb042721f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oafz8CO3RFgC7dPjvrlLv1ib93SYJmlkZCp4mdpcSumNrmihsLDY2vM0pdeD?=
 =?us-ascii?Q?GA/e3useexw54SCISeiUVijCelH7BGVUrr1+VOtJzc7Q8rbv62EMKJa7x42A?=
 =?us-ascii?Q?x0vjOoyWBeDdh9fl1a9PDbhg0LMd20UPpStYl1si+GSY3dgTgwQbInNk3AmW?=
 =?us-ascii?Q?DBAlmvt22/pjmzWLR8ZXjJyXC+q7YHETLdhjob0z/cZKLUufkQNa+54tt0Sp?=
 =?us-ascii?Q?yqC98kHk9FmH6nxBsKp21eJz3mTpU4I3PXRXEULOagEQueT7lQDVCu1TPeyc?=
 =?us-ascii?Q?PZvWq7RsHx4w+tMgw6hForUJfJiSAI6pJ/M19ELp1kxvkonp2fln+OXPknyU?=
 =?us-ascii?Q?8YtCKU0jkiMUzQKwDQr9M+JlKr4IdVsaSRBLwhFwLnXInR/hjJPcOSV+Bfey?=
 =?us-ascii?Q?QVsYH2YK7Z2C+1OiyAYDYiB3CE9Qj2jpJV+ipNUQY4iXfllpi67YG63FKNQ1?=
 =?us-ascii?Q?TlDNDPJFS8LpTTWDfPTalrSSLYZEzdiRMK8nKzE7won+DVdYkhNMNQQJrqS1?=
 =?us-ascii?Q?jL7nP8bfztZx6ZFep6+IVkXTmPCG/ZWh7tFAN4u5O+B9axX0D7Xg4zZjTf8p?=
 =?us-ascii?Q?AW4Ry/hT2ENFP7wGrcLn6TEDwprlEjU1V+xc4E1C/V7EYmY/O6m5M4oyoF5L?=
 =?us-ascii?Q?qOgTpHMysJJcYNZ19RGX6aLYYuBhG5q6rMFNWvsO2Z5SipEe5U8mV3VG/oIV?=
 =?us-ascii?Q?ZX8Z6TwrQ15f/NdR7iIrv5eKrm6FgjhJB4yfHIXlG8JAhatW+yN6Vwng1eLA?=
 =?us-ascii?Q?qPGLxONhOByZovHuZsnpANZoHN4FAGh0NJ1bfXW9OOUArGBBHgbIS/zPFK3f?=
 =?us-ascii?Q?Tz4KyQS+p+2BL+qmqZsQsE6VMiCgf2H+CPM+OvYg/tM4bRMiMnjrBAKGUD8V?=
 =?us-ascii?Q?OFeytfCmZx01VzeGv9rtEtq3LkrMA1q/jYXHJmA6ssT5c1zxn3PnerjU+rGy?=
 =?us-ascii?Q?/fNPX+YN4cC+K3cYn3Xsp8spctVkN4PjyVmR7mzKHmk94GiywIDHrXMyl+lA?=
 =?us-ascii?Q?bwcM1Ez7RFtLFWDbiCkdXfNnxDLIZ6gpr1azcm6sbWsncoUvVqaRFSZ1Jm+D?=
 =?us-ascii?Q?Nku8Sifbywtzp/Qsx7GGUBANhEHrwtOm8j7uXU59P07izb2VrsaghX07f7l1?=
 =?us-ascii?Q?68yqGMuVysetFxSEwC6OBr7R3muS+u6i+FqwSIFys3s1eQFTyRQ6+gZmYI3n?=
 =?us-ascii?Q?jXBtQOQCJNDYnVKZDFMI6xtpnkDZ/QQsa3Gf60h4Xwcj8+unzezDZuBY7qU1?=
 =?us-ascii?Q?hiI0pk64LuaQCvioVkusVjg8RdsuOggPtI/dPxAbD4p2yajPsCvmCjE5Dq4M?=
 =?us-ascii?Q?+/m+0N3+UAnY1lLvLCg4QdJ8zXvVQMSo/viL+QTciJMkzg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6cQuIRZZAsv67lG28Vy2ZGPw4nAHgN4ObJBh0BjQ54VleysvLM23AAWeSViT?=
 =?us-ascii?Q?KgTRihL93pN2SKqmd5XywnOeWmPgI1AvQaSrMevKdJRt50LwDGrYdzhaDTEi?=
 =?us-ascii?Q?N/iDD891jnf1FSk7Xjk56NsSAX09wMy00oEPlgJ8pRxpso28lqpZ7raGFMd8?=
 =?us-ascii?Q?y5NJVeis+U9WTeRQ6GFoE4x2W/GrumWhUhb6DzLxtC52HWYrSLlcDqaAsumC?=
 =?us-ascii?Q?zSPJ1q/Cxpfii+lqCclfUZ8QrD8FcdYgOTmtpawhZiuQyCBwzQ+olIE5lnmV?=
 =?us-ascii?Q?3OAEV8zChTQ4inDsirQQAmNRiSaKcgnqXZPm1vJScSxFEj4/5Jpto+6yMu2S?=
 =?us-ascii?Q?SoI1t7VSCzrsW47kpTAEk/3L7o848vyKaxUXUptDafNcjy9tEwe4/lkU/p8H?=
 =?us-ascii?Q?rc44jY9JFUMGnJGQ11CmBH5qyk/MwEFdWYBc12of5nyqdXjoWkCZXT9bG3GE?=
 =?us-ascii?Q?oJ2QXVwcMvwtuw434JJXpVsdYnrcbRradJRosWIqKhkNiAiwhL+a/fYEPcKj?=
 =?us-ascii?Q?9BrMF2YNjEwHRov+F6Dq1NG0LDrHFeNRynP4n2EW5VIhOeJsgfUI9ih0nAWo?=
 =?us-ascii?Q?RxPsDHTdZm8eE9lcQdcD51tEPXNyutgEafnD7btP33DKTk5Nt5AY+5+Sswv4?=
 =?us-ascii?Q?tHXk8q89wSL3/iZhWcLM/vJubJFwpy0GqKxlMA+nCSz9t+W67YzDB7wsrf9S?=
 =?us-ascii?Q?IeGhrIpKUPI7iHzXLlnotN8cb1j1ve8hp+Y173N6Vf8i2aDypFa4uvZjZeej?=
 =?us-ascii?Q?Yeb8O+UmM4b6MWn0RYqehlETk7xZpvBgf3Ibdn/XXyyeO/Ne+ORTiFlUrpsO?=
 =?us-ascii?Q?7fZFI0s89A1pe1idze2Yq+R/HYvMSE/JibjjXL21/E+tZDnJ+5rpanvk/L1S?=
 =?us-ascii?Q?nJi96TmT8Mi+31EgkaHHoqcQuxoVuhRgbSrZgZaA7VT2yk62uLtoCprt8eTO?=
 =?us-ascii?Q?jiS84ABPZZfEHa6WyYrsDpAdd7YPVy6iwZE0jTviWUpN2GtZu7/2BaG0I5qK?=
 =?us-ascii?Q?Bc/udVlgC2gwRRx+CV3A3tObTW2+e3M55SYmI/EFQfjtq0eT8gcchOY/PXIP?=
 =?us-ascii?Q?Tf3NON+16YCZWcEz9bur13rOoV3nj4mq/0gDCeGgx+dsWRkjklJAPAEwz8u0?=
 =?us-ascii?Q?ypeGUBZxCsjyAw9C8WzZNLAku1/WvEkvHcVXa/8qDpvmahclx7ABc0yfPLYX?=
 =?us-ascii?Q?lRNMGJQlOmyhNVuwo74an2NPSQITmFvnoh19P7Tm++5674d/Yx+RzRJ+yCeg?=
 =?us-ascii?Q?SvwdX4AqJRyBEy07/7S1CsvmxZwP9Om5ZH0zwWvBptibHJ0EHttTCV5vlXRb?=
 =?us-ascii?Q?ciApbm5zoTc8F4lMy8hGO0O1cmZlcGndtpY0ueR563zLBDho4AS9NOU8rTxV?=
 =?us-ascii?Q?wLZAmtK7cRJcETSTkcw460dQz88Z3P+JkJU9N2iHaZ3TXWNYj4RlGqK8RqAE?=
 =?us-ascii?Q?5DVEM9JgNvMq9IdNczDunaYzQVgdNnU1suhhTWpqPoh1fufnwoaMJ8RuB4I5?=
 =?us-ascii?Q?TSjeYWqxkTPfi17JtWa4PBV1v/Khwb/+AKO9cNNnEeotXvRVUazbi77K/YdS?=
 =?us-ascii?Q?/5jVP5zfgxzEBxtg9+yUnVZYShEHL1k0Z+TWsJ7H?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 701c7f6d-6f27-4b27-dd63-08dcb042721f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:51:01.1952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAKTEwkt0wGYmTPkfsrGQ8LUWshExsIUoIdrzpmPszNNGBR+w3ABGPbvT9BiaUC/teyT1ZFc+w4+3OMGKiXUYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7247

On Mon, Jul 29, 2024 at 12:52:56PM -0600, Rob Herring (Arm) wrote:
> 
> On Mon, 29 Jul 2024 16:10:37 +0800, Xu Yang wrote:
> > Add a compatible entry for the NXP PTN36043 GPIO-based mux hardware
> > used for connecting, disconnecting and switching orientation of
> > the SBU lines in USB Type-C applications.
> > 
> > PTN36043 datasheet: https://www.nxp.com/docs/en/data-sheet/PTN36043A.pdf
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y freescale/imx8mp-evk.dtb freescale/imx8mq-evk.dtb' for 20240729081039.3904797-1-xu.yang_2@nxp.com:
> 
> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: usb@38100000: role-switch-default-mode:0: 'none' is not one of ['host', 'peripheral']
> 	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: usb@38100000: Unevaluated properties are not allowed ('adp-disable', 'dr_mode', 'hnp-disable', 'role-switch-default-mode', 'srp-disable', 'usb-role-switch' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: usb@38100000: role-switch-default-mode:0: 'none' is not one of ['host', 'peripheral']
> 	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: usb@38100000: Unevaluated properties are not allowed ('adp-disable', 'dr_mode', 'hnp-disable', 'role-switch-default-mode', 'srp-disable', 'usb-role-switch' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: usb@38100000: Unevaluated properties are not allowed ('adp-disable', 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'clocks', 'dr_mode', 'hnp-disable', 'interrupts', 'phy-names', 'phys', 'port', 'power-domains', 'reg', 'role-switch-default-mode', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk', 'snps,parkmode-disable-ss-quirk', 'srp-disable', 'usb-role-switch' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mq-dwc3.yaml#
> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: usb-phy@381f0040: 'fsl,pcs-tx-deemph-3p5db', 'fsl,phy-comp-dis-tune', 'fsl,phy-pcs-tx-swing-full', 'fsl,phy-tx-preemp-amp-tune', 'fsl,phy-tx-vboost-level', 'fsl,phy-tx-vref-tune' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: usb@32f10100: usb@38100000:role-switch-default-mode:0: 'none' is not one of ['host', 'peripheral']
> 	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: usb@32f10100: usb@38100000: Unevaluated properties are not allowed ('adp-disable', 'dr_mode', 'hnp-disable', 'role-switch-default-mode', 'srp-disable', 'usb-role-switch' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: usb@38100000: role-switch-default-mode:0: 'none' is not one of ['host', 'peripheral']
> 	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: usb@38100000: Unevaluated properties are not allowed ('adp-disable', 'dr_mode', 'hnp-disable', 'role-switch-default-mode', 'srp-disable', 'usb-role-switch' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: usb-phy@382f0040: 'fsl,phy-tx-preemp-amp-tune', 'fsl,phy-tx-vref-tune' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#

Sorry for this. I've checked gpio-sbu-mux and ptn5110 binding but missed usb part.
Will fix it.

Thanks,
Xu Yang

> 
> 
> 
> 
> 

