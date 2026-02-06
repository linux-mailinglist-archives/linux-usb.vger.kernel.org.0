Return-Path: <linux-usb+bounces-33134-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGDWGi7AhWnEFwQAu9opvQ
	(envelope-from <linux-usb+bounces-33134-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 11:19:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC270FC968
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 11:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6FC7307ACE7
	for <lists+linux-usb@lfdr.de>; Fri,  6 Feb 2026 10:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81D037104D;
	Fri,  6 Feb 2026 10:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nxXMtbgz"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FF930FC39;
	Fri,  6 Feb 2026 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770373043; cv=fail; b=KgRL/RUf15eKnxoVz5ToCXHGFm2E8LGCZkyelep1d/Uwfw4SpQBYGsl2sMQFmoRj27qtXqZVokQ/mgjzFkvM94/5PEjxvgaE0QPt5mv6FkD3OLOlJqy98VXZ3/0L8p0JjNItD1OkuqEf3xvKvARZ7kwsAOh6JA1kfIHiiIFsBqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770373043; c=relaxed/simple;
	bh=4gLSSopMSfeWDAyU+6fLa2vh9dKLtMHm06CIRR0oh44=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kM6gnJGQC/sAQCjp9gDF2L01IzejMK8inb6tlQr1uoPfk4cLuR5uealiPvhApBMl8NUANtbnT5xiTAUViIttPq/Yp5yErojgeZy9cO/SNXFiXSJcqYPNqhh3iPGIKLJwN66IXJHnY4H89ohW7l96YWRpJKC6DYg9bzrfVVGLn/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nxXMtbgz; arc=fail smtp.client-ip=52.101.72.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dcUvxyoP8RUaSQ29RTBDS9xhgmo5IJnXvR33oV9eyEjM+sPz7xV90XbswVraWEL5VTMCXPWB8BIWTe+Mo9+/1w0IY78F5YGZ/gtcQUBuG6SYXtXT27SapJUlj7ZdUk/eMj5s5J8Qc2vuD9vS+TyHbeih9qA2LIVMmWFGrI4dH87FMDFW1HgQTQK/AxHIKOxJ7p/QgfacuoP8Q5nN616sEvXupZy1dldiqR3x2alLVnpz2I7NlceUixhC0V9XlmXeSzqvP5HKjifP/3ZypSqj7Ph+dW8Ov3N9q9A5IP/YwiMCEtq6lva4ZmPrIPfFLhxnjDRzqL9gHhzB38CeI3UxZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OqatJVoT/mp/XvBfYFNuX2i0bZ33SFE6Rc17RrBJSE=;
 b=WvGKEx7AACxcnXbWvDTpoZv/Qz849JYsYUwmI1pthJD5+biKpMCD9bgjuD3Eq4K5K80hPwb0Tf9KsvFu3mmjTJP0T46KwxXkbcWqZttaaOhcMebC76nAF1ew1jfbxgIrHsihrUcmyYDFHdLysotjnqJtk82pjJjPEx0rgnHwYkdFd7FurRHRtGPzr+mBXITwwNn1Fx94IeYeuyo3XDHBUei3YbhBN99X3tRzI6qIG5c+DBcf0y70F+P6LxNiq/RdqaydShkk3KUsqJlp+yLcH0s2tojeZQNBULa47ma7QcEoHysjvVPgIcDdCmjCyUjotlS2veKx5RtTQhC/WN845w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OqatJVoT/mp/XvBfYFNuX2i0bZ33SFE6Rc17RrBJSE=;
 b=nxXMtbgz9Z9nd4UB0qWr51otyeqeAWES/AKFk9zaV/RBA2+l8picV1NgbgjWGpdcGdnnzba8Llb6MPFZVN7PopZotm/JtxHMnggYovhzA38d6LmZ6BkUJwIg2S3GUYESe5+mToevO+HxKsGqHGuMmZhehyIPec68oWMzKkAv2F5FAYfBRt4KTVZ5+y7dPdVrouz9WnnwLXrhmT/babrJOR9hnEOUU0PWhjoQkdkLyXfYTKvKWEgGWXfCbbQjvTKNdYFjewUmxs/0nPi2jKIjAXIPsVK/F7bAmfVjnIZ0zSaCzxFFMe7vLJqpF8eqoF9PRmAD75lhLImUWBIV7RYfSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS1PR04MB9477.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 10:17:20 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 10:17:20 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Fri, 06 Feb 2026 18:18:49 +0800
Subject: [PATCH v3 1/3] dt-bindings: usb: introduce nxp,imx-dwc3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-1-ebd9b9b77049@nxp.com>
References: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
In-Reply-To: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770373141; l=4878;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=4gLSSopMSfeWDAyU+6fLa2vh9dKLtMHm06CIRR0oh44=;
 b=0j1YP7MKY9ewpWOq8RP1x/z9hhIvOUzOH0NAxFy0sAJ40vqlNeSAwmUz+dICtD2CGCkgIFpKR
 rqQ/xnjkwubChG835ftefSZEGz+Sv8YwplN6eRVorSACQCFvyKIRbgM
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:3:17::23) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS1PR04MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: 75d6fa7d-70c2-462c-5390-08de6568e9d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0JOajV2czNoLy9jZjZQUy9rQm1tR1ovZUplalFGQnhnM3FKN0VkNThuNVUv?=
 =?utf-8?B?RytGZnZJWWxESFZjZmxobEY4TDRVeWRnNlJ1S2FtbGc3cGUvWjhJYU9mK3Rq?=
 =?utf-8?B?enVJWUhDRFFtNTAraDBOM29MalBSSmtlazRmbUJaTjNQYldZSHYzemRhc0dJ?=
 =?utf-8?B?OWJkdGRha3pWWWc0cjhMNXRwbVZzUThYRXZPK093SmtQb3grb0VtWTAyTHI5?=
 =?utf-8?B?YkpOekVsWDlxYmVuaUo4aFl5SVZQY0pET1RTNmUyTGRKKzZYL1piRWNlTHR3?=
 =?utf-8?B?MmxjZDU5d0N1RXdOaCtEdUoxdVY4VXYvT0J5cDgxTjRHNktyZnRBVWl2emMv?=
 =?utf-8?B?M29xUU52TzRkWU5FSEdSWllyanQyWGtNdXBjNDNMSzBwOFY1Zk9vcXFDd1B6?=
 =?utf-8?B?Q2xxR2lhWFYwTmE0QVl3Y0tieGZmUllUN0lIeE9DK1NlUFlVNjZBQ1ZLN2pu?=
 =?utf-8?B?OXB0LzFya0M4WmM3eFNSQ3N6SWVqbG1RdEsrRTVPcUVZNnNkdHowTit5OUFn?=
 =?utf-8?B?Y0t2VEQ3RWlJTG9YcXd6R3FTeW9vWXZFQWlpRFNKOFpsYVlIZTdhZFJ2K0pX?=
 =?utf-8?B?dUUranZPb3pFL1pXd3VKc3JZK0lEbWZZdFI1d2EwbUU2aTJveEpoSTY2aFMz?=
 =?utf-8?B?ZDNPUHc5NUdwK0lvMXdDckU1bDVub0tuZUpLd2VnNU92U0ViZ0Y1QXdGYWdF?=
 =?utf-8?B?ZkFYa1FGQkpDWEFQT3A1QVQwTFVkSHY0bHRtRXk3aTJkeDhTQmFFTFloUjZG?=
 =?utf-8?B?SG5XWERWTWxSYjM3Y3NWdlAyYXliSTdidVpEYmttMFl2NWxneGFEc1BtVUt2?=
 =?utf-8?B?b1FaVFlQM2cxWVJXQTd0cXN6bDVGdUJLZlNNdGV6RDdMZjVtYmpRcTlMT2tt?=
 =?utf-8?B?RlJRMHpuS3F6YVV3WGkyL3FuaEtSUnVFM1A2cGRsUjhRclcvQzBWU2dkclkw?=
 =?utf-8?B?ZjJUUy9HaG1xZDYyb0hlVEhvdmV1eGpGVXZienpTUFRkWHM0ZWlMTDIzb0Vz?=
 =?utf-8?B?M0JWT0pGRlI1ajY0enpJN29jL0M4MEpUMUsyaDlYYlVSRXpGVU9BY3JjYjVW?=
 =?utf-8?B?TFpObExwTWR6VEVNN0lwYjZmdU1wWU5abUdEUjFjQ3JYWjJkbUVNdVVyak4y?=
 =?utf-8?B?dEhKYVF4NmRFR1JNRzRyc3pMUEk4c1hyOW1KRzNHRjQ1TGxVZG5OR094WXYz?=
 =?utf-8?B?Wk1TUXJicktWMEk4d3UzQWdadnNXN00xeHhhdTJjZjdKTXBZWlFXSkdmKzNz?=
 =?utf-8?B?YzF5SDZudC9FZGRFUzVNdHFId0Q0emkvYXFHdzR2VnJlMmhTUEtYT1NmZGNa?=
 =?utf-8?B?SFlOR00vRjdWSm9YYXlobXdmZG5yaTk2a3VMdE9mQ0JHU3dtZCtReFNjRDQ2?=
 =?utf-8?B?SldoKzVkY1FyMW5Dd3VhS2JaOS94R2szRWYwQW1aZmo4UWg1VFBKaGFENm9w?=
 =?utf-8?B?azdtQ0FRUXdQZ3lzblVLdGlWcTB6UDdKNnZ5djlYREVTRGI2bTFzWHdUSlBY?=
 =?utf-8?B?SUN3dTRJRGpkc010ZEhRb25sQ2krWDFGd3ZkVmJCWkZBNGlnUEVjWm44cWI2?=
 =?utf-8?B?VFYvM094dXNzRzBGdENkTTBUOVdLK0wveW91QUZvNzhkZWJpRFptajFSTWFa?=
 =?utf-8?B?RlMvTWhSUEZZUlA5cHdTcDRUOGdnaU5YaDJmRXdaS0ZITTMvS1JBV091SGg5?=
 =?utf-8?B?djNPTmdCS1BBSUg4TXpIT250SlRBZlpkaTQ5aWpSM2VIY3h1RFEra1JTdGhy?=
 =?utf-8?B?a1BpOG80azFaOFdTZEZFSnFpQzJEak5aalRPMGx4aGRKRis0b0tUak4wa1ZU?=
 =?utf-8?B?Tjhacm9ENWRjaWxqZFdpK1M3UWZZQVFYZS9PcnFiWHZnQ0FTOVJUbng1aExE?=
 =?utf-8?B?d3A2MjQvQWM5U0JJdDFNMGhBOHprN1JIbnlqajZ6L0FEMW1IZ1FRMjZEK3dO?=
 =?utf-8?B?Sk5vamJiMG5UUkRIditWS0Z2WmJmT3dER2RzdFRiYkhkcXpTNnI2QjhMRXBF?=
 =?utf-8?B?a2kwL3pEcE8wckZpYVl6ZGQwY2VJcnlmWHVNZU5nUlFRRTZUallXUld2dUJs?=
 =?utf-8?B?T1lwbmh1S0tiQk85cmE1TjJHdVNhci9oODVBYy9mcmFMS2pzZFdjaFJ4TE4y?=
 =?utf-8?B?b0JVUEFWVXcxWXU4RDBFbXhvQzdQbVFFUGw1QkFxL3NQUmE4UE53ZkwyMG5U?=
 =?utf-8?Q?zw0m+xJryyCRDDKdSIWW0OkARHWRrFNNoOh3oZSkazKr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cENsVDgxVDJ1MXh2UzdjL2FYVU5QZHBXWGdzOVZjQm96S0tsTWl1UXhRVWU0?=
 =?utf-8?B?cUhGVWVwczZWUlc5dTR5WlFUNDhWdlR6TWEyTVkwQkgxQVhXL1p2VEtwblFz?=
 =?utf-8?B?dG5KV0x4QVZsS3o0OWl2RktWWndZOG5EUHN4bTVsc1hPViswOVdodkRNbkJW?=
 =?utf-8?B?ZmVoTUJ6N2pmUkRJa0tld3JuanFqRlppK2szQVNiU1JaRlExTGMrbDRyaGtZ?=
 =?utf-8?B?b0JGaGVMYjc1ZldkUzNxMy95dTF3OERzbUJqUXBUejhqSWx2MmdDTGtzZzBJ?=
 =?utf-8?B?eElVeGd2K29pZjFxb09hcXFESGRWZnI5YU41allrMHBBT1MxckJXWElob0Vn?=
 =?utf-8?B?eDdJdXNOYnNlU3czNXJTWCtEakh4SzdqQnMzOEN1d2VieDFidFJNTmlCai96?=
 =?utf-8?B?YkRacjJWVDBXcm9IR2s4R1l1eUNud1pCS1RnN0NTVHJIekZ0ajkxM0xqYU00?=
 =?utf-8?B?dnNoQlZzWFZFamNCeTV3SzlmSVgvN2U2ZkNXM1V6ZmU1eERuK2VNcUNYMHkr?=
 =?utf-8?B?VFFJU0YxN3VHemxXQWg2N2hVZDZCM0VoZ1NpUUIyeFFvK1JoTWtvVDk1Z3E4?=
 =?utf-8?B?Z1VNVzg2RGxJTkNTRy9SYU8wR2Q4c25CUTE3N1FodzFwakdnRTFuTVNnRFo1?=
 =?utf-8?B?c0c1OG5LV3RMcWY5NHJ3eXIwekdNYWpDN2lnb1R2cVdlZjIxaHRrQUFVaDZ2?=
 =?utf-8?B?cHhWSFpYZGpMeWJHVXR3Mll6SzYzclZVTXlUbVV1SlA2bWFMN3ZzYzE5R3JX?=
 =?utf-8?B?VTc3d1U0NlFWS2tWdlg4eWFYMkdERmdLdGJHRjJ4emNRNlphYkwwKzd1NGZY?=
 =?utf-8?B?NWY5SHpNcCtCeDFjdk5UTGpDU3RBa3BsVEFSNThWcXRKSjluaEE2a3VlUWtw?=
 =?utf-8?B?NURrRWdyTFp0Y2JJNnF0aVlKT2lZZU1kREN4SENvVUVNM01wQlZlWG9Rd3RU?=
 =?utf-8?B?MEdJbjRHYzBJRGNRVGE1SFFFL2dDRVFIOFN1SmE1Q1c4TklsbzFOZ1dicHNN?=
 =?utf-8?B?TlBBdE9sbjFGNkt6bnhDbGNrUjRYSEJsSFY0SnMrQlZqN0k0MEJFOUxONGZs?=
 =?utf-8?B?MjlrNzZFUjIxRGYyZDFIWDhBVlZ3aW9uT3RHS296YytKYWRiOERrazVTbkFt?=
 =?utf-8?B?WXZKUVJQek9ieWNYeGlJL2RSenkxcjE5cFMyaHJhcFJmMFlLRnhkbEVOMXZI?=
 =?utf-8?B?UzhJc3dIdnZpR0ZaaHpmK2hjM3lBUWVCNW82bzdIQmNGdjRzcWJmcWZQTkdL?=
 =?utf-8?B?clJwT1EvK2RERU9mZmh2c05qSk4xT1ZWbGEwSG4zeTczbTZlR0VoSVZnUlhH?=
 =?utf-8?B?b2c0L2xmUTEvZWFROHZ5dXdGYmNKeVUyakphNFpEYjA1RENKS2tpdENVNnpi?=
 =?utf-8?B?UEdIZ2VZQUpQNW1veFUwcXA5MjAyTGpwY1FoTjVpeE9yRnY4REg0NGlPcHJP?=
 =?utf-8?B?NHpuVWFzRVd5Z2dWLzVUSWpRY2hLbm9ubTl1ajczRXNQUmxSaG82NzBMUnUx?=
 =?utf-8?B?Q1psNVZ0YzRGcWxDQjlybHB2MjNIbVo2b09LOUF3b1luSlBucmZhajZBTzFR?=
 =?utf-8?B?bXQ0WVMxS2lPdURpbU5yYWpHUG5IQ2tLbzVpYmxQWmRUVEU2My9KeExSR2s3?=
 =?utf-8?B?UWZmUjVVSlhzQmt4RUpSN3ZKQTh4U3JLRTJRM1dMakUxR0thWlYyaE1Ea3hr?=
 =?utf-8?B?bUIyQTQ5OGxGZE1IbnNVUC9LeEVtSFEwMy9pb0ppZ2pJZWduRm1lWHdENlZ1?=
 =?utf-8?B?amZnY2IwY20xYnVYbHNTLzVZWjVrekNsY0FWM0ZGRjFZcTh1dk9BbHN3SGsy?=
 =?utf-8?B?dldxZzVRTklHUWZLdTBBMTJOVTEzTkJtVHFzZlFmUW44MVlVTU1vMklDRHNN?=
 =?utf-8?B?dU1mNTJSMnNsamNyTWpCek4vZTNmVFVSczZKcjJEanFpd2dITTRPV3lMMEU0?=
 =?utf-8?B?U1lkQUFCZTFnTW80UmkxWnBDWGtrelgyZnhJa1FiNStwNXZTNEIxbUlyMXdq?=
 =?utf-8?B?Wk14V3BzaDF2cVE0UTViTVhCd2VaMEtuS3o5OUdUa3k2dUhXdmxmajlvdVR4?=
 =?utf-8?B?RnNldnBmTDM5enJtbGdPZ3FxaHlJUlFqd1F3b282bytVK05mSTJKdXRsMFRE?=
 =?utf-8?B?UERnNitCUS8zWHZWdmU2N3FmVnM2RzZvdXkrL1ZkYjc5ajFhOTlWdy9FclpD?=
 =?utf-8?B?UmRSQ0FBTXRLTWVwVzNzaG1OR3A1RzFUc3V6Zi8xdkV3dS8zajJTNkw0OGJW?=
 =?utf-8?B?T1ZYMnRjUXFZQkJFWGhvUDJiR0hpam0rbVY0UVY0Q21NZzRVU1lMTE50WjUz?=
 =?utf-8?B?M0hkK2FKWUxvRWh1R1J6SUUwdzAxMUxDWXQvYmEvNVhiSjU1dVhMZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d6fa7d-70c2-462c-5390-08de6568e9d4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 10:17:20.8100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/nmBLbP7L+5Jn+WDD9gcytdjQOtiIxn4yWaKM3wi3T8TXsGLvUHaMsXhBF9hUi7HL0HFr7t3q8Jk63WPXesLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9477
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33134-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,i.mx:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,4c100000:email]
X-Rspamd-Queue-Id: CC270FC968
X-Rspamd-Action: no action

