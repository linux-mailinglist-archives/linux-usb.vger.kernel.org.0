Return-Path: <linux-usb+bounces-23359-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D5CA97D11
	for <lists+linux-usb@lfdr.de>; Wed, 23 Apr 2025 04:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8756E17CF76
	for <lists+linux-usb@lfdr.de>; Wed, 23 Apr 2025 02:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF3E264614;
	Wed, 23 Apr 2025 02:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QugcaCJK"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2060.outbound.protection.outlook.com [40.107.241.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB11142A92;
	Wed, 23 Apr 2025 02:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745376909; cv=fail; b=Llc9IlUxbSMV8zlEFyjSMomHZf0iC7qoKMYCmv14pWXRxmWkkT75tog5nlQXj15AOqt6pw5lchHdOU8g5N9UYq0t8tGSkKnXn5Bykqy5ViabCzw9CSn70XZZ0uOQTd9lxGeDhTumHodLKqq62KwRYVMZwxhZRkIvz1bNvc+Qzl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745376909; c=relaxed/simple;
	bh=St5lkxtjzDpGDR4eEFNlL2gargze0fLgUP6T8qAfAZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oTF23380Fex8nc3b6kSXabRhTnKxXHMjaonUp640RrIhsMl7EqcENB6YVymZB1YS/S6ifNRQZ3ahwZcbMOgAD9fWwFG+Bb9cW+FGYXUIA5jcDEj/F4nGf02mOYnS790qpl+ExcflNNMRjBb1VBqfQ60FcB6HXEpSNeLUTFKzhF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QugcaCJK; arc=fail smtp.client-ip=40.107.241.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8gYqiu6NJ+HQAKlUKkdqwTnIAYwCcQOYnAsqueUF1YN8VE/WL0aQUYyzl8AmW/IAgtxAcstro+Z6PSwQ5q2AfC6omA/sB/wVoEroVIYu/t/7+UTr3DBkqIO94Cj99Vwf0AXi5Oz0XpDLr1g8LQMS4mUnuAASRCOlZIJ3Q2+azNlcHpZpx7B3c6zpvTiFV4pMGqnWlzo3KQVKFxi1Au4P6o2xEUHz5EcSgC2PQUbXcZMBddUZtH7Xr5iR1y7iVRcwzI4IiWH9yv9i7ZsMbLyv24KcdlYy6R5nJIax85u1RGhrBvBsztpbNewaDTFNJOQVXLnht7LmWIMW5880dOYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQNEBlrpWqgkDVhAZuMobmNjGPbgRolBt64+OwgqhQo=;
 b=cNmfkuNZ2YMmj/aTOnhpYVTEmvyXg7w7BvCea8Hz4hQ2ylql6LX4Rh8pfgXBs8NFfRzDFlZt/Lj4YpdWF9RIEvun5cgtcys2kuYh+18fzEpUVwpK0Wc996DmbWiyx+drLdX06/G/T5mPIY2YrvDmEl7GHaMczTmVLirT08p9hbC+O49WjWSasEShMTs7W/wM0YbQbqHnkRcVNPRcJTilIgMwfkJLmJkLXZr8bwjsRlUsifbHm9ykhf6u6nyIJmoBhLQu5rcX8S9trkyc06dKGd3esfhJP6fY7be8i/BkMlLiXGe0TZhwe40v05VtD0RXlWXU/Zv3pwStSI5+YI1zww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQNEBlrpWqgkDVhAZuMobmNjGPbgRolBt64+OwgqhQo=;
 b=QugcaCJKgZjKFK4XUPFhXQ4janqufJLB/OH91WIYVYRhldca3O45gvSUdtbl5S73Su1HedBKbfIZAYYXUpzJ5ppE63Xq1C7kgvKJmEUkaQENthRQLoPhKSC2u4bz6qCtxJvyUVopx7fpwzwMcLhmA0t9LsyfrakkbGAeJYRwcCF5Yy6omTe/GtN+EajbHeqTOuaFzruNxDZ6oa8SjRmyVDDwxkAkqE5OR3DiyBmIhKnyMaaJOn/KVMqxhsIEH+RQrdFtKAziQRawPr7bE+xvBQjKJfelRgAsxVZnvfze+uAnPgeIymwOkKjk76MfWyFHnJTbxw6HuvkBk3gAJ/uUqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Wed, 23 Apr
 2025 02:55:04 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8655.031; Wed, 23 Apr 2025
 02:55:03 +0000
