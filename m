Return-Path: <linux-usb+bounces-33320-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPZZJs2fjWnv5QAAu9opvQ
	(envelope-from <linux-usb+bounces-33320-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 10:39:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A8012BEFA
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 10:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EA3D3020210
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 09:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3EC2DF6F6;
	Thu, 12 Feb 2026 09:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fQit9gVM"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF34117B418;
	Thu, 12 Feb 2026 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889160; cv=fail; b=aOnQsqjkzFB9Gwxx1Wjhpy22vCopeRgNTIXREo+4VtIJGq8Q6/JAYI8TBwiIx5n7S4WXaGENhc1Qx19E6LXPjCsm2C4+KHL8J/QVENblDmE87XwAJ/VWiUwrd4+JU44/EJrmHbsib7uqtoFLMq+gk2NlPxYBGJ9Qm/sJI3Fa0tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889160; c=relaxed/simple;
	bh=kgkg9gfMenxuiBcl1g4WkjHAFrID9rNTpPfUXfQ7GI4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CPd6SJyrr13TevWl0qyjBjSc/coL3YxXHtEBvvN0uCKrzDW/MpsAAKsQHGTbs0s44aK91+ZwhPlLOud/w+Mk8GYOy1LT0Y/ePa+kpHqbrxrbPOSvnroQLAaeSXp6fFudnp9bV4tjZtMi5Y5NJlHSmKNFEgtE6eExw+9kABY2Pr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fQit9gVM; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CiRl2MSKQ66jW/dakw9QvhZnBfnymsTE9GNqkUbTpn5yJtvQxyHfiNS8vCUtIUqH9ZOnJjy9hOP3Lwl/k1P6L/5oGAzT9ftdxjRIGeIJGu2Xjr876vMkeG1gnwEmRyIxMx170pVJ+DiJkebXcJvBktEu8XES9dKzN5XuQJyNYgZXo1RqwQlpcfplSPrOAfarZDE3kwQwyI6uQNTbJO/vhjXobyKJrR6alsREoTBIq/7RuFAzEl/Gah7sLEiSQMsRmod63RcfP1PNhbcBPrxtEVMzf7i8pnubONDtblEp46yxpB8/QXRLuWLX2oe3oSQlzFdFLKObRZX4/SpZNpES4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxWZN10vbWF6nCKURaJ0TU4V3ohBjwalqlS6WYUeGpA=;
 b=ZyuzgvHQD+ahR1JBUZRX4sF50dEMctxQ7do4ke+j7WQHU6dbWWH/tvfvbJijs3ZcyknSM2jm0vrrHr3EKakVGLRAdo8Gug1bqmGNr4E5NB+HI6OVAumb0mB66Sj3AbCYQxHHg9NCpRCRx1C6Vm0HvA2O6D48KCimxjSyDe5d9lK6lLHM3HGU5EMDJbg8UAqL9ZtjuqrLFIouP+cKgG+VvuIjHzwxM5prSKRODGp7MFRV8oOjCBClRvdVcQv93h0LjsxB0sue1UrAhEK+fl4mlh6hpQRwp0BdEqZAJStxzQE5WAhOgZZinCGsSAjUWgTDuN/SpVlxYjlllrcYwlBgjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxWZN10vbWF6nCKURaJ0TU4V3ohBjwalqlS6WYUeGpA=;
 b=fQit9gVM1+JzxFOQbRIKYQ7TRQezMlALARrA3LMfWb8oqXR/aqYMht4pdi9HjvjrXcJEUGcjGqbNTT2S4avWjDYrpvBhXb47B7KIoTi9Ol04QBdGrZPZZv8SB/pDS4nsRBYqGbdrH3LjmIVW/C09Irn4CRjKUS0VH7XlbJoqyZHW+YLmOSmHLxqx7axKb1Bhr+J2csmaR+Fcvpd7hF0r5yMjXmuxUB8poA1J5wuqD9gaKswGkp3DkpLWWeopVDgYD+aMFW7vjQ9pVrqpemJyEJbl8jO6lf264bST7E7Q1ctRpts7rkpGTpFWlf9LY8hUaSAIqw5ie/yE/ghAM2c5dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by DBAPR04MB7303.eurprd04.prod.outlook.com (2603:10a6:10:1af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 09:39:14 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 09:39:14 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Thu, 12 Feb 2026 17:40:28 +0800
Subject: [PATCH v5 3/3] usb: dwc3: introduce flatten model driver of i.MX
 Soc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-add-flatten-dts-based-dwc3-imx-driver-v5-3-ff04a75ce221@nxp.com>
References: <20260212-add-flatten-dts-based-dwc3-imx-driver-v5-0-ff04a75ce221@nxp.com>
In-Reply-To: <20260212-add-flatten-dts-based-dwc3-imx-driver-v5-0-ff04a75ce221@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770889241; l=15380;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=kgkg9gfMenxuiBcl1g4WkjHAFrID9rNTpPfUXfQ7GI4=;
 b=LqZcX3a3AUXZtO4BJFj9MGw+azsnzldxaKoBk+RaGVBq6Rr4+fuq6FASlA69x6DBtVxQJB3TK
 OFxvC4yQK2sAPEaxEf3ZsV9X19k78I/Zybpl/QvA3h6qtkJ3O3QDLEX
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|DBAPR04MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c84a70-415f-4f94-531d-08de6a1a953a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUNHTzdDZ0pYRHVmK2ZCR0g3Nlprb2ZoaU1WanZKSDlDVG80Y0FOZVhSeDJT?=
 =?utf-8?B?TW10Z3loSDJBbnFoZ1NvM0t3bXhQa05mY0Jnb1Mvbkl1Ly90UGt0M1duNUVC?=
 =?utf-8?B?c0ZRZTNadW1OV1lodEpxaDNjRkQwTjdEV1JIYlhjV0t0OVF5c0RKeFhqRGFn?=
 =?utf-8?B?alZ0RlFSUGFTWVNlRjB1Y0dMUitUK095bkdRK0FqWGpWWWJ6TU91cy9veXRJ?=
 =?utf-8?B?SlFzYUxLeVB1ZVk5ZU1uRE1sYXIxSHAveGppb3NROTFtYVpNbkRlWExTUkc3?=
 =?utf-8?B?TkZibnowa0kvS0x3bHV5ZHQwbXMwREFhbDE3U3lkYlZ4WDFKZU9BbXdDZWx1?=
 =?utf-8?B?K3laVTdGRWFDK1ROSGxZV2VCeVJCM0dieFZ0bW05cmI2WjM3a0J4QXV3ejZ4?=
 =?utf-8?B?N3A0enZkbk4yK0VETjZSNnZnS2hUY3YxMTdvcFJLcVF3WnljOUt0UjM1V25l?=
 =?utf-8?B?YWF2RWZEZUNFNXFaUS9MOC85WGVadlM0dEQ1WTd0WkpZQW4vUFlwbC9zdGRr?=
 =?utf-8?B?bktESVpzNk8zLzN5dlphTVdUZTZaRVk2YkN2SHhPdmN0VzI2MG5TY3E3cUZY?=
 =?utf-8?B?TmxSaHJEZjRscGZkak82QVNZcy9neEVZbk5tUmZpOFJtS3VRYksxM29WaFAy?=
 =?utf-8?B?Ry9TV1YvcnBPM0E1SkpVeXIvU0ptT0FDd1hMeGFzc2xOSHVhbW9JL1N3ckMy?=
 =?utf-8?B?MVBBTXhYOGw3dVRpeXpqY0R3czZTeXRROW5jVmVZaFE0YVFQM0lwNTQvRnNN?=
 =?utf-8?B?bjlHT0J4ZE14ejc0dVo1OXNaWnJ1ZnkvUEc4ZFBvZjZ5cjcvVzdURHpzTDZi?=
 =?utf-8?B?NXk4Z2txVTFucmY1M0hrUzJhSlJtN1FWTnNRa2RQc3V5L2FJM0dzb0FnT0RC?=
 =?utf-8?B?ajZucURCTytlVEFUcndNLzVUd0ZUd1JHcVA1VmYxdUg2OU96UGFyWXVNdy9X?=
 =?utf-8?B?NHBuN0dqdUZUREh6K1FVY3h6V0FCZ0hEdmtFbE5RT0V3Z0R4eXhiZmZUNUZJ?=
 =?utf-8?B?YnZGKzFXYXZ6bkJtUXppL1lYNk9QOXJsQUFWZ0g3NzhQY0ZJa0FSekxZbE1v?=
 =?utf-8?B?ZVZid3RDTTdRUW1hdG8rL1FkWGlmTHlaZXExN3hkZXpuckNyZHU1S24zanZk?=
 =?utf-8?B?NkxYR0xyUkFhK2pKenFYckVsZUdlcVZYK3hyZHBhRTlGVmIxZmNpSjl6MGhm?=
 =?utf-8?B?UjRlYVV4MTI0V0F6a0dwRXgvRTYzZnVGQ213Tks5a2hxckhHQ2dyZVB3ZEVr?=
 =?utf-8?B?OWZPa0FwRDhad0MxclMvMmtpdTBNY1k2aDN6OEtsd1FENklneVFoNVptMGhi?=
 =?utf-8?B?ODJDaWZ0SUhYMlpTMzladGtsQUxZNHI4VzJXZFU1M1JKMTE1ZU00NXVmRjJT?=
 =?utf-8?B?KzRYdjdpYlkrNm5tQ0pTRGRJR3BQTStuQXhGeXpTNElHQTRjZ2dKa0k3WHZn?=
 =?utf-8?B?c21FTEZtck9GZzdocEVJS2tYbUZzcGxsL3Z2Y0NNQnFMUnFYWlpYdG15dm96?=
 =?utf-8?B?RlRsYVBSYkFRVDVZNVlNUHNvV29HblYwbHFodlFxN0RpK0ZZWmtNVmRTcmww?=
 =?utf-8?B?Nk02YXhEdzdVdmMzckJndzVDYWRwZmkxYi9VQ1FYeGlqc0R0MHV2MDZQclJk?=
 =?utf-8?B?SGtlbDI0cVByMzBGbGFTWjB0cE5pdDJNTlpOUytMS1ZrSTY1L1NaM1o2SXpN?=
 =?utf-8?B?WEl6UE1GWEJEcFpqUFo3UDN5SER3SDB5UVZLMUhKd1l6VUs1QmRRTW9mVE5J?=
 =?utf-8?B?TUw0Z1VsSW9tVCt3VTk1ajIvaFJYMWhPa0xXQURBMFdwOHJYUXUzdjE1bm1D?=
 =?utf-8?B?aURvaDhFVUtDZVZ6WWRUR2xrVWNvMUFiekdCWUl3QS83czRtRGg0M2wrWThK?=
 =?utf-8?B?YUtWR0xQS2NSa3NERk5HM2FOZXNGcjg2eENUSTJGcGQ4MUVxZXRNOXUydTNm?=
 =?utf-8?B?UkNhSzV5WnV1TnFaQ2M1MUloK2hQUkRMZUV5SDBMNkxlNlRGZ1VkMWt6b3No?=
 =?utf-8?B?TjE3Tkd2RmU3R0lSN2NlOWN4OHprUUt1NTBtVzF3NmJNMXpqVGdOZDBmUEhC?=
 =?utf-8?B?SGJFWUxid3k5ZEQ4OWJKd3VGTVVmNCtIZ0VkMTVWQjVmY3dBZ2tweGNxU2RQ?=
 =?utf-8?B?SHBPNEtzdDFGUTRVTS9HcUR6aWxnaGlnUDVTSXJ1MUJSci9zZlpSZm1GTjVW?=
 =?utf-8?Q?RFHnu/dQF8TV+TYZuK829wz1p/DRTm8id+QO2FG9LcAI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE1qdlFrK0NRUTUyOFRUZUVyT09uRWhaNngwaDVJQ2JlS2JvbjNYN1c2a1p2?=
 =?utf-8?B?cnVoTHVPcHNYUWVGYnVlUnZwS3FkMGNmOER0TnMvdFdSMGl6cUlFQ29sUFpm?=
 =?utf-8?B?VDRERXg1N1FKU0dnekUvNGh4V0ozUHF0eVJCZ24vVEhoeTQwVUZDdHF4K0Vw?=
 =?utf-8?B?Y1ppY053U2diVEZwckc5QTltMTZmN0J4cWxZa3lpY2Vha0VmVC9MbHRGNkt0?=
 =?utf-8?B?empjRDRMNmhHbHZiT0h2U0tFSFpyenlqZkhwcGY4UUJTYUE0bVRqdlk0eVZB?=
 =?utf-8?B?ZS9MRGNMbnJvbS95b2VCZTNsY3BTOWhKbUI2OVV3eWxBSEtHUnRidGRaT29l?=
 =?utf-8?B?NmZGV0RoRCtHS2EyQTY1SzBEdDNpSENIaVR4L2FEYzlZSmRZVVE2bFU4VlQx?=
 =?utf-8?B?cE9EM2JUbTl2b1ZoSnc3VUtmaC96NUZrQllRQ0VFQndiMGltcVJTbWFaRXlm?=
 =?utf-8?B?WHVaSTJyVUVVZHBFakpsY0NHNldJVGlETDZkS2RaUnRoY0Z3QVFkOUd6Wmor?=
 =?utf-8?B?OVczc2FKeWxBakNtc2FnRXgzcnJqbXFZMW05WnRnUU5rZHlDSWpabTl1OXp2?=
 =?utf-8?B?em9YUzNtSDl1blpZUnBZWWNEa29KeTVGV1JXakhqRXVxcDJqeTdmOWk1b2VH?=
 =?utf-8?B?Z0RFcVQ3UnQ5b3p3a2NSdTBMRU5BTkprVXVKR2ZrdHY0emhid0syZnJMdEZG?=
 =?utf-8?B?ZzRYaEF0TGo4ejVDSGlCQnBjYlpYQmYraTk1eWsvT3lpRDBCSklzS0lxeitT?=
 =?utf-8?B?eVhqbXVJbFp1YytKVTFuVkhXbWRTbTlpYkdLTVhWK0RBNzNKK3hKOHZ1dkZr?=
 =?utf-8?B?V0owTGNnWU5RWnZwYTBMOFF6L1I5Vm5Na0p1N3BjTEJyWVNqN2srK25pNWNw?=
 =?utf-8?B?Y2RCRlJlREltQ1JhWnF6REdLVW5kY0pZaTY3UmZlRXF6N0tGR2QrNUhiK2NM?=
 =?utf-8?B?Q1NvTTFDWHN5ejdqOEhlcVNXZ1dRWGlQaklYQmplL0NQUEJBRG5uSWp3RUtl?=
 =?utf-8?B?aEhUWUEvUFlOZC9PUFpNMmhRdjJibzYwaXB3ZEtRVTEzaTJJOUNuZ0doU3hI?=
 =?utf-8?B?NjJmYzFQR25VbWNJZForcnBRQzJBN3IrK3BPeXlKWFNFUFc2ZHZZSzlrNFd1?=
 =?utf-8?B?Q2gyNzhIVkU0WTRXZnBEYUFZUXNwclhtYzNaamtRa2pSVExKWC9pbVJLeFBV?=
 =?utf-8?B?R1h4c2FtbFNYNm1BeEN6MXFHN045WUpzTDBscUVGb1FXakdRWk4wbEJidTdW?=
 =?utf-8?B?REVHOGpqaTRWSExDWVZjaTA4TXo3dUtPZHlYOERxT2VLM0JCb3NpdEJvdS9D?=
 =?utf-8?B?TnhFT0Fqc3NLVjh6REQ4clRHVDdiWmo3bUI1OUlvaUlVTEVNYVhVWG8xQ0k0?=
 =?utf-8?B?S2pkVWJCUUtkcFVsbmxxckdVTGw2WlcwaGRza01oQU0yRHJpWGNYa3VWQS80?=
 =?utf-8?B?Q1RDNm92dUI3OFMzb2s3a3pOZHVVSi9MdWF1OHFHMk9Ub0lQbFVVRU9PVXkw?=
 =?utf-8?B?ZzFablFHV3JqSzR3NHB3S3hmY003Nmh4V2YzN3FXSlpZdUpLY29aa3EzbWF3?=
 =?utf-8?B?V3FLdnlWZGhOYjlKTHFhaThoUGV4RitPZndleWZPc1gvellUQnlVd3FsdWlr?=
 =?utf-8?B?SkhjT1JXWjN5VFVHRVpFQmppMmlEYUdRbXF5WG94U2k4REFQN1pQZi9JM2NW?=
 =?utf-8?B?RWZ2TktEdUdTcFhRaDJHMGZqbHpldHFIcVF0dm95VVZxU3ZQMUlsQUw0dER5?=
 =?utf-8?B?ajJwS2ZUNnJmNVpoOUREZUN4YlEyVXZnSW84K05wclp5NHRuQituN2FPVndu?=
 =?utf-8?B?d1NueitVdWF6S0tvMU1uMiswWTZ0YytQWXlkOHJYdzhlK1VPYURCeHB3OW1N?=
 =?utf-8?B?WG5WNEdQeFFnd1JuQ1pFWXN0VWZJQTBBYlRRTWJ0TEUzYlp0TWdIL1l2MWlM?=
 =?utf-8?B?Y1BuazYrdmgzc09MSDlZQ2ZzTnJrRWNLamNSWXRMTXhjSVhNaGZkM3p3NE1S?=
 =?utf-8?B?NjlLWng3RjhZRytIR3c3SVhaOFBtMmJrRFNFS3V3cG5vY2lDMXg2cytjanZG?=
 =?utf-8?B?bW0vUGN4clhhNzc2b1RoMHFUTmxjVTFTcC9CUG9HUDJIcjVuZjRFNnVVeWZq?=
 =?utf-8?B?ckVSMDN4VXZmMFd1RlhUSjJ2dkc1bG1aRTVtdk1XKytPTTNxMHJuRjRHaEs1?=
 =?utf-8?B?M200c29yTTRzMUViSjFjbCtMQ1M3N0lTUUpCeERDS2JKMllMOElQZGVjWitK?=
 =?utf-8?B?MHlxcGZNT09LTDZscTV0cFlDKzhiMDZwbzVrVlJBZ1BEVDFMSEhYcE96YXZo?=
 =?utf-8?B?Y2xxalprNlVKQi8ya3ZyTi80ZkJ3aG4vNU96YWxoRFY4bWVkTjQvUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c84a70-415f-4f94-531d-08de6a1a953a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 09:39:14.5463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+rdxhGYwBOJpUwMxCHQ2TD5VYA1rRYEuiKHAWeqJ+IudNgBEem5qF/voEpw6yPmsFCfVPbDAVLjE345XUMAOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7303
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33320-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,i.mx:url,nxp.com:mid,nxp.com:dkim,nxp.com:email,probe_data.properties:url]
X-Rspamd-Queue-Id: 37A8012BEFA
X-Rspamd-Action: no action

The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
USB block in a single block will bring more benefits than a parent-
child relation. To support the flatten model devicetree, DWC3 USB core
driver already support to directly register and initialize the core in
glue layer using one device. And many notification can be received in
glue layer timely and proper actions can be executed accordingly.

To align with mainstream, introduce a new driver to support flatten dwc3
devicetree model for i.MX Soc. Besides this driver disables wakeup irq
when system is active, no other function change in this version compared
to dwc3-imx8mp.c. After this new driver is settled, only maintenance
fixes will be added to dwc3-imx8mp.c, new features will only be added
to this new driver. Once all users switch to this new one, the legacy
driver will be removed at proper time.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v5:
 - code change in glue.h by mistake, removed it
Changes in v4:
 - add dwc3_imx_get_property() to parse of node
 - add some flags
 - remove dev_dbg()
 - add more info in commit message
Changes in v3:
 - update compatible as nxp,imx8mp-dwc3
Changes in v2:
 - improve commit message
 - fix code style
 - add IRQF_NO_AUTOEN
 - remove pm_runtime_* in dwc3_imx_remove(), dwc3_core_remove()
   will do that
---
 drivers/usb/dwc3/Kconfig    |  12 ++
 drivers/usb/dwc3/Makefile   |   1 +
 drivers/usb/dwc3/dwc3-imx.c | 442 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 455 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 240b15bc52cb..18169727a413 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -150,6 +150,18 @@ config USB_DWC3_IMX8MP
 	  functionality.
 	  Say 'Y' or 'M' if you have one such device.
 
+config USB_DWC3_IMX
+	tristate "NXP iMX Platform"
+	depends on OF && COMMON_CLK
+	depends on (ARCH_MXC && ARM64) || COMPILE_TEST
+	default USB_DWC3
+	help
+	  NXP iMX SoC use DesignWare Core IP for USB2/3
+	  functionality.
+	  This driver also handles the wakeup feature outside
+	  of DesignWare Core.
+	  Say 'Y' or 'M' if you have one such device.
+
 config USB_DWC3_XILINX
 	tristate "Xilinx Platforms"
 	depends on (ARCH_ZYNQMP || COMPILE_TEST) && OF
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 073bef5309b5..f37971197203 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom-legacy.o
 obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
+obj-$(CONFIG_USB_DWC3_IMX)		+= dwc3-imx.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
 obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
new file mode 100644
index 000000000000..303708f7d79a
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-imx.c
@@ -0,0 +1,442 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dwc3-imx.c - NXP i.MX Soc USB3 Specific Glue layer
+ *
+ * Copyright 2026 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "core.h"
+#include "glue.h"
+
+/* USB wakeup registers */
+#define USB_WAKEUP_CTRL			0x00
+
+/* Global wakeup interrupt enable, also used to clear interrupt */
+#define USB_WAKEUP_EN			BIT(31)
+/* Wakeup from connect or disconnect, only for superspeed */
+#define USB_WAKEUP_SS_CONN		BIT(5)
+/* 0 select vbus_valid, 1 select sessvld */
+#define USB_WAKEUP_VBUS_SRC_SESS_VAL	BIT(4)
+/* Enable signal for wake up from u3 state */
+#define USB_WAKEUP_U3_EN		BIT(3)
+/* Enable signal for wake up from id change */
+#define USB_WAKEUP_ID_EN		BIT(2)
+/* Enable signal for wake up from vbus change */
+#define	USB_WAKEUP_VBUS_EN		BIT(1)
+/* Enable signal for wake up from dp/dm change */
+#define USB_WAKEUP_DPDM_EN		BIT(0)
+
+#define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
+
+/* USB glue registers */
+#define USB_CTRL0		0x00
+#define USB_CTRL1		0x04
+
+#define USB_CTRL0_PORTPWR_EN	BIT(12) /* 1 - PPC enabled (default) */
+#define USB_CTRL0_USB3_FIXED	BIT(22) /* 1 - USB3 permanent attached */
+#define USB_CTRL0_USB2_FIXED	BIT(23) /* 1 - USB2 permanent attached */
+
+#define USB_CTRL1_OC_POLARITY	BIT(16) /* 0 - HIGH / 1 - LOW */
+#define USB_CTRL1_PWR_POLARITY	BIT(17) /* 0 - HIGH / 1 - LOW */
+
+struct dwc3_imx {
+	struct dwc3	dwc;
+	struct device	*dev;
+	void __iomem	*blkctl_base;
+	void __iomem	*glue_base;
+	struct clk	*hsio_clk;
+	struct clk	*suspend_clk;
+	int		irq;
+	bool		pm_suspended;
+	bool		wakeup_pending;
+	unsigned	permanent_attached:1;
+	unsigned	disable_pwr_ctrl:1;
+	unsigned	overcur_active_low:1;
+	unsigned	power_active_low:1;
+};
+
+#define to_dwc3_imx(d) container_of((d), struct dwc3_imx, dwc)
+
+static void dwc3_imx_get_property(struct dwc3_imx *dwc_imx)
+{
+	struct device	*dev = dwc_imx->dev;
+
+	dwc_imx->permanent_attached =
+		device_property_read_bool(dev, "fsl,permanently-attached");
+	dwc_imx->disable_pwr_ctrl =
+		device_property_read_bool(dev, "fsl,disable-port-power-control");
+	dwc_imx->overcur_active_low =
+		device_property_read_bool(dev, "fsl,over-current-active-low");
+	dwc_imx->power_active_low =
+		device_property_read_bool(dev, "fsl,power-active-low");
+}
+
+static void dwc3_imx_configure_glue(struct dwc3_imx *dwc_imx)
+{
+	u32		value;
+
+	if (!dwc_imx->glue_base)
+		return;
+
+	value = readl(dwc_imx->glue_base + USB_CTRL0);
+
+	if (dwc_imx->permanent_attached)
+		value |= USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED;
+	else
+		value &= ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
+
+	if (dwc_imx->disable_pwr_ctrl)
+		value &= ~USB_CTRL0_PORTPWR_EN;
+	else
+		value |= USB_CTRL0_PORTPWR_EN;
+
+	writel(value, dwc_imx->glue_base + USB_CTRL0);
+
+	value = readl(dwc_imx->glue_base + USB_CTRL1);
+	if (dwc_imx->overcur_active_low)
+		value |= USB_CTRL1_OC_POLARITY;
+	else
+		value &= ~USB_CTRL1_OC_POLARITY;
+
+	if (dwc_imx->power_active_low)
+		value |= USB_CTRL1_PWR_POLARITY;
+	else
+		value &= ~USB_CTRL1_PWR_POLARITY;
+
+	writel(value, dwc_imx->glue_base + USB_CTRL1);
+}
+
+static void dwc3_imx_wakeup_enable(struct dwc3_imx *dwc_imx, pm_message_t msg)
+{
+	struct dwc3	*dwc = &dwc_imx->dwc;
+	u32		val;
+
+	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+
+	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci) {
+		val |= USB_WAKEUP_EN | USB_WAKEUP_DPDM_EN;
+		if (PMSG_IS_AUTO(msg))
+			val |= USB_WAKEUP_SS_CONN | USB_WAKEUP_U3_EN;
+	} else {
+		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
+		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
+	}
+
+	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+}
+
+static void dwc3_imx_wakeup_disable(struct dwc3_imx *dwc_imx)
+{
+	u32	val;
+
+	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
+	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+}
+
+static irqreturn_t dwc3_imx_interrupt(int irq, void *data)
+{
+	struct dwc3_imx	*dwc_imx = data;
+	struct dwc3	*dwc = &dwc_imx->dwc;
+
+	if (!dwc_imx->pm_suspended)
+		return IRQ_HANDLED;
+
+	disable_irq_nosync(dwc_imx->irq);
+	dwc_imx->wakeup_pending = true;
+
+	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci)
+		pm_runtime_resume(&dwc->xhci->dev);
+	else if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
+		pm_runtime_get(dwc->dev);
+
+	return IRQ_HANDLED;
+}
+
+static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
+{
+	if (role == USB_ROLE_HOST)
+		/*
+		 * For xhci host, we need disable dwc core auto
+		 * suspend, because during this auto suspend delay(5s),
+		 * xhci host RUN_STOP is cleared and wakeup is not
+		 * enabled, if device is inserted, xhci host can't
+		 * response the connection.
+		 */
+		pm_runtime_dont_use_autosuspend(dwc->dev);
+	else
+		pm_runtime_use_autosuspend(dwc->dev);
+}
+
+static struct dwc3_glue_ops dwc3_imx_glue_ops = {
+	.pre_set_role = dwc3_imx_pre_set_role,
+};
+
+static const struct property_entry dwc3_imx_properties[] = {
+	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
+	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
+	{},
+};
+
+static const struct software_node dwc3_imx_swnode = {
+	.properties = dwc3_imx_properties,
+};
+
+static int dwc3_imx_probe(struct platform_device *pdev)
+{
+	struct device		*dev = &pdev->dev;
+	struct dwc3_imx		*dwc_imx;
+	struct dwc3		*dwc;
+	struct resource		*res;
+	const char		*irq_name;
+	struct dwc3_probe_data	probe_data = {};
+	int			ret, irq;
+
+	dwc_imx = devm_kzalloc(dev, sizeof(*dwc_imx), GFP_KERNEL);
+	if (!dwc_imx)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, dwc_imx);
+	dwc_imx->dev = dev;
+
+	dwc3_imx_get_property(dwc_imx);
+
+	dwc_imx->blkctl_base = devm_platform_ioremap_resource_byname(pdev, "blkctl");
+	if (IS_ERR(dwc_imx->blkctl_base))
+		return PTR_ERR(dwc_imx->blkctl_base);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
+	if (!res) {
+		dev_warn(dev, "Base address for glue layer missing\n");
+	} else {
+		dwc_imx->glue_base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(dwc_imx->glue_base))
+			return PTR_ERR(dwc_imx->glue_base);
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
+	if (!res)
+		return dev_err_probe(dev, -ENODEV, "missing core memory resource\n");
+
+	dwc_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
+	if (IS_ERR(dwc_imx->hsio_clk))
+		return dev_err_probe(dev, PTR_ERR(dwc_imx->hsio_clk),
+				     "Failed to get hsio clk\n");
+
+	dwc_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
+	if (IS_ERR(dwc_imx->suspend_clk))
+		return dev_err_probe(dev, PTR_ERR(dwc_imx->suspend_clk),
+				     "Failed to get suspend clk\n");
+
+	irq = platform_get_irq_byname(pdev, "wakeup");
+	if (irq < 0)
+		return irq;
+	dwc_imx->irq = irq;
+
+	irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", dev_name(dev));
+	if (!irq_name)
+		return dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
+
+	ret = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx_interrupt,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					irq_name, dwc_imx);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request IRQ #%d\n", irq);
+
+	ret = device_add_software_node(dev, &dwc3_imx_swnode);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add software node\n");
+
+	dwc3_imx_configure_glue(dwc_imx);
+
+	dwc = &dwc_imx->dwc;
+	dwc->dev = dev;
+	dwc->glue_ops = &dwc3_imx_glue_ops;
+
+	probe_data.res = res;
+	probe_data.dwc = dwc;
+	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
+	probe_data.properties.needs_full_reinit = true;
+
+	ret = dwc3_core_probe(&probe_data);
+	if (ret) {
+		device_remove_software_node(dev);
+		return ret;
+	}
+
+	device_set_wakeup_capable(dev, true);
+	return 0;
+}
+
+static void dwc3_imx_remove(struct platform_device *pdev)
+{
+	struct device	*dev = &pdev->dev;
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+
+	dwc3_core_remove(dwc);
+	device_remove_software_node(dev);
+}
+
+static void dwc3_imx_suspend(struct dwc3_imx *dwc_imx, pm_message_t msg)
+{
+	if (PMSG_IS_AUTO(msg) || device_may_wakeup(dwc_imx->dev))
+		dwc3_imx_wakeup_enable(dwc_imx, msg);
+
+	enable_irq(dwc_imx->irq);
+	dwc_imx->pm_suspended = true;
+}
+
+static void dwc3_imx_resume(struct dwc3_imx *dwc_imx, pm_message_t msg)
+{
+	struct dwc3	*dwc = &dwc_imx->dwc;
+
+	dwc_imx->pm_suspended = false;
+	if (!dwc_imx->wakeup_pending)
+		disable_irq_nosync(dwc_imx->irq);
+
+	dwc3_imx_wakeup_disable(dwc_imx);
+
+	/* Upon power loss any previous configuration is lost, restore it */
+	dwc3_imx_configure_glue(dwc_imx);
+
+	if (dwc_imx->wakeup_pending) {
+		dwc_imx->wakeup_pending = false;
+		if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
+			pm_runtime_put_autosuspend(dwc->dev);
+		else
+			/*
+			 * Add wait for xhci switch from suspend
+			 * clock to normal clock to detect connection.
+			 */
+			usleep_range(9000, 10000);
+	}
+}
+
+static int dwc3_imx_runtime_suspend(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx	*dwc_imx = to_dwc3_imx(dwc);
+	int		ret;
+
+	ret = dwc3_runtime_suspend(dwc);
+	if (ret)
+		return ret;
+
+	dwc3_imx_suspend(dwc_imx, PMSG_AUTO_SUSPEND);
+	return 0;
+}
+
+static int dwc3_imx_runtime_resume(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx	*dwc_imx = to_dwc3_imx(dwc);
+
+	dwc3_imx_resume(dwc_imx, PMSG_AUTO_RESUME);
+	return dwc3_runtime_resume(dwc);
+}
+
+static int dwc3_imx_runtime_idle(struct device *dev)
+{
+	return dwc3_runtime_idle(dev_get_drvdata(dev));
+}
+
+static int dwc3_imx_pm_suspend(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx *dwc_imx = to_dwc3_imx(dwc);
+	int		ret;
+
+	ret = dwc3_pm_suspend(dwc);
+	if (ret)
+		return ret;
+
+	dwc3_imx_suspend(dwc_imx, PMSG_SUSPEND);
+
+	if (device_may_wakeup(dev)) {
+		enable_irq_wake(dwc_imx->irq);
+		device_set_out_band_wakeup(dev);
+	} else {
+		clk_disable_unprepare(dwc_imx->suspend_clk);
+	}
+
+	clk_disable_unprepare(dwc_imx->hsio_clk);
+
+	return 0;
+}
+
+static int dwc3_imx_pm_resume(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx *dwc_imx = to_dwc3_imx(dwc);
+	int		ret;
+
+	if (device_may_wakeup(dwc_imx->dev)) {
+		disable_irq_wake(dwc_imx->irq);
+	} else {
+		ret = clk_prepare_enable(dwc_imx->suspend_clk);
+		if (ret)
+			return ret;
+	}
+
+	ret = clk_prepare_enable(dwc_imx->hsio_clk);
+	if (ret) {
+		clk_disable_unprepare(dwc_imx->suspend_clk);
+		return ret;
+	}
+
+	dwc3_imx_resume(dwc_imx, PMSG_RESUME);
+
+	ret = dwc3_pm_resume(dwc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void dwc3_imx_complete(struct device *dev)
+{
+	dwc3_pm_complete(dev_get_drvdata(dev));
+}
+
+static int dwc3_imx_prepare(struct device *dev)
+{
+	return dwc3_pm_prepare(dev_get_drvdata(dev));
+}
+
+static const struct dev_pm_ops dwc3_imx_dev_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(dwc3_imx_pm_suspend, dwc3_imx_pm_resume)
+	RUNTIME_PM_OPS(dwc3_imx_runtime_suspend, dwc3_imx_runtime_resume,
+		       dwc3_imx_runtime_idle)
+	.complete = pm_sleep_ptr(dwc3_imx_complete),
+	.prepare = pm_sleep_ptr(dwc3_imx_prepare),
+};
+
+static const struct of_device_id dwc3_imx_of_match[] = {
+	{ .compatible = "nxp,imx8mp-dwc3", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, dwc3_imx_of_match);
+
+static struct platform_driver dwc3_imx_driver = {
+	.probe		= dwc3_imx_probe,
+	.remove		= dwc3_imx_remove,
+	.driver		= {
+		.name	= "imx-dwc3",
+		.pm	= pm_ptr(&dwc3_imx_dev_pm_ops),
+		.of_match_table	= dwc3_imx_of_match,
+	},
+};
+
+module_platform_driver(dwc3_imx_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DesignWare USB3 i.MX Glue Layer");

-- 
2.34.1


