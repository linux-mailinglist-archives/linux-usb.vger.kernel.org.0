Return-Path: <linux-usb+bounces-19670-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E21A1A560
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 15:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9111A168D12
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 14:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732BB20F979;
	Thu, 23 Jan 2025 14:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="JEw3PQbN"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8671E4A6;
	Thu, 23 Jan 2025 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737640865; cv=fail; b=GE/Ddx4isiREFAtZ8d1hm1mLMQ2h+uLa3keHSCrEN8JzcEocpHTm2wL/tGTHPduTrFzNUPXn2ZqVXs0ze2H+SJeBnE2G2QRN2z6u98OmeqOuc0FTbcQzMsKK2shircghQ+GhPWQBIOTsTCpLLnGTXAUUJNj9GXXT1+S6XPJoptg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737640865; c=relaxed/simple;
	bh=BAj1/bB1izDVVrSYTX8CXNuq1YFFp+KCQ8oCqREGRCk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cws4WDpMx5NR/wLuEf4S1/Zh2woZ2kPBTYuMKF6q97F67TxIEBrGDkqMJqfCeyB6lNdY5eUt6FuzjiFEmNNtuUy0ObUHltkbr6MHhpkzQ7093PCbRSVg48QFXGiOS5V372tDym7r96A7b5aDk0m0eeW+Zn2+0bZ9Bn2HDOk7akI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=JEw3PQbN; arc=fail smtp.client-ip=40.107.162.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rK6Wcwc/hllP6BFdAm4Uh/hItKQPj/9Fc/1xpk4BF0DYg5SDzVLrlHeYiCZWHD+Wx19eV0uuaM7+WUfmsnikTD99cV6fjj+PCTiOieLx2ABwQw/F9e46C0LYH/kcnyVoObufL/CmVO0GUD4yUG20BDY5qCiEsGUDfSRciIw39x1OmwQrBC5Qhnd3FBZE3DRvYvI50Ge9WqfyS1ERbFVeI2726a9IaNGCWj0J2tXL5mT/Y1WunlWrCDsQ2iqgoDck55OTM4U8uqIy2YuZCTy9JycJgorll+0WEvgmcaGOzkspjDzxphaJc6f+ENwZGa6FaL746hiJPe+T9OOgwPAZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAj1/bB1izDVVrSYTX8CXNuq1YFFp+KCQ8oCqREGRCk=;
 b=GAgGdq2XlWF5MsjY54PHU4fbXb9iOSbGXIGItkiuitaUnJoQS8qlNYOVvKPHRh7o70XM8IMEKm1uPHnn+ptGvYCIAKyE7AEfbudOtZmkgeoBNcUJK7NfpkNBYqZPaTXHhMZ3E9dCJDhU7Z7w8WhHr7zclLCJu96y83zp/Saa90nYJgBgpH7bN3KCkYBxwS6ytIDBoFhcFRQkJY0bxi27OFGTxtuIYMINZnlV25maI5k5acZ+eNj3g7uMEnuI1AI8Ym6cwaPQkC7WcA/lXAhCCC00nsiMPUZFeRKfG32xQYRuEETQLP7li2n8Jwvav/yLRbboDQ3fmxUZ8xbgSnIMBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAj1/bB1izDVVrSYTX8CXNuq1YFFp+KCQ8oCqREGRCk=;
 b=JEw3PQbNOajrO/R3pbdyj8kvmxZeIq/NSPILAAmObfbOEHzEmqOf+KjBUsgpG9JcWmCEZho6k7ZS8dErm62ES560x6pzdcvEtY2bt3wQ4qE5cf/95tjMeT8ZoAM5tmjarKxwwCrdX8rpWte82y1xkqIbu5kT+P/Fp1NntFEAVos=
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com (2603:10a6:10:1a0::11)
 by GV1PR06MB9668.eurprd06.prod.outlook.com (2603:10a6:150:1c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 14:01:00 +0000
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0]) by DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0%7]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 14:01:00 +0000
From: POPESCU Catalin <catalin.popescu@leica-geosystems.com>
To: Johan Hovold <johan@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH] usb: core: support interface node for simple USB devices
Thread-Topic: [PATCH] usb: core: support interface node for simple USB devices
Thread-Index: AQHbbNQz5nuTuJgNwkO47mkrPRQBtLMkNpcAgAAuNoA=
Date: Thu, 23 Jan 2025 14:01:00 +0000
Message-ID: <ce5fe24e-e2b5-4e41-9dd3-164d688afe04@leica-geosystems.com>
References: <20250122134732.2318554-1-catalin.popescu@leica-geosystems.com>
 <Z5Ik2GoseMbZRe8i@hovoldconsulting.com>
