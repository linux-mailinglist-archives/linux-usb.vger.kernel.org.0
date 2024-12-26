Return-Path: <linux-usb+bounces-18815-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3AC9FC8E8
	for <lists+linux-usb@lfdr.de>; Thu, 26 Dec 2024 07:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBB85162C27
	for <lists+linux-usb@lfdr.de>; Thu, 26 Dec 2024 06:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8BE155A25;
	Thu, 26 Dec 2024 06:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="kCckcnX2"
X-Original-To: linux-usb@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2057.outbound.protection.outlook.com [40.107.215.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F6717C77;
	Thu, 26 Dec 2024 06:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735194126; cv=fail; b=YX9VEdpCIhprAIU61oJxjGpi28Bv5WY7f0BRAbSFR99BrJaTV7kQ3uW1foFy9sS6oOu0Dw6Pz72TJ4JFQJQR92W30t3qcoTO5TZsu6BSFAuZaD4s/ghwfaD7qvndaDCvUJz6vLwlqJnfm6ll4ioqnfmhKaEdCoz1PiJyhZJlFXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735194126; c=relaxed/simple;
	bh=2zjpisYZY2Xhr5u3zF8+b3sDeO5nbXJuC2nyYdG7uEA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GEg0IKQljJ/N13N1a7KOW5UZrXls1zO2if4dY4e90Wobqcas01VZJvW/dz7e4pwFJgqmoOFYGQhUnsBTOrPbl9Hp4YgVlW8WBfT2m/sdGyEgmfeJuuN81c/YQXo26M35/KFn/SNjjqBqI7I02ESoRWsCUht4vIQJBCvShNYU+qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=kCckcnX2; arc=fail smtp.client-ip=40.107.215.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLVJk0rV6eupHBAqhxyfgPTYYdfqVd/d8E7a7V85vVGHGAksa01zv946I/OtML33PMNooh5aDGtJbzvcRFDLrxp1mrIDx4oiHuybY5mFnGlg9udWos9kVft5lf4SEd+1Lj8rnr52FI7glzDEL8LhrS7JhlDYRMv6j+5/vZ7IP2940nBIrEgjPu5uycubxbjYKpXT9GLo7Z214zpLBMfFt28BDhQd9CNY42lbnFQ/QlEaJitd2BS5QjZn6zki3J9n24Xdf+fvbo3wS9Ei2XonuIfPZ9EUCR+PVPGLqpOhrT/uUBWNBGWLBRT0PSqWEVoSftNXnHSRPA9hIAoQCUgMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zjpisYZY2Xhr5u3zF8+b3sDeO5nbXJuC2nyYdG7uEA=;
 b=tHPa1DwWwBErOJHsXTjUpKLDwqlUPfHROPk5OjJAvT+/K0pDU9X47vEgm4YydTrBHny62P6nDvMVfWTMnJo098lPDOGkCJbrYFlxizX9UHGUVva3L4fU7PDkCUcjjZEDWKi97aiB72Ikmtv9X6hLpjY36BCDaMYtcwXQwJVeisKOg/aG9MKcnxbY3AK0p5r99H6r7AJ/xz+ZireqBJfL+bCpBawEBmPAtIMlhtegOvnEBaX6FnhatMjMunzwUhoMGSChx1YAIv60vvC6XzA1ReLy4LTg1uXEUDvsHi52qFR6mDfOMEQhvmkBRqMBy5i8VJx9t0KGuPkNVnBtByu4Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zjpisYZY2Xhr5u3zF8+b3sDeO5nbXJuC2nyYdG7uEA=;
 b=kCckcnX2ZuN8F8lGcYV0mmxpekZbvBTgOH2p/6O6ZAJzjJd53xlWYR3lj2EnC5xokJTgOgb2mHx/cQGQOlKJx7uKulnx+xM3jj0edt822I+EeYEU4BC05oer+Hm2eVopaalf9oSrHKCph42CiVEH8vDiCuIU4GOFm8JPUGjM77FarBDwAeY8Xp1/b5i4Uf4mGz+v9x4qUhO+Svx5RRF5RQdvQbdKmemOWPOK5IVt1BLCYcUwMvzPz6SZIXv53nTbIjg2v38n0zkeYdJWE1rXPf9VSki0n3NgapxCd+N7jTM0rfdDlGs5oIzg/uGwvf7z7Ty3rbFfRV6NN7bhu0j/Yw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by KL1PR06MB6370.apcprd06.prod.outlook.com (2603:1096:820:e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Thu, 26 Dec
 2024 06:21:59 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%6]) with mapi id 15.20.8293.000; Thu, 26 Dec 2024
 06:21:59 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Prashanth K <quic_prashk@quicinc.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "mwalle@kernel.org" <mwalle@kernel.org>,
	"quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>, David Brownell
	<dbrownell@users.sourceforge.net>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	opensource.kernel <opensource.kernel@vivo.com>
