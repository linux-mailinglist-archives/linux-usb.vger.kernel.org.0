Return-Path: <linux-usb+bounces-14811-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 835C996FEB6
	for <lists+linux-usb@lfdr.de>; Sat,  7 Sep 2024 02:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A087B1C21997
	for <lists+linux-usb@lfdr.de>; Sat,  7 Sep 2024 00:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9334C79;
	Sat,  7 Sep 2024 00:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="C/YKWGkW";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="koop7IJi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EkxRpI/N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541FFC8FF
	for <linux-usb@vger.kernel.org>; Sat,  7 Sep 2024 00:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725669689; cv=fail; b=fNPOSWZElPdDHzmjqH+Vk+JC1/mg11HwKAzjDOkDTD2++5VWN6fVcz7RFjjwKWiIko1rMOXxdy0YMclEDY7CNJr3RBUIJg3hYnbep5Lghoda0YIZvR3sxTjaAXyIhX6Qq6rOtBqKt01iM66fZwkW+MK+NfNWjA4QloPTjgR8NDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725669689; c=relaxed/simple;
	bh=n9RCkeDc7XXg2O6YXrBTYVf01lZGcgoqyALs5Tw5xzY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KDttixO3T4fRIpPM7LxDoO2K/h0T1BJGO/zkJAJwOJEHCzNera7Kf1jbtqzhQYunFyrNfrBqL6A2yWodib2Vhes7YzxptZaaMfyJDQRA/ZxEEEHHf+dweCCPvkofVmFEqMn5eDd5wQ29FjyPwtrWoGk9EnoBsQbf/BzAh9+TEKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=C/YKWGkW; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=koop7IJi; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EkxRpI/N reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4870GtRW015412;
	Fri, 6 Sep 2024 17:41:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=n9RCkeDc7XXg2O6YXrBTYVf01lZGcgoqyALs5Tw5xzY=; b=
	C/YKWGkWpW3h6UE80Nz9XASUX/Ops3fTpVS74P0EWEXwqhoy/kEU/8bT1241FKeS
	R+AzRJPikHOXxbO1+AyjKnl+ednezH7HgnWGgRnYyKEXc3D1CZGA256fGZ0oz4ZM
	XyqVqBC1daBZ4SM2GqIGvZogRvTNQJEJU3VQeeU0V5ZorlGaDL5a2GmUDhvWkai0
	DaHCR2R/ahz+nxMmmyHLW1ya4Kukn5TfAfQARr+moSzeCvwKpYguvpNZh5/8VT5i
	AY7nzyDOKS3rRcLeRWueaRQo2y//0jHKtSkcbWsofe9A/jFrehJLr4V8A+RFx5lX
	W5lK9fkzQenzxtn+JoZ9sw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 41fj16ef1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 17:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1725669682; bh=n9RCkeDc7XXg2O6YXrBTYVf01lZGcgoqyALs5Tw5xzY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=koop7IJiGjIzOzDf0LuPHcH67kYjDB/g+wf/ectN+FXF12qG31Nd7XeTo/8LnFmvU
	 C3b0ghfER/f/zbqOcgOpFKaoq9CSEVURJ7OjeCMIzvY91sSuanr3ObpH/iREFNt0fY
	 ZLq99jfl4Q9rela9wNki83PTIFMExtNKtxnIKaBmBA6SO4NZ6CRGLTE+dyfZHQKfO5
	 qmHaRf315fCnXC6fZryYNuCft8AzJyLnZps7UaCfGZwg/0pkecYzS42JFrp9IHij5D
	 hduocztxIapAkMOcwBndEmvHzrla9IPpHlkjMxwNmGX+0vCWzCEHq/XjOlFZ24HnTe
	 g149rv0aqHjsw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8218A40340;
	Sat,  7 Sep 2024 00:41:21 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E6CADA009D;
	Sat,  7 Sep 2024 00:41:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=EkxRpI/N;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 92D7240354;
	Sat,  7 Sep 2024 00:41:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5dyyo5nyWy2l2LqtDjP7+dFc4NGonxra1+Vakp9wZ8wfKBTDQfKVL98s/Eg/RasDU0965aQ7AP2aUxpgCzZKY6g5DrVtUQaEjldae7MhckfQLnHCQpQMKpsaCAkVX7OeMaIFmpf2SI4n/pJ9uDq7ejgmLGxisOPT2T/OecGx8vMCSan0gmNFn82uAaHG1u/1/stfCnEqCKSAwZQclmq5ATbMgXEBXEdHgybj3N2NwwsEC/hvMlhy81HfwxyFmi2Xix9T098QORk05Tzp39ZGvNSwuFpCHPAUphUWxukmcA+Y3cTqOjXU2bkpLAvWo+bwez7J/2B6LvO3jteV0OzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9RCkeDc7XXg2O6YXrBTYVf01lZGcgoqyALs5Tw5xzY=;
 b=aapMzrRzkIua9YLgL+yVjPAFIihv3Kw8n09swniC1JoK3hLxUpVYDE/L7UnpPXmm5RDI11XDNR4A4jZ+cWNO8rHLRP85UQgujZFIR+8RCErx4KsADyKynQbfvvdBQ1vzQ9bYYjvKqOvLTAMXocwetok1IPCNtoJ6bWP1TGdSBOLk58vcF8/Gy0N6yeBHpSQPm7U2UY3TiQe7NaMtk5tj8HoIXFuLHvrg98MBfHhsiwMdkNGAT0gV8iGYRqGMfKMw0pdwJp9gHRGviAYUlpck/4RVKhBK+H7j2rMm178yfz56BZ5p7wif2DFRps+Wb7jThZkiCK/Lg/1ZH3ImtJUYPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9RCkeDc7XXg2O6YXrBTYVf01lZGcgoqyALs5Tw5xzY=;
 b=EkxRpI/NW0vjEDlVymzLu3MBlgKnVxGPhHJN5qO9Ht/9J3T3JFQtxrKak1QFnPH+D0p90uTx8kccVxLzHKnEBArejfv9HpDSmaWOhszYo80MrS5iZwNZWUUQVrxPNoPsnpAZnvG+fauD5SmgXT/x+pTFB9ANSolvLd2ziAZ8z+Q=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB8539.namprd12.prod.outlook.com (2603:10b6:208:446::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Sat, 7 Sep
 2024 00:41:17 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7939.017; Sat, 7 Sep 2024
 00:41:17 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH 04/12] usb: xhci: remove excessive isoc frame debug
 message spam
