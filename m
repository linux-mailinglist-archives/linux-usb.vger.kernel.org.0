Return-Path: <linux-usb+bounces-31653-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ED6CD2E1E
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 12:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24BD6300EA22
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 11:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612982D4B57;
	Sat, 20 Dec 2025 11:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="AtY1TM2T"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012045.outbound.protection.outlook.com [40.107.75.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05E3134CF;
	Sat, 20 Dec 2025 11:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766230477; cv=fail; b=oGKmc0pBvgTeZt0rUpA+x3KaUyWkaEjoHQUHeMD7SqkqjxmHrUlBl5wjMxFfG7W4vvSyTPd7fec6TO41i/r4gKXlHSLhEmNsVxDqHvzvrmoMnURjdaf/Cev6//JKfoM9opnRM9ITpLqzmM7bILEtG19s+z/6LDimuvN0AlsSEdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766230477; c=relaxed/simple;
	bh=L0nDf2i7v3CdL2QFNG6TzL2XYMHGAg4cA5hmxGSISN0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=blRZ4IF7mdgdjUzcYUBWsh+qsad9NvmwPPUgoSzxxoq2oa7pH2Dp9XcfvBFJpatuztEgtspZ2/NvJG/SBpttT2AVuPqetw78hj0JVWFQ9Hb5AyJ5CZlbbo6s/Sc763FuksC/AUT7S84Lf8YIMZOyFHhobhDjfXr0883tOnmA3JI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=AtY1TM2T; arc=fail smtp.client-ip=40.107.75.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeGdUHCIiVAQ74rNa95G/nPbzfTaX+UfUzhlEP948ZobR82F+ujLMA9cIcrTzuQx6ZoXjkb3eHxSF48UPXyIbj9kEaoZHLKdhTDkT69dECcNKQx4C/qZQv27iOIKpUxeNf+U/EptrVPCvVQnwFJ3gaUCNQ+a9St8VJWcsoo2rI9S9Nsb98g9svly9nOJLJCgBtfAqhS8INhegjrXvbHRPdToGkVHeDry3FQAQPBIg5v51ZCW0VMv79RQ9Qs6wVJEIoFWQ68jsjmHH6fAGslHELuX0st0e6av3NzXYRvXHWtbE9v0ssA+MIp6hhAqKS4hg8mxVq62zBHXCZ42O4HeoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0nDf2i7v3CdL2QFNG6TzL2XYMHGAg4cA5hmxGSISN0=;
 b=G74Lv1fWtZ2VK41iSBLQDSfnJHCf4qsh2U9hk/xG7FqoUoSZV1sqCGI5Xwto1AzN+LSnzA663JCNbZJT3MnmTfVro1QC3w2ysW67SPoONgstqumOowFWBl37L59Wg2+bNjKPk1aX0HQNn2hPG5WARiQHXmy8SMocmy+ShYmlGDskVkFnxyMeMASJkpmlRpIkFkOhfpqe0tPdpxOl52gTFx8pXsSWZkp5Av6IFxerzmqeFqUQI41QU5Bz40Gf6gYCQyzYQmxQSboB0GTrNS6Ig5+uHtBySuY4h89uS7ploY30HKxaqu15jN2oQ+sH9WOtpjebcLufAtXFQQ3W0p1Hyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0nDf2i7v3CdL2QFNG6TzL2XYMHGAg4cA5hmxGSISN0=;
 b=AtY1TM2T2vM1K5PZiJcljGvTF3yHX3s7gSXgDU2Josk1a/cum+D5N5psELZ95UdJg1ULpN8iLlxZlG1PA2Kh+G+ZHHAHaI9XsF/+H67dBWbVQNZ1iUB+buPNWiCvOJqMOD+8f6p163N4ZPo6egz3e6s//hipTIufmSEkka80DArNjOTpuBU77K9x/fE0q5RUQKM5LvQlZtlC04fYIUy7SHbOR25irZRtqVrc5KlJV9J4pvhKjmz+cV2wSIe+J3Zgdm8q4wB8oUoYf9twOx1MLQ17d2KlU9Y2iHwlze2AKcENV0bJFYFxkVXZvvPbYL7rL/z7IF/XUOoIvDKLOWuh/g==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by PUZPR06MB5748.apcprd06.prod.outlook.com (2603:1096:301:f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Sat, 20 Dec
 2025 11:34:31 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%7]) with mapi id 15.20.9434.001; Sat, 20 Dec 2025
 11:34:31 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman
	<mathias.nyman@intel.com>, Sarah Sharp <sarah.a.sharp@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject:
 =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSF0gdXNiOiB4aGNpOiBjaGVjayBOdWxs?=
 =?utf-8?Q?_pointer_in_segment_alloc?=
