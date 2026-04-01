Return-Path: <linux-usb+bounces-35815-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHy0DN6hzWk4fgYAu9opvQ
	(envelope-from <linux-usb+bounces-35815-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 00:53:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 573CB381215
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 00:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0C05303F79E
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 22:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75B93EF0D1;
	Wed,  1 Apr 2026 22:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rFW7laau";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="H9ntp0Iu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AAC9wXkA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB399385535
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 22:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775083704; cv=fail; b=CdJ4EYxx6j3VhP9w/qvGY6ir6aRJSB5Iy+VnWJAByiG6jgyok8Rex8p+NFPtiN2e7UbpIgokywpUiC+G2snRo+3uL8zaf9RZT3y8SeVh9+hJ/ahmBafZ3QmQ4+5VIPY3dJp3MpY0O4hQF3umwvloDkjK1k0JjC88mNaYmQ6QK60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775083704; c=relaxed/simple;
	bh=3QSIF1K0p3NWWWMCICxs81+kM3WZNm38S16wW74owZQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bOTeWTa2oJPenqRe+Vo1XMwaXVJ35hCfR0Qwc61dmgBgxspFK//C1V21PD94Yh5zypdf+CaO1tPuabMBJ+6EqzrsIQjYUaw4UGTjfBZvxAqGcc0xXk6sGDWm8u8wis4X5EClQ0ISsN6WQdfToxj1UQ2YcSuF4oA4+s1DwE6XCFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rFW7laau; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=H9ntp0Iu; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AAC9wXkA reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631J64YA1007848;
	Wed, 1 Apr 2026 15:47:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=3QSIF1K0p3NWWWMCICxs81+kM3WZNm38S16wW74owZQ=; b=
	rFW7laaujxGq2yCOhXlp1p/MKIeKHDibHWrkcBrV3hSV3VmnMIkRt0mK8T6zPvSa
	NtnVVAR8DCqWqQc17i2omlqBdgV+ZsD9cXf9AclLaZRdI2u/ClBNd6YouT8WdTzD
	T5qJkZ+aC3JRsk8QDqoIN5sEJ6TERA7jJtEUr6GTdedSxJxu8g09vK1Mlk8yeOIT
	+TOKEE0ciJ/RYvgacm3WDXEEi4IZIPtuSqTnQJbVBncV/bDHLfv7lWHXm+WzpWW5
	dHSlL7zL6f4eC/VCb1dN10H3pN66Xuf2Ld7p4fdlfN2khmx6LnOGPjLPgUiIzJSt
	61hTl8u3XY1rG/UDV2FY0A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4d9597k6ke-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Apr 2026 15:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1775083678; bh=3QSIF1K0p3NWWWMCICxs81+kM3WZNm38S16wW74owZQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=H9ntp0Iu6NyRwwn3JMxFxCQj6q/t5xnX1UPewveyGeQ65ue4Un2KyOFkEjreNcCSV
	 KAPRU3h9hNrjviZ4PUq++nmUGEjbTann5HRjAb0Ls1okRPOvK6n/XVtO3sMAsQjGJ9
	 P5+bjD4NQfP5oIDbMEt/dW8WaNFXE2cKQeOI/bUXXJbX71WLMP0M+rtgZywwqWgI7q
	 xP7X+dyau2EOZAFj59vq+kHfmMrJ6njZUh2aX1M35ZKDztJebGYX37ssha0TXhNYKA
	 ish714e/1T6/C8ho7DwD2F9yzalkppFDl5B/8G6V/h6liv3qtaZrGhG17XDxrZ3PFs
	 olbw+louSSO6w==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 70CCC404CE;
	Wed,  1 Apr 2026 22:47:58 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 2A4B5A006F;
	Wed,  1 Apr 2026 22:47:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=AAC9wXkA;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00306.outbound.protection.outlook.com [40.93.12.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id CA16240235;
	Wed,  1 Apr 2026 22:47:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsKp2HAgXrVUjAVzSDn45gjR4MIVufDC91phT/pZHHWT0tX+E4NWvIkjkgWkHX+eDCcvzqGG9BuV24blhglFD20D5A004M/N+NvOnOQ66J1wCHV+bAmOkWXMwQV1+11LB6jxdPQK8Zvv4fVlONyYbwXJvYTLuFwdd1LawpbCQfIekvnxk3biO52yUGLBkWFXuTvLLtfLDeh876THUYme4jOOGrKMMWduACHOOtcXDwDTnPQ8zlKeUpxSFm0Ef9mBfuLAdQ5WRGIrsIMNAWj7eyELDQotIjWsWkDhtikurF4PJ/oy0KyxegNHxO7EkIWvrr8k61ipESOtPUWZHyxRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QSIF1K0p3NWWWMCICxs81+kM3WZNm38S16wW74owZQ=;
 b=KoJ66zALN+Cc3rSRTTYBE8hLw7EjUftkG/2FBmCyP30CbwWugZ3bCfd27nl+7lRPZe51Z2GGuH1SxVFl7TRX0pETa7/YERbl40JKyXNFKPx1/WDel9oJVWsLWvLg4WlgPwSY8M94vWKfQCRU2sTgDSlcFDGG2LgtbeEyAAo/Ll1KjKDO4NYz+Kp2fl547/Me4cL2b7Tiqpr5p5YFQVR/FlYS0X7vhebeCgH4B36tpHF0GOuliv49T/uyi7N+SuOpi9hBVi+pm6yCVsomsrYb3Gi5ekvTNiP+7KUDfgbN9BUrAqN8wbYgsFSkDsZRlm+1It3nRNNOjFTmqGOhdArDLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QSIF1K0p3NWWWMCICxs81+kM3WZNm38S16wW74owZQ=;
 b=AAC9wXkAjI9MTlI12xjbsqvaAS6Ih4l3KkZjLXMgQp54gQTdR15GCR2cgiK9q5ONbqF7UgvWIZ0mtnpeAh396i8lzRLzlaYqF8zOloBff+k+3FBbovIDxBAXWjC6OzPNJ0NXXm8ZunWxk/7gTBi/MBle3vcqgHmvv+FfQESA0iA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA3PR12MB8810.namprd12.prod.outlook.com (2603:10b6:806:31f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 22:47:52 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9769.017; Wed, 1 Apr 2026
 22:47:52 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "michal.pecio@gmail.com" <michal.pecio@gmail.com>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Topic: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Index:
 AQHcusCFdimQniQh+kKFqQp1mqfuYbW+fjMAgACCooCAAQbCAIAAqVYAgADI0gCABZiuAIADwCYAgAAHcoCAAAObgA==
Date: Wed, 1 Apr 2026 22:47:52 +0000
Message-ID: <20260401224749.x6kdrkap3n7xqyy7@synopsys.com>
References: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
 <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
 <20260325015110.v4r5smfvdd62fcua@synopsys.com>
 <0f38e10d-ecac-4beb-ad2c-3a42c2546c3c@linux.intel.com>
 <20260326011910.t7ijezht7g7ttrec@synopsys.com>
 <9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
 <20260326232400.zkplsxflhykhayyb@synopsys.com>
 <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
 <20260401220816.ynyhgxr5yoeszoea@synopsys.com>
 <aa2f5418-5070-403a-8fcf-ed6169662e9e@linux.intel.com>
In-Reply-To: <aa2f5418-5070-403a-8fcf-ed6169662e9e@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA3PR12MB8810:EE_
x-ms-office365-filtering-correlation-id: 2f3f1c20-f062-46c3-21bd-08de9040b516
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 GlcUGpwSJcWEjuIrHYodxaiDFv/Yk8ZvakwU86lvSpI9U0yIUTz5GVI0HfH2JFXcz/+eLX2184Tyu1XemRDp3cSnTmxAq8J0yNkgIxSRGrzn/gtj0nyntVyDoy+qlJedqk+mYCF3Cp9i6uPQMsX0psdruEXvCvGUa0ZIyi1dzxfzTh6+6u0sCZ80D2Rk018vqm5Z/TBrca5koMUlVbaNRkxDSXN0pBPITUJBI97wpGX2EJRxMKdMCZQ7PRkMheJv93yKqd3fpEEYEbmkBqHi9HVPy+K/vBMY/EgeEih6/nnK24cfn9I3EAJJ3AhKx+qceWX3EkPwHbv8OA8goiPV0D5ZPrd9jH9NOerTgfN5qR7QL9qSEnDjGS3NCvdduydC7qKYeAQvU/7x9Pe+jw3oKHsJDFZNDtXX19gkLvml6Ju2APc++sL45NJGMCwUx7wlGzTJkrzcoYqcI2Z905GU37RfmP59S1u4/lG7f9KfQZ3xC+AIX6qgO+Lm6h549CuCyCnPUo47DB19ss/reifu9GqBoFUsxomJFkRVFeMlMKuAJUSHsfMtcqJaPjhr1qVrfoPNMWjgW/1XFhz2uvjIHORDG2Ew2/OIQZ5AP8aA5jzyppPdEuLKhS5TQ062PMEgFMGKpZ30vNUil6ew1tsdLLw08VOc6enfOLXIHUQOz7xYCTX/yW0/3E7SOUti63LjjRUeORoXhdbk9ga2udsEBWcaixa/VEq+Z+Gp7j8unpptnSTzu0BPG70uKHGibvsXjnq65DNp9sWzezGk/brpDWJx/4PiA88b2wFEd5UXBVY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eTVYYU1mbzBqazF6T3dINEc0YVZQZVl4ZGVxN1JNbk03NDlJMjd1bTdFc1Q4?=
 =?utf-8?B?MEVZbFN6d0h3c09SektyMlo3MzJBN2RReElma2l2N3RRTktCRGpjVEFOSGp2?=
 =?utf-8?B?V0M4emQ2aVNzV0grQ3ptUm54L3docHRPcHlwVjkxZ0Z1cFJwWXVIVXREYkQ3?=
 =?utf-8?B?M2N5TTVsbWN3YzZja1J2M2hrUENoMllocUhWR2Z2SXd1YUgrTEVrdVhQbFZm?=
 =?utf-8?B?RVVxSFFzWUJZSE9xRXBDckdMNnBES2dRSEZOWVBjZmRiczhvenptR1lBVG1m?=
 =?utf-8?B?ME5ocE5BeVJ6SzFPUUpORjZINktNbXlHOStqdGQ5NndBOGczVjY4SldrWkdT?=
 =?utf-8?B?aGhPTGF2MU5EbEJnY2dLaDFHQXJGSWxUTkY0bEpTZlVsZ2oycWZGRVYzaUpq?=
 =?utf-8?B?bFBCYnY2Ukg1YVprK0cxcjR3c1N5QlB5dGJGYW9HcFVlNWh5eWZFSUFoYnVZ?=
 =?utf-8?B?bWJNN3dFUFZhdzZwVCtoTmlGUldSYU9DYWE1UjFESzVGdmhkQWtPQUtHREhB?=
 =?utf-8?B?ZkxQWW05VVdoeDN5YXBMcEh2Nk5aM1V5bHROTStsYkZTRjVKNWhIWkJrT0V2?=
 =?utf-8?B?U3VLd3JYSlMxRW9iNHdCMVcwWVdoWEJxYVJEVWNLVzB4dWM0RklEenlrS2pM?=
 =?utf-8?B?ZEdVUktTS0toRnYvQkFOMmZVRmpKTFAvbUJuYjFJeWh0K2tuZVR2MWxzYk1S?=
 =?utf-8?B?L0M5OTMvcXNhVVlFNDBPWkZxL0RJZHNrR2cyajg0ZDRTUFR5MGJxckNuVVN0?=
 =?utf-8?B?WmxQaTM4Mm1rcCtFZDB5dzA5R1Y1TWh6Q040UjNBdGl6WXZSZUxhenRKZFlN?=
 =?utf-8?B?dlcrV1FNYk1NZGNNVW5GQWJKU0dvbDdheDBnMFpEb0o1TXVWcFJoRXNEV1Zs?=
 =?utf-8?B?emFPdjU1YkRjMnVwZ2EydDE0cEFNWFdLait5UEQ0ejdxNjUwdmRKcmRyWEc2?=
 =?utf-8?B?THlkbERuMmN5TzVQZmUyWmFxSytYNG96RlNlSjl3UGxoQ2NIV0FJMEU0cUZC?=
 =?utf-8?B?UWRFS0N0MWpDeFZHWlpRdkUzY3l0VXF0Q2JWWTlzNnVlR0M3NVVvVzErSkpw?=
 =?utf-8?B?YUZ5Z2NUMGFCcmV0U0VTSWFGKzNicVA5dE9aSkJ4aHpqRUJFemdqb1laRlk1?=
 =?utf-8?B?dnFiYnd6N1Q5V2NRc0FiTmM3RGRmQlRlS2NJd1k1ZDFsTHE2d2poT3N2OFVL?=
 =?utf-8?B?QXJFSzB5bDNlMWhRN2dFaEZmMGFFQzJmTENSbTdZZG4zaUtObElJQU5sSGJN?=
 =?utf-8?B?dVZIWHd4YUdpMDluMXVnUjE3Njg2dXA0b2RzSjl2eitGeS9YQ3l1MUhGYVND?=
 =?utf-8?B?RzBxRTNmTzFHM2FLY3FBcWNuK0ljdXJZN3BydWRrTldsRkRRN29ZbGxsVXU2?=
 =?utf-8?B?WWNaMzVUeDc2M3dlbXc4K3N1dTNoUWZoOHlYMytrTXg1RlhjbnRJMEJHRjdo?=
 =?utf-8?B?UVJEMU8wQXl6NXh0azFjb2g5cE8vOGljbkJXelhOak4zNkNNaUsrZFpPQXN5?=
 =?utf-8?B?Rjg1Vmw2VnRDVFh2OWo0cWlrVWhrbXgvWTRHZjE2V2RaYXpnNFBicEZBdGFa?=
 =?utf-8?B?R0FsZjR4YzhmNE8wWVQrZXRQcStTejZUT1pkTmI2OFgwRzBFbTI0QWg1ZjJa?=
 =?utf-8?B?OFBzMjYveTZ0K0ZhZ1ZKUDFOY2g1RElvS2U1RWZEREc4YmQ1Yy9zTk1CVEFq?=
 =?utf-8?B?QXBOMEhGSEgvRVgzWEp1a2UwRjZRYnZHWEsvTEtsQlNVY3JjWUkwaDZBOWRv?=
 =?utf-8?B?YlVjcnY4d1RVSUYzdmY0MDE5UFMxV0R6eitwQUdjZ3haRklKSHJMc1dGUlNl?=
 =?utf-8?B?R3ZCaFg3WElIT0NtYlJzS29GeGMyTG56OWZXVm0xU1FKZDNpOUxoVWxYbWll?=
 =?utf-8?B?dkF3bkxpMjQyck9JZktuZjI0alQyckpRTWNtYXVHSnROaTlUb2RPSGhVMm1N?=
 =?utf-8?B?RDA3cUR4c3Z4eTVjRkErS1hReE9OdWRocHI1WXJ1Yk9nOUx3VnZvSGxSRTVw?=
 =?utf-8?B?SlR2SWxNNTRyL2pvL1FCSDVFbkllVGxDVW91cUwvbm9OSnJudmhkTkFxWHBS?=
 =?utf-8?B?dU03bmtkMXdaUHdaQjdwRTZDZm5lNitVMUVsLys5UzVQOWNvVmQyOHkxRXAy?=
 =?utf-8?B?azQvYXZDQ1lCWHdScVFQYkxtNXJld1dnQXdwM2dLU0plRlhiektTOTk4UWRh?=
 =?utf-8?B?VjhmTy9UZlFLREFXV3E2OUFRa3JLWkJWdGRtd2ZrYkorSVBpYTFxL3AxNElK?=
 =?utf-8?B?U3ZzdFQrQlZ2bVA4bXBBK1B2NzlPMjRZdUhoM3p2RW12S1d1U1ZHeEthUU9o?=
 =?utf-8?B?SVNJS1FSTEhXQTByZXdhRTlsOUxyNE0rYkJwU2paZGpEVXVQUmVOdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F3570E192F34F438BAA82F91813138F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	im6CQ0610JhZABkCJAcaI7j0Mpbxt1Bqvl5jRWTkDb6FTOXcciMaGIWbHBlfMLGZhi1eDO+jQZMvPki8UDXAYF/m6KEgXrXSdEGC/Dt7+sLpCjsXbC93TblP9a0mf/N1XW8BgszmDHFcp/Y8uCelJQrkZabbCYMvt5Zd5bGi0HsfKJf7FwvP0JD+zm4pfFwbuSJg54UefFswFethefsgvDPiwyzBZRDExc+HXdZTijfqgorI9c2dYhAALSDmwuzdfYPZqi2vK99Voad8doG3lR03YsmdubI4Wop1vq84VBVRuIDYJTqSAz4qU03+lEdPysm7rsio83Ji0VBmT/P0Nw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9Sw1KrekyzH4UYVv9YCQ0sJqyamfEJs/fknIwM9I15mRF9FHJGCpbXF2y3NPOCHDdJ8XmkoYDeO0+Evpjg8jq8TAoFI5ve6Og2EajZ8j7onv1f+3jqZK6tomS/hvbi7y89Wk4Tp0XHTbycHXvZfVgf0709K/ZNqjxHnmJYXLjOFakl2ZNJPNmjYTSTVeVBt0FffFbsXIEFoIKGFyxDgURgPcOSmgCz0MwqNQS+AWxWzc890EwXwAnJZz5OxyiqmxBMyHA329D++3cYc7xdw8opN+cG4y+h+CfHk45w3MnE6BQhJ2+Cn6NL9xPe2hoi0u6gMp9+e6ZzR5bgJVLyS7ws+MTrz4xIeY2c8Ig+sR+G6I7U40KMp0hz+FrCrntlrCf8kg9aXFH0NyQcLyC8JVRcd2D1wKn+up00wp0FTURJJt8s0ayQJyJXEPIjbHCKamZ4NXSXQQLvGwwXp87DJ6IeF9WT8ADivyhvSAtVvO/K9XxLG6DCfaUV9/MFC2F6r70fuxZ9mP+YUgAice9GswdiE+wPBOYnFiki6BJI+q7IQ7oc4sZ2ve1d43bv5YMIPAdBKkvBfMsoFSS0G6OYSIaB/HrkT7ZBbbgwl8Tmz7lvBmn3aWNxuiTLr0FEXQ+FvbXMZBKuOr+4FVCULkiuwOfA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3f1c20-f062-46c3-21bd-08de9040b516
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 22:47:52.3550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CI62iRl/qLPWm40Xae4KqTVixdQKzvK1KBc9lIv0GcgpU2Tw5ftKeJvts09f4/d+cf0oFz222LiKYclk6ga7og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8810
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDIxNSBTYWx0ZWRfXxvrv9XpHB6Tu
 Rd2ZA8Q/MTrheRaiUxaS/1r/zhiy8ZOwoCkJmCvu+Oqe4RCdQwCmDHyZ6+y6OOwhH7yFEpSitWw
 pkuAAMXukrt0mSYq1wN1aduN5SJtah3n2/UCptB41I6x3MIsCTwMqeJBdrGZks2PQ9henMPY+OK
 f40xVGZcp47oee/JsqOIJPljzx930NjbP2jfnfPhnjdYw4EN0n9P1LezgEs0LdAsizh6sphHK7c
 iLuuqKka9kYZcARvJGVu/w5KsMhX7j4pyfARImeG3PVdt4kZdrdXURggWikNlxq3r/fIb4DUjWR
 A74rHin3XisNiPVEI/1Jf7VRfE6lwq/Y+X7VE64SWmUiFYP8UbUcbc3LoWOl/jWFQLsTD31UA+/
 W15TNfKssOXPpdFzKYrPUIxj7I+AmrMfeu0kk5Xgnjj6z9wVIgpCPL0+VG0w6ar5TGpsj9jinXs
 0jtD5b6VXFkuDFzVv9w==
X-Proofpoint-ORIG-GUID: eqhVE50QQuLB9NMH9CcocStQXEY5oX6F
X-Proofpoint-GUID: eqhVE50QQuLB9NMH9CcocStQXEY5oX6F
X-Authority-Analysis: v=2.4 cv=aJr9aL9m c=1 sm=1 tr=0 ts=69cda09f cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=Ae2jzff8xP-zOK7Tj1gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_05,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2604010215
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35815-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,synopsys.com:dkim,synopsys.com:mid];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,rowland.harvard.edu,gmail.com,suse.com,linux.intel.com];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 573CB381215
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBBcHIgMDIsIDIwMjYsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IE9uIDQvMi8yNiAw
MTowOCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIE1vbiwgTWFyIDMwLCAyMDI2LCBNYXRo
aWFzIE55bWFuIHdyb3RlOg0KPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBPbiBhIHNlcGFyYXRl
IG5vdGUsIHdpbGwgeW91IHBsYW4gdG8gaW1wbGVtZW50IHRoZSBjbGVhci1oYWx0IGZvciBFUFJP
VE8NCj4gPiA+ID4gaW4geGhjaT8NCj4gPiA+IA0KPiA+ID4gSSBkb24ndCB0aGluayB0aGlzIHNo
b3VsZCBiZSBwYXJ0IG9mIHhoY2kgZHJpdmVyLiBEZWNpc2lvbiB0byBzZW5kIGNvbnRyb2wgcmVx
dWVzdHMNCj4gPiA+IHRvIHRoZSBkZXZpY2Ugc2hvdWxkIGJlIGRvbmUgYnkgY29yZSBvciBjbGFz
cyBkcml2ZXJzLg0KPiA+ID4gDQo+ID4gDQo+ID4gVGhpcyBub3QgbGlrZSBTVEFMTCB3aGVyZSBp
dCdzIHN0YW5kYXJkaXplZCBmb3IgdGhlIGNvcmUgb3IgY2xhc3MgZHJpdmVyDQo+ID4gdG8ga25v
dyBob3cgdG8gaGFuZGxlLiBUaGUgcHJvZ3JhbW1pbmcgc2VxdWVuY2UgZm9yIHRoZSBlcnJvcnMg
dGhhdA0KPiA+IHJlc3VsdGVkIGluIEVQUk9UTyBmcm9tIHhoY2kgaXMgc3BlY2lmaWMgdG8geGhj
aS4gVGhhdCBpcywgdGhlIHhoY2kNCj4gPiByZXNldCBlbmRwb2ludCBjb21tYW5kIHdpbGwgcmVz
ZXQgdGhlIGJ1bGsgc2VxdWVuY2UsIGl0J3Mgc3BlY2lmaWMgdG8NCj4gPiB4aGNpLiBUaGUgeGhj
aSBzcGVjIHJlY29tbWVuZHMgdG8gc2VuZCBhIGNsZWFyLWhhbHQgZm9yIHRoaXMgc2NlbmFyaW8s
DQo+ID4gbm90IHRoZSBVU0Igc3BlYyBvciBhbnkgb3RoZXIgY2xhc3Mgc3BlY2lmaWMgc3BlYy4g
U28gd2Ugc2hvdWxkIG5vdA0KPiA+IGRlbGVnYXRlIHRoaXMgdG8gdGhlIGNvcmUgb3IgY2xhc3Mg
ZHJpdmVyIHRvIGhhbmRsZS4NCj4gPiANCj4gVVNCIDIgU3BlY2lmaWNhdGlvbiBkb2VzIG1lbnRp
b24gaGFuZGxpbmcgaGFsdCBjb25kaXRpb25zIGR1ZSB0byAgdHJhbnNtaXNzaW9uDQo+IGVycm9z
IF9PUl8gU1RBTEwgaGFuZHNoYWtlIHdpdGggY2xlYXJpbmcgaGFsdCBhbmQgcmVzZXR0aW5nIGJv
dGggaG9zdCBhbmQgZGV2aWNlDQo+IGVuZHBvaW50IHRvZ2dsZS4NCj4gDQo+IFNlZSBVU0IgMg0K
PiANCj4gNS43LjUgSW50ZXJydXB0IFRyYW5zZmVyIERhdGEgU2VxdWVuY2VzDQo+IA0KPiAiSWYg
YSBoYWx0IGNvbmRpdGlvbiBpcyBkZXRlY3RlZCBvbiBhbiBpbnRlcnJ1cHQgcGlwZSBkdWUgdG8g
dHJhbnNtaXNzaW9uIGVycm9ycyBvcg0KPiAgYSBTVEFMTCBoYW5kc2hha2UgYmVpbmcgcmV0dXJu
ZWQgZnJvbSB0aGUgZW5kcG9pbnQsIGFsbCBwZW5kaW5nIElSUHMgYXJlIHJldGlyZWQuDQo+ICBS
ZW1vdmFsIG9mIHRoZSBoYWx0IGNvbmRpdGlvbiBpcyBhY2hpZXZlZCB2aWEgc29mdHdhcmUgaW50
ZXJ2ZW50aW9uIHRocm91Z2ggYQ0KPiAgc2VwYXJhdGUgY29udHJvbCBwaXBlLiBUaGlzIHJlY292
ZXJ5IHdpbGwgcmVzZXQgdGhlIGRhdGEgdG9nZ2xlIGJpdCB0byBEQVRBMCBmb3INCj4gIHRoZSBl
bmRwb2ludCBvbiBib3RoIHRoZSBob3N0IGFuZCB0aGUgZGV2aWNlIg0KPiANCj4gNS44LjUgQnVs
ayBUcmFuc2ZlciBEYXRhIFNlcXVlbmNlcw0KPiANCj4gIklmIGEgaGFsdCBjb25kaXRpb24gaXMg
ZGV0ZWN0ZWQgb24gYSBidWxrIHBpcGUgZHVlIHRvIHRyYW5zbWlzc2lvbiBlcnJvcnMgb3IgYQ0K
PiAgU1RBTEwgaGFuZHNoYWtlIGJlaW5nIHJldHVybmVkIGZyb20gdGhlIGVuZHBvaW50LCBhbGwg
cGVuZGluZyBJUlBzIGFyZSByZXRpcmVkLg0KPiAgUmVtb3ZhbCBvZiB0aGUgaGFsdCBjb25kaXRp
b24gaXMgYWNoaWV2ZWQgdmlhIHNvZnR3YXJlIGludGVydmVudGlvbiB0aHJvdWdoIGENCj4gIHNl
cGFyYXRlIGNvbnRyb2wgcGlwZS4gVGhpcyByZWNvdmVyeSB3aWxsIHJlc2V0IHRoZSBkYXRhIHRv
Z2dsZSBiaXQgdG8gREFUQTANCj4gIGZvciB0aGUgZW5kcG9pbnQgb24gYm90aCB0aGUgaG9zdCBh
bmQgdGhlIGRldmljZSINCj4gDQoNCkFofiBJIHN0YW5kIGNvcnJlY3RlZC4gTXkgbWVtb3J5IHNl
cnZlZCBtZSB3cm9uZy4gVGhhbmtzIGZvciBwb2ludGluZw0KdGhpcyBvdXQuDQoNCkJSLA0KVGhp
bmg=