Date: Wed, 23 Apr 2025 10:51:08 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v6 1/3] arm64: dts: imx95: add USB2.0 nodes
Message-ID: <20250423025108.inlhuvmfdwuzsey7@hippo>
References: <20250410064907.3372772-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410064907.3372772-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e800218-6892-42e9-943a-08dd82123e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dw7AIn+kHhrQYnRmK29mhuEZFthZvLRoexPIzQn0csfIgwMXywnfx/BVhX0Y?=
 =?us-ascii?Q?H6O50MyuRGUAq3NuGHg+tA98arj43zcE78EQCn7ZmWr7KqPP9tjANBV7CWWy?=
 =?us-ascii?Q?UpawiDSOv02OOAlPk+naMYWTEG5LaljNqgUd/ODAviHBzkyjeORrfVwavpoL?=
 =?us-ascii?Q?z/jA0HK21D0/Ppyu6y+0ey/X9NnHsEBA1RCplv2Wp9X9gvbquTYeB0aUGEhC?=
 =?us-ascii?Q?fL3Pm+57/0LimAfuFIiTX8kPiXbp2Idg9abfbyvsh3Ff42LPOyD1pKTam7Ci?=
 =?us-ascii?Q?5R/WOKd+Q3PWI+sKyURiwx3yYhOMtmU2NKLa1XBOqv95MDrGlznPL0c1AFMA?=
 =?us-ascii?Q?j0cuEyLcl5nZRJEDFLYuzNVT/ZNMRkgyTEXi/ua2DX7kIwmTn5Bj6zj4wpKF?=
 =?us-ascii?Q?ESbifEvWizvi/2IC8oLPtXRvLV22vQFIZiUC5gDMhtOSkKlOzQjFdX7+P5eK?=
 =?us-ascii?Q?aDgYp5B+//R0WC+D6gpIKonAk5ST1VSvzmVc0JFxySAj5W8SfpJi4gA5G0GY?=
 =?us-ascii?Q?UX48zh9d38LLSjCxPILGbjyWrcAulqbZfBw+mqngMB8LSqkwfW9FjujxNVwk?=
 =?us-ascii?Q?SehBGiDSXxrg799V35H1h/P2MyjOG5tbsx5wWvkxti/o6SDmBbpOBC9Xnji4?=
 =?us-ascii?Q?clvGVZAaSC2pWnl/JzTqOO4B5Tg9iq0mYbNBu6/D7BeaHt7evNQdWWiCLmb1?=
 =?us-ascii?Q?2LeVWae3hFRLX9CC7zX96IRC1QyHvJNkjBFAGTJ0kRJUMbSflytqmpp1x6n2?=
 =?us-ascii?Q?gcGt0bD9qvMEdBRVGebF6NaE6sFO2jUF78UmSFuqYHXYkOYbbI8loxiXGgvx?=
 =?us-ascii?Q?yqBdI+62WTbqGBAy4659G/yMFyb9METRiDMGpGPR3aNXgENpudyWq5mFymsX?=
 =?us-ascii?Q?kfcVtWq/xtPI0WLYrBe7s4kQTfLk2nJjBS813RcEkVL9qTc6Ihb+UyxDiANe?=
 =?us-ascii?Q?AN7E8fpFwWV33DjXtJtR0v5hou19NgwJUpTHKHMIMrcC5ZObr8sMnGfhop33?=
 =?us-ascii?Q?sUZe2DnX6Jk+m9FnwdDGM5EB36hdEd6F9GSkSBFtHzUwqmY7tKrCIsHWH+Rr?=
 =?us-ascii?Q?XJrM6pFfiV7FveOCLTnEWIB/2JlfOGXxY225c+8jF5VttTkprDr9bQcup8LH?=
 =?us-ascii?Q?gbB729J/S1ED+txG4TA9KskLIrcr9O2QjBPp0KKZzNwDPKA1WzUjdF/sJywW?=
 =?us-ascii?Q?n0DubD4hTb2EIbUhm3YfkPH2F467WHfyBh3uk9L0RewrYNLUjM39Qd5QUhMY?=
 =?us-ascii?Q?ioA7LyO6isO0VnkYZMlovFKCnBTdy3ed2yp2vZoKXbszKW1D3/kQsM3+r/5i?=
 =?us-ascii?Q?uKwSau76GoJYKX0IAeCDYEDl64B14miTiFN4vZiKDSby1hvezCV6USoGlNMd?=
 =?us-ascii?Q?3+RiiIV1N3i6HFSwqpD8/kKWNsfuKnGph/I/CJy7UzWBmDlnyAqx365h7jeX?=
 =?us-ascii?Q?QvZWdUz/bb3h7nVkYUWAGtBnM2ettIfheQmXbCbcjUHY/zxQ2IFBDmihgUwv?=
 =?us-ascii?Q?0Gi+GLJ5i+b/5pU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l/WUSskjtSAUnPWxTvMPihlhPDw6Ye4MHypjNApIU4Lj++tz2MfqPQ16BF0L?=
 =?us-ascii?Q?bjQXwQzJ8RwGYTzH0aX5BPN2Wyl2aYMWYMW3zEp9pkhnonDhPvhy2d1PcMkQ?=
 =?us-ascii?Q?tcINd6Sg58cV0oFUzpZm2fFhId/TfOMfiYrBqMo+dzTOYg0Cst/aoZ4pLhWa?=
 =?us-ascii?Q?WzVQm+fzb8D4X1kkNsgdCyMKJaWqQHDmgN7j5zbi6ij3poK2jdET/RQKJYwB?=
 =?us-ascii?Q?4G+INaHMhOspzBefzX7ZjUV81hnRWUE/9+rnN5KNc9DPn/0o/3nMzfeEXW87?=
 =?us-ascii?Q?ceIJqyiVPZGE2BpvMEFd8CwO7VrD+f8Ld8ytUa8wU5zxqe57WFktCLnfEtwY?=
 =?us-ascii?Q?qf5I8AsC45xlGbDbonTDL2QZDR/O0nc1oYfHFzORWVHyCSI9MbKIjjXF1ACU?=
 =?us-ascii?Q?95Xq7bmFqAZpKCoyNsCKLYClPff2V76xBuREPGdF0gmXzFOhQcxvIUQ09tA+?=
 =?us-ascii?Q?zZ+gI2+UF8Y/f6PyY+83MnaxJKQqCQIZxkiRuH4vr/nsLKsmknWNXO8Kj2Sv?=
 =?us-ascii?Q?SVCgPxKg99fIsigeqg4ZnTajLzVSqEid7Qt3/noEoGeRvX9VnrVVhgcC7i7J?=
 =?us-ascii?Q?ZCQ7oE02V2oTZUL8JGrh9XXPp6ChJYlsM1jEW6aZIWj04eati95bLrITRJ2M?=
 =?us-ascii?Q?PWM03QOY+M/70OW6CV4KshNm4KntHtSv7G3isaCS9bkOo+ssjBMIFWPY/srN?=
 =?us-ascii?Q?TOIgVt9Onfp28N6oPnPAyUqpmQcBCrx705pRPF/jysUDu1oHdjru/kChX7lc?=
 =?us-ascii?Q?0LiSGCxIb4tJp3WWMUdkTpKoYIwRMRW0mEvAVGWnI6Q3q2f62olnvqF7oZtz?=
 =?us-ascii?Q?s32SDij/RmV82NF6jknu1n80az9DQJGV7rNYPoni1YWy+fuKEw+nXUj/vimq?=
 =?us-ascii?Q?kp9txTGmTOcVA2y3fmO8qVtk+2aJA9i4RHlV3eAtTtUa9UE5iZdcltNlEciy?=
 =?us-ascii?Q?uxbnRTnq/BILE+U3b0iJ0o43APaa7rhrRQnCJHTiQwo40GziDV8oPhWBN0KP?=
 =?us-ascii?Q?MZtq0qhYSS0TuWDHT1Nm4bVCTfArEIfTyzZpIbiyVQ8d2Q5K31j6bc1jXV2p?=
 =?us-ascii?Q?4LE2P4ethzSa1M3JlycjFXn3uCMQBu9utaP6y3LP4SuxuZjtI8PZ+XDpUod1?=
 =?us-ascii?Q?9Sj7oz7AjAuB04FVS6s633uann5nP7zeL8jn/lziKIByt6fFDF5aqib2MDUt?=
 =?us-ascii?Q?mnPt4y29i1S9tv2C/DnbSyoB/6fhOM/IsT9z9byGsIZeVKpiwrnwdzPfR0z5?=
 =?us-ascii?Q?3spOoW0x3X7ppRrrVp+Xyxm2H9wTFZgJQaSVr3LghyjFmRd7ArTCOCk4CiMv?=
 =?us-ascii?Q?2NAPBMsCoWB7EDkB249MUhYPuIteuFiSnzFbyURCeAhMQZ6H1urQtlu91SBm?=
 =?us-ascii?Q?oxnHmchoEp2f39WQI3PUeao4TFB1XA6fjohLezjLYY0M2say0gNRG+JHSJWg?=
 =?us-ascii?Q?MmYrKqd0fEV8VdMcloFVv27sO8s+iM03I8fgdzQaznV7mkaGTzMuu9vr34sk?=
 =?us-ascii?Q?PwUKQEACmIGIRJ4dGc3WV8oyyArohVgOzcuNf9Qbl69mnP9j3uTcChHBaF4q?=
 =?us-ascii?Q?6uAG7ASMMKtHCFra7QT8mvku9jmqiSbPRwQKyx/P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e800218-6892-42e9-943a-08dd82123e5c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 02:55:03.9177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQjGUANP1D1mjP+ifkNri0iCt7Jwp203AnBoytl9SQZNQEZtei0wSjA3w8PmYq3rbYcLvZzlUtscwoPVB6UuXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557

