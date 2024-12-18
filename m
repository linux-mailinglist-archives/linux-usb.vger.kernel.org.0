Return-Path: <linux-usb+bounces-18617-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 913A69F5E61
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 06:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B5B0188F476
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 05:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCA91552FD;
	Wed, 18 Dec 2024 05:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IWH8Odun"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2056.outbound.protection.outlook.com [40.107.103.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9411E14D439
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 05:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734501142; cv=fail; b=Paw3tEzwWuTTu3Eodl3gQhpjnLK1BPtLRILE0mEW5XRd9XqRSExAAHD7AB3pQT4jeMxCv/BtzFEvB6qkkskxz2XVTPjQnDQ53E1ook6hqGXqndKi19kBTGKYZF4Zk+k7bnW+UJahPzh112W3LJxDADHVU38Quxb5tggGCoVOOuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734501142; c=relaxed/simple;
	bh=Cwrg8dUWI4WY524GK5OfR5T5eJBzc0VgWbh23izJ+o4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jG5SjVI7VrwGCNqNeNOCCvuUIHgBRaffPuD4dG2AIe+nYxH9IgrkQVUOquIkdhzAFVBySeWZ+NkwXP7nDJnEbphnVzxrDZzPFWH3zYtyGqdq5gsPG/Yd87+A6TetlclSafs0yyI3KZzrqlN1G0DLnxaMVa7nql6NaQYoKliM94Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IWH8Odun; arc=fail smtp.client-ip=40.107.103.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMd/wGolpYEUYV+tEiB9BWIPV1yrFKqV1E9N+u9aKlIVJxUnYu4WbKBLHObqPxxTM927oLy83vpHhcoNdF/Nh4IzxfOBnCVOJpk1BcQa+704KiHDhVWch49KiF2E1k/eAlxL6lUAaZA4S1ZzW9PR/YuHKhhHuTO+jYPTmSdk5acQIwJEayAZoJITTdYtirrnhFSTCgzR8/KP83bQXf5lIPXkYziaftiqcPWt/+wDbNNV3Fwo7Pl8cLsXeRLR5Lv9kX4EXp3jq7xrDEFC1ZBk4ZIRWPAzYQcWu9QK97wCh8039bvdoi7s6/fmV57P7+XnD+D6lgRFfIf9HR2sR9kVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDGhMMRly++DTa9NJTZobRdL7+OOfO42Wk9r5tpKZ+Q=;
 b=hW0ufWTKk+d0b147n64CbcodaqIWtSuwT9/tjxDDTuzofY/0K093HfXzPcQUMsiT6n6O+yIA/Pebdhx5ylKHg7KvuRFr/95e4v92vtXXa4zsd8FKmJHETyB4DuSoONlBEpUehm9lEaTDEl+4R85Zp3ngku3sP24rBLCsFjZe+OYShLlNIQXzL/K4t7UjoYrEIpOwdOhQyvaDaCmqcNnEiXumRDTcGCf127FD0U+g2M50KankDQWpz+EV+22p6a0fu1jVgDz1W2+HbS50ZRDiJSLCuyRFiFgp7SzBbn27WFpGDDmqB2OC6xofVJ+kCJ9qMnyOinLzkb4pDqwg+6kCVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDGhMMRly++DTa9NJTZobRdL7+OOfO42Wk9r5tpKZ+Q=;
 b=IWH8OdunCV7KSwf2ocNmsW0oqk7dq2GxM6h0uY+hL6ehFyeK2LJvYn49e3dGuXhAD565sc4xPCmjGQl3X6CmzPYhibmGWj8ZeMzqtaaFlXJ1GuLhxH8Dvr7zxTWXBs6AJNaASwsvyHhs//B0NvRVQfO4nRn442X9HgPun6/MPwznJ99/k3vqTHECQ2nXHtdoVu5hUib1eOeBIbf3G30H+F+2lGhDuU/xpzqufsTS0ctglRGj4pvc9QeoQQjKIJGEZYsZBjMtYbtO2LFonHZuM089T2igJtHzfD8JMZRxf0wz0LYY5It8W7ULQmbJmpOhlKEPPklj2D83zf74KopQtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PR3PR04MB7449.eurprd04.prod.outlook.com (2603:10a6:102:86::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 05:52:16 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 05:52:16 +0000
