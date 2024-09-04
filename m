Return-Path: <linux-usb+bounces-14630-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8525296B26F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 09:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30E6B1F256A5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 07:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07AB146019;
	Wed,  4 Sep 2024 07:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dTerX/Eh"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2066.outbound.protection.outlook.com [40.107.104.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8516B145B35;
	Wed,  4 Sep 2024 07:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725433849; cv=fail; b=CM1oGcvh1gVPzauPikSNGZ59i6uHRVzti88wKlYYDW+OYCWFQb1PzfyYzQM55VfODDhcipfCe7IFU+QiSC5Rq3kNVk1xI+e3Y0vBXFxOU/Cpab8sUDto1UF1QJkkoZba6cCIa/5/cxhyAVQxWmvMTPFNPAnx7Bk6aVFIc97w7Do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725433849; c=relaxed/simple;
	bh=ZJ7JXD5Rlmts+imYYLLW73H7UIe+4k4R3B4dsYR6fUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rI19CPGfoxHrg6+/t25BRN6Wcbrg2aZ25ih8UeAn1b3zTmwPxjNTWg8Fkt9um9CwUxpF6WWiYF0o9y0hl0/P/gJJ+eQHHfkJNdODhOacT7Z0eE+6EfibZ4SQDifYH9+261wtPywZDpCe1vQRXCiXAPZc3usE9EX9+p6daa0TJHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dTerX/Eh; arc=fail smtp.client-ip=40.107.104.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odb+i11EI/tit07BLiEMfnLe3fGW18NQqmWtTudZXIIMRcUCqgw4AVNr0bJkInSxWy0aTs2ClceN0u9ymK3HUwKlTJhhwamnDQC2YoXgE446a/T5/7gHgzNJvZBTbAeJh5rQDj5+c1Xbv60idHaiRegLDBjZpuDGaCmrDmgSZj4suEHyGsFtJKr/YJo8HZmk9dOD8omLiSbN1tsAxy6yP2E94lnPJxW6w5BEk8zQ5c063RzcwWJ6vU8A1ybAFkzNEpCNAm0yBDLhDGlC3IHeKVLGgmaX3Iefbxmi//UAiDmRCCuLfe+gf8VphG41g5mYEb40saLYA96Aj5bg4eN2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXw27gAztmMM8IsDRL5PTIaXsOMNJ+uhlDlnMpCnqM4=;
 b=FXzr0S/zz9y6X6FNpXO6MeizNArohxLbLKKni2fFxuYIhRRdLz1fhZGa5p3H7LKG/BozOr1u5LcdrR22efr2Llwg6aeZmTQBMVG/mhnso19bDSZhHNoCv1bNQjzT+t8aWVvFkX8I8Qc5o+jkxfCM7Tje4t587fGaReBobpXOwkArh8y+yFrG+qL1OMZZJQOiSDSlWneEOwu0BqbWd4h2nk0HSZONIHXf4H5p5g8x4+cafJPmBvvbxxZuH8+A5CJfi96AOIFwYXksXmQGwqFrwt3oh1bmt2Kf3HwzlduEK3Wie/8JpN1ENvIRqj1UgwHDHSN8+3jnrNjiAGH/Um7XWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXw27gAztmMM8IsDRL5PTIaXsOMNJ+uhlDlnMpCnqM4=;
 b=dTerX/EhGyS3vnJ9CZoQovF6NgWAOKpsq+yHdD481ne9l52BE27erxROvVo1Bkc34BnpjnETf0L76Jm3xjBFVIbpo7FKUu6ENzVNj3I6CPVId2SFl4qnD0RYTuLx8N2NsBqThfojm9AEIFf7mJ5gf6OTzHyGtHesBg2qx6ndYrUoKMRd6DvsXz/j7UQvSwZvp5gUPKccGNso7D3iLtiQi4dlorjEtVWVA0+/orNX6PE4RMNi9KnUSynrcb92u/U7tzVmZvwk/uvtoaXBiL7cj41xERiwx/6a+NwRF9tz4hZe+YM97OEyLs2ceXHD0QM2XwTD5BOtZE8YY4fDeCMlEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10298.eurprd04.prod.outlook.com (2603:10a6:800:21b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 07:10:43 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 07:10:43 +0000
Date: Wed, 4 Sep 2024 15:09:21 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ARM: dts: imx7ulp: add "nxp,sim" property for
 usbphy1
Message-ID: <20240904070921.tbtn6tjkxxj6vu5y@hippo>
References: <20240903075810.1196928-1-xu.yang_2@nxp.com>
 <20240903075810.1196928-2-xu.yang_2@nxp.com>
 <20240904063407.qjvevd4xhvohg4cd@hippo>
 <2024090418-helpful-nearness-39ab@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024090418-helpful-nearness-39ab@gregkh>
X-ClientProxiedBy: SG2PR06CA0243.apcprd06.prod.outlook.com
 (2603:1096:4:ac::27) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10298:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f9521c-e216-4f88-73cf-08dcccb0b0a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?whdXGWSCjRlQUV5K3/u68v7toHA3mq8hPYWovk/k+F0iO2xq3Y4h5gPgPK/p?=
 =?us-ascii?Q?XX/MFLH7ir3jMBLbNpN1udkxiSF0NK5A053WWdRIL1lHvuQ7Pu7FqoppQjMm?=
 =?us-ascii?Q?Wl8CokIvwXk4SaLUNOSyqiZxAiCxZhVZd9QSnMloLxjprc9ZUoDuEOnqYyuQ?=
 =?us-ascii?Q?9VpxCUrFbOJaw1uuFHtfLcBMnbW4JhwH++565ZWIuWLbjf1digAKKG72EPb+?=
 =?us-ascii?Q?GF0/1TYLHMAi4j8e9aXGBeHAByqqDmbZ7cquDafXo2iV6/3odry6S5EJoEal?=
 =?us-ascii?Q?YcJgVGyV71pBtIoywylToh+5h7kuQcJtLF91Xvwqp3TQY8MjturLUmznSS4D?=
 =?us-ascii?Q?STPeaU+nQduPaN0DKt0ZHMgw5i0Jh8jdM7mtzwz/VvfRkbQPG4S/mqu1rIkT?=
 =?us-ascii?Q?fJnm6Rme90bZ/3tuJ7A9vmw9E1uBBAKrXDDFyymOz5yvNFBjuNArWkXw3vs1?=
 =?us-ascii?Q?ND7xEoL1CArwEff6dDAX1F1sBG+kO0fAv2/WRLVUP3aonRjVKb9NoBsQhUJY?=
 =?us-ascii?Q?6uQ0rwnwSFrGO5ial2MmTAG8B3WBmbBZKWmf1uoiYjjnTzoxIVCrhn98RXkr?=
 =?us-ascii?Q?0WMHAZ9POtP6+DwVgjm1ax4Q3BytmVGPNMmx5wdi089ff6ru6c438BdLymPG?=
 =?us-ascii?Q?ch4h8skBcLgGwyqIYhLIPNDM3ONf4rYakSG6rBKCVzhdsbm3kH6FzUIkBZJk?=
 =?us-ascii?Q?Z7W5nxfvco9eSojGgXaAwNSVzCwLnJpftWcQyhkCX8JftbMFn/lWeEiuTnT1?=
 =?us-ascii?Q?E2FXqoZfFdqTAOC5KhoAxgqUTU7Mo3MX5Hepk5wPPG/uKbnZj+NMhXGjVoq+?=
 =?us-ascii?Q?7fByJ6qmUJG5rMRD+BTfLfAaBa1007A7CXVG2ienlfChuywu9nHklisZ1iq4?=
 =?us-ascii?Q?eR4ZorDxdrYLkEyFK71ihYPkRI23yZGfKCkuMB+de9S3/PW/gdP0P/AxDodn?=
 =?us-ascii?Q?Sd0DpF0ucUF6yrOLZY6iug/6ipTBOUz6Q+qBC7nraYTA0aeHtiag6pGUVI4v?=
 =?us-ascii?Q?i2sdHXJ1LdEvcQxWOuwgcJ4lpKh1YJ8gi6DLKQzkkE8Pxv3R+ve+A3WELIoZ?=
 =?us-ascii?Q?HZfdC7lOSYGQ7fbJaMVc1zP3DsoxHYJLpXRDtIYWIvVYyTUVMCsCo/enxJKS?=
 =?us-ascii?Q?WjX2YY2A3LouW9PyXiTDYxGaKGuC8prRiSNjeCn4rfb0xPg+Rx+Z/qP7nT1v?=
 =?us-ascii?Q?hlgRDfJOTMFL28lHMoqwc63Tv9BMoPzvSGtsMZGo1YliCgRNuYEJnoI+F81H?=
 =?us-ascii?Q?aWu1HOpFEhLVtGqYJiF0kqF9TK5qnz0iG/sqmZ75ScWPK+lr+eIx7s/mVqst?=
 =?us-ascii?Q?nowWv1K28PdnHGZxwarpVUPHsOyQe16d3b2o58g5BMhf/0HOSAyL1FIWu1Jx?=
 =?us-ascii?Q?zfiCsbs4tTOcv47JjZimrLVDd+WtH7g9e/+XjoQNAUPZkvsp7Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jNbQzQdcb/2FMCgWmg8lqkq02Y1lZJixq6Tc40wnJXocIoJPEyN3w88Sgl4G?=
 =?us-ascii?Q?fFVaoz9YOEkE9dw1SjVTI0dXBIRLh4kfC/WdiILqzjNam1RSCP9IzvcTsLxH?=
 =?us-ascii?Q?bVCSNH3uIlgYJ1WvwDbQCEJchFLgnv0F11O5H77fyHxv7J6nhNL9wxHysWul?=
 =?us-ascii?Q?J0/XVGmbIqYiXwYwf3BvmxcFTndAhcQ5+mclx0skCIvcxmJI9tCLok2vKwSf?=
 =?us-ascii?Q?ipDU70t1vp6+0dGe7V9myjh8BGWujVxQWw0M4/3x4Cx30D/CNOPVZwX7VfnP?=
 =?us-ascii?Q?uKhFjLRCC3td+wSUV2l8rrCvtYTD0vqMwCKJtpp5Osdsaz+H+KVB7Wr62gsE?=
 =?us-ascii?Q?2/MbzURC/6FyBqbBJ3L6FG4hzUD+4Fqe9HsqYf77oD6ZCAkC+czrwa1Fd/Be?=
 =?us-ascii?Q?0JUH+Ygu6IQ/bKhxWbmSQ/lR8tQYTD5KGZHuFdSuqFOZ5pLvx0wK7Kdu8M2q?=
 =?us-ascii?Q?9dpPiXIYbwl7JHanzpY7ClgzqIGHFm36E6wMi9i7eP7vDqVCjXIMXqBXbn51?=
 =?us-ascii?Q?fIyD9erMZWYxCxPfKMyrWbc9OcYuZZfNqQ7WnBX/DvUcynAE4ivEihFvCleY?=
 =?us-ascii?Q?s/8FRuom6Iw/zUFAm3Y+LyCN1XrkFeMbY37A/EtTdYM4zoip/5cyTCGjcmRZ?=
 =?us-ascii?Q?0AoXpdqHMLC3lYJAGcPVGFu/u0CoZfWOlKseuaZAo81kMi0MpFRmFfpyoduM?=
 =?us-ascii?Q?0xphs+ko1NEImd7NEP5j7CdMQM+urwVb1od4Oc6DxXmDjOSR2H/kr1q+y0Oc?=
 =?us-ascii?Q?aHPi/VEVaSUaQ3WIpy5G9Fd+KVFAoz7hk7mLD3YADzjXMhS1FC8zUyGjdZmL?=
 =?us-ascii?Q?8RpAu7FdmgR48brr4jbjMFKXpqr8ESOnc7Fvbyz9jI9qUcXQ6qxHqySO8PRa?=
 =?us-ascii?Q?Sg2srfLkW+4Pwon1+F+bk6DatSY03I+0FjRZKKhUypXWu5gZu//wSemKSyfH?=
 =?us-ascii?Q?z3XY/r3M6kKYDcN4r87KeMnlDe7GvcksQjIqGW/U1VtxmXmwO4znNf5ikoO6?=
 =?us-ascii?Q?/NheKdmXZoI8TJ+v/x+t5aoeYUR7HLB1zxxej76QBmFzMBCJAE9hu8g7MJ2K?=
 =?us-ascii?Q?RV0ipXe1Bn/7OqmOt1g1ktZXtRxAkBivVM5vN79KCFgkjylXLZI0d2BWxRz2?=
 =?us-ascii?Q?kWxWkUEe6dQblhZsnkXMerBXUihc/lsgQ+xsr7uu/dhf4WYeXOWjg5PZW5Yh?=
 =?us-ascii?Q?ebPsIyiJOBHdtOYP2QoqRpV8A5aDTlL7WOxCpo5RH3ChQ27DVxCeI/jd0F8q?=
 =?us-ascii?Q?v4TqUyxTDT9rlUOEJIzhtNDcIH9PuEf3PYXqOjRJtpeK/DPl14xUSrFTQAjD?=
 =?us-ascii?Q?65+B5A6MijaNMreCtA/wwJhFRs0k5IUJBLaXeckg68zX9APdFe5zf1+62zrX?=
 =?us-ascii?Q?8naT4pj+cgQzU7WB3dpWlvkUzHeq81JPOLCLkk2wlxorkLO//zGa+/5gnNEA?=
 =?us-ascii?Q?1ZFEmCgE5jPut0JkkghOL1nbPVPbdV6ujQHuiN0th7xyGFH1mpdDOX3MYvLA?=
 =?us-ascii?Q?gjFwIk+J7DJ7m1ZTjJHvz/NzYnhPzNt4Jizzwi6sknA1xtgB2ObQhMP/pQbc?=
 =?us-ascii?Q?Fo3IJRMiq/1guSOi23vMDMkjrmzmgIWKm0J2bOCv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f9521c-e216-4f88-73cf-08dcccb0b0a5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 07:10:43.0773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KL007S/1jKxHQ9Ru0sumNob1FeI8ZdlgG+lUwXjOMo2ohsHCmyvg6AS/GgGtZfyIqVQLwLY/aoF0v1DIxzQ1OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10298

On Wed, Sep 04, 2024 at 09:00:45AM +0200, Greg KH wrote:
> On Wed, Sep 04, 2024 at 02:34:07PM +0800, Xu Yang wrote:
> > Hi Shawn,
> > 
> > On Tue, Sep 03, 2024 at 03:58:10PM +0800, Xu Yang wrote:
> > > i.MX7ULP need properly set System Integration Module(SIM) module to make
> > > usb wakeup work well. This will add a "nxp,sim" property for usbphy1.
> > > 
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > 
> > > ---
> > > Changes in v2:
> > >  - no changes
> > > Changes in v3:
> > >  - no changes
> > > ---
> > >  arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> > > index ac338320ac1d..b093f2a447ae 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> > > @@ -214,6 +214,7 @@ usbphy1: usb-phy@40350000 {
> > >  			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> > >  			clocks = <&pcc2 IMX7ULP_CLK_USB_PHY>;
> > >  			#phy-cells = <0>;
> > > +			nxp,sim = <&sim>;
> > >  		};
> > 
> > The dtschema patch #1 has been picked by Greg. You can pick up patch #2
> > when you see this ping. 
> 
> Because our tools like to suck in entire patch series at once, you
> should really just resend this so that Shawn doesn't accidentally take
> patch 1/2 as well.

Well, thanks for reminding me again. I'm going to do that.

Best Regards,
Xu Yang

