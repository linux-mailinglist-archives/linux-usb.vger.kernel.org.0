Return-Path: <linux-usb+bounces-16299-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155A9A03CF
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 10:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 988381C29008
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 08:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59891D2B0E;
	Wed, 16 Oct 2024 08:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FVq+70ss"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2082.outbound.protection.outlook.com [40.107.241.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4668C187850;
	Wed, 16 Oct 2024 08:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729066131; cv=fail; b=Et6vL/+Yks6xhper5AidEuBYvo7+bOR4M8Hh9yBOWs2hkq+NaZdpxxTs5azCIpPQfX396U6MwpVKToqBR9Bi68hieZFpe9SMBPIZFTEYdtN3KSia8N+MLDm+6/6Lf4BeY8EPJgMJ+633cOuMe3vI/7e3EZ2vM7urTeWEnDMHkbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729066131; c=relaxed/simple;
	bh=zY/C2PzWufCpkIZdMHv1C+lsfF+hts1CspnouHZWUuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SmF61zyHVqT8J6xk8GON4EYPiwUw6j3fvCdsuBo2AYAW6MJOoPZX3zP7/iv3qJhvSbGFolnoUFsT5HAxb3/LgGrE+geBEHC8b4HQ9RCHJuTaPWRCuobiHmjxdtuAPCswXuFIfuXdr3J9OB/bG6SDXEtVOTzWX1QqpyPXJPl9AR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FVq+70ss; arc=fail smtp.client-ip=40.107.241.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5TAzBcx69cRXRrORFXdXl9IAlju9FMUKncvPCzq6I5Q2rb+GGiBAs24DKkTKhFxu6S8ZhxbyZl6Ga+9aTMy9AxCBK6spw/0OGBxyS3hsSH91h07ThXT2rR5EMPywAUWiWok01o2SfAWT6GTYNtGPo3xifoH75kg58gGL9q6quS924Cjb9MX3Osopp0QweKbl87NPJEke3ZMSHNiOau5A1Us8IkWj68cQRbReoUXpMFzyi5tklODrGFmx7YUw/uhAjzSF0LGxjengxvPPxdSKF3p14E7hZTLc9mDXqYde5Q4diSm189yvg4rTL66QBzqbYztSgVmpPzQ25fJ7TSlpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCebvVx6oOYrEY6HYGhp8iJR+D/LSQ/zJv6iE8Bl6e0=;
 b=a4F0AWpBjqvDVNvFknX43tbsLstxHTjwOI9uOw7ikz+ZLcJLuw1q2SMwIz/n80D7RBHcOsVpMP6Cjr3nJ/+kK24yocVutV3uR6mt/uS/4kXju8jrA7/ZbQaTr3WuZoWJUBRoDzzRGyZM48UgZQLS035gDNCCQXkvv8wjN/9RJ8wdIMyypfDQX9rCq3uYVUtAQDfUNPRK05G5+tbjV4sxtQgDN8EbeAQq9328sr/gDWmMtrbeuEv2VbhHg322o6v6WG0WEwCdrbzzVwR7eiUrTPJmxLbw+GGdBIZZarE4u9t0XbM3yZGt4YiFIJVbwX/0bT6Uy5QfzpjI0g+ecP8+mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCebvVx6oOYrEY6HYGhp8iJR+D/LSQ/zJv6iE8Bl6e0=;
 b=FVq+70ss20D7z4j+dgeRcnwnftT896YOF0k6T6h+pK1aWL74+Glm6mihcub+3ZOABGWyFENSLoml7JlRJfj8l41NxtQx1h5XefnnI+DZHyBiIiW7qERVrceWDiC2RDDYE4Q9wBq1qVN4ZFh4/oTH8eRjds3Kz4YkApZsVNFWfkfxCos3pmnuV2zmsAxLt+eEN2GpCeF3J3EJewlYO/jNSyFqnn71f3bbAcxdeDguENLxjmmYPMBbmfcAsxUbOmn/R8RoT/p7UGM9zMDr4kw2mMy+IT2OseEaeoMZFuCFb2SVFhvDi5uSBp+b4MUdiNb1HzOV77eFf/LiMnnktC8HVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB11068.eurprd04.prod.outlook.com (2603:10a6:150:215::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 08:08:45 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 08:08:45 +0000
Date: Wed, 16 Oct 2024 16:06:39 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, jun.li@nxp.com,
	l.stach@pengutronix.de, aford173@gmail.com, hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 4/5] arm64: dts: imx95: add usb3 related nodes
