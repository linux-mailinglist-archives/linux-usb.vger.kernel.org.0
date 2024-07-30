Return-Path: <linux-usb+bounces-12607-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF7D940595
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 05:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 406041C20FFE
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 03:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C690214658B;
	Tue, 30 Jul 2024 03:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a5bBez3a"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013070.outbound.protection.outlook.com [52.101.67.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E22D268;
	Tue, 30 Jul 2024 03:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722308485; cv=fail; b=gLfrmooxLikBicVNkzevCOBGssUwpOT7Zf2kbBdCoq6R7ADyGiVcVohw9NiwkjtHIxj9ru6ymJI1RopS8KIszcJnX0g2Td3E76fjmyvUooMYAjaXYueYYXiB5xNjx1PEjbPwzOpW6UnGGD9NQK8gu5RZd8RZhSvpEeKB7BXYdx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722308485; c=relaxed/simple;
	bh=2Mh/tpaZxSieU8g3rZ5ZkRAdGtv311sFvmQwROHhr0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EbXy2tauBa8S7NM19mLwUtqTexhJs6OfZ/mewuhYtdDoLP8zeETNKFPc3O6ItH9ZUPXEgrBfshPe3nCG8sA8qljUEkAUhW3FY5RdajddF2Tx8LNuoMp4H/ygntqNpfxic9ex98KxAXLmQPlZyq6Gh68u0JtNMQsLJwUzAb8Bcgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a5bBez3a; arc=fail smtp.client-ip=52.101.67.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZVBnOJ+U+7RxvtR4y9WkO0NSnELoJvdv8kWxCuy7cl1kr3Ok8iB2zeCjDNDp+KbjqnCdZhmMDG6U9FrmSiCduDkOYcjlhErIQ7nWbPGyfzhNIsY69Xydfm8yyWh4NJsfJdWYzaGTqmQ/eMFYxA4x2eQUeF2BRue3x2o95ht/ZcRQThMJKmXn2QFU5F/8Spzgu7hv5SV1bad4x6vz8VJvv0Gui1Fv3isprAIIwTUrNeWAyJmdI/KjznTRzhQ/eg5LMJlCjXdyiWVjRGbmrnXlzDsKF4hES8AK+3S5++zWpDBxTaZXdNfV/dZ5yPGjoQzTS8r1pvwZ66qUV9KErVhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3H6xIpVU+S88gcx3NXuKBXOAmjGsqyP8X42p46Z5Zw=;
 b=wXV9yavskKHyofFX4DId4m+1h2kQ/RxKMtngFknKRxWSOerBiD/cBlBGeupbudI0BvaNK3EkC4L7icfzCshj8lTcEhU9oenw4wD9EFd0x54lhqZv1xBP0sKcR6qyN6yZObJpwtmebWZjAvhWm7hM9MmsILcpu1OdTtxUc9wI4drYpvvQJnQa1dbV7iOiDP72PKaQaVLWeZtvMq765Drk+4hNlk12H97h3aMVYOdaAC6JxAVBayolqPDc74D/QfluUYih0dZRohGCyi6yB68th1aM2PHO9xl/wNQSKJ1muLRYDVq2vtkA/kpca2qXfGdIIpqz6Hxx/Xxr5HJVwK9Xvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3H6xIpVU+S88gcx3NXuKBXOAmjGsqyP8X42p46Z5Zw=;
 b=a5bBez3aVa5aP+mpuVrTIOIC4NmrNMUXtX1tli8pJ/UUGyr9wLVClshHajKvsMsp/dZ9tcFefzhhC0CRU6sND59GcYT8ldayywzjoVBM6S+icqdRHzzTu1MYVqVwJOjBwTlF85auhrSympYR6+xHRJnmM4cfrItSxbkjf3FGNoOo+pHAs/trIyTr0cFAdRrpS6dNPfHdOk+nKCw1Qji1vfUCxhgClrf+e4DWV3JwZ7jU9nokx5SmTRqOw8LYkoMMnqAPWA3rQRH3+4QrWxqK42m81ScdA+3iMUfc3SdiXkKUFNen3qRZf3TA/IIuOk1N3ZVWEA83tKBbQP/etXZGYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB8106.eurprd04.prod.outlook.com (2603:10a6:10:24b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 03:01:19 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Tue, 30 Jul 2024
 03:01:19 +0000
Date: Tue, 30 Jul 2024 10:58:44 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: Re: [PATCH 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 PTN36043
Message-ID: <20240730025844.b647xuoolg6zq6f5@hippo>
References: <20240729081039.3904797-1-xu.yang_2@nxp.com>
 <a3trxkx2fue2oahscjkc4silnfhesrws5xn7brjefjmke5emci@dn3cbb7yzmux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3trxkx2fue2oahscjkc4silnfhesrws5xn7brjefjmke5emci@dn3cbb7yzmux>
X-ClientProxiedBy: SG2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:54::16) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 91795f2c-141a-4a75-185a-08dcb043e2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IBtlRRQGDMOrc5SUfC/7scbEQQ8qkqTihOfqplP+dV5v7E3Y1cuUwDRq+XNN?=
 =?us-ascii?Q?uIRGqAsr9xo8ZKqoq6Gj+odVKY43RdhTKnS4FBcH8x64WJMcRRGHtLtIJMMQ?=
 =?us-ascii?Q?d555/ZINb8HbutIj28REdTglPb9d/S0KBdOYA8QZETE4H3In6Q/uQ3dKnAyF?=
 =?us-ascii?Q?PhOsEcJsbE2DUp6OP0aNW3H4dp3h+crOG9yAwLqUoTCrRngPqbfTrxQKVwbZ?=
 =?us-ascii?Q?QepbS2BrQo94Z3C5f9PTkutcR/WsfUdW+eochKKImqNXSCI8ZPtIwKKeurDo?=
 =?us-ascii?Q?KKNCCosX5iJKyOnt05fLf46skCPbPZrkOb6zLwjDYayxQ/Gr2GqgpI2DqqW/?=
 =?us-ascii?Q?YMBCX7gG/Hcie3B86dczDU/dC4z/9bqZSnrGp2YVNAAAvgXlXflzEeYNjFAO?=
 =?us-ascii?Q?Iqv40B7X3cDW8gJqyBP4IPEGaloRx+DqNIa8eH1dST5/RtyqrBGSRWXa/2D1?=
 =?us-ascii?Q?V9Hroi37Y9HeXTpvczgKcgzwsYpfMW9aegM3CaOq7H0vnzJd+UhdybDH8tWp?=
 =?us-ascii?Q?WVWeY5ucu1hIQGSrzPk7MMKOkciNW0tPt2/sPdfc3B4PJPWc9RMtq1zpwq/R?=
 =?us-ascii?Q?0RNR71mKAA8DBNmPeABrzfZNNCxlDM+lar2NSA8i1XYC7c8SpCEDy2wEkFGP?=
 =?us-ascii?Q?UeGOxwN5u7wYtxZF9Iqxw0B2FzJ3XOE0tPSbyWc3PTDC/SlwL9wkuhlqJid6?=
 =?us-ascii?Q?hrEPm+ZVFadJK0ib5kbeDG4VnPWXIUJTYrb1h/9gaAOu96p6DYdcnXMi523o?=
 =?us-ascii?Q?Q5BZYUdqSd8O1G3kpSm6rkTlXWNpX46BKn2cvb40vfo3AJVDUCvKVxyN26NR?=
 =?us-ascii?Q?IO6dGHPmKwMBT4IX/G4ugoZkXWLo9sJn4g6Kj7tWBClFQXBD9EOjZUOL6ErI?=
 =?us-ascii?Q?Exa6EPXB+nBEhZg6gtY+NuhUDN5yOXG1YSQ8nP3oANig/vNAEEuaT/rwI1hD?=
 =?us-ascii?Q?k3YwICxH+dliFQvw/TyVgfbp6GStVS2ssyhU9zmfEvD97xlL7a3nWtxunAnm?=
 =?us-ascii?Q?fVLYfhlbJ4vdqFbOxe07JuMq2hShXF2AxEiUkcW7BDKaQ0vtg7e0qGAEQZEC?=
 =?us-ascii?Q?+ofFpsvddHNU0SN+T4jDX34F8IKtqIfxqKzNjEReU9e9vOpfZik1EXv2wifP?=
 =?us-ascii?Q?3vLXRAZHWO6qLgvDjMAbb9A6gPM4TVoGMd/NsXoVOmUFDRoNxRDk7533Gi5q?=
 =?us-ascii?Q?C4HWkP2T9EozFIoq9F3zYNN0HROUT6VejiFO2Q1dXjZTI1tkPPmq+cyb5NtC?=
 =?us-ascii?Q?+oMoN/0v+U6kN/L1PWPWEKkb4M7NyeFgsjhaKUeLX99fy1K22h+dUvSR+2+B?=
 =?us-ascii?Q?9aYBhWnz5UvJe4LvHOMZDV9NayqfObVlcF050UQx6mWGiMJ4aQFE6j6fBE8n?=
 =?us-ascii?Q?uCbHwPo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rv9kRQUiHJUvSTYD5ltQSQ7bw6ewKzLZ9p3cmmt20dtxnsOTAc202Hd5zWI5?=
 =?us-ascii?Q?tMB+MevXtZfl2Qq6vWZus0NcDqi5mlXq6CxLEhQy+ulwYqlsc7qlrCdm6Wg+?=
 =?us-ascii?Q?lm2EUrSsU20TE6v293/l4z+Yrb3oPjgHUV5duprrUpBl+UHTQ+JGzKyh6pFk?=
 =?us-ascii?Q?1C/5ClKjdA7wEDt27Olc7vOQPG4gSWmpMa1G2GsWK6Mc3OOVbFlxFihzI3Qf?=
 =?us-ascii?Q?+WW7+206RCcJT/3exf4/j+64UEPIXvtUVGe0vsHjJICZsiV3VJ+SeEF8k2Ae?=
 =?us-ascii?Q?GArTw+1GdkC3kJ4IMpuoIoCKkdAlwVmmWgoEHILgwIjP8DT2+B2LvT+7h4//?=
 =?us-ascii?Q?6xCqeA7/rHMiGu2oDHtE5DCUIdOwVfubIk10f2J5PSPbZIeai3BG4HOPCOdT?=
 =?us-ascii?Q?QtTDUPyYey6/lximn73z5Q+J82XS/3it/La9tfjyaCnLfL1JzvGBnXyE84ZP?=
 =?us-ascii?Q?aQxNNJ0CDHw4E/TuGrZx6jGQH/yXSxMwiJDRCoCzzqIcNPWUtcjKFTYJeEIT?=
 =?us-ascii?Q?4lslMysxhV+ez7+M6IbmTIuHH0gEnuyVpdDmdcQDJ0rBPiroVUvYe0WXepwX?=
 =?us-ascii?Q?b5Vo7QXYhIUeo0wH1wQEQABDZa8kBUh6l7Sx3b1PkC2LhxPYjP12mBG9yfAB?=
 =?us-ascii?Q?DRRRoxEib0fgNtZb2coHoobLopfz425KmaXCuwdha2QEFBI+6DMpvwUfcoet?=
 =?us-ascii?Q?qEugd48+jrtzqaGtGrP74jOENHDjGpqOsS90ee2F06LB8hjsTIZ6f1yeMTGO?=
 =?us-ascii?Q?QqUFLVqDS5dj//kxgGyydvwPRK1us29Q6hr2JzR6cH8E6aS8S1QViWa4dHAM?=
 =?us-ascii?Q?DMiRXthNMtV+3c9kGLMSAwZVe1MqH5TTtuVvqjfpQLX9YGW8VPyzc4qXcRTn?=
 =?us-ascii?Q?28wubpIm7XqKVgMb5Ao1yhr/nwW7+NvNIs+f2dFDL2a4sw6XoB+yCHAPo/5O?=
 =?us-ascii?Q?V3nKZ85ec23i1e2bJBjInb8dOl3+ro6E0/2eGdXCmFWVZk6mv9RSbG3ovhmD?=
 =?us-ascii?Q?QW4GA8tA+9S3GzKvueG8bE90tNGuxMULyJKceyCGUtbGrpqRb9Wz/oowvUhR?=
 =?us-ascii?Q?3BJkOn3mK3+qWyFqjkKnR9AiduheQlKr5QK8DXX2TjPwq3X91nrwqm05x9HL?=
 =?us-ascii?Q?8ILu6588OeEcRUgiG8czJHCIA+SKXdN5TWYIcIvhzfr2jV2p43sB80+Od0JF?=
 =?us-ascii?Q?cNBRIrNettJVGBU26qHm0aG3+66HfpS/FFXKulPe6SK333hLvbd99qHKtkF7?=
 =?us-ascii?Q?m5DMxpk/6W9wdsgxTyKw153eDOlZCAXc4XRiNTt0WmlJS7LBsNyGIXRT+SLr?=
 =?us-ascii?Q?xz3L6Lri0Hl5vO9fmY1yMNPpApPHLY6amGqE+Mdp+zl2moeRhBmA2SGs7HG1?=
 =?us-ascii?Q?cC1ppi7NyNy6NZceT/FICcL1UOMEGywb7qLqkO49A9TGCkC3EXT8uegWPBQX?=
 =?us-ascii?Q?f5VYwQFAuivLPLWYI2+lUjNIHoJj/eHcT6vLcogkEKI+/8hIPN9XW4niKKSE?=
 =?us-ascii?Q?R/NxKieD63pTiQDnm8udpqwGUkR/UrqNtPLs+ScKCsiyCYr9R2cRlCRcaVbU?=
 =?us-ascii?Q?oK93loUbpeboaFOgzPDm/YjF2YMdcE+xHNMlqwdy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91795f2c-141a-4a75-185a-08dcb043e2ea
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 03:01:19.8076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ok6qrHcQFDDIZ1xGBPeiBNVvaEDS+PTcx3dvT7CE68BkS7ORUaLixdiNlTHQGRnte8+vAkykw6QOH8sXU4sfxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8106

On Mon, Jul 29, 2024 at 10:57:33PM +0300, Dmitry Baryshkov wrote:
> On Mon, Jul 29, 2024 at 04:10:37PM GMT, Xu Yang wrote:
> > Add a compatible entry for the NXP PTN36043 GPIO-based mux hardware
> > used for connecting, disconnecting and switching orientation of
> > the SBU lines in USB Type-C applications.
> 
> NAK, this is not correct. PTN36043 switchies SuperSpeed lines and not
> SBU.

Yes. Since this gpio mux is able to switch both sbu line and ss line,
I will change SBU to SuperSpeed in next version in commit message to avoid
confusion.

Thanks,
Xu Yang

> 
> > 
> > PTN36043 datasheet: https://www.nxp.com/docs/en/data-sheet/PTN36043A.pdf
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
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

