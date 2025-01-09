Return-Path: <linux-usb+bounces-19157-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B8FA06F28
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 08:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF67918899F4
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 07:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E422147EA;
	Thu,  9 Jan 2025 07:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jz96zWcs"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2052.outbound.protection.outlook.com [40.107.241.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970D28F5E;
	Thu,  9 Jan 2025 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736408289; cv=fail; b=b2wotC1nFroaw/xVdlu87rglrPLhdI+pUhYPjn42GhwtziK6JW5HTpbn7FYT4L3dXHwTU6xU+v19iQm8zacya3G5w75UhyBiKbNNKxbMCkPshI5TvzMR/izPwqCF4mPEsQS5rt0+0lYs6mKmsbUU1y5UQxwRhRdHqzbjBgXdTnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736408289; c=relaxed/simple;
	bh=ZPrpjusXFHZHMBSkGtLinPMSbao5GUsxWRW+r7oNRyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r/aNtgSCsMzoZrnmJfEF5sorQEHTV9hp0tuTuIdXfe5WDly6v+IaIMQ/rSnwL4C0hpGL1bBdwYuv9awdK2AWwBenprFhxk8j2or8igosbETu2L92UsU0sOBF4xwDGvTgqIRZc+PWE3JHazaLr504E4ozmQvDwTefr+BgXK1+Yjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jz96zWcs; arc=fail smtp.client-ip=40.107.241.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgxhLA42suKdNoRycMKDcihT3IFXMh4UQk+pgZ5Abv8eyJPuie9JnHtxmkw6C7wWodBzrVJPzmcmXmGsJgWGVmtctRieUcJHU7k7B0CxMh9ChsokYCGV7xvv651FYxEiwGa3lQJ8tYnoPWp7A1IN6vR+U3kwIs+Ed26pxNKdY7DURVYktdnW2ZphvJf2rXd8wkAp1vKtT67IGvOD5XDBQzbRl7TWIaw6f2pk3AHHRBnCvs0gtyp4+Wl1fV27e07g6msgrFGGRuA3AadsAEeYQoVTieQ7/yopv4uNioxtajZ0ehARWJlAUmwd3+U5ATTS7yu2Ru68A6S1t0+ntY5C+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+6KCECaJYPDglJp5z0GAv8H7fisnB095+rUBobZTUU=;
 b=tn2QmIe0b0KuuyfRrYCEmHirkdFPoli5tA1APDarSZLJrD8gT+YiSqFcUHH3fjRVde6qKlXeNl7Pm1DvQBV4X5AtxiLK/LrIzZIG4U5sbEjqcgzaeSLTUR//y6YUGP9wjik0Tab0x29JggO4DAnV/FaqUHjoPb9xNbWnY8QqLLkJlvenzuO7ovc7wGi82db883Gm/qDKQXhTRNxLRIZzVclL72IuZlmR6/NwjTEQfahSkkAtr/d5dnhcUnMBwMrf91D7fk7RBSrrnK40cUWn8aht+uyMjpQOk06mCs8mEPe+MHQ5O1TOVM97YDFFdmyMlTqgoapxMlstJkE7HHBJ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+6KCECaJYPDglJp5z0GAv8H7fisnB095+rUBobZTUU=;
 b=jz96zWcsS9VO+rsumR4pwyybrkmzjY1XTATTJgHruIwwfXYmRKWlDamKkwQDPSLw8ucckAQgIyQ8Y4+B/420GLgjtjZF2KGRUxsuIVbBDKdWHPtR1xAe1dn3bsFNPXI21BAcwdepzxwcjOYjmk92uURTpeh6GcNsczc9Vg9kZVX7SYzU0setYTNrSwcNcCleWTQmx7ZkB2RvVpNgq1dNH7o2ymGEB5U+W0IDqUqxqJyXcu+ORxdOv5G6ftxENVNy1M1cCE51H9aZPD+WG0YA+KL1U+ZEmmC1Dan9d0smbUv9CW0IHGQMKUb0yQD+XEr4tIECRH/B3/nZEBZu33GOPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB7807.eurprd04.prod.outlook.com (2603:10a6:102:b8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Thu, 9 Jan
 2025 07:37:59 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%7]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 07:37:59 +0000