Thread-Topic: [PATCH 04/12] usb: xhci: remove excessive isoc frame debug
 message spam
Thread-Index: AQHa/6BT11QTgfXsiEyK+hBN2ezDMbJJtmkAgAELaQCAALw3gA==
Date: Sat, 7 Sep 2024 00:41:17 +0000
Message-ID: <20240907004115.2ltj64phlrpnhj2v@synopsys.com>
References: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
 <20240905143300.1959279-5-mathias.nyman@linux.intel.com>
 <20240905213030.hvk2rucvrhlvkczq@synopsys.com>
 <45be598b-eb23-4f8b-aeb0-5893945c105b@linux.intel.com>
In-Reply-To: <45be598b-eb23-4f8b-aeb0-5893945c105b@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB8539:EE_
x-ms-office365-filtering-correlation-id: 363f33d4-64bd-472f-b980-08dcced5c908
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WnlmY1M3bC9qM2dxTmpxK3FMdVdjbUFKeHViamJNWXdFWU5BT2ZLNXdOS0F6?=
 =?utf-8?B?eElheEp3RVN3WHV2TytUMGdjeHlRVHVjOFY3bFFrUXZGZG53V1dVWGowbERW?=
 =?utf-8?B?cDR5Rk9YdDRCSERhZUJqcWl6TFFiM3lKTVc4SWl2a002OEJSM0tEVW9EUnlH?=
 =?utf-8?B?SjJ0ZkZCLzdSVEEzajRYSi9Lb1QrMVF1NzdyQVl5VzFsYnR6dzNJdmpxTUV4?=
 =?utf-8?B?eFNmZGZMRlJTdXFPUk1yTnBQdVBvTmZtS283QVdOMzNKdUtlSm5nbjE5cXNW?=
 =?utf-8?B?LzBybG05NjAzcnkyaGpxSEVMTlpvWVlnUmhKOWZMQVdRSzhnV1pBeHVKVElm?=
 =?utf-8?B?M0Y3OWZjb0gzSVNXdTRyNFRCRzlLeW5iVEtheEQ1TWtEaW5EbU43alA0SzRn?=
 =?utf-8?B?MVdDTDl2aDlKdk5LZmtNVCs1NkdPdTZHRGR3MlNXbVpsd3ZZR3pxck5qcHE2?=
 =?utf-8?B?Y3V5QlBQZ0kxbXpzV1J1Q3ZGSFhGNkFYclJzN2p3QWtCL1dKRDVpYmhtTjV5?=
 =?utf-8?B?S2NQQnBidlYybnZUUTg4d1JzY0tIeWJKd2VmRXhqTHRrNEc2cFRXbnlBTGU5?=
 =?utf-8?B?cWpwYzhKbm00OU1MYTBnQUxpYzdZRjR1Z2lKS1JBVHRESjFOWWRKV3FrUWRS?=
 =?utf-8?B?ZndvREw2dE5EamFFcnVOSnRXRHl0VVBOWjE5VFNBSnZtZnA4dkVzZlVsV3JN?=
 =?utf-8?B?djZQeDk2NUt5aklWYjlwM2xINEJtbjIybDhJaEtlakt6VE51TWFSNGwzRUVj?=
 =?utf-8?B?Y3RRQTJDVGRTdDJtRkZMU005aUZNUW4zKzBjbDdiRVEyZGw4b202K00xTEJn?=
 =?utf-8?B?UkdSRFNZT0xpMHFZejVERWxGeGdPbGFoTmFaNXl3OGdETGc1S000cWFvNGt4?=
 =?utf-8?B?aW1UUzJlZjN5eEZBdUpYWEdHZmlxSkttN012dEY1akVMdlJ3dmVzMXFqR0Q3?=
 =?utf-8?B?cU0vMG5LRC9tYVc4TmgrTUN1NXJxUWx4OWxmSkplai91UkZFaEZBL3Q5ZGpm?=
 =?utf-8?B?ZjFmM0VDVUdac0NPZitIbXN3Njd4NitlZzFXS200d2NuZVBtZlIwWGNDVVhG?=
 =?utf-8?B?cXFZTUVleFpjVXVDZFVqYTQ5Ri9QaURtRXM3czRoV1BZMm85SmNyczB5Tm9R?=
 =?utf-8?B?TFRraFY1T1VsMXZObVl4ZnlGU25Ya3QyQ01aOThWeWNUa0hoVWhWNXRRdlh1?=
 =?utf-8?B?RXVSQWxMVkw5RWNxYzVPZlowaWx6RVRRRys0bDhHbzk4TEJXMEhlZ3lDb1lY?=
 =?utf-8?B?SHdUQ2svWXY2UDBqSkNySzBiZnhiU01RNzZsMm5SaW5Id1hjZGJXMEZBWGVL?=
 =?utf-8?B?NVB0VHhoRkNkaUJIekk0S0dsMHBzZGVpSEFmajJseEVVcUdSbWtpSERYampC?=
 =?utf-8?B?ME1DOTFlNlJkYW5lM0gzSjBGb0RneFhzcUs5Y3N2YVF1WDR6Tklqd3oyV2Iy?=
 =?utf-8?B?a3lneExHY2E5ZW43Y0gyc2xCUW1GUkN3Y0NoVStmUXhFb3kzYWtVQTR2aHBM?=
 =?utf-8?B?WXBYd01mRkFsTDd2TWFiNDdNNjI0ZW5xUFBBRlphRyt4MmJIMkZodWkvcGJs?=
 =?utf-8?B?OEFQMzRXdmFTcHhOU2NQNVV6ZHVYd3o3SkozKzA4dlRYMlhwT1ZBWnhramVZ?=
 =?utf-8?B?ODNnQTNvNDZ4Q3ZaYTI3SGs1WWJiWGhwUUczUHFpdzVqLzhSOWZhK3NKaXFB?=
 =?utf-8?B?OVR5WDJOZlk0NlM2ekFBMEJMSHJXUTlLYmdGaTZ2amdvdlN6NWY5cVovSGsz?=
 =?utf-8?B?UTVWUzE5YzVEbkNTZTlmeFRyOGwySmJrY2tDb0hjTkZ2WU5aVzR4aVRaRzdJ?=
 =?utf-8?B?Qis4SGVkUGtjZmZNWFBhc0k2RDVvbWtGTllBdndqcUNkb3dobWEyZmFGUEtO?=
 =?utf-8?B?dkhpd2VoUUFZZFdtUHlteFlkLzhUZThCd0NtSWc1NXZib0E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z2N4SkVnVjBKbEszVEoxMkh3Mkd1akxYL0tMS2lRQ0ZhbGlnOE4vc2pOdUdh?=
 =?utf-8?B?dFQyVnIrNFBiWFVZVVkwMmRFV0tpTEZqK3A3MEN3VWZXMWVNUHRKdjI2UlQ4?=
 =?utf-8?B?UE9JWW1sNGlvUktQdXhia2MyUjVkbzNRaUUzYU5TazA3cDJjbVp4SjhQdWFW?=
 =?utf-8?B?TVBrM3lmeFQyZk9yYWplUDhGaDNhejBObFc4cmdpVmhGQUR0bTMvUDEzS3Vm?=
 =?utf-8?B?MmlaZk52WlE5WTJWTUsrcjNmUFRIR0Y1UDQwU0Q0b2JxUURwTUoybTBQL3Fx?=
 =?utf-8?B?ZVFvTVZ5a0YxUHQ1ZURRY1NyUXBoajQ2UkZ2dEZVb0ZXeGlpdS9Cd2M1b29z?=
 =?utf-8?B?Z2c2S2JWVmc3MmN3TlhkSVNzZklsUXdYWkNEWkVWaUl4NUJUOFVuV3NYYkM3?=
 =?utf-8?B?ai9Wa3BPanB1RVBpSC9uWGc5TTR4eG9abXU2eHB6dE5KQ3diODVadzRoSDI0?=
 =?utf-8?B?TklOWUx2YzM0SXBRZXJQS3FLVkhvQnpKTkVXdVVEbXpHT1RpZEFta245V3Jt?=
 =?utf-8?B?NkkrSUNHclRlL2RoWEZrTDBubkl1U2ZFbDZTOUNTNkUxUFYyTkkvcFk1eXc4?=
 =?utf-8?B?c3h1RTNudm5UZ01icmhUVUtLODE5ckE2T2VuUVRYYVRIbEVVSHR1N1k1QitZ?=
 =?utf-8?B?MWpRcGVBRDlDcFo2aUx4dHhIVWVTM0NSM0NIZ2lmcDdNTFhuOFBwUlI4U3oz?=
 =?utf-8?B?bTRlT0VGS3hWY3NxNlVEbzZEZk0wczhXSkg5YmVrcXBlZ2lmY251QmdpaldV?=
 =?utf-8?B?QzR6M0FiOWJRY3dnNXdaTWg2Y24zdTJseTlhREdVYzBEYklEWVZvZ2p5Qzhx?=
 =?utf-8?B?RTE0TGIySkhyYmgxamtoSUVXeGhOVDJmWGZSZ3Rxd1cremFoSG16M21jU2dh?=
 =?utf-8?B?OUF5MXk3UGI0V3k4OWRaNFRrN1d2cS9Kenc0aXo0UXFyWDJJbXVKa3llMkFZ?=
 =?utf-8?B?M01JaTNFanFyV0RzOTV3NWJaQjZ1alg5blQyWkIwWkpTaG9CTDFYRkk5WE9W?=
 =?utf-8?B?aEE4QkNMbk9WVncvMy9JKzZuZUl0Q0lTUFFtVjN3N2NTMVJNSlAvY1JKY0pm?=
 =?utf-8?B?QlBOdnpHR1REV2JIUUFOeWhubnYveXRhakJZUGxWcU85VW1rWCtxOFk0QlUr?=
 =?utf-8?B?b0JOYnBmbFVMT2kvVXdnUGlJSTRkUktEazRqL3pOZTF1VTU1SSszeFdLbjVJ?=
 =?utf-8?B?bWpqUGhjMWhXOTQva0VZZEhIZjhiUWVLSlRXM3hEb1RQRURVUmE1dUZiNGR0?=
 =?utf-8?B?Y0U2QmRmdTdaZkZ0NGhtWnRTa21JeG9KY1FqZHlQajdCdFN1anc3S0pQZW5K?=
 =?utf-8?B?bnp3MFhIZ2ZYNWFsSmpEYVVYcit6OEhHeC85OFVqYVlmNTYyeCs5QlR0bCtk?=
 =?utf-8?B?dk5yY3ZiQnRUVkpQWHRDUjJrNTNUalEweDBxNEdRclhYZ0dGczBBZThmTDdk?=
 =?utf-8?B?MDk2R3NQb1NlWG9JZ2JBbTB6aDhCVXdEV1FST1JvSmFYbW9xdXUwMUJWNUlC?=
 =?utf-8?B?ZGlmRDNmQUpEUHRqUW1PNm1KbktFY3prbXpxNHZMdGVpMHplQmdjeTlRdVNB?=
 =?utf-8?B?eWlVZjNJMFdNM2NnN3V5NWhqcE90WktZTlNQU0NYM3QrcmZ5emdSR1hDTldk?=
 =?utf-8?B?YlVEOUZqUGoxbUJ1NHJvaUZSYXBRV3lYTHlwa0hqckIyaDlTMFNidk5wMVpS?=
 =?utf-8?B?alVkM0VmbWV5UnRobTQ5aUFOdm80WnRLTHhMWG4razR5bHpwQUkvbVJPYVVi?=
 =?utf-8?B?NWVoOGU3Qkd1MWc3UkY0WUlNSFYzM29hWWJrQWlrNDdBS1pnQm1BNHJvZ2tL?=
 =?utf-8?B?Z00yMkxFM1BZcjdZK1lqSkN5RFNzVmpSR01aZ1hXUkxrTDEwTWFsa3VZT3Bp?=
 =?utf-8?B?WS9RNXlEODFvalZTMklzM0pLa3U4bWd5cHhna3YvbjhMMHV0SzZRWG5GSmY3?=
 =?utf-8?B?aFNXZVRNUm9EaWo5cklBNENzaWtMcHBNTGFEZktmbis0TzBLWnhzYnpWcWw0?=
 =?utf-8?B?YWNROXl1S3R5MGtRU3IwMEM4SmE5eERCUkJoTW8yTGJ1MTQ5MlpqQ1NWSW9v?=
 =?utf-8?B?L2dJVDROSEtuS0FiT1NIT3V2T1dHV1A2bjhwenpiR0pmRHpSeGh4eVdHZ0Q3?=
 =?utf-8?Q?5IMlY4X7JExZ1NY+8tyYBbXiM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B880AC5B354BB849AEC41E3128B38A3A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9B9ObRJV6SXh/IUvnEoCvtK+LDHn/TMXW6T7oZg+ErxukIEp39bnNCtCnYh0VfYCJRAqFwqWXUIwUUcNeDGkkdfEfW4IVgVE8RMFIy8tkJLFo142vyCOI6ZvJHLAqU2Klo60ShNXNyMsdZ0UH3C8mHMt9bj/gkc9asie2+Us80bcq7ZSWt7jgAlDNYoo8mrNeSkf14xY8OP8UAm3+0mSipIT4C2HJ8tGqCKfaJtWtj6IkueRShInWBx1X2LKovMHoU3kPSyLskNeAzMg+iUe9DKW4KuICB31+WiW7I1cggLV+uyCpDSPzlWizNeen3VJzwdv2BpfaE3I1wHpPIc2+4YBVzJbf45m/tV4Nqoh5NW4r8mAer/mfkcob+AMF19pZ0W/4WtXK7naSUkfxqubiJ8tU78vL20B8meoPOXFVtSG7K1uM41JTupgk7Httr13wiXH9eK4U6Q5UJsRNt+7gwQJBTA6rvoioxivs5Oq6TYlXugrF+zd6F3xgQPIZP6a8YQNSEzu1ITI5Fv2oPHBUssx5uRfh0bNP9uuXUV3jLlyisQxa/LzqhuXRBx50Qff0zpiAw9VPT9UJUn5spBEoaZPjelRIO4Ff5D8NfuBnNnmyRr+c3bXvfPahrgz+IGvDTrLWJTm2mBIbRJJIpWzIA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363f33d4-64bd-472f-b980-08dcced5c908
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2024 00:41:17.5713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x1mr6KkyLCuUKCSyNFGwxArKtFBriT4/WtX5/HoLcMKwAzyVbQV7NLwTy8+Y4/xb2YoVbT9lT2K42I8fNe8RGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8539
X-Authority-Analysis: v=2.4 cv=QLg6RRLL c=1 sm=1 tr=0 ts=66dba132 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=nEwiWwFL_bsA:10
 a=qPHU084jO2kA:10 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=_E8AusH4jvgVu10ONWEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: aemK-0FtYwwr-u_wh5bXgGqvPQSYygVL
