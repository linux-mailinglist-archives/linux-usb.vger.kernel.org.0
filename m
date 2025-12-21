Return-Path: <linux-usb+bounces-31658-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEB3CD3C28
	for <lists+linux-usb@lfdr.de>; Sun, 21 Dec 2025 06:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95FC4300D4AD
	for <lists+linux-usb@lfdr.de>; Sun, 21 Dec 2025 05:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE06224B12;
	Sun, 21 Dec 2025 05:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="MRtAgBE3"
X-Original-To: linux-usb@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013058.outbound.protection.outlook.com [40.107.44.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96EB2236F7;
	Sun, 21 Dec 2025 05:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766296089; cv=fail; b=ckJ50nh/uhPBOw+hN5rkEA7ZA4PdKVYJs61/5tvkDJ9yZs1KxWD4b61InQgxiMsvXcPf6gXu7xv3LXr/k1+PafUiBbjqODDPGkFgrCFOtd52YGboB+9y95HVnfNYzp1eGzb6ClCpI/7wr7BNGkgpmhaoBTZcjAJbC+sksi9GNNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766296089; c=relaxed/simple;
	bh=1EkNoUTzCLSOuxL/u7JtzxkyCAuUDI8rB5CMeCFAz/c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aQ1Hv/i3PFs3DJBwLGtSI/vLkd9nAN129JR018QNM1XzkOuDsx9t1DvLuZdHPgYFZ1jW2jKspkoTVZpMD76dmnb01ho2KTxIEGiXbJPL4vV3vY61CDznE6KxsQSNsngh3Rh65hvyMMp4TIgCxycrK2r5QLRkXP39fE1wnuvGWrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=MRtAgBE3; arc=fail smtp.client-ip=40.107.44.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/yCqFvYT2fh2jKdO1WbvaRBwSRABTqRXmJGbSGsoafbd2T3H9NebmeEOkaETpgPTR8mHPIQW2gMwPkDe9aHfO1rxvO//uKMjhulLi6jSO5izfwaGEBU33hyqcRM9hoUPw2zSmTQPMQcjwqL0oFruWeCDCMxc0viWTvPYFE/ZtzgLhsEsa6m0/pTBYFmS2DyixmOFgeAEnlJbhllXdR8y88H+AaX65ncdSnJkuH6xy4d9zcji5Og6lyQZEGwB5zcsFFnOHnMXFwwMhodxyzbj8mn1k4t02/qhNiANAno66DyBqRAOsJvXhdTLiVWS6keMKUg3sBsdgCtpFcZc4fMYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EkNoUTzCLSOuxL/u7JtzxkyCAuUDI8rB5CMeCFAz/c=;
 b=EbpPV1Y3zkiV++lvXQ37L+/crE0QTT5G247wyZ1sNt5GFhrmErOIzCo4uwmXchqQPIGeezVOcomgxwNWSQ50qutUecaaSuH8u9Zf94vuCEh/tV+zRUXVPpbJj6aYhOrzywDhCZZpbgX46jhFleBuncRIWiwh0mRaRazJuSDElGe0pHqWGHAF9zWyEzR3GSOSNtzM+53pqRQbZgQbiLKxMloWdgtzXLQNys8fU9w6o5c2aiKP93my/qUFEC/8yU7hl/6OE6hVzus7AJhD6jSG4ztHT4xAyQ5/2k45dvdD4USHMSMXnIVSIbJ5RpRS+5n0n4ObH0zdPGHq3NcxRV/+FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EkNoUTzCLSOuxL/u7JtzxkyCAuUDI8rB5CMeCFAz/c=;
 b=MRtAgBE3hoacmBjOGhL6bBytp5Lb8mUtMRLCCd/hMKXFCzaIRbi1dGkHhW/s5OGzfmTDGvtocD56GdrE2+F/zXtRHqxsBd1z3ee17vujYfLmVj60IrrRCh0EbWBo3/u68aF1k6JklzzvQrK6r0t1jIrq50PXJaZc57TAThqNAS2ejQ6b06Ejy65woczQe4KamEJm55z3RZSIubi9J8oM4gOIThTT2CuXaG9CY+kFJtCaa635UPH2vHrbL12rq4fn7Fj0YuD/lsxFi0fvEima6djqXyxM5yiLwwdZvlGET7g0Sh0kZsN6PNPooVTLAI/DQdBz7UzT8y1pWfFQjGxlAw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by OSNPR06MB8212.apcprd06.prod.outlook.com (2603:1096:604:45e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Sun, 21 Dec
 2025 05:48:02 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%7]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 05:48:02 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Michal Pecio <michal.pecio@gmail.com>
CC: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman
	<mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sarah Sharp <sarah.a.sharp@linux.intel.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject:
 =?utf-8?B?562U5aSNOiBbUEFUQ0hdIHVzYjogeGhjaTogY2hlY2sgTnVsbCBwb2ludGVy?=
 =?utf-8?Q?_in_segment_alloc?=
Thread-Topic: [PATCH] usb: xhci: check Null pointer in segment alloc
Thread-Index: Adxwth5w6+XyiEy+T6yiUQ4BKIwQNAAL7kUAAAZba+AALNlvAAAicE2Q
Date: Sun, 21 Dec 2025 05:48:01 +0000
Message-ID:
 <TYUPR06MB621753BFCD4F56F189B9E914D2B7A@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
	<TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20251220141510.1bc1ef19.michal.pecio@gmail.com>
In-Reply-To: <20251220141510.1bc1ef19.michal.pecio@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|OSNPR06MB8212:EE_
x-ms-office365-filtering-correlation-id: 84f67c8e-7242-4071-9821-08de40548102
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WC91VDRZdzBiV3dTRzlBaVBwY051N09yd1dubHBnUDIxZlB6WlY1VzA0ZUk2?=
 =?utf-8?B?dllpMFl3SHpXc0tRNU14RUJrOUxIN2MxVTBSakg4Wkl1cU5vY01tZzN5TWNS?=
 =?utf-8?B?bXFHSHlqTmFjdXBnS3BJcG1jdzlqUVdwTk00ems4NmtaNC93ZEFYd0dWMWx2?=
 =?utf-8?B?ZFg1ekdxZWlGMzRLRUVibUJXbU1ERXM0UzgwZmdpYkMyK0RmMXF2MlUwUVB3?=
 =?utf-8?B?bW5lZWtFa1ZseUp1TS9IZi9JSkdESUNzOFlPbEhrOTF3elFSdVkwaHZWQ2JV?=
 =?utf-8?B?RzNEcVhWRVVxclB5S0NGdkhhK2FiSmFlSUtsNFFTRjJLZ1graWZWc0JyVVlP?=
 =?utf-8?B?ajIvTk8vYnNrMi9kQWpiUkpoWWxFU3BUcmJDdVBqTDBpaVd2c0VFbWZyMFpD?=
 =?utf-8?B?VkxVckFuSm5qZXJDWEVDZXYwc3EzN1VpMW15bVBtbG1RcVBPd1RZdk52MS9v?=
 =?utf-8?B?VjM3ejRlNS91emtmSzlmNnJNSWdoRy9CV1pac1kwRy9xR2JxeTZwZDI2VnBl?=
 =?utf-8?B?UnBvbFM2S2ZWQ1FsNllpMVROZVZsdHJ3UVh6WG1BdDZlK0ZPUklEOWlMVXFB?=
 =?utf-8?B?RS80dkNDd2lpd1Z6V0w4dy9Za2svRTk2T0VZNHUwZEpnUVEvWHVGemkwNTE4?=
 =?utf-8?B?TVFTaCtIWXJESUZKdVFiM0FXZ2hpS3Y5RmdwbEk4QzA4dzNORUtac3AwZXF6?=
 =?utf-8?B?ZzZ5NWY1a3c2cW5qc2M3T3ZOc1BPMGZOYXJUWnU1TWZHRHBZUUpyWTdjQnRH?=
 =?utf-8?B?WEhVeXh4YWpyeFhZcXFIc3lLcWYwWjRyN1p1bTJJUGoycVVPU0xMMDNVdUwv?=
 =?utf-8?B?Y3dHWE5ZbWpJaW5tWXEvZXJRZEpWWllvdHVYSG8reFZmSlFHeUo4dmx5aE1U?=
 =?utf-8?B?WERZS1lMcXFweU50NUlmUld4Y1JkN3lHcFhKbmV1bUFQT3pXM3UyV3dFZjVV?=
 =?utf-8?B?SmplMzhHbThkMlJNZnRJSUphWHhTZ3gwTElHYWIxeXFTamQ3Z0RGOTByWXBE?=
 =?utf-8?B?NnlNSEJ0OWJEUDMzOEkwVEhmUDlMNzJPeW5KZTlUa0pvTklYTFVuY0krSktN?=
 =?utf-8?B?d0dHWmU2V2JIbG9Pa2xMZGtGZ2lYQit1R1dFdEF0RCs2Wlh1WmdINDhmbE5T?=
 =?utf-8?B?YTZJc01BZVlLOWlCM2VHdkNTOGl2dVdXMU4vKytwK3VsMUF3dmJxTXUwYXpP?=
 =?utf-8?B?d2FwbVdkRjFERk54L0Y3MHNLVWVvWHFCUm9uSUpXbGgweDJvUFRkMXhZdVFs?=
 =?utf-8?B?YXYxRURBWCtWWEdaZmE1UnFOb3hvWDh6dEExUEF3WU81NTl3ck95Z2trY2ZG?=
 =?utf-8?B?Rm1XYmhMWWx2ZzBtemZEU0JYWnJTcTA4MXVFWExqczdTVnBwV1JZVGZITFhW?=
 =?utf-8?B?ZFJFOUpoYVVwcFJZUWU2VjNsemhwL3NDRDk3eHQ3L0dFZlNNRWhuYUJnSlJt?=
 =?utf-8?B?ZTg0WU5zT2FXU0R4ckZtWm1aYjdaQ0VrWm1uY2pKeEI5UVBrMTVDY1RZcnFp?=
 =?utf-8?B?clRjQzFCWWNoeFhNSGRJclQyVFNBR2xYNG1wNnR4bzZZR1lVczhZb3BnZ0Fh?=
 =?utf-8?B?UHpnZzBZeWJCV3pPTDVZM2d0Z3hpSnp1eXBzV2FwWW1uZlJ5eGhVcE9wbVU1?=
 =?utf-8?B?NlM4VUdQTXRYYm5FRC9QWnFqVHY3eG9zYXdkL0J1OHlobXVPa1JyamxmWGpn?=
 =?utf-8?B?eHM3VFFaVkJLcGVqQWdaRHJIMUtpWE93R00wUUZaNlVES09zNndnL3JmclNC?=
 =?utf-8?B?dmpkbnZkb0IwdHRsdk82SXF5VnV4MXg0Mmo2Q3FWci9weG0rNG5SQVo4bzEw?=
 =?utf-8?B?OEdaWVBkdTQ0Yjd2bEM3VjRqVmxMMGRBRWdCaDZXVGF6dHNGN2xTTS9VUGM2?=
 =?utf-8?B?MWlOZFo5ZjRCbHdRTUtwU3k2UVduMm92MGU1L3h6bG9oWnZ4a1loREZFaTVp?=
 =?utf-8?B?SXJsRlpWdmllWDlPcjYxN0tGaUlMb3hVM3RKRlFMSk8zR2JEZGlmWWJodTI4?=
 =?utf-8?B?T3BkUk5XL3RzbXVFcXZlWkI3azYxcjI4Kzk3U0xnazJCdFV6NUJ2ajg2aWVW?=
 =?utf-8?Q?EK3IxB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjI3aHhDY29TdURHK0pjTVhaOUtndG1ZSlpoaFNDSS9kbGl3VktzQ0JVb20w?=
 =?utf-8?B?dTMxb2JCQVpTM25OZHhKbDZmNmh4WW1HZmszUlc2Zm1Oc2hQYkRMMGUySHRw?=
 =?utf-8?B?V1BCc3p4RG9RUnhwY05hZm1nQXMrTUZSMi8xL0pwZkJFcmtJNk1EeHErN2Iv?=
 =?utf-8?B?cHlLQ3lZaEZkRkNkamQ4OEVJaHBINmUvTW9vcXFIQ0tNbnY4SitWUTB3dGgv?=
 =?utf-8?B?SEVhd0pMMGJoaXJGUldaNHJnYkMvb25DR3dEYkpSSjBEK3lQQ3ZtM2hKTk1l?=
 =?utf-8?B?b1g4SU9GMmc5a3BaZkxiN3F4RExBaWVaWXpyM2N6TEQvenk5bkJoMW8yWVMy?=
 =?utf-8?B?aWxCL1NmNC9DRi80OWlRRktMSWdSVTlBTG9JTFVKOEU3N0lJcWszOFAyMzR0?=
 =?utf-8?B?N0JtdjNSUnFMZFMreUZ3cTY4aUlDNUlwcTljS1J3QVF0K05HYlZXMm9NcTFk?=
 =?utf-8?B?U24rTzJNQWo2TnJaQll4dzdOU3AzaG83Q0FSZWUwZ1p1SVkwem9USnE0QWU0?=
 =?utf-8?B?Uk5ZTVd6cW8yQUZ1MkdPd01TcmZvV2dkWFROWVpKU2daaWlTbVNtYzJXQ1hl?=
 =?utf-8?B?dnIwT0FCbGpOcEZGeURUZXVNakN5ZlBFeEZOeE1zMktxbVlVMmNPY0g1RzhD?=
 =?utf-8?B?aVdNQnplRnpoOFJ5ZGcwREVvalkrZ1ZiYzNQdTZxQU0wRkI3VWsrdWxTZGND?=
 =?utf-8?B?WWpkakxuYlVvWDlLUklvOWxwS2JjM3k5bGdpQzRUNnhnTWtzckcrNTUyWEhJ?=
 =?utf-8?B?QW1qTFVFTnJtWWQyYnhtTnVBMy9KNWJOdEQwK2FWNzJ5SUwxYkl4ZEI5aTlm?=
 =?utf-8?B?TGNDdlo2RlkrTEZiZ01pUDZYVkZIMUhEYXAxQXV2NnM0NGM4TU4xZHRxTWg2?=
 =?utf-8?B?NFB4aEo1SDVWcEhENUU4Ui8vUUVTSktZWlJpcSttZ0RPUTJCZjlDYVNTVnR1?=
 =?utf-8?B?QUtJZUY2S1NQQklHZEo1OHA4eXBZNFJTbStEU3hJcjBrcElhb2M5S2txWTFK?=
 =?utf-8?B?WGtud1h0TVdobG9ReUs0L1lCdEZYRDRIZnV0NC9EdzI5NmN0TEd1d3ArbE9t?=
 =?utf-8?B?ZUJzQytRVU1tbmx2cEtjV3UwRlJjcDRwYzhVRHRSTVJ0SmcvdHZsRHJsYWxm?=
 =?utf-8?B?VVBvNm1VK2JaK0oxeFgvRXgvM0c2UVQ4cGFzNUlzdFFyeTNPeXBTSkNaOFZS?=
 =?utf-8?B?eE5yMlNsbjlUTWVCUXZUbUNzdlZOcHVwNjVGWlhIL1NXYnFVSzdLUHdvSWFS?=
 =?utf-8?B?TjErRUMvK0VMZ29SckZ5UHRwd1BCRlZXTDVvUWtsNkx5dmhQL0V3UFJibXF6?=
 =?utf-8?B?RlV0RWJKVkFlLzY1UXF3M2JjNndDK1V3eExMOXVGT0xQTEZnaVdSQmdXd2Na?=
 =?utf-8?B?Vjl1amlTemhTYXB5bG1zUFlRQUxxeE5yWUx0U1dFYVpOeksxT0ZtbE52R2gx?=
 =?utf-8?B?VG8yYTU0cC80bTdtaUV6K3NRQUNjQUVrbVNFb1BqWkdIVGFiRWV0Sk41Qmpy?=
 =?utf-8?B?SkdvSFNrN2tqY05xV3BYNzF3Y1JKOG0wcnAvUkpCdTIxeHZrVHQzdFYrSnho?=
 =?utf-8?B?UmQrU3lxVDVzNjQzb2pzN0U2cERxYnF2RUlsTXc5N1BKQjJQY1lJWk5XenMr?=
 =?utf-8?B?U0E5bjZpWkx3WUhGeW00TlE3UHZza0tYbWx2c1lnOEFqUEVXQ2FKbkV3YWVa?=
 =?utf-8?B?c3R6WENCKzY5ZVNHTVh6U0NXSDZyUDR1UW8wejFqaG5JdS9pRFpJbU4xRkk0?=
 =?utf-8?B?SVpoVXFjemZLVzJRTmg2bW51WUJKbTFmRzYrZ1JaZmQvV3FjOEJVOE5tdXh0?=
 =?utf-8?B?WHdJc0ZlOWF6NTU1WkZlTnZ0R0s2YUZXbGZDTFBtRi9NbkszdVlveWZ3TTRm?=
 =?utf-8?B?ellrMTlUS1lNRERBZlV6Q1V4cWd5MnpUMnFtY1I3dlk0RjJQa0s2cWx5MkNq?=
 =?utf-8?B?eXZ2MXhGZXhaYTQxS3ZIc21Lbm14bWVKYVJ1c1oxMDEwbHBXMzNsV3lTWGRW?=
 =?utf-8?B?WXFlbnYwYWZjNHlBazJxM200dFFPVXFIMTlHUXpVazlYMHVqVUloeVNrUEkx?=
 =?utf-8?B?YUx3RWJJQzVOZy9FdWRzS01Wa1dWU0lveTNWL1NkTGw2ZlNMa0JkR0dUczZG?=
 =?utf-8?B?ZEVuOHdSR3VMM1ZMamdiTVgrR1duYjFQNTc0RHB5bThMUy9JdWEvYUlnNW5I?=
 =?utf-8?B?c3RuaTVhRC9TM2ZOMm1jRzVYZGxYek56V1pMdVh3Nmdwa1pGT1FmOXdLOGVU?=
 =?utf-8?B?OGFlcGRoTE5VN044bUFSWE02cjF6bm5lOG9KY2xxdzhKeFNBWlZ1YjlaR0U3?=
 =?utf-8?Q?D3Ole9EkHvw0ZG3Kri?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f67c8e-7242-4071-9821-08de40548102
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2025 05:48:01.9026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8lMlfdXrFm649mjbNr8MabxrxmKUBiGc7Qxoh7yKYLe1HUl9XJwFFk58YDzbBp6LqSfyC9i9Ajv2juFmkDaIQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8212

SGkgTWljaGFsOg0KDQo+IE9uIEZyaSwgMTkgRGVjIDIwMjUgMTU6NTM6MDggKzAwMDAsIOiDoei/
nuWLpCB3cm90ZToNCj4gPiBbIDQwMjEuOTg3NjY1XVsgIFQzMzJdIENhbGwgdHJhY2U6DQo+ID4g
WyA0MDIxLjk4NzY2OF1bICBUMzMyXSAgZG1hX3Bvb2xfYWxsb2MrMHgzYy8weDI0OCBbIDQwMjEu
OTg3Njc2XVsNCj4gPiBUMzMyXSAgeGhjaV9zZWdtZW50X2FsbG9jKzB4OWMvMHgxODQgWyA0MDIx
Ljk4NzY4Ml1bICBUMzMyXQ0KPiA+IHhoY2lfYWxsb2Nfc2VnbWVudHNfZm9yX3JpbmcrMHhjYy8w
eDFjYw0KPiA+IFsgNDAyMS45ODc2ODhdWyAgVDMzMl0gIHhoY2lfcmluZ19hbGxvYysweGM0LzB4
MWE4IFsgNDAyMS45ODc2OTNdWw0KPiA+IFQzMzJdICB4aGNpX2VuZHBvaW50X2luaXQrMHgzNmMv
MHg0YWMgWyA0MDIxLjk4NzY5OF1bICBUMzMyXQ0KPiA+IHhoY2lfYWRkX2VuZHBvaW50KzB4MThj
LzB4MmE0IFsgNDAyMS45ODc3MDJdWyAgVDMzMl0NCj4gPiB1c2JfaGNkX2FsbG9jX2JhbmR3aWR0
aCsweDM4NC8weDNlNA0KPiA+IFsgNDAyMS45ODc3MTFdWyAgVDMzMl0gIHVzYl9zZXRfaW50ZXJm
YWNlKzB4MTQ0LzB4NTEwIFsgNDAyMS45ODc3MTZdWw0KPiA+IFQzMzJdICB1c2JfcmVzZXRfYW5k
X3ZlcmlmeV9kZXZpY2UrMHgyNDgvMHg1ZmMNCj4gPiBbIDQwMjEuOTg3NzIzXVsgIFQzMzJdICB1
c2JfcG9ydF9yZXN1bWUrMHg1ODAvMHg3MDAgWyA0MDIxLjk4NzczMF1bDQo+ID4gVDMzMl0gIHVz
Yl9nZW5lcmljX2RyaXZlcl9yZXN1bWUrMHgyNC8weDVjDQo+ID4gWyA0MDIxLjk4NzczNV1bICBU
MzMyXSAgdXNiX3Jlc3VtZV9ib3RoKzB4MTA0LzB4MzJjIFsgNDAyMS45ODc3NDBdWw0KPiA+IFQz
MzJdICB1c2JfcnVudGltZV9yZXN1bWUrMHgxOC8weDI4IFsgNDAyMS45ODc3NDZdWyAgVDMzMl0N
Cj4gPiBfX3JwbV9jYWxsYmFjaysweDk0LzB4M2Q0IFsgNDAyMS45ODc3NTRdWyAgVDMzMl0NCj4g
PiBycG1fcmVzdW1lKzB4M2Y4LzB4NWZjIFsgNDAyMS45ODc3NjJdWyAgVDMzMl0gIHJwbV9yZXN1
bWUrMHgxZmMvMHg1ZmMNCj4gPiBbIDQwMjEuOTg3NzY5XVsgIFQzMzJdICBfX3BtX3J1bnRpbWVf
cmVzdW1lKzB4NGMvMHg5MCBbIDQwMjEuOTg3Nzc3XVsNCj4gPiBUMzMyXSAgdXNiX2F1dG9wbV9n
ZXRfaW50ZXJmYWNlKzB4MjAvMHg0Yw0KPiA+IFsgNDAyMS45ODc3ODNdWyAgVDMzMl0gIHNuZF91
c2JfYXV0b3Jlc3VtZSsweDY4LzB4MTI0IFsgNDAyMS45ODc3OTJdWw0KPiA+IFQzMzJdICBzdXNw
ZW5kX3Jlc3VtZV9zdG9yZSsweDJhMC8weDJiNCBbZHdjM19tc20NCj4gPiBhNGI3OTk3YTJlMzVj
ZmUxYTRhNDI5NzYyMDAzYjM0ZGQ0ZTg1MDc2XQ0KPiANCj4gVGhpcyBsb29rcyBsaWtlIHNvbWUg
b3V0IG9mIHRyZWUgZHJpdmVyIHRyaWVzIHRvIHJlc3VtZSBhIHNvdW5kIGRldmljZSwgYW5kDQo+
IGFwcGFyZW50bHkgaXQncyBkb2luZyBpdCB3aGlsZSBjIGlzbid0IHJlYWR5LCBwZXJoYXBzIGR1
cmluZyB0aGUNCj4gcG93ZXJfbG9zdCBicmFuY2ggaW4geGhjaV9yZXN1bWUoKSBhZnRlciBmdWxs
IHN5c3RlbSBzdXNwZW5kLg0KDQpZZXMsIHRoZSBsb2dpYyBpbiB0aGUga28gcGFydCB3YW50cyB0
byB3YWtlIHVwIHRoZSBjb25uZWN0ZWQgYXVkaW8gZGV2aWNlLg0KSXMgdGhlcmUgYSB3YXkgdG8g
ZGV0ZXJtaW5lIGlmIHhoY2lfaGNkIGlzIHJlYWR5IGJlZm9yZSB3YWtpbmcgaXQgdXA/DQoNCg0K
PiBJIHN1cHBvc2UgZHluYW1pYyBkZWJ1ZyBjb3VsZCBzaG93IGJldHRlciB3aGF0J3MgZ29pbmcg
b246DQo+IGVjaG8gJ21vZHVsZSB1c2Jjb3JlICtwJyA+L3Byb2MvZHluYW1pY19kZWJ1Zy9jb250
cm9sIGVjaG8gJ21vZHVsZQ0KPiB4aGNpX2hjZCArcCcgPi9wcm9jL2R5bmFtaWNfZGVidWcvY29u
dHJvbA0KPg0KSSBlbmFibGVkIGR5bmFtaWMgZGVidWdnaW5nIGFuZCB0cmllZCB0byByZXByb2R1
Y2UgdGhlIHByb2JsZW0gYWdhaW4uDQoNCj4gSWYgbXkgZ3Vlc3MgaXMgcmlnaHQgdGhlbiBVU0Ig
Y29yZSBpcyBmYWlsaW5nIHRvIHByZXZlbnQgZGV2aWNlIHJlc3VtZSBkdXJpbmcNCj4gSEMgcmVz
dW1lLCBidXQgSURLIHdoZXRoZXIgaXQncyBzdXBwb3NlZCB0byBwcmV2ZW50IHRoYXQgb3IgaWYg
dGhlIG91dCBvZg0KPiB0cmVlIGRyaXZlciBzaW1wbHkgc2hvdWxkbid0IGJlIHRyeWluZyBzdWNo
IHRoaW5ncy4NCj4gDQpXaGVuIHRoZSBjb25uZWN0ZWQgZGlnaXRhbCBoZWFkcGhvbmVzIGFyZSBp
biBzbGVlcCBtb2RlLCANCmlmIHRoZXJlIGlzIGF1ZGlvIGRhdGEgKG5vdGlmaWNhdGlvbiB0b25l
KSB0aGF0IG5lZWRzIHRvIGJlIHBsYXllZCwgDQp0aGUgYXVkaW8gZGV2aWNlIG5lZWRzIHRvIGJl
IHdva2VuIHVwLCBidXQgYW4gZXJyb3Igb2NjdXJzIGR1cmluZyB0aGUgd2FrZS11cCBwcm9jZXNz
Lg0KDQpUaGFua3MNCg0KDQo=

