Return-Path: <linux-usb+bounces-33090-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFinLg0og2kxigMAu9opvQ
	(envelope-from <linux-usb+bounces-33090-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 12:05:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36036E4E3E
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 12:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B375130263C2
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 11:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09CB3E95A4;
	Wed,  4 Feb 2026 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PlPdPIkt"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5F73E9594;
	Wed,  4 Feb 2026 11:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203113; cv=fail; b=aWTPQ2SEKFLM86jF4du5YMCzD3qSw59Xv3zth8CBrAbMJ+isExwXJZ5LtQtN8Brl76VObSllwkLS8Nsid8TjSGLUCih+jQrNkgvwlZcYRFzQXa/X0mhU4mPNC8Rj7ll9I0PwZ7rNnSVZrvYrix54QpL5MBvc2Cp3ZuZ9TWHcZLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203113; c=relaxed/simple;
	bh=auV68yjMWqlMtK8HAl46mXe1Kt2D7VaAI1i9zCaMTq8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BaT4KBeuIjrVEi5+NDJgjhbSMb4m5oxzZJPfM2uIG6iSNOmvEnHwNaL5F7cfrCkFFPdQ50L1qTpZFMpNoM9q063z/HNW0v6uP1SoD3QTf2AtP46RwLKrsBh7oXFYlTwVMx03cuRMEDKa5MYLfqjY/gtIdTsyKd1MewkdJ4/DkHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PlPdPIkt; arc=fail smtp.client-ip=40.107.159.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sim10Yx+XV3kBpdDy4xtAeTEsVVBdUKEw+nEDrh838DbKmRDhJP+aqpx0jQEhwF8D44B8xgs7w4gNKwbHDJdka6UjP804DVdgHtOovZkKUktZ2pSSley4Ifb0rEwAqWvTWO3X/ZFbTqZk9gHoluEmG/nO+xaQbRcvZOa6npJ3aqxKtdjGnR7aT/6wXCeEs1v7pwembRSEumrkveyNVAu61GAyUYpM/sO0K8/S5mixNLd0JWlUtD/BTG3k0WGtzucnSErQhVJdsyoBvtPxMs4iqwYUjftA2plzUBkM9zePBurwy6j4sNqcZ4qsEXXekycsM0QfwE/2w0uQhfWxLj4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCnnvnwZHfqYzNdh1q4RwqRkoQ5P2XjqK03nEpaihlY=;
 b=uF7jRvfZspQR28aehdVdE4PMV1bZ+4kwMY888Rc3+bWweMU7cs3/usDHnIc6k7DpPuCpcnGdAteGLgA79J7tLfZ+51dx6Qkar9N/cTBeDke1ZISEGhenilhCehsAaD2iQLIGRgsXu91Z76cw4YOdcinYM85lxvF9KO2qofq/ztpW5XQkFlBptmRoqz5Ys61tEy48h8u0AZBweW7q6w8pUQ+45YPXe4j4qOkErdR2NrfteaFFEOHtCLSucT8r+YNXaie7cAV447mq8nyJbIw/sDGLCHuDbp6dF7VTBWmjkGxLGgqZ+XkVx8S/UwaoLciR49Wp12fJhkS83SvO0Qvfyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCnnvnwZHfqYzNdh1q4RwqRkoQ5P2XjqK03nEpaihlY=;
 b=PlPdPIktlE/XQicQTMqiRntlyH/mMwnu5/fjjMFBTiBqWUZHDSp4lcBOvC7Yne8lIlQ/V4sGI2jXu+3vn2lEDRrD3YAMIHxsF4NhlHKEPQ/EMvD8VTv3bYd1k2i2ypsSeyu0kqiWYy2g4HHxMYOWFXEIGRHUBUyQdli7G/7hEHY7YyzsVBVWkqgVBhX6ptx4aIdFg5NQNdrJzLZWLWIBBocIxgZMZwgQcMQraRyfPGBff/ycFsX+FkeT5HSfp5InV5adQXkbYJbH/C/eIqC9spcRk1c+zwA5fRUL0fdNbW/0pM2YGzmDYcOVcEzyd/P6X0lnNdO95tgCF9V71PuK+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV2PR04MB11303.eurprd04.prod.outlook.com (2603:10a6:150:2a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 11:05:09 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 11:05:09 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Wed, 04 Feb 2026 19:06:16 +0800
Subject: [PATCH v2 1/3] dt-bindings: usb: introduce fsl,imx-dwc3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-1-d2c9b5a58c01@nxp.com>
References: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-0-d2c9b5a58c01@nxp.com>
In-Reply-To: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-0-d2c9b5a58c01@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770203208; l=5557;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=auV68yjMWqlMtK8HAl46mXe1Kt2D7VaAI1i9zCaMTq8=;
 b=mKzvxPaEVPK8vozNp5Ti2vYpr2EmW6UiQu8Z3BOCCkG+vqdhGb4+DH1dr1fdkm5Lwr5TFnc6Z
 x9Yzo/TaIm8DeI9Bm1peaV/jLE/X3oIL8mugc1bOvjt3WLD+snEuqmP
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
X-MS-Office365-Filtering-Correlation-Id: 1af6412d-cc63-4ed6-6eac-08de63dd42d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1pZWk40U3pYKzVjMTVPaFFIUnp6MTFXUzAzMzZlUnBzbkpndGR5TjBRZEpQ?=
 =?utf-8?B?ZVJtMUNncDlxQ3I0dCt4K0lRN3RtY0lTUEoxV0x0WVhzSG1menUva21EODJ6?=
 =?utf-8?B?STVZb3RkbURwbnhoWUJNTkN2c2dGSng2WmJEYW5MM1JGUEc5QmlHSFJHL0hl?=
 =?utf-8?B?ZGdHWUlnU2FVYys5TXVtN3ZXaDFOUHh3dU01TDVlalQ4ZDRSVXpLVkxjZVNs?=
 =?utf-8?B?aWJIZlJiOS9CdGFadGM0bTNNa21UcHp3azR5UER3SERGWFlDWXcvRnRiVTdY?=
 =?utf-8?B?WDZIK1dVSHd2SjVlek5BNVdmdlNjcHI2WUc5RXRFM2JWMVMyV3hjbyt2NzdY?=
 =?utf-8?B?cnBYTVJyM0JHWXdFT2RIeDdQbTJqNEpzdXVRV2F5QXdaNFlCVXNXallaRDA1?=
 =?utf-8?B?aFp1K253ZWhvSmZGZHFwL3poQU5sMXFrM29CbjY4bEZiRmI4M1VCWEhtRC9q?=
 =?utf-8?B?blpPc3BmTVB2U3ZlT0xKMjUwUmhHZDhKNDlvSmxRQnRRNHVWMm1jZjlrL1NQ?=
 =?utf-8?B?MHQ1OUFYYlF1dlBGYlZFTjNJak9JUThuTklXdDVLcXZZMWRPbm93dm5jM3Ez?=
 =?utf-8?B?cWYzN1Z4TFU0L1hGOURVOEdHeExBWWRjMjZTTzJQNTdpaXRLV21mODRGN240?=
 =?utf-8?B?b3RuRHl6Z1Z4STNXL211L1pkb3doYUhDemFPVU9sRldoOHIvZy8yYWE1Z1VC?=
 =?utf-8?B?Z0FKcDZHTnlVNG1TaWlpcTBTc2xCd05IVk5IRVFOWTZtVk5BRzU3NmJQbDBq?=
 =?utf-8?B?cFdYemo5dzJjMVg3YmFVckQ3K0NtNDRFMVhJVWhGcGVLcGxnVTlIaS9PK2Z1?=
 =?utf-8?B?VGthLzJxdExLaVg4Y1c2NlZqS05UR1hEajlrSUZMMnZmNklIcjQ2RGJmR3Mz?=
 =?utf-8?B?Y0hlSnV5Tnh5Ukd0cDNrVHo3RVFTQ3ljM2JSaXhFU2xyWGpkZnpGNml5M1d5?=
 =?utf-8?B?Z3lDZXJTWXlLcmo2Q0N1bHhFK1dUR1hiUlQvTFk0TE9XUDUxbXVDZHl3bEV5?=
 =?utf-8?B?Mkc4UWt2VXRXcks4T1ZXaGxlYXFxbEJoUW1YVWdZM1NnS0JxeW9rVG5YRVNH?=
 =?utf-8?B?QkQwbWdnUUtmaWdiakFkWUV1c2RRMENlU1kwb0tGcDlrZkNjalExV0VuUlFX?=
 =?utf-8?B?UmlBUFpHOCtZRnpYeEQyR2tETXc1RXhoQXkvMXlzUEYrQ0NDeG5BSmN0Q2xo?=
 =?utf-8?B?SU5GeHMrdWlPRVM5ak1xWDRJTXVZOStML0M0cm8zVkZ2bncwKy9qR0dPRXE0?=
 =?utf-8?B?WERqQVBNQTBUaGFRT2NlUGZjN3FEeTFrVXo0RHhmKzNrKzQ2Zm9xWFJrdVZr?=
 =?utf-8?B?cjk4eFAxYXZzaHBYQzRhdFN4OWZYc3JxSEtwQStOTjZHeGVaYi94WWMxN1Ni?=
 =?utf-8?B?UDEyQW05TTk4dFZhVy9yOWh6Ukd1R1ZxUUJZeUJHRHJpRFIvbzhsUWRhNkRO?=
 =?utf-8?B?L1ZzeS8zOXhTbFdaemtybDlUbkt4YjNFL3dTSWpCNndWK2NSbzFNVUJZWlNP?=
 =?utf-8?B?N1c3NHozZ29CR1FpamJBaTN2ZklaOXlnK0NLVUw4R1ZwdzVnaC9WeTVuUlE5?=
 =?utf-8?B?bTR6S0Fndi9adzVmS0Y0M1RIZlVsNnpldVFnL3lpUzdZMXZDcnpzeDlTSE9Q?=
 =?utf-8?B?ZlpxTGlvRit2bkQzSWllNk5wcWxKbGpWSG1VNmVVS2NKTjYwaEpVVjUrZXA5?=
 =?utf-8?B?N1FkZHErdTdvTVgweC9Jc1FLVG91VUIrTFB3WEdIWG00a1g1ZlVRNHc0Mlho?=
 =?utf-8?B?RjZabVV3a3c0NWFVWXhGWXJGL3hTZWFac2pqN0JRQUgxNXpueVJpdG1OdDVy?=
 =?utf-8?B?c3VxMXY2Vyt6d3hONFc1Nk8zMGVVV3M0ZnQveUxZenZ1a24xOWFUNHA3ZFVY?=
 =?utf-8?B?VjV6VkdoK0sxNUVHMWcycENGM2ZvRDdYWGdTdnlTdyt6NTdqS0k1d3N0NUNV?=
 =?utf-8?B?RVV5K3NZVkJSc3dyRE9BTnUzOXdxd0IrTUpEdkwxRjluNUpqNHhxMWdrY01h?=
 =?utf-8?B?RytsNGJsR1FXdlk0clcyL3N5Q0ZFcC8ydG9COS81bGV4dS93NW95WHFWVjYx?=
 =?utf-8?B?MjNlSXZRd2x6dHdyNHRob3BGWXczRndlY3pLcUF3cG84dkV0SmRTN3Z4MUpj?=
 =?utf-8?B?MDViVTd2N0hhcDJGNk5PNk54MEVDUU1CZEhwUmQyS2NpT1JoNzd1Wk5VSnc0?=
 =?utf-8?B?T25XSTR1UWdyWU4rU0hLZm04ZnZWY2xiV3RtcCtyMlg1c2oxMnAwU3U2clZt?=
 =?utf-8?B?dVQ0bzEwRFZBOXk4S2ZhS0pHYnJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M05LeDdCbG4yRzltYVg5RWthOEVnSWgyTUpQSmljRzRteGIrSWljQ29Nek1v?=
 =?utf-8?B?TElrUU1PbkRPM1ZXOGVyTkh5eGlSeHdqaktiNFRYMHMxZTFGN2ZBL1RYa1o4?=
 =?utf-8?B?cUpDS0J1bXA4ZThjVGVaTjRFRnl5VW5VWmliL3ovalptTVdaQ1dPc09YZnVo?=
 =?utf-8?B?eXBBdW1YbGhzd0phcUpHUURaNjYzWEwvc29wQWFyZEtKNEZLdE42cy8vZFZh?=
 =?utf-8?B?cjRPZ3VjSmlOSnFSb3B0SEJTU0prb0hraWxhd1l4RHdCZVlpSW0xbzJYZC9s?=
 =?utf-8?B?Tm1vaU81S2o1TzJiM3diNGl1R0Q0SXZqdkFWcHAzajl4cEtjOEZjSWl2WWEz?=
 =?utf-8?B?NUs5dzYxTDVSOTQ3M0pNZndFV2N0Nk1FbzJxMERVdGZYWnhpSnJpSUpiYzlH?=
 =?utf-8?B?STJhaFJ4REhSTFc5VlhDZnZCSURuZVRpbThGTmlnQzEvSGVUaFJUQ3liNEJm?=
 =?utf-8?B?MHdvRi9KS29kNkk2RGRQRFRwOFB6Rkd5T0VEeFl1bUQybGptSENaa2JkZHA0?=
 =?utf-8?B?U0xkeko5dmQ5YWV6UHBqNzUwMU1yS2JmMTlMTnlPdURRbC9JTXdLb0QwLzl0?=
 =?utf-8?B?d1RDYzRvQ1QrME9PeXY1S1BSS2o1V3JUSHhxU1pDREd3NnhTRk1VL3BCMmsz?=
 =?utf-8?B?YzA3dE9jZE1RVXBZQzRjWUtPcjVnc1cycDdwTVFVaEUvL3JTa3BMRTJxQm1P?=
 =?utf-8?B?RTNQa1RpRVVJNmdyR1JWQWpKK0JnNVBmTFg1QmRLcy9LSkJDQkh0YTFnTkY2?=
 =?utf-8?B?cDdaV1VQczY4OXhSaTFZOG9laUNhdVlOcE1wMXE5YzBwRVlwbElSUVdtdnZ5?=
 =?utf-8?B?RGdqczVCcUJhRDc2MjU0UjI5aUVyNG5Wb0o0c3VHdjJSbU91dWorR3FQdUFT?=
 =?utf-8?B?bGc1dXFXY0lEaW9SYVZ4RnY2eTVxUHJ4b2t0UUowc3lhUkJMNEREWXhBbXdv?=
 =?utf-8?B?QWhFNmtyNHBkdGEzN1Bkbmt2S0cydVQ1RWNKdmpoZm9wZE1PTU1TS2IxTjBh?=
 =?utf-8?B?b2FiWVpFUDJjRWhYR0hBZHJUbzB3OHNpTHpEcUluLy9panRhdlRuc3djREJX?=
 =?utf-8?B?QVpjYlExN2VQb2huZGtyVVRYbC94bkJZVXBEczZCeUFsbUI5R1lCb2JKSlVx?=
 =?utf-8?B?V1gxcnZxcXJOSGhZYnJDNGtsc2hDbW5zdHVkQm42R1VJWWhQVmxsUzF0VXVa?=
 =?utf-8?B?NW9qL0lhdDdveVdiWUQyN092TFp1TlM5c285NER3MFQrU21qcXRYek5HcTRh?=
 =?utf-8?B?V0RDd0ZzRVhOOXNMQ01rbGU1RWQ3SDBRUTRNZ2hnUzhwbFBnMnUxTmdEcVIv?=
 =?utf-8?B?VUdicExsTkpaQXhXdUpQTCtOL2U4Z1dORktpMy9TcWtlTzZ4aTQvNmI2R0RH?=
 =?utf-8?B?dlFZN3BtTXZNSERXWWdXWmthdlNIQTRYOE96VmFaUGJyOWN2WU5ybkFsamVT?=
 =?utf-8?B?bUdYaWFYbFFmZ3VvNFdMbXJOTm13WFZTeksyVFVZNld6K0xMQjZaSnZvbVd3?=
 =?utf-8?B?UzVhazg1bGhSSzAySnczL3R2NFBRVGFXQ2J5NlFsM0J6VnI5Rlh0d0FlajBW?=
 =?utf-8?B?dVVsbVN1VWdrMHNrVVUxdXF5R3BIOUV5Y2tGcTNleHJCSEJUWVFFekMvdGFB?=
 =?utf-8?B?STNkMVI2NXFPUS9QZGIrNC9iRXEwS3BHUUlTeFJ4UW5UZFlZMG95cS9zOWJ6?=
 =?utf-8?B?WWo2YmV0MDJqa3BZSGhQTTVhemhpR0pYZmhkRDBNSDBQcHVTTllmaCtTSTh3?=
 =?utf-8?B?QVN2dkhXMXNzRk43NnhadW9MbDRMZVZKSmQ3bk4rUTJGTFhDWnBpd0JuUjNB?=
 =?utf-8?B?QUZCQ2xPd1AycURRbDVCNnNseERyRmtpNHRWM0QwVVArendjaWtUSDlKSWtR?=
 =?utf-8?B?OHh2MklYS0I5STRXWFQ3aENXZkR5WFFYcldOQUZML2VYQ2pxUUxDZTJzWjBl?=
 =?utf-8?B?QTUyZEZZWEhNWWM3Q0cyOGxOR0V1QWVBWEtCRkdBb2Ztd1JnNUlZVnRRa0Fw?=
 =?utf-8?B?M1ZOd2JudG1qUlQzTkRIU1VXSG9pWngzZXRXL0hFbU12Y3oxQ3BYM0ZGRklT?=
 =?utf-8?B?NGI1YjkvVDViRkIwbWJZV3REelBXNUREemEwRXRvNUdLdU0zSGNndnY2Y2k1?=
 =?utf-8?B?VEZLU1B6RzZsUzczZEh3Uy9jVEttSjgwMkR0YnB1R3hhVjlNUmdMYWc5dHI0?=
 =?utf-8?B?RmlwaHNnNzBRYlRPdmtZRWJqSkVLNXRMOXR3K0ZlWUJucEhNcFJ5VThXKzF0?=
 =?utf-8?B?MnNCY2UzSXgxaFFXRlJRS2QrRUN1T2NzblRqaHpvZkhpZUpUdnhMdUQvY1E2?=
 =?utf-8?B?eGg0WThLWVJNYzJnQjRWU3RmWHJtbFJPa1UraktxNU1FdWhoN0w2Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af6412d-cc63-4ed6-6eac-08de63dd42d5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 11:05:09.5485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWA7x40h8uXEUFo+KSDRTPZcvAzdUsEZzFf6MZK9tbm24OvCAbBOXuIp2YDFoOUmo1iV6fVLsfwfvXoucEwN9w==
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
	TAGGED_FROM(0.00)[bounces-33090-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,i.mx:url,nxp.com:email,nxp.com:dkim,nxp.com:mid,4c100000:email]
X-Rspamd-Queue-Id: 36036E4E3E
X-Rspamd-Action: no action

The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
USB block in a single block will bring more benefits than a parent-
child relation. The new binding is a copy of fsl,imx8mp-dwc3.yaml with
the needed modifications.

Add the common compatible string "fsl,imx-dwc3" to indicate that the
flattened module should be selected. This compatible is also used by
"select" to inform the DeviceTree validator to apply this binding.

To avoid redefining all the platform-specific compatibles, "select" is
used to tell the DeviceTree validator which binding to use solely on the
generic compatible.

Mark fsl,imx8mp-dwc3 deprecated, to favor expressing future platforms
using the new combined binding.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - reorder compatible property
---
 .../devicetree/bindings/usb/fsl,imx-dwc3.yaml      | 131 +++++++++++++++++++++
 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |  13 ++
 2 files changed, 144 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6932804516948bc0f8457553eee7e5ee704237f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2026 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/fsl,imx-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX Soc USB Controller
+
+maintainers:
+  - Xu Yang <xu.yang_2@nxp.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: fsl,imx-dwc3
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,imx8mp-dwc3
+          - fsl,imx94-dwc3
+          - fsl,imx95-dwc3
+      - const: fsl,imx-dwc3
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
+      compatible = "fsl,imx943-dwc3", "fsl,imx-dwc3";
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
+      status = "disabled";
+    };
diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
index 73e7a60a0060dee6417b9469251e121704b7a148..fd23c345149e0dba1ed3919a25195edf247cfc08 100644
--- a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
@@ -10,6 +10,19 @@ title: NXP iMX8MP Soc USB Controller
 maintainers:
   - Li Jun <jun.li@nxp.com>
 
+deprecated: true
+
+select:
+  properties:
+    compatible:
+      oneOf:
+        - items:
+            - const: fsl,imx95-dwc3
+            - const: fsl,imx8mp-dwc3
+        - const: fsl,imx8mp-dwc3
+  required:
+    - compatible
+
 properties:
   compatible:
     oneOf:

-- 
2.34.1


