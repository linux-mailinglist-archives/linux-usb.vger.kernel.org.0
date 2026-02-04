Return-Path: <linux-usb+bounces-33089-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NtzBfong2kxigMAu9opvQ
	(envelope-from <linux-usb+bounces-33089-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 12:05:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 93877E4E29
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 12:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F00133018588
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 11:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46163E9580;
	Wed,  4 Feb 2026 11:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HRRKkWt/"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011012.outbound.protection.outlook.com [40.107.130.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52BE3D9049;
	Wed,  4 Feb 2026 11:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203110; cv=fail; b=TnHGKUYgvDqYkTabTSzrcLksY/A5zprTeqgyBvZQXWGAK9WeYH2Lw+k8YUgovkRWDN+AOCIFZM+ZZlxFs2PqWblxDsZi1wpS0envpbGGcP8WQb4mKAxVMIoeniUPt1LZc3Zy/UJYxvCxvI7iAp/JKoTuDt40iz6hY4MoYD7I0ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203110; c=relaxed/simple;
	bh=HzjA1hcZjarDnU88hnqAELecdLaolYzmU2dy5wCzbL8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=L03PpI35RoNux6IdwWgBztEswWqkDKxpKEnx5dZZd9jjg3dFH2t8nlq/fomgng1blZRyE0OD6ujOO97XKmxE8PHDQk/aXvwZTMWhFN1zBD6w+afTHrJNQEN0MisCZ9ZISMd9hzbFCLqihsOv5AHacntpR0VmIkjq8dLsz8AA4FY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HRRKkWt/; arc=fail smtp.client-ip=40.107.130.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiQ9GoWbc5UxzX28Fj+InJwnSD3ce7vun8ti83FsJJsYOVKVJoE7H5TdZvnZmHka14IqpjMh9qcspui/zwVMyXO/9igGVXB00PPgE+btXXHkuv71Spxgd7u/MJEXV3ZXe9lhDfMVtXiQ9jiSIqxLaJED6U810QiAxfSWVl6yiksfNxa6n318HqZ9r5GEIs9CEQk9+b+gaWnp3HBRmzF4HSr169HHbvuLaRbWQhJL/YYiYmr3wJaQQjPD5Sl+LFotKhZnoYKfZPCOyznLFR0H1vWo/wpOagjb+S1Y9ekkfLU2W/5QleBYgDcTtkWZassk9HReKAzBf8qMbZc9YiES4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cf4oLWAvo5Jmfml0JEEbsOUKZ3OEtR5FFYNHt5g/b0=;
 b=iB9VSzdatUUsgO2A78GvrtENrVXf6qm22WWvfBConnduIS38OcZjB9HRtbQyFT41wV2FgBEiZma+SQkBECaoqHUheiBm3rt3+skFMs51RiGgy83pnbFZfOoFoO+22ESxtEGLNWEl6siJBzFgT0Bb7SnJ+PesmhwFSlKWlj1tuWI59ufudii0UIcRfBtRPl9qYzACrzn0YH98I+k6bfgYC5AhnL/tfXTh3+GPXi9pRgeNzKyw3hIA4prftIJ0Y+uAzENp+MW/88vxgzdPuxTooEmFcmwp14EVMyTwriZjkXc6O+jvadL1xufEILpSj6sYRpYGSzH9h2Qi6KD5xQeekw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cf4oLWAvo5Jmfml0JEEbsOUKZ3OEtR5FFYNHt5g/b0=;
 b=HRRKkWt/yiMdByZOV0Oa92xX2ZPzD1+QaPB4a3FHU2skaZM4UCdSV1bMxsHNN5OjwxyIKy/T2CabCbI6eDKPofK8dWRHxhoPMZ668v6J+4V9xFNg9qcDpqc7XDia3L6TTTZWWZOlK40eHSRTRggwaOG7d4bS/K74I/xBLWV27F2z3EOKayItsg0fS4DV2piWhysonXUj3pMXU+3vh6vXKC0RBMDK1Pt7j7sq0BkZnB0Hzi4UmumclEi7lSIGp5Z8tO1Gpnqz9uBLarzMaND74XRT6ORJIKepL8xsLuZ6osvom1/TmjsvdM1/OJlvRdUvpk89u07ccr6qsSbJKmANUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV2PR04MB11303.eurprd04.prod.outlook.com (2603:10a6:150:2a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 11:05:05 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 11:05:04 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH v2 0/3] add DWC3 i.MX driver based on flatten devicetree
Date: Wed, 04 Feb 2026 19:06:15 +0800
Message-Id: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-0-d2c9b5a58c01@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACcog2kC/5WNQQ6CMBBFr0K6dkyBgpaV9zAsxnaQSaSQtqkYw
 t2t3MDNT95fvLeJQJ4piK7YhKfEgWeXoToVwozongRsM4tKVq3MA2gtDC+MkRzYGOCBgSzYt6m
 BpxWs50QedEsKFQ66uUiRXYungdejc+8zjxzi7D9HNpW/999CKkGCUQob0qWur/Lm1uVs5kn0+
 75/AYxEskLYAAAA
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
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770203208; l=1943;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=HzjA1hcZjarDnU88hnqAELecdLaolYzmU2dy5wCzbL8=;
 b=6nvXH2KZkv/RdCxF+JtuuKFbGUaPziCMTv9dOko5nEJ56KWHXitdnUY4tOVH9eLxV5Z6GMmML
 aZNynKFf++WC4SQgD0cCwkb0+PYRaP9h2nOR9veCgXeCR9CX6nkM3p2
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::17)
 To PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GV2PR04MB11303:EE_
