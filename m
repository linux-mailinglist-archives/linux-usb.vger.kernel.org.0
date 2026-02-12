Return-Path: <linux-usb+bounces-33314-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMbmABKRjWl54QAAu9opvQ
	(envelope-from <linux-usb+bounces-33314-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 09:36:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B57F12B650
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 09:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1C91311535C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 08:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15122D94A5;
	Thu, 12 Feb 2026 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bqhlXzYd"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478D92DC337;
	Thu, 12 Feb 2026 08:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885246; cv=fail; b=e0/C4NDQXx2UI94ZMnfReH4sE+sxKxfXO50RWvOVJaOtGytvl5v5Xptt/UEj/TnE4RyWudOPQI7wJt5mU5pPzfxAga2Dz/6bApjEp9BSannLgvNfLUWOQAexjQEG4SI3I4WvPdIpkUcRvUVosSHEqCHHSI3rJCg/JbIfbYl2jBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885246; c=relaxed/simple;
	bh=jnU7Nj0Lu4BqO3ik2corph/+6HwLDvQKq6edgTt1kK4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gqTO46tCrQoaxAL6ZMSd0VbZ8NwknPy7mWkRDwi1pCVc924WclUzDlDzXKegYuAOGitWTD9/8RXOaNwc+a0vfdSNs8DQODfwqjnrZ4LY42hnY98DhqImXmmVNPMA9BFoh8Fr+IoWZm/Yc2tQ1Kwnjy1yvmos98Ak35smpVuO5Ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bqhlXzYd; arc=fail smtp.client-ip=40.107.159.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+OsoZUWaimOvGEblrAyUWqaSxN78NG6ji2c7oNr5FKBH0aGXfZ7Y2lapydKAKhCarUeq81bcC8jxtjgna+R159EGEQtnviK6LGmc6m3hmPMrIJx5q/CzHRzbsVsmcTD/ZeuHJ+u1WvaMvR6W/KeoQnt+fB1LGYQ4BK7HOJzTzZS163vonOT3KFZl8xn/HThIuUxqLApkmO4aYWSdyLsfnkqekcr00uxZ735Ypr6R+cbCGoPpwj8ACsWFTWF2xIZtQGsmoMhz2Iq4ibvn09yqHj6cWnUpSlQCfX3/RPGp6iQOLogwfHeGqVAwHp+dhdfcbTNulU+Q6J0F5EJHOa5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+cIr6riWvIHJq0TMsF+rQbUZUvIviyavY0tHdOfnCA=;
 b=gUrugVKY6NddQDvjSM2v6xgXcgYgIkZycArVlBwA5Rar6RoyUQSmPZzquEnOYdjNuG2sq3O2bn7JUnPuOAmtFIL/o5/gat53U9uWNcHYhYhfUtLJsgOds8/mgAcwCTgUgbxn3J07C/FIz8iY+diq+lgpj/uzaTt198PVzmcErHHzJ6D/khL/zxzxupcFKR+wVXzfG5eBsfS4z2zaG3DQCroeLaQ45ImjyW8JLZVL15woZJOO4PqPSPh6wr/6b9EaGJZ0DPlUpw1rXa7jRGGjr6o98M/Egopo/gTIL5DjnOJXWsP7eFBu+yWo66DTVsNX5ujWY5J2XuacxTYaMiImkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+cIr6riWvIHJq0TMsF+rQbUZUvIviyavY0tHdOfnCA=;
 b=bqhlXzYdasTjZLptvbNCCWAVQzIu4PwxRycWfbEXOOzsgH+XBJIGEZPW1RP1Z318ECzvjD6MX0NWZvy4nyhkSh/FnI+11Azamy6byB+LJ7fL3bO1YDVhqyds9SUXJmO5PVJ/nSGztN0iIYnAJt/N+z0lxl94GPheAdaAiGFfJrruTOSuUEVHrnlCdPgsUUVG67W6zffM+4RS3N1KNq1LDL+fRmOPzszRks3mcjwM88w3sbnf0UOIlIY7WnhHX6DDMcZnaBiXAJXSgNL3iqpWVvlJ+GdfoXwPtjKOlsa3YEP4y892ctnLr8BTO/nhH+z6zJtOq90Z6Jp5HqLQmqWQnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV2PR04MB12269.eurprd04.prod.outlook.com (2603:10a6:150:329::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 08:33:58 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 08:33:58 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Thu, 12 Feb 2026 16:35:04 +0800
Subject: [PATCH v4 2/3] usb: dwc3: add needs_full_reinit flag
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-2-08c10b08ebb6@nxp.com>
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
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770885336; l=3933;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=jnU7Nj0Lu4BqO3ik2corph/+6HwLDvQKq6edgTt1kK4=;
 b=ig2vr8idpYkWjAG7Jb2MAe2N1pAvBu2Zlyka6QYxKhX2x6vjFVoQtLQS0DSWqXh+QgaMbGOIm
 ZeiXVTaISWxBApbWNuAujbwweUNznMt3RaUCx3csIomWBqau31fPDt6
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
X-MS-Office365-Filtering-Correlation-Id: 6ec2d291-32d2-4755-f4e4-08de6a117756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmIrVEtzTGNMdEVCTW16aUwzOGY2cVVpSjVXYzdaV0EwUGNsdDYwNzJtclpw?=
 =?utf-8?B?V205S2V3NzJldjFkZVkxN0hMTjdsVzM4WkZSMGtvcHRmWTJlYTUvTEs2cjhL?=
 =?utf-8?B?TzVYNytabEhEd1VKcG93ZVI3WVNTcEkrZVJoTE56b3N3QWFJUzhtVjZvdDZS?=
 =?utf-8?B?UUEvamV2VlJWZVRQUmMzTmdxUDJtWDVMRDNoZ0d5QkY3VWFISFRBeW5MeW03?=
 =?utf-8?B?SWZsYS9kNmMrejRXc01tSnJVWUJrZkpOeGp2ZFpwZ3ZxQkJEN3YwOWxxa1pT?=
 =?utf-8?B?cmR0Wm5mOW1WeWZjUW9zVG9iamRIdXJzZHZ5L0YyVDJBY3B6UnVNYmJGQXdS?=
 =?utf-8?B?Wkk2MTdCcWZvOVlpOXh2eDhSYXpiNlppaGdMQWRaamlRVHFWZ0ZuVmEwYnlE?=
 =?utf-8?B?TkR3ZXdLRDdCbnBlUURTN1h0Mmx1TEdNSXhEU3ZJRE5TcHdUOEFXbHZNN3NW?=
 =?utf-8?B?dDJLTGl4bERTTFFTUE9uWWloYmt2NkdqUWtWbnFTUkVTdjd5UDk1RDRoclVX?=
 =?utf-8?B?NjJSUGJDbUcwbDUrMW1yRndNYVBKZndIUG5NRGQ3eDJEaEZmWUs1Tm0rN05D?=
 =?utf-8?B?ZHJDRWpMcFJ3a0RIUHVrdUx3Skl3WlpabnE3QkNVaUlwOGRjcURPVlBiYTNI?=
 =?utf-8?B?TVBSY3NXcVdjM3dxV1RrejBWSTVwN2lOaTZXWXVKVzgrajY5eWhVKzBJU2VV?=
 =?utf-8?B?R0JQczlGZjNyMnZnMHVhNEllcU9XUjRKeHVHR3NsL0RsaWsyTGk0aVhTTHc4?=
 =?utf-8?B?aTBabjZpQ0MwVkpaUlJUUjJlSDNleDFLa0o5dFRlSjIzRUQ4VndqOGJxT1No?=
 =?utf-8?B?MGJBQUNzUS9vVHVhMTVTNzhXYmJDcTRxc0dTOXlLQm10MDhkZmhra3BkTU4z?=
 =?utf-8?B?amdoOHhDUGVETHpRc3FNYXdGb1cwRTBKWHRjK3JuZTRZZzFURTIwYXg4SW5G?=
 =?utf-8?B?bHhRZGkvMHRYa3RIb3B1Z3hjdkEwOFFNWG5TQnd5MlphQjk4bVJON0dYSnlX?=
 =?utf-8?B?U2pnd3A4VnFieVFyRE5IeWR2WG5hSk43U2srdDNmMkE2N2NRd2pmem1DamMr?=
 =?utf-8?B?QUhtZWwvMFhiWlh2emFIKzBMdUFPVW92VUpaSkk3S2FuT2wvdEV3ZXhLQ3pY?=
 =?utf-8?B?REYrdVRVRTBkNGYrTHA5MjFDQ0hISU5Gc1d5bUQ2MElDeU90R2ZCamxWZUhj?=
 =?utf-8?B?TVFzVFMrdDN1aWw2R29KSVdOL2RyeFE4Qll1ZzRIOE1XU1piS3FZWDZoZEVF?=
 =?utf-8?B?VDkwblBPYTFhSUU3UEp5UHRqSUNwS1g5TXc2VXU0REpmOVRUemtuMXBzSGdC?=
 =?utf-8?B?b2FxTXZCWnc5cXZNUkxaaERqY0kyRHliYUZUSUJWNVFwbUpjNy9GOHZSNTZI?=
 =?utf-8?B?Zld2dm1WZWNQUS9MRTY0MGNOSHJybU05WXA2K0ZZNm5zUElicXljdjYvMGN1?=
 =?utf-8?B?WGREWUFZWWorK3VVRVk3ejdTYVZSaTNCVDhpQy9xZzJxWjg3QkRncHpZb3pZ?=
 =?utf-8?B?NTJTb0d0ZkxTYjdVaHdDUmhLalNUYVdTbUM5eHJkRUxSZHNKTFBhNGtXNGRx?=
 =?utf-8?B?TnhORko0aFNQckRYNXMzdHN1R2p0ZnBra2Rwdmw1MFU1WmVpTkpsOFN0eWdk?=
 =?utf-8?B?SHcvL0dBakx1VllaQU9pQTZUZkc0ZWY0UWlGWm9nTTFqb3lXUGZ0TzBEQzVR?=
 =?utf-8?B?bzl0b2JZQkJNcWpxSDBBN3pYYmFVajVCcUdEeGZIRHJYRDVyZDdPcHg5blZu?=
 =?utf-8?B?VExFOElyZDRIaHovSTNzeHFvdUhrNVdtdjRTOUZwcDg0UDZQaU9aSXB3MzZl?=
 =?utf-8?B?TGVjN3hJUms2ZFVpTzB5Um9wdVp2em9paW9hRi9sQnJEN1Btc2RRb3NDQSsy?=
 =?utf-8?B?dk5rR096c1pFR1BnbVRRcHlsVVUvTWJxeXlGV3JoVGVHaVpuQzVXZnl2Tlpk?=
 =?utf-8?B?aXgwMmhJcEhpYnAxR0ZvQi8vUjNNZlFzM2E0YlhSN1AvVFl5ZjZ2Szk4dmhM?=
 =?utf-8?B?WUVuZmxzVjg0Q1VGWGRqMmFhYkRVR3ZJazZEdHJVK0FIQnExOFVwY1dPWDBL?=
 =?utf-8?B?MTNsL3QyUXdwQU1zYnl6MEZVaEFKS2pLKzU0dlZVKzlVaGRMMmViZ3FxdmEz?=
 =?utf-8?B?QTd0UDBMV2N3ZE9XaXl1K3JoR00vWW1IcHpVRHNlaUlRcmwyaVpjMnN0UUdY?=
 =?utf-8?Q?k68KAwL+9g0t/dd2t8MXHV+TLmj7Mk5cwgrgtBT1akfG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGpsQ2VFTzZYLzJkc0tXdnl4OFRGaHhySmEzSkM2b0I4QWF6OVMwZXE2SWk3?=
 =?utf-8?B?OUFjMlNsclpqVkdSRzN1c1FKeERyc2tuaWdvSVEwQ09nODIzNmU2SWNubTlJ?=
 =?utf-8?B?K0pERDRWYkwrOFNzeXloK3ZRNUNERmVSSWlBUXlWWXIyTTI2b3NvRzBscHla?=
 =?utf-8?B?em5RUXZ5SytnN2YyOEYrWk9zbFJPSC9IQWNoc2FYMnFGcEZJczFVWUY5eWN6?=
 =?utf-8?B?aEduMHNGb0F3ZVQ3Mng1aWZvSm1kd2swWGVNVis3Y0MwOWI1WURpblJtMmR1?=
 =?utf-8?B?SUJWTUxMdjJnaTN0TXF5Y2RocDd0Qy9nZ3pNdWJxaXpZL29CQnJXYURQZ1FW?=
 =?utf-8?B?MXFIMUo4RlFPM0xYU2o1VlN6dmNHb3lpdUgxZFNDbDF4T3NFVnNDSlp1YjA5?=
 =?utf-8?B?Uk1UcDJSdlRGTnJqY1JzSHM2YXFWeUMwZUt1UGRQek1FMGJXdVRnSHpGK1dQ?=
 =?utf-8?B?ZkdaRnU0dGxyNHVPM0srSzdUUUh3VVlOL2REdmRTbks5SERPMnBZWmRwVjlj?=
 =?utf-8?B?Q1ZJSWdabDN2THUrOEhIdDk4bUdKNE5DNEVreHFZZXpSdk82SUtxTEpRMDRR?=
 =?utf-8?B?cEZPR2pCMm0vZWxpV2FobUR6VkpDQjRBL3pWNkphaDBvKzY5QXovVHZzdGN2?=
 =?utf-8?B?YjlOaDEyclBzVFcxaVJUSHFTVVpBamtDZ2s5RW1OdSt5dUFrWWl2dys2M1Nr?=
 =?utf-8?B?RlVkZ2ZYNmdLMERaVFlaSGVJbUtJSlFUeXhzVmxjdDI2NnY5d3FFVEhNZjJ6?=
 =?utf-8?B?MTZCN3kxeTdMc1lhRitvU2J5QUt5WHVwTXkzandTMUJYWE1QZzdwN3Z6enhi?=
 =?utf-8?B?WURNOG9VSlE3VE1BT093Y2JLbzVEZ0MzZTdTSzZPRXQyeXhCTHhkeUxwekRK?=
 =?utf-8?B?OWRlajB0dko0MVdBSEdZdkd3Z1QzbFQwSk1OMUxSRTFhR1NJTkpVdE5UWHZs?=
 =?utf-8?B?cStNc2lKaHZmcjhBNzlUdVlITnBFK004Yk44SmVOV3dkcnJLWnhoNExuSWVK?=
 =?utf-8?B?Y3d2OFNFY2ZSNFJsaTMweCt3dzhYcHhnNlRMR1lrL3d2R0k3M2N1M08xUGpW?=
 =?utf-8?B?N1A3RXFUb203cmIwSGxqZU5GVEp3aFMxQWNkcTBiR1lLdjF3SjZRcmFmWFBM?=
 =?utf-8?B?ckhrejVOOGxxMTlpOXFobHVLTGZtUHgvbXUrSm1MVWxETFcyQ0tHb1Q1RUhN?=
 =?utf-8?B?VHlvSnJQVjRsVnE5bWxoREpsUXZaQlJRWWZ3MFptK3ovY1lmTXA4WXBmZGZN?=
 =?utf-8?B?MnYyNHdnRnNyYkhJbGEwMzcvMlFZWFlmdllyS1MyNmtwS0R4TGxWbHUxWFZJ?=
 =?utf-8?B?U0RFTnI5RlRDRWYrVXpvNVg3VEw4VndSckRXV1o3OSt2UmJub3dJZUw3QVNw?=
 =?utf-8?B?RFg1SkgwbDcyVE5Wb1ZFam1BSEwxS3ErcWZMcUxqOGpORHJJUjdOQkFMcGF2?=
 =?utf-8?B?R21Eb1l4K2FPV1BkdHgrbndGbW0rcFFPT3R3MTByK09TcEp4ekJVNVlPNTlH?=
 =?utf-8?B?RC9qTmF1NjJlNDRkOUsxcnFqdSs4L3pWU2tSNWhYS0haQVdWWENkVytIN0tF?=
 =?utf-8?B?NUplOHJGdTNWWWU3cXVCdXpPT0kwRjhhSGNua2xyM1ZUbTVUd3UvOE9pS1hj?=
 =?utf-8?B?WUpGT2NjdEIvL3JoTE8veXNNUzRxU3NGRkQyNENXb2x2N3lUdFhxNTNwa2ph?=
 =?utf-8?B?OElIOW55YWNrZk12bC9taTZocDJmSzBadEFKS3dNVW1pajZER0hsZFJjQkxD?=
 =?utf-8?B?M0VEMEI4T2N2M25qbEIvVXRqZ3FBWmYwRFk5d3k5b3lQRWs3dExNandyQjNr?=
 =?utf-8?B?Y2V3NWhhT3Radk9Qb1g1L0o0UTI2bG5iUVFqeVdQUktnT2Z5QWJPb2l0SWRO?=
 =?utf-8?B?bWNHc3ZMaUh2KzJYUmxDdWRvTElhK1pxS1lSUlc3dEYxNXcyZ2NEWlZQTnZX?=
 =?utf-8?B?OEdraGFHZEdTVUFqNFNhSTVYQVl1aGZJQ0JPVkVvUFZ3emoyVnBjcXQra2hU?=
 =?utf-8?B?a1VCaUVxd2ZGQ1FoZjlvSEFUU0F5TWl1SitYZDIwaGFUa2NMZ3F5VUZYQmZP?=
 =?utf-8?B?ZmpLamdkeEF3TndzaTZnVWxBdGtIMk50UWVpK25xbm9YL1IzbWxTcFJKRy8r?=
 =?utf-8?B?N3RzQkVSSEQ5NTAzREV1bXhsY2FEa29UNGRNMllRTlZ1YUxTVzZ0M3RobFpC?=
 =?utf-8?B?TXAxc2U0dDh3d2xmSjlaU2RtcmY1TjRETGQzUXdST0NySy8xLzgwOTluVnF1?=
 =?utf-8?B?dWRoV25WOGxoRDY3bzVxaVRYVWtCS2JUWHJTSStNa0s4RWplREFhaGRLV2Vy?=
 =?utf-8?B?Z1hjM2txSklwaW5nL0lJVlBIZHEyQngxRi9paXB4NTdCLzUyTllCQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec2d291-32d2-4755-f4e4-08de6a117756
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:33:58.6881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZFn18vPACW/mUPqbN97/HQDbeSyrQLHetCxV8QwdJpmdVjn85qK4vkhzASkfXEG2JcHTXajUKdhw7ho6C44rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12269
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
	TAGGED_FROM(0.00)[bounces-33314-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 5B57F12B650
X-Rspamd-Action: no action

The current design assumes that the controller remains powered when wakeup
is enabled. However, some SoCs provide wakeup capability even when the
controller itself is powered down, using separate dedicated wakeup logic.
This allows additional power savings, but requires the controller to be
fully re‑initialized after system resume.

To support these SoCs, introduce a flag needs_full_reinit for the purpose.
And the glue layer needs to indicate if the controller needs this behavior
by setting a same flag needs_full_reinit in dwc3_properties.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
Changes in v4:
 - also rename core_may_lose_power to needs_full_reinit
 - add R-b tag
Changes in v3:
 - no changes
Changes in v2:
 - put core_may_lose_power into dwc3_properties and check it in
   dwc3_get_software_properties()
 - rename may_lose_power to needs_full_reinit
---
 drivers/usb/dwc3/core.c | 9 +++++++--
 drivers/usb/dwc3/core.h | 3 +++
 drivers/usb/dwc3/glue.h | 3 +++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 161a4d58b2ce..cacc4ec9f7ce 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1675,6 +1675,9 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 	u16 gsbuscfg0_reqinfo;
 	int ret;
 
+	if (properties->needs_full_reinit)
+		dwc->needs_full_reinit = true;
+
 	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
 
 	if (properties->gsbuscfg0_reqinfo !=
@@ -2479,7 +2482,8 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_core_exit(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
+		if (!PMSG_IS_AUTO(msg) &&
+		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
 			dwc3_core_exit(dwc);
 			break;
 		}
@@ -2542,7 +2546,8 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_gadget_resume(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
+		if (!PMSG_IS_AUTO(msg) &&
+		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
 			ret = dwc3_core_init_for_resume(dwc);
 			if (ret)
 				return ret;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a35b3db1f9f3..67bcc8dccc89 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1119,6 +1119,8 @@ struct dwc3_glue_ops {
  * @usb3_lpm_capable: set if hadrware supports Link Power Management
  * @usb2_lpm_disable: set to disable usb2 lpm for host
  * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
+ * @needs_full_reinit: set to indicate the core may lose power and need full
+			initialization during system pm
  * @disable_scramble_quirk: set if we enable the disable scramble quirk
  * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
  * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
@@ -1373,6 +1375,7 @@ struct dwc3 {
 	unsigned		usb3_lpm_capable:1;
 	unsigned		usb2_lpm_disable:1;
 	unsigned		usb2_gadget_lpm_disable:1;
+	unsigned		needs_full_reinit:1;
 
 	unsigned		disable_scramble_quirk:1;
 	unsigned		u2exit_lfps_quirk:1;
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index df86e14cb706..3dabb77d8acf 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -12,9 +12,12 @@
 /**
  * dwc3_properties: DWC3 core properties
  * @gsbuscfg0_reqinfo: Value to be programmed in the GSBUSCFG0.REQINFO field
+ * @needs_full_reinit: indicate the controller may not remain power during system
+ *		       pm and need full initialization
  */
 struct dwc3_properties {
 	u32 gsbuscfg0_reqinfo;
+	unsigned needs_full_reinit:1;
 };
 
 #define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\

-- 
2.34.1