Subject:
 =?utf-8?B?562U5aSNOiBbUEFUQ0ggdjNdIHVzYjogZ2FkZ2V0OiB1X3NlcmlhbDogRGlz?=
 =?utf-8?B?YWJsZSBlcCBiZWZvcmUgc2V0dGluZyBwb3J0IHRvIG51bGwgdG8gZml4IHRo?=
 =?utf-8?Q?e_crash_caused_by_port_being_null?=
Thread-Topic: [PATCH v3] usb: gadget: u_serial: Disable ep before setting port
 to null to fix the crash caused by port being null
Thread-Index: AdtXXi0kLu0avjanQDOkltAhHlIqag==
Date: Thu, 26 Dec 2024 06:21:58 +0000
Message-ID:
 <TYUPR06MB62179C7116B4A209AE711430D20D2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|KL1PR06MB6370:EE_
x-ms-office365-filtering-correlation-id: 5ce7782d-c643-4245-087e-08dd25759a7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z0lJWjBTdUxXQngyV2lBSDkxZEFNRmZpakpXK1FIaU1iUzdKTUZKeUQ4UW9y?=
 =?utf-8?B?QkV2MlN5RzNTRWxHcVdPNWlidjQrY0NGOFRSMUlNRUZocHpRVXVhVVFwK0Rh?=
 =?utf-8?B?UE53TlJ1TUhkWkRSVFRrdUI4NFh0MU80ZDNta2VlY3ZUYk9NL0RKWFNtZzdD?=
 =?utf-8?B?NUxmWXpXRy9qdnFjbzFseXBCc3lOWDllS3EwcU5Wdk1TdzBNRXp4N0JZdlpy?=
 =?utf-8?B?ak0zL1FuWXhIUk1ySUNjUXRsMDRSaTNtV1c1OWRrREhzUHJwTEdqcUp2ejFV?=
 =?utf-8?B?ZEE3SmIrdmwxQldadmdzRkdvMWlPOFBPdkN2cEJOSkROb2J2MmEzTnF4bWUw?=
 =?utf-8?B?OC91djRldEt4RHZLUjJJallRUVhrMll6YzZxR2tLSGpJNkpPdlpyZVByOWJs?=
 =?utf-8?B?bkVIcTM0cmFpTFpCajlYbnRBdnA4R3loNm9MK3ZHMzU2R2x0RUpEK2pnelF0?=
 =?utf-8?B?L2VTS1dvM1R1Yi9oeVZ0ak5FWnZ5YXg0dFhLZnJ3dVNQU001WU1GME9ZSExz?=
 =?utf-8?B?bC8rbVRrcUgwazNCdVVXSnY5cW56MHlFa0RsMHAvM3lZT1owMTZSNG9kY3Z1?=
 =?utf-8?B?VDBxYTFXOXZUMWpXN0FHOHBFazhrTnRYQ1VUYW1PbGxPRXlLOGdnelVRTGNB?=
 =?utf-8?B?NFhJc3FicnZpU3Jrb1ZheXZwZGJPb2JWSGNnRmN4Y0ZjekRaQlNJR1diK095?=
 =?utf-8?B?QWk2aW1na1RRajRlZHJvSTl5eHkxUmM5SlRWQXRadzNlOUZPRWNPWHBoZnY4?=
 =?utf-8?B?R21nNXpyNGx1b1JiSUFkTFNDYURqRXNDaVdScWYvb29Yd2x2dTJQdXlxd05L?=
 =?utf-8?B?bWEzU2NCcDZUQnk2aGp1SEdVNG9JRFlCNnE2bnM2MnArRXp5aExMdDZ4eU40?=
 =?utf-8?B?aENicU9yMEx1c3pZZVgzejZHa2oyRXRObUlOYmJXcnFFUWZuWE9IN1V5enVi?=
 =?utf-8?B?TTZFL0NDY3BMZC81cld2WXEwS1pPSjF5U3VTWjFWNmpDZEo4TVNHaFRmUjgw?=
 =?utf-8?B?Rm5ZK0E2RHpQSUprbU1YUGZreVdkQUN2YVdqZEVRUXpGQjR1Rms3MVE5eS9X?=
 =?utf-8?B?bVFCR3VZMGJMNlNNcTlEL2taZEVZRnY0K1R5QjcwTlNCUVo0WHg2SUZOYTYr?=
 =?utf-8?B?eUJmSWdGSEM1R1pZQVMwaVlpdjBCUXlpVlBFTXBPeXBhV05Fc1cwQk9uL3NR?=
 =?utf-8?B?bUtUeFAzbFJTT1NiUEVMTE5MMk9JVnA1YXhpKzZrMTZ6cDl6clJUWjB5TndS?=
 =?utf-8?B?NGJSVm1XV2ltajRTYzFUbEoweG45SXUvZEhrNXpPZWJNMjJ5a0FxRjhISTFE?=
 =?utf-8?B?YktzRUdyMERkT2UwTXZiemE0RFpiVEUyL2dIMVpQdm1MUzI0c3RySXFES0tQ?=
 =?utf-8?B?UHpWSlZiaFlpQTdpdWluWUl2cVdCNlJnR0ttL3ZabTErREdTbmExQjRieDRm?=
 =?utf-8?B?d0lXU1ZZbFBlcUdJM3JTdi9PQjVOOStMaU56ZHg2WW1VVVJMRUJMRHUxQ1NM?=
 =?utf-8?B?bkVTenBoVTdqNjlUMHFNNFVJYy9BeWZKK1VycThRS0NyYnZaNDd6NWJHek5T?=
 =?utf-8?B?aGUwbUsvalpaR1pEdC9Ta3IxOGNRRUtTRmxDeEJtNDMrVGxxTUduc2lMKzEw?=
 =?utf-8?B?ZXkzTUVaV1EvTHNQTTJSRllPWG80azRSaC9HRmJnRy8yMHpiTXNRc2s4Zk5X?=
 =?utf-8?B?SU1CWldXMDNHWTlzbjFrNWsrVTBWQ0RuTVpDYU55QkltdlgvRHdkKzFFUkpv?=
 =?utf-8?B?SkJZK0tSZ2R4aTdPUGpQZklnV1NnN0cvSlROejlZY3NBM2o1MU1NK3VHUktG?=
 =?utf-8?B?T3Z4SzZBSVVQeXJFRnc4Q00yZjBBSkhGN3dVL29qL0xjWEdBeDFnOVIweDV0?=
 =?utf-8?B?N1pVY1RBa2xtQ3ZoaGpRTWxyODZNSG1MdEZwc0RJODRIakNpbmxydEdhUGs5?=
 =?utf-8?Q?mBgqqJUaOYS5sBzL3+a/4C+CdzQ3BOBO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDZnckR5YkxyNyt1UGF5SW1va2hvQXFEejE3YmxBSFFJVFJNL2dwdWdaQmpS?=
 =?utf-8?B?MklKRGtRSTRXbCtrS1hVQ2N2VTl4U2NWaXlSdXRWMmNPRzBNSFdhQWkwRXo2?=
 =?utf-8?B?U1V0aElUek9ERUtMTW9WQ3FTVThQYWt4UHI5aklHZTdrcllmbjF6cENaREFG?=
 =?utf-8?B?RGVhL21SK1djZmtFUS85aE0rbkpVdnhqT1dlQS84ZEtGNGRyNlFFbFVia3lD?=
 =?utf-8?B?dTVnNDNOeXpxS3Vqb0p5VVo0T1Zmdi90Y29QYk1IdmVpS2ZTajd4Y2Y3M1pj?=
 =?utf-8?B?ckR1ZW5HNWxXZHE2WWJiQWRQdjVLNjNkTnlCWlJmS0FYOXF1Z2JRZ1lLY3NG?=
 =?utf-8?B?NU1iT0plVzFPd2xNUmN0dmh6L0E3QzJVeURzN2VGUzNLdjdlTm5peWVmWng2?=
 =?utf-8?B?MHluWGU2c29scVppQi9iV3JIRkV5VEdBZStPUVFGMDBnWTR3aVUxV2pzWXVh?=
 =?utf-8?B?QmdIeTRIakhNbkQyUmNMeHozUW80MkdZU0psWGd5L0tjRjM1dmw4bFc5YitW?=
 =?utf-8?B?VHlOSnAwaGVyT2QzakVvaFB4WlNHMGQvUDhoT2I0d3hCSHJGSWh5bW54bjUw?=
 =?utf-8?B?bS9xdFpYSmhVVFZlNzlURDVzaWMyOG1SMW92c3kzbU45TlhJR3lwSTZyb0Vm?=
 =?utf-8?B?MEg2SDZ6NEtXSnBvQ3pxWTBlWjBvcnZtR1NjSU9zZXdaVE95TUxCMEhoSXZl?=
 =?utf-8?B?d0Z6eXJSTW4vUVNCTVkzamN6UE5pSUpkV2paM1JoSzVIY3NLTmZvVGZkbzAx?=
 =?utf-8?B?ZU1ySTlFaUpIZnJQMXZFQVZpTjFWZTA4RHg3UE4wcmtYUkpFR3JzTjd5U3lq?=
 =?utf-8?B?U0lNY25YUFhsS09uMnhZZ3FRQVorRlZGdWFuUWVucS96ZnVCTElmR09zQytu?=
 =?utf-8?B?Um1aMjBrc21kUG5BSnFNZzhHbko5U1kzcjNpUEE2bXVPZ0Y4dWplY0h5Z3A3?=
 =?utf-8?B?clJFUW1vY3hybEE3eGhXOHhkdGh0RURIWjVlS2F3RjV2VWxNUC81blZremlS?=
 =?utf-8?B?cjVWVUJ3cFF0ZGlEOEZCWmZEa3BkM3VaaTIvTlpNWXRyREgrREYxYzNQWmRD?=
 =?utf-8?B?OVk3S3ROWm1DS1I4RkhkbnNMK0xqeTFiU3NnLzQvQUpPaGJPSThETFZPSDFq?=
 =?utf-8?B?czI4a2tzKytoaW54Q0pEUzRLZ0E1OWZOeDZjc0ZBMEpmc0lBSERaaEtra3Ux?=
 =?utf-8?B?NnpLL01pT0VzOWlxZzVwLy9TaHlaRy9rWXAvY2I0SXJlb3RSZHFOYW1ma1pu?=
 =?utf-8?B?K3oyTmtacGFzY3JseWlrY2lXdlVhK2s5R3krSnk4SkhlSDkyL3dDSDBtL2Nz?=
 =?utf-8?B?WjRvU25Ccjg5NXU3Z2FaeFlNM25PVXB3TDVreXFBdG12TkxvWVJ1ZFBVYlVQ?=
 =?utf-8?B?Zm9FZDY0M0VtZnlZa3NQejIzc09HNTlyUW5GY3ZETENEZFgrNHFsUGpkaWJP?=
 =?utf-8?B?RzNLUk1aYzB1ZCtMbnBOZmFYSG5qcGtoUkFCcWxKU0hYVkZxNllFRkxTTkIy?=
 =?utf-8?B?bzZiNk05NllwZkZsTGNYVGFwNTl4bllKRzNnUFkwMlBDckZYS1Z1RVNtdmxJ?=
 =?utf-8?B?bXNxdi9lRnVCdWUzSGpDcGNHdnh2ZDBYTEV2THhRY0tSSTVNbnUySDI1Sits?=
 =?utf-8?B?RWZjWW9DTVF4U3k3OU1qb1F3SExWS0xPMFk4ZnZYVE5MOWJZTlgrMmhaWGxw?=
 =?utf-8?B?YWpoNVBRak5VQ3RBRk50OWhQbDVtTytQN2xuTVdDempTZU5QVHpzQ2VKLytu?=
 =?utf-8?B?bEEzNGt5eEVwTmY4L2Y4RDBGOGtQMldhT2hDcHphYlpZNDU2bFg5VUFyZ2JU?=
 =?utf-8?B?dFVkRkx5YXRTUXY3Y3lYRVAxZTNJMXcwSEhqV1R6ZnliU1AxSTlYMkRaaDBY?=
 =?utf-8?B?VnkzeDErRUJkaFZnaTdXeGo1ODI3bU95WkRFa2hqYm9DN0xQa2JhWFJ3TDdr?=
 =?utf-8?B?SllraU5xRkU4dHFiWjREbndZbUZwSytCTGF6RU1kVjVBeitzQzJjaExPRTd4?=
 =?utf-8?B?Rk4xeW9OQmRZZFJ5ZlZmVUNCSkpZWXhKNVIxa0dIdWUyd3pQV3R1ZE5OOTdC?=
 =?utf-8?B?Z0M1cEtpdWF1SXlMTWlLejVBc285Wld0THVMTXJqVFV5UmJFU3dtQVBGN3Fh?=
 =?utf-8?Q?YZQw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce7782d-c643-4245-087e-08dd25759a7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2024 06:21:58.9027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +tBDyaNutBIaYgkD82WgSOZN82S0aNPc/iW7UuILNHO/n1boJeDoO8yuTna3MZ1lZcQwUPaTq6OFCklaJtDmQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6370

