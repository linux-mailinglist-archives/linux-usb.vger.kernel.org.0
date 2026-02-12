Return-Path: <linux-usb+bounces-33322-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNbeHBqgjWnv5QAAu9opvQ
	(envelope-from <linux-usb+bounces-33322-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 10:40:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAAE12BF47
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 10:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 033BC3061CF9
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 09:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE312E265A;
	Thu, 12 Feb 2026 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FjTFBPcr"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AC92DEA97;
	Thu, 12 Feb 2026 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889220; cv=fail; b=kP/8P8nx66XYan9Mt5htP6Q23ieM7lYHr18qc6d6gpVyFvwLKP8vd7acunYEe3aUINUv6CQnSSHXUC2emppXfSrtPe2TBZCBI7d9FiaVuBsUNC2X1IhyfgEh62NxwFOypen/qqjzEY9uA4fz+EEGIuHC1PRppdUEMVj2wxFZgy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889220; c=relaxed/simple;
	bh=7fEGLRNxHNv6f701JZWYzfAOY3jPbneCktoTxZNvwXo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aENKzy41Kc/R2mocANIKvlscJnrgih4OFQFQAOAdOHbK83hmHaS9C/Njqx/eRiYEKN7K3sz+QDNeHuXhCsnJQO5hxwUSAejeC+WLn2pnHIkUr+VJeR4HXuQdYHqfydRZZ1BmSO3vBO+btuF7ei6qfRdima9//NCf1o1s8m7cQW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FjTFBPcr; arc=fail smtp.client-ip=52.101.66.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eld3E4QwUAmDWpOVV0wH8Bh9HsYTDpLxSvPwvdH5XttMMTQYTDr6X/Pmc6cbuq9v02BiCYPWQaViYrNmLwj8LaKNdH2a4ap2ylVQ4mTD2QEQQyd++Zcrvuo1Hg1LAdc34njoGlr02gWLL7+zeiNUdSRLl3ooMNEJHHH81sy8Ek71EPX/yfTONAjQd2fZ+STf9smEKZTPPvXiCl4tUNv741yy9VlHM3YEJt1H+3lvPGyHMJvfRdnDiGWeG6Wa2SPl/A7cd9PCUN/kjhnJL5levtsb6USjAyDjVvGfdKegBBNZeEuvLhC1yLNtOxLmxktDxcZOh0QDH20KprbtCl04uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icbhF5HT3XkdQQmQ+guRhC1ur4hBDXMl9Euzu62pP8k=;
 b=Gtd1q2uwmTipxCVfF4/4ONfOjPWFG25SVtKym7HPmomhWGB5OVn/14gO75nwyXUFJiqmEWdSkwpwY4BKATHhW3KTsoI9gr9TepMjtXE6bBj5yV/2yQgje+iGyeNjhkZwYjlTJlRhMYKmbLbI54BbsQI1LuxcTVVNwqxlub0FQRtmpDoTxj0P9f1X+P1dRBD/G7wTRMtCs9a2OGqHYr97IYGPgtQBrREOYX/L7RORFh4ZsGmQgeaOmb/ZSFzUdByubnnkYhD61Occ9Qcg4m1C2YMTYA+wfX0T0e4VYYp/DUE/+j8y6ZquC9N2rJV+lDH+/1epvxuVKqngbUj7++uAGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icbhF5HT3XkdQQmQ+guRhC1ur4hBDXMl9Euzu62pP8k=;
 b=FjTFBPcrSurIZDh2WV+PboqGpRT4Ro43qa9Sk+gbIQuTXUfgdC+XUdjc87fE9WKDZHy296cFPjuIhJrqLimd3oHE1dcxWKMaHBG3Z+uXvnriMqVdthJR6YIqphy85ULpE71W9hnOfqOt+VkltyLyj5vcIXLIb43I4RTD+42/V8etpagbIG435m9lAlUcyA/TTT2ZPyWJxvGrP3y1MJkcwIyeul4CzrwLmAY6npMWNXq5RxsGsX9xml1BsKF5apTQL1GBCF15C6YXKq8b+eMwjleE8YnL/kzJ/Nt1mPcaZq13PB26uGuxoSXUVDIK+Z0y9lAKJHKqAoi4nVMIIcPMfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GVXPR04MB11667.eurprd04.prod.outlook.com (2603:10a6:150:2c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 09:39:00 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 09:39:00 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Thu, 12 Feb 2026 17:40:26 +0800
Subject: [PATCH v5 1/3] dt-bindings: usb: introduce nxp,imx-dwc3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-add-flatten-dts-based-dwc3-imx-driver-v5-1-ff04a75ce221@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770889241; l=4989;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=7fEGLRNxHNv6f701JZWYzfAOY3jPbneCktoTxZNvwXo=;
 b=MGXlTJWfX/JmhBphdk6J0ofKOgd8TiWbJWp2RBnZGIt49pIJj+td5uaIcoJzKADFx6i5zpqob
 mbApNuqUb6aBWpiV0zWmSPuqxJhTsGQtydvFG/LRbLOIji2p9ZgQ8Sj
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
X-MS-Office365-Filtering-Correlation-Id: cf8eaad0-235b-42e4-4640-08de6a1a8d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alkrT1VNV2FGanBEalJRN2NHZEQycVNTTXZCakJCMGhaSlh0b2xSUEFyL2Nj?=
 =?utf-8?B?M2dOYkFjVDdVaUtpVEkvVmFPMk5OYklINCthdnc1bGRPZ0tvZDN6b0VTekFO?=
 =?utf-8?B?VmYySmlZYjR5djBhVURJSjM0U3BuRjM0L0g1OVAxL1poYnY4RVc3QkZqUnhw?=
 =?utf-8?B?VS8vL3VKNkM4d1hKSldMeVNEZVpWZmZCRXpGem5IMTdyRlNONEJ1YlJVWUhi?=
 =?utf-8?B?SW5WZ0JJK0tudWdBQ1BzUHRCaFp1cnBPSHR6QlFRZ0Njcy9YY0pyYjh1MHF1?=
 =?utf-8?B?bmxGeW5PVVplMUxJeFhxQmNlU2ZlODFjRThQem9uYXFZcVlZM3VWcFpzYWt2?=
 =?utf-8?B?Tmk3VDJoWldGZllXUUpORGxXNjI1WU5QcHhrZ2F5S3pkYjFBTG81Z2lNUWdZ?=
 =?utf-8?B?K053K25DYUdXcytSdDB0Y2liK2xRbThvRUd3QlluUitjTTV4UjJsdVlJbHYx?=
 =?utf-8?B?ckFUbE03UDVGOFc3cXk0WWdmRVZkMWcvZGxLcmZkZjBYTGg4L3BGY2FZYjhr?=
 =?utf-8?B?VmtibXlKMXhTL3FXZ1h0QjAxWjVNMHdFaXJjMUZhNHVkdHRTUEV2QjJKTTZm?=
 =?utf-8?B?ZUViMjZrRlBYMmZiODlFSU1XODB1b1VUUzM1NGkvaEgxcXdrck1zVG4zY2hX?=
 =?utf-8?B?eTJtbjZVRUt2RGN0TTlmL0E2YTdrQ3grS29zYUg1MUxKeDB1QUNoTEl1a1BY?=
 =?utf-8?B?MEplcHVGdlBrdlZQRFdVdjgwQlU4ejhJdGVDM0hhR1FCRFN0akY5WVFJdWNF?=
 =?utf-8?B?WkxMMTdvVVFRM09Dd3ZJQzJXNE85ejIxa29IcGxpVldJL1lJdUFnVlFNUXpS?=
 =?utf-8?B?S3hvRlAxd21qYUhrL1d2YXdRelliL082NlV2ZG5Ed0x5QkVGM2EreWhMMWNw?=
 =?utf-8?B?QnZ6L3g5TDMzVjNEV2UwczBnMVpiOWxQMnNNRmJpQ0VGZnk2R2RNT0JiUmsw?=
 =?utf-8?B?VHRMYWVDZzZEYm1YQlR1SndOWVhMVFE5SlEyY3pGdUNZK2xKODZJWm9sQm9h?=
 =?utf-8?B?UzE2a1JpRWNkRFJTZnJGZE02UHdrcUU3T2xXLzJkN3NmQVNQNGRDRlFycXVq?=
 =?utf-8?B?QXZoUHNlS25ldVdSeXRoV3FWSGdHRzBZbW8zeitwVmZnQ2ZmWU40M2w0eFRB?=
 =?utf-8?B?ZmV1Z24xNnR4R1d5ekRCZERQd2lhTUxSclBnVzROVStIUDdxa1k1MmZxb1Vv?=
 =?utf-8?B?YXpkbDg5VzJZMHZRZFlSRElBZFZxdnlRZmJ1amhMV2hNQzRUUFpRY0RvZ3V0?=
 =?utf-8?B?SjFaVFFScE53NUVBVFpodmZGVFNVbmcrOXFxYlVOV1FEcURLTnA5aW5zc2Nj?=
 =?utf-8?B?SmsxRjZqVlEreUU4Y2x6b2JVa3AxQXkwQitZbzlGa3NqN3pnamwzRkFldWw2?=
 =?utf-8?B?ZUc0bDhnZUgxeGpkZGNzYTNsOWlFMHZYdFkyUU8rSWVzb3NpK24zdm4yay9R?=
 =?utf-8?B?Z0s3b3h1S1J6d2ZsbjJyNC9FaHlTM0RFZlpRc0YzRHBIREMwQUxJcHdsd1hy?=
 =?utf-8?B?TUFxNXFWWFR5VEZOVFZNWFN3WFRkNGxtRnZlQVlka0FYWUJsSGVQRWtJSFly?=
 =?utf-8?B?Q0J4MlpvSHpDR0xQRmtrLzZ1UmwvYkJqTW81NDBKTTBYMFBsMm0xL1hVWmdP?=
 =?utf-8?B?SXF4WjgzK01tcUhnZkRSYk9zK3ExeW9IUFVGMi82dkhWYlp3b1RWR200THhx?=
 =?utf-8?B?ZzNmbmxES3B1WGkrN0xXdWE0VDN6Z1RFSG15YStOamNiTzEyQTUyN3Q2ekdM?=
 =?utf-8?B?MHFhdjBXUHZnSUd1Q0N1dGF6L1NwcitrelYwRUlaUTRtb0cwQkxITEZ1eno4?=
 =?utf-8?B?WUtYcmFSTFJhblNqYng4WXYwdk12eUYvYTRPSnkrTHhvd3Q2N2svTDF1SkNX?=
 =?utf-8?B?cDEzbDZMbm81SUp6ckZyd2RqeVEvN3dyOHdzSGJDNjRBNUpnYStnNHdjTGFa?=
 =?utf-8?B?a1V4V1hwV3d3VmN4KzMyTGI1K2kyc3FoZVduZzVJUEJ2OUNLVDNBSHNjZDFE?=
 =?utf-8?B?b3JDSm5YUmZZYUlDNk96UmhTSmo4bU9SRTZXQVhPV1k0SEk1NWx4OHJ6RGFR?=
 =?utf-8?B?d21OUVJjOExUT2FURHMvLzBvZWNIMVNqZ1VOOWVIN0l0M0s5UkNYMEpveExt?=
 =?utf-8?B?eXdmQk13Mk81NVN5S0t6bzdGekpGMGkxRFVnVFhGZTFiWWt4b3RhS0pOWXZF?=
 =?utf-8?Q?/MV3M2q0cLo/X0Cw0QDcfWlj7mqELqK/1Q++BkDP4nKh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVdaZGlKMVY2YnFxeHh1NlZQVWVMT1VEU2JXZGFZSVZwZ2xJeFBxYzNnaVcy?=
 =?utf-8?B?YlE5MFV0cjBhU0tQamhHSVg0djJYSzRWUTBEYUk4dVBGVXZ5Ny8wWjVxZGlP?=
 =?utf-8?B?T015SHhwYlh2V2s1NlQ1S2NiZU9QWm95MVZsa3gzWFFWWlZDLzlHeDZHajgx?=
 =?utf-8?B?K3U0d2hDTUo4enZUTUFIR1EyclNrQ08zS1JoN3Rqd1AySCtic0J2ejhQTndC?=
 =?utf-8?B?SmpkK0Y4SGJYNml4c3A1R1N6SXRuNG91cUI5YTQ2UVo1TmsyUERoQU9RcWY5?=
 =?utf-8?B?QXJvcS9Td0ErVU9mTXhrcjdnWkk2RncrQkxxK0MreCt4RE54QnZZMzlUYmlD?=
 =?utf-8?B?UlllcUdkVFNpekNjYVU2dVFZMFNHbzJwKzZqOUJISys5NE96aXRtK2poVngy?=
 =?utf-8?B?dTBTUFpFa0F4VWIxa0treHEyQ0xFV1JnQ1J3ZUtoV2RUM2gwYVJoNy9PQldW?=
 =?utf-8?B?VWtZUWtwRjlVS0dQOUhIOVQvaUlkSThNN3c5dDlmZEJqQW85a0hrWXBCMkhk?=
 =?utf-8?B?cHo5djdTSFB6YmdzUDRpZXprZmFkK0l6bWxpREdKYWY0V2Z5VTVaVjJxQmxx?=
 =?utf-8?B?cG1QOW5zNVZHVHcvZ1RwaW1GRGxvQVI4ck5jS2dWVXVON3MvWVhiTktFYnFW?=
 =?utf-8?B?T3Z6ODBrdDFjSmkxRzJlM2pUYmJDeTR6dWZoTTlmZUFkd0lXdjFpaHVaNi9W?=
 =?utf-8?B?aHJuanYyUFZhK25YQ1pJSXI2TVZXdGxqRXBOcXJocUZMOEdxU3pzSERjbzY3?=
 =?utf-8?B?OEl0UVZrU0RMUXdLSTF4b0dlN2xGUG53eUptdHdaeHMxMElwZXc4UHRSYWhy?=
 =?utf-8?B?aXdTQy92NE53YURwakUvTWNnTnVKTG5YdUxNZ3FSVnNvaGV6RCtzVXVQbHU3?=
 =?utf-8?B?MFBpNDZHUXd2YU5UYzUydVRrb0NDYzVuUkpTSzdnd3d3YUpCTlk2V3d4K0pm?=
 =?utf-8?B?MGpqN0l5VkFkYTdmYjdpaHZseVVKY0RUa0R0YjBHTFZVTUY2Q09MeElhN1pW?=
 =?utf-8?B?MnBEbVBIVHhUajIxaXVhcGZKZktDcUhJOEVZY3NhNDkzQlgra3lVOHB3dk5H?=
 =?utf-8?B?d21pTlh0NFVKNUNEdVp0LzBleERZOGNFUDN3QmtIaTRXLzZ0bTJHMG5CNmVU?=
 =?utf-8?B?VTdraU5pTHVoeE5sQlYxZ2JCckIrazhTamt1YTFuN0JraEc4QXh1MWlpV1ZD?=
 =?utf-8?B?QVV1eDFTRU1ZRnI1SktBV1lBRTJCY0crUjEwV2lNUGZuMzJ3am9pN2RQN25R?=
 =?utf-8?B?aURUQkZUcUVTa2pZYlZTdk5UL3RWRGw0dTZqUjJMUWx2MXJweW5oSlFMaFU4?=
 =?utf-8?B?ZEZXV28wbHYwSSt4RXkwaGpna1JLR0Uwa0MyZ1oyRDJPNy9DNVNiNjBmM2VV?=
 =?utf-8?B?b2MrSHFZNSszd0tqOS9zam1HMFMrZTZCQWtnbW5iUmRndXZWd05JYUVaWE5U?=
 =?utf-8?B?MFFMb1dpTmpVUEJPTTBNMUd4T2hqUFF2QTR4eGNBeHhzNTViRXJOb3o4bnFF?=
 =?utf-8?B?eGEzSWV4WUhkeHpZcXBzVUpValBWNjJBbmROdVE4UVRHS05ST3NPenlKUktX?=
 =?utf-8?B?Wk9DOVM0TngzMkhKclVBZWdhNVM3bERwQWVaODJZVnlwczR4dnA2T3lPMEN4?=
 =?utf-8?B?cXVHYWNTWWtHd1YvcW8zblVQWXdhVy9HRVVCeEYrM015ZGROaS8zbFZPdkNk?=
 =?utf-8?B?RFUzYXBRQ2FycG1NSGFiNTE0N1lsMUR0SzE5U2hQOFpCUGxqY0V5OFlBY09S?=
 =?utf-8?B?SW0zdlcyOU1pbzJiTW1vaEVCUXF4MnJKT3daYzdMWTF0a1BPeTdaWnBTbjJR?=
 =?utf-8?B?UVZYL1NCVzNjakk0d01TWFluWHVpbU9IVUF4bHYyYlJ0T0ZsMU01eFVjdUZL?=
 =?utf-8?B?UUJhMzF3Rk9KMzR0YWYxVlBzV3hPWXVYNElqNE81Mkg0bVZHcmdwbnFmOFk2?=
 =?utf-8?B?S3BHMzFqamFBYmgyTUVLQ3MzRU5BcEU5NUtXU0hzeW9rMDIvTm0rZDJmUmpF?=
 =?utf-8?B?R1M3NjUyUDRHOUEzM3ZlTkdpSXVCOG5ETVB5Wm9KYmJVUStDUTZIQ1lnbDFU?=
 =?utf-8?B?WnZoZmdLRjNzbWlNUWdleFZQaE5FSzQwTEYvWDJrWDJ4dEpPQVppVFd0bms0?=
 =?utf-8?B?a21nRTlWTXp1Q3ExV1RmamxTM0V4M1JRUnlVM1o4SE9LOVlxd2R5M3Fqc2VL?=
 =?utf-8?B?VHlOS2ZJN0wvMTliMzNEWkE4MWtsRmNIN285czcxdDFjZjBpTGliTGNQMkd5?=
 =?utf-8?B?UE9SWjZqTGFFaVNVS20rby9wZ0RNL2lQK2kyQitEN2dSTHl2c21OeU9qQUQx?=
 =?utf-8?B?cmM5K1Z4ajJISXB2MElKTzUxYUNkUStPQWtiZ0QrR1l5eUI4VElBdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8eaad0-235b-42e4-4640-08de6a1a8d3e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 09:39:00.7288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vC/cnAL0PDyNRKfhdGj+f+g+vyfOvcKNsTpmwn+Wt5aiCvofUDBxqIwBy3NNBf+rEEpw2DLPAJ+N5SXyX43Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11667
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33322-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,i.mx:url,nxp.com:mid,nxp.com:dkim,nxp.com:email,devicetree.org:url]
X-Rspamd-Queue-Id: DEAAE12BF47
X-Rspamd-Action: no action

The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
USB block in a single block will bring more benefits than a parent-child
relation. The new binding is used to describe flattened usb controller
node. It's a copy of the legacy binding fsl,imx8mp-dwc3.yaml with the
needed modifications.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
Changes in v5:
 - no changes
Changes in v4:
 - add R-b tag
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