In-Reply-To: <Z5Ik2GoseMbZRe8i@hovoldconsulting.com>
Accept-Language: en-CH, en-US
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBAPR06MB6901:EE_|GV1PR06MB9668:EE_
x-ms-office365-filtering-correlation-id: fc950932-8cd5-479b-044f-08dd3bb65dd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d0kxeVM1N2FSUWtOZjV6WWFCSDAvb0NFS0hnS0w3d2hDTmlMcWZENVZMbG5C?=
 =?utf-8?B?bVIyVWFVRi9wSHNkMU9tWjFpVE56NlhEVHkxMHhmWmR5aHlrNzRzRmNpbDN0?=
 =?utf-8?B?bklXVnNhMUM5enprb0xUdHJTUUN0UmZuTWRqUjZwTDN4TjZTbTlrbnp5YXRa?=
 =?utf-8?B?L29aMDAvUUMraktrQUxUT2l6VmhxVUM3L3dJalRTekhwcGMwYllhTE5pYVJk?=
 =?utf-8?B?T0hPWmJnaGZscmxGZS9Lb0NYdjdWeXdSMVo1N3BGS3JHeDFtSUVGb0tLNDNO?=
 =?utf-8?B?ajVKMFJBOUVtZjl4SWZUM09EWTl4aHZGSjhqT3h1RFpXY1pFS0I2WmJJMnBh?=
 =?utf-8?B?ak9vbUJVVUM0N3RLRW5UZ2ExQ1dBRERWT1J3bENjeFNOalR4U0xQMHVUOGcx?=
 =?utf-8?B?clU2OXJxT0k1bEVQamJaYmRmSkhCMDRLS2pGRkVuenJUelZHV05jMkdOWTZM?=
 =?utf-8?B?b0Q5ZDZsM1U3aDlnUWpabVZOZmljOWdJbHBwSFhENEdZUzREUnFRYjFnSzJW?=
 =?utf-8?B?NUpaNXV6dU1EYUVDQi81RlByRDFSUExsREpFNTVlN2dkYXd1bGl2K2FvM3Jk?=
 =?utf-8?B?VlczQ28zTkk0anhBeVVZZ3JNdmpHeGpmeEhzTndETUhmUDhzeW1pajZ6SWFu?=
 =?utf-8?B?U0FPNkQ5WDVBa0trNW9mNDdJcEswZk9tRDJ4NStFakovK3V0by9xRkxuZU81?=
 =?utf-8?B?RnByektSS3lTbkNoNXF6bkt3Yyt6dG04KytsdzlYR3ptd0ZJL09jQ3lBcFo2?=
 =?utf-8?B?aEUvTWhXUWF3elBhcWtMTW9ZNnU3UG1QSUVReXNCbUtDRG94T2xQUXdubmlm?=
 =?utf-8?B?V3FDT0Q0ZG9TdG9xME1nZFZmUWRDdTRFS2FLeE41cjBoc1dxbEJ3U2h1YzJS?=
 =?utf-8?B?dEVSTFVSV2d3WWZZTGtWMzNsc0pHK1JUMlNtSFlLSitqM2FqVFVzUzV4QmhP?=
 =?utf-8?B?dU4xWm03VUlQOEhmbGFoWUN4S0JYd2pWL2pZZDBuV1B1dmtxS0lTSlBwSU5q?=
 =?utf-8?B?UFlmSXJpMS8xRzZ5R1dkaDdsSU5HWlY5M2lVdG5XaHo0RXcyZUlqNk5MaVR4?=
 =?utf-8?B?TU1xOXU3Q1RlM0RlUDROV0RHZk1tTWVUWGswSHhEVjZSWHIrMDk1S201VkxV?=
 =?utf-8?B?c0Q5WFQ4eStFdlRzVTdrT0N3MSsxekxvYUt5eVFBUHNmWWtybHlaUlFJWUJO?=
 =?utf-8?B?MXdNNDMvSmhTVmVsdFV6UytxbnFrdW9jOFRmbVhaeGV6WVZsWHNvTXBSVEdJ?=
 =?utf-8?B?WFVueUFqZE0zNDBpN2R5VEhZbUorVy8wdVhEbXVucS9LSGxFRVNUR1NLQ2M5?=
 =?utf-8?B?UGhiMHIrVkI3SEtva05ROG1Va05lYjhmNDlmSDVzbENFZEQ1eStnZ0dHajZY?=
 =?utf-8?B?eXhUaGpEd0dOV2M0WXp3OTRiSVlBeUt2K0xTeHR0NHlHOUhQc2lwYmJ5RnRi?=
 =?utf-8?B?bUxhK1F6cVdBRmo5aGdIRklUQUtVMGgwU3BtTW94cGJISlkvT2FPeEo1Zmgr?=
 =?utf-8?B?RXd1UHExRzUydTNtc1dPcnJxMHdvRVBIZHlacWgyZGwwTGJVZXpoNnNnREZm?=
 =?utf-8?B?dDc4WFJWU3ptNElvKzJxeDVhVzZIZ0lvMlRsWUNydFNtOTRUb0d2eDUzWTJ1?=
 =?utf-8?B?aGp1RlVOb29OV1duQVJVS3dLQ1JWelJyYXNaU0pqMytSSEMvY2xROUNFbVR5?=
 =?utf-8?B?STZUNGxKNG4ya2NDZ2NOVzBzSktiMWV6cVFhTDVDTFljdDVia09paW1QdUQz?=
 =?utf-8?B?b3ZYbjlBRjIvckQ2T3Vrcm56RmlUak5KNndCVVRaODdTR0hTeFNkWElIZTlK?=
 =?utf-8?B?UWtLbjhYdm1QQytJM3duOWY4ekwzYTlGZFdvTWlWVG00dXdBTUQvZUwrdlF4?=
 =?utf-8?B?R3ZvWjRRMjVEUFFUWWtrMG5yQ1hIZmkwMkFQSzlteXFnME85bFpFb0hRaWZi?=
 =?utf-8?Q?vP04rOdewGtEwA0IEQC76Mjl/Uei6deT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR06MB6901.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTZiSFdHUEkvRWs5SitmQ08wSi8zQlFLb3lVMkJLd2lERURiblUySnVRaHpO?=
 =?utf-8?B?bE9ybnZSVFVYM1ppcWpsODZlQTNZWnA2T25ScU9FSTRvdm9KcWFYTFZnWmRU?=
 =?utf-8?B?U1pDUDlmdkR1Ukg4dUlISGJ3Q1ZiL1YzTzJ1UTlDWlI0R3YrTlpsYmVrMzB5?=
 =?utf-8?B?anN6MUZQNFk3T1lsRGFuakFucFZva0xtbDlVcTF5aDl4aTdXM0d6emRya0hE?=
 =?utf-8?B?YWVJa2VHL3pEMkc3aEkzREsvQXZ3bGEwYkpBbGxPYnlNNUtHT2pZWXdWY3VS?=
 =?utf-8?B?UEk0dUZsMi9yTW56NFFnZFNZUGMzb2RzQzJaR3JEZkdTdHd6YnVUZzNyRU9o?=
 =?utf-8?B?NFk3UFVpdmJoa0JObWV5SFRSTHZ5dkcrb2RLekpyNnJxUW4zKzIrcFV4ZW5y?=
 =?utf-8?B?UFVQbmtpR0JGOXRnaDdyWXZuMVFXZmtBOTg5eEdsZE84dnQwdUZpSVloQmg5?=
 =?utf-8?B?dzI0UkV1QXNaQ3ExTUpYSU1ueFJCUUJNRXM5TmxQdUUrMFNTcUFVcklUcTJJ?=
 =?utf-8?B?MGxBS1ppWVBhYXcyQlA0Rk5GRkhRS1dxdUlIVmVZR0d0QnFTUlBCRDlCN2tl?=
 =?utf-8?B?dmNZUVBFMDRQdm1Ha29NNlBDNGlpNlJXZFI3UXgrV0J5aDJlTzNkdU11WXFo?=
 =?utf-8?B?YzM0NHdNVmd1Z0dXellRaHF3RzhMcXJPVjlSVUpKemY1VjdLRGFDRUtKVWpQ?=
 =?utf-8?B?Uk9HSHQ3bFdPN1k4Y0h1WUZ0NEZybVNycHkrdkR0akFjWlplOFJsbXZUMkRX?=
 =?utf-8?B?RndKL0UyaUtPdDIrMUdDUU5HdGNSSnBsamNtVSsrdmo3TDVSQ053UjNISkxP?=
 =?utf-8?B?YWVxNFNWMUk4SlUzdTNNM3NyUFNVdDhwUGhueURuU0IxSWNiUVdXT3NlWjlH?=
 =?utf-8?B?dko1WDFXb3hQa2xNeHBjOW5jZThRNlhEY0xKYTdtT0tINTE0ZWNNM3hUUzk0?=
 =?utf-8?B?ZUZ1c1FrYlJOam5oM2ZVVEVveWJEOHhEK2FtZHVvYmJvMXlWVE5PV3R4Q1h2?=
 =?utf-8?B?eldTMGpIUEFoNTRyOUl5alZTN2JJTWo5OHQ5S2pTdWhNUTRWaktPN3dJRGc1?=
 =?utf-8?B?N1Z1OUI5Q25HQkQxNzFaaHlUQXNka1pyNlpMeExVVWZiUFRMcjVUbHdVNFlC?=
 =?utf-8?B?TnlmVVdKbENFYjJYWmxGalBTVWMyckt5dnpveWpxcW04anJQd0xHSUx4OTZN?=
 =?utf-8?B?L0E5cExpREhhVW0wUldFM3hqSGZxaTFhU2tCSFptMkk3b1dJVTlOVytKeTZw?=
 =?utf-8?B?N3RCS2tyWHdnU25tZTBiMDcyNTZ6N2NxQW1GTzEzd3N4a09POGx4dEQyTUg4?=
 =?utf-8?B?VGpXdUpzYnBqSVB0bjBXOVhFbkJBWXNuVExDdC9FOTN0Vjloa1JHMUxUNTJt?=
 =?utf-8?B?MHVCRktaRk8yK3lGY283NDBHbVlkNWl1QTZxSWZ0aGlWRUVESlE0bkdLRjV3?=
 =?utf-8?B?RE1IT21nRmtiMUFQeHJ4RjhpZXMvaUUzWGd5MmtQMjErRzR3bkplalUvbGtn?=
 =?utf-8?B?T0JHdkJDckp0Z2lWQ3UwM3h2dTZ5WnNvVm1EUVI0UWNLSmwxMTRHNVplOHNO?=
 =?utf-8?B?RTFjVzFtR01IbUQwcnBrVURNL0lTVGJQeUhraEJUamhxdjlqV2VDM29mV21Y?=
 =?utf-8?B?Z29OdDl5RS9hanE2TmZuNm9SdkNNQStFSy9uSk5WanY2dURFTStyYkllSm9p?=
 =?utf-8?B?bFV4Um95N0lDcjR5QjlKS2dzMFVheXRtYlFLdXdqZFEwTlQ0OXZOWlZTUnRB?=
 =?utf-8?B?bFlCVXpzajgvcjg4cTgzQytoOXJrYW1FYWg0UGt6Uyt4WnNWUTF1UWdKdks3?=
 =?utf-8?B?N0ZaeDVpVjZoc3JlOHVIN1JVZEV4U0I4bUtuMTdmeXd6UDkxQkdNelJJdVJW?=
 =?utf-8?B?Y1VUcTBHVHFDaStpZ1p0amVLdWxJbWQ1U3lxc2J3d25kTjZwZEhSR09XeFlD?=
 =?utf-8?B?WnJoZ1F2K2hTMDhSSkVzSU16VFhhR2U4cER6aEx3OUlTK3gvbmg5bEczdlV3?=
 =?utf-8?B?aW9veFdJSm5jRGxrZFhobVFyS3hUSjlxUnlLRUMrMDhlK0dLV3JtOFdiNkVm?=
 =?utf-8?B?Ym00SjVXcXFTd0Q3bmZQWXVpUURCUlR3Y2IyaWJFVS9aMXdnQ2N5R0I0a2R4?=
 =?utf-8?B?VUlhWHhuNmU2UDFRRWZEOWdUYXlxb1R0MmVjenlaa3AzTVBQV2lZdTBXZUVW?=
 =?utf-8?B?T2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BF808BB26BA4E439FA9CF8CC9B10D6F@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR06MB6901.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc950932-8cd5-479b-044f-08dd3bb65dd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 14:01:00.0151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o+EuQlK1PSCEQ5SDsdmiifxKQrJW/7ixtdlD4GgvSkCv+2ejXvc7n68AcsjKeWP6ju4sGe1SoiKyvNZroOGjKvlWwJij6X8rJ+701QIKwaOvxaO9qVA+AaMQBZVCLLFG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB9668