Thread-Topic:
 =?utf-8?B?562U5aSNOiBbUEFUQ0hdIHVzYjogeGhjaTogY2hlY2sgTnVsbCBwb2ludGVy?=
 =?utf-8?Q?_in_segment_alloc?=
Thread-Index: Adxwth5w6+XyiEy+T6yiUQ4BKIwQNAAL7kUAAAZba+AAIiYBAAAHGDLA
Date: Sat, 20 Dec 2025 11:34:30 +0000
Message-ID:
 <TYUPR06MB6217F77A2EBD586FE8B4CA3CD2B6A@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
 <TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <2025122014-whole-walmart-f63d@gregkh>
In-Reply-To: <2025122014-whole-walmart-f63d@gregkh>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|PUZPR06MB5748:EE_
x-ms-office365-filtering-correlation-id: 67014243-e1d4-4604-fe30-08de3fbbbde6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZFpvbFJWSmowZno3ajE1UHgyNTZtb0xZNGd4M2didVNiOFpJeUU1Z28vbFVt?=
 =?utf-8?B?MXk0T3VabEhYbk9YSTNKMGZ5ZXVnTlZqRHRGUDV1WldidXNkSnJ4YmRHd0dr?=
 =?utf-8?B?bXB2MEY4cDFTYVhzeEVPUUgyN1FHL2JPUXZDanZMR0Y5R1Y0bjl2QUw4V2JH?=
 =?utf-8?B?Nkp5dEFzOTBuTGRFcWZmazVFV3F5cjVUY3ZUN2FhclZjTEFqamhFVzVPeVJj?=
 =?utf-8?B?OWpoVkpsSU1sdnAwN2s2cjhrWGFDS0p2UnZxNTI1L0NFbWVFanRoRERjeHFB?=
 =?utf-8?B?SzBUaUtRaUJHaGdpZ2dFVVYycHB1SDdSK3BvVmUzVHFTNG8xVFYyRnQ3cGpo?=
 =?utf-8?B?QWxoSjVnZlBPVG5zYkR6d29OcUQzNHU4a25jOCtJTTdHUjU0N1gyTndzTmdj?=
 =?utf-8?B?MHhMemFuayt1SGJ5T1QyK1VLbGJ3cGNqOW1PUTljQjlLS0FLWkNxQXYvVUZ4?=
 =?utf-8?B?WmJWNHhDRmh5clB5WEFaTDEwQXJDMU15ZlZUVnB3bWcybnhjTjBidnJXRnhI?=
 =?utf-8?B?Qm1hbUh5V3B4TGlrbjZkS2tzb3UrMWdwdFVxT0ZzMXhubVp3QWs2OUN5emRu?=
 =?utf-8?B?Y2pDV0JkT3g3bTdkNU5JcGRzaGFtTkJyc0xPK2dDM3B5c1B5QlBhSXlZZlJ2?=
 =?utf-8?B?MkdDalRiOU84Nkh3dmo0ZENydzdLZ0lvV3Jha2JRWFZqRlUwc2hPWHVlTno5?=
 =?utf-8?B?b0dFUjNPK0xDR3ovRHJqMG9aeTVvZW9WRGFMbXhqQVhIU0lWOW9CYWlFOXhV?=
 =?utf-8?B?cXkyZk5RQ0lrbjBjUzhyS29wWWZ6aUpKMlJIc3Z6aGJBdXlqRy9PMDBRTStB?=
 =?utf-8?B?TzBOUzFtMHZlVlpXOEt5bFRSTUxZZ1NDNHd4aVJMcG1VbFVCdzE3aUREUTBk?=
 =?utf-8?B?eFVPbkNQdFRuUk53OGRZaGtQNzNlZFRKd3p2Zi9jTiszWERadzh0QjlGS1A2?=
 =?utf-8?B?NEx6dDEvL3Q4eDQ3TExNeUF1dXFlc1o4eEUzTURqS2ZuVEF1aEVSTE80ZDJO?=
 =?utf-8?B?cG9mdE9qTjd2cXdEUFF5bnZacDlSVEpiL005dG9oaCtydzMvU1FDU1NzNWNj?=
 =?utf-8?B?K1dJL1QxcnIwaFV5T29sQUpGZ3RVbXZEa21jZUhMek1udWExVnJ2a2NJRk5i?=
 =?utf-8?B?WFNqc0hablhuM2JTZERnZVVSVU05LytmWnRLMzcxd2lVK0xSUWFUQ25yZkY3?=
 =?utf-8?B?cUdmb2wxUFpwS21neC9UZ1haRmpndzBoaE53UXJQNTZWekdMNjV2MnFtTTZR?=
 =?utf-8?B?K092Q0MydCtpSFpFTERLZ0h6Y1owY0MvTVRmU0hsQTZ2dnFqN29ZN21jL25q?=
 =?utf-8?B?R2xSSnRvNDZ1QWREWFFwUlUzWFltN0gvZzc1NkNEeitnVm83Q3ljKzRVMXpO?=
 =?utf-8?B?Sy9RM3lMM0xDN1hvTXl6OHZZekRHek16M0YrdTE5T2ZVdFIzcURiYVJhWThY?=
 =?utf-8?B?dDlmQ3YwUm1CSTZKUzlmTlZLbjZyQmd3NWsvUnBJZlBTaW9xZ01peHZYR2hj?=
 =?utf-8?B?ZzV4YUsrNEEvQ256WUMzWGMwSG1FdTFHTTB3SDA5UjhrV3Ztd1FKWlFEQU56?=
 =?utf-8?B?cXFmUHRuMGROYlkvWnpnZmhVL1dwaWhmSnhUZlg5ZWxhUkl1Q3dYcU5CMzVB?=
 =?utf-8?B?MUhOS25TT0ZaS1ZtNkR0bzdNSmt3WTZ4eFhoTDRjSDdKb1Zaa3lld25qbS8r?=
 =?utf-8?B?dDNmTzBDS3YzdWVyWmZzV3hmc2NBVmRDU1k0L0RUa2NCcmpwZFA0OFNwWTZR?=
 =?utf-8?B?OGcyUUhSOE50ZVZRTmdRWkpkTlZXTVJmblR5eHV3SVdTQmp0MXNWWDloRU94?=
 =?utf-8?B?aDZjU2pMUnpFbDY4c1hNd2VGN0UyMmxkWk1teFdPOGd0SnBSVHNpT2RHVFRJ?=
 =?utf-8?B?MVAvaGdwQ050a01ERkMzaXVSNk5JM21EVWRSTjlIVys0YmN5ZEh4cTRoN3N4?=
 =?utf-8?B?a2x5Q0NRRkNnNmd1aUYwR0NQMFZjemZLNk5RR3o0UUNEaGlhbFJyOGllZGM1?=
 =?utf-8?B?SlRUV0tjWkgrS1VIWXM4bE43TlN2ZkcxeVdhZDh1bGpkcWVWMkJjRjJMY2kw?=
 =?utf-8?Q?adEf4k?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TlRSMUVNVlVQcHV6a0VDTUE3OEpaT3FBY0JGNEpQMEE1Z1FhVkpJeVR4U0Y5?=
 =?utf-8?B?MEw3ZzlWTFk0bFRTcnZEbHp2cSszUnVCWjExblNCVXExTVhqQlNZcTV0WEs3?=
 =?utf-8?B?bUwvZkExdkU4dmxuM3pSc1JiNDRwWnh0RkhYSTZXVGthZEd3RWpkVUNmTGVD?=
 =?utf-8?B?c0xJQmp6SkRhdUJRSStkbzBQMWRDNUVtc2l1aDJGNFBEb2x3Q1RGb3R6WkM4?=
 =?utf-8?B?NU9XeTl1NWlxZ01LQzZlc0g4cjZhUmE1WGNTVU1sK1hRcTExcXBNZ0tpZm5U?=
 =?utf-8?B?bi9HN01nL1pHYXp2YzhRai80VmUvazdia1RTQzVSdTFNZjF4NlY0TjZKOHA1?=
 =?utf-8?B?S2QvdCtyKzM3alJONU10czNqTlNvZUY4bGV6WVpEaUZlR3JrRUE3TmZkTVY0?=
 =?utf-8?B?L1pIa1NZNEt1c3JWanlJZkdsaFRjQzdsSHdhTHZ1UmsvampkcXF0TWRNVFdt?=
 =?utf-8?B?cUhRK2RXZjVEWlZzZW9QMytYN21ZL1l5N04wN3ViaWNxLzZiRW5xREV3bEJv?=
 =?utf-8?B?eWNGQXBTQUZMakNOd2IzVzlJeDRtbnVxMXRiUDVNNzB6MHJCdlpneXJNbVdy?=
 =?utf-8?B?TzY2YnpDMXVqZDM0TG5wN295VkhYekgvS0JxS292TlpUait5WHRoUlk5OHQ0?=
 =?utf-8?B?emJJNGoxY2dxSVF2ZGJ5b2xiU3hZMCt6N1lqWkdjYWVsREcycVArTDZtOVY1?=
 =?utf-8?B?eTFQNFJYZjRPUklNaWNZbWZ6U2J5UXpwdGs4c0pwSGQvcDRzb3pCb1NnQUEx?=
 =?utf-8?B?V24rYW5hMzdGSmdWZ25lcTdpL2tWN0MyUVNINHEvbFNMVmV4QkNXRmtHdS9H?=
 =?utf-8?B?dXg1dHd0NVNEZGlvRjBrVWR5YUVOREVMYkpVOVZBR2QvSmYvVktoZWI5bUxj?=
 =?utf-8?B?bFIyaWk0VkVuVkRCRHppQWF6bWhZRkJHSmhRVjhRK1RDdnpxNGQ3cEwxT1VO?=
 =?utf-8?B?OUZrVzA3eWxzaXdzY0NLMEYzejJZVjlUV01OaGVVbzZVYk9NMjNVYmYvMkFz?=
 =?utf-8?B?cWsvMGYreUNidjZTUVFEVUhuVTF0V3dxVlI4YllBM2VuUzdORVVGTWdQdDlZ?=
 =?utf-8?B?T3RnclpZMExKZEJUS050aHREM0JvSnhmNmw1Q2FqaUl5L0VwQmFOSEtQMTZ3?=
 =?utf-8?B?MDRCSmNrdEpmTUlDSEJKUGM1UVZxdDJmZ3NvbHIxcTlnVTRSQ1JWbm0wdmdi?=
 =?utf-8?B?UTFhWU9teEJqK1dhWTNGamk5OVlJcWlmVFphRGhzZkM0OUNjK21CN3pmUVJY?=
 =?utf-8?B?UDJROTQ1d2lqK3RsZCtiUndKNFVaWUs4cnFSZUxmOW80UnBiQ3l5ZS8reSta?=
 =?utf-8?B?aWp6RUxSSlp1MmQxVndmdzhaOG9nS01mQzkxalpsREpTNk9Oc3dydTNKRTE5?=
 =?utf-8?B?aFNMbUJLWHJWb3djTU1CeHlaUEk5V09PaWFWWWlNbnJZQllUUERuL09HYXpy?=
 =?utf-8?B?VmZGdFFXU3JaZmJ1di8vRXNlMFZTMXdRZWlDMmI1cEJHWjdDYnZFNmZ1T2xp?=
 =?utf-8?B?L0I5YUFsU1E0RDgvSE9odyttSGk4RUVpTXoxMzhnckcycGtGVGVmNkUvSG1v?=
 =?utf-8?B?Q2lQbW5oT1pOOGVYckphN09QYk5XNkVHdVgrOGEvRWFiTklBdXF4eUNaUVNp?=
 =?utf-8?B?K2FOSWZuSVdPd0cwNDY4QkZZcjdST1RnZHBMcFluNzJ5SFBrS1ZDdFFhb0xv?=
 =?utf-8?B?WXpzdEllMGdzejdWZUk3aUlkc0tGWG9BSkdEVUVVNFg0S3kwVVFVajdXaWdH?=
 =?utf-8?B?bzU5M05rZTFhUU0rcXZDK1M5bU5SVkt0TFpvNHRzd3EzeTAxYTF0UGNsZVQz?=
 =?utf-8?B?MlhnQVh1MWk2WTc2dWVTU003RUN5UFdLaU9MbHZsVE80STlKSnIrdVQ0dlU3?=
 =?utf-8?B?OTRCeG5tR2tCK2xuQy9DVmxZRXFVTTFMTytKcldydnU1R1hiMm9UdFgrY3Yy?=
 =?utf-8?B?TVN6c1ZmdnZMOGtIVHZDditPa0c5TlZsR1F1K0FWOVo3Yjl3R1hHMXZIdmo1?=
 =?utf-8?B?bEZmei8xWHpvdHUzeW5Pa0pIcWVvWTFldWthclZzbVNHb0NaUDRHSGlnZWt2?=
 =?utf-8?B?V0ljTG9wTXptVFl6cDlQelFuL2M2LzRQS0JNelAzYkJoT1dGS3BYUmZrbnAv?=
 =?utf-8?B?ampVNTNjUUZOMkdLMTdOdk8xTUNOMEVSdGhGNy9KeithbFZabkxHeDljNG5z?=
 =?utf-8?B?ejNpWEVVTit1T2NpNU9TUkhSNEs0Tnl5Z3N1Yk0wcnNJSmF2UWZ3Vit6d1pt?=
 =?utf-8?B?Zm9Ob29wTTg2S0k5NTFMNE84QmdMeDFWb0tBS0VIRGtWaVd4NytOTmN4eFJL?=
 =?utf-8?Q?RAlU2XSBndcmQywnaf?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 67014243-e1d4-4604-fe30-08de3fbbbde6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2025 11:34:31.0309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q+S4a+20OR1DAwxDJNsAPeApgvVcQBL/S7ljY/zx6WwkdtF9CrMMfsYqwFgl42kcOVnAtBOE4NwxI4u7eh01UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5748

