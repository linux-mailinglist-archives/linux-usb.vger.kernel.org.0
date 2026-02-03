Return-Path: <linux-usb+bounces-33020-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL9aBCtMgWkPFgMAu9opvQ
	(envelope-from <linux-usb+bounces-33020-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 02:15:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4012ED348A
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 02:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F8BC3006825
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 01:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89721A9B46;
	Tue,  3 Feb 2026 01:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nXTQBf9q"
X-Original-To: linux-usb@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013018.outbound.protection.outlook.com [52.101.83.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE574594A;
	Tue,  3 Feb 2026 01:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770081318; cv=fail; b=hQLD/G/Z9McybHig79knXHalmos/OMsc0Kb+fxA1AHW4LQYmIiK2CsX5v+yHtlElbCSfnRXDJY9RSSI3Lic9iUo4mRR5JUmWYKQIj2K1u1dmK1uOYPYXeeGpUR5YiaAiM7XM6ymD/iGuy8428ttRQKY3MMfhj6uFMjshGNLA48s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770081318; c=relaxed/simple;
	bh=QvSg6QzBVtb2wWQH7v5cuOGLkzDbycr06a3hzo9KqPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PaEXSljyKK7skXDBJ/J4d9bTo5TQP+iuL9Uff7qa+ERfKzYRtawEDOyYYnu6ZnuhDf9UcG0pxvmctUO2536X5Mo9HRrr70mM6b5nwE2QkKeyLIcvChj0ROSj9hRWBptACiqhyGzUFSZzLkO5IWaEAAxCestUNuvYLNCyKr/CDQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nXTQBf9q; arc=fail smtp.client-ip=52.101.83.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUsxZVgcEvoql+xT5lrPYHwyuIi2o6KsbKuljGTf6oxG4KXHfIB+SVAZLsqbCltcSBnEjk4C8cDWOsGd088TWIyV5FjjrNVxz9Rg0FY98abzYWg0EhGQCOgeIQpPgaLZTdnuvsUtAHE2c1vWUkOBYxqoeuYapSZb1VGQZGm4YsdFqltFvNmHdSMaCca5Lqi7jmVSeKIksBgwOfUytjNP56cKMgjwft8vEPtx/62vzMYEBxZUGskqBeA47gG2pkahMo9oQbK9pM3c0QPgYi0AiAT8LHax/DjMYv+RRqcEtfSIgJNV9JT+rb/Kk/ZQ5C51tAgBVp9scsCNP8NlTw3Dig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vx9Lnu0+BgNAGkXr3TmswFZyiNb/JfQxOAltSPF9/0=;
 b=hE7IlbRr8vGYPYKo26jnEIo3+RDnS4cXwCU/66fhUbYrlsO/Da58cG/N0DpjnvhXcyV2m43hmkT0Zq8S8aS4rFdZS5BOZp9OUovuYSP+k4vdmcxm/gFpdSZQJA85qaYI8duQcVNvBKIwMeO1FOjKupnhCidPLmTsz2N7kbH2gjrPLpEm6L7hYH8CB1K41EcDzuNYyW3RgthehqVVuoJ/DVE09haSZv3rm5XZZcusDQidnewe3uoAersaaZEgaN4CSPAchEV1XzB+hFhag5VPmP0fDo+y+i4hagYloyd7qRWTT2GGGLfcfj8/N836X1jQMXjP224NoTpFxkuTYMH9Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vx9Lnu0+BgNAGkXr3TmswFZyiNb/JfQxOAltSPF9/0=;
 b=nXTQBf9q3cQknRfx9BQOmDiGxzBz8Yatl7HobY4aXJr+O+++Ad2fvxZUNmsMGlnHhqAbcm0da+dgczaCEMNL93YfQWw9G806qTZ3xrZb15xbnu66rIqwKN3gN/6upqvXSFWf+URk7Wa15SRPUesUcvLMfSWK+RE94YknnEgt1XBhcTakVEzljMW7Y3zfMkUd8h69WS/lz71h56qhyMAQei+mG5F2rMaREUbAyTdXIxlV77yLZxeG00xaxt5iHPIOL6GjwM5+F2SdKmEfx03Du94jvfUMINxsLjvapXE5z8U+Nn1yDdmtjnbKwIiL7r/glJ8s63xFCG8Sxt2c+9zzVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8213.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 01:15:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 01:15:12 +0000
Date: Tue, 3 Feb 2026 09:16:44 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Xu Yang <xu.yang_2@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Li Jun <jun.li@nxp.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] usb: dwc3: add may_lose_power flag
Message-ID: <aYFMfPeeQusS1UR4@shlinux89>
References: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-2-c44a5e919380@nxp.com>
 <20260203002405.5wxsceuc47m6hrud@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260203002405.5wxsceuc47m6hrud@synopsys.com>
X-ClientProxiedBy: SI2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:4:186::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8213:EE_
X-MS-Office365-Filtering-Correlation-Id: 50533a00-1b44-4db3-93ab-08de62c1ae44
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmxUdkVxWlpVM3Bvd2pQdEs1MGdFUDhCT3l1RXRURHBPKzVUdnFuNW5wVjBy?=
 =?utf-8?B?RlJ3NTdDVUxlVmgwck5md2MrMGhjWm8vMGoxdHBHb3pXcHpLb042RXlCQ05o?=
 =?utf-8?B?dFJPRjdqWnpSK1pIUVFMNk9JUUdQcDV1YmNYTmNDcVFFNU13L2dKRm9IYXJi?=
 =?utf-8?B?dXdGUXBSQ2RQU1ByV0YxYUFPTWpPbmU2ZWlMdzJTekx1ZkRycUEyb2Q3SlRn?=
 =?utf-8?B?b2E5djBQdkZuOFZSd3Evc0l4Z2hKZEVtYlhMM05MWURHelZnOE45d3RzY3VT?=
 =?utf-8?B?SkszNUJMWWcrOW9XSDBVSWhvSEs2OWR0cWFxSkZqbXJGYzNLU0tHRXhUNjFZ?=
 =?utf-8?B?S25uTGlpSHFxY2lHdkg2TThEaEw2QUtzZWFqM3ZhTlZBVzBIRlRNbzNDemhz?=
 =?utf-8?B?eTJxY0VlWG9OemFsYnVwcGwwUy9xQUtHck0zekRpUTFzaXNKQlJHZFhFVklR?=
 =?utf-8?B?OFhZdSswZ0syR1dTNDlyaCtCNXNJeTlTT3RLN3lKMjQzUkRSbFp6WUZ6QWpp?=
 =?utf-8?B?WG9RQXkzZlVDd0gwOG40N2FJTGJGZCtiR0Nla2prb05uRFdsN24yZ1Bld09H?=
 =?utf-8?B?elZzb0gxN2ptTXN3dDVTVjl1U1BueU4wNzJ6VzAySHE4S3V2QmZTV2RsdlZn?=
 =?utf-8?B?MVRNZkJBODRKODFvRDB3dHI4UGhyQ2YwU0Y5VzVKdWdqZENDWHRIa1lUNDRm?=
 =?utf-8?B?OUVjT0dxRDdqQ3JvR0NnRW9JdEplMTZIVGdMSUpHejdlK0JxSmVFcHZDT3c0?=
 =?utf-8?B?dlBnZzNOeklwb1IveGtqK1lpVTh5L2VNNXE4V1VncW1vUVFFSUd5V3RZam44?=
 =?utf-8?B?R3c0b0dka0JINjRHUC8xQkpLaWp5dVZPVjR6TkpIYUxFUHhhb0plTkNidEwy?=
 =?utf-8?B?L0c2VTM4cmdhNTI2UTlrWlpENzQ0aUY1OGlaQlJMam01N3hjeWU4TzVXUFM3?=
 =?utf-8?B?MWtQdDFHdjg2dHpQTFh4b25nVVM1b0FHbkYrb0htL3dJaVNZVU5oeURkQ0ox?=
 =?utf-8?B?YUF3c2hlT0lzbVF3YWw3SWllcWNzQ1VNMnZLTklVQzRVVThPdFpoUjhDVlpE?=
 =?utf-8?B?cnk4ODZHSDZmV09WWk5sWDQ5MGV3b1NCSmEwWG4weDdxZWdGOW8vUWRLS2t1?=
 =?utf-8?B?aW9pSHpHTzNHa3ZzZWloMU8xc1lBTjhGV3JPM0JCOHhuODBwb0JPeTZnN1Jz?=
 =?utf-8?B?RENraVVWY0pFU3hiME5Bd09HYjE4VFROM1pDTWdkQW9IdXpFNmdKSEJzMFlD?=
 =?utf-8?B?RUdQcTdjcFNMSWVrOVlIV25YVXNMM3BhREU5Zld1aHZBRDZJNkcvbG5wVEV4?=
 =?utf-8?B?UlhoNW1Fb1dBK0pkVHVGQ1k1b0pKRXZXa0hmaytVVkR2Szh3TG1UR0pSeS8w?=
 =?utf-8?B?eVZlM3E1ZjEzZnNjT01ZOVcrNDkrVEJsMFkvRWxEaDQ0MmttQ2hzbHFwOWRO?=
 =?utf-8?B?aVRSZFFTNHdreS9INFptZFhTUlVJSzAxUngrUmdVdDRYV0NhL0F0S00ydkRV?=
 =?utf-8?B?c1g0clBTY3pDaGNJNVA4NnNIUkRkTkVMVjkwbk9XY3pHaDc0bXhTMTNTSG4y?=
 =?utf-8?B?V2puaWZFTUN1dm9GY01UZ2ZVWGY3QlloeWdqQzhHcXl5UGJxUG5rWE9HaWc1?=
 =?utf-8?B?bTlVUEIza0wvdFhKYURmSkRqdmhJcVVSYTRrV0F4VmUwdmE3d2xhblpsR1lp?=
 =?utf-8?B?MEFkWkI2OVJnL1g2YjFxVVdkUkxIVEducUZpdWtCVWtXR3NjVnJXdnpaT3JQ?=
 =?utf-8?B?SjJ1WkJ5UDRQOVg0b3JxZGszbVJ3RDI2T0lCSVVZa0pzV1dWSG05UVVSZncw?=
 =?utf-8?B?Rm5qcklKakJNOXNSbjJPM0JyUm1jNjVReFhVN1VLVUVDMmZkRldMaFREejlp?=
 =?utf-8?B?cStlMmVrb2ZzTHBGKzMyalAxN1FSQmxRM0M3L256VHdjajlEVk5ZbmtXNGdi?=
 =?utf-8?B?MUF1ZkowbHZRa3VrZHdIMUpjNzFiM0dKL3M4Z1ZLVkZnVE1lc3o2VkEwYzI0?=
 =?utf-8?B?TzJXT0hvQlJHQ1Q0RnhnMWJ4YTdUejErd1ZQYjJaYlhkcXNMYjNKRnc1NklJ?=
 =?utf-8?B?bkQrNk9LWkM3c3pCengwVitZVVJRQjMxQUFITWdGSEtCTlVkcEVXLzFWSm1W?=
 =?utf-8?B?dFYvZWxxS3hqcjZiUzNqTVU2aGRmOURNRUFqemZvVEFNTlJjTE8xUWU2M1BE?=
 =?utf-8?Q?6o/bn0JObUBKrMaKGLvcU8k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1JzVmVGRzNMSVZaRmRBVXE0ZDZzOWtZM2RyeG1OZkRtMmZnVjA0bzNvSjZv?=
 =?utf-8?B?aVVlakdUR3JmWnduVndmZ1J0TFo2YVdCT2g1cUJDcXUyUXpWQlZlMzdpUGlR?=
 =?utf-8?B?b3JHT3JrWndXYVpHdzhsYnUyRXJrSG9Edm5PRHN4YUJNNzd3dDR3RjdvVHdu?=
 =?utf-8?B?eHlWdjBEekpEN3ozUzA4SkQ2WmZLZzFBWjNHYTNNMWI5bG91WVQrckVDL0Ra?=
 =?utf-8?B?VElnWEFTQW03RVNEeE9JekNDWGd1Q241NlVzMlJsK2k5eGVZMC9PaXlVS2dQ?=
 =?utf-8?B?K0NCdEtkSi9hSEhwbmMzeW5RUFloYVF2Qmt3cmZwV3lsdE1TSk1JZ0FVUzY4?=
 =?utf-8?B?am1Bbmhhb0JGSzFWVC9nOFRSdnhzenBmNmkzUStRTjBuR0FrVURjaFEzZkdC?=
 =?utf-8?B?cFM5UzJiV0pqdTlTZm5qbWpzclZRb0dMaWVaTjBsakxLSVRDMnZmdTVmZzh4?=
 =?utf-8?B?WlN3NGVZS1U4RmR4czlNM3JDREZFZUhYclhQMW81THZvUGxmenVqT1VGc2RU?=
 =?utf-8?B?MHBPT3dPTnNZRy83VXRYQzE5azBUT1VGUHVaUWx3em8rYlI3cXFDSWR6Unpz?=
 =?utf-8?B?dWJmUDc3WFhzVlhOY3JxcHB2eFNmVUQ1OFk4Y0tmc0laMThPcUIvV2h6QzNL?=
 =?utf-8?B?YStjYU5xcUtUdnJwS2g0dmlYbWFVM29INWd0UXZhQ01zd2dkeGJEUk1XejNP?=
 =?utf-8?B?dmk0WTJTTzh5dDk1cjh1Yys5bzVnSytLbzFGalRzQ0xOS3BWVUdiMi9JNCtO?=
 =?utf-8?B?ZGs0dFJOVEpreFQxa29jdFZqKzErUVR1K2huZ1VBbkdQY1hXTm5QQmdpMFpS?=
 =?utf-8?B?RkV6WFhoVHg3cUtMTVhJbEVrWmVFM25ETDI4OE5yaE5FOWo0clVMcDd3YzBI?=
 =?utf-8?B?NW1vNkRReFp0cXpNMDYyNVRVQzJVSzZad3NzSUhDZjcrZnRxbmU3eFFMeHVU?=
 =?utf-8?B?aXdCRVZpWnpnQWllNXdtZHJKSVZ4VFFjTy90RVo0R0kzRmtjYkl3N0E1Y1Rv?=
 =?utf-8?B?OVIvZ29TSEkxMmhndlQ0NVJHcXc4cysrTWV3ZmNISUlkVnpvaUVSSEZxV0xF?=
 =?utf-8?B?cksxOGtnblU0QlV5aUx4dmVpbXpJMncxRTVFWlI3UWVRaHhZamNkNWF5emtp?=
 =?utf-8?B?a3oyUE9yV1drbldTczAvRjR2WFJzNm45ek44SXdmdHQyVzlIcVV6MkY4Q1Fr?=
 =?utf-8?B?N29EUzU2a2EzN0dtWEczVEpkMEJxQ2pOZ3B3VnJjNmJVSnprRUtmY2g0MGor?=
 =?utf-8?B?VzkyUGNLOFU3Qm5TekU3c1E0U1FVMGo3TkpSWHpxVjkvRkRiT1FkUHY5WnM3?=
 =?utf-8?B?RnBFTUZDYjBHSlpZSS9JWHZBbFpkS1lpOVBmdDJFaUg1b1pJWHhyRkhybHRC?=
 =?utf-8?B?akFCOGlnYlFoUmNxSG5IdE52QjlSaTJnVlZ0ZEZ4aXVPdis1dmV6Si96SHhh?=
 =?utf-8?B?bEpsRXh4ZHp2TExFQ2Z4bUlNeEl5T3BjR1M2TERFY01QYVlxQjlhZU5CakdG?=
 =?utf-8?B?SnREN3BPbXJta2V2cjVaZ3ljeXJ1MlJxUUhLUGZFcE9RQU10cThBQlFCdGRB?=
 =?utf-8?B?L1k3NmJmVzFSTFczRzdrRU1jU2RSbXphQkVKQmZUY1c3L0Q4VkVLWW1uL1FZ?=
 =?utf-8?B?TGNCU1hJdzVzMGVUMFlnYm96WkEzYW9zcFJIT2lJRkV4VThkbzlsSlI5ZnQ1?=
 =?utf-8?B?U1UzZzVBQW0wOFFoNVkrR1NPczFhOU0rQlk5d2Z2cjB5V0JlSjN4N01YMDAy?=
 =?utf-8?B?OFBKd2VrUDJFbHc2NUR6Vzc4RG5TNXdlMG9xVUVNMXZBUDVlNlhpT3hoampP?=
 =?utf-8?B?R0t0SnJVQVhiZjRTTkxKRmhKdFpibjdialo4ekVqL2huNm5qUUlFZ0dMVEp2?=
 =?utf-8?B?NFdkWklSN1k2QXRSY3l2NTg0UTdHOXBjMmRoZjdjZTU3b3haeCtWbGtWY0Zw?=
 =?utf-8?B?dlNlSTBLQWNZQlJXY0IzWENpcnQrU1AxNExQamJVbVBiOW43TENoYy92cWx6?=
 =?utf-8?B?SjE2K29IeXVFR3RXaThDNDc4ME5FeWxWTlhkdVB0Nk5uVHVUWnZENTA1UWsr?=
 =?utf-8?B?OXQxbnpOU2ZobUQvaWo3VTluMHJWUDVzeUxFNkVESzFHMGdzL3k5VGNiNWov?=
 =?utf-8?B?SlVoWG5wSVRzNVBsLzBaKzl0K0Jqd1hBOFNERzZ4SHRVUCt5LzFzZ2FtNVJy?=
 =?utf-8?B?ZzZYakVjMTFNeG9pRml1MWIwYXMwZytBdzlWMFlYaDJQY3YzdDAzVkdvQkcv?=
 =?utf-8?B?QWpyTURDOWxaK1YxUThlR1kyMXl4cmY0MUpyNnJ6S2FzYXhuR3ZDQ0lweXND?=
 =?utf-8?B?TWpsUW84Z1MvbEVUdERMdlYwN25OWVdnV25kZVhMNXZiZ2FLM1RKQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50533a00-1b44-4db3-93ab-08de62c1ae44
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:15:12.8491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJKLOaHCRlNS0i95uR6QdIAvCpFMqt+ERAOdbZYnEN4aM0rHmB5HOXC1zFX5VHlJzPj7IuBfPWFi+Rnhsfe0Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8213
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33020-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[nxp.com,linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 4012ED348A
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 12:24:08AM +0000, Thinh Nguyen wrote:
>On Mon, Feb 02, 2026, Xu Yang wrote:
>> The current design assumes that the controller remains powered
>> when wakeup is enabled. However, some SoCs provide wakeup
>> capability even when the controller itself is powered down, using
>> separate dedicated wakeup logic. This allows additional power
>> savings, but requires the controller to be fully re‑initialized
>> after system resume.
>> 
>> To support these SoCs, introduce a flag to track the controller’s
>> power state and use it throughout the suspend/resume flow.
>> 
>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>> ---
>>  drivers/usb/dwc3/core.c | 9 +++++++--
>>  drivers/usb/dwc3/core.h | 2 ++
>>  drivers/usb/dwc3/glue.h | 3 +++
>>  3 files changed, 12 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index c07ffe82c85049364c38c7ba152aab0ff764d95e..9d4326da5ec7669fa714707fb24556723cab51b8 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -2314,6 +2314,9 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>>  			goto err_exit_debugfs;
>>  	}
>>  
>> +	if (data->core_may_lose_power)
>
>Can this be passed down as part of the dwc3_properties within the
>probe_data? I'm trying to consolidate all the dwc3 properties to one
>place.
>
>> +		dwc->may_lose_power = true;
>> +
>>  	pm_runtime_put(dev);
>>  
>>  	dma_set_max_seg_size(dev, UINT_MAX);
>> @@ -2462,7 +2465,8 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>>  		dwc3_core_exit(dwc);
>>  		break;
>>  	case DWC3_GCTL_PRTCAP_HOST:
>> -		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
>> +		if (!PMSG_IS_AUTO(msg) &&
>> +		    (!device_may_wakeup(dwc->dev) || dwc->may_lose_power)) {
>>  			dwc3_core_exit(dwc);
>>  			break;
>>  		}
>> @@ -2525,7 +2529,8 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
>>  		dwc3_gadget_resume(dwc);
>>  		break;
>>  	case DWC3_GCTL_PRTCAP_HOST:
>> -		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
>> +		if (!PMSG_IS_AUTO(msg) &&
>> +		    (!device_may_wakeup(dwc->dev) || dwc->may_lose_power)) {
>>  			ret = dwc3_core_init_for_resume(dwc);
>>  			if (ret)
>>  				return ret;
>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>> index 08cc6f2b5c23631a752c77fd7394e5876c929f0a..5b1358f36490a001bc9e68139224f7be70a57995 100644
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -1117,6 +1117,7 @@ struct dwc3_glue_ops {
>>   * @usb3_lpm_capable: set if hadrware supports Link Power Management
>>   * @usb2_lpm_disable: set to disable usb2 lpm for host
>>   * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
>> + * @may_lose_power: set to indicate the core may lose power during pm suspend
>>   * @disable_scramble_quirk: set if we enable the disable scramble quirk
>>   * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
>>   * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
>> @@ -1369,6 +1370,7 @@ struct dwc3 {
>>  	unsigned		usb3_lpm_capable:1;
>>  	unsigned		usb2_lpm_disable:1;
>>  	unsigned		usb2_gadget_lpm_disable:1;
>> +	unsigned		may_lose_power:1;
>
>This name sounds like a quirk of a broken SoC.
>
>Perhaps rename this to something such as power_lost_on_suspend or
>needs_full_reinit?

How about out_band_wakeup?

Regards
Peng