X-MS-Office365-Filtering-Correlation-Id: cf623f9b-4e2f-4055-a4e1-08de63dd3ffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnVqN0ZCQThNZy9zbFJabGxsQWUzdUpzaDJxRHg4aHZiSHFxaVZmUlBHRTA5?=
 =?utf-8?B?TEd5TCtkU0tqMnprUVg1aVRQY0VQbDd3eHhNR2QzMlNndnlEMXNoVlRCd3lB?=
 =?utf-8?B?RFJpVUJORk00OU1HQ1RkMm5qWlh2WFBxTGtNcVp3d0Q1K0srR0JuMHJlT1BZ?=
 =?utf-8?B?QmsyRHRPQTluN2N4YUd5VFBJZjBYMGpqb0NaZGFEV3lkaWg1WWZsU21DR0Fp?=
 =?utf-8?B?aXg5OTR2VFZscFQ0Z2tCSk1aMGF0U3FYclMxMDJHM3c4SUIxN2NkMGErT3dI?=
 =?utf-8?B?T1U2UWk5b05ibko5OVNteXdNNXErTml0cCtPWVp4WngvSUYrd1ZNVTlOWXJD?=
 =?utf-8?B?Mk51bDRZYnM2RXRiMW5XKzNjcHpOcjRpZGFoOWc5V1hnRXQzUnYvREFpeU80?=
 =?utf-8?B?YWxETy9ndGFDWmN0eHQ0MS9SOGE3OGpzeDR2NEJoMzJ1VTlaRkV1T2c1UU16?=
 =?utf-8?B?SGc5S0tjdlFER3RiOUNvbjNNZWpLU0ZxMmNseWloak12SDFqV0dNbU5BU2Jl?=
 =?utf-8?B?czZmRDRMRVc5UkN3Y25SbkFyeGY5enlxWmlYdDcxN3RuTmlmYUpaWmsxeHZX?=
 =?utf-8?B?aThtaTBvT1RzTC82NTRXdjRrNmdhOThFZ3ZnQ1BKNTRxKzZkSU9mSENqQzZN?=
 =?utf-8?B?SUVvTUFQS3JBUm5zNGs0MDVreUtoeUt2aTVFSHhpQ1R5Qno2aUZibnduenJu?=
 =?utf-8?B?dEwzN096eG5pK1MzS1J3cENvbnhoZ3REdnFjWWpmckJ2MDBWN1NyTjI1UGVl?=
 =?utf-8?B?L2pSTDUyYVJ3MHBSS3NvaU9zODNEZU5XSHRzbTdReHZwUW13cFNUUXNnYlBR?=
 =?utf-8?B?clVoQ0NFZXF0cEIzQWVKSVFKSnpZQ0N4bWNTWGNMc2N2YXNxUG9LaVFudFBO?=
 =?utf-8?B?aklzR0dyc2xWcC9yS255dk1JS1NPNm8rYmpGNldSTnZ3REdVODEvY1QwbkdP?=
 =?utf-8?B?OEFsKzFOWWprRkVIcUVqemI0bWs5eW40d0RBYWd2SFhOOU1oN1VrUzA2TzJ1?=
 =?utf-8?B?M1VoSVpoS1pNcDU3c0N3Snl0STFjSkdPTWhQUGlBSXJFVWFHMzVCN1ovR0JC?=
 =?utf-8?B?NUpteFhDT2ptS3Q4aFhraXREbFNwMExkWFlTQTA1L1dLZkFVLytRbGRGY21w?=
 =?utf-8?B?d0JYeEs0UkNFR2xrY0t5aXNKN1N4dElxZUpsM3grUURZck1DZ0JhbE96ckN0?=
 =?utf-8?B?Ti9RQlB3Wk1lU2lJQnJTZUNJY201eldaY2lrV2tzNmUzMEY5SjZmcXFMZDkr?=
 =?utf-8?B?ZFdxR2lJUExYbnZleGpHV1FmYjUzSTc2UURTK3RGK1RWek5LR1JvVlVXMkI0?=
 =?utf-8?B?QTdEOW9yZUFBdkVxcktHNkd4Zm1SZy9QcVNrVVhEMmxmRmRpbE1WZXBrejFG?=
 =?utf-8?B?NEpncGUzZkZUU0lqTjNCaHRKemt3cHFXOWI2dEg2MGEvQkJObStPUmhqY3Vo?=
 =?utf-8?B?d0tWd1dRQ00vUlVkUjczL2gySlJTa2xMMXNwMzVFbkFrRlo1TmdyKzZXOHNV?=
 =?utf-8?B?bTdPalZoMGVUUEVQV3NhUUY4RndndWFPR1dYV0NKWUxreitRc0QrWkdkRk1B?=
 =?utf-8?B?Y0R2cHVmeVozTWNsVWlCT3BjVzJGcXArR0t2dzhFYWI5c0tNWktLc1QranU1?=
 =?utf-8?B?NUJ0Z3VNelNGaEh1V3VmMWdpeFdqdGZRRWRYTlVLa0FjVFdQWlhwSkJ0Q2N4?=
 =?utf-8?B?ZFNXRmZWNkp5QnR0OE5rM2FMT0VnR2IzdWEyV28rUTNhUDJQWS9Sb0czTzNs?=
 =?utf-8?B?TDBXQVZ6UWF1V3FKTDVaMktyOEwzcitWT1BvTXM3YUpNL21mYUt5U1plTXpY?=
 =?utf-8?B?WnlUWkJvT3A2SEhsL3hWMUxiVmhLdTB2OGhzbVFJTVBVMHJRTUY1WVJaWnpT?=
 =?utf-8?B?R3ZJbTNERWVlRHYrRHR2L3MwZXVXT0dwdHg3NlR2OUxtZjUxeHhPYTJOS2pW?=
 =?utf-8?B?eDB1YzVQbXQwd2p6bElkRkpzNnczS05MUmlUV3ZTZ1JiLzZMZlc1cjN4am1r?=
 =?utf-8?B?WmhRek9PV2t0cmVsTmpRSlNXY3lEb0RhaC81d2d4M3FnbXlqQVl4WER0Q1lk?=
 =?utf-8?B?L3NaM0FGSDdabFlOMXNnMThWTkluaUpmR3dBY2llQWE0UFp4Y3l5OWVZdllC?=
 =?utf-8?B?bmsrNk5PdE9qZ05pbWZWZXFzbDVmUGpDcFVHaUIybTZreFlwdGp2QWd1N2N4?=
 =?utf-8?Q?lzcwvibFEKtL1C4yKwVPua7B5ZlZRv9NALuTBNWefQxK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDNRYWR1K29Kb3N6NHdGSjlYS0dLYVhtaTl6TFRlZURiZVdOelF3YWVESzNT?=
 =?utf-8?B?cWZrbnNONG5Md0hUeGhLSERmeTd0QmMwS0E3NDIwTWN6RFAxTEE4K2FLRUNq?=
 =?utf-8?B?RUJ5TUxsWkZDWlpmT0RUdStGNDFlRGJ0VjFkUTgxVW9xVnBrMFZaczQya0J3?=
 =?utf-8?B?dkRuT1BiSFZ5VnV1RW02KzRBcWFHd0JJZVB4NjUzOGNiYXZkOTFiZG0rcTRR?=
 =?utf-8?B?VGpDL2tIVnJXU0xRMEdRelNvQUc4RUZOc3dlWnVUZUtEdkQxRjE2ajl6UWhW?=
 =?utf-8?B?ZzRUbTNIWVc1YXp3WXJnZ1h3U0VtMkpnQzBlc3N4TE9UZXBJd21IZ1l3cS9v?=
 =?utf-8?B?MTVhL0tBa3lPY0wxczRIVjdsYThPSTA0RXJxdlZDSzh4M3Y0NnZEcmdTWlEv?=
 =?utf-8?B?Q1BYTjY3NnBMZkZlR1dMY0FBMkNJcWZuZVN2NlJTbVZmdGljNTVVVHd3WER6?=
 =?utf-8?B?VDlyODNydFdtbnYxOCt0aWllYVI2d3dZYlF3K2V0ajR6TXlFQXo4ZE5QQ00v?=
 =?utf-8?B?TDU4VjZYMUhBS1ZyaGMvdy8rYkJHN0pHYkZtQXNtSGgrc1NYRGgxdXBjQ05U?=
 =?utf-8?B?Mno0cHdUOER2S2ZaUU9Mcmw3R0R4dkJSaFJsamd5bFYwRGo0RXZmbVk5T3la?=
 =?utf-8?B?TVBqS2lHM3VEU3J6QWxIMVFlRnhZS0VUdFJwMnRNVTdJcXYrcWxLem83YVo5?=
 =?utf-8?B?R2w2ZU1UN29UcHhxUWZ3a3U2US9pUzhubXhPeXcrSFJHbUlSNnpTczY3MXU1?=
 =?utf-8?B?WE5NZ3Nlb3NSWmFHVGJ1bzdod1BrUFlkMUJZR3YvOSs0QndFVkFyaXM0T0xZ?=
 =?utf-8?B?dDdhL09lcjhodXpoNFBrb2xKWkRZSDNDUmtCN0FjKzBZWFNUOWxkQmcxMXQv?=
 =?utf-8?B?djVVSjFkdGdNQXNObzdyczBPcVpFNEorSFRBOHMxdnk3c1ZsZ2t6VnBmK0o4?=
 =?utf-8?B?UjJHaHFPRE80QjdvdTZTM3A1cVBGT2QxcFN4VzFvVDg3blVxMW5najBNbGFl?=
 =?utf-8?B?Um9oYjBqYnU3OE5qTGd0dHBMdytrc0ZkcFBQaW84MUtuYmlRNVByTHNXWnIz?=
 =?utf-8?B?czBhQXRESzVGb1N3K2F2THd1T3FLWDRjYnY1Z2VuZnpzSVlKQVYyd0NERzMr?=
 =?utf-8?B?RE4ydmpkeWFQcTEzS3E0aUpXdzVIdU8zMVFQTEFTK1c1dkh2Q0F5bmtzVi9z?=
 =?utf-8?B?bXZENXdHUWplYjZOaGxsa1BGNjExSjNrMkltWVluMDNvMDEwRytKTmxIQ1Vj?=
 =?utf-8?B?MmdydjF0VURsa0pkUmlsaytBM0pITTFzMkZtR2dOMHlZTjhrMlFjV1FUc0Zj?=
 =?utf-8?B?dFVvSWI4VzJzb0RmT0NRS1dWVk4vbWxnTzFZaGZGTW1tVG9sWWlVNVg1ajls?=
 =?utf-8?B?WlpLRW0rb2k0a2VKSFpuZk5KWFJ2YUFKN2VFN1pCSW51bkxNWG1zM0lWYTBu?=
 =?utf-8?B?c3J2M3RpZDdmeFhjcG5EV1lEVzhCTCtORVE0S2tvTzYvNkVadjdWQTltN1dn?=
 =?utf-8?B?bzhNS0VBbkJjY2U5UHltL2hUUjliU2ZLSE9QQTZhbHNaNllibGg4ajR1Y0VD?=
 =?utf-8?B?MDBrVVJqOFN1QUE2elQ3T095dDFDMkpmSUZZdlJZQUVtQ2lJeFk5QzR6bGFE?=
 =?utf-8?B?RGY1djl4Kzg1L2xXVXJURkMrSnIvSkd0SzYvcjJXbHpkQzNiNXZHbTJXSG9Q?=
 =?utf-8?B?eGZhZkFsaFZhMnlWQjZMeXBzSkIzOFR0M3E3ejhLa3hDaUxBS0lLZGlDT3dk?=
 =?utf-8?B?UmlYN1JEWHM4Qi9GZlBFU29sNHZsMkpwT2VDU2NMamFsUk1qS2NuYVJlVzVn?=
 =?utf-8?B?cjlwckN5NWhzVTVDQTdIY0E2WjhYR0NaR1Z5Rlg3aFh1QnRXRi9PKzNGZGls?=
 =?utf-8?B?U2RCN091RktzNjBDa0dzZkM5MjVvcHZ0U2htN1JPbTF1RUxRaE93NDdyajcw?=
 =?utf-8?B?bEw2MTNpZ09paDgrQ20xMnd3UTdjODVrVndyWi8vRm1jNVF3aFVxVzZ0TE9w?=
 =?utf-8?B?K2pueE9JSkIvL2M5eTN5dWd6Mi9ZbEp4ak1kVlBOUTNLd21jWEZMOUdYNVFu?=
 =?utf-8?B?ODBVbVpHOEsxbUpOYVZoTVNDVjlmR1RrTE9XMUxVaE5XYmxhZ2hZOWwxTlhV?=
 =?utf-8?B?WmV6QmtjVjFDMlVSalZMSE5Vb1FoQ0ZNQzcxRnJ3RjVoLzJnNWpUVUpUL3FU?=
 =?utf-8?B?dUNtdlpwNFU0ZHZ2cktEYW11ZUdiRHFzdzN2eUxsWHp1WWNNTGF4QzgrUUNz?=
 =?utf-8?B?dy9LczJKY0k5cG9ZTlM3K3ZCcEE3cWxSQ1pqS3lOeXJXbHJjTWZ0Tkt0MHVN?=
 =?utf-8?B?aW5aUDdPa1liT0ZoZG12UFFiM1J2ekI2NVJhVlo5dDNVbll5c29GZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf623f9b-4e2f-4055-a4e1-08de63dd3ffe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 11:05:04.8010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5KqTiUFZLAT28cct1b4Ybd5BK/HqcBDeRANvni7ed0JFSQEL+5UkNoxC5soLWDP1L+Y+Zm46v6dYHvbpOT2kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11303
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33089-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,i.mx:url,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 93877E4E29
X-Rspamd-Action: no action

