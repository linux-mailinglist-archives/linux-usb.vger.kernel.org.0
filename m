Return-Path: <linux-usb+bounces-24048-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 362CDABA756
	for <lists+linux-usb@lfdr.de>; Sat, 17 May 2025 02:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A7443A8D1D
	for <lists+linux-usb@lfdr.de>; Sat, 17 May 2025 00:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F41DB667;
	Sat, 17 May 2025 00:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pa/ZSepA";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZqEeM1Qe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gyOR8zPB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576D14B1E76
	for <linux-usb@vger.kernel.org>; Sat, 17 May 2025 00:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747441032; cv=fail; b=Oph/OfidJUt+iZJFV2m7wBzNHwSZpVnvWgS+ZkPQmmRrK1B2/ku4w9mE7HpksaxMrugTQC6t7g35KkPr+rTkrZAOPyH7qiKQRVrEC0MYI4zdj+6ojaRsk5Ml9FYXzeilL/fXO+Y3Ryyp/O9bLAn+FpGIcZrgdLjuZ6coPCkYpPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747441032; c=relaxed/simple;
	bh=mSnZOGo9tg3SpGoW/7WFZZEkMytxuweCpyl3Zc8mPms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jCBKMggxU/P4F6lbRlJ50N1LIVkHY6p/XkHUhodVVC73Sf5maHCdClA39wi7g+ILav6oUXRjg5rD3n+3x+xxp9NWm/xNBZ7Hup6n2fAMfSzAb82d5X0XVFo8NZ6I5YXr6Bsz/C3xsjc2u6U17Lby4S31tpasZpTPpVAuPXxrO3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pa/ZSepA; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZqEeM1Qe; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gyOR8zPB reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GMC66m023114;
	Fri, 16 May 2025 17:17:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=mSnZOGo9tg3SpGoW/7WFZZEkMytxuweCpyl3Zc8mPms=; b=
	pa/ZSepAkxGE4S/7WIJSfqvwmis7yxANINrZVfZ0CF3bYNZurZE7IzPvpG/wC2k3
	fBGMZIU/PpX5IkKNWGboJfNlFE29/dv+6lucV4O0Sdx7XxiVYPB+UjQoabAfGF9+
	ydl0VtxMn79ZIKxnoJziGS3CKNpJalGmqkQsDHPSDKAir5pR+I0g6KZnPMRdkTCP
	f378ptZiYCUB33yEmthnHrHYlt9tBu1Pf7ryH8la0K7ZhxYMmzeo2H/Lqz8MQc1b
	XYfBpRZSjtrUrX6VimlG02PnsbmQBp1GP7k/deh2dXRjp8NpaTeuH2L6SD+BNl83
	Ygz8nOwSryerKHt315T35Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 46mbe5evyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 17:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1747441020; bh=mSnZOGo9tg3SpGoW/7WFZZEkMytxuweCpyl3Zc8mPms=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ZqEeM1QeUolhK/UkAZMqipZfyRnKWtpz88dbBsIqY8ZshnJ2/96wY8x6XdPBxLKdw
	 3qb0fFu4/er8ZonReN0q7o8ABafaYSz3gsmUr8GcSHD0nkpVtjtNi10L8p3tnvoAwt
	 8wrhAe3IlwJERSB9TLRMPJkHXtzJKBJT21lP2gEkml9fex+1bcBPSfZkES1NRUdmJR
	 M4GwVgzXvV2MtekEK3dLdfYt7Es6+Koa9Gpj5TesJi1vk0jjknxHqj67FSAnDGgD8G
	 UzNSclYBadGJ8/6gAleD7urFfYWmdzQAB4ce4GBj0v5mvMPrUO4Wipo+WEkWDCQ/rz
	 wlyQ4Dinp5UVA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5A560401F6;
	Sat, 17 May 2025 00:16:59 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id AEFFEA007A;
	Sat, 17 May 2025 00:16:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=gyOR8zPB;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9C1E5409C0;
	Sat, 17 May 2025 00:16:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlZYHs768tYkyugHHpdehH85twbITCg7cd8D2m3ujbomRbLuRUgPKEwI68YVDnYBwclejQ0bYDXgJd5HdiniDBEGbMCTdniqJeROJDFne3LQ/HHJoHKms7G9TrNx3cYP7x3avbdt0nMnNQ2QntGWl8R79qrVWSbKaV6Xzz7T40OoEQtEBenGlraO2qXRFZ6ax2/fFSuHqIzLaHdvVGGrwtpJEoxosBx4LduJ0fKe5iLjFc3SpxL/g/jp9RBdiSlO5fLT8KxwmFGWiBKoOdfX9wZpZGDVaJ0Xq3GIZzgAE5cNM4h74YQgHhnT1T6dDktqa1aqUo+l+hQXEbQZnPeuQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSnZOGo9tg3SpGoW/7WFZZEkMytxuweCpyl3Zc8mPms=;
 b=Vg1TbFgfZkifuhj1YbRNfWT/3/31/BexKygEfk66uyN1C/0nNw+taO0iwyQUZ5spLzsYu3dg3y8U/aB2zEVTRHKZ3csBd5uvCjIZP/UJtoZC1dGOUaYnWLY6X7U6yQQ50HNh6aBh0aTX4NrbtbgrseL/jLEsOxygOIoB23P/VNtq5IZd0b+KxZBwE2e9e5LlFp7a2k/AEbBNzVsaenggkF8x23c0tE4ucqyo8Uq3saDu310G16Ot9sak9nCYUavVadBfbld4YqCCKc1/cXUQP+KE8NLhaOW0g/hT3xh7FaVPzEfBttuGPM8LE5Wh3DwmupojONQkjtGZUg2KK5eVow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSnZOGo9tg3SpGoW/7WFZZEkMytxuweCpyl3Zc8mPms=;
 b=gyOR8zPBKu2K0gR4kkVcUmv6xKen2STv2BFkWiI4k+jUE4XaFb9VoztrVYoetEh1Wal9KHTWLGnTY0lb4rgB290ciPAoVQCSlGh3fdg+2eL3rjynqHq3nkGoHeRjIg3k0PT7i/s97IUmnsm+9FItP65MvQBSYOJ7JAqQj3DClGM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB6416.namprd12.prod.outlook.com (2603:10b6:8:cb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Sat, 17 May 2025 00:16:54 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8722.027; Sat, 17 May 2025
 00:16:54 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Amardeep Rai <amardeep.rai@intel.com>,
        Kannappan R <r.kannappan@intel.com>
Subject: Re: [PATCH 24/24] xhci: Add host support for eUSB2 double isochronous
 bandwidth devices
Thread-Topic: [PATCH 24/24] xhci: Add host support for eUSB2 double
 isochronous bandwidth devices
Thread-Index: AQHbxaGFPsYlUyA4m0aA1RSkmDivRbPUZzcAgAADqwCAAL16AIAAzlgA
Date: Sat, 17 May 2025 00:16:54 +0000
Message-ID: <20250517001650.i3tzcpg4mhgsnpur@synopsys.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
 <20250515135621.335595-25-mathias.nyman@linux.intel.com>
 <20250516002700.cags7zapbshy7ri7@synopsys.com>
 <20250516004008.lzd7yhsagz63oxmf@synopsys.com>
 <3c1ed781-2c65-422f-957d-51f37d576090@linux.intel.com>
In-Reply-To: <3c1ed781-2c65-422f-957d-51f37d576090@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB6416:EE_
x-ms-office365-filtering-correlation-id: cb43a793-d27e-436e-b8ae-08dd94d82106
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bkVwVnJXR0U2L0g5WklDWUpmRDFTL1BNY1Uwdi8yY3BHcnlUcEhseWduMVEz?=
 =?utf-8?B?TEE0encyU09rcVZIM3dPRWlTNFhoMWI4NnZhaXRvYklZVTFSTWRBL21HcEJ5?=
 =?utf-8?B?THUvOElTbGhtdVQzNkl2QkhDWDhoMUh4cWIvSTIvbXA0MVpMRmRGZVMvOGs2?=
 =?utf-8?B?QVV4WStrS0N3WXdxcFo3Q3duL0JPMmhFQnRmeVZzZ3JpcFFmRjE1RGVXTDUy?=
 =?utf-8?B?ODZST1lnM2s4OGpxSmZjTHRKK1NubWdXdGZ2UnlWQjY3ZllFOTRPOW8xZlhM?=
 =?utf-8?B?bjRCZzhIRzJMWE84OXZhblpVV1RiZkY1OEtQSzRVemtDc2tHVCtMMjdNOWdj?=
 =?utf-8?B?Ky9mY0Z5ZnVOeEJlQTRWNkNlTHRJMjZpK0JaMk55KzJYdUlWaVIvMjdPbW4v?=
 =?utf-8?B?UGkxNlZDd0xzdkZLMGtGdm0xeXZ6RFNaNlJ6NkpTMThGdUlUVEFjTUxQcm0x?=
 =?utf-8?B?SGxEUGs1Unp5V0d1VnFBcStWMjdWZVYwc2NqeFVRVnJnZHM2em11Wk1leVhu?=
 =?utf-8?B?TUlOelE1UFFQR2VRV0haZzVoeUJKQTJ6cEdISFhGR3VQQnZnOFJzSDFLWUNq?=
 =?utf-8?B?aVZEbHBxeTZ2VXZLYVNtYWpjcHpVTm9FWk8ybHVmOThLL1dPRVY5WWtpb0xi?=
 =?utf-8?B?TlFFeHdBc1VrQkpYTXhtRVlhN1RSd1NmTURSMVc4dHJSdzRhbjlHclplTmNv?=
 =?utf-8?B?V0V5Z0NMOG5vQ3U0SnpKbG55RWFkVllnNjFBL054R3JBcEM4T01Db05CT0RU?=
 =?utf-8?B?R1JLYjIzOFJZQ3lCenMvWkRGcld1L3NJL2tMblRrVU83RWJTc1BLZU9XeWJq?=
 =?utf-8?B?QUFocDdFUGpjTVVsZFAxakxSQ2h2NHptMEdYeHdUaC9Ob1NXNXhUMkEzNlEz?=
 =?utf-8?B?RTcrWHVNb29hNnBDNElydmxJa2dlTSswQWVRSTVwcUlnL0RTWSs1RFp4Qytn?=
 =?utf-8?B?a3pSbU9ESUhKbExldytNSnlJMlVrOUNyaUlWYUNmRzRqTEdqei9qU3NwMU84?=
 =?utf-8?B?VjRrTDBjeTBzTzFzdHlVdnVOS1huV3VYM0ZFU1drQ3g3MEI5ZWpQaVVFRG5G?=
 =?utf-8?B?UUNxMUNzVDlJMnpCd1E0ZjVTRkNxbEtYTnBFdlVLaVRFYjBPTGFSSWw5VjRZ?=
 =?utf-8?B?clFjWGRndTlwdytlaE1ubVBlUjhVVUNQdktMMlNOeG40SzZ3VzZReEZnaHlG?=
 =?utf-8?B?NXBNRllsMmhweEV2RVlFZGdid0hYRWkyck9hVUE1NTF3RDcwZXp3eTlEdVV6?=
 =?utf-8?B?TVh3QTE4RDNCQkJSZDFyUmJzNkhjTzJkdnd4MWU1MVVLeHhHdWw2ak5FSkM3?=
 =?utf-8?B?S25VOGozWUpJYnkxalVVSVBSVnU2a2EzL21NNE00ZTdNcUttTVRUYldiNkZF?=
 =?utf-8?B?bWNWUDlzQ0UzTzNYUkZJbGlLMEpvbDUwdVBOdU53ODYzUlZ0cGVIdk5FY1Fw?=
 =?utf-8?B?WnUxT29kZmFHbWZmeVFrQlROdVJERVduWEhvb05UWDd4M2czM2JnOUZDWlRU?=
 =?utf-8?B?NzlPM29TU1hkTU1aRkFqS0ZiMmhvYTdyM1RPL3lKUDk5T1lsNFJEZjMxbjRj?=
 =?utf-8?B?RTFUN1pRN01jYVkwRTNFNzBpSEdWOWZlOVZucWRndTVlUjIrUU9VQmR6UGhw?=
 =?utf-8?B?WFJkMWhsQisrSVQ2NUJtOTF5RWwrMHk3U0FqRTk5d0Jybm1yWU5ObnhLYmJT?=
 =?utf-8?B?S01pU3dBTnlTNlI3b3NBMnlCRC93MjVjMSs0VjJDM1pST1d2VjZtbW51S2RD?=
 =?utf-8?B?TnExbHJqeFE4WXpBTG9XZmFWRFRZdW5hVHk0SzVpaG8zV2cwbWEzeDlCcmtJ?=
 =?utf-8?B?QUIwTFZ6akVYMUcveXFMcVc2S3RmUTFIT05FV1o2cnRYMVk0bnROSC9kZ3VX?=
 =?utf-8?B?c0FBQkhpWW53QmY0aGRDVEJpcmVRemFoWHlkSWdOK3BCY29iRzRVMnhaRU4x?=
 =?utf-8?B?UWdpcXQ4K2NKYVdyWTdpNzBHcUc3bEZkZERoa2UvQ1F2SmF2RXhZQ3VXdVVU?=
 =?utf-8?B?WmJYaStQc3hnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ODd4NWJxN0Z6TnBwNWx1R0doQWJBZFRWUzVPZGxYTCtiN2pjNFV4Q0swOXJx?=
 =?utf-8?B?VmVacFhrM3Y0cmFISFN0OEpMWEhwemtKMnZkbWNVUjBmMmdYZW9iRnppTExY?=
 =?utf-8?B?Rm1tNnM1QmJDK05UK1FXQWgvN2d6Wi83dmF1TktUNG5JVGpVWWh2MmI5K3p3?=
 =?utf-8?B?aEg3UVNzcVg2aSt4Mit1VU9aYTJCVC9wNS9lZFczVWhlYmt1N0JuYXpFMWlQ?=
 =?utf-8?B?VGJlSlNUQmozb3d4MmNDWUtKekR6TlB6WEE0WVMrUmttTDNSUFFDeWkyL3Q5?=
 =?utf-8?B?WHVtc3Y4b2JtSVV1UEFHWEtCNHFhcXhKK1F0c3ZYTm9ORlpBa3Y4cUtOaUVG?=
 =?utf-8?B?RHV3RC9qY3gwc3JaRUJta1NqSzFOSVJSeTNkTVdTbkJ0ekhUNlN2TTgvQkVp?=
 =?utf-8?B?ckVzUVdrS1k5L2V1VG1Ec0JMUnJHT3NmTlF6ck52WWNaYVp6b3N4dlZlVGpP?=
 =?utf-8?B?aFdlSW5aUURpS25YbTFKQ0R6Y0JZdzZySTdUTGc3NkFkV29jVTVnazYxdmdU?=
 =?utf-8?B?WmhncFRkb25JUFFrWERETFoxcUhkMnJncW52Rms3dUIrRXh0dHU1YTJha3VP?=
 =?utf-8?B?WlR2eU00bWFiRmQxT05FTEVhNFd0WHpTYWZ1cEMyNDc4QXVsSWs3aEpDQThQ?=
 =?utf-8?B?VkZISkR2aFNtK24yamdWYnJmaDRTZjlNZXBib0k5V3hYMGtFVUJRRFQ5UG8x?=
 =?utf-8?B?Kzd3SWREZzhFQkQ5S25GU2ZabThKOEszaXVORGRSMUdIeVFxY0ZPNVowVS81?=
 =?utf-8?B?RE42Z09rd1hLa1d1OVJvZDNzRWE0NGN4ZDFOWGp1R1VvMW9lRzJrdDBKcUtt?=
 =?utf-8?B?WDZ3WnF3TG9ucFc3RkNFWnR4OWZGekc5MkhDNVpGWm02NmxKdHdXM0c3K04y?=
 =?utf-8?B?dEF3VVFOcEJxMi92cjV1KzgvQW82bXlrRWpvTmhHbis3RWVXdWNyTVBPMU1u?=
 =?utf-8?B?MUV5eVdSc0FpSjFqMk00dVRIdFdIQTlNazZXVVZuRGZhN1A5VWwwbmZTSXps?=
 =?utf-8?B?bGUzK3U4UUlCZTNuV215K09xV0dFYlhPTGFOTXorSzVVV1hoY05TalZyRkZN?=
 =?utf-8?B?THNzNzcvYnlRY0tST0hlNm16eXAzZXpFbUlibzU3dnU4Mlk1cWw5ai9aeG9F?=
 =?utf-8?B?QWtrR3RTZ2ZRbUlZbEZKbnIwRk9BS3ByY05NdEkxYjFtNjFmS0VYNzBEWEcv?=
 =?utf-8?B?eEExK2RYaGtBdnVHdXdBd3Q3RzVHSjladmZ1TFNsMWZYVkt5dWl3UWd4WVhV?=
 =?utf-8?B?a21EeDBrQ2lGZ2JyZU1aNDhGelVzY2t5SXlnQTM2SnlYeFdYZjhwQXZ3MkE5?=
 =?utf-8?B?VEtjdGlUMUpsRjczTFRpQkoyNC9PMHJzRGhTVDJFL0h0SkNsM3BYL2JBd3FR?=
 =?utf-8?B?aUNoMXRvR0h2Q2x1K21nb2lMMmh0dlJMalV0cHRHbW0zVHBiY1dPKzN0VW8z?=
 =?utf-8?B?Z0lCSXZSRnJPL2FoVDZhL1lsUjlDbldUME1naXVYejNNTEdaRU5GUVVUTk9q?=
 =?utf-8?B?U3BlUXlib3BuUXR3WncrNlFBdXBFdXFRaUVLK21NeDR2MExVcGhISHFKcWZy?=
 =?utf-8?B?aXJ5QjBYZjVMZEZhdDBFRENMakJUSDRRQ3JyNGg0WGttRXZoSkJjZTV3a3NB?=
 =?utf-8?B?a1pmd0dnWkZSMTd1MXdMeW1BWGFtT21ua0RHNGtCM0NtMnJ0aHVMMjU2SG1D?=
 =?utf-8?B?NTd2dmVtdTl0TzVTSDJPRmFzZHJQN3ROMWp4SkltU0lodXpFRldUQXRta09l?=
 =?utf-8?B?Z3lCRVhrWVVWNG1MREI5UDdlWnp2dmFISmhsbjZGemlCVVZlTkUyTVovSDRV?=
 =?utf-8?B?emVyaXNFTXZaTjhKbjRFS3NyaEY0dlZTcFRlalBMZ0xnNXBNVnVyK0pVQ2N3?=
 =?utf-8?B?dFhoRmFkR25uQjRkTC9Ed0V5QXh2dCt5RGdDbzROSFcyZXlubUx0cG9IVzFP?=
 =?utf-8?B?bGp0eVVwUzZIUjdySnBLVjNSQW1Vcy94cEhCMUtNYTJSeXIrTUpvcEdQd05O?=
 =?utf-8?B?QXljRi9DbTVQK2dremgzb3Z5SWp0Q2RsUDhvSTFLSXJscUJnOGJRcmxhUHFn?=
 =?utf-8?B?OWZVdnlqNUJRYWwwSVV1ODNBMmUwWWZLQ01xV0VPamUwNUpCSEdLSFM5TG1l?=
 =?utf-8?Q?QZdzWxlCGNQhErQ9Lgw4yaWhw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A01D0368577DA5428FCA6C0621347C8C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iJadfSCEdxOzCy4z+MeDKJ7n+4ot01dOLw5TczJyVDN1h7uskSga9SmSsZhTvGU0rppv15Ob4b2O58/Zltzpwq1fx0ebUeawoj0EkkRlXgbcv7MEnWjU5E4tsjm5VmYPUkJ7bB4N3IDQlqFtsx/SUYb3Jge/HGVaEgDFIYmYIh2fd12JaWIjhvKqIULiFYw6M6dsTjx9ChKgdvqmGHXGxnTWBSY/olSUeuC5K4B4lTb7+bmzbksidDAgdzApi8z4mnOG6c4a0FJVJrVu8qgsDLT/6kdeU4DTBpVokBic0tdPT/9QLfXJ5H96pAmukHk4JtNLLuEiNhpfOaq3+WZWp+11YxPYcaEKU0I5sceTyGYYWYVJ+8pxvdKcSLY2Y62eUMvat8pjw2APDtrLtW9ivOVuZ2lguo+u/29A8VW1bQk+KViGRih1f75d7RPyi+mocJSK5EVXTT8OeEDFv5mJB2v8AATn6C95EOYMzCgh8trjTf58tRPxQt7CBrUUZ6qMEWC46BqDsbFDjqaq74YxKpWQNjD1sNztm51pjkERDWhtV43DQQNo0HU0klIgadjIXYi3E5TSjsWKcMHSIWaFk3VGBViqxvjiV1JiE2l4X6pNL2n19yJI+vXlswF25xTQhqHIUnxYnum+/dBCz5mwGA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb43a793-d27e-436e-b8ae-08dd94d82106
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2025 00:16:54.4229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ayv2XeC3suWlI0ZEgnlPPOdZ3UtDkHUbQ0tkEAee/a2360cGdqnxGxRdDWgVs2rNOIv+aX5cJN8mz9CAs0cgUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6416
X-Authority-Analysis: v=2.4 cv=GYEXnRXL c=1 sm=1 tr=0 ts=6827d57d cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=qPHU084jO2kA:10 a=QyXUC8HyAAAA:8 a=luRy2Xk15c15UHkthNIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAwMSBTYWx0ZWRfXxHed+ebfIJIl
 qy87LEtAnjCMRGPzqOo2kDix9px4lc9OYzaGAP3wB8zJjfxDYbyM4C42N1ukVHnlPLM3Bxh6YZi
 q7tc33/7Fhsgy+OANQKa8WmNxTGw3Ogdt6m3kdH/NKZDDxUPZUC1Hd8vTorXp2k/MVKkp86z+NE
 gdrTUEmBHVUJnNZAZ7Hw72/rtwkkL2naXgGU5XIDb4cgp0I3zC3uatg9wPldHG+Vm8ZrXFQ859T
 EHwiOveuIito/2VwNJCSoP2Ss76KwEzTB21xfYazh5dvkLUUHOMeGJO/VwsaSixH0kRTb86cz6v
 0lMlVCXMuW+nM3yGT9+ACpjYsf36XNZFCYzCjpCXZzWWL/kKSLwlGeM44XkcjpaveBnCmGVTYb/
 A7wJ7XhSDnn+3DxNhyXoPmYNWRsSBYpkB7/UpZlmqalWjnk8/scp9NmhPU3BRHfSDEXAFWo1
X-Proofpoint-GUID: 1NlSqg8t1ftuONkBO5X1Yjcx9m6EYaSW
X-Proofpoint-ORIG-GUID: 1NlSqg8t1ftuONkBO5X1Yjcx9m6EYaSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_08,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 mlxscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170001

T24gRnJpLCBNYXkgMTYsIDIwMjUsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IE9uIDE2LjUuMjAy
NSAzLjQwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVGh1LCBNYXkgMTUsIDIwMjUsIFRo
aW5oIE5ndXllbiB3cm90ZToNCj4gPiA+IE9uIFRodSwgTWF5IDE1LCAyMDI1LCBNYXRoaWFzIE55
bWFuIHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBBbWFyZGVlcCBSYWkgPGFtYXJkZWVwLnJhaUBpbnRl
bC5jb20+DQo+ID4gPiA+IA0KPiA+ID4gPiBEZXRlY3QgZVVTQjIgZG91YmxlIGlzb2MgYncgY2Fw
YWJsZSBob3N0cyBhbmQgZGV2aWNlcywgYW5kIHNldCB0aGUgcHJvcGVyDQo+ID4gPiA+IHhoY2kg
ZW5kcG9pbnQgY29udGV4dCB2YWx1ZXMgc3VjaCBhcyAnTXVsdCcsICdNYXggQnVyc3QgU2l6ZScs
IGFuZCAnTWF4DQo+ID4gPiA+IEVTSVQgUGF5bG9hZCcgdG8gZW5hYmxlIHRoZSBkb3VibGUgaXNv
Y2hyb25vdXMgYmFuZHdpZHRoIGVuZHBvaW50cy4NCj4gPiA+ID4gDQo+ID4gPiA+IEludGVsIHhI
QyB1c2VzIHRoZSBlbmRwb2ludCBjb250ZXh0ICdNdWx0JyBmaWVsZCBmb3IgZVVTQjIgaXNvYw0K
PiA+ID4gPiBlbmRwb2ludHMgZXZlbiBpZiBob3N0cyBzdXBwb3J0aW5nIExhcmdlIEVTSVQgUGF5
bG9hZCBDYXBhYmlsaXR5IHNob3VsZA0KPiA+ID4gPiBub3JtYWxseSBpZ25vcmUgdGhlIG11bHQg
ZmllbGQuDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbWFyZGVlcCBSYWkgPGFt
YXJkZWVwLnJhaUBpbnRlbC5jb20+DQo+ID4gPiA+IENvLWRldmVsb3BlZC1ieTogS2FubmFwcGFu
IFIgPHIua2FubmFwcGFuQGludGVsLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogS2FubmFw
cGFuIFIgPHIua2FubmFwcGFuQGludGVsLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWF0
aGlhcyBOeW1hbiA8bWF0aGlhcy5ueW1hbkBsaW51eC5pbnRlbC5jb20+DQo+ID4gPiA+IC0tLQ0K
PiA+ID4gPiAgIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1jYXBzLmggfCAgMiArKw0KPiA+ID4gPiAg
IGRyaXZlcnMvdXNiL2hvc3QveGhjaS1tZW0uYyAgfCA2MiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0NCj4gPiA+ID4gICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmluZy5jIHwg
IDYgKystLQ0KPiA+ID4gPiAgIGRyaXZlcnMvdXNiL2hvc3QveGhjaS5jICAgICAgfCAxNyArKysr
KysrKystDQo+ID4gPiA+ICAgZHJpdmVycy91c2IvaG9zdC94aGNpLmggICAgICB8IDE5ICsrKysr
KysrKysrDQo+ID4gPiA+ICAgNSBmaWxlcyBjaGFuZ2VkLCA4OSBpbnNlcnRpb25zKCspLCAxNyBk
ZWxldGlvbnMoLSkNCj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gPHNuaXA+DQo+ID4g
PiANCj4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLmgg
Yi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuaA0KPiA+ID4gPiBpbmRleCA0OTg4N2EzMDNlNDMuLmUw
YzUyMzhjOTMyNyAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLmgN
Cj4gPiA+ID4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLmgNCj4gPiA+ID4gQEAgLTE3MzUs
NiArMTczNSwyMyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgeGhjaV9oYXNfb25lX3Jvb3RodWIoc3Ry
dWN0IHhoY2lfaGNkICp4aGNpKQ0KPiA+ID4gPiAgIAkgICAgICAgKCF4aGNpLT51c2IyX3JodWIu
bnVtX3BvcnRzIHx8ICF4aGNpLT51c2IzX3JodWIubnVtX3BvcnRzKTsNCj4gPiA+ID4gICB9DQo+
ID4gPiA+ICsvKg0KPiA+ID4gPiArICogVVNCIDIuMCBzcGVjaWZpY2F0aW9uLCBjaGFwdGVyIDUu
Ni40IElzb2Nocm9ub3VzIFRyYW5zZmVyIEJ1cyBBY2Nlc3MNCj4gPiA+ID4gKyAqIENvbnN0cmFp
bnQuIEEgaGlnaCBzcGVlZCBlbmRwb2ludCBjYW4gbW92ZSB1cCB0byAzMDcyIGJ5dGVzIHBlciBt
aWNyb2ZyYW1lDQo+ID4gPiA+ICsgKiAob3IgMTkyTWIvcykuDQo+ID4gPiA+ICsgKi8NCj4gPiA+
ID4gKyNkZWZpbmUgTUFYX0lTT0NfWEZFUl9TSVpFX0hTICAzMDcyDQo+ID4gPiA+ICsNCj4gPiA+
ID4gK3N0YXRpYyBpbmxpbmUgYm9vbCB4aGNpX2V1c2IyX2lzX2lzb2NfYndfZG91YmxlKHN0cnVj
dCB1c2JfZGV2aWNlICp1ZGV2LA0KPiA+ID4gPiArCQkJCQkJc3RydWN0IHVzYl9ob3N0X2VuZHBv
aW50ICplcCkNCj4gPiA+ID4gK3sNCj4gPiA+ID4gKwlyZXR1cm4gbGUxNl90b19jcHUodWRldi0+
ZGVzY3JpcHRvci5iY2RVU0IpID09IDB4MjIwICYmDQo+ID4gPiA+ICsJCXVzYl9lbmRwb2ludF94
ZmVyX2lzb2MoJmVwLT5kZXNjKSAmJg0KPiA+ID4gPiArCQlsZTE2X3RvX2NwdShlcC0+ZGVzYy53
TWF4UGFja2V0U2l6ZSkgPT0gMCAmJg0KPiA+ID4gPiArCQlsZTMyX3RvX2NwdShlcC0+ZXVzYjJf
aXNvY19lcF9jb21wLmR3Qnl0ZXNQZXJJbnRlcnZhbCkgPg0KPiA+ID4gPiArCQlNQVhfSVNPQ19Y
RkVSX1NJWkVfSFM7DQo+ID4gPiANCj4gPiA+IFNob3VsZG4ndCB0aGlzIGNoZWNrIGZvciBpc29j
IElOIGRpcmVjdGlvbiBvbmx5Pw0KPiANCj4gUHJvYmFibHkgbm90IG5lZWRlZCBhcyBvbmx5IElz
b2MgSU4gZW5kcG9pbnRzIGNhbiBoYXZlIHRoZSBhZGRpdGlvbmFsIGlzb2MNCj4gZW5kcG9pbnQg
IGNvbXBhbmlvbiBkZXNjcmlwdG9yLiBTbyBvbmx5IHRoZSBJTiBlbmRwb2ludCB3b3VsZCBmdWxm
aWxsIHRoZQ0KPiBkZXNjLndNYXhQYWNrZXRTaXplID09IDAgYW5kIGVwLT5ldXNiMl9pc29jX2Vw
X2NvbXAuZHdCeXRlc1BlckludGVydmFsID4gMzA3Mg0KPiBjaGVjay4NCg0KT2suDQoNCj4gPiA+
IA0KPiA+ID4gRG8gd2UgbmVlZCB0byBjaGVjayBmb3IgY29ubmVjdGVkIHNwZWVkPw0KPiANCj4g
R29vZCBxdWVzdGlvbi4NCj4gDQo+IFRoZSBiY2RVU0IgPT0gMHgyMjAgdGVsbHMgaXQncyBhICJk
aXJlY3RseSBjb25uZWN0ZWQgaW5ib3ggbmF0aXZlIGVVU0IyIGRldmljZSIsDQo+IHNvIGJvdGgg
aG9zdCBhbmQgZGV2aWNlIHNob3VsZCBzdXBwb3J0IGFuZCBlbnVtZXJhdGUgYXQgSGlnaC1zcGVl
ZC4NCg0KRG8gd2UgYWxzbyBuZWVkIHRvIGNoZWNrIGlmIGl0J3MgY29ubmVjdGVkIGRpcmVjdGx5
IHRvIHRoZSByb290aHViIGhlcmUuDQpQcm9iYWJseSB0aGVyZSdzIG5vIHJlYWwgZGV2aWNlIHdp
dGggdGhpcyBiY2RVU0IgdGhhdCdzIG5vdCAiaW5ib3giDQphbmQgY29ubmVjdGVkIGRpcmVjdGx5
IHRvIHRoZSByb290aHViIHRob3VnaC4NCg0KPiANCj4gSWYgdGhlIGRldmljZSBmb3Igc29tZSBy
ZWFzb24gc3VwcG9ydHMgZW51bWVyYXRpbmcgYXMgRnVsbC1zcGVlZCBhZnRlciByZXNldCwNCj4g
dGhlbiBJIGRvdWJ0IGl0IHdvdWxkIHNoYXJlIGNvbmZpZywgaW50ZXJmYWNlIGFuZCBlbmRwb2lu
dCBkZXNjcmlwdG9ycyBpbnRlbmRlZA0KPiBmb3IgSGlnaC1zcGVlZCBhbmQgZVVTQjIgZG91Ymxl
IGlzb2MgYncuDQoNCkdvb2QgcG9pbnQsIHRoZSBkZXZpY2Ugc2hvdWxkIGJlIGFibGUgdG8gZGV0
ZWN0IGFuZCBwcm92aWRlIHByb3Blcg0KY29uZmlnIHNob3VsZCB0aGVyZSBiZSBzcGVlZCBjaGFu
Z2UuDQoNCj4gDQo+IEJ1dCBJJ20gbm90IDEwMCUgc3VyZSBhYm91dCB0aGlzLCBuZWVkIHRvIGRv
dWJsZSBjaGVjayBpdC4NCj4gDQo+ID4gPiANCj4gPiA+IEFsc28sIHdoeSBhcmUgd2UgY2hlY2tp
bmcgZXVzYjJfaXNvY19lcF9jb21wLmR3Qnl0ZXNQZXJJbnRlcnZhbCA+DQo+ID4gPiBNQVhfSVNP
Q19YRkVSX1NJWkVfSFMgdG8gZGV0ZXJtaW5lIGlmIGl0J3MgZG91YmxlIGlzb2M/DQo+ID4gPiAN
Cj4gPiA+IEluIHhoY2lfZ2V0X21heF9lc2l0X3BheWxvYWQsIHlvdSB1c2UgdGhpcyBjaGVjayB0
byBkZXRlcm1pbmUgd2hldGhlciB0bw0KPiA+ID4gdXNlIGR3Qnl0ZXNQZXJJbnRlcnZhbDoNCj4g
PiA+IA0KPiA+ID4gCS8qIEhpZ2ggc3BlZWQgZXVzYjIgZG91YmxlIGlzb2MgYncgd2l0aCBvdmVy
IDMwNzIgYnl0ZXMgcGVyIGVzaXQgKi8NCj4gPiA+IAlpZiAoeGhjaV9ldXNiMl9pc19pc29jX2J3
X2RvdWJsZSh1ZGV2LCBlcCkpDQo+ID4gPiAJCXJldHVybiBsZTMyX3RvX2NwdShlcC0+ZXVzYjJf
aXNvY19lcF9jb21wLmR3Qnl0ZXNQZXJJbnRlcnZhbCk7DQo+ID4gPiANCj4gPiA+IFNob3VsZG4n
dCB3ZSBqdXN0IHVzZSB0aGUgZHdCeXRlc1BlckludGVydmFsIGlmIGl0IGlzIHZhbGlkPyBPdGhl
cndpc2UNCj4gPiA+IHRoZXJlIGNhbiBiZSBhIGNhc2Ugd2hlcmUgZHdCeXRlc1BlckludGVydmFs
IGlzIHNldCBiZWxvdyB0aGUNCj4gPiA+IE1BWF9JU09DX1hGRVJfU0laRV9IUyBhbmQgYnJlYWsg
dGhpcyBjaGVjay4NCj4gPiA+IA0KPiA+IA0KPiA+IEFjdHVhbGx5IHNwZWMgaW5kaWNhdGVzIHRo
ZSBkd0J5dGVzUGVySW50ZXJ2YWwgdmFsdWUgbXVzdCBiZSBiZXR3ZWVuDQo+ID4gMzA3MyBhbmQg
NjE0NCBmb3IgZXVzYjIgZG91YmxlIGlzb2MuIEZvciBlVVNCMnYyLCB0aGlzIHZhbHVlIGNhbiBi
ZQ0KPiA+IGxlc3MuDQo+IA0KPiBUaGlzIHBhdGNoIG9ubHkgYWRkcyBzdXBwb3J0IGZvciBkb3Vi
bGUgaXNvYyBiYW5kd2lkdGggZXVzYjIgZGV2aWNlcywNCj4gaS5lLiB3aXRoIEJ5dGVzUGVySW50
ZXJ2YWwgMzA3My02MTQ0LiBlVVNCMlYyIHdpdGggYmNkVVNCIDB4MjMwIGFyZSBub3QNCj4geWV0
IHN1cHBvcnRlZA0KPiANCg0KVGhhbmtzLA0KVGhpbmg=

