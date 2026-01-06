Return-Path: <linux-usb+bounces-31951-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5138CCF77F6
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 10:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 713773041F54
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 09:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B2B313264;
	Tue,  6 Jan 2026 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="DfBeWtyd"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013037.outbound.protection.outlook.com [52.101.127.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA7930E84D;
	Tue,  6 Jan 2026 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767691411; cv=fail; b=l2M+AuepEVfU7L92Vu9w6DAmMz89uUIweFZKSU5bdBkUfJDpleqdAs2t6S6w0po4tLU/QVsUJRLklC6UB1lZg/oAjGuknRpaS6TnvBVkciZTMmQ9Z1R0eIwY+ES1Uv70R1YBVOOTNHXgUERQCGjELC5tEYZeI7+6XBmnil9nqtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767691411; c=relaxed/simple;
	bh=MJ9Fa/FgHHiNsa7gQu5p6Pe2Wp1YWjuZtf5X47fSiV0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WHJKtn516Q4Y3S3qjS/HDZ4jrckEc/go6wl+FXyvv4YJ4A21DEnsSsbo0YQjIJwIEsNiFWenhTMqfOuuPgwuBWLJelpEx+Oj6q/tmVPfH7obZPshAR7XJcXFUUB98vNkOU9uVeSNIP/1YhyfXcBCyUFW5L+oBf2GVZA+0hebKic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=DfBeWtyd; arc=fail smtp.client-ip=52.101.127.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqLIxntLkwrQ5UHE3ly3KyFFfJTiiNYDzR3iOsSJjH0uvOD5O5Mjqp6czHoeP5Pl672Vul8pOa/aVko53GIdQNmmSB/xKCXkZxmaR8arhkmnYozuDhtG0d6xtzGbXarUF2ZBZpDAy3dTeS9HfN8f7sxei+I89uhdR4mxKhiHIrASSRHrkCfQBH3qyduoL0r8Nzjxx27LSorpMqPqfSb3k3rW7ocIjkOaCYoCug7mg0xnJgnyoZUZZMlrI2TavvCbLXQrMi+OG+CPUvSZK3SHaTbG9itmzLIyuSZpSF1WEmwDtVNZJPSaRdMZ0MylGBHgySA4PmXUe8nS4M+DjdStiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJ9Fa/FgHHiNsa7gQu5p6Pe2Wp1YWjuZtf5X47fSiV0=;
 b=xLfbsYdvO2mxU4WUH4nwWhRI0VMnJ1CfVEwBlu/kWhClpqgmO8eUVMGJH9GHXtdgEjhV0H9DmTUH39uCM3EQMh/7gnxtXzxeeuzij2yiyZdeVwTRlWm2MIuUKyI6MQJu1FsMXr4wcVX7ol/mHQym1fKwTAAYkvkfc2W7SAwIgGvloygzIlO89RfC4aNyyBiB6I215Pjuz2c7yUuhdoOGgTazNUBZA8j2m3hGkl2fgY3Xn6xN/NhUi5RAzvAtvwuog+QaKqwBVDxA23FL3YZS4bRVOrZZQBHParQCq+LSS3vmdZ4M5faua8btFYsRYTIQFLTst7snzUSw4gVrYI+onA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJ9Fa/FgHHiNsa7gQu5p6Pe2Wp1YWjuZtf5X47fSiV0=;
 b=DfBeWtydC5P3STp0vcZmoUSXewWyP2C+HU34sopRwCKVMnjFIr87CjofHd4gKqYLuUrhchkd0zfBRhi9WxJI6fDlzgCamjqrDSr51NrfywYaBJhPdmpkzyVVa014gkgLUBY3F60mzjw15QVQiRsGW1s2B2jrF0Je7MFQt6je5z7tb1JHr2r/kWVcU8yGhNIKOL6sQ6AbPNbaRmyyKCJfsEvU5E7O2IDAG3ls+EfVHc90lYgyps/McsZi/BS3bgKGIOCBuygCOg44ZGeqTFJ3ArInd9/WfvG036Fnfw2Gy2Z9eaTx4GvSa4HqKnR8FMuEjpt35SB7MoXxMbnZd2DNmw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SEZPR06MB6572.apcprd06.prod.outlook.com (2603:1096:101:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 09:23:26 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%7]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 09:23:22 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman
	<mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "quic_wcheng@quicinc.com"
	<quic_wcheng@quicinc.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject:
 =?utf-8?B?562U5aSNOiBDb25zdWx0YXRpb24gb24gdGhlIGlzc3VlIG9mIGRpZ2l0YWwg?=
 =?utf-8?Q?headphones_freezing?=
Thread-Topic: Consultation on the issue of digital headphones freezing
Thread-Index: Adx9d1oMYEJvjzUWS462ZgXY544fRQA0iX8AACkKKgA=
Date: Tue, 6 Jan 2026 09:23:21 +0000
Message-ID:
 <TYUPR06MB62174179E2B4210E229872A0D287A@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217B105B059A7730C4F6EC8D2B9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <f2c03c5d-d667-4398-9267-77d7f6aaf6b3@linux.intel.com>
In-Reply-To: <f2c03c5d-d667-4398-9267-77d7f6aaf6b3@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SEZPR06MB6572:EE_
x-ms-office365-filtering-correlation-id: 7be80b81-e1a5-4c57-48bf-08de4d053c22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q1RwWFduTXNvZWJwVUVwQllGNVUzRmFYUEhndEUwQ0NXTXdnRkV6cDhzSTBq?=
 =?utf-8?B?Q0UyU3pTQXRYU2grbWhzOTdGREJZRlZzVnVabUlxR3FWaXkrZk5pQmVXbGQr?=
 =?utf-8?B?YzJwVVJQUWNjZHE0c1RsbVdvNjNmLzQzamprRXVTVitxWVFwU09HaGxiSml4?=
 =?utf-8?B?VGs2aWtMbk9vYTRWUXB1aGJtYW9nRkNmTGM1ZXJTWHJUMXRwS3ZHWFFsNVVv?=
 =?utf-8?B?NmU0bEtyRytpalg0YldsQ1pQalBSK0VnUXM3SHgvakZQVWNrTXovRmRibjVN?=
 =?utf-8?B?dHBiaDBJY3hJK1djR3E0UG5CN21uTEl5ZWkyUWw0ekRWTFlSNk9sUTB4dEJl?=
 =?utf-8?B?OVF6K1FoWmQzdnM3dVlmU01QT2JVaUhDelBZcSs3cFlTdTRzc0g3N1R4eVlo?=
 =?utf-8?B?VEhmZERpeHdkeWNHTWRrUzRpaUpPNm9LazFkc0MxUGJnbHFvamQ5cFczM1RS?=
 =?utf-8?B?SDJJREc0ZXZkRVJYb205ZEtxM3d6YVlxSWpzMC9SWGlFeW02cnd2YkZtRkZx?=
 =?utf-8?B?b3NaMFQrUFlVQUNlUzVDcWhUcFBqL1h1ZlBsT2YyMVJCUEE1S01DUUVuNkVJ?=
 =?utf-8?B?cGhmR0N1QThVcmZkQkQvSU5tVUNRS0JOSE5xNjNaSU5Sd2xJcWI1QS9kYjVx?=
 =?utf-8?B?RTNEVVdJN05FWTU3RVZlVlZYbE1QbHErRjJzQVB2Y25rMWRvUmloYk01cHFK?=
 =?utf-8?B?NXNRTnpyblozdjNaUldRVmlUc01saVpqZDBCZVdMWmp3SHgxaWpoakN4dzRJ?=
 =?utf-8?B?UUJTWDI3Q2laVGNnZ2FhYWE4aUtqT3VROVhpeW81Z2dnL2o2RHFDMXNMemEw?=
 =?utf-8?B?cVhnczZUcHhGUTBLa3FhcmtSYVhhV203TklCUVRueEdJYWlYcDBMR0ZOUVdJ?=
 =?utf-8?B?STUrSWNBQjJzTXBwcnNORUVhTTlBYkN3WlB4V3hTa2RkYXZZUURQVWYrN2Z3?=
 =?utf-8?B?bHMwWlFGcTFET3hyRVBSVmlHcmZoWG1NRFN6TTJGTlo1WGcwSENlbnkyMUZx?=
 =?utf-8?B?cVpNelJQYU43U1E1NkVKMnVYVEhzWEZGLzUyTmhadlBxYVA2NkF6Wmpxc0ha?=
 =?utf-8?B?alJ6WE9XUVJjM1JDU3VGOUNaTlJUUkIyVkh6UEFMVGFURGZDNEpYKzNSMmdB?=
 =?utf-8?B?Q1d0bk13YzZUcFRuU09zSDZrUU8rcUdSTDV1WE9xQk01cUZCV1VHZWQwK2N5?=
 =?utf-8?B?cFE2cVU4YkUrSWNPaEJSSTdwSXNUaVVLVnhyV1RUeHNiSHVLT0lRVUdjSjFz?=
 =?utf-8?B?OVBFRGZ3RERERndENnBlWVhUWExWdHVyanpvRG96Lzg1N0VEeTArTWJvM0R1?=
 =?utf-8?B?M2ZuZGdUSGkyaENxWE9UMmRRUkJ4VFhhUGpMNDFLeklob2NmSXNEbHVlYlha?=
 =?utf-8?B?Q1NteFVJT2dRcDFnZE9VWnFwL1NVR2t2azZ2blZaQ2lYSHgyTUhiQm13clNQ?=
 =?utf-8?B?RGJtcnRFNzdMbzdicy9ObWR6dTYycjdmbHhNNEgzS3M1OWZhSVZvbnBHaWw1?=
 =?utf-8?B?ZThaNS9kNWdvc2RJZnplVWtuWEo1R1RpK2ZmOHB4R08ya3QyMzRrNjFZYmlB?=
 =?utf-8?B?RmFZV0o0SitobVAraHcrM1o4V1lLbzlVRURmUDljMTJ2My8wWndXd1hrbkNK?=
 =?utf-8?B?MkMvUlpwQUtSK3dlL2dPVnV4ZE43aUUwazF4Z25CZnFIWXI0dDM2ajZtYUl3?=
 =?utf-8?B?cmdGS00xaW9mNStHQVR5ZXZnazZWZTY0NnJET1pKQVVtMkhsZFVhVXVGT1M1?=
 =?utf-8?B?MDQwVjRJWXFKK2FMYngwUEtpcFJZM1l6TnBIRkZxT05OZUplb1lzaTE2ejJC?=
 =?utf-8?B?UXM2TU5GbG5Yd0x2WE5BRGczZU1DaXR5ZThmSysxOHhWSm54TG12eUFWcWE2?=
 =?utf-8?B?UjNYRVZxcG1SZzBXZ3RuSFRFczlMeUVBQXRCUS9BbGhIVUZoRCt6TUJ4T2VP?=
 =?utf-8?B?Z0VSMGxjQzFIUWpJcnhRck1KYVpRWnVZbm9lSkVUVzdCSGhhNExmbzFkdGNS?=
 =?utf-8?B?SDVXK2dldnZhM3B4UkhUNjBDVWRYZVlsSG9UNG0yeVY2NnQxVEM0OURnR2xY?=
 =?utf-8?Q?i1AgZb?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TzJMNWhJMms5ZG0yOVNRZlNTd0VVR04yeWJuRzdVRVBtS3l6NGFDdGZPUUFL?=
 =?utf-8?B?MmNkQVhLZVJ2WFM3cHp6SlRXK2hUWGlFbWFFbjJJODNVUElDVGdPUGk1dVJP?=
 =?utf-8?B?Y09yNmorOUNualZTT0d0SkN4OGhlSEJDdHJZN2pzdGlQb2tEeG9GTkVLdnV3?=
 =?utf-8?B?bTB6T0psZDJtTFdZd0NEOVRqd1NwSDZvdDQ4a1g0WFVGL1JHT3lOUm4zb1RN?=
 =?utf-8?B?a0NkN3ZHS1FiNFNCK25xVWRiUzQ0MnJOcUM0ZmRiU3VjMkZ0dTgybVQwNWw2?=
 =?utf-8?B?WVpsaUxNZ1Fhc0VqMS9PWC9Ed0NBcjdHMjFacGIyOHVhT3NuZ3N2THZhUHVo?=
 =?utf-8?B?V3JHV0FmaUc2aGpnV1VWYnNpaUxUNXo1SEpCZjFWbDZETlY3a21JVldLMkJC?=
 =?utf-8?B?NVZxSDVyUW5iVHFITk1ic2lNR0ZEaFY0eUVDbFJtOVNDS3RjbENJSGlHSEtD?=
 =?utf-8?B?b0dlbFZBd0twb1lVZTUzSVdxOTYveHppUHByMTJGQ2VickVHT1lvcS92cFo2?=
 =?utf-8?B?UFZzTDZkaVRCSGIvMWhKcmlnZndzM0xRYUVIUUhtY2xVTUNQbnJvNnhLMVpZ?=
 =?utf-8?B?anRFTjhXdWpZS05Jb1FyQmpXa0dNVUtjWklUM0FLdUNtL1VXMS9vdmNydE8z?=
 =?utf-8?B?TkZuMDVBZlg3Q2pCRlVFQVB5T0hHMkZwVGE3U3pobWVGRG40Z0h2dVdJM1Ir?=
 =?utf-8?B?QURSa0F5emptZ1RpMnNDekFmL2c5U0tNRmp1ZFI3b2daSks5TUNKWWpFMjds?=
 =?utf-8?B?YUZjcUgwNEdaT1Jkd2R5WisrNSsxTVc4SldiRzdCOFFCa0NmN2FKRWF2R25r?=
 =?utf-8?B?YXN5Vkh6eGtmU0RzMUNUUDJqUXZ0aUo2Qjk3dVdhZ0EwUzF3K3ROY1pURjBp?=
 =?utf-8?B?K1BpdjZyUDl4aS9XRkJ5SktvSDh6WDg5SzU2Mms2b0o2RytQVTBvOE1tSVBa?=
 =?utf-8?B?UkFrc20raHJRWWJnQVBud2NyL2hmaFp2Zm9SRlMvbUhPclZTd0tBNXFtM09Q?=
 =?utf-8?B?VzBJYk5wREtNekNPaEYwNkdrYnFrSmFSbjV1alZFVzR2WlVoU2UrMW9US3Fp?=
 =?utf-8?B?VUF5VU5qZmF2NlZlaUs2WFc2LzlKb0hYVDZoVG5ZS0xXQmZFUktwbk5ad0Vh?=
 =?utf-8?B?VENDVklTdlpBS2h1emNUSlhibDlHdkFtM3NpZkFYRk9oL1FDb3dlYWtOVGhy?=
 =?utf-8?B?czMvMlVwQloyMTRFUHl3S0RWUUNZelVHZ1VqdjhIb0MwRmhUVHNXVGpqaXBJ?=
 =?utf-8?B?Z1k5S2huUE44UzdKRGdCYkJ5R25kWnRpS3htdDNQVVdNclhKRjltU2xhbGIv?=
 =?utf-8?B?YWhCNmpDTFZGTWVyNGUxcVBrY3BRZm15S3NZUFJmRTRiQ1NsR0kvbUZuODNl?=
 =?utf-8?B?cFVwbjREVUxBMFNma1NXVlF4SFVLS3YxMEpzTzJOTjIveW9md1FlVGlQQ1dZ?=
 =?utf-8?B?b2tQNWgxemQ1c0pjd3RhYllIM0Z2NnNZTG1UaHVOWlMwMU9Zb1hiQXhZZGJE?=
 =?utf-8?B?R2hUZmE0dk5KS3dCUW9XeDV4bUlQNCtNNEYrMWNBcUFzYVhzOGJmUzRXeUdW?=
 =?utf-8?B?NllTYm5RdVEycTJNT0dDTnlnVjJOWDB5SXFGTmdXalVoTTQvdHU2YWdtMkhC?=
 =?utf-8?B?T3hhL3l0TC9meVJzY3ZKREFwaEF4cDd4eGFVWkYvVG41Mk5GcW93dkl5aWJq?=
 =?utf-8?B?akRTZ2RjNnZJMTNKeTFQTU8vNjBiTVIxanA5Z2VQY05yZmhndkxITUZ1ZkRm?=
 =?utf-8?B?d1pCMW4vVzBqL0s1Tm41ejRBVHJmeW1kRi9GSStsRFdDdk1LWWlraFZyQ1JL?=
 =?utf-8?B?TWl4TXlNSk1lS1ZKdHQ1cVJSanNjWnJjWHQvREZoUWIrQ0dRdktpK3JTdVhv?=
 =?utf-8?B?TDVWK2ZBbUFTQ0MyOHZDbmZrZmFiNzVLMTZ2eWxEZTRxMTI3M2MwemYvQnox?=
 =?utf-8?B?Wkc3dzJUc3dqci8xSGpqdkVydUV5NUdzY0JweWo0czk1QlZ3ZlF4R2ZxLzFZ?=
 =?utf-8?B?N1pWaWxDY3pGeVM0SHFlZFUzNThWL2JEQlBZQWpmMUdtajg1M2N1VU1XUXor?=
 =?utf-8?B?dWx0bmxHNjJWSFZud0x5OUZHL2J6NksrcEwzUWhRSWdTSTlKeElCUjBOMWJy?=
 =?utf-8?B?QzRIVWg3RlkrbXNvQ2pTQ1FMZ1VibENUcGcxTEhjZHpBWHVoMWNpN1lLdTVr?=
 =?utf-8?B?YmdyOW1hRnlpVnk2VkRQYzBrT1pYdktLeFM5T1RDcnV5dDEyQlVHK0lHSita?=
 =?utf-8?B?TWdLdTI4bEovUDE1M0lKVkxzTmdmQ29WZXNUQXE4UzZYSFlMS3JiOWd0bEhr?=
 =?utf-8?Q?9j/tkag+4NVUsuPwta?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be80b81-e1a5-4c57-48bf-08de4d053c22
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 09:23:21.1656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5J1kPjqC4iqtoDYDmQ+4eEI6uhh9kWDHNTry82t8FY3O5plpgmuHDYeJ66q0hr45JDNRUAH+4VuO9dy2GOQifQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6572

SGkgIE1hdGhpYXM6DQoNCj4gPiBbMTkyMTY1LjEwNzkzN11bICAgIEMwXSB4aGNpLWhjZCB4aGNp
LWhjZC4zLmF1dG86IEVycm9yOiBGYWlsZWQgZmluZGluZyBuZXcgZGVxdWV1ZSBzdGF0ZQ0KPiA+
IFsxOTIxNjUuMTA3OTQ2XVsgICAgQzBdIHhoY2ktaGNkIHhoY2ktaGNkLjMuYXV0bzogRmFpbGVk
IHRvIGNsZWFyIGNhbmNlbGxlZCBjYWNoZWQgVVJCIDAwMDAwMDAwMmQ3NTZlYWIsIG1hcmsgY2xl
YXIgYW55d2F5DQo+ID4gWzE5MjE2NS4xMDgzODddW1QxNzQ1NF0gdXNiIDEtMTogcmVzZXQgZnVs
bC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nIHhoY2ktaGNkDQo+ID4gWzE5MjE2NS4y
MjU5MDRdW1QxNzQ1NF0gdXNiIDEtMTogZGV2aWNlIGRlc2NyaXB0b3IgcmVhZC82NCwgZXJyb3Ig
LTcxDQo+ID4gWzE5MjE2NS40NDIyMjRdW1QxNzQ1NF0gdXNiIDEtMTogRGV2aWNlIG5vdCByZXNw
b25kaW5nIHRvIHNldHVwIGFkZHJlc3MuDQo+ID4gWzE5MjE2NS42NDIxMDddW1QxNzQ1NF0gdXNi
IDEtMTogRGV2aWNlIG5vdCByZXNwb25kaW5nIHRvIHNldHVwIGFkZHJlc3MuDQo+ID4gWzE5MjE2
NS44NDU4NzldW1QxNzQ1NF0gdXNiIDEtMTogZGV2aWNlIG5vdCBhY2NlcHRpbmcgYWRkcmVzcyAy
LCBlcnJvciAtNzENCj4gPiBbMTkyMTY1Ljg0NjAzMV1bVDE3NDU0XSB1c2IgMS0xOiBXQVJOOiBp
bnZhbGlkIGNvbnRleHQgc3RhdGUgZm9yIGV2YWx1YXRlIGNvbnRleHQgY29tbWFuZC4NCj4gPiBb
MTkyMTY1Ljk1NzkyN11bVDE3NDU0XSB1c2IgMS0xOiByZXNldCBmdWxsLXNwZWVkIFVTQiBkZXZp
Y2UgbnVtYmVyIDIgdXNpbmcgeGhjaS1oY2QNCj4gPiBbMTkyMTY1Ljk1ODAzMl1bVDE3NDU0XSB4
aGNpLWhjZCB4aGNpLWhjZC4zLmF1dG86IEVSUk9SOiB1bmV4cGVjdGVkIHNldHVwIGNvbnRleHQg
Y29tbWFuZCBjb21wbGV0aW9uIGNvZGUgMHgxMS4NCj4gPiBbMTkyMTY1Ljk1ODA0MF1bVDE3NDU0
XSB1c2IgMS0xOiBodWIgZmFpbGVkIHRvIGVuYWJsZSBkZXZpY2UsIGVycm9yIC0yMg0KPiA+IFsx
OTIxNjUuOTU4MTY1XVtUMTc0NTRdIHVzYiAxLTE6IFdBUk46IGludmFsaWQgY29udGV4dCBzdGF0
ZSBmb3IgZXZhbHVhdGUgY29udGV4dCBjb21tYW5kLg0KPiA+IFsxOTIxNjYuMDcwNjIzXVtUMTc0
NTRdIHVzYiAxLTE6IHJlc2V0IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMiB1c2luZyB4
aGNpLWhjZA0KPiA+IFsxOTIxNjYuMDcwNzI4XVtUMTc0NTRdIHhoY2ktaGNkIHhoY2ktaGNkLjMu
YXV0bzogRVJST1I6IHVuZXhwZWN0ZWQgc2V0dXAgYWRkcmVzcyBjb21tYW5kIGNvbXBsZXRpb24g
Y29kZSAweDExLg0KPiA+IFsxOTIxNjYuMjczODM1XVtUMTc0NTRdIHhoY2ktaGNkIHhoY2ktaGNk
LjMuYXV0bzogRVJST1I6IHVuZXhwZWN0ZWQgc2V0dXAgYWRkcmVzcyBjb21tYW5kIGNvbXBsZXRp
b24gY29kZSAweDExLg0KPiA+IFsxOTIxNjYuNDczNzg4XVtUMTc0NTRdIHVzYiAxLTE6IGRldmlj
ZSBub3QgYWNjZXB0aW5nIGFkZHJlc3MgMiwgZXJyb3IgLTIyDQo+ID4gWzE5MjE2Ni40NzM5NDNd
W1QxNzQ1NF0gdXNiIDEtMTogV0FSTjogaW52YWxpZCBjb250ZXh0IHN0YXRlIGZvciBldmFsdWF0
ZSBjb250ZXh0IGNvbW1hbmQuDQo+ID4gWzE5MjE2Ni41ODU4MDJdW1QxNzQ1NF0gdXNiIDEtMTog
cmVzZXQgZnVsbC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nIHhoY2ktaGNkDQo+ID4g
WzE5MjE2Ni41ODU5MDFdW1QxNzQ1NF0geGhjaS1oY2QgeGhjaS1oY2QuMy5hdXRvOiBFUlJPUjog
dW5leHBlY3RlZCBzZXR1cCBhZGRyZXNzIGNvbW1hbmQgY29tcGxldGlvbiBjb2RlIDB4MTEuDQo+
ID4gWzE5MjE2Ni43ODU4NTBdW1QxNzQ1NF0geGhjaS1oY2QgeGhjaS1oY2QuMy5hdXRvOiBFUlJP
UjogdW5leHBlY3RlZCBzZXR1cCBhZGRyZXNzIGNvbW1hbmQgY29tcGxldGlvbiBjb2RlIDB4MTEu
DQo+ID4gWzE5MjE2Ni45ODU4MjldW1QxNzQ1NF0gdXNiIDEtMTogZGV2aWNlIG5vdCBhY2NlcHRp
bmcgYWRkcmVzcyAyLCBlcnJvciAtMjINCj4gPiBbMTkyMTY2Ljk4NjgzNl1bVDE3NDU0XSB1c2Ig
MS0xOiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51bWJlciAyDQo+ID4gWzE5MjE2Ni45OTA3NDRd
W1QxNzE3MF0gcGMgOiB4aGNpX2luaXRpYWxpemVfcmluZ19pbmZvKzB4MC8weDMwDQo+ID4gWzE5
MjE2Ni45OTA3NTRdW1QxNzE3MF0gbHIgOiB4aGNpX3NpZGViYW5kX3JlbW92ZV9lbmRwb2ludCsw
eDg0LzB4YjgNCj4gPiBbMTkyMTY2Ljk5MDc2MF1bVDE3MTcwXSBzcCA6IGZmZmZmZmMwZjJkNmJh
MTANCj4gPiBbMTkyMTY2Ljk5MDc2M11bVDE3MTcwXSB4Mjk6IGZmZmZmZmMwZjJkNmJhMTAgeDI4
OiBmZmZmZmY4ODQwODJhN2MwIHgyNzogZmZmZmZmODllNGU0M2MwMA0KPiA+IFsxOTIxNjYuOTkw
NzcyXVtUMTcxNzBdIHgyNjogZmZmZmZmOGE2ODlkMmMwMCB4MjU6IDAwMDAwMDAwMDAwMDAwMDAg
eDI0OiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gWzE5MjE2Ni45OTA3ODBdW1QxNzE3MF0geDIzOiBm
ZmZmZmZlODgxMjEyZTUwIHgyMjogZmZmZmZmODhmZWFhZDIxMCB4MjE6IDAwMDAwMDAwZmZmZmZm
ZWQNCj4gPiBbMTkyMTY2Ljk5MDc4OF1bVDE3MTcwXSB4MjA6IGZmZmZmZjg4ODBkZDYyMDAgeDE5
OiBmZmZmZmY4OGZlYWFkMjAwIHgxODogZmZmZmZmZTg4M2RlYmYwMA0KPiA+IFsxOTIxNjYuOTkw
Nzk1XVtUMTcxNzBdIHgxNzogMDAwMDAwMDBlMTFmN2E4MSB4MTY6IDAwMDAwMDAwZTExZjdhODEg
eDE1OiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gWzE5MjE2Ni45OTA4MDNdW1QxNzE3MF0geDE0OiAw
MDAwMDAwMDAwMDAwMDAwIHgxMzogMDAwMDAwMDAwMDAwMDAwMCB4MTI6IGZmZmZmZjg5YTdkY2Zj
NjANCj4gPiBbMTkyMTY2Ljk5MDgxMV1bVDE3MTcwXSB4MTE6IDAwMDAwMDAwMDAwMDAwMjkgeDEw
OiAwMDAwMDAwMDAwMDAwMDAwIHg5IDogMDNmMjgyMjBlMjZhMGEwMA0KPiA+IFsxOTIxNjYuOTkw
ODE4XVtUMTcxNzBdIHg4IDogMDAwMDAwMDAwMDAwMDAwMyB4NyA6IDAwMDAwMDAwMDAwMDAwMDAg
eDYgOiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gWzE5MjE2Ni45OTA4MjZdW1QxNzE3MF0geDUgOiBm
ZmZmZmZlODgyNTNlZGE4IHg0IDogZmZmZmZmZmVlNjlmNzNlMCB4MyA6IDAwMDAwMDAwODAyYTAw
MjkNCj4gPiBbMTkyMTY2Ljk5MDgzNF1bVDE3MTcwXSB4MiA6IGZmZmZmZjg5YTdkY2ZjNjAgeDEg
OiAwMDAwMDAwMDgwMmEwMDJhIHgwIDogMDAwMDAwMDAwMDAwMDAwMA0KPiA+IFsxOTIxNjYuOTkw
ODQxXVtUMTcxNzBdIENhbGwgdHJhY2U6DQo+ID4gWzE5MjE2Ni45OTA4NDNdW1QxNzE3MF0gIHho
Y2lfaW5pdGlhbGl6ZV9yaW5nX2luZm8rMHgwLzB4MzANCj4gPiBbMTkyMTY2Ljk5MDg1M11bVDE3
MTcwXSAgaGFuZGxlX3VhdWRpb19zdHJlYW1fcmVxKzB4YWNjLzB4ZGEwIFtzbmRfdXNiX2F1ZGlv
X3FtaSAwZmFjNTdjMDJmMDZkMDM4ZDAxNWU1NzE5MzkwZjliM2VkYTg2ZTYxXQ0KPiA+IFsxOTIx
NjYuOTkwODY1XVtUMTcxNzBdICBxbWlfaW52b2tlX2hhbmRsZXIrMHhkOC8weDE0NCBbcW1pX2hl
bHBlcnMgNGUyNmUxM2UzZjc3ZjNmNTNmMDBiMTI4NWU0N2RlYTkxNjdlYzNiNF0NCj4gPiBbMTky
MTY2Ljk5MDg3OF1bVDE3MTcwXSAgcW1pX2RhdGFfcmVhZHlfd29yaysweDJlYy8weDc2NCBbcW1p
X2hlbHBlcnMgNGUyNmUxM2UzZjc3ZjNmNTNmMDBiMTI4NWU0N2RlYTkxNjdlYzNiNF0NCj4gPiBb
MTkyMTY2Ljk5MDg5MV1bVDE3MTcwXSAgcHJvY2Vzc19zY2hlZHVsZWRfd29ya3MrMHgxYzQvMHg0
NWMNCj4gPiBbMTkyMTY2Ljk5MDg5N11bVDE3MTcwXSAgd29ya2VyX3RocmVhZCsweDMyYy8weDNl
OA0KPiA+IFsxOTIxNjYuOTkwOTAzXVtUMTcxNzBdICBrdGhyZWFkKzB4MTFjLzB4MWIwDQo+ID4g
WzE5MjE2Ni45OTA5MTJdW1QxNzE3MF0gIHJldF9mcm9tX2ZvcmsrMHgxMC8weDIwDQo+ID4gWzE5
MjE2Ni45OTA5MjFdW1QxNzE3MF0gQ29kZTogYThjMzdiZmQgZDUwMzIzYmYgZDY1ZjAzYzAgY2Vl
Nzc5NmEgKGY5NDAwMDA5KQ0KPiA+IFsxOTIxNjYuOTkwOTI0XVtUMTcxNzBdIC0tLVsgZW5kIHRy
YWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KPiA+IFsxOTIxNjYuOTkwOTI5XVtUMTcxNzBdIEtl
cm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBPb3BzOiBGYXRhbCBleGNlcHRpb24NCj4gPiBbMTky
MTY2Ljk5MDkzMl1bVDE3MTcwXSBTTVA6IHN0b3BwaW5nIHNlY29uZGFyeSBDUFVzDQo+ID4NCj4g
PiBUcmFjZSAzMiBhbmFseXNpcyByZXZlYWxlZCB0aGF0IHRoZSBjcmFzaCB3YXMgY2F1c2VkIGJ5
IGVwLT5yaW5nIGJlaW5nIG51bGwgd2hlbiBjYWxsaW5nIHRoZSB4aGNpX3NpZGViYW5kX3JlbW92
ZV9lbmRwb2ludCBmdW5jdGlvbi4NCj4gPiBJIGhhdmVuJ3QgY29tZSB1cCB3aXRoIGEgYmV0dGVy
IHNvbHV0aW9uIHRoYW4gdGhpcyBvbmUuDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hv
c3QveGhjaS1zaWRlYmFuZC5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXNpZGViYW5kLmMNCj4g
PiBpbmRleCBhODVmNjJhNzMzMTMuLjA0YWUyY2JiYTgzOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL3VzYi9ob3N0L3hoY2ktc2lkZWJhbmQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3Qv
eGhjaS1zaWRlYmFuZC5jDQo+ID4gQEAgLTIwNiw3ICsyMDYsNyBAQCB4aGNpX3NpZGViYW5kX3Jl
bW92ZV9lbmRwb2ludChzdHJ1Y3QgeGhjaV9zaWRlYmFuZCAqc2IsDQo+ID4gICAJZXBfaW5kZXgg
PSB4aGNpX2dldF9lbmRwb2ludF9pbmRleCgmaG9zdF9lcC0+ZGVzYyk7DQo+ID4gICAJZXAgPSBz
Yi0+ZXBzW2VwX2luZGV4XTsNCj4gPg0KPiA+IC0JaWYgKCFlcCB8fCAhZXAtPnNpZGViYW5kIHx8
IGVwLT5zaWRlYmFuZCAhPSBzYikNCj4gPiArCWlmICghZXAgfHwgIWVwLT5zaWRlYmFuZCB8fCAh
ZXAtPnJpbmcgfHwgZXAtPnNpZGViYW5kICE9IHNiKQ0KPiA+ICAgCQlyZXR1cm4gLUVOT0RFVjsN
Cj4gDQo+IFdlIGNhbid0IHJldHVybiB5ZXQgaWYgZW5kcG9pbnQgYW5kIHNpZGViYW5kIGFyZSB2
YWxpZCwgYnV0IHJpbmcgaXMgbWlzc2luZy4NCj4gV2Ugc2hvdWxkIHN0aWxsIHNldA0KPiANCj4g
ZXAtPnNpZGViYW5kID0gTlVMTDsNCj4gc2ItPmVwc1tlcC0+ZXBfaW5kZXhdID0gTlVMTDsNCj4g
DQo+IGluIF9feGhjaV9zaWRlYmFuZF9yZW1vdmUoKSBmb3IgdGhpcyBzaWRlYmFuZCBhbmQgZW5k
cG9pbnQuDQo+IA0KPiBXYXMgeGhjaV9zaWRlYmFuZF9ub3RpZnlfZXBfcmluZ19mcmVlKCkgY2Fs
bGVkIGZvciB0aGlzIGVuZHBvaW50Pw0KDQpUaGUgY29kZSBsb2dpYyB3YXMgY2hlY2tlZCBhbmQg
Zm91bmQgbm90IHRvIGNhbGwgdGhlIGB4aGNpX3NpZGViYW5kX25vdGlmeV9lcF9yaW5nX2ZyZWVg
IGZ1bmN0aW9uLg0KQWN0dWFsIGNvZGUgY2FsbHM6DQpUaGUgYHhoY2lfc2lkZWJhbmRfc3RvcF9l
bmRwb2ludGAgZnVuY3Rpb24gd2FzIGNhbGxlZCBwcmV2aW91c2x5Og0KaGFuZGxlX3VhdWRpb19z
dHJlYW1fcmVxKCkNCnsNCiAgICAuLi4NCiAgIHhoY2lfc2lkZWJhbmRfc3RvcF9lbmRwb2ludCh1
YWRldltwY21fY2FyZF9udW1dLnNiLCBlcCk7IA0KICAgIHhoY2lfc2lkZWJhbmRfcmVtb3ZlX2Vu
ZHBvaW50KHVhZGV2W3BjbV9jYXJkX251bV0uc2IsIGVwKTsgICAtLS0tPiBjcmFzaA0KICAgIC4u
Lg0KfQ0KDQo+IFdlIGNhbiBpbiB0aGF0IGNhc2UgcG9zc2libHkgYXZvaWQgY2FsbGluZyBib3Ro
IHhoY2lfc3RvcF9lbmRwb2ludF9zeW5jKCkNCj4gYW5kIHhoY2lfaW5pdGlhbGl6ZV9yaW5nX2lu
Zm8oKSBkdXJpbmcgdGhpcyB4aGNpX3NpZGViYW5kX3JlbW92ZV9lbmRwb2ludCgpDQo+IGNhbGwu
DQo+IA0KPiANCj4gVGhlIGZhaWx1cmUgdG8gZmluZCBuZXcgZGVxdWV1ZSBzdGF0ZXMgYWxzbyBs
b29rIHdvcnJ5aW5nOg0KPiBbMTkyMTY1LjEwNzkzN11bICAgIEMwXSB4aGNpLWhjZCB4aGNpLWhj
ZC4zLmF1dG86IEVycm9yOiBGYWlsZWQgZmluZGluZyBuZXcgZGVxdWV1ZSBzdGF0ZQ0KPiBbMTky
MTY1LjEwNzk0Nl1bICAgIEMwXSB4aGNpLWhjZCB4aGNpLWhjZC4zLmF1dG86IEZhaWxlZCB0byBj
bGVhciBjYW5jZWxsZWQgY2FjaGVkIFVSQiAwMDAwMDAwMDJkNzU2ZWFiLCBtYXJrIGNsZWFyIGFu
eXdheQ0KPiANCj4gSWYgdGhpcyBlbmRwb2ludCBpcyBvZmZsb2FkZWQgKHNpZGViYW5kKSB0aGVu
IHhoY2kgZHJpdmVyIHNob3VsZG4ndCB0cnkNCj4gdG8gZmluZCBhIG5ldyBkZXF1ZXVlIHBvc2l0
aW9uLg0KDQpUaGFua3MNCkxpYW5xaW4NCg==