The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
USB block in a single block will bring more benefits than a parent-
child relation.

Now DWC3 USB common driver already support to do more key jobs in glue
driver, such as power management and core initialization. Now let's
make a step and add a flatten devicetree based driver.

The first one add a new "fsl,imx-dwc3" binding to describe all i.MX
related USB controller.

Then, to support wakeup capability even when controller experienced
power lost, a fix patch is added to make controller work after system
resume back.

---
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
      dt-bindings: usb: introduce fsl,imx-dwc3
      usb: dwc3: add needs_full_reinit flag
      usb: dwc3: introduce flatten model driver of i.MX Soc

 .../devicetree/bindings/usb/fsl,imx-dwc3.yaml      | 131 +++++++
 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |  13 +
 drivers/usb/dwc3/Kconfig                           |  12 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.c                            |   9 +-
 drivers/usb/dwc3/core.h                            |   3 +
 drivers/usb/dwc3/dwc3-imx.c                        | 430 +++++++++++++++++++++
 drivers/usb/dwc3/glue.h                            |   3 +
 8 files changed, 600 insertions(+), 2 deletions(-)
---
base-commit: 0a06917432a762d6233f88963c0b53e48dbac6b4
change-id: 20260202-add-flatten-dts-based-dwc3-imx-driver-96e4a4af9570

Best regards,
-- 
Xu Yang <xu.yang_2@nxp.com>