Hi Shawn,

On Thu, Apr 10, 2025 at 02:49:05PM +0800, Xu Yang wrote:
> Add USB2.0 controller and phy nodes.
> 
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa95xxSA
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Could you pick up these dts patches?

It was originally going to be sent together with the dt-binding patches [1].
With Greg's request, I split dt-binding and dts patch after v5. So Rob's
bot report DTB warnings due to his tree lack dt-binding patch. As now Greg has
already picked up patchset [1], you can ignore DTB warnings.

[1] https://lore.kernel.org/imx/20250318150908.1583652-1-xu.yang_2@nxp.com/

Thanks,
Xu Yang

> 
> ---
> Changes in v6:
>  - no changes
> Changes in v5:
>  - no changes
> Changes in v4:
>  - add Tb tag
> Changes in v3:
>  - no changes
> Changes in v2:
>  - add Rb tag
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 9bb26b466a06..8dd859d8d319 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -470,6 +470,13 @@ its: msi-controller@48040000 {
>  		};
>  	};
>  
> +	usbphynop: usbphynop {
> +		compatible = "usb-nop-xceiv";
> +		clocks = <&scmi_clk IMX95_CLK_HSIO>;
> +		clock-names = "main_clk";
> +		#phy-cells = <0>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
> @@ -1621,6 +1628,29 @@ usb3_phy: phy@4c1f0040 {
>  			status = "disabled";
>  		};
>  
> +		usb2: usb@4c200000 {
> +			compatible = "fsl,imx95-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
> +			reg = <0x0 0x4c200000 0x0 0x200>;
> +			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&scmi_clk IMX95_CLK_HSIO>,
> +				 <&scmi_clk IMX95_CLK_32K>;
> +			clock-names = "usb_ctrl_root", "usb_wakeup";
> +			iommus = <&smmu 0xf>;
> +			phys = <&usbphynop>;
> +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +			fsl,usbmisc = <&usbmisc 0>;
> +			status = "disabled";
> +		};
> +
> +		usbmisc: usbmisc@4c200200 {
> +			compatible = "fsl,imx95-usbmisc", "fsl,imx7d-usbmisc",
> +				     "fsl,imx6q-usbmisc";
> +			reg = <0x0 0x4c200200 0x0 0x200>,
> +			      <0x0 0x4c010014 0x0 0x04>;
> +			#index-cells = <1>;
> +		};
> +
>  		pcie0: pcie@4c300000 {
>  			compatible = "fsl,imx95-pcie";
>  			reg = <0 0x4c300000 0 0x10000>,
> -- 
> 2.34.1
> 