Date: Thu, 9 Jan 2025 15:35:00 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: linux-usb@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, ritesh.kumar@toradex.com
Subject: Re: USB EHCI chipidea regression on NXP i.MX7
Message-ID: <20250109073500.45gge4abb4h6mmay@hippo>
References: <20250108093101.GA22448@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108093101.GA22448@francesco-nb>
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: e3df52b6-06fb-432c-c2ce-08dd30808a90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zLFFgMr472HGx/T7euPPinl/ztHvqoYIxd63XvAVS8DvlPOYWyYs3KShuyZZ?=
 =?us-ascii?Q?sgVSNbJ97YisvrpAR/FIuzANEy2IGr0ju7prb4w+klwVI+wK4Nb2FGA1psqZ?=
 =?us-ascii?Q?92hRCgVeFtxMLlp6t8JHc0eVfSIfX/qvLq96x2XbVxcKI2/r/1m9YWk6sHra?=
 =?us-ascii?Q?mSmtrzfXbvoFD8lNf9uUz/Sr7M0xZiEB3gVozEXtEMg932aPbG/qj1ifRXOC?=
 =?us-ascii?Q?MNaH5yUdfX15A1atFCEbtugwlsTFxYNpNSPDRNmSToTrKKfuNeIVRgMEz2a+?=
 =?us-ascii?Q?izt8ef+1QiTHK5Dc+i0i82RfoBTNvOGmNaeM40RUx/CZsyZBWhnK5kpI9qLX?=
 =?us-ascii?Q?5hJvNCrg3WOC7MNvA2o/yO7uHYH1dXr1ToM27sM6qpbna82vSs22ubCD/Wqt?=
 =?us-ascii?Q?uGN0zQUk1jwmyg66Z7/dknFGlg9zh+AuPxjq3lNKW5F6CuxmDY0j3rNDIBGs?=
 =?us-ascii?Q?OvLdpWOYqMVg4Gg+M/dhyXc3LNzH6ewWX2gH7s6m47Z16AMjvNAWkaSIocyL?=
 =?us-ascii?Q?h3K5k6ll+JLtlvLJODVvISNB3rHImtljJf0yyJ0EeYUmsIFewukI2Y/a/qZz?=
 =?us-ascii?Q?HzT3firv7k0yxw4gELlcm1GsVYkhAjgpj3GW6E5GyhaHMJqzc9SQFaH0wxc8?=
 =?us-ascii?Q?JFnxk1H1bysNG2Ct19z90FHZwrGP8dtrlggUoyG9vaR4wKCdxOrHmfFecet1?=
 =?us-ascii?Q?up70fpZQ+1fpvFJmO5hm7Fp8oFFZdYV6C0FDtypAgGwmx/Uk87/OZYMlmAKD?=
 =?us-ascii?Q?CZKhrNIUuZyGVsmyZJOI2w+4sO4gPRezuGicYDmlTMakna94txjrVd/lnva1?=
 =?us-ascii?Q?C6DUgXqIaiA78C+pRtbbSMrFxQLqciNBJgBWO85s6Hf5h883aOhjIigRH9K8?=
 =?us-ascii?Q?H3oEuqhj9DNWHSxhisbGs6oPo0tFs1+8ngUOwIYXLhKGmrTxV3mrKPdfU0dB?=
 =?us-ascii?Q?PgtWcGn4mzpEonQpPcCezK2hG30lje9lKpN0oSH3wZXn+QQA58W3W0HriUFE?=
 =?us-ascii?Q?tAuhPEW63qwKvcZdCx6ZdtE+E0VSO/aSN3+jwjJ+Slm9icRnLP2Cq8K6D7Kw?=
 =?us-ascii?Q?hn8hsi2QpVC2iYovKkkZss1XX91/aLACtAEt2Mnx1a4bNsRTkkCtDLJyPF5T?=
 =?us-ascii?Q?keR20XDEmN8wbAdK67kofXhQ+gZikokiJXeNW0WUyWefxzcCTGlYkV0zZBLE?=
 =?us-ascii?Q?ovj/wOuK73+A2wVjZYLuicztjLb7M+VYWsp5QdqOPNjFvC0a4PYLLRZCARFV?=
 =?us-ascii?Q?ik8/7n4os8mu6rR9miJdBhti+IgaDOGF+thfP9gw27XOyEki7UWQaqkX6Y+w?=
 =?us-ascii?Q?adGUY446+Gqa/m6V4/4fCUN5MII4H9A4C4L34ROEiNeJ5u1dfNAw/IHs2aXX?=
 =?us-ascii?Q?PPEQBayNzwCnd5UIsfCrucVCNjHqvIjkV4hF6asUkGT/Vb1MIz56ooVqhsJE?=
 =?us-ascii?Q?PN7IebVPxIhSTCvkbZmGou0CKiXAt1U/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WgcRejozSj5ZBXwMVL1NilMHoHOIE+KLWhHSGpa1zFl+cPlflgvNqvdlLejA?=
 =?us-ascii?Q?xUn5FTuPCCr9d0V3hrXoAq0azqMUoY2Q3s4fPw7g4uzjVEjy0OpTjq/yTME+?=
 =?us-ascii?Q?Xh8nwxbNO9VszysDrspt6dLQSAcA12OZY7i3ZpzfjiLbwPnXUb/koh+oVWsx?=
 =?us-ascii?Q?GWC/XRBe/gPFM8OksvGG8QXkmbMnoAgRcf8D4Nh4kOVCwSaSQaTiKBV4G8eS?=
 =?us-ascii?Q?LLLhapC5XX5qAIxt8Qz4a+Utn0yHMDhUTeO1kYCmK3ptFrHLcayNv/G1MpnQ?=
 =?us-ascii?Q?NoGJwuXH8mnDarsioBhcVoHKKO2P0tPVXHAetD2eoyG5p/5NUMgrcXxzZyDq?=
 =?us-ascii?Q?56nFpI6XEH39K5qA4VZ8cFQvP4YBqCwiojgL36orpB8CHou1hSMC4HheNkXN?=
 =?us-ascii?Q?IJkqRjWKBl27kOTyPDL0PAF0/GROvXmmJni4ELOFzLpAlwWc+WoomV5TpEt+?=
 =?us-ascii?Q?6s+yTfgtFa88vF9XLhyT2Rk2NseFJ7XTflEIFS3B3vJyL4YmhGiG5BxsXBKG?=
 =?us-ascii?Q?k6tm6KgWSVMQWVr+RFmfVvsXfKqXxD1XUP/a2EkWxVGw/mHZXymO1vyCO96K?=
 =?us-ascii?Q?wMAriuWnLCuxDHaDRH9pblpnhkxQPTCy2pyDRGGjsxZ/yz3W2Dhb2UUzh3x6?=
 =?us-ascii?Q?fRL4Zc4f8g0V+uILjZfrlfP+SdZ1T2XGvrr11d48Kz7kSUYj2Us35dhkud9g?=
 =?us-ascii?Q?PY7a7A3VuKFTc6h41uZXy43DMRflu7usK/+8eOQ7fdcgXwY40krMbixHsYRK?=
 =?us-ascii?Q?pVLM6UKe1VV1nINWtn0g0UgvprbJx3Um8QJGL4Ak2I5ctZlm6OnvuVoqHfJa?=
 =?us-ascii?Q?KUoX1401xmfj6OlncTuo/nGUKztWnKYKq9lOi663dWnedIrUJPOsmcFKup5O?=
 =?us-ascii?Q?YaWPuP4SlPKHNQgRbuIje/H+TwGBNjn41X8OF5Kf9C+Iq4oo6dZB6FV/jfSP?=
 =?us-ascii?Q?qTk2qj5tjWkvnC1e6+C3mGLA8+eokVWEJyLTc3dpbv+Jswd4eIR1S+XucZa/?=
 =?us-ascii?Q?u0gKK2MWjBj54nSlPdIwQTG3phTW++58hVlNtBoX3Asyc/5yT2k6vDeFCjS2?=
 =?us-ascii?Q?8MmtWxGJJ/oIzNnPhei9bGxcPkoni+3pvW26bb2TAs+bBw4VpE2aBVfoqeFd?=
 =?us-ascii?Q?z1/1iJ99NMXyPcxqrZTZieEpPixdSZT4xFQvaRbgF3Th2amBqGRRIrm2FdlB?=
 =?us-ascii?Q?1OYBfbqZV4WbAyNGpKi+Bsz4VZ2fAY2WRnNgMQrS+2d3kKEg2k6qZZauUWxK?=
 =?us-ascii?Q?ddPr44o9glxYNhVhoTQqf6UyBJQVW57Pb2AaSjQl2+0enuN2i6UlSG6oRLsL?=
 =?us-ascii?Q?efH5ui6U4myB5yTkpw++6LNeFPzvriD6hck1jg2a3Q53zdz7FPKc9fnEieeq?=
 =?us-ascii?Q?bX55FiOF5g6YuqbesMMzFNRDvn7wf2WdWzZ/0jYLu6Mc5R1stFbHBdr0Zo52?=
 =?us-ascii?Q?GR/x8fdiQs9CYg3KEQOSbZPS9dkc01xwuyf5yiSGUf0g8gmStk85DcRkvRA5?=
 =?us-ascii?Q?1V8faRCkdnXZ0/uyAaKUZZ2hGiq3Zq55f+oodbc1QCIZwPTFWLqj4w61Ixes?=
 =?us-ascii?Q?ilCr6HL4eUvVRdNj+c5EEEyzmG6Zr0yoJLaP72Dv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3df52b6-06fb-432c-c2ce-08dd30808a90
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 07:37:59.6953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QO3zFlRF++t1vP6eo1IEba/3Rg4xbpYE9IRaskpgZ0EHr3n9abtuqzmOoo/8LRfE2pAnO1KVPbQ0cEZNo2RvuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7807

