Return-Path: <linux-usb+bounces-33313-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GrVEP+QjWl54QAAu9opvQ
	(envelope-from <linux-usb+bounces-33313-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 09:36:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDD812B62A
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 09:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99AB8316397D
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 08:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3A02D6401;
	Thu, 12 Feb 2026 08:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PCxwCNE/"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8AB2DC774;
	Thu, 12 Feb 2026 08:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885243; cv=fail; b=OretGGbE7RUsFRUz3dfrCUQp9OXFlprr6Yn53L5XNlQc8WIn1ooRHlrxOmrRFY2euBhpA3EI7yZnnlX41R251mlE6XMF5kqoodNCEz7Rd9KqddmasxkOdBff10E+bLHQkM9PHccvANV40Rq7wgprulD4PTgLDDewPEDYclk/liM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885243; c=relaxed/simple;
	bh=z23jomANHk4ffcZAVLq21OOXEAvY8b1/ZnmXeZx9ru0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GWiQcXBDsp3hqrYMXH1CydoJOTybyGjwtF8oZTe4dciZlUXmfEf/NmQt6Qh6p1QpNkpxLl4irKb5IjAZ/yJb4YznkBBWusTqoh+jpjnYrCNxLBRrOy5kpVYCkyyVcj0IGYGZ2JRa4L/yR8Gm9FDIUL0deXvJdAavoeNVBrGU9Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PCxwCNE/; arc=fail smtp.client-ip=40.107.159.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHMw2x2AGZ2uHp6zTELoGlBpvrMEPfwEkyOSv+eCHA2YdWMYRyhhHlcO0bgLi8gciIPx44Jx1sViQr4pJ45OHjCOk/e2pahudE0GgG+Hv5Iktl+AYJ5+BHVRbGUDx758affP/o49wElfKu12laPOa8E5XbrayxkS+aYKw0RKQTOKRAuVLPzKo1am3XaE6Bd25EFj751syu9lI6jxTJvLQAIy4Lj1zWfpjctLf8TaY/c8DWD5TxgNEQZtC1LTuGRKxpBPAwOj0SZDUJtXZe+pEgjsbBdh7riHUpUmzwaqImIyaV4AJkrte8ftbmxcJGr2TEPJOOngklnoj+uqNJaVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLEBl7NGfPoWtr2SfO7vpn3PvQE4gjKm/4Zg8sSaAQ0=;
 b=egJSYO0iplcfYWRZ5+x9IYBc+hyNudPpG7Xg4HXZJg79FucSf0gG5eiOPCgVxgR6vBsqyRYYdQXMWXVIeJVULy1COemWXduFZ85CV+I77kwJ8P3RetaavSEv6ZxwYZza6BxaGaLhMvUApSjcSPTpRj74ebWO6WZng5ag31rAOaSqzUsxRQYmgK0HdT2/cyXvAFsa/PqD8M6eJ0RPibGKrwqN9j92MKyiP3zyq2kKs3sFSCs0bNr93YQuGJpEgVEHXv6R0Lu4jnZsR65I2th6IHu1++yFT48pmjMk052QvLWaP7YMtY+YTK2QL3D0MIIO1HG+Zgu3X0ig2ToOI1ZKMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLEBl7NGfPoWtr2SfO7vpn3PvQE4gjKm/4Zg8sSaAQ0=;
 b=PCxwCNE/EOPVbzu2IYtML/gdJXYMlydv+c/JOx1uXQkXH86Xp6Nbn8yUcbNbiBEJc7gRw/th2Wa9RuygSIxZmkfl/eIVvQFaWpWRuBxxRsNECkW5rhtCE5eqtE0CXotBmNYlXnVcHlE6v9qsBaBmEXx2HrKZFVmUMe2RxLmgiQ4rDKkLbfOA0XaWzAvRChMPXDhHfNzn8dm5lsvSpJ9RBlZ/jenDl5K00zJdlVtTMYPdT648Fc7eBnlRFBBGUWIbQT/IgRW71n9Mk3VN1K2zI3r/I8JRYEarPVjC9rRX8VrMk6Xy8C/zZeaEpl6Mm9vdl3CJ4HY+l5blWHk+hknh+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV2PR04MB12269.eurprd04.prod.outlook.com (2603:10a6:150:329::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 08:33:53 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 08:33:53 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Thu, 12 Feb 2026 16:35:03 +0800
Subject: [PATCH v4 1/3] dt-bindings: usb: introduce nxp,imx-dwc3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-1-08c10b08ebb6@nxp.com>
References: <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-0-08c10b08ebb6@nxp.com>
In-Reply-To: <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-0-08c10b08ebb6@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770885336; l=4958;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=z23jomANHk4ffcZAVLq21OOXEAvY8b1/ZnmXeZx9ru0=;
 b=JtBG9OHpg/DxOv3f1RpBmIdy76fC+p+RlpwnwHS9RN3f0VxCw669WFTJ1S2leZP/2ztoBt6Hu
 I5xNe8Fc7UBC8GowoMGCGMqxeIVIA7AMG6yrX8s8xTRPNzWyzxOOuca
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GV2PR04MB12269:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b80bd5-dbfd-4953-2e7a-08de6a11741b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1M1emJ4WWxSdWFFeVlrblRTVHhXRTVRWnh0ejFXdWhUOFFQR2dIakRSSFV4?=
 =?utf-8?B?NUgvZUF2TkkySEU1QzF0bFpnSnRpKys5ZzFHRTFOWk1FRStVNElXSjY1UEpP?=
 =?utf-8?B?M1N5NURyeEhPVmpZd0N3cDBWY3VmOXZBUnpYZldBYlNvNzg5YXFBRVRIUXZS?=
 =?utf-8?B?Mm9POEw4bEpLWG9vYVBnZG41ZE9vWXlvZS9wTktmQzFRbUx2ekU1Q0tsVFNW?=
 =?utf-8?B?T1JqWElnZi9sNzF3T3ZyVWdDU2pYZnFITnVERVA5ZmVzTWdXWHZvbklWMk9T?=
 =?utf-8?B?K3h0MDRYK2hjTVhKYklwLzNFeUFnNGNTMS9tZVBHVEJFQm50QmUvNUF5OW5K?=
 =?utf-8?B?Qkd4VnZRbkYwZWVvV2E4WGlVSzdSbDVjdk5DcnpVYWVwL1k0TlREdlE4MjF5?=
 =?utf-8?B?TEM3QWErOWxIZ3pFWlk4VnMyZWgzMFFjekFJV2U3WW1FdDlRaGtoQ0RDMGEr?=
 =?utf-8?B?Mm9XcnNIQ01rK3ZhTEVUM3JNNzFDdTB0KzFnQ21OM1IxSXUwbE5TZDRpS0Np?=
 =?utf-8?B?VFZUWlBUK05LOU5oUlcwWXFWZTZEZ0lERHZOQTR6dHpBZDFNUmZuQ2h2Tmlj?=
 =?utf-8?B?K1h2VHRiYWFBZEFTN2N3WkkxOGZ0SDU3SUZsU3hJZC9ESFRoOURPWXdwbGRK?=
 =?utf-8?B?VExBZ2Fsa3ZDenJDcmRxUVNxcnkrWVZ4ZWVNbC8xaWRCZDRIbXpOL2FTY2pk?=
 =?utf-8?B?Vml6cTQxWEJuVjNrM3ppLzhoTDYzSUwzU3BqdEkzVExUNmhjTmdlVVpWZTVT?=
 =?utf-8?B?WXhtVU5rcDRkMHphQ28yWEdKdFVGQnFMMXNuS2FNRUZDUlJqV1Rycno0bDk1?=
 =?utf-8?B?QnFoU2c0RG9DcDZHOXNFY1YrR3ZCbkJ2am1Bc0cvbXN4b0RzWkU0TlA5cDNM?=
 =?utf-8?B?NEkxazBZWHlvdm9pRnRvRk53Sk0zblF2ZkZUOFFtVTRsUkxvemhoenlQNkIy?=
 =?utf-8?B?M2JmbEdDSVRxVVJZZENNbVBNYzhibVZQZjlBWUo1K3R6MTRJaFI0WXVlUEg4?=
 =?utf-8?B?V3AxbnpvYjREY1JVeUVUU2RaTXNrdDJHdzhBbnNQN3NjVkRHdWJJSlVPZXZJ?=
 =?utf-8?B?cHJSeXdmTllMSSt3TWJSRnNTaGRzMmdlRHIvZU9rUE5uMzdWaGlYd3JTWFFi?=
 =?utf-8?B?dWRuWjJEOTlvQll3QkhHY2x4UnFWQnc3VGJmZzVuNnN1ZXorK3V6ekJMNFpn?=
 =?utf-8?B?S3RLQWMxVlBuMFpmRXBLUWhLRXNjNGgrckNRc3V1cDJlUE1yaGpacElEOC9V?=
 =?utf-8?B?RFNFSEtReTlTMzhUV1VPWTNFUEphUVpMUXdFV2NLZmV5dUMzOXpkSWFUUFRi?=
 =?utf-8?B?TXdsSThOamFiNE5FTjNPNmxTeFhpMDRwRTM4VjZ0cmhlUHkwWnk4dldyZU9E?=
 =?utf-8?B?VmM2QWZ1ek5ZdkR4MWFuSFcvakhyOUV5NUNGbWwwWkJ5UGRuS2J3YzZ5QXRQ?=
 =?utf-8?B?WVBBd0FPMVY5c2VmcFFiaXR3a0FDb1FMSTBHKzNkSTJ3QmJMMTFYTDdWOW9U?=
 =?utf-8?B?Ti9YbWZvL0RNcDlaZmwvbG9RSGpQUUlKUGdCY1EzbmErUmlDUXBPV3FzV3pa?=
 =?utf-8?B?QkthL2dSdE9PeWtyQ0NJNmVwSUNVVXBqcVIzTVVybUp2WDM3eG5UZXpDeXps?=
 =?utf-8?B?TjBGRVlKTDRRak1uSURHUjdZb1pkejI4VlUreUx1NmM4OWR0MEYwb3BYSUFs?=
 =?utf-8?B?WFlJTEx2Rkxjd05QV0hzUmhabGVuZ2k2UHFZL0pDT1R2K3E0dWc0U0dnMll4?=
 =?utf-8?B?RS9TbDN1WHhEQmphT3UyMlg5ZTJCcXBUZFo1K0tENXlsQTVjcUMxQXpMbGxu?=
 =?utf-8?B?V0hrQ0syTjVhVDc1OUNWWmVkdWRRVDUrYVljeTAxdFdQOFpsZUFwcjRjaFBm?=
 =?utf-8?B?bTJvOUNPZGV5Z0REMnR3bUxIWU95RHJTaGJGWnduYzFuVVdpMkNhdXBtZ1Ru?=
 =?utf-8?B?SE0yWlF4UFVVUHNsbENZVXFOc3J5WUtLaDYrdGMrSVI4eGZUajFpdWRrSkdr?=
 =?utf-8?B?cGg1clhXUUM1dVh5SEVxOXBFVTZ0dzhBMEErZ2NkSnBSVTYwWWYxTk1kYmVG?=
 =?utf-8?B?Z1pTWGxaNktxb21jaEllRUNUdzV6a1h1MUJaSkd4dlkxZUF3djN6akFSdSsx?=
 =?utf-8?B?WnZSZ2hZaTRyWU5CSGE5NE45UDBQN0U1THg3M0VJOXNQZ0lNa2tDNVYxM1h5?=
 =?utf-8?B?RUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUNMLzFGUzlwa04vZ2I2c3JNbWw1UTJjY2lRUUc2dDJLT0N6TVAwUXBYbkNN?=
 =?utf-8?B?OUtsbVBrUkFMMDRkbmMvbHhWU1Zmak5uNkxLNGdVNUhJcEErNUFlL0QwNmhw?=
 =?utf-8?B?K1U0cFl6RjBsYk5FNFFMNmMwdVphME91VVJ3bGxiMjVYQ1V0MGhFSVN1dU1Y?=
 =?utf-8?B?M1lsSUs1NU9lTEJWd2RzZU5yM1VpUFJsZXFpdGUwVWhndDRtU0dGcFIwc3Q1?=
 =?utf-8?B?Y3FzWWV6cTZUaHp3cHVZditORGdTUUtiaGNHTThPbnZCSDFOWlhDZFR4SGlQ?=
 =?utf-8?B?SzlrT0xQc3V1ejRWQkRtMkFNRjhkQUJvQjYwR2FRZVdSVlVWNXBFdGdmcXhH?=
 =?utf-8?B?S3hoRS95Y1RUYVRmRTVJMzRrZzdOUHlYV2xXS1RBd3JDWHpyNWxKRFRRMm1P?=
 =?utf-8?B?dHNhQ3VWMStlbUp1UWZaSTAwdFdKNkdITW5GbmJteXJ6M29HeVZsQlNyRS9q?=
 =?utf-8?B?WTZxcUxHVlE1NmNZL0NFQXpwT3VlVlVvTGQ2WlFtQ1lpZG5pY0pndEVvYW5B?=
 =?utf-8?B?dk10QVI5aEtla2JxbDJqVy8wb0doVUd3dHcrTU5QY0lyUVFDamdjTmVUSEpH?=
 =?utf-8?B?Wjk2dk5NTTlRQzMxeVI1SmVYVmlvVWVTM2R0L1dxbGY2Y3ozeDNiSVpyMnJJ?=
 =?utf-8?B?L1hxbWNCMytsSXk0a0VTOWF2SkU3d2w1bU5UWkNjbjZjc28yTVpQUFQxQkxl?=
 =?utf-8?B?Vk9RSXRnUFlpT05TZVhzeWhwWFp4OU9FRk83ZzRXOUVBcVBWS0NFNE9sZUtN?=
 =?utf-8?B?cGFWb0FIK1daNWg4dDVPU2x1ZTdyU1Z0U3lHdDhMTEZQbkt0Tjd3emk2T09F?=
 =?utf-8?B?dFp5S3BZRGtVeC9DMDY0eDA2a3pTWkIvWVlhUHl0bFBzaDRFWEV1bkI4ajJk?=
 =?utf-8?B?ZktINy9xVXhXNkJSaGEyRnhiL2ZFaFpVdHFZNkdtRDQrU0lwZXBKQko1b3ll?=
 =?utf-8?B?dm91VHBOVHozOUliTUY2RE41MXBzdVdjU0k3bHU2Mnp5SGIwQlZqSnY4cUgv?=
 =?utf-8?B?UklicTl1cVh4bEc4UVlHVCsvT1RPZjZlMlNqYkFBWWtOaStGUVVvcGlIZzB4?=
 =?utf-8?B?eldOblZLaTZIRGREem0yTW1BNU1mNDVCaFFoNGNhZmVaU0kwN280WndXKzRT?=
 =?utf-8?B?MHp6THYrZkF2NUg1ZDhtd0ZJaUVqVzZJRGp2aTBQZ1pNZXArbk1XSE0xWTBo?=
 =?utf-8?B?Z3RMeXYvV2FKcmpOUGdiZDY0RmNudDgra0kzT1ZkZk1XSXFNbWxMZkNaM3hF?=
 =?utf-8?B?cU1xQ0tCZXNsemRXeFRFa202WExqdnBUc0czVGdWaDhVT0h0OStDSi9wKzRT?=
 =?utf-8?B?UFdRb3pIbGtnVEdVYlN1amFBVXk4R3NQcFB4VStoUWFTTllXbWVxQkFQU05M?=
 =?utf-8?B?NXVaRHNXUTFsZ1JmcXJQY1V0VUgrcis4dWFZV2dpZmxnb1B4QTFHeTh5a1Jn?=
 =?utf-8?B?WDh6TDErOEVLTE5ncm93UUFHODhXQkhqZm5ZSmw1akE4eXFFRWNwVGJEUGFI?=
 =?utf-8?B?TnBiVGVJdmtQY0Z3VXlXY0RyUmN6TVJTWmlPbFJoenRMMnh6N3FrL1BGMTVV?=
 =?utf-8?B?bW1KK2tWN01ReUZkOE12NGxVNCtodSt6eFNUZFhqL1czK21Mc0JRWllaWEY3?=
 =?utf-8?B?WGJhZTQzQldUbENNb2lRUTF3dG5yaUExVmllYUxwQ3Q2cFNpdkg5Vjl2K242?=
 =?utf-8?B?eUNZWEZIaHZOQktxRy9SNjF2dGdobmJkUkVENEZVcGxiQkhlMTJWKzZURkVC?=
 =?utf-8?B?LzF2aDg3ZURaU25VKzZnRmFpVG92NUh0emRxUUp4Skh3RU1DRjNEeFVjMmlZ?=
 =?utf-8?B?NGhXMGdtRGtoUVN2Y09aQ0tobVh6Z29uSUZYeU94SWNmMTZUM2Q2SnBtUHVK?=
 =?utf-8?B?NS9QbGpuL0tvYlRZaU0zL3BxWjU5aUkzK1V3UXNJRTRJdmd6bGtBaXluRThD?=
 =?utf-8?B?Vmh3S0J6L2Q2WHM0a0FSU1Nmck5aTmMvTmFoRmhqc3hmSUJaNDAzNWpmcGhw?=
 =?utf-8?B?dTNldGtFYmNhb0NVZzBKSUsyUnlsaFZpdHBxNlh6SWt2U29tSFhsZzc3VWdr?=
 =?utf-8?B?MGVJRVUvWkdPZm04SXgzVGk4UTc1M0pVN0l6MGJyZVo3TjF5NSs3dmM1SWhV?=
 =?utf-8?B?MnBGVXZleUh5L0JKWk82S0hCOGM5SlA4TktYQ3llczY1NmtBcmx0M2x5QnZC?=
 =?utf-8?B?cEw2Y1c5TklPZXl6enRiQU1nT280VnFiaEZTbXpBSzg2T3RCR0pqMlNjSHZv?=
 =?utf-8?B?NXJyc0xkanF5K2lvVXBRYTlLbFRIOVhleEZaTnYzR21XKytiRFJsYXgrM2sz?=
 =?utf-8?B?U2h3ZmVvOHR2Z0VkNFh5ejBMSzlWNFc1a3UvMUg1RlFjRkdSOG1mQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b80bd5-dbfd-4953-2e7a-08de6a11741b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:33:53.1090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzk8+pK2GfEYqwtl9BDlgnqv3XyYHqRKdDN8ebnO+lmv9eTQlEmkABu/nUqYkOQYS+g6QcGDlPZpQMOmUa+SoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12269
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33313-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,nxp.com:mid,nxp.com:dkim,nxp.com:email,i.mx:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,4c100000:email]
X-Rspamd-Queue-Id: 9FDD812B62A
X-Rspamd-Action: no action

The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
USB block in a single block will bring more benefits than a parent-child
relation. The new binding is used to describe flattened usb controller
node. It's a copy of the legacy binding fsl,imx8mp-dwc3.yaml with the
needed modifications.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
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


