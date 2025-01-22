Return-Path: <linux-usb+bounces-19609-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FEFA189A9
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 02:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C06FA3AAA1F
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 01:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A9B13A3ED;
	Wed, 22 Jan 2025 01:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kKa2WeuI";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YBnC/O+i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="D7MqtiDd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3815733991;
	Wed, 22 Jan 2025 01:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737510255; cv=fail; b=m7+HrvKjjN+Pr6i9DdikCrRFSKo3LEu1rOZ59CaUTeqYiQ1jutnN/eTu7P6MhEfbHsQJVqT9DCP2yUcHA7dp+yQrk10YLA+VYEgPwrQDvt7R3jY1K53TvqgjNI4M7aWiCC1GUdNv2S/tky5RguFPN+UT/P5eoWh5ykFj3ZzA6bU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737510255; c=relaxed/simple;
	bh=/xZxAYGBgcZEHRpnzzCxxZOm5dZYhYcAzPshWAoPcRo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eXiW4bv5jVOcYiPyNCUL3xUMMWHMylOXTXMeHCAp2AGDf3oZIrcQItF9vi+Z7pMw//h0iWCa5C+x0o0pMgerom5uTERMrcwij0FBrkXfWvw+ED8L5pzSzXQBaCsmcSDmW+Qkn1mz7d/htaZkq47/F6jPxKTbUM4tlR7S2ERx52A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kKa2WeuI; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YBnC/O+i; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=D7MqtiDd reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LK2ibv006343;
	Tue, 21 Jan 2025 17:44:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=/xZxAYGBgcZEHRpnzzCxxZOm5dZYhYcAzPshWAoPcRo=; b=
	kKa2WeuIK5J5dIEuoW5tfZwJwGV0RC913RvR5rtTyLQhen95ctrUz2qvCaSzzPju
	RYoIwZD5LclJl5PyZiDlBR+hvv5zsLiS+2KPag8P/06F/0Rz38iCJmM5n6EtSBDQ
	mQn6KSb7USn4OiSAB4M6WwpIBJSx98VmWWj3YRCdQ8jXfYtJ6nf4w4WP2a8yluq2
	DBVTp6W998D9ZSF6qSAji3qLFHOKlp3lbycELoUsWDMYUZ8Yr1JFnzDN/IGXhe7K
	H/QA+2/ex0EKeSf0DCP1EwPBULCTyCcsvrKHl3o1Bw476Ndu0v/P9xZC7ziRY+Hd
	StM1bWFzexAqUMpSitteaA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44aj979b9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 17:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1737510247; bh=/xZxAYGBgcZEHRpnzzCxxZOm5dZYhYcAzPshWAoPcRo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=YBnC/O+ixahi09PtJhpUH4V0QDOp/A705ocTLcBsFaWwq9+bxu4WeN2WA0aZEiVNE
	 56K70rghfIq2NBx7k1rB9vmlk6fODwckFmzr4WHX6wmlTFN+cmiXvIKBt/MiLkCuTT
	 T4VJ0p8Z6ihKdmQesHM1pZpQ1H5o2EcXYl1MukMXM71MmwnwA62+j//PZMIO94TRkJ
	 5MCY+fNYW0BM17geuZUnWFvIn9bhJQxpxEdi5M2VSq5GP2NuR+Ul4dqMLA9h7crwOn
	 m9CpkxuzfJEdPQCKCwLOVexNDYgovflRIzY37NtsSg+TC5QeRbJfu/HbM32KiYs0Tp
	 YzwnElrr5E3vQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A698840517;
	Wed, 22 Jan 2025 01:44:06 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5EC3BA0091;
	Wed, 22 Jan 2025 01:44:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=D7MqtiDd;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B939F40467;
	Wed, 22 Jan 2025 01:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hH3y/UJpIDuAawPMU32SrYq2kIR+hd1dY5D5+i1jrhMzP+uXh8MUzwjc29BrbWbVcZUQCC5cV4ELy8CvoSBqCjbzHwxQZO7TkEzty4MR9XRKB6EPTbpfsOrE3muW3JwVXlOoQZNmpHyoTIK2ipHqkmQOMp6I93xSM6XwExf05b86QwR35nxhrGDgAeqT5yN8JXQhPlhiWof7P+28Bsxtk9LPl5uZww6Ec4V2gZy1d6Zxj0e5KfSmWNxV6acfVHrkVvoXCEg8MNZQAIPxfUrfkH3eSuXi+9I+i86NCs5/kYpsgDhRrckG98HZAIR7q3KG4cRe1guKqZJjcgr954v69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xZxAYGBgcZEHRpnzzCxxZOm5dZYhYcAzPshWAoPcRo=;
 b=MvpPZkJzNwMeM3lIp4lhowG3IBR5kGwFF7xUvhkQkL/mqu0OX/Q3ThUgs1qHTRCjd74k0SI7BoTM8s0/H/bn2swwsTBG5DmlQgu+gGkg+S0xx7u226qX19LFk7GBQ7sOUVe96VMRBt8ReQch1lNFD0C9hJtyPu7jjM3CqgjKlCf8pQGwIgARzELEuSxQOtEv+8K6qSpsHA6YvGv2DMqwDH83tWhXS0LFvX3eOlJslACBcHihtaSyM0x/PMlncw7BnHnl3RpUsEhRnNVHT9prEDVrzv6lQQ+0P/ZcnrmJXcdtrMMVqLwqY6JEfijEt3D4DHILhMfAEnGvAxC33RVlxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xZxAYGBgcZEHRpnzzCxxZOm5dZYhYcAzPshWAoPcRo=;
 b=D7MqtiDdiDAthvQe1iWkLpUruEGTMSRGwdOouFBeyuapxwoLNvWY2CV5NMEN5aVG/gWmzGimnTUrnSOe0JA5ieHp45z4DHV1/YN6HRBD1QCaGykrt7xgHRUCCDsJ9LKdCVixnslUlswr0i+PqSqJKXIEEJ+T+RZL0P8XSAPp03k=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB6652.namprd12.prod.outlook.com (2603:10b6:208:38a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 01:44:03 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 01:44:02 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 2/3] usb: dwc3: gadget: Add support for
 snps,reserved-endpoints property