Hi Francesco,

On Wed, Jan 08, 2025 at 10:31:01AM +0100, Francesco Dolcini wrote:
> Hello Xu Yang and all,
> commit dda4b60ed70b ("usb: ehci: add workaround for chipidea PORTSC.PEC bug")
> introduced a regression on NXP i.MX7 SoC.

Thanks for you report.

> 
> If the USB port is connected to a USB HUB, and a device is connected at
> boot time to such a hub, the following errors are printed and the USB
> port is not functional.

Does this happen 100%?
I tried many time on i.MX7ULP-EVK board, but I can't reproduce this issue.

[    2.314190] usbhid: USB HID core driver
[    2.923583] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.12
[    2.931923] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.939214] usb usb1: Product: EHCI Host Controller
[    2.944101] usb usb1: Manufacturer: Linux 6.12.3-lts-next-g87db307efae0 ehci_hcd
[    2.951597] usb usb1: SerialNumber: ci_hdrc.0
[    5.447736] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[    5.628792] usb 1-1: New USB device found, idVendor=2109, idProduct=2817, bcdDevice= 2.14
[    5.639867] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    5.647853] usb 1-1: Product: USB2.0 Hub
[    5.653574] usb 1-1: Manufacturer: VIA Labs, Inc.
[    6.417762] usb 1-1.2: new high-speed USB device number 3 using ci_hdrc
[    6.621455] usb 1-1.2: New USB device found, idVendor=0781, idProduct=5581, bcdDevice= 1.00
[    6.647822] usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    6.655189] usb 1-1.2: Product: Ultra
[    6.687824] usb 1-1.2: Manufacturer: SanDisk
[    6.692255] usb 1-1.2: SerialNumber: 4C530001230223105163
[    6.750484] usb-storage 1-1.2:1.0: USB Mass Storage device detected
[    6.785959] scsi host0: usb-storage 1-1.2:1.0