SGVsbG8gIFByYXNoYW50aCBLOg0KDQo+ID4+PiBDb25zaWRlcmluZyB0aGF0IGluIHNvbWUgZXh0
cmVtZSBjYXNlcywgd2hlbiBwZXJmb3JtaW5nIHRoZQ0KPiA+Pj4gdW5iaW5kaW5nIG9wZXJhdGlv
biwgZ3NlcmlhbF9kaXNjb25uZWN0IGhhcyBjbGVhcmVkIGdzZXItPmlvcG9ydCwNCj4gPj4+IHdo
aWNoIHRyaWdnZXJzIGdhZGdldCByZWNvbmZpZ3VyYXRpb24sIGFuZCB0aGVuIGNhbGxzDQo+ID4+
PiBnc19yZWFkX2NvbXBsZXRlLCByZXN1bHRpbmcgaW4gYWNjZXNzIHRvIGEgbnVsbCBwb2ludGVy
LiBUaGVyZWZvcmUsDQo+ID4+PiBlcCBpcyBkaXNhYmxlZCBiZWZvcmUgZ3NlcmlhbF9kaXNjb25u
ZWN0IHNldHMgcG9ydCB0byBudWxsIHRvIHByZXZlbnQgdGhpcw0KPiBmcm9tIGhhcHBlbmluZy4N
Cj4gPj4NCj4gPj4gZ3NfcmVhZF9jb21wbGV0ZSgpIGdldHMgcG9ydCBmcm9tIGVwLT5kcml2ZXJf
ZGF0YSwgYW5kIGl0IHNob3VsZG4ndA0KPiA+PiBnZXQgYWZmZWN0ZWQgaWYgZ3Nlci0+aW9wb3J0
IGlzIG51bGwgYXMgbG9uZyBhcyBwb3J0W3BvcnRfbnVtXS5wb3J0DQo+ID4+IGlzIHZhbGlkLiBB
bSBJIG1pc3Npbmcgc29tZXRoaW5nIGhlcmU/DQo+ID4NCj4gPiBUaGlzIGRlc2NyaXB0aW9uIGlz
IG5vdCB2ZXJ5IGFwcHJvcHJpYXRlLCB0aGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyDQo+IHN1
Z2dlc3Rpb24sIEkgd2lsbCBtb2RpZnkgaXQuDQo+IA0KPiBTZWVtcyBsaWtlIHRoaXMgcGF0Y2gg
aGFzIGFscmVhZHkgYWNjZXB0ZWQgYXBwbGllZCB0byBHcmVncyB0cmVlLiBTbyBJIHRoaW5rIGl0
cw0KPiBmaW5lIGZvciBub3csIGp1c3QgdXBkYXRlIG5ldyBkZXNjcmlwdGlvbiBoZXJlLg0KDQpN
YXkgSSBhc2sgaG93IHdlIHNob3VsZCB1cGRhdGUgdGhlIGRlc2NyaXB0aW9uIGFuZCByZS1yZWxl
YXNlIHRoZSBuZXcgdmVyc2lvbj8gV2UgaGF2ZSBuZXZlciBkZWFsdCB3aXRoIHRoaXMgYmVmb3Jl
Lg0KDQo+ID4+Pg0KPiA+Pj4gQ2FsbCB0cmFjZToNCj4gPj4+ICBnc19yZWFkX2NvbXBsZXRlKzB4
NTgvMHgyNDANCj4gPj4+ICB1c2JfZ2FkZ2V0X2dpdmViYWNrX3JlcXVlc3QrMHg0MC8weDE2MA0K
PiA+Pj4gIGR3YzNfcmVtb3ZlX3JlcXVlc3RzKzB4MTcwLzB4NDg0DQo+ID4+PiAgZHdjM19lcDBf
b3V0X3N0YXJ0KzB4YjAvMHgxZDQNCj4gPj4+ICBfX2R3YzNfZ2FkZ2V0X3N0YXJ0KzB4MjVjLzB4
NzIwDQo+ID4+PiAga3JldHByb2JlX3RyYW1wb2xpbmUuY2ZpX2p0KzB4MC8weDgNCj4gPj4+ICBr
cmV0cHJvYmVfdHJhbXBvbGluZS5jZmlfanQrMHgwLzB4OA0KPiA+Pj4gIHVkY19iaW5kX3RvX2Ry
aXZlcisweDFkOC8weDMwMA0KPiA+Pj4gIHVzYl9nYWRnZXRfcHJvYmVfZHJpdmVyKzB4YTgvMHgx
ZGMNCj4gPj4+ICBnYWRnZXRfZGV2X2Rlc2NfVURDX3N0b3JlKzB4MTNjLzB4MTg4DQo+ID4+PiAg
Y29uZmlnZnNfd3JpdGVfaXRlcisweDE2MC8weDFmNA0KPiA+Pj4gIHZmc193cml0ZSsweDJkMC8w
eDQwYw0KPiA+Pj4gIGtzeXNfd3JpdGUrMHg3Yy8weGYwDQo+ID4+PiAgX19hcm02NF9zeXNfd3Jp
dGUrMHgyMC8weDMwDQo+ID4+PiAgaW52b2tlX3N5c2NhbGwrMHg2MC8weDE1MA0KPiA+Pj4gIGVs
MF9zdmNfY29tbW9uKzB4OGMvMHhmOA0KPiA+Pj4gIGRvX2VsMF9zdmMrMHgyOC8weGEwDQo+ID4+
PiAgZWwwX3N2YysweDI0LzB4ODQNCj4gPj4+DQo+ID4NCg0KVGhhbmtzDQo=