SGkgR3JlZzoNCiANCj4gT24gRnJpLCBEZWMgMTksIDIwMjUgYXQgMDM6NTM6MDhQTSArMDAwMCwg
6IOh6L+e5YukIHdyb3RlOg0KPiA+IFsgNDAyMS45ODc1NTNdWyAgVDMzMl0gQ1BVOiAwIFBJRDog
MzMyIENvbW06IGluaXQgVGFpbnRlZDogRyAgICAgICAgV0MgTw0KPiA2LjYuODktYW5kcm9pZDE1
LTgtZzQyZGI5ZWNiMDM2Yi1hYjE0NDg3NjAwLTRrICMxDQo+IDM5Njg1NmNhNjg0ZDU2MGY5YzI5
NWI1ZjFmZWVlZDQ2OWVmMjU3OTQNCj4gDQo+IDYuNj8gIERvZXMgdGhpcyBzdGlsbCBoYXBwZW4g
b24gNi4xOD8NCj4gDQo+IHRoYW5rcywNCj4gDQo+IGdyZWcgay1oDQoNCk91ciBjdXJyZW50IHRl
c3Rpbmcgc2hvd3MgdGhhdCB0aGlzIGlzc3VlIGV4aXN0cyBpbiBib3RoIGtlcm5lbCA2LjYgYW5k
IGtlcm5lbCA2LjEyLg0KV2UgZG8gbm90IGN1cnJlbnRseSBoYXZlIGFueSBwcm9qZWN0cyB1c2lu
ZyBrZXJuZWwgNi4xOCwgc28gd2UgYXJlIHVuYXdhcmUgb2YgdGhlIHNpdHVhdGlvbiBhdCB0aGlz
IHRpbWUuDQoNClRoYW5rcw0K

