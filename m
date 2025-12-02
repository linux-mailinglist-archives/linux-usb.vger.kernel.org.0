Return-Path: <linux-usb+bounces-31086-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6306BC99F89
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 04:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 000DE3A5542
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 03:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624E528136F;
	Tue,  2 Dec 2025 03:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HlV0pwAB"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013044.outbound.protection.outlook.com [40.107.162.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9436C279DA2
	for <linux-usb@vger.kernel.org>; Tue,  2 Dec 2025 03:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764646535; cv=fail; b=WiGhw4HekAn+rgUkzcIpo4WG9CenDKUneLWUJWkDGVdrSPYgM/neYYmQu78dlrf6sL7iyyq56/IXon6tRDmXOthhNVrxTu7RmDTiasWD89/nBrcyTq5r6uVgdzr+RsnqHs6JPm0tMX/3JTZ4cqZbtxRNROFWTj2thaqQc/tSKHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764646535; c=relaxed/simple;
	bh=EDcABGtPj2/QNCtnJEBL3B1QfP1AuFMPg2eaZ5MTUQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V3A9Rmplbe/KL1NplVevQO5mnQQGe6zwkm0nI8hb0obY4Q9g0fdzPMo0UrSg9dLZjQBypGlz6GRKF1y7F2aISVGHgmdju4UZAzasUw0yHh5x3Cqx+sAdGmcEb6lnuew9UYqLuy+DPANbk7JlG++19tVCMJtd8B6Sql2Il2ON/JI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HlV0pwAB; arc=fail smtp.client-ip=40.107.162.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ggi48DXqxk/FhQulbADlqZTyuv/CipH/3LgYj6LwlDnyPwft9setBj6y5yAeVVOT9WKnM6JM4ryKorZLeF94BANwRm6UG4e9cMEzJrnM3yT1pGlwglL3wzsILB2gNQfuKvuo3eshQj1eofBlldP3GZS1OUCCFvIa9ALbl7T9j8nWa0rEPLmT0PoX7+UjIp5280hrxeyVfUhBENeRErlUNuC5Zeq27pSEFWZVP3qxEcoKVRMht/omDRAV4JCibx91Z6kdP/EwH1Yzv2dmHVo4uFNwUkh4qw2uB2PndG/jEWsN7hmASg6177KSCkqKLGfUiY58k70uNsEIoTTHF/QRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssJHQI/YR79hUkSz/ZV8BZN8Gr8G12h8zVdgXztFzwc=;
 b=ZbgNw/VgV5Se0wBthK0wuZw5x6IH9uDlYqHJ/FVdM6MTLG0j0lJHxGBEtPYdVv7Tr4pU/JVCkMN2ZO0ckEqf8qxlBXZImfyOfZmOIq6Lgn74jurq2rFUrS4NTzWV89f7pelW4VnEhhG/m/ixX2bHRG/Mh3+9DL20VqvJKMFrGk3flVYoSyuNUEdx2GkbpoZC168tUiY8oEO/7AgXa1WuW/tPXZzcBcUUVObOgUJUyyEK/LAxfm4xKnw5D5gu6dB5iDw2xlqaqDmQtSt1qpt8N4dndzm7E+kooR7DGJWG+Apir5AqSq8hrzAaUZ3q01OAuj9+aKbWGbNIbPiNxhNZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssJHQI/YR79hUkSz/ZV8BZN8Gr8G12h8zVdgXztFzwc=;
 b=HlV0pwABsfMJ0An2hh2TUBjloHlunNNVMYH6wiCRLYiM7rUby0YYVkBuZHYSxYJ6GGHXE8ryc+y222vYf8XRp+BYUqboAt3cml7fepcbt+cYj3VZ6ei7Eu2Bu1rySE/TYRp92qF9OxeGuCSr+ekwUjd/vOPUmg6p26w9Fhz49n+MbUulyqF/V9ywI5rOAsuhM1ZNFk/sTBNCDLHoP6R1iiMtInenMv1Lg5NKMrqOoQgUKKd23VasVjADYgZowGqD8OG8tZIPTqXbmYLhU3o3xM0pvfefG2JVXK4fzcjxPLRsWQnNi2VFX+g0lSchCKnPr/T2g4YYMZt6uLv6pRBagg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PR3PR04MB7372.eurprd04.prod.outlook.com (2603:10a6:102:80::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 03:35:31 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 03:35:30 +0000
Date: Tue, 2 Dec 2025 11:28:42 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: "tomer.maimon@nuvoton.com" <tomer.maimon@nuvoton.com>
Cc: "Peter Chen (CIX)" <peter.chen@kernel.org>, 
	"Uri.Trichter@nuvoton.com" <Uri.Trichter@nuvoton.com>, "Avi.Fishman@nuvoton.com" <Avi.Fishman@nuvoton.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Maintainer of ChipID
Message-ID: <kbisrpoz5kgre3j4acmcyy7jhbhsanynuucamafxvxukqscnfn@37twvjg6cvmd>
References: <KL1PR03MB7053BF80E52FB7C409F5AD3C85DEA@KL1PR03MB7053.apcprd03.prod.outlook.com>
 <KL1PR03MB70537F6998668F54F407E29985DEA@KL1PR03MB7053.apcprd03.prod.outlook.com>
 <aSe7brbIyYtsO5Ir@nchen-desktop>
 <JH0PR03MB7634B9AA3CA0F0525E37EE7E84DFA@JH0PR03MB7634.apcprd03.prod.outlook.com>
 <20251128010204.GA2702998@nchen-desktop>
 <JH0PR03MB7634A61D0EA6628BB0F98DBD84DBA@JH0PR03MB7634.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <JH0PR03MB7634A61D0EA6628BB0F98DBD84DBA@JH0PR03MB7634.apcprd03.prod.outlook.com>
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PR3PR04MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: a47601fd-3c45-4a7c-371c-08de3153d7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g7wxlgPnAKoC41YwlJNJNsJB8JLsFEWdcBj0EhD+yOukD1E/jbZMDxCk4au1?=
 =?us-ascii?Q?YwdwaOHVzk9SNH/FoT0foGY3MOHWUL2tphCD+mGEn9SrelR97fVw2zCGoSQx?=
 =?us-ascii?Q?g8jB4KabAF1VfhAbsXj7C34J5AkjH4f205PquejW6oRkdj5rA1bVPlK6+dJh?=
 =?us-ascii?Q?wiAsIIguuRTRq5J1iSSO3g+hUFvonXqeLQliLyzl2P+z50pv7HFDVAppChMo?=
 =?us-ascii?Q?o9A+slgkeBkawDzx1nI4ZQnPqhFMx60zuvh+K5PEzOFcoh974AanevuRC07I?=
 =?us-ascii?Q?4ENcL5cSruFDMaS89E7+NK15u4Nx5qRH9C457hwL2t9gZqDjbV2triC0KqHe?=
 =?us-ascii?Q?95B3A2DCEqVGnSbQd9BD75Qb84xWSi8gIf8HcIpriesK1c7fco18srZDCqiS?=
 =?us-ascii?Q?biabo8aoa5oELtG4EVviDksfJ+nWsHThYfeXznaHtQ6yWP85bS+yuvaqSbty?=
 =?us-ascii?Q?KoZw4QeoamwcwyJIwOvGjQrb6dqdQkHTphUplObx4DoyZEPgKE9yborSoeiD?=
 =?us-ascii?Q?rzP2v9FeIQVrHJko7n7zOJqNtiVqW2Dv+i9OR9F7Yp/tSiqOw7AmwhjhwaO6?=
 =?us-ascii?Q?gfip/xLz7Cge3ggE4xjkeEWMr7Hq12Q0wmVv617vYSi60ijOtz1eHHLLA0qw?=
 =?us-ascii?Q?P+cYmZ3nrhXVfSpOXvi+a9hoae5/TB0MKMw5BHJED03xkM9EFVT0+4Pzq4Bo?=
 =?us-ascii?Q?YyRGz+NYUp/MMko5viv8A3UztQ7PQmu3jhN6q6ccpUmEZJrnnW7tk2ZF09Fk?=
 =?us-ascii?Q?fvxX8Cnu38cllAo84qMN4j7oOzM0N+FlcK3vsK9HNBJpZd3q6HoqaRxsjb8L?=
 =?us-ascii?Q?s+I+EQ1zqi4PTQi5xiqTAxBB1Byl24QaqSVCoMocAHVFEmOTS9DZ1H0IjdTa?=
 =?us-ascii?Q?yQPg9r2/X8MDhD4Xy+x64XA16AhQ5RBWhQjL2B6rQ+wZZJ7x/p7kTHDy9ada?=
 =?us-ascii?Q?t4jzBQ4v0yccVpjZcshgZoyLCFdcUU/4edfsV0T3s6HNZ3f3Au5tU4F8+3bK?=
 =?us-ascii?Q?T/zjm1oWf6ea/DF2HmuNrDKdRUaaVXTGMZEiKcpPf3s28gDiXQPu8+qscEq7?=
 =?us-ascii?Q?8eV2vE2NsFMODAyHbYfp5FyvXahbhyxN5bJd20WmDwBxWd8aCmrfNvv+4GRW?=
 =?us-ascii?Q?7hRsa/5nipnQzHZVt6R+4VyEzy0+5lr0NJfqzCbDNH4Bc8HbRR6cw0XFqgFD?=
 =?us-ascii?Q?QVVTmzxeBQ9lv7xrQQ1tGBPLpOHiiTihrMKsaTOuzPosGw+AJsEWftjSkRzA?=
 =?us-ascii?Q?XPlTXLsbLYsRZN6j32THuAf17vkR3ygS5AH75DPMUjyGWAFjtXKGvjv5ztWr?=
 =?us-ascii?Q?vAmuARtUvdiX8CdDibw7RDloIM4fISlN0+yOnVoR7IADV6mXUvQdBEcszby7?=
 =?us-ascii?Q?j7HQWm14qGPiTuESR/rzogFKEXB71haVz3ws9se4vdfSGmwWxZYyTJfighcn?=
 =?us-ascii?Q?/CXgpcqQiFHagtBggWfKBWueajSZAPloR5UWxH6S+8sqQSScEKiLKKXr+ZI0?=
 =?us-ascii?Q?IbK7hRUhRWsJoM1+B5lqily2OiSmz634Zuli?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sV+DFwVabT+5nz8d3PmQT0s4NreB5OudgUZJhOlzepvfOhknx+Vh6SPqeF8q?=
 =?us-ascii?Q?u6BwJ3ASL7xXZPbv2Nz+r/xroUzeeIhs9MD6/Rss9l+uQrQteDaPptVIJH6M?=
 =?us-ascii?Q?gIeyVFCLijTEgl9oy197ba3pH54wR/QO1oK19DNweQYCHwHnYPc/5bnOrGZ/?=
 =?us-ascii?Q?9t7pkrCTG6d7O7AW9/Mchxr0ml6u4oZy/vx9nLeIRt8EGKjvzdYxUuYBAK28?=
 =?us-ascii?Q?Zv0m1vlRfzCLcl3kRvHrnTGV86LxO9EiZdrIbVKLOqdh7j3a29miF6WNszbu?=
 =?us-ascii?Q?uxwXQJUMt8AUM6vFgz8PsmlGhHsSeO21ogTEhqZJpqik5P+5iX1KxdlpOxWB?=
 =?us-ascii?Q?o1R/HWY9buIOMyhG+KH6rwhjVESCTHY1HbU3JKAWYk7JNhqRPwCxJ9lLG/sF?=
 =?us-ascii?Q?gZZ0RvhyVtqi7ZSqvULyrI0CIUhPJfzN4J/6BByvY7ebCoaEj1mB5/IddARj?=
 =?us-ascii?Q?QwkL+UW+a89RQRi4fBDOnIK4woc49+TjViZ/SOzY2ZU3GXi2iPyL0gpPz2Dn?=
 =?us-ascii?Q?in1OefP/LtirXqv5JOyVeIHTiwYtzlA7V0y7l1VwsPK/qqya/Znsnei2seVk?=
 =?us-ascii?Q?iNpIPW9vJ0JGiCoVvNVWHfKisV63ubcIME0m0FaYwQ6Dwc3mfwrTUubXoZBu?=
 =?us-ascii?Q?QqL53kQCBLi519eK/7gTH3u+Poo8bCFzhF6+k2DMUemFIgLPPaj4RcI8AEj8?=
 =?us-ascii?Q?syeThxksfINGY/9IVoOYdDrRqlYbmsauf8aoJCMi52n3SbgD4WvMP3f/0cxg?=
 =?us-ascii?Q?TSOkPDXQuUlq3WRq/3Qz+iZSH2yjJqNB+A/445n6IKxnPEBrcrFessKJLjVm?=
 =?us-ascii?Q?5n8z4nUIxFOtXilM69d1L279WEn8VUliRdaWEM0P3NXh5pCenuIueLAaxlRU?=
 =?us-ascii?Q?xwmZRQdnPY93/ObVKizbT5CgEXOV+OowXmPzU5JKnP+ZHFWR3qPN5zaJRdWP?=
 =?us-ascii?Q?M/vOJH8if1QcEOqEpBHs0E1m+qTUpq38cEiHv8PQYhVnaOGfJuqaOuk1EJO1?=
 =?us-ascii?Q?5j456G/9sWhC6fYWquQhqaFnzA/GdEhEnmIb30wjmn90GeZ5R1FAugq/iEib?=
 =?us-ascii?Q?H7B311WEsHX74jwmZdJpZL94ro87TcAh6TCfGv0DYZ3XqcgcHCAf88Bw7tGU?=
 =?us-ascii?Q?bbnR4EEC/Mev36TgNEZMyFuRtldzGu5+U8KdV/6xyIWUz0E/vT7mxp3CUuu0?=
 =?us-ascii?Q?bYzSJIhMWOD92YiXglyiSh0nEG9fZZbtQVDMghGPBTQQzskE90L92DMtlxa3?=
 =?us-ascii?Q?nXA2rfo/iwE11oa6jE64GvrwuCohnnb/QI+Np0RKNlqmZqQOK/BIMuhX2UN/?=
 =?us-ascii?Q?ooQy9VaES8RIyAAUNCqPEeNVT/w+nRAPbO8Xvv+U5IFX3S+FFT+m+JsWcDTQ?=
 =?us-ascii?Q?1vHVmS9MxITihPDr8IiyHv4D/KxjGApVOReannxIItSQN9BNC6p3VaOLRLs/?=
 =?us-ascii?Q?j71VlWxPYznr2id1jRB3OqS6uEEcAH1j18dU+MTNDazKt2QFdFdI9UJ4ANy4?=
 =?us-ascii?Q?4ooQY5JFlkpLV8Di7b5wBZwt9tvyphl2on6GGn4GI7TIiltf4O2drYoU0a5Y?=
 =?us-ascii?Q?ikuKHsWGgjQ36B0RhVtA4mXPHfgEYHBYfmCbrK6/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a47601fd-3c45-4a7c-371c-08de3153d7d6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 03:35:30.8444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dgx/WaJL0UlriQZLrL0pSPRywCkPEkuUyuigqmxZIBHBXOfihDwZ5yQ2g4uJESZ10RTbDKGlEhRTJakI1+96PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7372

On Mon, Dec 01, 2025 at 01:59:21PM +0000, tomer.maimon@nuvoton.com wrote:
> Hi Peter,
> 
> Thanks for your prompt reply.
> 
> In rare cases, during RX transactions, the UDC driver receives an interrupt that is supposed to indicate the completion of a DMA receive operation and that the data is now available in memory. However, the ACTION (or ACTIVE) bit still indicates that the DMA transfer is ongoing.

Which interrupt? Do you mean USBSTS.UI? What about ENDPTCOMPLETE?
How do you sure that the dTD is still doing DMA transfer rather than
has not start transfer yet? Do you know the contents before and after
this dTD transfer?

> If the driver enters a loop waiting for this Active bit become zero and indicate the DAM action finish to the handler becomes stuck indefinitely..
> Are you familiar with this behavior?

What is the behavior of the host in this case?

> 
> Besides the ACTIVE bit, are there any other status bits that reliably indicate the actual end of a DMA receive transaction?

Maybe no other status bit for DMA operation. 

Thanks,
Xu Yang

> 
> Thanks,
> 
> Tomer