> 
> [    1.131847] usbhid: USB HID core driver
> [    9.471549] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
> [    9.516311] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
> [    9.516697] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.06
> [    9.516728] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    9.527751] hub 1-0:1.0: USB hub found
> [    9.827109] usb 1-1: new high-speed USB device number 2 using ci_hdrc
> [   10.029600] usb 1-1: New USB device found, idVendor=0424, idProduct=2514, bcdDevice= b.b3
> [   10.071198] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [   10.111575] hub 1-1:1.0: USB hub found
> [   10.741225] usb 1-1: USB disconnect, device number 2
> [   10.789292] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
> [   10.843210] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
> [   11.361157] usb 1-1: new high-speed USB device number 5 using ci_hdrc
> [   11.891163] usb 1-1: new high-speed USB device number 6 using ci_hdrc
> [   12.231248] usb usb1-port1: unable to enumerate USB device
> 
> The issue was reproduced on a recent v6.6 kernel.
> 
> Ritesh, in Cc, did the bisect and debugged this issue, he might be able
> to provide more details if needed.
> 
> - Any suggestion?
> - Can you please specify with SoCs are affected by this frame babble bug?
> - How can I reproduce this frame babble bug? Is there an easy way to test it?

As of now, only i.MX7ULP and i.MX8ULP will be effected by below commit:
12e6ac69cc7e (usb: chipidea: add workaround for chipidea PEC bug, 2023-08-09)

Some things to confirm:
1. Which board and Soc are you using?
2. Does usb host controller work well after system boot to cmdline?
3. Do you meet this issue on usb hub and usb devices from different vendors?
4. Does it work well by only revert commit 12e6ac69cc7e?

Thanks,
Xu Yang