Date: Wed, 18 Dec 2024 13:49:28 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, emanuele.ghidoli@toradex.com,
	parth.pancholi@toradex.com, francesco.dolcini@toradex.com,
	u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 2/2] usb: typec: tcpci: set ALERT_MASK register after
 devm_request_threaded_irq()
Message-ID: <20241218054928.ppitndgijz4xkvrd@hippo>
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <20241217091208.2416971-2-xu.yang_2@nxp.com>
 <0e46eee3-332e-4fbf-b6a8-9e645750ecea@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e46eee3-332e-4fbf-b6a8-9e645750ecea@stanley.mountain>
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PR3PR04MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: 39373e41-686a-4ee5-e343-08dd1f282091
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?RkUZB3x3arwmxzbWpc6vNOyHTR6N9hTv1OpxVubcATFbYUxlCwc6Dn6vD7iW?=
 =?us-ascii?Q?0w7tXK1s3Vk6U3Mde/yE2VLh1EVwkMMfHuxgdCT1EEpMuWEIydvBrmoLGQ+G?=
 =?us-ascii?Q?Jkc3U+7vYNiOqahzNXZesPcruMRtGepy+j6ffzO1RQAMi1f1A2/EtuNHy2BH?=
 =?us-ascii?Q?iu/uvRnlU3VHrc48QglKeRfDQKVV22Ypp0fI5d8qrbIcsZCpB2wSdp64JtV5?=
 =?us-ascii?Q?u60++myr2m/rSsgE6Cm+G4BZ9uXOc1TVRf2g8HZ85fFzjCzct8Ilcnokjol6?=
 =?us-ascii?Q?d88lcHkYBmRcEchyDWsanAYhl7fKuJIN0XDoRwWU+IR1RA929Ub3JpKKv+sk?=
 =?us-ascii?Q?SNM/Fbs+JrYLB1ZJkVvz1wfq8Aoc83k/3IxqfzF1jrZeI1npJUsBVP8kxIhF?=
 =?us-ascii?Q?Xc6NJ1O0MXmSbaK8Q/U2rHZLm2GW/sB+ZbUTefnDxXA+zRQlXdAX1G0eWUir?=
 =?us-ascii?Q?MSE8lxQNQMbsA/SmgFpJj7qlSXlc5w1bfy+vlWqLwbTdKm+UZod2l7ldA+Aw?=
 =?us-ascii?Q?/M6EZHTTkPI7yQxbIB8xGomaGdVbdoLcfGhauwtkyc0oJSoaZdpYN+xLhLkK?=
 =?us-ascii?Q?x/1eUg47gUw+hkdn4jFELjhs1JPlB6LJw+WuWJ9jZaQ8uHto3W7VkCtdr2Rx?=
 =?us-ascii?Q?g/lInuwKzpD8+7gKob6aFcITXwS5HdM5pooOIMIrXFt7JtXYCDqwyKo94sAF?=
 =?us-ascii?Q?VIkuNMuJxhelfl0kOwzyEyT0QlPpfBkBopTN0nRvXHa68jLC0aba2x0OVdWr?=
 =?us-ascii?Q?L+elmtMfLc0NlVTRJQBBgaSwHjeDUka6B5xPM5yQu8E+3o4SY9gldH4CmLkl?=
 =?us-ascii?Q?16c3R1D5RAsoZH1oL/ltde2o2EtFi01WpbGhnPWrmpIOqiEHiMSbNu6GPrgq?=
 =?us-ascii?Q?ZtqqCC1DqbVkRC/mq9g0a1j10KGa7uLjEAXeMMIXXa1ZAqyNGKDLAHXTbwB3?=
 =?us-ascii?Q?uvSlewoSuhpy65v04AWYHQ6tsQw8kAtRpIwzzn1MjGosoQW2AVoZS53PGolV?=
 =?us-ascii?Q?sXkW4m5v7oy79ZZg+II65YNkuZ462dXjWuvl58EXIF3te16pddqy38vb5UPr?=
 =?us-ascii?Q?tPyFgUqwuds+Tn45Ht5HpQ6CXEfWldaqEpV18833GqQOAnBg1nj/HnGCaeXL?=
 =?us-ascii?Q?a8hkfh1nO5/HbXrbEjBh0l1bQbtektHQK6a5RLdzXx5L4tMJe/85BpjvPcDM?=
 =?us-ascii?Q?2ckY8REur+2+dxcQAU8/CTQxRBFkKlsAOcOdD1XAccIehk9GTYSzgrNHSdeB?=
 =?us-ascii?Q?z5uTn6bHuxCwlF2Xecd7NC8sZzXz3IWn+1hXniQlEKOCK560852K5oqQV14v?=
 =?us-ascii?Q?9PkQAZDlbNccs/XH3gC45IwYtru6RdBed6zAgA1fQ9ljFbHeVbZD3uOOAebm?=
 =?us-ascii?Q?HcDMbgFk7o0GZsFhhx8HUduR8ZTkfBDCH91tQ14cLAoLPDIdaIP0D1ytMcEK?=
 =?us-ascii?Q?ccZFwtehcE3/FycrGmfdkwjKtW6sdSrG?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?CJfr8M2ur8TaFAjLJaBWfEeU4r0t/3yt2yfaRzMj7kw9YpylMkjoiari3BgD?=
 =?us-ascii?Q?MTv9uSCsu6ZbwmL7ZScoa+JCLwNGLa7S7oNdI6EFAPXSCGBbiy4nFX1kiu2e?=
 =?us-ascii?Q?Dk+sbLNiTtL4oe4IfCFSMH0Vim+fjTPm/EZfyA6eeoUJTy0vWM5pu+8tWKx0?=
 =?us-ascii?Q?CpwUtao9bueMZG4gUOK2wcMAvkZQbTfFhjMcI9LHFUj35/c/2N9/+btZeTsV?=
 =?us-ascii?Q?1LQJ8GE347s0+aMjuZdNUgJsrHA7kLKuQF6Z5BhrBqKFWtBSw9eNve7o7WCy?=
 =?us-ascii?Q?kP60yJFPlaY52XM0cYU7BhO4qTCUpy2uCrRU5nYtTvUMLPklaLD+9ktP/5/V?=
 =?us-ascii?Q?pl7WRPtji5xI2nfWWaKaTtoGZLp5TcXSIG5CmMQrGXF1ly9e/9UCWykr+BSj?=
 =?us-ascii?Q?PCncnuPnmof3v591nrFFqUSDRO0i53VQeyR46SlM5Y55aWup/2h3xLrJ4R3i?=
 =?us-ascii?Q?jKBC3MOwzfgPpC1ORE3a/H3psI59QR7UxCRucNTsYlK1hQeljpViORU/73an?=
 =?us-ascii?Q?PMBXKlmk4IsY3BBRAR+1nsG41JwKW0zlyGBA0O9RihSrkoQ5GtG6iucsnktH?=
 =?us-ascii?Q?30R/TKgsHbZc1ZzcNIlRZcsFnIS81u8fLCv0JBIxFM4wcJj+MJ13Oi8yW9E3?=
 =?us-ascii?Q?az9SJaZjkDCmDwZ7tQgdqYsJpVVt0e6FfMjTW6sMqJvdWAkL9QI0s1JtgPDQ?=
 =?us-ascii?Q?Y2Brn6zS9qedeHXFbRI9L7ZO5esRnGXfrqC4hJ2FvJ0T6Fi8n+4uVTvcg1ld?=
 =?us-ascii?Q?k2XcZmcNMMHcvoRzZw5xapf7HH8rJ1By39AGTLLKMewDIS5/nC7TzW1fH0PO?=
 =?us-ascii?Q?F/TQ61ESpX8+C4xO4iQQ98dK44S726LEdZkN0MmqOvMiZNTTRaK0dry/zMWq?=
 =?us-ascii?Q?mwoh6G9EbcONXxaq/tK3jQygHIJ5ObxjdSyaf+S/lZlnlCtXdE0E/xad4EH4?=
 =?us-ascii?Q?LyXhyXZJtKhfSLhSNl8MVWJu3zx2BLIA4mykIA8YFf4UPxWxR1pN5jlVHSgD?=
 =?us-ascii?Q?vVyWvUdmFL6ZOZ1yDhqKaR3WjQXlTnsspMXFKgz84x+6bDurNXe9t5lj1r36?=
 =?us-ascii?Q?yuadVTpksrItdAHCWWxXs7gwcXFAssqdEGkIIlKBuzMUqTYAJD3xIgJeerBb?=
 =?us-ascii?Q?HTTQA6Ief0EV9gbtIY6nFZjfb8rs6oBzFFnZtacOmP4FSzj9eRv1mJYW8eSY?=
 =?us-ascii?Q?DxCqLJeTGshkOwuksHT/HTL8g0LNCk/cs5pO0B2BysYH+S3wIMSEj2wd4WTX?=
 =?us-ascii?Q?vkRjuRczZkx8RhQxHAxAkd+FarF9H+9MFjAs6sWWixfTCCPVBcoWwRkEcMg1?=
 =?us-ascii?Q?ATceHQEU6kKespmj1PcPwHeg0umBz1YGtSfPKwwr75akbcgwmLBQR5mkPus3?=
 =?us-ascii?Q?HlhCdUQOeyRl1rz2tI2zhXdeBi4Zagk5eKpnrVHZwGR7DWW6IuMT19eadIu1?=
 =?us-ascii?Q?mzX1JoC9puW5AZJi4VlaG2qwr3rAkwBZOOCxSc6v9vygkKEhEPPYneobxcXC?=
 =?us-ascii?Q?kH7gxlFmSQLrZfPwqVtkR/KllM1iJLPB9MFiC+SpDDdGBrH5JSWaQHSAduWS?=
 =?us-ascii?Q?FYjD9Ehh8JuCU2stj09lT62LDwBQDiVwIh41vag5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39373e41-686a-4ee5-e343-08dd1f282091
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 05:52:16.4354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWqicHwLRq7NJXqGCpmJcLzwocKB7Nr50sjQLW2E9B1PH6BJyiGyYhaKRl4i9cNUyT5ja5UjdlPytUBK6xGsIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7449