Thread-Topic: [PATCH v1 2/3] usb: dwc3: gadget: Add support for
 snps,reserved-endpoints property
Thread-Index: AQHbaC0cpC84VeNkokazhZuYFimpJ7MaDjKAgADp6wCABxWwgA==
Date: Wed, 22 Jan 2025 01:44:02 +0000
Message-ID: <20250122014347.fc3ntfkl7cismjxd@synopsys.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-3-andriy.shevchenko@linux.intel.com>
 <20250116233507.sifqs5u3rixoz4lw@synopsys.com>
 <Z4pb5CTS5n5wtJ7d@smile.fi.intel.com>
In-Reply-To: <Z4pb5CTS5n5wtJ7d@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB6652:EE_
x-ms-office365-filtering-correlation-id: 0355e6ef-64ad-407b-cf8e-08dd3a863fd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bUErTlRhZHZIelBNQ3NiVGkrU2tTak1JUkdnR2FzTy9rbENhaEhlOWdMTHJo?=
 =?utf-8?B?UXppU2tIQUtUQm9kTXlmQkVRMXFkTjJ3Q0I3Vit3QmNFN2lDNUVLRzZnME44?=
 =?utf-8?B?cThvWjlCREVmc3BYSUIxdjNPKy9mVHlZcTB5MlAzS3IzeEM3OEdnd0R1dHlV?=
 =?utf-8?B?KzMwZmZ0UW13SGlid3RTcUhEbTczZkZ0akoxdHdGNFN0QmN1c2lqR2V3aDY1?=
 =?utf-8?B?ZXp3cCtSM29RMWNyU3pwL0FjUExIYmxRVEVNSkw0N1hNS0RDaTVyS1I1MFk0?=
 =?utf-8?B?TytkV2dwYVJCZWd3YjRpU2J6WlY1Q04xU2VYWUlWMGdXdWFHS0xidWFsamVM?=
 =?utf-8?B?a0FqZFRIMzJ1Q3NrNngwT2prZ3piSzVTMkJzRzJKTHR3SmRGNU9ObnFFYkZw?=
 =?utf-8?B?eTh5SWVvckx4Tnh0SlIvSWhRNzE5UVBLQ2F5TXFySUFuQmwyb1d5a1NrMDNT?=
 =?utf-8?B?Y0RFQkUwL2FPQVQrR3J0L3NaZm01b0RxWU9qR2ZYdWRsK0pkR2RzZ296OHFP?=
 =?utf-8?B?UUMyMUcvTUtYMDJRQmZkV2tBY2NJUy9jampoeXM2ajBaQjNEczIwaG5VcGJJ?=
 =?utf-8?B?MExTN2dIRWQxT0QwdUtPZVlWZU8yUDBQQmRyUjZub2h5UkpUclI2VmE0ODFk?=
 =?utf-8?B?dlRMNnovZjVlV3FsQ2Q1eTEyNG16Mm9YM0lISEI0dzVWQ0FWWHBYR1Y1dWE4?=
 =?utf-8?B?T3NndGZNc0dFQS94aFdXaGJ6Y3lYMStHNWh3dGNaV0xmKzBSelMxU0ZjNWtJ?=
 =?utf-8?B?YlNma0p1Ty9ldDZQalZCK2dVcWcyN2Y1cW12bGRqcGpaOHVOZk9GenFERGgz?=
 =?utf-8?B?Sk9mYUVMR2dML0hsNnlOaklTWVlTWVg3dzlVWWtqOGZkR0QvcDNkKzJZcHdk?=
 =?utf-8?B?TW5meFNCaGhaTkgrYUlBVVF1bWdyTjZuS0xPVC96akU3eXpaYis4R1hraXdt?=
 =?utf-8?B?ZGZkWUdxTHVuck9sS3ZWN054UEtxSHdBOEl6SVYrZUpRb0tSQXlxQXA3SWc2?=
 =?utf-8?B?SlBvaUVKMVhRMWVNL1FvUU5McXpjN0FkSmJQaVl2a084WjBBUHZlNm9obDdC?=
 =?utf-8?B?dnVDZERQcThpWSs5NHgvUHlWSWsvNzVRMzBheTdhb0NNdEloaVhaM1BaZXdy?=
 =?utf-8?B?RUVRejUranZMa0dkSWlCQXZaWlFWYVg5UWV0TXZDQnpmWEdkTVBDeFlRM1hS?=
 =?utf-8?B?aEcxUHlEZTJDNzhUcDlzNVBIaUFUVWNOdnRvdXBsS3NQbG1YV2VsYitxYllz?=
 =?utf-8?B?eG5LdEFzWHR0NTVpRmVTTW1kYVpvY0ErYmxNWUl3RVB6K25GRng5MnpnU2xt?=
 =?utf-8?B?YmNrTFdsb3FVRnlRMlZFUWNid3kxaUxPbjBKRUV1SnpidzYxNVIrZmdycldN?=
 =?utf-8?B?LzNtVVgzUnlUc3ZGeVVweVVOemFHUTJtLy91c3Y0aVVMbkxFSzkxcjgzUlRZ?=
 =?utf-8?B?bmdValpSVmFYcm9rQ28rblJGOG5rc0NYd0VEamhjVU1nREhZY2REWEpQbzRO?=
 =?utf-8?B?NlZIRXROWTZSdjhiTWY5NUs5WEgyWTk5OEgzSXpvTldTbUs2NEtvL3Yza2RY?=
 =?utf-8?B?TEJRNFNGVGJPb1prYnI3bkswODltdDFpNzF6SE5FUkxYL1h0UHBrWnFJcW82?=
 =?utf-8?B?T1QvUGdFT2RsNGFxNk1RbWFrVHZZTXB1RXdQQ0VYdFVRRXVIdlRPc1R0b2Uy?=
 =?utf-8?B?S2V2aTc4UW5MVUxLUjBKSmQ1bTZIN3BlQVpYbDJSSlRycXd6VkZMZ1BDR0xh?=
 =?utf-8?B?bUVFdGdSNCsxY1hJZWxHYllqSzJHOGZCTHlWNHNCa1duWjN4bUpHUU45ekVo?=
 =?utf-8?B?dTlKRnY1Ry9iUUFDUmIyTFFMamNhSFBsd01pcFlQTW5SdndlUVB5SXdFMWVz?=
 =?utf-8?B?Y1MvNHpFa1R0cUF2MVF1OHN1akJMOHFFMTUzRmlic0RyTFFGREVUUEc1dTVN?=
 =?utf-8?Q?qziiW99NqliC4IHZMxqRSrk/6CoLb3It?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bjZ3c0U0UkNDdklMWjE0MkRXZVRBSXFIYzFDSHpOOFhLSW9yeldDcWNOcEFu?=
 =?utf-8?B?cllZTWxvZER0aUtjcjJKTXYxb2pIakNBbmhkVEU2RmFFK1NmOElRWFE5TTl3?=
 =?utf-8?B?YStNMFEyL2hLKzRqTUo3UTJQenFDSlRBMjNoOHdDVHRiWWVGYnNwYlFDNzQ1?=
 =?utf-8?B?MG1CdUVicTFHRENpTFZOb2VQYzZibWRxbkhGOGVTdnpxUkh3RDkrWXFIdnQ0?=
 =?utf-8?B?MUdEUUFmWEljWmJQQ0VjOXdRak1NWGduYmY4b0tZdHhnWmVkbGlUd2N5Smdi?=
 =?utf-8?B?UE9XQ3BSSGZpUVkwKzJJV0RBNUNOeTRYZXUvN1pEWG82VnJXRVppMlZrblg2?=
 =?utf-8?B?TFNMYmI5SzR0c3J0aGJYSkxwVGZlWmQxNS9GWDMwUWpycmF5bFhBeEQ0M29D?=
 =?utf-8?B?ZndWOVlSbE51QzRwVSt5eGdoUGtIbVpsL1laekloQW9Wa1VQM3YvVFRZR29Q?=
 =?utf-8?B?dXYzWjBtRGRLSUhKSVFMSEEwcjdWSlBFSzJDN1BqRTZNWGxsdHBnYWtGcXRt?=
 =?utf-8?B?UjNTemc4bHdjWWJlblJwMm1GYzFLanowTDdoRHJCZmExNitlcUEzMDZvU1hO?=
 =?utf-8?B?Mm84K0RhalEwY2MzaXlDcHg4WTFuSGN6SFc5OFAzbWRWcGRGc25OT0hGdlpL?=
 =?utf-8?B?TDAzTWVzcDQzUldsUXZlNEZlVGEzZTVPdVlyR2M3YmJVaS9USUxsQUt4aStJ?=
 =?utf-8?B?ejFrbUpjRWZKK1lQdGNmSU9MUVdhb0dnWllVS2FRNDlDNlhSTXd6dzVEeC9k?=
 =?utf-8?B?WmNSdTJLN1NMc2c4UDR1TVVvTzJWKzM3NW5ZSnFZRldOZEY1V2ZFTGUxSW9P?=
 =?utf-8?B?UmdkclhTWDlDRmhmWEFpaE1kZTN1NlJYQWZNN2pGamVmaUc0NThRdHd5YW0r?=
 =?utf-8?B?MjZ0VWhMZ2RXOU1NQkZPYUNobzU3NTR4YTM5RDFla1hiYkY4Ykh1UUVCNGZV?=
 =?utf-8?B?b1NzZjZ0YVRwaVA3M1RZZ0lCQXJkc2tpdWFnSy92ZDcySVE3M3ZlZVM0OHJW?=
 =?utf-8?B?UjVZUEZ6Uks1VXFZQ0hZMFhIZTRvcVdFa1V6TTJpcmlZYVVXSEIvUk8yZnBO?=
 =?utf-8?B?dERmbzNBY1BrN09PNXppNnRxVXMwb1kwUVVQSTczcFA2aG44eFNBYTFNbFlq?=
 =?utf-8?B?c3Rwc2NTcU1CeGRFdjgwVUhGWENqMVJwcHpReHVKZlY4azZEQ3BiT0tjOHEr?=
 =?utf-8?B?cTNnRnNrOWUwS3hRSjFvcXZZUGFjZUpRZTNnd1JqMzFmaWlaVnBWb2NKdVFE?=
 =?utf-8?B?ajBOWVN1ZzR3Z1pqQmRmbEFQelNPeS9VMWpWWWlTVnduVi9tUmREOUhUT2xL?=
 =?utf-8?B?cy8rUjdPWWdod0hQalFsbngxclZFbWk2a2IybndESkRLUGhqUlVQbTlJbWNo?=
 =?utf-8?B?aHdxUTFSc3F5NGNSWWhZNnZ0aVd5UFBMM05keGM4c3gxUkpLaUtWQVNQUW1K?=
 =?utf-8?B?RHpxQzNOQmlMUFFpdTRPTkdDZDNTc0taY3BXNy9UOFFMMnVGVGpCMnVkQk9T?=
 =?utf-8?B?R21CL2Y4UlpnMkhYODJGZG5MU0J5dHBZamltckNZRFE2ZGs4bmRPTWo0ZVpl?=
 =?utf-8?B?VGRSZXJrUFAzdGRiR2V1eXlZZHBFK0Y3ZHRIQ25IYjViUk1QL0hpcERNZ0lW?=
 =?utf-8?B?TzJoM0hsdkZnSy9nZURvUUt6UXptelE1WHhOZVRJQ3NRV05nNkt4Q3llckhu?=
 =?utf-8?B?TUM4Wno3Z3NaYWx5VTdTdExUTjgxNnNFQWthVTJhc0ZWa0xaK1FaUmZmNmk3?=
 =?utf-8?B?UWgzclo2T3hMWlRwUjdralViaGhRalVoWER1L2Q5ZDBZZ3Fta0NrdVovNGZw?=
 =?utf-8?B?dm02dzhvYVpmN1lVcXJrOWFNb080dEZ1blIxVEFFWEJqcnZGVW9GVGc1TmxI?=
 =?utf-8?B?Mm9oU0pGY1lSNjJjOTZCVmpyWXhqUHlSZ3EyN09BOHIvcGF3UUlRa1R5ZDZS?=
 =?utf-8?B?Q2ExTXNiS2ljWnlBajFkVVZOVm15c0xKdjN6aDdJaHhncGN6RVdKSkJzc3h4?=
 =?utf-8?B?ZjVHdzFRSEZOb1RDL0dmUWF6cFdtMEI2dTB1T3NDd29KdGtxNVZjdGRvbEJ4?=
 =?utf-8?B?bmt0R2JOdC9IZkpKQXVkWkFYbEg5Z29rVXJvREcyWGJON3JSWWFjSHJ6Qmtq?=
 =?utf-8?Q?EYvXQ+huW+LniPxav+Hb9BPOW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E814E73D7F37A4D8C6D6BD9D7C58897@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EUEwMlMhxfcPKokRmTkO1JuXuecKP9qhbuT+ksokZRt4doYL3u13S3wchK5e5efAOGhrc3UrAXiI2HIoHufLKl7PWunUaal+Sth2BNPoahsPLodg61SLTMICxoKX+DysLpEhHBHMJQzE/Ykfy1EUkzhaGoDOwPiLMxKdJKOHxiC8q0Ti7aFQIk+qWTn7xsCo/WVF40/RNpBN7yQumYqOSdsu+hBQtDDHg3q1uDejrDDNQhY+oX4f9woQfWFizuYSWt/ahWMNN2eKO+3lb1f4mQOUkZR5EVKygftGOB4xM7k1WQqi52wbG/MKd0LSzz5n2kwJHNpN+GHWQirdz9HwWgp4DIsl65tDip5sctw1DaWZf2S/kIT+lFM1Ru5qHdGUGZN4S84Z7d+0SDpk2CWMuVwkNNIvQSYf46YXIajRJ8MHuJXFfZAz9ZXt8r65ndFdOsNu6g1ji3zKNIGQuT98R9QfJCGdsdrnq1MWEjPcsS5yA8TYXyhpSWsyq/Mkws+Ij5DFewnghbcU5v4vKTEt3aMQLdNKhV/5hQe1grsh4djqLf76iE8Db8L1OfoFxXpDUJwI1vr3wxg5RrIeXJ8n+NaheJySxnOcFQ8/EL1OXy8pjGVrDp6My3//0aL0cNLnwvpvmdxSsK8qDsx0ubolLw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0355e6ef-64ad-407b-cf8e-08dd3a863fd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 01:44:02.6721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bjF3/wIA48wNam/IQ2PBYHakfUXZyiKF43zFAIPB00UJ+laNZ42PNdVULREhnZebgQLnwIHRaLUUYYdjtvu6HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6652