X-Proofpoint-ORIG-GUID: aemK-0FtYwwr-u_wh5bXgGqvPQSYygVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409070001

T24gRnJpLCBTZXAgMDYsIDIwMjQsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IE9uIDYuOS4yMDI0
IDAuMzAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBUaHUsIFNlcCAwNSwgMjAyNCwgTWF0
aGlhcyBOeW1hbiB3cm90ZToNCj4gPiA+IEZyb206IE5pa2xhcyBOZXJvbmluIDxuaWtsYXMubmVy
b25pbkBsaW51eC5pbnRlbC5jb20+DQo+ID4gPiANCj4gPiA+IFRoZSByZW1vdmVkIGRlYnVnIG1l
c3NhZ2VzIHRyaWdnZXIgZWFjaCB0aW1lIGFuIGlzb2MgZnJhbWUgaXMgaGFuZGxlZC4NCj4gPiA+
IEluIGNhc2Ugb2YgYW4gZXJyb3IsIGEgZGVkaWNhdGVkIGRlYnVnIG1lc3NhZ2UgZXhpc3RzLg0K
PiA+ID4gDQo+ID4gPiBGb3IgZXhhbXBsZSwgYSA2MGZwcyBVU0IgY2FtZXJhIHdpbGwgdHJpZ2dl
ciB0aGUgZGVidWcgbWVzc2FnZSBldmVyeSAwLjZzLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBOaWtsYXMgTmVyb25pbiA8bmlrbGFzLm5lcm9uaW5AbGludXguaW50ZWwuY29tPg0KPiA+
ID4gU2lnbmVkLW9mZi1ieTogTWF0aGlhcyBOeW1hbiA8bWF0aGlhcy5ueW1hbkBsaW51eC5pbnRl
bC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAgZHJpdmVycy91c2IvaG9zdC94aGNpLXJpbmcuYyB8
IDQgLS0tLQ0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkNCj4gPiA+IA0K
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1yaW5nLmMgYi9kcml2ZXJz
L3VzYi9ob3N0L3hoY2ktcmluZy5jDQo+ID4gPiBpbmRleCA0ZWEyYzNlMDcyYTkuLmUxYzk4Mzgw
ODRiZiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1yaW5nLmMNCj4g
PiA+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1yaW5nLmMNCj4gPiA+IEBAIC0zOTQxLDEw
ICszOTQxLDYgQEAgc3RhdGljIGludCB4aGNpX2dldF9pc29jX2ZyYW1lX2lkKHN0cnVjdCB4aGNp
X2hjZCAqeGhjaSwNCj4gPiA+ICAgCXN0YXJ0X2ZyYW1lX2lkID0gKHN0YXJ0X2ZyYW1lX2lkID4+
IDMpICYgMHg3ZmY7DQo+ID4gPiAgIAllbmRfZnJhbWVfaWQgPSAoZW5kX2ZyYW1lX2lkID4+IDMp
ICYgMHg3ZmY7DQo+ID4gPiAtCXhoY2lfZGJnKHhoY2ksICIlczogaW5kZXggJWQsIHJlZyAweCV4
IHN0YXJ0X2ZyYW1lX2lkIDB4JXgsIGVuZF9mcmFtZV9pZCAweCV4LCBzdGFydF9mcmFtZSAweCV4
XG4iLA0KPiA+ID4gLQkJIF9fZnVuY19fLCBpbmRleCwgcmVhZGwoJnhoY2ktPnJ1bl9yZWdzLT5t
aWNyb2ZyYW1lX2luZGV4KSwNCj4gPiA+IC0JCSBzdGFydF9mcmFtZV9pZCwgZW5kX2ZyYW1lX2lk
LCBzdGFydF9mcmFtZSk7DQo+ID4gPiAtDQo+ID4gPiAgIAlpZiAoc3RhcnRfZnJhbWVfaWQgPCBl
bmRfZnJhbWVfaWQpIHsNCj4gPiA+ICAgCQlpZiAoc3RhcnRfZnJhbWUgPiBlbmRfZnJhbWVfaWQg
fHwNCj4gPiA+ICAgCQkJCXN0YXJ0X2ZyYW1lIDwgc3RhcnRfZnJhbWVfaWQpDQo+ID4gPiAtLSAN
Cj4gPiA+IDIuMjUuMQ0KPiA+ID4gDQo+ID4gDQo+ID4gUGxlYXNlIGNhcHR1cmUgdGhpcyBpbmZv
IGluIHRoZSB0cmFjZXBvaW50IGluc3RlYWQuIE90aGVyd2lzZSB3ZSBoYXZlIG5vDQo+ID4gaWRl
YSBpZiB0aGUgaXNvYyBpcyBzY2hlZHVsZWQgYXMgU0lBIG9yIENGSS4gSWYgaXQncyBDRkksIEkg
d2FudCB0byBrbm93DQo+ID4gdGhlIHN0YXJ0IGZyYW1lIHZhbHVlLiBDdXJyZW50bHksIEkgZG9u
J3QgdGhpbmsgeW91J3JlIGRlY29kaW5nIHRoaXMgaW4NCj4gPiB0aGUgVFJCIHRyYWNlcG9pbnRz
Lg0KPiANCj4gR29vZCBwb2ludA0KPiANCj4gQWRkZWQgVEJDLCBUTEJQQywgZnJhbWVfaWQsIGFz
IFNJQSBlbmFibGVkICdTJyBvciBkaXNhYmxlZCAncycgZmxhZyB0byBJc29jaCBUUkIgdHJhY2lu
Zy4NCj4gNzYuMzgzNzc4OiB4aGNpX3F1ZXVlX3RyYjogSVNPQzogQnVmZmVyIDAwMDAwMDAxMThk
ZmEwMDAgbGVuZ3RoIDMgVEQgc2l6ZS9UQkMgMCBpbnRyIDAgdHlwZSAnSXNvY2gnIFRCQyAwIFRM
QlBDIDAgZnJhbWVfaWQgNjEwIGZsYWdzIHM6YjppOkk6YzpzOkk6ZTpDDQo+IA0KPiBjb2RlOg0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5oIGIvZHJpdmVycy91c2Iv
aG9zdC94aGNpLmgNCj4gaW5kZXggMWY2Y2EwMjMxYzg0Li40OGI2NDNhZThhNDAgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5oDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3Qv
eGhjaS5oDQo+IEBAIC0xMDIzLDkgKzEwMjMsNiBAQCBlbnVtIHhoY2lfc2V0dXBfZGV2IHsNCj4g
IC8qIEludGVycnVwdGVyIFRhcmdldCAtIHdoaWNoIE1TSS1YIHZlY3RvciB0byB0YXJnZXQgdGhl
IGNvbXBsZXRpb24gZXZlbnQgYXQgKi8NCj4gICNkZWZpbmUgVFJCX0lOVFJfVEFSR0VUKHApICAg
ICAoKChwKSAmIDB4M2ZmKSA8PCAyMikNCj4gICNkZWZpbmUgR0VUX0lOVFJfVEFSR0VUKHApICAg
ICAoKChwKSA+PiAyMikgJiAweDNmZikNCj4gLS8qIFRvdGFsIGJ1cnN0IGNvdW50IGZpZWxkLCBS
c3ZkeiBvbiB4aGNpIDEuMSB3aXRoIEV4dGVuZGVkIFRCQyBlbmFibGVkIChFVEUpICovDQo+IC0j
ZGVmaW5lIFRSQl9UQkMocCkgICAgICAgICAgICAgKCgocCkgJiAweDMpIDw8IDcpDQo+IC0jZGVm
aW5lIFRSQl9UTEJQQyhwKSAgICAgICAgICAgKCgocCkgJiAweGYpIDw8IDE2KQ0KPiAgLyogQ3lj
bGUgYml0IC0gaW5kaWNhdGVzIFRSQiBvd25lcnNoaXAgYnkgSEMgb3IgSENEICovDQo+ICAjZGVm
aW5lIFRSQl9DWUNMRSAgICAgICAgICAgICAgKDE8PDApDQo+IEBAIC0xMDU5LDYgKzEwNTYsMTIg
QEAgZW51bSB4aGNpX3NldHVwX2RldiB7DQo+ICAvKiBJc29jaHJvbm91cyBUUkIgc3BlY2lmaWMg
ZmllbGRzICovDQo+ICAjZGVmaW5lIFRSQl9TSUEgICAgICAgICAgICAgICAgICAgICAgICAoMTw8
MzEpDQo+ICAjZGVmaW5lIFRSQl9GUkFNRV9JRChwKSAgICAgICAgICAgICAgICAoKChwKSAmIDB4
N2ZmKSA8PCAyMCkNCj4gKyNkZWZpbmUgR0VUX0ZSQU1FX0lEKHApICAgICAgICAgICAgICAgICgo
KHApID4+IDIwKSAmIDB4N2ZmKQ0KPiArLyogVG90YWwgYnVyc3QgY291bnQgZmllbGQsIFJzdmR6
IG9uIHhoY2kgMS4xIHdpdGggRXh0ZW5kZWQgVEJDIGVuYWJsZWQgKEVURSkgKi8NCj4gKyNkZWZp
bmUgVFJCX1RCQyhwKSAgICAgICAgICAgICAoKChwKSAmIDB4MykgPDwgNykNCj4gKyNkZWZpbmUg
R0VUX1RCQyhwKSAgICAgICAgICAgICAoKChwKSA+PiA3KSAmIDB4MykNCj4gKyNkZWZpbmUgVFJC
X1RMQlBDKHApICAgICAgICAgICAoKChwKSAmIDB4ZikgPDwgMTYpDQo+ICsjZGVmaW5lIEdFVF9U
TEJQQyhwKSAgICAgICAgICAgKCgocCkgPj4gMTYpICYgMHhmKQ0KPiAgLyogVFJCIGNhY2hlIHNp
emUgZm9yIHhIQyB3aXRoIFRSQiBjYWNoZSAqLw0KPiAgI2RlZmluZSBUUkJfQ0FDSEVfU0laRV9I
UyAgICAgIDgNCj4gQEAgLTIwNjgsNyArMjA3MSw2IEBAIHN0YXRpYyBpbmxpbmUgY29uc3QgY2hh
ciAqeGhjaV9kZWNvZGVfdHJiKGNoYXIgKnN0ciwgc2l6ZV90IHNpemUsDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZmllbGQzICYgVFJCX0NZQ0xFID8gJ0MnIDogJ2MnKTsNCj4g
ICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAgICAgIGNhc2UgVFJCX05PUk1BTDoNCj4gLSAg
ICAgICBjYXNlIFRSQl9JU09DOg0KPiAgICAgICAgIGNhc2UgVFJCX0VWRU5UX0RBVEE6DQo+ICAg
ICAgICAgY2FzZSBUUkJfVFJfTk9PUDoNCj4gICAgICAgICAgICAgICAgIHNucHJpbnRmKHN0ciwg
c2l6ZSwNCj4gQEAgLTIwODUsNyArMjA4NywyNSBAQCBzdGF0aWMgaW5saW5lIGNvbnN0IGNoYXIg
KnhoY2lfZGVjb2RlX3RyYihjaGFyICpzdHIsIHNpemVfdCBzaXplLA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICBmaWVsZDMgJiBUUkJfRU5UID8gJ0UnIDogJ2UnLA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICBmaWVsZDMgJiBUUkJfQ1lDTEUgPyAnQycgOiAnYycpOw0KPiAgICAgICAgICAg
ICAgICAgYnJlYWs7DQo+IC0NCj4gKyAgICAgICBjYXNlIFRSQl9JU09DOg0KPiArICAgICAgICAg
ICAgICAgc25wcmludGYoc3RyLCBzaXplLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAiQnVm
ZmVyICUwOHglMDh4IGxlbmd0aCAlZCBURCBzaXplL1RCQyAlZCBpbnRyICVkIHR5cGUgJyVzJyBU
QkMgJXUgVExCUEMgJXUgZnJhbWVfaWQgJXUgZmxhZ3MgJWM6JWM6JWM6JWM6JWM6JWM6JWM6JWM6
JWMiLA0KPiArICAgICAgICAgICAgICAgICAgICAgICBmaWVsZDEsIGZpZWxkMCwgVFJCX0xFTihm
aWVsZDIpLCBHRVRfVERfU0laRShmaWVsZDIpLA0KPiArICAgICAgICAgICAgICAgICAgICAgICBH
RVRfSU5UUl9UQVJHRVQoZmllbGQyKSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgeGhjaV90
cmJfdHlwZV9zdHJpbmcodHlwZSksDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIEdFVF9UQkMo
ZmllbGQzKSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgR0VUX1RMQlBDKGZpZWxkMyksDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgIEdFVF9GUkFNRV9JRChmaWVsZDMpLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICBmaWVsZDMgJiBUUkJfU0lBID8gJ1MnIDogJ3MnLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICBmaWVsZDMgJiBUUkJfQkVJID8gJ0InIDogJ2InLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICBmaWVsZDMgJiBUUkJfSURUID8gJ0knIDogJ2knLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICBmaWVsZDMgJiBUUkJfSU9DID8gJ0knIDogJ2knLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICBmaWVsZDMgJiBUUkJfQ0hBSU4gPyAnQycgOiAnYycsDQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGZpZWxkMyAmIFRSQl9OT19TTk9PUCA/ICdTJyA6ICdzJywNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgZmllbGQzICYgVFJCX0lTUCA/ICdJJyA6ICdpJywNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgZmllbGQzICYgVFJCX0VOVCA/ICdFJyA6ICdlJywNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgZmllbGQzICYgVFJCX0NZQ0xFID8gJ0MnIDogJ2MnKTsN
Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOw0KPiANCj4gDQo+IA0KPiBEb2VzIHRoaXMgbG9vayBn
b29kIHRvIHlvdT8NCj4gDQo+IFBhdGNoIG9uIHRvcCBvZiBteSBmb3ItdXNiLW5leHQgYnJhbmNo
Og0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbW55bWFuL3hoY2kuZ2l0L2xvZy8/aD1mb3ItdXNiLW5l
eHRfXzshIUE0RjJSOUdfcGchYm8zTEkzSkxHTm5tZ3BGQjB3WFlwdnVZNWFXS1hVcHpBU2dhUXI2
TklteFlnaHBxekkzdDVhYlJSOC10Y0dNMHBLUFNLaU92SWdWZy1yUlF2a25ndTN6X3EzMUQ5bTJD
JA0KPiANCg0KTG9va3MgZ29vZCB0byBtZSENCg0KVGhhbmtzLA0KVGhpbmg=

