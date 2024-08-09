Return-Path: <linux-usb+bounces-13286-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F52194D905
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2024 01:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4EAE2832C6
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 23:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD69216CD2B;
	Fri,  9 Aug 2024 23:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MSejYHqd";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="INnn60gN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="S+9dO8z9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EFD168490
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 23:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723245046; cv=fail; b=lzcFF1RDA7TtXvgvgRKDEllzyoUrOntL4kyzOsuVdVXsn0RvoUbwPhk3HmySjWnLMM6xP92jNHsXkq9pknqLk9pyrBzioS89eMP1CUzlPYhJvM+Lom+qkT3HQEEl+ZTNMJPvAScB0d6oRUIb2K1mgCKSP5I8UNrPqfBJoOS8FWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723245046; c=relaxed/simple;
	bh=wQYNOJKqAE8C6U7laUmrKmZMgc2uNRz/GmReffh4/Ms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sy6q3PHKwnPkoMj5phU63MOMXjnLfOFXkXx9xeAHr1PZ0+/LyS8umqmQ2HznkthI4O5IFcU/sH3bLj3iv9ENWcQ452H3q2PUM+sGFI6uwTdJxd5S22ZKCsfcuEBy+j3/U3X3l+GV5xynjhHhBZA0jpFirFfUAAXYTaeTsUVnoRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MSejYHqd; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=INnn60gN; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=S+9dO8z9 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 479MC43r021938;
	Fri, 9 Aug 2024 16:10:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=wQYNOJKqAE8C6U7laUmrKmZMgc2uNRz/GmReffh4/Ms=; b=
	MSejYHqd8h9HvWs+m9uKsuLVMPBJD0osPF5ipzAf9uIXBQ/ckV8IrRIO8xerfSFI
	j2CgfwMQFPPrNK/vLHd5RhNVm/G2QL2dtD8LBS7c/Hi3bhldydcYFQaaOsCa7MEM
	P56baRXZxYBCVfnCwXxPeNscRqGwEbGyxdMjUnSzRm/1mO6ICQx5OkZbWjV7wxHJ
	qwI3JS9rAnbajn5q9NiV5oZLecZAcnSgAJ8SROtvs9NCmzLA7oJqFkv95LvDcvC6
	pR01xcdi3Rmql9FkBScu8yj03VnryFI3FBxGoQNFpEAhU2BH81eF9/9JCu/avHnk
	aEw6FnI2Xhmu43Zzs4eVYA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 40uujat97w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 16:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1723245033; bh=wQYNOJKqAE8C6U7laUmrKmZMgc2uNRz/GmReffh4/Ms=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=INnn60gNmKTPWrWouvM7vEGYIX7TitOcM3NaosfdInlcaFlPDgWvbSaFdqlnKThPL
	 ymZaIA1B4LA2gIJ16Rghq1jOSwxsPR4nwY7hs97IUxVGLoIoAzUq+vCNQYPT5BOrra
	 ST/BdiPo9DJw9Jy2f4Vli3+ID2nHPIHdIk3QRRH5o89S28dqlM7/2yU+bMtMY9yJ9M
	 mqucZAKnnsgpKt/42UFEseOldDB27XWwqdy+EKOMWK9TT2f7Eb4tAViYy10NUZgRzq
	 eRTuUdcN6TTdMTRFxXv3DKqBfxyv4SPxjWxZeiJ4xmmA30ZUiqLTgWbcFeyEeBU6y1
	 Zdi4nqRoXsuZw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9A68F40175;
	Fri,  9 Aug 2024 23:10:32 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5B6BAA00FE;
	Fri,  9 Aug 2024 23:10:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=S+9dO8z9;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9B3F640147;
	Fri,  9 Aug 2024 23:10:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaeQAhDvIbTrBQqaRvcd1V1dJMja4+RU1tMmb5LUq7T02tT4rxDAw5iPyzcj8q5irtwCbhgmK4R53TyzyjqgsUuuE55G7k7xvDGFfN3rQ4p87BRpuDeaIhwOZ6RXOa8AceWZDpRYcJczBhtfD3r2/MZzN12jA4c6CxuO2zk0qbW5pH8GrypALFeyljd5iLh6g4hrk/pzjWuBt4vAxj1hWCa0V5v0zDaN4ZTxzfMrAhlm/+jvgqYaNe0CIzvIozkF/qiV76LdrtRGE7IdPrdw3sc59/3mJ6ofNQsplA7/E3NJua89Jokn1VxRO+crcRc7dh8TRip2Vd2/N7AsiIFkIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQYNOJKqAE8C6U7laUmrKmZMgc2uNRz/GmReffh4/Ms=;
 b=JGcB/bjhhpiWWAq5xxRHf8L7qFJWp+2Ryj7hpqj2BjYKI4j6DDxqUv8MixE/elGi2fVn8JZeo/S0cqYUbNVo8+0364IoGEyCnbrDzJdKpiE/s9qvViRrM9DQbX7JEjoijzBwCqT0qCh2qZHN4+uwx8PMOgcs3QdCLiF1unrrF6tu4HqDB2Wc1bsRgw6DY5+Eo5fxjm20KIkfgpTcEZi4sX4joJULvidNc31ez9OFRvAFJ8i8Gf7Ps9lC+gEtDzAWM8POGYDdZiGVM0sf/V1D9ylwS000B5raQXodVzO1UZmi1aVOJ2JdX70QhHCfL3WYCGpI7meNS9UkwF+nyUU8Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQYNOJKqAE8C6U7laUmrKmZMgc2uNRz/GmReffh4/Ms=;
 b=S+9dO8z9bcWfcjEpE6JN0D8odB5kDC6U+7NAz3IYkmJ7736ddlE91lgGHIGSQhGewPTdWxjsvPdlcQOY6n9odWCJP+Cc+P1Mou25+fVR3IS93ZjWtFsQEHCbGTwtzM/C1rlV0wja/hPlEF3L8t7w/CTLHLYMBrLMhGkY5RI4YBg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB8330.namprd12.prod.outlook.com (2603:10b6:610:12c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 23:10:27 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 23:10:27 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Will McVicker <willmcvicker@google.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        "kernel-team@android.com" <kernel-team@android.com>
Subject: Re: DWC3 runtime suspend on cable disconnect while UDC is active
Thread-Topic: DWC3 runtime suspend on cable disconnect while UDC is active
Thread-Index: AQHa6nSXcGA8h7s8dE6vnyL947IEfLIfjakA
Date: Fri, 9 Aug 2024 23:10:27 +0000
Message-ID: <20240809231012.lmgqemcwjdfiaxak@synopsys.com>
References: <269e3ad7cbdb3b97fb8dc75cae4d487ce7f908c3.camel@linaro.org>
In-Reply-To: <269e3ad7cbdb3b97fb8dc75cae4d487ce7f908c3.camel@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB8330:EE_
x-ms-office365-filtering-correlation-id: c1f9247b-a6c0-44f9-531b-08dcb8c8750f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bkNBNnVMTm9XZi9uWFZ3SldOMWdPNXlKSDhnaTgvWnMzckJKcmtnMThFMTdy?=
 =?utf-8?B?SkFLTElmSVhlRktVeXlVZStDVU9yamVxTnQ0SXgwbTAzY2YwdTgycUh2ZGNs?=
 =?utf-8?B?RnF6VitFZ1VsRVJIRUtES3VtS205dUNCNUhuWUFBQzRiYnR0Z0lGV0JXS3lI?=
 =?utf-8?B?ZHlmMGMvOFNlc3F6U1RPOEE3UGpxb2I1OGk1TmlEYkVHQi91cWYrVEtpdlVz?=
 =?utf-8?B?T2FZQ3FZNURGS3Y1cGtUSjVCNzQxZlFjTE95RmFCRE5icXpIT3dhczJwYVA0?=
 =?utf-8?B?aUdYWjlDeWJoaU5uaEc3cXR6VHEwTEFNSDQzVDNnRUlPK05UdVR2RlRzZXl1?=
 =?utf-8?B?UEJra3BkUUlHRURaaTRnbThoNjdwS0daNG9HNEk4S29GN1Z2eEptdnFqZXNL?=
 =?utf-8?B?S05DaE1kL0JLQzJUUHlpeit3MWN3WGFCdm90QnJSUzlWUTZZQlNTZlQ2RDdh?=
 =?utf-8?B?VUJ0ZGkzWmJqVGE2ZVZxc1ZnajZrYXBNTmFXRENZY2NXNW95enlIWXF2OVVS?=
 =?utf-8?B?Y3QzZXh1R2c2TDdOU0hIbmw3L0Y0aHB6VUMwbGYzdWUrYU96ajM3N1FvYUg0?=
 =?utf-8?B?S25lelhxRWx4TGp3SU51N0Fnc042eE1xZUpEYmE5b2w3SkJSMW9ERGlsZkgw?=
 =?utf-8?B?NzJyYUlDaW9VV0ZSYnJXckdNR0VvNkxXMHdCS1d6dm9jRXVlcHhwcFZoaU5x?=
 =?utf-8?B?Y1hDMmZMSjczbncyT0orNGwyUUMxTmx2R01VcDdqeWRLdXBORlA5TE1xZ0x5?=
 =?utf-8?B?R2N2WUhYNHlZbGRYeTJWZ0JnanlCWUFudFhkSUFRaXhqY3dJNkhNZ0NFTlhk?=
 =?utf-8?B?MEdVcWJ4QmlCWHN1WEl2SmhFSFBiQVd2cnQ2UXJQSnovREdUZVpEdDhkL0Er?=
 =?utf-8?B?Z3l1ZHVmbk8ybExDVWg4V3BRUnZzdDIxVGpKNEdjd3EwMm9qRU1ZVm1abDFa?=
 =?utf-8?B?MEh0MlNQNkN4dStjR2hqU3NxNnk0NEYxd3RoNG5CREdSZzZ3bjhaV20yRXQy?=
 =?utf-8?B?Zkk2aXpqNGtBblc3cUd0djNLK1loQTN2R2VISEJhS0dDRHQvZTZEVUFUd1RO?=
 =?utf-8?B?MnhabVR1aEtnN3I2bldXQkxEbUVwNEVUSmNTci9sd3R4cy9PUUtuTEhOQ1N1?=
 =?utf-8?B?Q1oxOFprdlQ3QUc4KzNkV3Zzam82S2pBZUoraERycEs5dXRVRFNwdWx1VGlY?=
 =?utf-8?B?VmZsczYrNkZlVkZIZ1Jxc25yZDBFRk8zVTZkak9NcVN2Q2hjRWxLTnRFRlRH?=
 =?utf-8?B?TWxjN3oxczVDT1lXa3hmV2pCREJRSkJhNDhNbS80Y0RaZ2FrQk56NUUvM0d3?=
 =?utf-8?B?UWo0YS9tVW9Na2piRWxWQmN1VkRwSDJmQS9Ra3RMSER6MWtQaTk3REF2VHFQ?=
 =?utf-8?B?ZjlJTCsyNFlrSThWOWhrMG44TEI3U1BXZjUvWlVCTXUzNTVtdlE2dzFuSFJi?=
 =?utf-8?B?NFUvd1c0SWpvT0tLc3dMaGRjQXkweW85T2dZYjBSTEU5NzNGOTAvOVU1dVJa?=
 =?utf-8?B?YTZxZGMwZ0MzT2Vobnl5R3FMSVFrMGxOdy9KdHpsT09rRVVyNWhoWWZxeGZY?=
 =?utf-8?B?UHN2SzBFajgzU0FjVFpjZVZWTDVjUlQ1RWwyQXh5ZTdYaE53YVBXQWc4cjh0?=
 =?utf-8?B?OTk5b1AxRGMvaUlPSXNiaGpkalplZWN5aU9PMkpxNjBZaEJTSHdCTW5vNzBN?=
 =?utf-8?B?ZjBGYWVLL3d5cWk1amQ1OGtrWW9IQjFBWW9qV2pnR2M0N2xwSVJzMkZwVnBD?=
 =?utf-8?B?dFRsQkx6bm5BV0NodlNWUTRpYVVucGdITzNWMDgxd00wWmhmbkU2NE9yVStP?=
 =?utf-8?Q?u8BiqoaOIYg02BcvS/flZI7bYGhixX9ReWpDk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T3dEb0g0c2k5NElXN2lYaDIzYkRlWmU1czVldnV4U08rRFBZRTdHSFVRWXFD?=
 =?utf-8?B?WHNMcndOczhzYmhnRDdEWU4vQTErZjdsZEdwSm1BWlplWDF1RE9jaXo0bG9s?=
 =?utf-8?B?TmxIeTdXdTRCUkFRY2czNkxEVTVQaUYvOTR1c0tiRnowVThLTE81R05jNE4x?=
 =?utf-8?B?bitEYlVSOFN1YStiT3lUQnZ3TXN4RndCME11ckhwaDlrQ3F1SXJVUHo2UWdN?=
 =?utf-8?B?Tkx4ZXhJOVRvZHV5NWZSd1VOV1Q4RnBsTWg1a2ZqVk9Ec3JCYkNnZUVqNEtJ?=
 =?utf-8?B?T05wZUFmOWwreStDMzJVR1VDc29PL01qU1lXWE5MRG8zem9sV0FCWWV5N1J2?=
 =?utf-8?B?MDB0Z00zTTJHUHRoSFNMYUc2ZGFvT292V2VIamlSc2E2TlpJeFhwTG9VSjdt?=
 =?utf-8?B?cXphVFNrYnlmc2plMTlkMU9GNUxrdTZJd1VYZXJ5UVZGdmpYdFRERDBsRThQ?=
 =?utf-8?B?ZW1aL2IwbXF3SzQwWnZGNjBMVm5iYi9ObVdSYUtsekw5K0VDTytiUGlLdGhq?=
 =?utf-8?B?aHRzM0N5VC8yYjBTUGk2bjZjT21LaFZSRVpxbDUwaUhaaVl5UkhBaWU1MEJZ?=
 =?utf-8?B?Q1FLV242L3oyUWlDcy9nbVN2ZVVEblhSU1pVUXVBRFdmSDNvVGRRcjlKZmhH?=
 =?utf-8?B?L3F0RmNxdHJQUlJNZXhnVVNsdnhObnlhSFI2R3lRUW5MSitQNUhHSTNFNWd5?=
 =?utf-8?B?NnFTNU44TTNlOFBWKzhVa2JDT0pVeWdOMFNwZ2xPVTE2VU9mcCtxUy9TQ1Zz?=
 =?utf-8?B?Zy9Jd2hwMmJaR203aklKMHNDaGtrTFVMaDFBUERNV1pBVUZ3bk01cDBuWnZw?=
 =?utf-8?B?a0F4eElOMTc4aGhScHR0NVBoa2FjU1NyNEdMYmdJc0NPY0xybmZiRDk0eUpU?=
 =?utf-8?B?b3Z2eFlUaUhVK0Z6Y1V5N296Wkt5R3Z2VzJCcjNFNGFDbjVNRURmd01OYzlh?=
 =?utf-8?B?OCsvVTR4RjdhY005a1dCaEVNalk3OFNWa0dMdDY4VDQyTDFtTWppTC9qWkFH?=
 =?utf-8?B?QUJEMkJoVTRTTzFVKy94ZEp0eENmRHZJNWdEL0NqRnluSWNKVzV3bEF4OHps?=
 =?utf-8?B?NUJ4S3A0aFM1TjA2bys4bFM5cy9NcWpkSlhNaS9RYkpqNjRpRlNDalEwQ0NV?=
 =?utf-8?B?MmZITzI5QXk5QXo3UjhmanZ0cmYrRVpOR3NWL2ljejY1OFpCWjBuRWJUcHJK?=
 =?utf-8?B?UDJvdENDS1hZVm1tSHU1MkZwMnRmOGh3Smh0WG1SOFhzNmRhT0taQ2FuZ3Yv?=
 =?utf-8?B?a1REYXEwa1BKWmhuL0k2b1ZkYVYySlpMWlF4RWxmN09vdFViLzVmM0NLK0xj?=
 =?utf-8?B?Ty9xTEhUSFgxUmJ4TnV0a244eWVzNEVmOE9NdTB0NUI1bDVGWnlXMWxCUXg2?=
 =?utf-8?B?Wi9KdHRtL3FIRHdYYVNFQjIzVm5uWlBLaEdNakhxbTVNZTBOOVI0TVhsZU5U?=
 =?utf-8?B?MDJkWUhtY3BQM2lmWTlqcjNmOC9QS1hqYXR5aG5iaE5PZVdYN3JWWXozY1NR?=
 =?utf-8?B?TEhXbHUwUUJJcmE0RXpvNm5JQksxTkxBWVBtNStQTUMrR1ZnWE5CTForbEk2?=
 =?utf-8?B?N05tVVlqei9OS3psc3JJektMZzQvK0RkTlBwRnY5MTcrZEwzMzNjZUJGNXhK?=
 =?utf-8?B?R3U3L0I5ZGdVVGd4ckhJVFZYQ1g3UHJHVEQwU0JxQWNVUU9WM0c0Ykplb205?=
 =?utf-8?B?eFpyUHVyZXN6aGpTT213aGtZcVZ4UGpzMEZwY2tiSXZmTjVma2d0WWRKMGpv?=
 =?utf-8?B?QlNWai9nbVR3MTZSVERCNmNnU2doeVJKTjNUZmJVVDlQbU45TEN4eFcvSzVZ?=
 =?utf-8?B?bGE1STlrZVg0ZURHcHBIazIyWFU4L2RycjVMTlpMczlJY0QwZWRxamJOc0U0?=
 =?utf-8?B?Nkx0NVBNaHRGdG5kQ2JoUU1xSWl1Zk5rUTRxU21FKzNvaGR2WjJta2x6eHFr?=
 =?utf-8?B?bmV3bTNzMDZCZkViclVrNEM1cHIrNGgyaWhDTWwwWEhrQWNhckJSRzhSY1R6?=
 =?utf-8?B?enc3WmFVNVVyWktSTzQwdVFOVmFHRTJLbHNXQTcrazFMckVacXpLU0dVRjRU?=
 =?utf-8?B?blpPT2lWMUliZ3ppcE03QTlncFVxTGJ3SGpCenBJMFo5R3lvUllmUUJRM3hu?=
 =?utf-8?B?akFsN3A2ckppL0FFMm0ySVRkUmxRU0NHY091TWpYbmZGRjV1WkdRRGRUdE9T?=
 =?utf-8?B?N0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F221AB57457F5D40924633876692CFE7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8w6c/OzYJZBIJoSbkTPK1wB5IBRNlqA03bYfIafEDBPdhV6npS1gAJCnwshOOw96Gct2/Z7KPkc9irmlV8PnMJXfgfxV/F6RxsDl9zok+R9F5lX3lxZViSIDNmCUIfI4a4ZfK99QV1I6XxQCGHKckpuGCWS9NvNCHw85jFVjMt7rIOulw2R/+tLbIYI8rcN14EMOAIH+eM5RukW5xG+okGrfThxLVCMIfq5oOJbkvTMnAhc22QKlOPGTegsPJNqjpMKx8oRQW7ru2PLGrERc/D72pELfH0oL/ZgYgAaK8n6XfNmgVva8hv/WJouchvHDfH0O/21a0Z45uKIOZl5AzeVOPETqiSBz0N5vGQZsvR05R3Rmy4LKqwyX+g51fAuaOgLnVW6pM/qmhTV3C5zWnYptquO7Q5IWHEl11vF+GsTWhEDCLmGSwsb34kW6KHyvhFy+apx9FFSPS+/39euC+W2VS/Sad5AnJMwXTdfpu3NFHfzRwtniuTB7BPHKwHzsgpvmW8w7qiDEWZ8uJioP9iZnIReaRAfNkMI2cAldjuVR18YkAPNjfSxYSUxFzWZ1exWKEA5NxpaOg3pbq1NZKR3CK8GmddpA5OV1H6/rtFcB6LZLWNWDM8cn60aiMMVHyNY9PsFOo59CezQ1u9bNAw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f9247b-a6c0-44f9-531b-08dcb8c8750f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 23:10:27.6264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nfkutZzMm0fj4HOe03S9aZSfpgwjxzpnon2e8Ags1Ls4J7KpzV6zNTYmU2tJmz3gRIWcgGSjWOX2shWsJritLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8330
X-Proofpoint-GUID: fO_q14KABz5EF0LJqD_COqGYG0QZvq_B
X-Proofpoint-ORIG-GUID: fO_q14KABz5EF0LJqD_COqGYG0QZvq_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_18,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999 clxscore=1011
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090168

T24gRnJpLCBBdWcgMDksIDIwMjQsIEFuZHLDqSBEcmFzemlrIHdyb3RlOg0KPiBIaSwNCj4gDQo+
IEkgYW0gdHJ5aW5nIHRvIGdldCBEV0MzIHJ1bnRpbWUgc3VzcGVuZCB3b3JraW5nIG9uIEdvb2ds
ZSBUZW5zb3IgZ3MxMDENCj4gKHdoaWNoIGlzIGFuIEV4eW5vcyBkZXJpdmF0aXZlKSB3aGVuIGNv
bmZpZ3VyZWQgaW4gRFJEIC8gcGVyaXBoZXJhbCBtb2RlDQo+IGFuZCB0aGUgVVNCIGNhYmxlIGlz
IGJlaW5nIHVucGx1Z2dlZC4NCj4gDQo+IEZvciBtZSBydW50aW1lIHN1c3BlbmQgY3VycmVudGx5
IGRvZXNuJ3QgaGFwcGVuIGlmIGEgZ2FkZ2V0IG1vZGUgaGFkIGJlZW4NCj4gY29uZmlndXJlZCwg
ZS5nLiB2aWEgZl9mcywgZm9yIGV4YW1wbGUgdmlhIEFEQmQgb3IgaWYgQ0RDX0VDTSBhcmUgYWN0
aXZlLg0KPiBXaGF0IEkgb2JzZXJ2ZSBpcyB0aGF0IHdoZW4gYSBnYWRnZXQgaXMgY29uZmlndXJl
ZCwgdmFyaW91cyBFUHMgLyBUUkJzIGFyZQ0KPiBiZWluZyBjb25maWd1cmVkIC8gcXVldWVkLiBU
aGVzZSBhcmUgYWN0aXZlIGFuZCB0aGVyZWZvcmUgcHJldmVudCBydW50aW1lIFBNDQo+IGZyb20g
a2lja2luZyBpbi4NCj4gDQo+IFBsZWFzZSBjb3JyZWN0IG1lIGlmIEknbSB3cm9uZywgYnV0IEkg
YmVsaWV2ZSB0aGF0IGR1cmluZyBjYWJsZSBkaXNjb25uZWN0DQo+IHRoZXkgc2hvdWxkIGFsbCBi
ZSBkZXF1ZXVlZCAvIGNhbmNlbGxlZC4gVGhpcyBkb2Vzbid0IGhhcHBlbiBmb3IgbWUgdW5sZXNz
DQoNClRoYXQncyByaWdodC4NCg0KPiB0aGUgVURDIGRldmljZSBpcyBleHBsaWNpdGx5IChtYW51
YWxseSkgZGVjb25maWd1cmVkLCB0aGVyZWZvcmUgcHJldmVudGluZw0KPiBydW50aW1lIFBNIGZy
b20gd29ya2luZy4gSSBkb24ndCB0aGluayB0aGF0IG1hbnVhbGx5IGRlY29uZmlndXJpbmcgdGhl
IFVEQw0KPiBzaG91bGQgYmUgYSByZXF1aXJlbWVudD8NCj4gDQo+IFdoaWNoIHBhcnQgb2YgdGhl
IHN0YWNrIHNob3VsZCBiZSByZXNwb25zaWJsZSAvIHRoZSBlbnRyeSBwb2ludCBmb3IgdHJpZ2dl
cmluZw0KPiB0aGUgZGVxdWV1aW5nPw0KDQpXaGVuIHRoZXJlJ3MgYSBkaXNjb25uZWN0LCB0aGUg
VURDIGRyaXZlciB3aWxsIG5vdGlmeSB0aGUgZ2FkZ2V0IGRyaXZlcg0KdmlhIHRoZSBnYWRnZXQg
ZHJpdmVyJ3MgZGlzY29ubmVjdCgpIGNhbGxiYWNrLiBUaGUgZ2FkZ2V0IGRyaXZlciBpcw0Kc3Vw
cG9zZWQgdG8gZG8gdGhlIHRlYXJkb3duIGFuZCBjbGVhbnVwLiBUaGlzIGluY2x1ZGVzIGRpc2Fi
bGluZyBhY3RpdmUNCmVuZHBvaW50cy4gSWYgdGhlIGdhZGdldCBkcml2ZXIgZGlzYWJsZXMgdGhl
IGVuZHBvaW50LCB0aGVuIGFsbCB0aGUNCmFjdGl2ZSByZXF1ZXN0cyB3aWxsIGJlIHJldHVybmVk
IHByb3Blcmx5LiBDaGVjayBkb2N1bWVudGF0aW9uIG9uDQp1c2JfZXBfZGlzYWJsZSgpIGZvciBt
b3JlIGluZm8uDQoNCj4gDQo+IEkndmUgYXR0YWNoZWQgYSB0cmFjZSwgYnV0IGlmIHBvc3NpYmxl
IEkgd291bGQgYXBwcmVjaWF0ZSBjb25maXJtYXRpb24gcGxlYXNlDQo+IGFzIHRvIHdoZXRoZXIg
bXkgdW5kZXJzdGFuZGluZyBvZiB3aGF0IHNob3VsZCBoYXBwZW4gaXMgY29ycmVjdCAoVFJCcyBz
aG91bGQNCj4gYmUgZGVxdWV1ZWQgYXV0b21hdGljYWxseSwgYWxsb3dpbmcgZGV2aWNlIHRvIGVu
dGVyIGlkbGUvc3VzcGVuZCBzdGF0ZSksIGFuZA0KPiBpZiB5ZXMgbWF5YmUgc29tZSBwb2ludGVy
cyBwbGVhc2UgYXMgdG8gd2hhdCB0byBjaGVjayBhbmQgd2h5IHRoZSBkZXF1ZXVpbmcNCj4gbWln
aHQgbm90IGJlIGhhcHBlbmluZy4gSW4gdGhlIGF0dGFjaGVkIHRyYWNlIEkndmUgdXNlZCBBbmRy
b2lkJ3MgQURCZCwgYnV0DQo+IEkgb2JzZXJ2ZSBzYW1lIGJlaGF2aW91ciB3aXRoIENEQ19FQ00u
DQo+IA0KPiBUaGUgdHJhY2UgY29udGFpbnMgdHdvIHNjZW5hcmlvczoNCj4gDQo+IDEpIHBsdWcg
VVNCIGNhYmxlIEAgNTE4LjYxODIxMQ0KPiAgICB1bnBsdWcgVVNCIGNhYmxlIEAgNjc5LjU1Mjg4
NA0KPiAgICAtPiBEV0MgZ29lcyBpbnRvIHJ1bnRpbWUgc3VzcGVuZCBAIDY4Ny43OTIyNTMNCj4g
DQo+IDIpIGNvbmZpZ3VyZSBnYWRnZXQgKHN0YXJ0IEFEQmQpIEAgNjkwLjc0MTI1NA0KPiAgICBw
bHVnIFVTQiBjYWJsZSBAIDcyMS4wNjI0NjINCj4gICAgdW5wbHVnIFVTQiBjYWJsZSBAIDc0Ny41
MDIwODcNCj4gICAgLT4gbm8gcnVudGltZSBzdXNwZW5kIGhhcHBlbnMsIGR1ZSB0byBUUkJzIHJl
bWFpbmluZyBxdWV1ZWQNCj4gDQo+IElzIG15IHVuZGVyc3RhbmRpbmcgY29ycmVjdD8gQW55IHBv
aW50ZXJzIHdvdWxkIGJlIGdyZWF0bHkgYXBwcmVjaWF0ZWQuDQo+IChVbmZvcnR1bmF0ZWx5LCBJ
IGhhdmUgbm8gY29tcGFyYWJsZSBwbGF0Zm9ybSBhdCBoYW5kIHRvIGJlIGFibGUgdG8gY29tcGFy
ZQ0KPiB0cmFjZXMpLg0KPiANCg0KUGxlYXNlIGNhcHR1cmUgdHJhY2Vwb2ludCBldmVudHMgcmF0
aGVyIHRoYW4gZnVuY3Rpb24gdHJhY2UuIFlvdSBjYW4NCmNoZWNrIGhlcmUgZm9yIGhvdyB0byBk
byBzbzoNCg0KaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvZHJpdmVyLWFw
aS91c2IvZHdjMy5odG1sI3JlcXVpcmVkLWluZm9ybWF0aW9uDQoNCj4gDQo+IFRoYW5rcywNCj4g
QW5kcmUnDQo+IA0KDQo+IGludGVyZXN0aW5nIHRpbWUgc3RhbXBzOg0KPiAgIDUwMy4xNDI2OTYg
fCAgIDYpICAgICAgICAgICAgICAgfCAgLyogQURBREFEIGF1dG8gcnVudGltZSBwbSAqLw0KPiAg
IDUxOC42MTgyMTEgfCAgIDYpICAgICAgICAgICAgICAgfCAgLyogQURBREFEIHBsdWcgY2FibGUg
Ki8NCj4gICA2NzkuNTUyODg0IHwgICA2KSAgICAgICAgICAgICAgIHwgIC8qIEFEQURBRCB1bnBs
dWcgY2FibGUgKi8NCj4gICA2OTAuNzQxMjU0IHwgICA2KSAgICAgICAgICAgICAgIHwgIC8qIEFE
QURBRCBzdGFydCBBREJkICovDQo+ICAgNzIxLjA2MjQ2MiB8ICAgMCkgICAgICAgICAgICAgICB8
ICAvKiBBREFEQUQgcGx1ZyBjYWJsZSAqLw0KPiAgIDc0Ny41MDIwODcgfCAgIDApICAgICAgICAg
ICAgICAgfCAgLyogQURBREFEIHVucGx1ZyBjYWJsZSAqLw0KPiANCg0KQ2hlY2sgeW91ciBnYWRn
ZXQgZHJpdmVyIGlmIHRoZSBnYWRnZXRfZHJpdmVyLT5kaXNjb25uZWN0KCkgY2FsbGJhY2sgaXMN
CmhhbmRsZWQgcHJvcGVybHkuDQoNCkJSLA0KVGhpbmg=

