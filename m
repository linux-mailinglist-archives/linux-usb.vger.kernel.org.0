Return-Path: <linux-usb+bounces-33319-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCiKO8qfjWnv5QAAu9opvQ
	(envelope-from <linux-usb+bounces-33319-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 10:39:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8672412BEF2
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 10:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D95C230867F7
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 09:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B0D2DCF7B;
	Thu, 12 Feb 2026 09:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZndZm0sD"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FCB2DB7A7;
	Thu, 12 Feb 2026 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889139; cv=fail; b=DGE8a5PYKnhdPTZ/V7zm5e1xojaAuWMFxUZq5ENpzNuU6crHedJcU3xXks8SIrBw6r21VieOT+XP+L2yzfrZ5ZWfg4WOFc/43jIwBSCkG2Czkp709k98/IxtlIw0ISSfhDHmppMKJvN5UpdGlj6D8DAEudL77TeaA/RkF5I4zGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889139; c=relaxed/simple;
	bh=7feIuun374+Zr2CSn+sZgbfDzMGGEjpaMX0mVfdiXmQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=VnhEZ7ZCVTnMwnDDMvt85QKhu0rOKyrKZiTbnUxz+yFFM3T401+GBmGGqHLYPCC4FUVj6q5gLsOpgZ8cSzAMZsCKqOIdE/0upcPCGuLJzVLn2rRXchDQih0zbS8Yh8PiXIY8GNbo0jmAnYSzzegfv2toIh7rPW/IKhEosRjr9I4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZndZm0sD; arc=fail smtp.client-ip=40.107.159.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBcNHVq5G15PBBf0tp2z/hi9EZ0yL1OovPC+YHCrTaGt0//ivfBJdSbZetOIx7aK/U0sw2W2pKXXRAL88Y8AH+A6MNXu4eYAyMrjeusiVCIizdP3XYH66oMOmmhek8DcqzOMFseek/06wVbkesZljiIKFGAi9L1erYv3nhD9qRyBuuEG6PC/t5fmKW/6ZD6FSu8N4Ubb+BK/8sOowFB/rW8f2p83xEjAAwkwM6iV0M97plHb+2JMDjGvUwM0i90ATwiu84E9dSMWJRAUHZA5oOZML6GzSnzcNUjNNAQ6nHP0kpS/zGBQD287XYMF6h/wJK28DEsXiff5/PdzjX/bQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+/w6sPsgg/xUanNIp5plmWBBFaN4JfotLi27xnAaMs=;
 b=we9ptCDyIM5PneBlt90ipRJP7mjJcWMT1SkWWks8eBJk9Hp6Q8M76yLP9JZ78rQbK5IEPoJ11PIWpF9qwTNLSzjgaV4NLa6O9NIFU0PFL05oWANrYvym77/nhq/hhJ+8TcjRWOp6D3Be1U2qvJUtUPJDNiefqTnGr1sEiar49BbpF1ClZHpmeVJ4R+ZaMk4PXossRip+PFwQ9wA1POg2T2FL7eE1pbS+NkLevKGLZrjo8rzCBFGo7n0k7udgUOsUi5BqzdVDIZ/LtcVP85Azm4As5JYy49fwWApHSQIrY3eGQD2t4vWpvdHAy+Zaf6u8SQBPSvSjgN6FcROZvGC5rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+/w6sPsgg/xUanNIp5plmWBBFaN4JfotLi27xnAaMs=;
 b=ZndZm0sDKNCP6E8bzrRQB6d6Dr+Li1FeY03SWGPUUK59tTnU/nUE7j8tNqmSni0MHj9nTIbsxQW0nH30caPTgfc1gCZ/HKEUOVwtwkhJE4I//C3+9UfeEQX82CIRIYLNEx3iVTVdBa5yji3RLGCQ28C+XyRRaRGzC5sNEL9VNiygwQ2VBrGnRy6Vqe1ahhU94+WXahLBEhB3xEQTimQO7qE619fXkDRdbmLVZujNgWAd9EtLFg4e2AQal8LQYXKM82+yret1pgaa1lcqOgeNcGlGUGiQ5hxA31LmN/jw8WEJI/thaBDEYp0OU+JhK+17PPlg7ze9JYz+2nFYRz8PIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GVXPR04MB11667.eurprd04.prod.outlook.com (2603:10a6:150:2c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 09:38:54 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 09:38:54 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH v5 0/3] add DWC3 i.MX driver based on flatten devicetree
Date: Thu, 12 Feb 2026 17:40:25 +0800
Message-Id: <20260212-add-flatten-dts-based-dwc3-imx-driver-v5-0-ff04a75ce221@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAmgjWkC/5XPQW7DIBAF0KtErDvVgME2WfUeVRbAjBukxo7AI
 q4i370kmzo7dzPS/4v3NXeROUXO4ni4i8Ql5jiNNZi3gwhnN34xRKpZKFQt1gOOCIZvN888As0
 ZvMtMQLfQQLwsQCkWTmBb1k67wZoORbWuiYe4PHc+TzWfY56n9POcLfLR/nehSEAIWjvDVtqmx
 49xub6H6SIeflFbU+81VTVJBeuNM31A+Wo2W7PdazbVZE/WW991qO2rqTem3P27rib2QaLHnr1
 v/8x1XX8B/BE03tQBAAA=
X-Change-ID: 20260202-add-flatten-dts-based-dwc3-imx-driver-96e4a4af9570
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770889241; l=2715;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=7feIuun374+Zr2CSn+sZgbfDzMGGEjpaMX0mVfdiXmQ=;
 b=7YXHNdu6gGAht2KEuL+QA1Pifxh3e3oXPpQ7C2kfouSuCQ8zS6UtD+XmMaa4ci4b6Duvee6X9
 dnYNzuNykTHBTeesl2XceqS0Krbt6lfGEn2OHbD7BrvscbeJvPRnavi
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GVXPR04MB11667:EE_
X-MS-Office365-Filtering-Correlation-Id: 370f1329-24e7-41ea-f807-08de6a1a8958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTM2dkZtenN3R0YyOWFiMURBV0UxNkZKMDFoYTlQZlFpZUNjY2lFL05LWUhF?=
 =?utf-8?B?MDMyd0hudEpSdXNHUk9iWE90QnFzS3FpTFdnUFBwMGlRby82OGx4UE53blQy?=
 =?utf-8?B?UjA1S2t3OStwcWF1SHJ5RnFDOWpIQlkxRFRMd3BqZ3FhSHl1N0RRa3BSSUp6?=
 =?utf-8?B?R0NPbURtdXJMYmZQTG4zcytsSmlMeC9VWDdtN0tNelE1NXlmQ1RxWm4yNHB0?=
 =?utf-8?B?b0crbmRPVCtaVmQ0ZjRkVTlSOTJtMG9CL3dRU2dRVDdacVZkRmoydlJsVTl0?=
 =?utf-8?B?aVVZVXp5djVwTUd3NEdxeEFwSVRwVHdZeXFMRmlkUTVkUnZSRTN5eHU1M21i?=
 =?utf-8?B?QjlSMlEvTEZhV1k1eGcrTk52V1J0QnduenFCdzlTWERCTk1iYW83cVZ2L09n?=
 =?utf-8?B?SjhZakxJaGVsbHdNRjdNQ21MYzVLc3ZGT1pvc2pJZ2lxZ1ZDdFQ1b1lubDRV?=
 =?utf-8?B?ZDVMQnE4S21LOVlCajNGS25mdFYrU0RuMUFHN0Y1eTcxYUJwZnhSQkNETVk5?=
 =?utf-8?B?aGgyVG4zZ2QrcTk4RkpvblpwcUoxYUE3WFcxWkF4Z1hiU2NOdXNqUitRUUJj?=
 =?utf-8?B?K3Rka3Foa3J1dXAvcVl5WjYzRHY5WHB6LytGcnpLQnRXdzliejNscGM2OFRI?=
 =?utf-8?B?U0Q2SG1MY290VzJwQU15dEdKK2x1aHJReE1YUXpCRVZJdDBoV1dKaThjZEoz?=
 =?utf-8?B?VUtqaGtoUEsrdVZ1RHhwYzI4MzUyNjhVMGc0OCs5cUVDSzNVTk4zZXRuZ3FO?=
 =?utf-8?B?dGMxOFlJMzNZR2pDWkluSUpNKzR3bVVXeWh5a2hJUCtROU1HUmlaWlMzTmp2?=
 =?utf-8?B?QldiZEhCNlF6Q3Q4THlPYkNxWENvUVVTckcyeEJ0OEhTT2xhR0pkYTQ4ajhY?=
 =?utf-8?B?Zm02eXJodXZ2d3lFdnZpK2xMTTRaUzFmY3BLSEx2R3pDOGlaZFc4QnFpc2Uy?=
 =?utf-8?B?WmhMcWFmOFMwck5pV2VxbFprNE9RTHl3cXdFamMyMXRnQ3ZhR3NoSGFlYnpJ?=
 =?utf-8?B?TUszTWtMNkdtNThYcmpabWxWNmJiRE54TGg4b0txYnpqaERNSWk1ZE5tNDZk?=
 =?utf-8?B?M0pleXQ5SmVMemNsR2tHS29sUjhGZGNkNmpmTHdRUHB4YkJQRUN1VlZIcHpi?=
 =?utf-8?B?SXRrTnFocEtEZ2RhMGU5c3FlMFNkbWdpbW5CWW9veVZoRk1Nb0U2Q1RTQW4x?=
 =?utf-8?B?b0dXU1pHa2pma0IzRUViRG1YTk1Wd3J4UmtZalJmNE4wYmNKQUE3RGMzOHly?=
 =?utf-8?B?ME9TalJwWkdDK1hEQ2JxYUpWem9scTRaZkhIazFzLzYrQVNNcitnampJcURE?=
 =?utf-8?B?NENKM0V1VWNjeit4TkxTVzRYemtJQ0VOK0lnd3psVEVJVk8xUFlKQ0p5ak14?=
 =?utf-8?B?dnBJa1lXTkY5eXE0eFlpN1NSY09kRm1JMm9CN1U4bDRMaVcyMG5pakd0bnVu?=
 =?utf-8?B?SlR3a0kxcTdPNENsenNoZjE4d3l4S3dHTDNJV2Y1WGMxRjdXbWRFZ0Irc1pM?=
 =?utf-8?B?ZXR0bUh5Y1NsTndMYXpidEtJQUw3Nkh6MW80eVhGeFBqR2x3V3VkNUNiNEd2?=
 =?utf-8?B?a0dyTDE4YU90OXhYdDdvaUtxZHY3dS9mWENaYksvVE53OFZOKzFXRVJ6Yld6?=
 =?utf-8?B?WW5jV3BTRFk1Q29sR2NHQ3ZQeUs1TzlyRTdVSWFxZnVLMEdMNHc2TnRlOVVR?=
 =?utf-8?B?MFp1K3pmcGo4V1lmbHIxVkc2M3kzZ1VoWk5wN3JxaUI0VHRMS1Rrd1dhSmVE?=
 =?utf-8?B?c2hJUFA4MStXL0ZkNHhjMmFWOFlkUDMrNFhxQjBVcVRsWURYK0ZYK0lSTjkz?=
 =?utf-8?B?V3NoU3NOZURzQjNqeVo4bmxqeHA5b1NVTW0yWWtUaUpsNGovNUtvZTNiWmxn?=
 =?utf-8?B?QUt4N0RpR1JibHFZMGEwYTZQQnBLYjdIZDhjbHlCWGJVTmM4eXREVFBjVWhj?=
 =?utf-8?B?V2l2VlJQS1kwRHpHdmxiLzdxRjU2ZFBtalpJZnViU0hEdkx4clplSytTdXhx?=
 =?utf-8?B?dUt5SVk5SC9lcWdxTEp2d3hkLzJYd0crRjhqR3hZY0lIalFJYTlha2V5YlA3?=
 =?utf-8?B?WGF5ZVBrK0MvK2FlaXpXa1EwRG1NdFRKV1kzL0JCVm9kOFRNcXFIMys3TC9F?=
 =?utf-8?B?WFFtdUUySlluWEV5VGR0VlZFN0RaaTFESnFwOG1YRDZzVjlYUkNOMFBpdUJq?=
 =?utf-8?Q?/8JgbRoSURoj1OwcNqVERCn+W+7b5qRxm+CqXCp0xrWb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3JNY3Y5UGdXcmJMZ2ZORWgxNkx2d2tLVWdNTVN0a2JzU3VJRnUrNE5XYzJV?=
 =?utf-8?B?TnRxVFVZL29iWUdqR09JUXRvU2tRSFNoZWNJS1VUd2lQbkc4cjhhNzZXNTNy?=
 =?utf-8?B?QTlqbVhMREUzODlPRHFCVDV4Ti9tY0NIWFdEVFJhTlVsQkM1WWdlVGxRcmxX?=
 =?utf-8?B?OXZGdFVBaGcxQnBrNlNuQWxreWFUU1hOVXVzVUhMOVR1SCt4dExQNENWOEdp?=
 =?utf-8?B?MzVqeWh6cHNGbVBBeEdVZjJHMHA5RElVTG9zbXRpSzRLQWdQUVlNcDdwRk5x?=
 =?utf-8?B?bUVka1gxUW84YXV2cUJEUFBIT0J4cVR2cFVvM01NZE9sU1k1VEhaUkQ1MEQv?=
 =?utf-8?B?ZXNuZndteFUrOURKaGlCcGJWdGRWT01Cb2pEVWNVeUV4MkN2ZThwbnhtZmQw?=
 =?utf-8?B?VWtieFMvTXI2MkpsU21kcjc5d3lGN2JZMmIzbjFnNGVqV0trL1Z3OVVqQVB1?=
 =?utf-8?B?ZU83TEdIZDNHS0JORjZXZ2hNaWp1dWlBSUsvQmNJMmZuZEZRVFJ1azRYM3hx?=
 =?utf-8?B?bWlIc040N0JVck0xT1pwYUw2djBFeGowbkhmZFNvbnVJMHo1bHRaTC9jZnJU?=
 =?utf-8?B?aVNnaVVycjVlZDlvL0YvZ1drR2M0azVVRHhlUEdoNFNGNUJjbkxlV2d5Q1hZ?=
 =?utf-8?B?ZVlVeXdEWm54bUdOUGF3MnB0ME1RUXFkWHVFNHNQVkw5M2dITS9uclBvMGRO?=
 =?utf-8?B?NTQ0K3JEeGdKcTlxUlVvKytTdm84eDhRd3BQS0UwQ2xxcytXUTVtZVhtM1lM?=
 =?utf-8?B?aVRlOEpTaHoxUGEvWlBjSURkZ2ZxYnAzOVh2YVB5RXdZSG8zRXJJVDVHdU9h?=
 =?utf-8?B?UnpNWXpITXVUdDViRFV3SmJMQlN2TUY0RWlZTnRhQ1N0VmpSRmV3QUtVOFhJ?=
 =?utf-8?B?YjN4R2FmMnFGb2ZnT3A3YmtuRCt5eXo4c0ZvdytLUUJobXFVRVlEM0xYRllL?=
 =?utf-8?B?S3hwRTJPd2UyWW9YOG11K2FKek5BazRDM2dSTURYcFpLRU5mL1doMzFQNmtB?=
 =?utf-8?B?N1ZiZkEzaGd2S0dtMFo4M1dDaHZDb0IwK285UGN3ZGM3K0tIV2JzeGo4NUNC?=
 =?utf-8?B?K1BxUWpjc2JabzlhU2NQZW1QN0I0RVVUT3IwdDNuUUdiMDROVHRWZm5La0Mz?=
 =?utf-8?B?dmg3VExMcjFVbHkrRFlnbE9qZVJJUDNjS2RRMGduZE9uTmw0TTl5bXlzRGRU?=
 =?utf-8?B?RE5IWmVqcThKazY5RkF0eHEvZnNlaVlFUlQyazNxTktWdDZLa3kzdnA2OVhB?=
 =?utf-8?B?dmNwK0hUbmY0YzloYyt2UkVRVzVUbHdKai9haGNianBsN0xhNW5iRUdQSytl?=
 =?utf-8?B?SHZHeHVYYjNRd1drYVpOZ2c3NDJZV2tjWFZnS1JPc0RJQzNsZUhLRHBPTm9U?=
 =?utf-8?B?VzE2US9BWHkrYklON296VnpPekdXTkJhN0k5SGxlTGdydFZITjFPSUFQdUVM?=
 =?utf-8?B?Wmg3elc0dzl4UlVCNDlwNmlmTTVKVS9JMktzV3UxbEpBaEVBVTZBSkdNMUov?=
 =?utf-8?B?bHdEczJlOVpyR1RFL2FOcEZLZEdVUEN4c2VKMXZUdEZCcERvakVIZ3UxY3BL?=
 =?utf-8?B?a3ZMVTI5b2dCUWREYmhFRVY2SnpacVEwSU5nZDF5aGtveFZ2MHRPekkwNnNz?=
 =?utf-8?B?YkcxYnZFdzZ3V0ZKckhSVVNMdDFLVnUyK0o0MENScnBaeWZmWUlVZXdndFZp?=
 =?utf-8?B?N1dCUVBYbXppaXhubGNMeDlKbWtWZWVtZkhZOXZwNFlsaHUzT01MRGYxOXQv?=
 =?utf-8?B?L0xqdkoxTlpUQkRua2wwaGVLYjJwT1BhYmVIUU9WZGNwTFh5VFlzUTFxeUJy?=
 =?utf-8?B?QjBEck4zK28zdFhBeG44S2kyZk5hc1dreVFWWnNLcGEwY0w4UlF4NERnZHk5?=
 =?utf-8?B?M2ZUczY2QXZiMUFRdDZteHRCZWF0aWtIb1krdWxpNmY4VzE5cEQ1RVE2YUpa?=
 =?utf-8?B?L0c5ejM5UlpHdWpjeENnUWxBbElTUm4xMGxyOGN1TFRFakdwS2p1b3pZZ0c3?=
 =?utf-8?B?QVRRSkxvZFpSOXNBY1FpRGFONFNhRnRuNSswREdXL1V0YllmWStnd1dyVm9s?=
 =?utf-8?B?KzdWdU91SGtQTnVqdlpMTkpzN1NvSzIvdkJxalNYUkljT0V1cGlnZFo0b3BW?=
 =?utf-8?B?eit2a1hRR2NUYzdad2JGY3V6TE11MVcrRFgyZVc1Z0Jqc3BheFkyWUtweHpr?=
 =?utf-8?B?K2wrVkw1ZVFWNjRkUXhJZnlzcElDSnlKR3VBejZtRDBFcUlTMjdDM054Tmha?=
 =?utf-8?B?TCtCbENiMG83SDYxa3ZKRDIrVEJSODFqK1B0THJFREN6cXVWVFpXTVAxaDZ0?=
 =?utf-8?B?U1Fzc29zTVpYZHh3c0hnbFYzRDFLaGFLZE5uNnRxVis1MDNlQ0Q1dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 370f1329-24e7-41ea-f807-08de6a1a8958
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 09:38:54.0423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsIi2NRHG0uSmiLPP1N8h6ANzlluZI0vA/qCIuiI8IxP/txXh43tM6xw5CRSDgEE56D/ZHPLXTvzYN9iJCWcmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11667
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33319-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,i.mx:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8672412BEF2
X-Rspamd-Action: no action

The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
USB block in a single block will bring more benefits than a parent-
child relation.

Now DWC3 USB common driver already support to do more key jobs in glue
driver, such as power management and core initialization. Now let's
make a step and add a flatten devicetree based driver.

The first one add a new "nxp,imx-dwc3.yaml" binding to describe all i.MX
related USB controller.

Then, to support wakeup capability even when controller experienced
power lost, a fix patch is added to make controller work after system
resume back.

---
Changes in v5:
- fix a small mistake of format 
- Link to v4: https://lore.kernel.org/r/20260212-add-flatten-dts-based-dwc3-imx-driver-v4-0-08c10b08ebb6@nxp.com

Changes in v4:
- add R-b tags
- rename core_may_lose_power to needs_full_reinit
- add dwc3_imx_get_property() to parse of node
- remove dev_dbg()
- describe the transition policy in the commit message 
- Link to v3: https://lore.kernel.org/r/20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com

Changes in v3:
- rename file name as nxp,imx-dwc3.yaml
- rename compatible as nxp,imx*-dwc3
- remove status property in example node
- modify commit message
- Link to v2: https://lore.kernel.org/r/20260204-add-flatten-dts-based-dwc3-imx-driver-v2-0-d2c9b5a58c01@nxp.com

Changes in v2:
- reorder compatible property
- rename may_lose_power to needs_full_reinit
- remove Frank review by tag due to some changes
- fix code style in dwc3-imx.c
- disable wakeup irq when register interrupt by default
- remove runtime PM operations in dwc3_imx_remove()
- Link to v1: https://lore.kernel.org/r/20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com

---
Xu Yang (3):
      dt-bindings: usb: introduce nxp,imx-dwc3
      usb: dwc3: add needs_full_reinit flag
      usb: dwc3: introduce flatten model driver of i.MX Soc

 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |   2 +
 .../devicetree/bindings/usb/nxp,imx-dwc3.yaml      | 123 ++++++
 drivers/usb/dwc3/Kconfig                           |  12 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.c                            |   9 +-
 drivers/usb/dwc3/core.h                            |   3 +
 drivers/usb/dwc3/dwc3-imx.c                        | 442 +++++++++++++++++++++
 drivers/usb/dwc3/glue.h                            |   3 +
 8 files changed, 593 insertions(+), 2 deletions(-)
---
base-commit: da87d45b195148d670ab995367d52aa9e8a9a1fa
change-id: 20260202-add-flatten-dts-based-dwc3-imx-driver-96e4a4af9570

Best regards,
-- 
Xu Yang <xu.yang_2@nxp.com>


