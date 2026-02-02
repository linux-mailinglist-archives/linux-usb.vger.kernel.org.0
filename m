Return-Path: <linux-usb+bounces-33007-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMofA6XEgGl3AgMAu9opvQ
	(envelope-from <linux-usb+bounces-33007-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 16:37:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA57CE513
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 16:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C48E301915E
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 15:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479B7372B3C;
	Mon,  2 Feb 2026 15:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AaduWTnD"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7286A2E8B82;
	Mon,  2 Feb 2026 15:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770046593; cv=fail; b=ojQEQt7w8ImZVm/uwrkIJH7xOdrrCIrYt5pN8GMRiQE4G29SJ0r6e8TJ6yOdpb6N7/UsQqrlN2UsGXuN2DdsWjEFEqNq/u5cyrbAYIttBmM36DlrKkTNeJLnV6L/TyQG0rga32in58qBdr942+0PC71q93s4m1iWHMrL1NpP4pU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770046593; c=relaxed/simple;
	bh=rHldvwfmCP0RqZcUAtQWoyA/HFkg2/zdzX1+kbPACgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sB6lgM1RCDqvFq6bCH2R3lprvpEIkd1Sdoa6up4VXTO7wzul2KkRXpQrhDxmgSxx+28XDvNyMIrBiuh/GPkQpYgOElEx6rTMKciDThLkbsIkU48qY0yculBc8usuFhcIgo4I99Z09HhgQWny41Np3tqUMiY+wUfjYq1ov9N13rM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AaduWTnD; arc=fail smtp.client-ip=40.107.159.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dl4qhMZcMxe0P6kKh5k/VWC4Gq8jEkI7rT4wF8GWxSHquLvXrxddg5H4ei9QxzOiVQEeTvU43naaXtH4CnA4z8QYYuKOpJSZIXmGPtR/ncwebeLNuNX4QSjIp/CvsecSfQrsaqiY9WGwnznLD7N/uRLXy+RO9XSEvV7dEo9hS/qd4w+Wcbp0AmRjhTuTQT9u0OleYIy5EQ6DzEOUs7tOOs0B/QHFVs72PCMsvb7EIfuGgeH/ZMc6zrQWlGLzEl4EaunONbWfKwhfNPFON1lSs7HjkvRC4h+xyLvJqDp7QxrqP5UvWuDCScVJX2BPjTIOSTO4Un1RnF0WbO6D9EZglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3btKMzYNY8reGB0o5YYU7Q4u9OcynSkz40hrjzFuI4=;
 b=MFSoOoWIWWPaFVCM1vtULD5TVbk1JUHcVfRFUylU/5Pnvu2z3ksdlJnIjis1zkoV9/hAtPyk0NoWAKvVbisrqjgGtLN2R+61aVDiLzERWbzIjTVCY8RHQEAigYwfK7tp1cAaz0xMTXPya5+D/V4thwFrfMmHvNPR/MCnxL34/sRW3iNoFns1O1K8QhQKSO2Kbizm7+nNp0G5hJIoMHNsKH65SFkX/l7Yit7eVpSDF078Qa2X77VKFs/oeEAB9Klw/hXv6W/gFCArO6sQ5sLyA9T4GlGVGUNMOrL7Q71AeeJKvMLmzCCjnIEy7mNoJdy+gPF4y9Dgh5fxpceZv+MlaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3btKMzYNY8reGB0o5YYU7Q4u9OcynSkz40hrjzFuI4=;
 b=AaduWTnDnjAdTJmNR0gYwdcXkajc6fB189DTU02uS1+09MFjO7U3v+uUCTA7i7h4s7uuSizE+UNZXIuMcyclfOCxY1m1CeRI+gJq2g/qcqfEcQ3m78DROXA26iTNnSn4+0tRq0MUd0RwNBSCNPegplAGRgDaucftQoYqOmYIYXnfkt45dMN55O5D+Y8yEOZuxeH1z3pJ1SSs0xL4Wg4bmwEvNe/2HCxLMxT6Zqc1m1Ekz/osh5vzlj8VgkS4nOlz66angapv3aHwKBXhDWInMICBr9iXGjiX4j4GYd6rVptDn7EB9Yk1c9J0EIbRFQVlWODt2QmBzXIf3+eVlgPPZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAWPR04MB11569.eurprd04.prod.outlook.com (2603:10a6:102:50a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:36:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:36:26 +0000
Date: Mon, 2 Feb 2026 10:36:15 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: dwc3: add may_lose_power flag
Message-ID: <aYDEb+nZe2efehEr@lizhi-Precision-Tower-5810>
References: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-2-c44a5e919380@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-2-c44a5e919380@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAWPR04MB11569:EE_
X-MS-Office365-Filtering-Correlation-Id: ec8517f3-70f9-4936-574e-08de6270d3d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnRnRUN6YTl4Rkk3MmpIbFByam5hQy9XcXo3TTlaZVVJWk5yWXZHOXVlLzBr?=
 =?utf-8?B?M3VGaUhOWjNabStDUDJVTlRLK2ZWL28vajVjWERQd0V3VHJZbTFmZDUwYnNq?=
 =?utf-8?B?enl3NFdRdmlBUzQ2bllkd1d5aHRoZUtjaUlRSjdjbittY3Jtb1VCRTduZzE1?=
 =?utf-8?B?ZDZOTnBlZm15bFhxdy9PSWJ0SXQrTlhZaklLcXdnaDVhekQ0L1BJbWpCd1pW?=
 =?utf-8?B?bXFRUnVPRWZEdjRTSnMxM0I1T0JaeUcvZDV4TVVMVDJWem5ZK3NWclhDb254?=
 =?utf-8?B?TEdrY2I2Q1VqdERKK1BUdndUZTkzVWM5UTNobXQ0Z2E1WHJsWTR1YW9SQ1Ba?=
 =?utf-8?B?VTlmbTc2Z1UwNHMrenY2T1JHZWtwQWdCb3BURHNYU3hLM2x4dEdZT3ZabjFl?=
 =?utf-8?B?ZjNEVDdZNTN4Tkk0MHgydFlPWlgyMkllZ0hSdFo0UC95YkIybGYzK3pjY04z?=
 =?utf-8?B?K0pFTk5jbTJCMnVtRjJGbzI3MFVqUGZMQTlnaXlFZWhWWGFPckJqV0d1RE9j?=
 =?utf-8?B?V1YweDJRUmcwMzRoZllSK1hGdmU0ZFRpb1drRytxS3RCWk1idHNkdm5Uc1Iv?=
 =?utf-8?B?RnB1MTJnN3ovN0UwclZiK2FEQ1pTRENub2tMYWhlbm8yVFo1ai9Ma3htRnhy?=
 =?utf-8?B?b0ZjZWQ2U25ITTZiVUNqRmdaOGFDc3JSM0l3bUhNaGw4R0F3UnpyVGo3REs4?=
 =?utf-8?B?bEVDNGpQVWxtV3E2Nko4OXNKUmo1UHEzZi81bmlUZU01a1BLaDRGVlNXOG1h?=
 =?utf-8?B?bHVhMDEwZnpWamFHUzVLcFNQakowZE1KaVB4UGdnWXdOVlh4d29WRUowT1Q4?=
 =?utf-8?B?emV3ajNIVU53MG51b2J6ZG5PWkxJeUV4STdNejJIVnNpY2VDL3NIZEVaRFZm?=
 =?utf-8?B?SDBzMDd0WG5VcThzcjZ3WisvdzhrcmVNb1FudXgrL2FGL25ubERHenB0dWFt?=
 =?utf-8?B?SlZyYkNiZjNyRmdKUHBVU3BiL085MHpLenlnVCs2b2c4UHRpY1dCOFM5QmR0?=
 =?utf-8?B?TElSa3diTi84NU8wM250WU1XWXQyaitCWUJoUVRQQkgvVkpvTkw1cUZ6My9n?=
 =?utf-8?B?aDd6dG5sa1Z3Nm94c3FlOHBkL2RMaktNRVpOWjJVUHNyQWRoT3JYYlVpRHYx?=
 =?utf-8?B?OGxncG5OeVhEbzhadFVkNS95dWtFSFdDQ2VQZ2RJdXVOUzB0SElWUk9aWjd0?=
 =?utf-8?B?a3BoaHI2S1VaNDVjWjladDlZeHZZb2FZVnNjZlhsVW9FYTZNODJEMmM2OUhK?=
 =?utf-8?B?TUZHWGhSMzRxemRmYmlJOG5aUnRTaUFiRUkvUU1EQWR3M3JXS21kL0l6c1h6?=
 =?utf-8?B?UmJtYVRoek1iOHE3c3ZCNFJsZWNQeFBsVnF4bnZEcjZxdXV2bzQrRUgvak9Z?=
 =?utf-8?B?R1BIWS8xM3E0Sy9WdW1nSld4RFdjbS9xNnoybnkvWlZrSXVSdnEvUjQwUXha?=
 =?utf-8?B?T2JkRFRNRVJ2d1VoY2JDbHdJT2ZOYk5kc3ZNTU5QQVNzeFgyaUdtQmNBM1pC?=
 =?utf-8?B?eElpem9UQ0FITGR6aFJUZC9rQ3VjQkNLM20rcHRGa1JPMk5qNmZmU0JYa1No?=
 =?utf-8?B?ckpVbnQweDBCUDRiTVlDSEl4U2dVK3ZQVHVFOTEwcCtUMkk4WEV1VGlCRkxY?=
 =?utf-8?B?MUZiaXpqbHRrYTd0UjVwcjNDeGE5Z1ErQVI0VXlyN004dzh2ODVJU1c3NDRs?=
 =?utf-8?B?clVmSFozQlpkeE15Q3Ryd2I0MWNPcGZ4d3FlTVBMQ1V1QVRydXlLZmYwVERB?=
 =?utf-8?B?WGdQa2lMRmhpeGQ2TTVISWo0dTBoelplYmF3dndRVmVBS1pRQ0pxY0Rsdmt1?=
 =?utf-8?B?VU5sUGhHaWJZVG15VHV5OVp6b1JWbFNaK2FFR3pBSGxtQ0taUkFRVUozcU5E?=
 =?utf-8?B?MHFZWGpLUzRGSGQwMWwwb0FQeUsvR3FUQmJqK09ad2RlNXRFQjd6SlJXRklE?=
 =?utf-8?B?VWMvRmtsVWZkZFhRT2VjeG45L1g1WVJGbEtKTDlJQ1drSm1Hdng4UmJUNGVR?=
 =?utf-8?B?QXhVMkdKMHdpZEhkTlJNNTVUNFUzVmNlSHR5a2dsZUZtSGZPN0FldjVvelBT?=
 =?utf-8?B?Yi8wRkY3VGhpYXg5Z0VCQ1h2dG0wS3docms3akl5V05GZmd1TUROSzhxWnRv?=
 =?utf-8?B?N2pzK3lteCsxOTNHUjllS1J3a3F4YlpYWXh5NUR5TnlLQUc0YUVGek5IaUsz?=
 =?utf-8?Q?XpKpEz5Z2gPkjRk+44PbVwo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzNmNXpWYUJCSDd4dnNrb3BsUlJTanRXRHR3TzltUkdUQ2JaYTQxK1dxUW1M?=
 =?utf-8?B?WnRoWHdsUDBLNlpZWUhZbWVWUXQ1TmFnaHdmZ1REVWdCKzRtSnp5M0hTTkV2?=
 =?utf-8?B?c0EvRmw2a25sNmNyb1d3T1VPQndCOGFkZFZZS2VmQlBqNStrbi9FS2xvTFhF?=
 =?utf-8?B?SjJ4bXV2MUpWdURzUlh1TGFVTkFUd3pXUEFRRW8rRXFGSDlobGFQR05yRW9Z?=
 =?utf-8?B?a2pSR2liUHRNV1ZHR3VmUks3L0krVmZWbUJaL3ByeG1nYjF1eGY5UFdjTk9o?=
 =?utf-8?B?WVRuSmVWRkVwV1VReXRYU29VYXRRZk5VMjlDOFZWdHNNc0JrVEVKV2FuaklE?=
 =?utf-8?B?YlFPME80N21NZGYrKzBoaFRvWFBGV2hQaDhpdjJiSTArdmdvbFdmSnVRYXht?=
 =?utf-8?B?WWZyNDNVMWZtVUlia0tzNjk5MHBmY0ljQzNtZk80Wklmb2lMNmx1Z2RJUEt1?=
 =?utf-8?B?ZkpvRWdmTmFVVWNHc2IzeE9BWGtnYmMzcWZ0NEdyUDQzMkJCV3ZvNndWR2Zn?=
 =?utf-8?B?UTRXNzRhZVlvNjA1SFRXUTFOeVFuRm5wVEJBaHBGRnhXMUhPb1grOXNoc3li?=
 =?utf-8?B?V0hWekpSazZxZUUzWDV1ZWx2NmpzY2pjSzgxZE5XRmQxZWkyTmVoL2t0MGJT?=
 =?utf-8?B?VlNXNXhUdXRCNWxoSThBQnhJRUFkK3Y2TFJWTEk0a0NaYmZOTjlpcWhQbHU1?=
 =?utf-8?B?NEhSdEhIaWhYb0dtQ0h0Q1hNN1NJUjVxMEFHY2Q4bHJUdUZHS1gwTkwvVGlo?=
 =?utf-8?B?cFpsQUhMR1FXSkhSWjlrZVJCQ05HRFNpbkV2NzZqNThJYXpHcmpmVXc3b0pw?=
 =?utf-8?B?Y0Q3Y05yeEpCUXVSKzFOa0pORW1xNm1xMXRuNjlHbVBMK1dJU3BEdTJVeHFt?=
 =?utf-8?B?eDY0enQ1SkVFV3draHZhY3l6ZzVjWS91SWw3N1BSbm9JcDY5K1RsRENtYXox?=
 =?utf-8?B?NHZmdTMxdGZnc2pMYTJTcGRSY2ZTcjZoakJzL3FwR2ZKOXpCRURUR1dORHJ2?=
 =?utf-8?B?NmxkWHpJZ0xSckJndThTUjhvK3NFenpyekJ1aU9XeWVpbGhpc0FDQzF4TXYz?=
 =?utf-8?B?ZkNSMEh5eENzRDcyL2QreUdLSUFsMzdQa0Rra2hyZHlzeFNMSUpmdEJOa0lB?=
 =?utf-8?B?Y0lNYXArcW9tbUFNSGRLejAwbG1PZ2VvS2ZKeWFSMDh6SGpYZjhHWkVEWkZk?=
 =?utf-8?B?Y2N3cnl5SlZPQVI1RTY5TVQwQWlCaXZFTWpWWXN0Q2t4c1FocW5UOUQ2Y1Zr?=
 =?utf-8?B?bVo0WjN3ZWFweTMrOFg4V2p0SWZmY1o1bXJ3VVo0Um1zMlB1WGt3MUozenpM?=
 =?utf-8?B?Rloxb1puLzY3RnVpbkxyR1dSRmdpekFvd2pEZFhySm94d3lGZnJHZWxSYm0v?=
 =?utf-8?B?ZmN4OTBIZjRBdW10LzBMMHNEajRqME1nd0cxbG5MOThpSUJ4WlZJc2FrWlVO?=
 =?utf-8?B?ZTlTdU81d0hUY3Nsb2IrRVRSOEo1WllkR1JOeEdFMllJMENoZ1ZlbzFINHU4?=
 =?utf-8?B?bVVQWFRoME9UOXpCMGxuQWxDYi9MYWhmREVpeCtQTmQrMnQ3Mm80c2lsODZD?=
 =?utf-8?B?b3BzT1VLeVA1QnZTb2RDR2JyTTVIb1Y1VDdWY2JUbmlSWFZiNlBvZHFlbGZs?=
 =?utf-8?B?YkFzUmtaSEVMenRKSWtVZDVIckpHUDRUQUJyMWpaRkdBQzg5bkRlUE9McnVh?=
 =?utf-8?B?SXNudzFhNGRJMFpmNGRYTUNCa2JydkYrc1liUVVhZUIyQ3lKT05wTTg5SjZt?=
 =?utf-8?B?eVhFMFZRVHB6dGo1ZWZpSU81UmhKUmhJT1lGcTN1MERBWFkwYXRXbGowakl4?=
 =?utf-8?B?ZHpTL3FFR01nbzU5V0szVlpxWUV2VUI1c2sxTURtMm1xZXFxbFU3TVlqLzln?=
 =?utf-8?B?Mm5BbFlYU2ZPOHc2RTY3V3JTWFpySXR2SFR6R0hFOTFkWW1RTm5zS3Z5Z3Vw?=
 =?utf-8?B?RUlFMHFqNGFPSjk3MTFMTjh0V2VUNEhyVGUwVjNnNmp3ZDBhNHN2c3NLQmNq?=
 =?utf-8?B?SHdKY25nTm5uWFBsRUt1MlJ6d08zdXEvUEd1Uy9FTCt5TGhVYm0yTDdlbXhF?=
 =?utf-8?B?REVzQ3ZJbVNFdGlLY1dCSXR1OVc1NFRaYlF0c0VpRWw2di9Od1AwT0RveVMw?=
 =?utf-8?B?YmwyVVNUelhTd0N3bmpLdlpVZThJQjNRSDQ3dXVneTl5N3VHS0N2UkVYcW1r?=
 =?utf-8?B?ZDdsdkZWd05GdTNTODg5SWFydmx4Z0RmalBBNnk0ZjV3ZVJUSmdTWkxkQXhB?=
 =?utf-8?B?ZU8zSURaNEN2TmFvOUhlelFLSHZUUmk0dk1oZm5PRTUzUEIyajE2S2xGUk5z?=
 =?utf-8?Q?ir5RLQmf737cwT9WdQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8517f3-70f9-4936-574e-08de6270d3d0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 15:36:26.6444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhjdfob0PVZeRXeEWTeEA+YQ+iUjhkKTrr1E+QL/zFkTpmMktbY5Yfw+wdb+VaiKstBH0tCWdQM9QdmWImU1Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11569
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33007-lists,linux-usb=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DEA57CE513
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 06:27:46PM +0800, Xu Yang wrote:
> The current design assumes that the controller remains powered
> when wakeup is enabled. However, some SoCs provide wakeup
> capability even when the controller itself is powered down, using
> separate dedicated wakeup logic. This allows additional power
> savings, but requires the controller to be fully re‑initialized
> after system resume.
>
> To support these SoCs, introduce a flag to track the controller’s
> power state and use it throughout the suspend/resume flow.

Nit: next time, wrap at pos 75 to reduce some lines.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/dwc3/core.c | 9 +++++++--
>  drivers/usb/dwc3/core.h | 2 ++
>  drivers/usb/dwc3/glue.h | 3 +++
>  3 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index c07ffe82c85049364c38c7ba152aab0ff764d95e..9d4326da5ec7669fa714707fb24556723cab51b8 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -2314,6 +2314,9 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>  			goto err_exit_debugfs;
>  	}
>
> +	if (data->core_may_lose_power)
> +		dwc->may_lose_power = true;
> +
>  	pm_runtime_put(dev);
>
>  	dma_set_max_seg_size(dev, UINT_MAX);
> @@ -2462,7 +2465,8 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  		dwc3_core_exit(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
> +		if (!PMSG_IS_AUTO(msg) &&
> +		    (!device_may_wakeup(dwc->dev) || dwc->may_lose_power)) {
>  			dwc3_core_exit(dwc);
>  			break;
>  		}
> @@ -2525,7 +2529,8 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
>  		dwc3_gadget_resume(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
> +		if (!PMSG_IS_AUTO(msg) &&
> +		    (!device_may_wakeup(dwc->dev) || dwc->may_lose_power)) {
>  			ret = dwc3_core_init_for_resume(dwc);
>  			if (ret)
>  				return ret;
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 08cc6f2b5c23631a752c77fd7394e5876c929f0a..5b1358f36490a001bc9e68139224f7be70a57995 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1117,6 +1117,7 @@ struct dwc3_glue_ops {
>   * @usb3_lpm_capable: set if hadrware supports Link Power Management
>   * @usb2_lpm_disable: set to disable usb2 lpm for host
>   * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
> + * @may_lose_power: set to indicate the core may lose power during pm suspend
>   * @disable_scramble_quirk: set if we enable the disable scramble quirk
>   * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
>   * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
> @@ -1369,6 +1370,7 @@ struct dwc3 {
>  	unsigned		usb3_lpm_capable:1;
>  	unsigned		usb2_lpm_disable:1;
>  	unsigned		usb2_gadget_lpm_disable:1;
> +	unsigned		may_lose_power:1;
>
>  	unsigned		disable_scramble_quirk:1;
>  	unsigned		u2exit_lfps_quirk:1;
> diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
> index df86e14cb706ca509206677f644da2a7225b1b26..b428a9f4a32625e7331f8492a408f7c20c915825 100644
> --- a/drivers/usb/dwc3/glue.h
> +++ b/drivers/usb/dwc3/glue.h
> @@ -29,6 +29,8 @@ struct dwc3_properties {
>   *		be ignored by the DWC3 core, as they are managed by the glue
>   * @skip_core_init_mode: Skip the finial initialization of the target mode, as
>   *		it must be managed by the glue
> + * @core_may_lose_power: indicate the controller may not remain power during
> + *		system suspend/resume
>   * @properties: dwc3 software manage properties
>   */
>  struct dwc3_probe_data {
> @@ -36,6 +38,7 @@ struct dwc3_probe_data {
>  	struct resource *res;
>  	bool ignore_clocks_and_resets;
>  	bool skip_core_init_mode;
> +	bool core_may_lose_power;
>  	struct dwc3_properties properties;
>  };
>
>
> --
> 2.34.1
>