T24gMjMvMDEvMjAyNSAxMjoxNSwgSm9oYW4gSG92b2xkIHdyb3RlOg0KPiBUaGlzIGVtYWlsIGlz
IG5vdCBmcm9tIEhleGFnb27igJlzIE9mZmljZSAzNjUgaW5zdGFuY2UuIFBsZWFzZSBiZSBjYXJl
ZnVsIHdoaWxlIGNsaWNraW5nIGxpbmtzLCBvcGVuaW5nIGF0dGFjaG1lbnRzLCBvciByZXBseWlu
ZyB0byB0aGlzIGVtYWlsLg0KPg0KPg0KPiBPbiBXZWQsIEphbiAyMiwgMjAyNSBhdCAwMjo0Nzoz
MlBNICswMTAwLCBDYXRhbGluIFBvcGVzY3Ugd3JvdGU6DQo+PiBBIHNpbXBsZSB1c2IgZGV2aWNl
IGhhcyBhIHNpbmdsZSBjb25maWd1cmF0aW9uIGFuZCBhIHNpbmdsZSBpbnRlcmZhY2UNCj4+IGFu
ZCBpcyBjb25zaWRlcmVkIGFzIGEgImNvbWJpbmVkIG5vZGUiIHdoZW4gZGVmaW5lZCBpbiB0aGUg
ZGV2aWNldHJlZS4NCj4+IElmIGF2YWlsYWJsZSwgaXRzIGludGVyZmFjZSBub2RlIGlzIHNpbXBs
eSBpZ25vcmVkIHdoaWNoIGlzIGEgcHJvYmxlbQ0KPj4gd2hlbmV2ZXIgdGhlIGludGVyZmFjZSBu
b2RlIGhhcyBzdWJub2Rlcy4gVG8gcHJldmVudCB0aGF0IGZyb20gaGFwcGVuaW5nDQo+PiBmaXJz
dCBjaGVjayBmb3IgYW55IHN1Ym5vZGUgYW5kIGlnbm9yZSB0aGUgaW50ZXJmYWNlIG5vZGUgb25s
eSBpZiBubw0KPj4gc3Vibm9kZSB3YXMgZm91bmQuDQo+Pg0KPj4gRXhhbXBsZTogRlRESSBjaGlw
IEZUMjM0WEQgdGhhdCBoYXMgb25seSBvbmUgVUFSVCBpbnRlcmZhY2Ugd2hpY2ggaXMNCj4+IGJl
aW5nIHVzZWQgYXMgYSBzZXJkZXYgYnkgb3RoZXIgZHJpdmVyLg0KPj4NCj4+IGRldmljZUAxIHsN
Cj4+ICAgICAgICBjb21wYXRpYmxlID0gInVzYjQwMyw2MDE1IjsNCj4+ICAgICAgICByZWcgPSA8
MT47DQo+Pg0KPj4gICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPj4gICAgICAgICNzaXpl
LWNlbGxzID0gPDA+Ow0KPj4NCj4+ICAgICAgICBpbnRlcmZhY2VAMCB7DQo+PiAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gInVzYmlmNDAzLDYwMTUuY29uZmlnMS4wIjsNCj4gWW91ciBleGFt
cGxlIG1ha2VzIG5vIHNlbnNlIHNpbmNlIGlmIHRoaXMgaXMgdGhlIG9ubHkgaW50ZXJmYWNlIHRo
ZW4gdGhlDQo+IGludGVyZmFjZSBub2RlIHNob3VsZCBub3QgYmUgaGVyZS4NCg0KVGhhdCdzIHRo
ZSBwcm9ibGVtIG15IHBhdGNoIGlzIHRyeWluZyB0byBhZGRyZXNzIC4uLg0KV2h5IGlzIGl0IE9L
IHRvIGRlc2NyaWJlIG11bHRpcGxlIGludGVyZmFjZXMgYW5kIGl0IGlzIG5vdCBPSyB0byANCmRl
c2NyaWJlIHRoZSBpbnRlcmZhY2Ugb2YgYSBzaW1wbGUgVVNCIGRldmljZSA/DQpJIGRvbid0IHJl
YWxseSB1bmRlcnN0YW5kIHRoZSByZWFzb24gYmVoaW5kLCBmb3IgbWUgaXQgbG9va3MgY29tcGxl
dGVseSANCmFyYml0cmFyeS4NCg0KPg0KPj4gICAgICAgICAgICAgICAgcmVnID0gPDAgMT47DQo+
Pg0KPj4gICAgICAgICAgICAgICAgYmx1ZXRvb3RoIHsNCj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJueHAsODh3ODk4Ny1idCI7DQo+PiAgICAgICAgICAgICAgICB9Ow0K
Pj4gICAgICAgIH07DQo+PiB9Ow0KPiBBbmQgYXMgR3JlZyBzYWlkLCBzZXJkZXYgaXMgbm90IGVu
YWJsZWQgZm9yIFVTQiBzZXJpYWwgYXMgc2VyZGV2IGRvZXMNCj4gbm90IGN1cnJlbnRseSBoYW5k
bGUgaG90cGx1Z2dpbmcgKGhhbmd1cHMpLg0KPg0KPiBUaGUgaG90cGx1ZyBpc3N1ZSB3b3VsZCBu
ZWVkIHRvIGJlIGFkZHJlc3NlZCBmaXJzdCwgYW5kIHRoZW4gd2UnZCBhbHNvDQo+IG5lZWQgYSBE
VCBiaW5kaW5nIGZvciB1c2Igc2VyaWFsIGRldmljZXMgd2hpY2ggY2FuIGhhdmUgbXVsdGlwbGUg
cG9ydHMNCj4gKHBlciBpbnRlcmZhY2UpLg0KPg0KPiBKb2hhbg0KDQoNCg==

