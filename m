Return-Path: <linux-usb+bounces-33119-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDg9Mr93hGkX3AMAu9opvQ
	(envelope-from <linux-usb+bounces-33119-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 11:58:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C38F18BF
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 11:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAC2D301C923
	for <lists+linux-usb@lfdr.de>; Thu,  5 Feb 2026 10:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D293A9D97;
	Thu,  5 Feb 2026 10:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fGtjrgYi"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011071.outbound.protection.outlook.com [40.107.130.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ED93A7851;
	Thu,  5 Feb 2026 10:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770289058; cv=fail; b=A7cqvR6+yS9BdtbRh8DaVEeRta8mmrBfyHE+ZnVQaBrpc8b6uOQrNG/s8mQhakOasnvgr8b7bAp/4yFwJiKy4XPTYYsfAI9QQo4+IVcaZTTOO/B9pE45ZefjD2s6XghVBxX5W2F21hfX6KqJdMKzemo0jd6SJPRAqTZ4fK1U3Zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770289058; c=relaxed/simple;
	bh=SS2Lr+tjF7+IqMZJwI6TTLoNbQAKVTg+DsYBWVGurSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cMy4/m0bLAwaWBoSLueompNuCfg5ix0NuE45s9X/DMV7vxQmvmBLxYQwlmgdKARo4fq0x1XeKh9OIhsrkt3a+VLlE4E6p3Vx6Uh3Uqm5ujrnQuQ2OWmxm2oSiwv1v+uQ/QL7Y4ttdWfi1yoAKiitTKu3rn5KXWovLIjH9TU63HA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fGtjrgYi; arc=fail smtp.client-ip=40.107.130.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oovfCpN0qyiPYQENBk/jzS815uvBvFzs8FCW6tMAYTVoIbBBfbdxypnoFyFi2GYC0L/gU/FcznlhTZdONsNJYv6Y6sefB73Xm52KRc03l4L+jwDs4khkYF0CYx7FbRGr+m9+PHwb08oqjWEeZ02muWZfBjwVHlsuYmhy9JJxyLsxdrvMzSWvXUgW6SODv2JTvktTjkK+fSPovF734VjX2rU1gc0WJmN8nOW1LKDQ2y6oSm/9jsOhbc3D9k6PrjS5wG2kSGUsB4silacntpWFyBKCid5ogh0wCjy1Rgu2B5uTpLOklarc2CHlMDks3Ugo7HpzqmBNvefW0noclgw7VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3JJr7J5dow/K9hEZ4R7JsVrQ6H49V6XkeUobLNy7rs=;
 b=LLGnTOjobmgj2AISKjt+yhDxDbxwjuRdJAFiv6zQOm1GhAqJlLWimjTjVBCijaeULnN+CU1L0KbxL/fWO+Qw4eW6ySLz31mQb3F76Ecv30glO2FKaLfNRs47RSnjGxBH9biYZuBntYNrqlAZ5UmZaHt4mA/Ucy2h0e6TcNVHJy7npDDTKjoUktxgumq0oLc1uNOvL65IGktzuOg7xVAGnGfBc2c1pN/rB2f1M+hD4tnKPgQTh6AONiA9aB4pgQcPnHYvs5RENf8vIuhVOtS5tfOiU48n6w1CYkLwjXVNYrd6Jt2rJcMY7k10pcuNZzVUVLmq79iXY3BVqtK4oD8KYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3JJr7J5dow/K9hEZ4R7JsVrQ6H49V6XkeUobLNy7rs=;
 b=fGtjrgYiClZNC4h1iy/ocQC6YGFHUrvCHOOVHOXP6vKKlTs1qeLwUif+sp/98p+KldV6Lh4YEOLnPSQ1l27YL+IiRDW7oV0mxzdzKUn+Nj1UanL3AIs4JHQ/f+aw/7h/pw1HrMNCVNl/vsRtJZjmAlhJ+60l5+KqJghz/ijaxbkq119HKcySPB2X2Dt4B7fCaAadwQhdUNSnvQ6gsbv996Q2Da+G/NW96L+226Y2TCuD3GK/rEfnnsY3xGs1Ia6mMzpeGrEKf9AYe5HSqWGVMMkpF2G5em5AriRNCFxQZlpqJEiKgV6onP4GPzIipMm65GkZm6eplNQtkL7LQchUMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 10:57:33 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 10:57:33 +0000
Date: Thu, 5 Feb 2026 18:50:02 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: introduce fsl,imx-dwc3
Message-ID: <w4uvuyj6qpufajyo7cibwmhayfhkspg5pybbqlxvizv53qbyhw@gmrfwbqli57p>
References: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-0-d2c9b5a58c01@nxp.com>
 <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-1-d2c9b5a58c01@nxp.com>
 <CAL_JsqLcqSKgNjx2nejwjSsNPwqAmEsRHX-6YwE-8r_32C4=ZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLcqSKgNjx2nejwjSsNPwqAmEsRHX-6YwE-8r_32C4=ZQ@mail.gmail.com>
X-ClientProxiedBy: AS4P192CA0010.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::17) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 12012239-8b84-45d7-9bbe-08de64a55d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWNzSm5HMjROV05uL1V1MElRUHRzMkpMWnd2a202cTFobU9SU0pWbVFmaVZG?=
 =?utf-8?B?d1hZSmlLbFp0bFFWOEtVOFY0RTB1cnlIZWVNazg3dHI0V1NKaUVQUHdmL3c5?=
 =?utf-8?B?U1M2L2hsUHowdThXZDlJT0dWMmYwb0lmajloVjFQYldVTWtTSWpFOE9MYjBY?=
 =?utf-8?B?VjhCZWJuN09XV1BmUWhXWWdhZmJNM0tWLzdGaW5TRTlIanQ1aWp2UVMrQ0ND?=
 =?utf-8?B?WjBqbTRWQmtkS3FoSC9Jc2dpOTlhT3FPbHNiLzBpVzE0K0U3ZHJoN0o5Qld1?=
 =?utf-8?B?R3ZaMDU3ZlladDg4MU43Nmt5TFpsdmw0Wnk3ZndIaUtrL3VtaXpPaUFGQk5a?=
 =?utf-8?B?R3VuMWJhc243RzkrRWxBUkRqaVU2elJmdkt1UlE3Wm5QZjBtODFUWmxIOFFh?=
 =?utf-8?B?eGlJb0VTaHdDbkk3WGZQRVdEZys4bjRXT2swNkVWYVovWk4vRDVVK1pNVGNN?=
 =?utf-8?B?NUhEL3pnY3ZmUGZqZllYV0VlT01NNU9DbndlRGZuNDhmUkxSR2FqSUIrdlRD?=
 =?utf-8?B?SHlRZ09aOCtseGc1SVZpeHpCT0tNZndxbkhyMU5iakFHbk5XVk5ab242SHNP?=
 =?utf-8?B?YTdRYldHR3BwZENhT3YzQllTSUtnNXVkdGgvN3h1WEpYVVpmVlNwbEVLeGJC?=
 =?utf-8?B?ZmVzSDkwQmZCU3BwdUdzblRaNHZEa0JDQ0ZKQmNSNHVUNmFVZnNyY0J2Y1Zw?=
 =?utf-8?B?UWV1WHFJYWdYeTdqeGpjOVNDTzhOZnVHSmY4cG93dENJWjhrekRSY3c3VHpn?=
 =?utf-8?B?Q1V4YnNzdmd6cXl1TmZzcnl0U3FPbUVzeGpEKzJIOW83TVZGR0VrNU9PeGJM?=
 =?utf-8?B?RllIbExTOTRqd2d3eFdXQ29OQVZVSTl3L1BhbUZtc2pORXN4cDRTckVxeTR4?=
 =?utf-8?B?VEZPRjlySzhhUEJlcDdnNTM3cmZZZ0NEWUErOUNjSzlwbS9vc2JLTmRIYXRF?=
 =?utf-8?B?Q3NZR085KytNdVB1dHMwMFBMdkFZMFhFcWtzQ09USUJ1WnZIcWkxVHE5VVpv?=
 =?utf-8?B?VWdCdUpTK1FCTjVLd1A3eFpvUjcxdUVEcGt2MWJNamdFeHZyMHhoVzJPL0hP?=
 =?utf-8?B?aGIvdE8yb05YQUtoNHdYOElRZnBCbE5MbGtTN24vRXQrVjVhK2xwZDJybHNY?=
 =?utf-8?B?TXpRdFh4S0tocVd1cDNQaWFkbkR6dlkrSW4wbHN2Q1gyeXplbmtsNmRDUHZv?=
 =?utf-8?B?dFNLaE1hSytISnZId1FFTDNmWTlsaUIxUmNTMGNzblp0aDZKczBTTitETTdX?=
 =?utf-8?B?N1Q0U2VDQS82dkJINmxwak9sQXYxazZlWjExQ1RVM05WWVcxRVV1TEl5MVRw?=
 =?utf-8?B?Ykg0dUhjRFM0d1hmby9sRDF3LzQya2hqQ2N1dlpsVDR4TkVZSHVRdE5ZcVRZ?=
 =?utf-8?B?cVNuMUJtek13Q3ppdXpTM3NjUjJvdTdYS0lNRHZZVVA3Z2llR0dmeHI5ZVpS?=
 =?utf-8?B?Y2k5bUNHS1pLdWVVVVZHeVZiZ2JBS2ZPYkhkZjRPb004T1lPZTZab3hBTWUr?=
 =?utf-8?B?aGlGOWV0VFlQVUVWblJNS3k2ck1hb09vLzVGSG9JWjBvWGFzTFZLQ1U4TlRj?=
 =?utf-8?B?Yjd0S3NvdGtzQ1RMd0JrbVlYSlRrM1RuK2Y0VnIydVl5SmdRRGtXN3FReXgv?=
 =?utf-8?B?UWlGRGZIMUo5bUJ5MXJJdnd1VTE3dzhjeEQwUlRyNDVYVi9ZbmtXWDU1MXZM?=
 =?utf-8?B?WlBObHg0SGVWQzBLUFE4OVlGcjU2dmk5TWVPdHlEMWNsVjY0ZHR0RENYeDUz?=
 =?utf-8?B?elc3M0xoNkI2YXduNDF6NlIrMld4ZDBndmVMbEZzeE41ZVdBTzJZeTFyZ1lL?=
 =?utf-8?B?ZU9nTVRBRnU2WXNKeGtOYWZuZm1zT1o5Wmd3Tm91Zi92c2gzMkZaakYrV00y?=
 =?utf-8?B?N3VXTHMvVzdKZU5ZcVFwTnNUVSsza3ZxdTVDeXBFVVJzRWtHTEtHOXdIRkxt?=
 =?utf-8?B?NmRrWFlWRERQSVZvYi9NK0NuQVpmdUtYYWdXelZaR1c0cDE2dk5DS2Vta0xp?=
 =?utf-8?B?VE5odVFocmdmRDI2aGdYbWEwNW1XN3lTSEtjdEtzTzNrM0N2YkJRLzdjNGFB?=
 =?utf-8?B?K0ZtcTIraytOZXU4L255QlJCdjV0V0xGOVhGSnU1cXlrY2hFdDZBSENVajlz?=
 =?utf-8?B?dHQxbFA0ZGY3RVVEMm9PSkVqKzFtemJMZUVWT3BLU2hWWjNoQ2tLWGhHZHM4?=
 =?utf-8?Q?/SKT9X8o8iZbMrV7Q1Vqyn8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWw5ajhSL003SUJmY3RwWVNHRXpVeFd5Y2JibUJENk9yTThFSDc0VkRMTEEy?=
 =?utf-8?B?ZE5kTFNXOHF2WEJwZ20yTlpndjFLMXF1NjMxOU82ZVZqUG1zd2VWZnFEeHNV?=
 =?utf-8?B?UEMxVE82UnVBdmRWRm0xSEZLWjd1cGNwR04ySWhHemZDZFJRV1d5d0R5b3pw?=
 =?utf-8?B?WUo0b01mWTUrc3paN0trdW9SUkE0endsZzVUcTFxeDlUa1JYYjd0NWlaSCtq?=
 =?utf-8?B?QzJhQ0J1WEZ4eEQ1WHROTUR4ekRDYWlTZlNveVRWa0tERXJFVEd0bWtSZEJZ?=
 =?utf-8?B?Vlo4V080MElzVzdHWnMwMWxZaDZBaThzaEpwbjVxZllTbWdmdUdlaUNrOEJH?=
 =?utf-8?B?WmJicUljN1BQZFRMWWtGUm9FMGNzcnhkWHh0NTZBSmZ5cUEzK1VKam9LY1Nz?=
 =?utf-8?B?dFhoZ1Q2KytMVWlYZ2xGTDFEaEQvRHA2WlpBTmZ2MEVYZC90QXp6UkJJODlw?=
 =?utf-8?B?dVRTdHRrbFZUa0pNNU9tb0gyT2h2STZsR05uK1pIYUxMNmdiWGg2MEViWFM2?=
 =?utf-8?B?cDhxWU1nd3BsNkphWGo2bTM5OHh5a3ZIL0J1WTFUYzE4QVlYalRCdFJSSlRz?=
 =?utf-8?B?KzhGZFFNSmJ4NXVEdUVrbExkd3dNakZKSFV3dndtLzFQYTZEWkZyeTBURU5h?=
 =?utf-8?B?MnhnRC9CWksvR0ZnTUozS3RidnBTK2g4S0tmZXc2L2MzUFZtRU9tYVB0ak90?=
 =?utf-8?B?VlpZbENWMFlkZzMxT0tmNnl1MXRYSkM2cTg5cURSNHpvS2hrYUZibGlTeVRi?=
 =?utf-8?B?VjlVdVJyRkYvSjJzUVNFR3lNcnhCZTdRcUpPK1RwY2RyWmVBRnBrbDdEYjl1?=
 =?utf-8?B?V0xPdzU5T2hyVUlrS2YzWENOazZ1clVQUmdFK2M1U3ZadG1sLzJLNTJjbldo?=
 =?utf-8?B?bER4d1lHRTlGdGlOMXlUM04vT211czJ5RWdQQXFlT01DMEFRQnZvUjlmWkh1?=
 =?utf-8?B?MllNakFIdzlkdjU0TjczUzYwMzJMS05vTmxGWnBZMk8vVmFyT0svN3crUlpZ?=
 =?utf-8?B?MDV5YVFzYnIxT3FyK2Q4d0lpOWc3NnpGQThScThpMCtXSlk4dDJ0Qk1jSklS?=
 =?utf-8?B?N1g5VnVQZlBHYXBvMTNEM2pLUGJTSmt5V1pwRjBmZzF2SGdJYkhOYzVIUWhz?=
 =?utf-8?B?eER4M3ZMRFI0SXhQbG9KVnp0VHc5ZG80ZlNhaW94U1JhOS9weFlzcE03cXYy?=
 =?utf-8?B?NTVzazNrd0NMeHdhRkU5cFpaS0p3a243b1EyRXF6QUdrdzJXalZ3VmtJSFFM?=
 =?utf-8?B?NU5MMWxvNUFXbU9QU2NpSlErb0J0Y0I3dGRYNHhMNXNRd1JJMktmTnJrZ1B1?=
 =?utf-8?B?MHl2dnZwc2F5blVUZTNhdmNlc2YvM0F1ak5jMi9kc1hNZVd3ckF6N20vZXZq?=
 =?utf-8?B?bVZZN0Qvd1dBd2VmRjJHS1Q3cWFEMDZLeWFONUpOSW9QaUVQbzhmZnhSZ1Bj?=
 =?utf-8?B?ZHd3UHR4c2hHenJWL3V5UTZDZWpVSUpoS25xc1EzUi9pMk1UVzdVUkZqU0Jt?=
 =?utf-8?B?Nmp5ZStUZGJ5ZHhhWUZ5TkpqVUhjdURURTlOMWVxQUZPMXRhUWU4QmVFeWta?=
 =?utf-8?B?ZlF4NCt4MXVlbEJPam5DQ2srWEZwd0FCUmRhVXJZMGpwSVBDS3FLdzYwRFV0?=
 =?utf-8?B?VkRKTENKcjFJOTBiOXNtSE1uQUZFQ0g1S255VVNvSWRXaUgyMHVHYW5heFBM?=
 =?utf-8?B?TkZoQzNaRXRHQnZtMHg5QW1XZlFhMEJTODZmWUhqUHVzcks5cjlMV1ZkY09q?=
 =?utf-8?B?TEFkeTdBaGRmUGtqQU9FWkdOUU1wSDIwOHhSYmZndEM2UzJPVnlmeC9yMGN1?=
 =?utf-8?B?ZXVrY1IrV2U3RVo1Z3A1N25DbENJbTAvZWo0SVhyVVl6ejBHN2dxQ2lYNVh6?=
 =?utf-8?B?NVVCZUJYK1N1UFc4WC93N3FMQVIxeExqb3N2SXc5UlpzbllkWDNrWG5kZTZO?=
 =?utf-8?B?aWR5Q1BZYmUxTDZuR25ZVm50OFVRNUp2aSsrYlM0dFYzeDk0MmRWZ3F5VUNs?=
 =?utf-8?B?UHZYcDRnaFUvYktQaE1tVGtMYW1zZzB3NkZSbU91NElHL29DRnBJUXRkNC9R?=
 =?utf-8?B?ekJGTnZIVVd4YTIrQ3dsMUVrN3BFRkExZ0RPN3NqWS9rSC9oWUhuNUxJRi9h?=
 =?utf-8?B?OC9NRlRiMTNudnVkb1NQMkc2aUloQy9UREViRzlXMytoT1REWGNSbTNTSFpa?=
 =?utf-8?B?RGNoV0xUcGx5b1RwMFFnRkFtZkVGMmUrSmsyc1NtYVoyRHU3aENxZ2d2UmhN?=
 =?utf-8?B?anpwNWJUdEthQlJNRlZlZWhHandKUzJZOVh5WFREbWhkYitLeTRqNzBKc0dG?=
 =?utf-8?B?YXd1UkZ3RXhidmlYMVlHM3pRMVlLMndQNm1BN3hRWE9oV3k2MlM4UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12012239-8b84-45d7-9bbe-08de64a55d43
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 10:57:33.3253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39R+FPGasL0KmS+iRbLlNlDgDLHlXPjyaXAS50DcCRTeaNLSRx8gdYAjyJNLXqYzQ/v7t+ARnxAQkNAouarlqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33119-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 48C38F18BF
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 07:46:11AM -0600, Rob Herring wrote:
> On Wed, Feb 4, 2026 at 5:05 AM Xu Yang <xu.yang_2@nxp.com> wrote:
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - fsl,imx8mp-dwc3
> 
> You can't reuse the same compatible for a new binding.

OK. Will use a different name.

> 
> > +          - fsl,imx94-dwc3
> > +          - fsl,imx95-dwc3
> > +      - const: fsl,imx-dwc3
> 
> Drop. If you want a fallback, use the 1st SoC's compatible.

OK.

> 
> > +
> > +  reg:
> > +    items:
> > +      - description: DWC3 core registers
> > +      - description: HSIO Block Control registers
> > +      - description: Wrapper registers of dwc3 core
> > +

[...]

> > +      power-domains = <&scmi_devpd 13>;   //IMX94_PD_HSIO_TOP
> > +      phys = <&usb3_phy>, <&usb3_phy>;
> > +      phy-names = "usb2-phy", "usb3-phy";
> > +      snps,gfladj-refclk-lpm-sel-quirk;
> > +      snps,parkmode-disable-ss-quirk;
> > +      status = "disabled";
> 
> Examples should be enabled.

OK.

Thanks,
Xu Yang