Message-ID: <20241016080639.2ct3zbixdos5jjj7@hippo>
References: <20240911061720.495606-1-xu.yang_2@nxp.com>
 <20240911061720.495606-4-xu.yang_2@nxp.com>
 <Zw9xj4JWHssfOtQP@dragon>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw9xj4JWHssfOtQP@dragon>
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB11068:EE_
X-MS-Office365-Filtering-Correlation-Id: 03da3381-b793-4f73-da12-08dcedb9c1c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qke8PMJpYKfYqdabn91IDC+U407PVwd7HBRdOlRmzRLx37FoRqEJmoxsWY/I?=
 =?us-ascii?Q?/vIwvA7oVvuEmDaMEUjJT3IJTwfEqwhq/Be/ewNWHdafQb3QbbMTNLmIRa7I?=
 =?us-ascii?Q?ssU4teTX7dEL13EyA048in4kAoYwp5gUdVX/kew6ONE0w2GwxTnUHBmmB+ek?=
 =?us-ascii?Q?N9RvnuA+XGFZvYTaTxyUPfMhaQDKk7odO8i7SSoxOL1415bJ8eQ28omn+n2w?=
 =?us-ascii?Q?R5xDNXgxo77UAa4yTNYw5mW/wmb8AXgZR0mHdn4h+QXC+djDXaH4+gr5pCZq?=
 =?us-ascii?Q?La5dd+uGASTEEzBTx3VbSqOoBsyc04Z+9JghrSqUSXn31uLfq0xp3Jfg1hYT?=
 =?us-ascii?Q?ix3MK41G9N+im4MscNSvOt0bNVoa7DxElkJSICgNMuNXM1nauKY1+0UF1r8I?=
 =?us-ascii?Q?3ZjaMUpFm0Dkgm7lzo+Zx43Rf/qATIm9kvf2Z+EU2tMkD54+g0FRaHu8o3Op?=
 =?us-ascii?Q?nqLuV4SUhpnEsWZdLggK8t0tg1YX3bOU+7rF96slym4roN+t5RbDQYSsyGuR?=
 =?us-ascii?Q?C4y0nc7TAZve022z66F+9jgRdVkSCHDjh1Dm3pqYkAWAxOOIk690DIk/olBP?=
 =?us-ascii?Q?RGeOdA1R1HXUCZ+Z5XPlN1IT4GTtxtoZSCzsVEXuF4vnPkuJUgG4x17toLl3?=
 =?us-ascii?Q?UuVXdooZaMeihFVJRVUl5GIU9PQwwDoyPhpUifVP3rKhY89NBHC8wsS71RBi?=
 =?us-ascii?Q?Q6iiVnvW2kjJ6QC2pquINWLPZVkm6pa03fTg7DjuF11Ju/hQFJElBZ95ZXoC?=
 =?us-ascii?Q?14UCdS3ilXQvAekuUbMul/C2V3oObpjSUgrO0lOVCRb9Xn5LFFJM8HIj/4K5?=
 =?us-ascii?Q?60vRYtEsqGU+iXqTdn3p7ptZcnE+5Qxv83gybX+uMv/1doBjROwUonID4ZQ0?=
 =?us-ascii?Q?tcPIGWx4xZSxQ0QcxzgxizGXUTGEOn1U/3rACS9JbTP+PJyciPIwWcDiWas4?=
 =?us-ascii?Q?J5BY4/4r10NMYHfA+CB3b+MY3TE4yvU+lM/cMxR4wReZaJNanmdhUw4ZMOvX?=
 =?us-ascii?Q?NyhwrVsYb1gqRSYbRXwmaBkKhTz7YfgScG2bG/xb01jKIUfvmBXheuQRTu3+?=
 =?us-ascii?Q?mA2fHQJZWHUfVjPRhR34Ykpv1io82Ft01HY0YXsWatmbsHXOsXoahut+jX7P?=
 =?us-ascii?Q?fNnxRvu3/DxQ9z43/m0cjMnA+zDJxo2KlLsS2xUsxJ71cAafOMG3pVZoKMG8?=
 =?us-ascii?Q?Do8Zz+P5k53bOTtPpPX66rWwnr4w/PYXt0BwKYvXLY3JqEWmCVd1ZVmhryo1?=
 =?us-ascii?Q?lbMHRlhw4SbM7zUp46kz6dkBT2UOFavIOwk6WVmNC6pKK8/WMHCk9irqaoei?=
 =?us-ascii?Q?c2ldNQxdEpuj/ZF1X5pUUEIJ7lMNvalxo0tiUuEgvRkPtA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1VzuhFziD9uT4RVmf8fzjbXL9s/su2zJtlBr+2qR9AAnL1qFxBgHPPt9aybm?=
 =?us-ascii?Q?pP/5OlQsayCngkRt1E3gfn80TULHTkDuRtWTL8MJwHf0RZfOn+PHB0AFosoL?=
 =?us-ascii?Q?r/Z2WsPQDgohMZ9h4DHcMGI7EIacuEGmTATJeccu2R/UmcgGPb0NYlCtUf9a?=
 =?us-ascii?Q?WQJQ+mgwq4ULHCzk8ItTjGhkKqKkNr7UcCAX0lQQKI8q0DTem6dwPrBIqu50?=
 =?us-ascii?Q?6Ui4rGy7PRPh0HfIlZWprfxXLMz9rjO8YCKBnAG2uM5cCVjBzXHIibD6KZCu?=
 =?us-ascii?Q?jpeJl6RyTcXJQLcSj10ITF8cAnm2IJMUPXAC0AHP2326nCnDFl1PBisbYqwu?=
 =?us-ascii?Q?GQLb/3V1ViprpewTlUkkE0600hIkxOP70ev9MfoAbAdRucTFN/uOfVNikgS5?=
 =?us-ascii?Q?HQQ3eeHwAja+cPP9xQq/TXOPztAD/iBDm0BE3v7WFOyw2V8S/X/XB3btwCXW?=
 =?us-ascii?Q?00daaHsgQg4PyPnGW5rsIuebViwZx5u8F2W/R6+G+1Em0f8dJaG9xAppJGlA?=
 =?us-ascii?Q?XII6c8cXCih7YPT1KsKkFVNbsMOsOaQyz2iXSNZ6LxcQ+2CEVYwTymLpCYkJ?=
 =?us-ascii?Q?CJFyxBXPQTShBNSvxKn/LhCQbwykshnaekJfEZolHBecHlyPjGtNdT8jGJ1z?=
 =?us-ascii?Q?qbmYGb6EMeXptokhCIV9Ru1UKPRsvuAXTOu3WmAn/RxGGDxv/+Odgq4Be0UU?=
 =?us-ascii?Q?V48O2EGwXznluMDMZq8txewtcAFEMUG4wJE8V0BprXrynxuZ7WDRUvmVb//g?=
 =?us-ascii?Q?K3hQWjBvvUm9Z3/sT1sO3h4GR7srZQYm64cjq6pnDSNOT8ObA1JDBtaOJRHO?=
 =?us-ascii?Q?JyxLM84Q61nty7244Qwun5ufDB+Db79269GWSY6HjbvscSWSwc4+jdd/VFDW?=
 =?us-ascii?Q?DzeBVy0aeX5C8zgTCIctDrp236fz/cBoBqgLu/tszdyVX92pcGbPsR0Iuj2/?=
 =?us-ascii?Q?aFV79+uwbTWJbfbhG2CZ4/OiTbVotSYAWF34vTk9z4OeEwsl44IGXUEyQcjd?=
 =?us-ascii?Q?6d4oYLSeV351WN1U9vhLUNvYZSeOJtTHl+UqUeumEdVSDoKLkAhpANsHx2Sj?=
 =?us-ascii?Q?TsQMtMoz6WUb+55FOe36+SeHEHVKqySLeEre/qfT7GChgIXEOuW6E81CjhuD?=
 =?us-ascii?Q?x1hPiXrRoPUXdgvj2tIYmuy+t2AodrTU2bjIJeLNU6aDJy9LpkSjfrIBq1V9?=
 =?us-ascii?Q?h4ksDLJ7VIxkUrDKUS+jXd5YpL6o9LuIM4QdgSPNMYT8Bk2NmP5C7Lf9eecd?=
 =?us-ascii?Q?tLs23TPXrJkfTIh+K/GeBbtPX+1QUb7LDKT78swk5ct2pF0aI3nXtY6mQYIA?=
 =?us-ascii?Q?+SiqdvuzQ+TpS8Kc60khSOc8NgvwEmhHmnmENxWiu4yLhqQThL7rj3423CAD?=
 =?us-ascii?Q?LUeEqqe3B1HVI+0xzjWe7RE+0BUDey/Z+dfojDjg6YLfxu98CItVC90uyFqd?=
 =?us-ascii?Q?gtS3VvGnETIYKVb0WGPjHaRYWjYdSTWbdyIwjxrnFQ3JjaU+co5/yeaZuY6q?=
 =?us-ascii?Q?SKcDkkNtltxSkLQiBX0dmjuZF6U1mipVLPjjBo80qj3NNOOhuk7VjdHYe0HI?=
 =?us-ascii?Q?us27n+oG8FpbFGxI5Ce5tlOWhGgtkLMWVPDE15gs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03da3381-b793-4f73-da12-08dcedb9c1c6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 08:08:45.8950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LsDYIUA9udGNc76cAhqknysIDswzxC8mZAFodzaQw/pxeF84F02C80/6/nIQezPPMd4HyMXPwfUx19UYcSIofQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11068

Hi Shawn,

On Wed, Oct 16, 2024 at 03:55:59PM +0800, Shawn Guo wrote:
> On Wed, Sep 11, 2024 at 02:17:19PM +0800, Xu Yang wrote:
> > Add usb3 phy and controller nodes for imx95.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - no changes
> > Changes in v3:
> >  - no changes
> > Changes in v4:
> >  - reorder nodes
> > Changes in v5:
> >  - no changes
> > ---
> >  arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > index 425272aa5a81..2377b3ade95a 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > @@ -1188,5 +1188,48 @@ pcie1_ep: pcie-ep@4c380000 {
> >  			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> >  			status = "disabled";
> >  		};
> > +
> > +		usb3: usb@4c010010 {
> 
> Could this be added in order of unit-address?

I've fixed such issue in v8:
https://lore.kernel.org/linux-usb/20241015111018.2388913-2-xu.yang_2@nxp.com/

Thanks,
Xu Yang