On Tue, Dec 17, 2024 at 01:45:08PM +0300, Dan Carpenter wrote:
> On Tue, Dec 17, 2024 at 05:12:08PM +0800, Xu Yang wrote:
> > With edge irq support, the ALERT event may be missed currently. The reason
> > is that ALERT_MASK register is written before devm_request_threaded_irq().
> > If ALERT event happens in this time gap, it will be missed and ALERT line
> > will not recover to high level. However, we don't meet this issue with
> > level irq. To avoid the issue, this will set ALERT_MASK register after
> > devm_request_threaded_irq() return.
> > 
> > Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> 
> I agree with Francesco that this was introduced by patch 1 so the
> patches need to be folded together into one patch.  The commit
> message would be something like:
> 
>     The ordering of setting up the IRQs is not correct here.
>     We need to call tcpci_register_port() devm_request_threaded_irq().
>     Otherwise if we recieve an IRQ before tcpci_register_port() has
>     completed it leads to a NULL dereference in tcpci_irq() because
>     tcpci->regmap and other pointers are NULL.
> 
>     However, moving tcpci_register_port() earlier creates a problem
>     of its own because there is a potential that tcpci_init() will be
>     called before devm_request_threaded_irq().  The tcpci_init()
>     writes the ALERT_MASK to the hardware to tell it to start
>     generating interrupts but we're not ready to deal with them yet.
> 
>     Move the ALERT_MASK stuff until after the call to
>     devm_request_threaded_irq() has finished.
> 
> Something like that.
> 

Okay.

Thanks,
Xu Yang

