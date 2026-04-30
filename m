Return-Path: <linux-usb+bounces-36723-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI99CQi48mnltgEAu9opvQ
	(envelope-from <linux-usb+bounces-36723-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 04:01:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 842E749C2C2
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 04:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C847B3017BD0
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 02:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C0028504F;
	Thu, 30 Apr 2026 02:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="MZ3VlN2P"
X-Original-To: linux-usb@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013018.outbound.protection.outlook.com [40.107.44.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE1C64;
	Thu, 30 Apr 2026 02:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514497; cv=fail; b=QevzqX0OFE0z9DiKQixWKBiFQD7PJWMvGDorFalmpMala3pCB2jM9LoAENznB497aEXxyus/kxXl8xs34+srAv96DfyhLh2o8HEdPsFaxJAoEih0UpQegdgv/QxxHtCWH/IKlep1TqI7C/oVDgA0sdg5lggMs3uE1O+h1/yuvB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514497; c=relaxed/simple;
	bh=ugSet5C4p/N+ZAv2BVU03Agb111MEld7j5Z1OsjqVB0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yc1hmCHfQOXg8yHQ19FVG6N0n9CFHhwaNiNiGefzZ2URBwkrd1BHrg4m0CHava4YFzG8pj9sHPt+qQFCFWTdrvOSQpI/xc5zAZj+yFwuIxTVKaFQHcCeE5svUhhwj5sIbFCInhd1N5i1O1qr6l/shG+oFnYGb47JckUHvKEdOCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=MZ3VlN2P; arc=fail smtp.client-ip=40.107.44.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjCUri0FPDXoD/n/SlO4NGNLZiqyJOV24d9kgre2qdi8OeMuOFU7giEKzb+B05H31JHF3LZfLUH643MY2SCTbzxSlZPJmPun3CrJInWZG7Bo7jEGf8hNqb6YwOXKr1bHZRJWD3Cx3aVDZeKkt390Vb2V8e5LtF5OD9JHkWJN83SqZo3cGptfoPMnyLsZixO796M4fj7GRM+1nH22g6C/1swaBKb8UPVqfyj1wNLHtGHIVU/nE4CTfEajJUchMX3yKmt2BMUCoCrjKxNZwMp+dkfUhJwUbqhNTx7mTEH31ohPdNJXDU086XOtLmNxqJ5jKtYfn46OsILxUrMtDirvgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugSet5C4p/N+ZAv2BVU03Agb111MEld7j5Z1OsjqVB0=;
 b=dxGzpyT/s1PYVcVl0ZY+R27dIpN0LCGHqDDcJc8mdiknmDFNal7B5HBL+oXSHQQmTx7/guU64gUzYVUGzhhmvM/mPEawoJ/zd8FGR43foXVC65EQryw8GvMRiY8UUl2FE5kkRQNEwvchomVRDfvVqieYLRgVDmLWTTnVu4VMM+26kFlB4r4hxk7ES4OmlcoTvfVPRfHi0YrT1i0eHyPvmDKpLMQ7zVwTI9uQTQI/ZGTtpi4tNCA/lA/aKrt3SHhiqVPmJcFUqbHGlFng4dYWGOP3qj3Bibni9sGRafUqO8vqrB7ZueOi+zpthhuWj0brY89fGLyp79hjznxPQAFKZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugSet5C4p/N+ZAv2BVU03Agb111MEld7j5Z1OsjqVB0=;
 b=MZ3VlN2PR8lFiyEnGPRLKdSlI/6KzIPPdKdMObzgNLko1JuOHpSpm0iCFUbwOjuzCxH4k+8Eyv6/O2+EjNPmSiwRzfYK9+C/rgYCrnd+PozEQfIOtLSPaeRi293JJzoDK32Z1Dk5rVSz2/VwAujL2RtzDpsqJ3z8IdzoHbUsLgDGyWOUj1UPh5zstNUyTjq0JPsE9scvXR/qAR0EaOMRoFKmbWoXdLNicd/Py8Sn7am8xCaIlzSqcnjtDxWSmoBAr89mFZbDncLVcjn7XSPjXennjtdMOoEiZhcmBLPKqhxy25U41OyH2qmawXN0kSEPjeYMGVhBFCCySyRfu20eaQ==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SEZPR06MB5416.apcprd06.prod.outlook.com (2603:1096:101:67::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 02:01:28 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 02:01:27 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, Michal Pecio
	<michal.pecio@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones
	<lee@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, Sarah Sharp
	<sarah.a.sharp@linux.intel.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject:
 =?utf-8?B?562U5aSNOiBbUEFUQ0hdIHVzYjogeGhjaTogY2hlY2sgTnVsbCBwb2ludGVy?=
 =?utf-8?Q?_in_segment_alloc?=
Thread-Topic: [PATCH] usb: xhci: check Null pointer in segment alloc
Thread-Index: AQHc16wNSmsp37gxj0Wd1fi/0Xty2bX12t2AgAD6GhA=
Date: Thu, 30 Apr 2026 02:01:27 +0000
Message-ID:
 <TYUPR06MB621794606058121EED6D711DD2352@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
 <TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20251220141510.1bc1ef19.michal.pecio@gmail.com>
 <20251222064252.GA1196800@google.com> <2025122253-stopper-tweed-6e68@gregkh>
 <20251222085543.4d7430d5.michal.pecio@gmail.com>
 <TYUPR06MB6217CB438F21763401A93E6ED2B4A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <2025122250-commend-bondless-c7e1@gregkh>
 <TYUPR06MB62171E25C3202950069F09D9D2342@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260429094434.0825c059.michal.pecio@gmail.com>
 <377bf9aa-8ac0-4908-8ebb-b2db13fce8d1@linux.intel.com>
In-Reply-To: <377bf9aa-8ac0-4908-8ebb-b2db13fce8d1@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SEZPR06MB5416:EE_
x-ms-office365-filtering-correlation-id: 03761692-19df-4ebe-3868-08dea65c63b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|42112799006|366016|22082099003|18002099003|38070700021|56012099003;
x-microsoft-antispam-message-info:
 fmcvnyV8kWOZ71gv0DCeZ2INF9XPcRxLuYdHaivRk5aBtGBExuhGWlYHiIB4+WAXO4Z9ueNsuUZoYWEGJ0ljPw8HFZoiUe3c1EVTPH8U+Z6cZFu+Y+bYR/uTdWLz1MWloANdy2GjjEqLfKqxDIdcnJLf+KFKS6ll9owe9snR3iIj12v/xOx3gPqnllUNRTrih4YlcM74a3/YXU+v3syINq3OwsK7VDT2K5D5ZIhYcRBAag0dvGNIFVNh2Z2/h5V5Xxm+3+qHlw9chc6s5oat645MO8rowSz6/LWV9tQU5MOR3NuQGl7i9M1uBVV5VxC7slHyu9yA2FFwSrWze5oAvBKzSOwTRMs6CHtdxSm6+hohpn5snGpAUeBN3xqHS085xeGqci7HKkBkvuPOMMVHND75MN66yFSCesjwVS4TNp+JxMjqRVYrd8lQVs0t8V11DlHjJJvOlBuK9/gJZeLIWt4etG54xS0cV1KoQZTSfy+12jp8JQmLTJU9063fHdua0GkSa5TVxS94NDyTQOZmNjkUJv08A4gq/SoVBvMU/6iGQ3RyJ7HZ/6hCl+3r4VOde1SkqBb3/IlSKvfkjxVZDLRFVmn3HCHYVtDcWC4nlHCRdzZNAHxyIAUElG0N71RLBlkhaWHTps0pGb+Ry5BIbtEJzAnjvljto5AIwlfPDSpYu29MwKY+YedCOQunEG3is0KTWp/YrfL4/Pgep+f2mo3NEMiX7hFsUKLh2HF4Z5G4xADZZGyjoC3C0zK7c8zu3y3CJupylCUpYceQhQY7m8u0SFWZA8EIMyI6cCvyDAY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(42112799006)(366016)(22082099003)(18002099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d2pPdHV6ZUZKOGFldlhWTld1WXYrRUtCc21xWG15R2VqTzVVR3lMM3YwcnMy?=
 =?utf-8?B?Zk9HNE8zV3Z3YlVjUnBudTlPelRTbllHRmRnSGkvYXBLOXdJSUdhcUxaOURq?=
 =?utf-8?B?T05mZ2FHYldzZ1RENSs0RDRzMGlUNDM4SUJJc1E3TEh0emN6UG4rdnYreXdE?=
 =?utf-8?B?MzhvRk5BUE1hUzJldHlzS2VodUNKRU1TYmQ2dXhmT21URFBUTW8yU3dDV2Fi?=
 =?utf-8?B?SEdLaEJ6ekM0SG80bE1UNlE4WWpsT0VoSGRGM1Z1bVJrY3RnVk9lMFgrVGhV?=
 =?utf-8?B?TWR2Q0V2S1lPRXNnWTd0WTBRc21ZZkRuazA2MW9hNnBoc3hSQjQrV0FYc3RO?=
 =?utf-8?B?dG5DREdnM3FkQjZmcjFjRjZqeUd1UUVIWTZ6Nm5oWGVvRGdibldvRFJVbldh?=
 =?utf-8?B?dDBPV1BXQk9kQXYyczlZallDa1Z3WmV0T2RNVEhKS1lPYlFWQ3ZBd3RRSVM2?=
 =?utf-8?B?NlUrK053cjBrd3VrbnE4UHBBVHZPb3RiOXBwS2xoTkFyazc1N0hZTUJaVXVx?=
 =?utf-8?B?ZWR6MloxWVJoOC9wdjF4WFl2eW5KRWxtZVJKVU90empBVTRIOExRK091ZkxY?=
 =?utf-8?B?M0VOeEFybmEzNHFDV0l1QmpxTmlTMkFUbnVwQkN3bUlPUHRqK1RXRXUvMEl2?=
 =?utf-8?B?VkE0Z21CVGp0S0UvUjFHU0Z1RHJDd2pQcDk0bjhqQWx1T2xZbktGMzdrWTZy?=
 =?utf-8?B?TmtSUTVKM3g0MFljWGxValdJcFh6WHNVem9CNmRhY1BPS3FhRnB2WGtnVGc3?=
 =?utf-8?B?VFFIWjVwcVJkK2hoZEtWdm9HKysxWGNTTmxjcjlkQit1TlJ4cVcwY2NzVnhO?=
 =?utf-8?B?M2hMazNGUVFNTTJlYXVpVUdhVlk3VmMvbk13R2JhQWkzejA2b0NRTFNjb1lR?=
 =?utf-8?B?ajlqSnIwait1NEpQcnVqTjBxbFFjMzZqNStVOHUxdEdqR0k2VER4MlVTazYx?=
 =?utf-8?B?Mk1NWWhnMlFKQXJWbnlUcytiakM4bHRPS2tXZlhtUkY5Zng3VTdJM2pjbDlv?=
 =?utf-8?B?Y2w4bDFZa0RpeHBLcUF4SWJtenQySFBSelFSd1FDcGg0S1dEQVRhWjFadzdP?=
 =?utf-8?B?TDh2L3ZEaU5KdGdRWmJrZnlmU3Y2eVdBTy9DRFp1Mm5tUFkrVkhnTXlucmw3?=
 =?utf-8?B?ZjloczdFRnpRMUdodVRIbWZKNkMrckJGVzVPcGFLaFVzZkVtelJib1JwdVN0?=
 =?utf-8?B?cDRzY1N0a2hjRndwcDdKdThoSkJ6N0lJdlpWVW9EOXE2MXh1MHllRmhnc290?=
 =?utf-8?B?MkFYZXU1TDNxZndROU1VL3ZPM0pWNkdKbnhFcWZsNTh6cmpVSTlIRVhZZXc2?=
 =?utf-8?B?V3FKMmQydmRkMExmSGRZdmRPY1d0cnlYWkM3R0c2UEp0WmVoZmh3Tzd3alRt?=
 =?utf-8?B?bC90VjJDWlhKdzZaQlBkQnhhMlFnYU1uWE5Vcm9EZTFHcmxsSFZNUlhLWnIw?=
 =?utf-8?B?VmR0UlFyc3VSSGtzVGp3UGJHSjIxNjJJRm95VzV5b2gwOFdGL0lwTE1oL2NS?=
 =?utf-8?B?TWNoNnVJckVrUEU1ekVXamxnSTV3LzR3em1ZYVkwamhoamZ5QnVoSE1YODhP?=
 =?utf-8?B?VXhqazBCTVpUa2NYM0ZzWk1MaEpaMHVCaEhDWlkzVkJKU0FKNGN2cktlOGFt?=
 =?utf-8?B?V2ovUjlRbnlvN0Q2Uis0aFV0VWhleDlSRHdwVUJ3OWR0cTBBQXlaUTRLOUkw?=
 =?utf-8?B?NnpDNXNTN3lEWjZ3bU05ZVo0dUFqSThhS1FocVBnQ2JEVm1kS2pwM1lIdDB2?=
 =?utf-8?B?MkhnL0lreGQzbnB4cEtsM3U0bVpjOEpPYkpiVm9pWjNjbVBXTUYzVXI4Tm1o?=
 =?utf-8?B?Zzg4QXRHNzBxQXNHV2FRUWR2OUF6U3JXZEtRTDNCNFM0OURpVnBVaFYxdFM3?=
 =?utf-8?B?VDF3Q2ZjNGVkMGRONWs1VVZ1MDdQWlRtZnREdW1ha1pWeFM3enRubjZGWE1x?=
 =?utf-8?B?SmJhWEZqMm5BaFZXcyttb0xIUzZyUW55dUpBak1RN3liVWh2NGtZR3V4SUFS?=
 =?utf-8?B?dXN5THNGN2JJN093VmF0RzNFSEpiK2pnS1ZVcmtXaktZdGp5alIyRzVWVTFZ?=
 =?utf-8?B?TmFQTHVmOUJnMG1Wak1KWmJoS05xRTNUSzJLVEZoQlZqZXFMcE5STS9OVnls?=
 =?utf-8?B?cWdXRmtDYzZRcFdhZFdCTjJIZWduOWRGaDF0Z0twTTc1VWhqZTR6cXAvL3Ni?=
 =?utf-8?B?ckp6V0VBeDVGcDg2VUVRdEZlcjgxMldvV1VyMHBpajhXZGYwNEJOU3hLS2V5?=
 =?utf-8?B?Uyt3SGoyc1JUWnJ4QVoyMGlqNE5NOUc2M1ViMUxudTZna1YzRS94ZGdKZkd3?=
 =?utf-8?Q?PLNljghw6G323J4PIe?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 03761692-19df-4ebe-3868-08dea65c63b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 02:01:27.2902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YSmCbm0fcn5x8fezqAd1uGZrWpky3Y9APrcRAEwwbTQ8kmm251Hfhi7mEWe3YyiUQuJ/Gc+6gCcgioerQ1dJBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5416
X-Rspamd-Queue-Id: 842E749C2C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[vivo.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vivo.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36723-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hulianqin@vivo.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[vivo.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vivo.com:dkim]

SGkgQUxMOg0KDQo+IE9uIDQvMjkvMjYgMTA6NDQsIE1pY2hhbCBQZWNpbyB3cm90ZToNCj4gPiBP
biBXZWQsIDI5IEFwciAyMDI2IDAyOjUwOjQzICswMDAwLCDog6Hov57li6Qgd3JvdGU6DQo+ID4+
IEhlbGxvICBHcmVnLCBNYXRoaWFzIE55bWFuOg0KPiA+Pg0KPiA+PiBFdmVuIGFmdGVyIHVwZGF0
aW5nIHRoZSBrZXJuZWwsIHRoZSBpc3N1ZSBwZXJzaXN0cyBkdXJpbmcgdGhlIHdha2UtdXAgcHJv
Y2Vzcw0KPiA+PiBhZnRlciB0aGUgZGV2aWNlIGhhcyBiZWVuIHB1dCBpbnRvIHNsZWVwIG1vZGUg
d2hlbiBjb25uZWN0ZWQgdG8gZGlnaXRhbCBoZWFkcGhvbmVzLg0KPiA+Pg0KPiA+PiBUaGUgZXJy
b3IgbWVzc2FnZSBpcyBhcyBmb2xsb3dzOg0KPiA+Pg0KPiA+PiBbNDY1MjE0LjUxOTgxN11bVDE3
MjQ3XSBtc20tZHdjMyBhNjAwMDAwLnNzdXNiOiBbMjAyNi0wNC0yNiAwNzozODoxNi44NzEyODhd
dnVzYiBkYmc6IFsyMDI2LTA0LTI2IDA3OjM4OjE2Ljg3MTI4OF1EV0MzIGluDQo+IGxvdyBwb3dl
ciBtb2RlDQo+ID4+IFs0NjUyMjEuMjU3MDk5XVtUMjQ0ODhdIGNoZWNrX3ZhbGlkX3JlcXVlc3Q6
IGNhcmQjOjAgZGV2IzowIGRpcjowIGVuOjEgZm10OjIgcmF0ZTo0ODAwMCAjY2g6Mg0KPiA+PiBb
NDY1MjIxLjI1OTM3MF1bVDI0NDg4XSBtc20tZHdjMyBhNjAwMDAwLnNzdXNiOiBbMjAyNi0wNC0y
NiAwNzozODoyMy42MTA4NDJddnVzYiBkYmc6IFsyMDI2LTA0LTI2IDA3OjM4OjIzLjYxMDg0Ml1E
V0MzDQo+IGV4aXRlZCBmcm9tIGxvdyBwb3dlciBtb2RlDQo+ID4+IFs0NjUyMjEuNjkwODUyXVtU
MjQ0ODhdIHVzYiAxLTE6IDE6MTogY2Fubm90IGdldCBmcmVxIGF0IGVwIDB4Mw0KPiA+PiBbNDY1
MjIxLjY5MDk0N11bVDI0NDg4XSB1YXVkaW9faW9tbXVfbWFwOiB0eXBlOjAgbWFwIHBhOjB4MDAw
MDAwMDg5YTZhZTAwMCB0byBpb3ZhOjB4MDAwMDEwMDAgc2l6ZTo0MDk2DQo+ID4+IFs0NjUyMjEu
NjkwOTU2XVtUMjQ0ODhdIHVhdWRpb19nZXRfaW92YTogZXhhY3Qgc2l6ZTogNDA5NiBmb3VuZA0K
PiA+PiBbNDY1MjIxLjY5MDk1OV1bVDI0NDg4XSB1YXVkaW9fZ2V0X2lvdmE6IHZhOjB4MDAwMjIw
MDAgY3Vycl9pb3ZhOjB4MDAwMjQwMDAgY3Vycl9pb3ZhX3NpemU6NDE4NjExMg0KPiA+PiBbNDY1
MjIxLjY5MDk2Ml1bVDI0NDg4XSB1YXVkaW9faW9tbXVfbWFwOiB0eXBlOjEgbWFwIHBhOjB4MDAw
MDAwMDkxYzUzNzAwMCB0byBpb3ZhOjB4MDAwMjIwMDAgc2l6ZTo0MDk2DQo+ID4+IFs0NjUyMjEu
NjkwOTk0XVtUMjQ0ODhdIHVhdWRpb19nZXRfaW92YTogZXhhY3Qgc2l6ZTogMzI3NjggZm91bmQN
Cj4gPj4gWzQ2NTIyMS42OTA5OTZdW1QyNDQ4OF0gdWF1ZGlvX2dldF9pb3ZhOiB2YToweDAwNDIy
MDAwIGN1cnJfaW92YToweDAwNDMyMDAwIGN1cnJfaW92YV9zaXplOjQyOTA1OTI3NjgNCj4gPj4g
WzQ2NTIyMS42OTEwMDFdW1QyNDQ4OF0gdWF1ZGlvX2lvbW11X21hcDogdHlwZToyIG1hcCBwYTow
eDAwMDAwMDA5NzRlNWMwMDAgdG8gaW92YToweDAwNDIyMDAwIGxlbjo0MDk2IG9mZnNldDowDQo+
ID4+IFs0NjUyMjEuNjkxMDA0XVtUMjQ0ODhdIHVhdWRpb19pb21tdV9tYXA6IHR5cGU6MiBtYXAg
cGE6MHgwMDAwMDAwOTJmZjBiMDAwIHRvIGlvdmE6MHgwMDQyMzAwMCBsZW46NDA5NiBvZmZzZXQ6
MA0KPiA+PiBbNDY1MjIxLjY5MTAwOF1bVDI0NDg4XSB1YXVkaW9faW9tbXVfbWFwOiB0eXBlOjIg
bWFwIHBhOjB4MDAwMDAwMDkwODZkNDAwMCB0byBpb3ZhOjB4MDA0MjQwMDAgbGVuOjQwOTYgb2Zm
c2V0OjANCj4gPj4gWzQ2NTIyMS42OTEwMTFdW1QyNDQ4OF0gdWF1ZGlvX2lvbW11X21hcDogdHlw
ZToyIG1hcCBwYToweDAwMDAwMDA5MDNkNDIwMDAgdG8gaW92YToweDAwNDI1MDAwIGxlbjo0MDk2
IG9mZnNldDowDQo+ID4+IFs0NjUyMjEuNjkxMDE0XVtUMjQ0ODhdIHVhdWRpb19pb21tdV9tYXA6
IHR5cGU6MiBtYXAgcGE6MHgwMDAwMDAwODk5ZjQwMDAwIHRvIGlvdmE6MHgwMDQyNjAwMCBsZW46
NDA5NiBvZmZzZXQ6MA0KPiA+PiBbNDY1MjIxLjY5MTAxN11bVDI0NDg4XSB1YXVkaW9faW9tbXVf
bWFwOiB0eXBlOjIgbWFwIHBhOjB4MDAwMDAwMDkxYzQ5MTAwMCB0byBpb3ZhOjB4MDA0MjcwMDAg
bGVuOjQwOTYgb2Zmc2V0OjANCj4gPj4gWzQ2NTIyMS42OTEwMjBdW1QyNDQ4OF0gdWF1ZGlvX2lv
bW11X21hcDogdHlwZToyIG1hcCBwYToweDAwMDAwMDA4OTkyNjkwMDAgdG8gaW92YToweDAwNDI4
MDAwIGxlbjo0MDk2IG9mZnNldDowDQo+ID4+IFs0NjUyMjEuNjkxMDIzXVtUMjQ0ODhdIHVhdWRp
b19pb21tdV9tYXA6IHR5cGU6MiBtYXAgcGE6MHgwMDAwMDAwOTNiNGQzMDAwIHRvIGlvdmE6MHgw
MDQyOTAwMCBsZW46NDA5NiBvZmZzZXQ6MA0KPiA+PiBbNDY1MjIxLjY5MTA1Ml1bVDI0NDg4XSBo
YW5kbGVfdWF1ZGlvX3N0cmVhbV9yZXE6IHJldCAwOiBxbWkgcmVzcG9uc2UgbGF0ZW5jeSA0MzMg
bXMNCj4gPj4gWzQ2NTIyMy43NzE4NDBdW1QyNDQ5NF0gaGFuZGxlX3VhdWRpb19zdHJlYW1fcmVx
OiBzcV9ub2RlOjUgc3FfcG9ydDoyMDcgc3FfZmFtaWx5OjJhDQo+ID4+IFs0NjUyMjMuNzcxODU4
XVtUMjQ0OTRdIGNoZWNrX3ZhbGlkX3JlcXVlc3Q6IGNhcmQjOjAgZGV2IzowIGRpcjowIGVuOjAg
Zm10OjIgcmF0ZTo0ODAwMCAjY2g6Mg0KPiA+PiBbNDY1MjIzLjgyNzQwOV1bVDI0NDk0XSB1YXVk
aW9fcHV0X2lvdmE6IGN1cnJfaW92YV9zaXplIDQxOTAyMDgNCj4gPj4gWzQ2NTIyMy44Mjc0MTRd
W1QyNDQ5NF0gdWF1ZGlvX2lvbW11X3VubWFwOiB0eXBlIDE6IHVubWFwIGlvdmEgMHgwMDAyMjAw
MCBzaXplIDQwOTYNCj4gPj4gWzQ2NTIyMy44Mjc0MjVdW1QyNDQ5NF0gdWF1ZGlvX3B1dF9pb3Zh
OiBjdXJyX2lvdmFfc2l6ZSA0MjkwNjI1NTM2DQo+ID4+IFs0NjUyMjMuODI3NDI5XVtUMjQ0OTRd
IHVhdWRpb19pb21tdV91bm1hcDogdHlwZSAyOiB1bm1hcCBpb3ZhIDB4MDA0MjIwMDAgc2l6ZSAz
Mjc2OA0KPiA+PiBbNDY1MjIzLjgyNzQ2M11bVDI0NDk0XSBoYW5kbGVfdWF1ZGlvX3N0cmVhbV9y
ZXE6IHJlbGVhc2UgcmVzb3VyY2VzOiBpbnRmIyAxIGNhcmQjIDANCj4gPj4gWzQ2NTIyMy44Mjc0
NjddW1QyNDQ5NF0gdWF1ZGlvX2Rldl9yZWxlYXNlOiBmb3IgZGV2IDAwMDAwMDAwMDAwMDAwMDAN
Cj4gPj4gWzQ2NTIyMy44Mjc0NzJdW1QyNDQ5NF0gdWF1ZGlvX2lvbW11X3VubWFwOiB0eXBlIDA6
IHVubWFwIGlvdmEgMHgwMDAwMTAwMCBzaXplIDQwOTYNCj4gPj4gWzQ2NTIyMy44Mjc1MTddW1Qy
NDQ5NF0gdWF1ZGlvX2V2ZW50X3JpbmdfY2xlYW51cF9mcmVlOiBhbGwgYXVkaW8gZGV2aWNlcyBk
aXNjb25uZWN0ZWQNCj4gPj4gWzQ2NTIyMy44Mjc1NjFdW1QyNDQ5NF0gaGFuZGxlX3VhdWRpb19z
dHJlYW1fcmVxOiByZXQgMDogcW1pIHJlc3BvbnNlIGxhdGVuY3kgNTUgbXMNCj4gPj4gWzQ2NTIy
Ny4zNjAxODZdWyBUMzIyM10gYW5kcm9pZCB0aW1lIDIwMjYtMDQtMjcgMDY6Mzg6MjkuNzExNjQ2
DQo+ID4+IFs0NjUyMzIuNzkxNjExXVtUMjQ0OTNdIGhhbmRsZV91YXVkaW9fc3RyZWFtX3JlcTog
c3Ffbm9kZTo1IHNxX3BvcnQ6MjA3IHNxX2ZhbWlseToyYQ0KPiA+PiBbNDY1MjMyLjc5MTYxNV1b
VDI0NDkzXSBjaGVja192YWxpZF9yZXF1ZXN0OiBjYXJkIzowIGRldiM6MCBkaXI6MCBlbjoxIGZt
dDoyIHJhdGU6NDgwMDAgI2NoOjINCiAgICAgICAgIFN0YXJ0IHBsYXlpbmcgYXVkaW8NCg0KPiA+
PiBbNDY1MjMzLjIxMzY3MF1bVDI0NDkzXSB1YXVkaW9faW9tbXVfbWFwOiB0eXBlOjAgbWFwIHBh
OjB4MDAwMDAwMDkxMDk0ZjAwMCB0byBpb3ZhOjB4MDAwMDEwMDAgc2l6ZTo0MDk2DQo+ID4+IFs0
NjUyMzMuMjEzNjgzXVtUMjQ0OTNdIHVhdWRpb19nZXRfaW92YTogZXhhY3Qgc2l6ZTogNDA5NiBm
b3VuZA0KPiA+PiBbNDY1MjMzLjIxMzY4Nl1bVDI0NDkzXSB1YXVkaW9fZ2V0X2lvdmE6IHZhOjB4
MDAwMjIwMDAgY3Vycl9pb3ZhOjB4MDAwMjQwMDAgY3Vycl9pb3ZhX3NpemU6NDE4NjExMg0KPiA+
PiBbNDY1MjMzLjIxMzY4OV1bVDI0NDkzXSB1YXVkaW9faW9tbXVfbWFwOiB0eXBlOjEgbWFwIHBh
OjB4MDAwMDAwMDg5YTZhZTAwMCB0byBpb3ZhOjB4MDAwMjIwMDAgc2l6ZTo0MDk2DQo+ID4+IFs0
NjUyMzMuMjEzNzEyXVtUMjQ0OTNdIHVhdWRpb19nZXRfaW92YTogZXhhY3Qgc2l6ZTogMzI3Njgg
Zm91bmQNCj4gPj4gWzQ2NTIzMy4yMTM3MTVdW1QyNDQ5M10gdWF1ZGlvX2dldF9pb3ZhOiB2YTow
eDAwNDIyMDAwIGN1cnJfaW92YToweDAwNDMyMDAwIGN1cnJfaW92YV9zaXplOjQyOTA1OTI3NjgN
Cj4gPj4gWzQ2NTIzMy4yMTM3MjBdW1QyNDQ5M10gdWF1ZGlvX2lvbW11X21hcDogdHlwZToyIG1h
cCBwYToweDAwMDAwMDA5NjhlNWYwMDAgdG8gaW92YToweDAwNDIyMDAwIGxlbjo0MDk2IG9mZnNl
dDowDQo+ID4+IFs0NjUyMzMuMjEzNzIzXVtUMjQ0OTNdIHVhdWRpb19pb21tdV9tYXA6IHR5cGU6
MiBtYXAgcGE6MHgwMDAwMDAwOTY4ZTVlMDAwIHRvIGlvdmE6MHgwMDQyMzAwMCBsZW46NDA5NiBv
ZmZzZXQ6MA0KPiA+PiBbNDY1MjMzLjIxMzcyN11bVDI0NDkzXSB1YXVkaW9faW9tbXVfbWFwOiB0
eXBlOjIgbWFwIHBhOjB4MDAwMDAwMDhjYWE1ODAwMCB0byBpb3ZhOjB4MDA0MjQwMDAgbGVuOjQw
OTYgb2Zmc2V0OjANCj4gPj4gWzQ2NTIzMy4yMTM3MzBdW1QyNDQ5M10gdWF1ZGlvX2lvbW11X21h
cDogdHlwZToyIG1hcCBwYToweDAwMDAwMDBhOTFhZjAwMDAgdG8gaW92YToweDAwNDI1MDAwIGxl
bjo0MDk2IG9mZnNldDowDQo+ID4+IFs0NjUyMzMuMjEzNzM0XVtUMjQ0OTNdIHVhdWRpb19pb21t
dV9tYXA6IHR5cGU6MiBtYXAgcGE6MHgwMDAwMDAwOWQzOGMxMDAwIHRvIGlvdmE6MHgwMDQyNjAw
MCBsZW46NDA5NiBvZmZzZXQ6MA0KPiA+PiBbNDY1MjMzLjIxMzczN11bVDI0NDkzXSB1YXVkaW9f
aW9tbXVfbWFwOiB0eXBlOjIgbWFwIHBhOjB4MDAwMDAwMDllMWUwNTAwMCB0byBpb3ZhOjB4MDA0
MjcwMDAgbGVuOjQwOTYgb2Zmc2V0OjANCj4gPj4gWzQ2NTIzMy4yMTM3NDBdW1QyNDQ5M10gdWF1
ZGlvX2lvbW11X21hcDogdHlwZToyIG1hcCBwYToweDAwMDAwMDA5ZjhlYTQwMDAgdG8gaW92YTow
eDAwNDI4MDAwIGxlbjo0MDk2IG9mZnNldDowDQo+ID4+IFs0NjUyMzMuMjEzNzQzXVtUMjQ0OTNd
IHVhdWRpb19pb21tdV9tYXA6IHR5cGU6MiBtYXAgcGE6MHgwMDAwMDAwMGE3NTE5MDAwIHRvIGlv
dmE6MHgwMDQyOTAwMCBsZW46NDA5NiBvZmZzZXQ6MA0KPiA+PiBbNDY1MjMzLjIxMzc5MV1bVDI0
NDkzXSBoYW5kbGVfdWF1ZGlvX3N0cmVhbV9yZXE6IHJldCAwOiBxbWkgcmVzcG9uc2UgbGF0ZW5j
eSA0MjIgbXMNCj4gPj4gWzQ2NTI0OC41MDM1NzldW1QyNDQxMV0gdXNiIDEtMTogcmVzZXQgZnVs
bC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nIHhoY2ktaGNkIA0KICAgICAgICAgcGxh
eWJhY2sgdGltZSBbNDY1MjMyLjc5MTYxNV0sIGFib3V0IDE2IHNlY29uZHMgbGF0ZXIsIGhvc3Qg
cmVzZXQgZGlnaXRhbCBoZWFkcGhvbmVzLg0KICAgICAgICAgSW4gYWRkaXRpb24sIHRoZSBsb2cg
YWxzbyBjb25maXJtZWQgdGhhdCBmcm9tIHRoZSB0aW1lIHRoZSBzb3VuZCB3YXMgcGxheWVkIHVu
dGlsIHRoZSBjcmFzaCBvY2N1cnJlZCwNCiAgICAgICAgIHRoZSBob3N0IHdhcyBpbiBhIHN0YXRl
IHdoZXJlIHRoZSBzY3JlZW4gd2FzIG9uLCBhbmQgdGhlIHN5c3RlbSB3YXMgYXdha2UgYW5kIG5v
dCBpbiBzbGVlcCBtb2RlLg0KDQo+ID4+IFs0NjUyNDguNjQxNzMyXVtUMjQ0MTFdIFVuYWJsZSB0
byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDAw
MGVmODA4MDAwDQo+ID4+IFsuLi5dDQo+ID4+IFs0NjUyNDguNjQzNjcwXVtUMjQ0MTFdIENhbGwg
dHJhY2U6DQo+ID4+IFs0NjUyNDguNjQzNjczXVtUMjQ0MTFdICBkbWFfcG9vbF9hbGxvYysweDM4
LzB4MmE0DQo+ID4+IFs0NjUyNDguNjQzNjg0XVtUMjQ0MTFdICB4aGNpX3NlZ21lbnRfYWxsb2Mr
MHg5Yy8weDFjNA0KPiA+PiBbNDY1MjQ4LjY0MzY5Ml1bVDI0NDExXSAgeGhjaV9hbGxvY19zZWdt
ZW50c19mb3JfcmluZysweGJjLzB4MTcwDQo+ID4+IFs0NjUyNDguNjQzNjk5XVtUMjQ0MTFdICB4
aGNpX3JpbmdfYWxsb2MrMHhiNC8weDFmMA0KPiA+PiBbNDY1MjQ4LjY0MzcwNV1bVDI0NDExXSAg
eGhjaV9lbmRwb2ludF9pbml0KzB4M2IwLzB4NGJjDQo+ID4+IFs0NjUyNDguNjQzNzExXVtUMjQ0
MTFdICB4aGNpX2FkZF9lbmRwb2ludCsweDFhNC8weDI5Yw0KPiA+PiBbNDY1MjQ4LjY0MzcyM11b
VDI0NDExXSAgdXNiX2hjZF9hbGxvY19iYW5kd2lkdGgrMHgyMzAvMHgzZDQNCj4gPj4gWzQ2NTI0
OC42NDM3MjldW1QyNDQxMV0gIHVzYl9yZXNldF9hbmRfdmVyaWZ5X2RldmljZSsweDFlMC8weDc0
NA0KPiA+PiBbNDY1MjQ4LjY0Mzc0MV1bVDI0NDExXSAgdXNiX3Jlc2V0X2RldmljZSsweDE1NC8w
eDIzYw0KPiA+PiBbNDY1MjQ4LjY0Mzc1Nl1bVDI0NDExXSAgX191c2JfcXVldWVfcmVzZXRfZGV2
aWNlKzB4M2MvMHg2NA0KPiA+PiBbNDY1MjQ4LjY0Mzc2NF1bVDI0NDExXSAgcHJvY2Vzc19zY2hl
ZHVsZWRfd29ya3MrMHgyMDAvMHg5ZDgNCj4gPj4gWzQ2NTI0OC42NDM3NzJdW1QyNDQxMV0gIHdv
cmtlcl90aHJlYWQrMHgxNTQvMHgzYjQNCj4gPj4gWzQ2NTI0OC42NDM3ODBdW1QyNDQxMV0gIGt0
aHJlYWQrMHgxMWMvMHgxYTANCj4gPj4gWzQ2NTI0OC42NDM3OTFdW1QyNDQxMV0gIHJldF9mcm9t
X2ZvcmsrMHgxMC8weDIwDQo+ID4+IFs0NjUyNDguNjQzODA3XVtUMjQ0MTFdIENvZGU6IDk0MmY1
MDk3IGY5NDAwZTc2IGFhMDAwM2U5IGI0MDAwMmY2IChmOTQwMDJjOCkNCj4gPj4gWzQ2NTI0OC42
NDM4MTJdW1QyNDQxMV0gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQo+ID4N
Cj4gPiBMb29rcyBsaWtlIHRoaXMgdGltZSBzb21lYm9keSB0cmllZCB0byByZXNldCBhIFVTQiBk
ZXZpY2Ugd2hpbGUNCj4gPiB0aGUgc2VnbWVudCBwb29sIGlzIGRlc3Ryb3llZCwgbm90IGNyZWF0
ZWQgeWV0IG9yIGNvcnJ1cHRlZC4NCj4gPg0KPiA+IEFnYWluLCB4aGNpX2hjZCBkeW5hbWljIGRl
YnVnIHdvdWxkIHNob3cgd2hhdCBsZWQgdG8gdGhpcyBhbmQNCj4gPiB3aGV0aGVyIHRoZSBwb29s
IHdhcyBzdXBwb3NlZCB0byBiZSByZWFkeSBhdCB0aGF0IHRpbWUgb3Igbm90Lg0KPiA+IFRoZSBw
b29sIHNob3VsZCBhbHdheXMgYmUgcmVhZHkgZXhjZXB0IGR1cmluZyB4aGNpX3Jlc3VtZSgpIGFu
ZA0KPiA+IGFmdGVyIHhoY2lfc3RvcCgpLCBzbyBpdCdzIHVuY2xlYXIgaG93IHRoaXMgaGFwcGVu
ZWQuDQo+ID4NCj4gPiBBZ2FpbiwgY2hhbmNlcyBhcmUgdGhhdCBzb21ldGhpbmcgaXMgdHJ5aW5n
IHRvIHJlc3VtZSBVU0IgZGV2aWNlDQo+ID4gY29uY3VycmVudGx5IHdpdGggaXRzIHBhcmVudCBo
b3N0IGNvbnRyb2xsZXIuDQo+IEl0J3MgcG9zc2libGUgdGhpcyBzcGVjaWZpYyBpc3N1ZSBpcyBu
byBsb25nZXIgc2VlbiBvbiA3LjEtcmMxIGtlcm5lbCBhcyB4aGNpDQo+IGRyaXZlciBubyBsb25n
ZXIgZGVzdHJveXMgYW5kIHJlLWNyZWF0ZXMgdGhlIGRtYSBwb29scyBpbiByZXN1bWUgZXZlbiBp
ZiB4SEMNCj4gY29udHJvbGxlciBpcyByZXNldCBpbiByZXN1bWUuDQo+IA0KPiBCdXQgbWFpbiBp
c3N1ZSBoZXJlIHNlZW1zIHRvIGJlIHRoYXQgdGhlIGRldmljZSBpcyByZXNldCBvciByZXN1bWVk
IHdoZW4geEhDIGhvc3QNCj4gaXMgbm90IHJlYWR5IGFzIE1pY2hhbCBwb2ludGVkIG91dC4NCj4g
DQo+IElzIHRoaXMgcmVsYXRlZCB0byBhdWRpbyBvZmZsb2FkIHdoZXJlIHdlIHByZXRlbmQgdGhl
IHVzYiBkZXZpY2UgYW5kIHhIQyBhcmUgc3VzcGVuZGVkDQo+IGV2ZW4gaWYgdGhleSBhcmUgcnVu
bmluZz8gYWxsb3dpbmcgdXNiIGF1ZGlvIHBsYXliYWNrIGR1cmluZyBzeXN0ZW0gc3VzcGVuZD8N
Cg0KVGhlIGN1cnJlbnQgbG9ncyBzaG93IHRoYXQgYWZ0ZXIgdGhlIHN5c3RlbSB3b2tlIHVwLCBp
dCB3YXMgcGxheWluZyBhdWRpby4gRHVyaW5nIHBsYXliYWNrLCANCnRoZSBob3N0IHN1ZGRlbmx5
IHJlc2V0IHRoZSBkaWdpdGFsIGhlYWRwaG9uZXMsIGFuZCBhIGNyYXNoIG9jY3VycmVkIGR1cmlu
ZyB0aGUgcmVzZXQgcHJvY2Vzcy4NCg0KTGlhbnFpbg0KVGhhbmtzDQo=

