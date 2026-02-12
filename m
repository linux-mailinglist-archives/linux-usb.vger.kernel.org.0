Return-Path: <linux-usb+bounces-33312-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIwpKt+QjWl54QAAu9opvQ
	(envelope-from <linux-usb+bounces-33312-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 09:35:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A82412B613
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 09:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ED0931411ED
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 08:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466582D8DD6;
	Thu, 12 Feb 2026 08:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HQEFGjqX"
X-Original-To: linux-usb@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013039.outbound.protection.outlook.com [52.101.83.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9671EDA2B;
	Thu, 12 Feb 2026 08:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885232; cv=fail; b=UCqExRxIap+OhQUJCdLx+RmJe7+6eNjivjrepmpfiLghMVEapZjGmgOoNDlVzKp0J76d0uAqjLqUfNfs3tUI89U4amsNGdYEo6kLK/E6Hn/uQTf99Q3mQNBG9XqfG27MD5cbnxknPBxKKJDOKT05MUuLf/DMCCFurZEROgwRM4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885232; c=relaxed/simple;
	bh=XwpMa24OlDl6fSgjOz6d5L3Wtkmk42RHbV+0qtpj1ns=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Jpbny2neBPvwRGiLQlrqMtlzP9S+RFKO0RpjXw2UFDxySdgH2JaK+QpuEOKsaDlxs7s3eZ8z4RTS7deQqVqJuJbm+8Wo2ZdCywuY0GhGdeYAObov6CJH472TtPfr/n3NVTVu1aAYxMlJvEgaOT8Rihq0I6NyOaLrAgh0BywHqJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HQEFGjqX; arc=fail smtp.client-ip=52.101.83.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juxe3X3zBjlJFaGoBbd1UruYSZWpfub7Uus02g9R7l7ESgvYOZ9tHId7d0CtpS8ic+tEJJ4YAAHerLhMANU9TDItlCRmCJ8IsX9T94+iorSt+IzHdbz68qbB+6kWqBJfEHzTQs9/BrxeOhGMbUsttUUIVe3Ob4hPCpzCKXDFEUpRkPtBuI5oOEGggdqvsYYfGSm8qHe+w9jLJFT6wOUZPsEyyc/ptQBdVMkBDSXV6qPmeGPdya7Gw1vzshNI0d3VamqRIGIucVXkqKXKCAzYiyIFa6v2juNy7lyeIWykGvm7Xnu3VSTDxD9EESJthkfMw8VbKeuOQzuw7TLaulHYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4CFR4YLMDZJQSuo+v34AB+f3yOh2/at7qZ23xfzgMc=;
 b=eBNv4rbVc2H0c/McgU+nk0ttI+U2Jd+uP52R89Yhb7rAvfTH/7h2CWHUwxsZf8kDw4dPf09Xta8ti7UfWUfm6QVCYvEHa/Uge9p9H2yABvZtck7A4TYBzqwCHk1FoerLUGuqB270GTRfRO/mL4/5j0pZSM6BD7ma4sYf2gel2GtPrUoB+3Aodo0jni2LkCFa52vIKsFE3pvPaEWi3adeC4cTWJIB0HBH2RvYgYTHu5W4Qu/yl2YJtmv8TTlR6TtbgERZYTn1be0Jw0Sf51K0e67n0zZaLoO4GphaFm7uEV/RCKo7B2FbpsNDpAZqG5iSdw3j5hgjg8updSE260WCfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4CFR4YLMDZJQSuo+v34AB+f3yOh2/at7qZ23xfzgMc=;
 b=HQEFGjqXYzXUGRgM05xarFromgIKUqwDLS6vNcEOZgqKEqzmHQ4au3Y+n50CAWR+RuZPRkcjPjK9vh8611Zxe67vcuThssvT5Wh6Z2C/B8S4drO55zYYdS3nTd5VhN3TTzQB+/lNUfGav8YfTM30TeTMO6YQUvNgcVC87ZWqXdAGdWMHfELWlHSjsmXVxTyv85iijfLenlGTUeW7xdS7TSdETMHTS9lhPLhbmGlTNV8fyvWuc/z+4beT+JfL6sYfZcl3xHW/frEKjytr93INuxzIwDNWBJEmfV/350l+qSOdvEUPnJyGOdD+Ktd7xKiejDlNrNaFj7ks9I4IMYdx7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AMBPR04MB12231.eurprd04.prod.outlook.com (2603:10a6:20b:758::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 08:33:48 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 08:33:48 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH v4 0/3] add DWC3 i.MX driver based on flatten devicetree
Date: Thu, 12 Feb 2026 16:35:02 +0800
Message-Id: <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-0-08c10b08ebb6@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALaQjWkC/5XNsQ6CMBDG8VchnT1TSgHr5HsYh7Z3aBMB05KKM
 by7hUXccLnkf8Pve7NA3lFgx+zNPEUXXN+lkLuM2ZvurgQOUzPBRcXTAY0IzV0PA3WAQwCjAyH
 g0xbg2hHQu0geVEVSS92osuYsWQ9PjRuXnfMl9c2FofevZTbm8/ffhZgDByulLknlqjjwUzc+9
 rZv2exHsTblVlMkE4VVptTlwfL81yzWZrXVLJJJBpVRpq65VF9zmqYPX7lzroABAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770885336; l=2549;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=XwpMa24OlDl6fSgjOz6d5L3Wtkmk42RHbV+0qtpj1ns=;
 b=K86LuSlVD7cf/9V/ucFW8PE7BfFRNW7wnDsfEh56cdAQ3U9nHrxEHYPnBKMed4qhsCfkXzq7a
 OYfSXoJots8DObEVnHLOIYcTJvHyrBu83FIO7It7HueFxlLXdRUsK9G
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AMBPR04MB12231:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a878459-2de3-4138-327e-08de6a1170eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDBGKzc0QXFnM0lIOWdiYWtUMkNzWm9DVExQQmZscGdlOE9uM1BCOG90Ty84?=
 =?utf-8?B?dXhyMFRqRkZiTG4vVnFtUWFmd1A0cE4zaUwvVERqU2lZdDVDRWd2bGV1djEz?=
 =?utf-8?B?dm5DcUxiY2JQMzJXbCs5RnB1UW1PVmpnSGdpRzYzNGN6S0locnNFc0p1RHpR?=
 =?utf-8?B?ZGRJeHVCaUw2bnlQN2ptS2ZUQklJOXo3MlRPYlBLL1VXNTZkQkk0SGVFZkN3?=
 =?utf-8?B?ekY3S2RudlhWamlJMWViM0cweUxZZ1JNaXBjQVVkQmVBeUdzam95WjgyWTRU?=
 =?utf-8?B?QW1ielVsTno4MU5QMTc2dVg2WnJZQUhEdEUvL1lxeVl5bzhzRTFVSzRJS3Zw?=
 =?utf-8?B?VGl0c1J1bXdHbDcvQVVWcFdOTzJZVmdPTktUSWlTelJmNENJVTFlS0FqUGt2?=
 =?utf-8?B?N3hjdk5PSWtpNGNWQ01mSFZROThvbzBJSVpxVFRSSFpqVHkySHMySi80RFFF?=
 =?utf-8?B?aW16a0xrRERmTjdvaHJQN29jYXpTMy9OSmNYd1FFUUdhR1VqU3BJbUZYSHJx?=
 =?utf-8?B?bC9KWHpkL2pFY2J4WlJ2VVFacnFRSEo5dzdydFM1cUcxNVE1MHR2L1BHWGk4?=
 =?utf-8?B?a29Ud1l0UnljcUdTSmJKTGxnUVR0Zit1bTZ6WmFuZ3hGSnp0RUs1UUl1dHIz?=
 =?utf-8?B?cUgxNlpOSGNlUXl1alJDbmdNaGpvR3FYV1pLZ1B5aStabzlFWFVzcVFUWTlw?=
 =?utf-8?B?cms1Ym5KcGh0RVJtdFpUdjZ2OXZIa3JCOWZUTzFnS3FIQm9TRk1sQjlJenNq?=
 =?utf-8?B?c3k4eEJFZkVHWjFpaCtRLzg3OUdMV3VDR1h3ZmJQd1h4bW42MlRIYTFhMEFG?=
 =?utf-8?B?VkNPR1NyRmgyTmV3cEdnOXczdmdUYm1SZTI5b1I2WFBHWFNaUGw2dXNRK0Zv?=
 =?utf-8?B?SlA1TUFRbkE2a3A1NGRjZmFpOXc3MDFvMmdqMlhyMlo0Mm1rc1k1ODBlQTA4?=
 =?utf-8?B?Nm54UXhsRkN2eW1xSkZwOXhBUWlXV3FOMGFOVHJMRGVzU1FVT2JLSm5LRWM5?=
 =?utf-8?B?TnJFWC9LNTFyVzcxc1hUZnNKVU9kODJzR2N6RUw3aGJUaWxEWFIzNTM0TUY2?=
 =?utf-8?B?Qm5HbnRad08xTzRCVW5LdCt2SXVyc21zS3k1UVFFMDNsK0RZQXhTR1c0Y2ZW?=
 =?utf-8?B?V3ViNHZCUzE0RjFGYXlKVzVBTGpXK1VLSTlBM2FZQ0pUTTJaS1RmakJWc1ZD?=
 =?utf-8?B?dHdpaWJvODBSaFRLVVExU3BERkZkVmgyWE9JTUQ5eGt4c1NBYVNZcmNESFV4?=
 =?utf-8?B?cW1NZmphOGt6WHJLc1NDYnBCbVlvcXRNSW9iQ1BlYURPTjVvdHpmTjc3bThx?=
 =?utf-8?B?OUlzckdxa1lORC8xeHJBbmh2VGNIRHlPQ3QrLzlPK0FPbkREL3Z2c2ZhLytw?=
 =?utf-8?B?WkN3RDBlcUt5MkVEZXN6bk9SYklUeUhockZOQ3ZGQThXYlRlSkpZYWx1SUM5?=
 =?utf-8?B?NDRWZHBWWnRJMU5MV3crekl1a0V5OHNzd2hTWTBzQncyeEVnRFYweWE5VWRK?=
 =?utf-8?B?L2ZzU1N4SllhVlNDTENjUGJGQjVTOUY3WTlLQTZBYzZLdXA4QkFmb1AwdzlC?=
 =?utf-8?B?U0hiTi9qek50L1FvdXd4ckFpdVdPSUk4TkVjSWw5UmZLRHlGd1I0SkpoQ0dD?=
 =?utf-8?B?VDdEVjZ4THRYVkNiVnU1VHBCYmhmVk5ac3VHaGpidENjcTZRUEF5TXlwUDVQ?=
 =?utf-8?B?ZXRwTmVhanVuQlNUVWJ6Z3diZVd1Qk9iSVRkY2tJdFVJd3dpUXJtd3R5SFpG?=
 =?utf-8?B?WWNTVjVLSmZsUG82aXNKNDE2Yno5Vy8wMjhETDZQRVFkWDNTWnFTMk5QZUtv?=
 =?utf-8?B?emlWWnpQZUZQL0p5aWtvNzhyZzYyckRWclEwd1Bod2p2ZFZ4eWVSK04vaVc2?=
 =?utf-8?B?eHJPVGs4dDVRRTVkeUVLb2tBS2FwS2F5UDk3akRTSS9nTXRWcHpJSXNkL1ph?=
 =?utf-8?B?RE5RQW9RWDM2Rzc1WXdFQ1NKdXc5UlNqQ2VEN2tCS3VUQnM4Mm0zeUN1R09R?=
 =?utf-8?B?Tk5wOEp2b0tPZWx4YXk5YWF5eFpNTFBHc1JacUN3b2Y4RkFJcjhBakdQcGZ4?=
 =?utf-8?B?cnFsL2c0dGczUU5Wb1ZYVGFVTXhkNGZ6S3RpL1FIV0JneFNueXFnb2Fwd0Rx?=
 =?utf-8?Q?1CdyCmW81iZUlo4LIElIxX2we?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnllUUMzekQ5bS9EaThpNFp4SFFIVjM0VFA3cnFmYnBiUEgxa3pSUFg3RTFG?=
 =?utf-8?B?dVIxaERxaE1vL0dTUzVySUN3c1o5SVFXbldMOGpUbUhDVE13aFRGQU5YV0Na?=
 =?utf-8?B?ZWo1ZlI5VTN4Q3NYYzBFdExhZ3ZYdElrNE53b0dYWXE5NHRxMVR0T0J0YjQ1?=
 =?utf-8?B?MU84aUJEb0xTR01zSnBpN0VJelNWL0ZJWTJsU3M2QXBtTlgrTmlNcENUdmtv?=
 =?utf-8?B?UytHRCtjN2pHK3RlalZDWXBVelZuMU9FR3cvUnIwZEdJUW8zMlVNMWpjSFRU?=
 =?utf-8?B?RzZyRmhsOGRmU1VLQ1A5RTc0RHIrdWNoR3AvNVlKa1NpaFV6MFc3YWZJNVo4?=
 =?utf-8?B?aGZQU2p2SkxYZE95ZTd0VFZBKzZKWU5KdXFka05wbGZKNE9DRUI3ZlZmZGZ4?=
 =?utf-8?B?UHJHMlpGS1JLNGhzbGljTldaMUM3VkliMGJ0d01Ha2JOMnpUNVJPQ2ZYYnAr?=
 =?utf-8?B?NFdhT0hiT01OcWh4aUk3VWUzRTc4ZUpVS3dtaWZWeHJ6VEFjMU5QL1V5azVL?=
 =?utf-8?B?T0hRTDNONkYvakV3MytmVmR0dTlMNEk0RERhSEtlSXpSRnRJQzlpcGV3TjlQ?=
 =?utf-8?B?TG5EczM4MzkxQS96Z1c5KzU0ZXVzQlRLekhzVlFuMFpXeTA5bTB4YWVJb0p5?=
 =?utf-8?B?NmpseWdDOUpzN2x1OTZDcmlybXdKMHR2YmFUME16cjl3SVcwVE51VXEyK2c5?=
 =?utf-8?B?b2cySUltUGNadHhTaWlaMTBselg5ZVA1YjU0aHlFOGU0UUJ0eVZmK1lPZVhQ?=
 =?utf-8?B?ZVI1ai92TUt6QmNNSjZpNTBaS2RCRVpWNEVsZ1J1V2lQZGlPazVLVVYyb1Nt?=
 =?utf-8?B?Y0tnemNLS3dyWnVHVzAvYVZaU1RyNzMxczZlbEg3WnFaRGxDK2pSSlV0cUVy?=
 =?utf-8?B?eFI3Y2d5MllLTjVrbjEyMjhDb0k4Wlc1MS9XeU4zZzZESmFGK250SGlsdzNG?=
 =?utf-8?B?dHNmZTNZbCt3Vlg5Q1JFM2lBOXN4UVlxeC8vUmFIbkdMWWFmTW9ZUEY5M2RC?=
 =?utf-8?B?cHA4T3Zwd21YbVFSZ0ZQdlNTYTc3V0tqd1pRZ1hmZVFIVTE3Tm8rTVRKTmR5?=
 =?utf-8?B?eXFURldncEtNLzNyQjQ1NkJJRzc0MTd5Nm9WZWR4UitmRlhJcVU2YVorSEFl?=
 =?utf-8?B?d3ZkaUtSZ0QvVjFsNlR4bUk4TTBxemRDUU8xMktCWjFXUUprbkFDcmlkY1JH?=
 =?utf-8?B?TUFuTWxGeDF4UENHWUMyMGJlWTFkc1huRm5MakFNR1RjaVROdmRBR1BMM1p2?=
 =?utf-8?B?ZWQ2KzM0QlYvbXM2SlMraGd6OWJmZHY1NU5wZ0VpSTJvUjZXem5razZKZFVp?=
 =?utf-8?B?QjF5Z0l0bE1oUnBCbEdFQXBpUmV3UWoxYnJjN2tNSjQ0N0ZUaGFNNHdEVHN4?=
 =?utf-8?B?Z0s5Wit0VW5mSGltQUpqMUxsWkJZd1VBZGhFYll1akQvNzBuR3BkR2JpOTJY?=
 =?utf-8?B?a1o5TEdVcjgrZkU3Tkx4emVvdlFiZHYrVlFtQVJpR214amdVRVY5SGRZUzBV?=
 =?utf-8?B?MkhmREZ6eVRjSjJlWmgyeTdhVWFwT2cxWWRtVTlBeTZBL0tRMHlRekJMeXlq?=
 =?utf-8?B?YW1WV1g5SEsydGZ1ZFd2UjR4VG9acEpLc1djbm1YYkJvZHExb3U0bWV4bG1U?=
 =?utf-8?B?dlkrL1pqcjVzQ3p5ZE83WHZ4UUZNUnppR1dYdGdXNDlrQXVXMStITkh4S3ho?=
 =?utf-8?B?dHd6T2tWSkRBNWNRZDQ2N0xLQnp0dEh5aWQvbElvWkkvdTY5V3lJZmlCc0FD?=
 =?utf-8?B?Z3RZSVQyYnEydTF0M2RkbFZGalMyS2I1UXZjcHFxZ3RySWVIRFljaWcxNUJR?=
 =?utf-8?B?TXVlMUJIK0JiYjl0WWhuV1ZIOTJDNUxSM0lidW1hNmxPTnB3ZlFiK1VxOG1R?=
 =?utf-8?B?ZytPN3lVeFV2dnhRalJYMU40QkxQbU5vaXZTRW8wRjZ0LzVpUDFadzdQdEo5?=
 =?utf-8?B?RmNpam9DUTlnczZLNzJSOHZJNWwwRDFQVDNIR1lUOElsRkVCOFg0VUM2UlRx?=
 =?utf-8?B?bWVnODZJcmpVNjQ4SXEvSEpEcEpXVU8ycXFlaWF2dVhVWS9tSTFqRmFWSDVm?=
 =?utf-8?B?bERuMklUSS8zN2tKZ2RRcU1sbXVXSE0xRFk2R01PUEwyTGxtTlBLcU9FVWt6?=
 =?utf-8?B?a3N5QWRqNWs3TVNOdkJGQWlWN0V0QUs1bDk3dVFZdGRWeGJNT3FGbk80SWRh?=
 =?utf-8?B?KzNUUE5rYzk1UlZnV09FdDJxY3cya0V1WWtZZW1jOGxTcHdoMUdLelZsMDJC?=
 =?utf-8?B?L3ZsejVOV3FYSTVQSUVqZzYxZmJlZ0RpdnBOWnZLalFXSnVhVW0rd3AwQmdR?=
 =?utf-8?B?YmRyZzF6Tk84YU1LVEY5WmYwRUFFYXNXRFozOGk4RGw2Vkh4Mndodz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a878459-2de3-4138-327e-08de6a1170eb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:33:47.9291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gJlmuMFWCBGco+yJ/KsO7VLcpnaXNfpQGGnykI1ccdxzSr0/Cyw+DcO2NAkdIsfhtvmhMKA1en4GiHU4JeWZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12231
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
	TAGGED_FROM(0.00)[bounces-33312-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 4A82412B613
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