X-Proofpoint-GUID: LF72Ph0E_-MR-0vryIt8bnd6BQPKWHYd
X-Proofpoint-ORIG-GUID: LF72Ph0E_-MR-0vryIt8bnd6BQPKWHYd
X-Authority-Analysis: v=2.4 cv=PewFhjhd c=1 sm=1 tr=0 ts=67904d67 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=Eg60DA10RlxuQewiKCYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_10,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 mlxlogscore=942 spamscore=0 priorityscore=1501 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501220010

T24gRnJpLCBKYW4gMTcsIDIwMjUsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gVGh1LCBK
YW4gMTYsIDIwMjUgYXQgMTE6MzU6MTlQTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
IE9uIFRodSwgSmFuIDE2LCAyMDI1LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+IA0KPiAuLi4N
Cj4gDQo+ID4gPiAgCWZvciAoZXBudW0gPSAwOyBlcG51bSA8IHRvdGFsOyBlcG51bSsrKSB7DQo+
ID4gPiAtCQlpbnQJCQlyZXQ7DQo+ID4gPiArCQlmb3IgKG51bSA9IDA7IG51bSA8IGNvdW50OyBu
dW0rKykgew0KPiA+ID4gKwkJCWlmIChlcG51bSA9PSBlcHNbbnVtXSkNCj4gPiA+ICsJCQkJYnJl
YWs7DQo+ID4gPiArCQl9DQo+ID4gPiArCQlpZiAobnVtIDwgY291bnQpDQo+ID4gPiArCQkJY29u
dGludWU7DQo+ID4gDQo+ID4gWW91IGNhbiBwcm9iYWJseSByZXdyaXRlIHRoaXMgbG9naWMgYmV0
dGVyLg0KPiANCj4gQW55IHN1Z2dlc3Rpb25zPw0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3
IQ0KPiANCg0KRnJvbSB0aGUgZmlyc3QgbG9vaywgaXMgdGhlIGxpc3Qgc29ydGVkPyBJZiBzbywg
eW91IGRvbid0IG5lZWQgYW5vdGhlcg0KZm9yLWxvb3AuDQoNCkFsc28sIHdlIGxvb3Agb3ZlciB0
aGUgbnVtYmVyIG9mIGVuZHBvaW50cyB0aHJvdWdob3V0IHRoZSBkcml2ZXIsIGJ1dA0KeW91IG9u
bHkgc2tpcCBpdCBoZXJlIGR1cmluZyBpbml0LiBQbGVhc2UgZG91YmxlIGNoZWNrIGZvciBpbnZh
bGlkDQphY2Nlc3Npbmcgb2YgZW5kcG9pbnRzIGluIG90aGVyIHBsYWNlcy4NCg0KUGVyaGFwcyBz
ZXQgdGhlIGR3Yy0+ZXBzW3Jlc2VydmVkX2VwXSB0byBFUlJfUFRSKC1FSU5WQUwpIG9yIHNvbWV0
aGluZw0Kd2hlbiB5b3UgcGFyc2UgdGhlIHJlc2VydmVkIGVuZHBvaW50cyBzbyB5b3UgY2FuIHNr
aXAgdGhlbSBpbiB5b3VyIGxvb3AuDQoNCkJSLA0KVGhpbmg=