The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
USB block in a single block will bring more benefits than a parent-child
relation. The new binding is used to describe flattened usb controller
node. It's a copy of the legacy binding fsl,imx8mp-dwc3.yaml with the
needed modifications.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - rename file name as nxp,imx-dwc3.yaml
 - rename compatible as nxp,imx*-dwc3
 - remove status property in example node
 - remove select block
 - modify commit message
Changes in v2:
 - reorder compatible property
---
 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |   2 +
 .../devicetree/bindings/usb/nxp,imx-dwc3.yaml      | 123 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
index 73e7a60a0060..66d368e65c0a 100644
--- a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
@@ -10,6 +10,8 @@ title: NXP iMX8MP Soc USB Controller
 maintainers:
   - Li Jun <jun.li@nxp.com>
 
+deprecated: true
+
 properties:
   compatible:
     oneOf:
diff --git a/Documentation/devicetree/bindings/usb/nxp,imx-dwc3.yaml b/Documentation/devicetree/bindings/usb/nxp,imx-dwc3.yaml
new file mode 100644
index 000000000000..1911e71f01eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nxp,imx-dwc3.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2026 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/nxp,imx-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX Soc USB Controller
+
+maintainers:
+  - Xu Yang <xu.yang_2@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - nxp,imx94-dwc3
+              - nxp,imx95-dwc3
+          - const: nxp,imx8mp-dwc3
+      - const: nxp,imx8mp-dwc3
+
+  reg:
+    items:
+      - description: DWC3 core registers
+      - description: HSIO Block Control registers
+      - description: Wrapper registers of dwc3 core
+
+  reg-names:
+    items:
+      - const: core
+      - const: blkctl
+      - const: glue
+
+  interrupts:
+    items:
+      - description: DWC3 controller interrupt
+      - description: Wakeup interrupt from glue logic
+
+  interrupt-names:
+    items:
+      - const: dwc_usb3
+      - const: wakeup
+
+  iommus:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: System hsio root clock
+      - description: SoC Bus Clock for AHB/AXI/Native
+      - description: Reference clock for generating ITP when UTMI/ULPI PHY is suspended
+      - description: Suspend clock used for usb wakeup logic
+
+  clock-names:
+    items:
+      - const: hsio
+      - const: bus_early
+      - const: ref
+      - const: suspend
+
+  fsl,permanently-attached:
+    type: boolean
+    description:
+      Indicates if the device attached to a downstream port is
+      permanently attached
+
+  fsl,disable-port-power-control:
+    type: boolean
+    description:
+      Indicates whether the host controller implementation includes port
+      power control. Defines Bit 3 in capability register (HCCPARAMS)
+
+  fsl,over-current-active-low:
+    type: boolean
+    description:
+      Over current signal polarity is active low
+
+  fsl,power-active-low:
+    type: boolean
+    description:
+      Power pad (PWR) polarity is active low
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@4c100000 {
+      compatible = "nxp,imx94-dwc3", "nxp,imx8mp-dwc3";
+      reg = <0x4c100000 0x10000>,
+            <0x4c010010 0x04>,
+            <0x4c1f0000 0x20>;
+      reg-names = "core", "blkctl", "glue";
+      clocks = <&scmi_clk 74>,    //IMX94_CLK_HSIO
+               <&scmi_clk 74>,    //IMX94_CLK_HSIO
+               <&scmi_clk 2>,     //IMX94_CLK_24M
+               <&scmi_clk 1>;     //IMX94_CLK_32K
+      clock-names = "hsio", "bus_early", "ref", "suspend";
+      interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "dwc_usb3", "wakeup";
+      power-domains = <&scmi_devpd 13>;   //IMX94_PD_HSIO_TOP
+      phys = <&usb3_phy>, <&usb3_phy>;
+      phy-names = "usb2-phy", "usb3-phy";
+      snps,gfladj-refclk-lpm-sel-quirk;
+      snps,parkmode-disable-ss-quirk;
+    };

-- 
2.34.1


