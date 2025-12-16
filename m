Return-Path: <linux-usb+bounces-31517-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F92BCC5730
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 00:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6887F303E647
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 23:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD69232C93E;
	Tue, 16 Dec 2025 23:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SztoBAVN";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hHIsHWTA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PR6GMyM8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4167D22CBC6;
	Tue, 16 Dec 2025 23:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765926976; cv=fail; b=ki5heO2JXyFXR1TzlgTtWzznB5LPPP0/rD50EHf1s2bYjsI/PvEOdBi6zYIjCATupmMoLxNz/jQ5bq8jcMcRclWVlc/8YcKGgCIkPTQs1YtJtUrwGGB3AHYBfNWNFSU+4Q62IZC7PWauXs7iQsBCdjQJJaN3v3tQKVw5mpmurT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765926976; c=relaxed/simple;
	bh=FER6urPXf4kIGqhm6mK5mhPSQYIA97eGXQJLRoeRzOc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W7q0LroUMob1RK65CFBEgtGn7zWAYEx1XlnL/P1/I+j32P2g30Cw9f5rs43tDpsijQ6LoMibyeIllf9TYoCt36SnQRaEmEdTOpJb91PZEsL+iYJDaqlfT/LbtpvtO8tm4Qs6erpaXqJZ2XtxEIb+HGg8aiU1ZfoaZ36WPWl8dKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SztoBAVN; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hHIsHWTA; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=PR6GMyM8 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGLj2Li2513062;
	Tue, 16 Dec 2025 15:15:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=FER6urPXf4kIGqhm6mK5mhPSQYIA97eGXQJLRoeRzOc=; b=
	SztoBAVNVpKaCm4lzCjzopgf+/KBQ9cKQWLDDWlNG9oVqzKnxMAK7S6YjrrD3gP3
	ElXKug/PpnQmRMVLKUK26+2LZo9mdVQFQm1xTYxXuT7k/QY6IRYBFB/vU/sRiGsR
	znHGR9vLrVnp6CwTMmNKoi0dA4/mIq2hdXI+nOOMzEjSSweWcnhSiBRgyGZYcJ4Q
	LDeS7V3GD30+9Xa2UKHDCiqZbMge3cseq7phtOM7gLs7e6SlnPX+Wt8CTvJfrLYT
	24hfLJPbCys6SRikB7Xm1+HvGKRgLlVVKrANVT6CXOfoYOUN9BBdCizfUjhIuLix
	JKBIBRji0IDXc7uHYAYlcw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4b2v0h5ev8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1765926942; bh=FER6urPXf4kIGqhm6mK5mhPSQYIA97eGXQJLRoeRzOc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=hHIsHWTAE3D47CFCzUn4KDXgVcF730LwgmJIb7bg0D0faJp5jAwyif8fR0ZhiA/2g
	 6Xb90D5hLaFqhqoIGjD2fpRBZ18CIYS7tPgyj8HF+ffghSfaRiRZ3dMQac1SKAxfw5
	 N/9EnGD+hoFmWCPWxT1DL/aBsLafgk3AT89niEfMcB2CYHnTEZpbW6Z1i8IRDJAAEU
	 26DJeRBrZH+UJE+NygIC7VmS7029YZo7HpFYpxZsG0j/eciJ6afn5GvvOWmO4YWnCv
	 lFRATpNHDsob+2tIlHeVjrxRILJw9ZWLeolkuYkP7MgIshTiFC8kmEZs8ac0/tnxX6
	 YCQtRu1pd7c1Q==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 90D4E400FE;
	Tue, 16 Dec 2025 23:15:42 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E5585A0070;
	Tue, 16 Dec 2025 23:15:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=PR6GMyM8;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00104.outbound.protection.outlook.com [40.93.20.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2F5C64045F;
	Tue, 16 Dec 2025 23:15:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmQam63oyxGTmFqvLXRlbuzSqpMvpOls7jUmE2ReDl0ImAcVKpXqFapfmpXXxKNIJZl8taVyrgc1F6je+vu5aS8hpxMBoLJCSelLfAN1az3i/iGl/RvWZpma71GZzGknnfHWHwkOuJurNug/7714s8wmw4kvt7/P7PgvebgGu+KDPDYxeJFqjSL2PEPhtW+Ye3eO+PdAcqZL4RcAlqGTcduQoHsHZBlx5s6ThGRazcGNYPMWOfB8/E2A7IsFgE8wPnOExFcxAt2wrB0Mse+k44kj/wL9LWIHRMAn1hq9Tqcmy0JCeW6AaTX5nFF9smOozycxC0HzA3oFxpvnY+ivwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FER6urPXf4kIGqhm6mK5mhPSQYIA97eGXQJLRoeRzOc=;
 b=mWDHDRlBth9FC8zBsEkRbq4uweTzIpcSn5zUp/GWnVewQd5WOiOvR34ne0lppyJ52M1Tgmf994ZgOgixSyrAHKVJRK/Ov1mAhVJrf+78babK/GpY0CJzG4FNr5Jnow0hEeOUOy2XAgcob9kCDYcz4OcRd6YfPRziYe8Gb2/MoN8S0U5VhBk24IjIJnOCubonOAxWHP0cCFVguDdo1W6TSnHPlx9n/OXN2ZyWx1OfzV3KPh9W7PiUgRGWcsraEi5zgU170BY0cKoG8ua4u+Cf7QGcf+TzOZMtZw7o3UhwkFue3LGrRLHelHiprY5EweytaHVKZSBpTT5TSSI30uXCAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FER6urPXf4kIGqhm6mK5mhPSQYIA97eGXQJLRoeRzOc=;
 b=PR6GMyM8vaI5eaJ45FgblSo3CNLw3qQKAjxXqD/wAx5yUt48RQAbV+T1P0mLXJRW3Bfb+VTSfVwirXK+8jtOULsJblgtdrxifXT5DScfPD0QJjiXGwZfsUensZat0B35qLprIn1nsJekgaCFyZB/18/nGjmf7DDgmXHGWyMqPrk=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA0PR12MB4383.namprd12.prod.outlook.com (2603:10b6:806:94::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 23:15:37 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 23:15:37 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Rob Herring <robh@kernel.org>
CC: "adrianhoyin.ng@altera.com" <adrianhoyin.ng@altera.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "dinguyen@kernel.org" <dinguyen@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] usb: dwc3: Add support for Agilex5 in
 dwc3-generic-platform driver
Thread-Topic: [PATCH v2 4/4] usb: dwc3: Add support for Agilex5 in
 dwc3-generic-platform driver
Thread-Index: AQHcaNT97HLtnQnyBkKiSjfIohQbc7UZ5XOAgAsMpoA=
Date: Tue, 16 Dec 2025 23:15:37 +0000
Message-ID: <20251216231535.dfalfr2rngeyd72g@synopsys.com>
References: <cover.1765249127.git.adrianhoyin.ng@altera.com>
 <a9db62422d39ac51cb26b73c5537ca2f8130f7a3.1765249127.git.adrianhoyin.ng@altera.com>
 <20251209223127.GA1242261-robh@kernel.org>
In-Reply-To: <20251209223127.GA1242261-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA0PR12MB4383:EE_
x-ms-office365-filtering-correlation-id: 26359aeb-2f2d-4174-81d8-08de3cf90609
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?d0RCVFM3Z2E2QmZiQm01MndacHdxQWZMRzUzTjNDZ0NPNWZWSWhVQzNBcndw?=
 =?utf-8?B?eUdpTUMrQVR2MFN0eXhkNnp5TVFIenVGMk16U2JYb0RhNnNJWUw2Q3lKTmxt?=
 =?utf-8?B?MzNrKzVMUUl3VmhOOW85VXdPZkRObm5ZR2cxSWdsVlExaVMxVE8xekh5MFg1?=
 =?utf-8?B?Zjk1b3d2ajR2R3ZncWliQW9jdnR3dm1OU2xLMVExZ2hPVjJEaHhKSHNhUmZ4?=
 =?utf-8?B?eTQyOXZQZHRlNnV6UVJZV1MzNFNKNmh0d29qU0R5UW8ySUJraE83VmFISzY5?=
 =?utf-8?B?cW10cFN6MFZSaGJwMStRQVVBcWUxdFpTSFdIZmpYQVNLUkdkWVVyVzFsWTVj?=
 =?utf-8?B?ZlR3UkFrQ2tpeWIxMlRLMXllZVlheEhtV0xEZXMxTHdmaFdldW9aS2xNTDdE?=
 =?utf-8?B?SnpWZ0picTA0N1ZOUTNpSTFTczcwRkhJb1NQWm8yYVZCZE1RditteEkwaENp?=
 =?utf-8?B?VFVQR2VLNnNVdnd4YzlDTjlEcGRqQVRtNzl1TUZxTEc3TWhSLzk2VDB4aFNH?=
 =?utf-8?B?b3F6dTBVcWx6dm9udnhveXVZN2V0RTNDaDIxTy9iaVd4Z24xb0wzREJOemlj?=
 =?utf-8?B?Z0lTK3A1Z1dHS2RPMGxFWHk1Q3JsWTlxNFU4ek95cFhPOWhKMnF3Mlhpdlp6?=
 =?utf-8?B?RzI5bS8vSU1QTGdJQnhWRTBINjRYdVVvZHN0dGJoRi9ncGsrNUgzaDl1R3NW?=
 =?utf-8?B?c2VOZFd5bUZhTTJ6cWxtQnZSVjY0SW9SZENTeHhtOXRLUWNwN1UyZ29xZTJ1?=
 =?utf-8?B?UzZKeS9iSUxGNnRtT2l3aEM2OHRYcEdDWmdHQ09RR2I5ZlBOUVpHdTgvQ0ZH?=
 =?utf-8?B?c2FsaWV4TVlvbFdXVGplUHhIWkh2QTZUNGh2L0pUVTgxL2Z2MnZPTFFwdWI4?=
 =?utf-8?B?OWdZdENqWmEvZGFZOVhaY2tnUGVleXZnSEJpVWlzd3JWM0xZTE05Rjk4N040?=
 =?utf-8?B?L2tFSkZVUWlLYXJRVDdpeXJQOVArOC92a0MvTkxuc2JvSG1YaVBCeEh4WjNO?=
 =?utf-8?B?a0lwaXgvZDVSdVdKdXZjNHp5MVhza3R3eVRBSzNKam5FSFZ4MmYxc3ZYWHYz?=
 =?utf-8?B?bjUzOGxhM1pOdk1QY05ON3hLa2E4dFMvemZINmZoZzNIUFZRSUNaSnczaEM5?=
 =?utf-8?B?c1gyTHQwUmR3c0t5WmcySm54RVg2L3AxZVljKzlhY09FbWFrSjhnUkRKcmFO?=
 =?utf-8?B?UExVa2ZjK09UOWZ1bGFqSFJxdFNYMDI1VTBPdU9ZN2ZnSStpRS8waXlldklP?=
 =?utf-8?B?S3pNOGExaHJNMkJwdXZiY0NYNVFIdHZiUGttdER1RkpVaC9UZFJUeEhVUDVB?=
 =?utf-8?B?dWxoKyt6bkZzMUl6UUpHdEJEYnp2SXlPdWZkVyt0ZllPUHlENElnWWY0cE5I?=
 =?utf-8?B?N0cwTUFsL1FEcG5oc09pcDNrL0lJRHFvRTNZVGNBQWNiU0MzUUEwc0FSaEph?=
 =?utf-8?B?V0NONGoxTzdqMjRjWG50VEx4VEhZQ3NoZ1RmZzhYWk5IaktDYzAyRXJtSytk?=
 =?utf-8?B?emNSSjRsRkh0THppQnRnRWJIcE0vN1BraFU3L1JFUEE0SGQzZisrdm9WalVn?=
 =?utf-8?B?aTJxN3BNUS8xRHY1ZlI2ZHExQTBvV2xhRE0vZU9jWXRCSENjVExuQkl4QytN?=
 =?utf-8?B?cW9iYUZXMmZyZW1URW8yOWNnTndPS1VyNDlkSmRORVJjRGh0SHcxVG1mV1BB?=
 =?utf-8?B?SDNEZENWZEdvWHpOcTVuWVZvVDVXTU91WjlRUm5lR1k5VWlFTVBTT1FRMzV6?=
 =?utf-8?B?aVJUVUNhRXBwYXFqQ3pCdVU0RTFOMmgxcUR4MzFNSVV4V1l4SUtra3BXYndL?=
 =?utf-8?B?ZFlpWGJwRkUrbnJJZTV2a0JGZmVteWxsb0dOdWJwQjV2TSs3RG1McHB1Y3hX?=
 =?utf-8?B?SFQyVzh1UDNQUHFVU3lkaFZGemhqMEpVTHI4U0dIRHkzVnJjOEE2eTl1TzJi?=
 =?utf-8?B?WURYdFZ3YmhHNHZGZThVNUxTdzdEblFmeTJpQi8wdjI5QXlSb3pTanNjQVUr?=
 =?utf-8?B?aHpyT0tuSldJT2NVc3kvRldXdVpVSUNsSkNQNGloMlBCQ0tzVnIvbXhOaXNl?=
 =?utf-8?Q?mHvsza?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NXZKOTkxWG1tRlhKdHBjdlgwVWFHNks4aHdOdmEvclNJOGVoUENmZi94U0Uv?=
 =?utf-8?B?dkdvZGlDa2dKOGoyS3B0ajhXVVpSa296TVRlTG5RVkpGbnV3UDArNjhDM21S?=
 =?utf-8?B?cGNwSU5LSzUwQTVWR0ZHeG4xR3ZzUTg2cjNNbWY3bWpBWjhYV0h6REdhVEcw?=
 =?utf-8?B?ZkYxYkhlVnV5aUQ3cmVVUEhxOXRXbDRiNk5PZWk4M0JYdXpoMnR4V0NmZ1dQ?=
 =?utf-8?B?NTU2VzgyTHNUQkd1NjZKd0lWcmVOZVZRZE92TW00a3JIL1lhL21MSkMyRUZr?=
 =?utf-8?B?cHBHVDV0aEJqWTlyTUJuQUpmL0UxS0o0eU1DSW5vLytla1ZuSUNkdFJLQk9Q?=
 =?utf-8?B?MCtsRlF5TUo0S2VJRy9zNWZkTDd4SHRDT21maUc1NmxnNWJxKzA4a2dKZ0xs?=
 =?utf-8?B?UjlxbHFRMThuWVF2b0hsUXZvektuL3ZzR2dqSzlwZkhjc0Nyc1RBZDM5QWRQ?=
 =?utf-8?B?VjBybTRlTVJkeG1UY1ptQ0p0ZjA0T3RxOUhYaFpHWmE5T3ZobUxtYlJuL1Fh?=
 =?utf-8?B?Mm9nZFF4Ujlzd1hKZEhieXlycEpRM1RmWjV2ZEVQWWVqSGJiWEtyc1ZBNUJz?=
 =?utf-8?B?a0NWamc5amgwRmRyQ2dxSzNOOVJob3BjVGhYZWRuanJoc1grZFV4a0F5ck1S?=
 =?utf-8?B?SDRrYnBvZW4yQjVacDhyT2Jpa2s0c2ZJM0lRY2FiNGJQVk44MkkwaXd3K0NW?=
 =?utf-8?B?ZERkZXpkUDVoSmJoMlM1cmtneWhRejJMWVFNRlhEckVOSnpGTS9mblJYUmxE?=
 =?utf-8?B?UXVXTWZnSk92STlENm5iVmRUakdod1pNaHJwSHY4SXVsanZkTnRzcjZpczRZ?=
 =?utf-8?B?aFBrTm4zdm5jbERSTWtmVkRlZVM0WmdUMHlDdGQ2eUpRV1BucWoyaytvSm1E?=
 =?utf-8?B?a3E4b1phTWpuQ2tnODdTUE9XaUxJY0JCTTAyaGFkZlE3S1U0aWNnUHdJcDFq?=
 =?utf-8?B?SmV4YkV6WUhSVzJNbUMrOCtKbEFKWEVwY3daMnJIR3I4aFVhbTN5aEJ4eEZV?=
 =?utf-8?B?UURva0k4dkxzS3pRYUtac2ZwMzlCUkIzOVF6QTkxcmU3dDJaa0w2Uys3Njdh?=
 =?utf-8?B?eSsvWkRlT0hZL1RnNHVreHAvQ2xZOURsVG5LUWlWRWxia1R6SDlaTFE2cEFT?=
 =?utf-8?B?ZWptMXNZblROeFRiOExNZVh1N1dQUmgzYkdRQ3FiR25yMllzOVNCU1RRazR0?=
 =?utf-8?B?RDRzV05lMmpQU2RTWnI3cXZaSGhFRituYUJyTzU0VkZ1VVlYblg0MnlzSnk4?=
 =?utf-8?B?bFNZT0V6RXYyeU4wbEFxWDZSRzNhYWRaR3IrbHVBYnBEQ29DQWoyVDRqcTRK?=
 =?utf-8?B?dHFJVjFLOTJaNTFSR2p1SGJtcmE0L1lMR3VhNWNUQnE3S3drdlhTOFNacnU4?=
 =?utf-8?B?eW9GYms5elcxMkR2NEhGNU9ITlhBNE9KczM1eEQwS0hqYTRkMjY1WlY1YmhE?=
 =?utf-8?B?eHZDUUZMQ3FTaXZyQjQ2OTQyM3NHdWZVNTBpQWI0Uk5RR0F0T2NZck1aRU54?=
 =?utf-8?B?N1cyY0xoVXg3MU93b0FDWEJWNDRVejh6eHZLa3k0cFNnL2h5UDBVU2hHY1ZE?=
 =?utf-8?B?L3FPUUVpOHR3L1JENTVtYmFiMWoyaFowQWpkSlBOZ0l5TW5DVmYwMG9oOEZw?=
 =?utf-8?B?NURxMlRNZmRrRzBFS0t0VTJ3RWJvYUJTbm53WFh5bW1uOTI0Um1OSWtDTjNV?=
 =?utf-8?B?UUhoVVI4RFdVbVZyRkNrbTdsdXkrMDNOck9PQWVzVzNrZnN0dURSZ3ZhQkQ3?=
 =?utf-8?B?QXRZdDErQ3phaGc5VGo3Z282MHNkdzVpWTVyMWZlejNHUDdldTVUdmVUd3lz?=
 =?utf-8?B?YkovdXZLc2VvL0VLbjJUMUx3cENxWVBVOTdnMG5aeTlUa3paUGZnczlkMnVR?=
 =?utf-8?B?dmpJOEMzRVdENGVYZEE2d1ZncDJ6RGxoanR3dVdpR1l3ZXBLQUVaZjFrQUd0?=
 =?utf-8?B?QlRhQlZzVy8rVzlYZmMwYnZGbysyRmt5ZVFDU1FOU3VnWHpRNFhlRFlQcDl5?=
 =?utf-8?B?aThoN2RPajVWUlFqVCtDMjFrSC9qZ1c4NkV1TkdiRFRUUnpBZHh3aFB0TEVZ?=
 =?utf-8?B?SGZwaFQ3MkFtaEFNUnVaTVhFbHI2MmZLM0pJSEZ3dEIrcWZIY09PV0xlSlYy?=
 =?utf-8?B?S0hVcERva1RacVRyOWExeUlhQjhTanlwR1V4NzFFRHpxRHA1TU9QYUdCK1Vv?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <860DA102AC96F643B99846A226429F22@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DKoAzd3N3EnYRp8qDC9RKkB+LtKblzUvk0V8GPiTn5LjygNQOWX2yfeK4pvaUOYUGsgzWlf2BeUtTyu+NfQrNdPXbm0wUigFkbBRcFjYDvsrIT2EXu57WOhqjZhIAa0i7DNbCuLR30L8TegYwIrCL7du31v0SrHeDB5T0L2dlzhON2vd9Kt/QXUWRMX519jP9Q/J0xsmqXbP+FhRNVEDx5MKUzLW/z4i00CL3DO2PLpeg9jDPhri4kxCtv6T6YMpI8+estIzwBNN5w96TzG0bLv4sARPiuApNZWgsktcWRUvli432jFeOpPByLBNqj9yMt36iaEXs6XP+O5KthR0YmtjGzp1BWhAPPeovKeZ/WsMfFo6BDnfdqTuZr1YJlYQvWnuA0XMt0ArGWf46UejFNJYqzPMrRkwnw0F9PXZn7bJNkppZ1CByclq7O1KKu91Iv59FsK2xFTt22z7kH/ltKu06fjOi6ALQQddGU5d1LtxdrhlUYNcmj8MvizOzO36o2o/ijwoKqDkWZ9fFRPdsHwFOO9FU4fJV3YBE1NfymTnXBC/ID1JfXQkj5lHwgOHMniTl8/sE1hW2lfRENq0YN1/8SvNi65+FsDJUne5nAoTo0hxN1LItK/4fr4DQdREDSdCpQmjjLgXsiH9lTPARQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26359aeb-2f2d-4174-81d8-08de3cf90609
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 23:15:37.8673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W3z1/5uFCfudIX6PhqAMz96w1dt0aZ4jl1n5wakZq0DygGJd8fbQzZcfeNFUWCaQ9FcUMGDawwPGW0O9ae1arg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4383
X-Authority-Analysis: v=2.4 cv=bp5BxUai c=1 sm=1 tr=0 ts=6941e81f cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=h4SL0BZ7AAAA:8 a=yBYpec10AAAA:8
 a=pbO8JsgUS39SeSOh4PkA:9 a=QEXdDO2ut3YA:10 a=Cfupvnr7wbb3QRzVG_cV:22
 a=zbxmTX4fiVD2UiCe4Dha:22
X-Proofpoint-GUID: opUVC3n8_UzcPw7u_jHwvXX_9fP4DryY
X-Proofpoint-ORIG-GUID: opUVC3n8_UzcPw7u_jHwvXX_9fP4DryY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE5NyBTYWx0ZWRfX59EJj2gnY/ge
 A7flmP3UyMuBTCngi1JE+0JZpuoLidpoZWNmAA9nFKJ0R4SWdsExPEBotVcD6hW/g1Cy44dIZei
 UKNrT1aPxKLBEEFmiWctJo+9xxq7MdcqNuz2n8VCVS3qXeiHs/IvbQI2OH+qajrY2GXgxHw/wDZ
 uPIBktnHKimkcbLx4J+0VYDNUI503rpEMW/fuB052yAWNi6uJzfPcWg09j6HpaglJ/wcYzMMwck
 Pzs4FbflhvnT/0Fhh3V17MnmRGIAk5JG3nxLpFmDv9tDEmpy/KAuYwao62bcg+g1sHEUKDz9O39
 C6UkyIjaoX0Gjrt5cwoU9GYxePciFFnhzU4JbCqx/tBH3xKRD+yUgPoEAQw07KW+2S1oICgEgnY
 4wyEtqCrS7UPnPWFN0M0sK2/rasl7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512160197

T24gVHVlLCBEZWMgMDksIDIwMjUsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiBPbiBUdWUsIERlYyAw
OSwgMjAyNSBhdCAwMjoyNToxMVBNICswODAwLCBhZHJpYW5ob3lpbi5uZ0BhbHRlcmEuY29tIHdy
b3RlOg0KPiA+IEZyb206IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlhbmhveWluLm5nQGFsdGVyYS5j
b20+DQo+ID4gDQo+ID4gQWRkcyBzdXBwb3J0IGZvciBBZ2lsZXg1IGluIHRoZSBkd2MzLWdlbmVy
aWMtcGxhdGZvcm0gZHJpdmVyLiBFeHRlbmRzDQo+ID4gZ2VuZXJpYyBkcml2ZXIgdG8gc3VwcG9y
dCBjb25maWd1cmFibGUgZHJpdmVyIGRhdGEgdG8gZW5hYmxlIGR3YzMgY29yZQ0KPiA+IHByb3Bl
cnR5IGNvbmZpZ3VyYXRpb24gZnJvbSBnbHVlIGRyaXZlci4NCj4gPiANCj4gPiBBZ2lsZXg1IERX
QzMgd3JhcHBlciBoYXMgYSA0MC1iaXQgRE1BIGFkZHJlc3MgYnVzIGxpbWl0YXRpb24uIFdoZW4g
U01NVQ0KPiA+IGlzIGVuYWJsZWQsIHVzaW5nIHRoZSBkZWZhdWx0IDY0LWJpdCBETUEgbWFzayBj
YW4gY2F1c2UgRE1BIGFkZHJlc3NlcyB0bw0KPiA+IGJlIHRydW5jYXRlZCwgbGVhZGluZyB0byB0
cmFuc2xhdGlvbiBmYXVsdHMuDQo+ID4gDQo+ID4gVGhpcyBwYXRjaCBhZGRzIGEgYGRtYV9hZGRy
ZXNzYWJsZV9iaXRzYCBmaWVsZCBpbiBzdHJ1Y3QgZHdjMywgYWxsb3dpbmcNCj4gPiB0aGUgZ2x1
ZSBkcml2ZXIgdG8gc2V0IGEgNDAtYml0IERNQSBtYXNrIGR1cmluZyBwcm9iZS4NCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gTmcgSG8gWWluIDxhZHJpYW5ob3lpbi5uZ0BhbHRlcmEu
Y29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyAgICAgICAgICAgICAg
fCAgNiArKysrKy0NCj4gPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggICAgICAgICAgICAgIHwg
IDUgKysrKysNCj4gPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jIHwgMjAg
KysrKysrKysrKysrKysrKysrKy0NCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9k
d2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ID4gaW5kZXggYWUxNDBjMzU2
Mjk1Li4xZmNhNTU2Mzc4NDQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3Jl
LmMNCj4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+IEBAIC0yMjQzLDcgKzIy
NDMsMTEgQEAgaW50IGR3YzNfY29yZV9wcm9iZShjb25zdCBzdHJ1Y3QgZHdjM19wcm9iZV9kYXRh
ICpkYXRhKQ0KPiA+ICANCj4gPiAgCWlmICghZHdjLT5zeXNkZXZfaXNfcGFyZW50ICYmDQo+ID4g
IAkgICAgRFdDM19HSFdQQVJBTVMwX0FXSURUSChkd2MtPmh3cGFyYW1zLmh3cGFyYW1zMCkgPT0g
NjQpIHsNCj4gPiAtCQlyZXQgPSBkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KGR3Yy0+c3lzZGV2
LCBETUFfQklUX01BU0soNjQpKTsNCj4gPiArCQlpZiAoIWR3Yy0+ZG1hX2FkZHJlc3NhYmxlX2Jp
dHMpDQo+ID4gKwkJCWR3Yy0+ZG1hX2FkZHJlc3NhYmxlX2JpdHMgPSA2NDsNCj4gPiArDQo+ID4g
KwkJcmV0ID0gZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudChkd2MtPnN5c2RldiwNCj4gPiArCQkJ
CQkJRE1BX0JJVF9NQVNLKGR3Yy0+ZG1hX2FkZHJlc3NhYmxlX2JpdHMpKTsNCj4gPiAgCQlpZiAo
cmV0KQ0KPiA+ICAJCQlnb3RvIGVycl9kaXNhYmxlX2Nsa3M7DQo+ID4gIAl9DQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgN
Cj4gPiBpbmRleCBhNWZjOTJjNGZmYTMuLmEwOTgwMGZlNjU3NyAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5o
DQo+ID4gQEAgLTExODAsNiArMTE4MCwxMCBAQCBzdHJ1Y3QgZHdjM19nbHVlX29wcyB7DQo+ID4g
ICAqIEB3YWtldXBfcGVuZGluZ19mdW5jczogSW5kaWNhdGVzIHdoZXRoZXIgYW55IGludGVyZmFj
ZSBoYXMgcmVxdWVzdGVkIGZvcg0KPiA+ICAgKgkJCSBmdW5jdGlvbiB3YWtldXAgaW4gYml0bWFw
IGZvcm1hdCB3aGVyZSBiaXQgcG9zaXRpb24NCj4gPiAgICoJCQkgcmVwcmVzZW50cyBpbnRlcmZh
Y2VfaWQuDQo+ID4gKyAqIEBkbWFfYWRkcmVzc2FibGVfYml0czogVGhlIG51bWJlciBvZiBhZGRy
ZXNzIGJpdHMgdGhlIGRldmljZSBjYW4gZHJpdmUgb24NCj4gPiArICoJCQl0aGUgRE1BIGJ1cy4g
VGhlIGRyaXZlciB1c2VzIHRoaXMgdmFsdWUgdG8gcHJvZ3JhbSBETUEgbWFza3MgYW5kDQo+ID4g
KyAqCQkJZW5zdXJlIERNQSBidWZmZXJzIGFyZSBhbGxvY2F0ZWQgd2l0aGluIHRoZSBkZXZpY2Xi
gJlzIHJlYWNoYWJsZQ0KPiA+ICsgKgkJCWFkZHJlc3Mgc3BhY2UuDQo+ID4gICAqLw0KPiA+ICBz
dHJ1Y3QgZHdjMyB7DQo+ID4gIAlzdHJ1Y3Qgd29ya19zdHJ1Y3QJZHJkX3dvcms7DQo+ID4gQEAg
LTE0MTQsNiArMTQxOCw3IEBAIHN0cnVjdCBkd2MzIHsNCj4gPiAgCXN0cnVjdCBkZW50cnkJCSpk
ZWJ1Z19yb290Ow0KPiA+ICAJdTMyCQkJZ3NidXNjZmcwX3JlcWluZm87DQo+ID4gIAl1MzIJCQl3
YWtldXBfcGVuZGluZ19mdW5jczsNCj4gPiArCXUzMgkJCWRtYV9hZGRyZXNzYWJsZV9iaXRzOw0K
PiA+ICB9Ow0KPiA+ICANCj4gPiAgI2RlZmluZSBJTkNSWF9CVVJTVF9NT0RFIDANCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jIGIvZHJpdmVycy91
c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jDQo+ID4gaW5kZXggZDk2YjIwNTcwMDAyLi5lOTY1
MGRmNmNmODEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMt
cGxhdC5jDQo+ID4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jDQo+
ID4gQEAgLTIwLDYgKzIwLDExIEBAIHN0cnVjdCBkd2MzX2dlbmVyaWMgew0KPiA+ICAJc3RydWN0
IHJlc2V0X2NvbnRyb2wJKnJlc2V0czsNCj4gPiAgfTsNCj4gPiAgDQo+ID4gK3N0cnVjdCBkd2Mz
X2dlbmVyaWNfY29uZmlnIHsNCj4gPiArCXUzMiBmbGFnczsNCj4gPiArfTsNCj4gPiArDQo+ID4g
KyNkZWZpbmUgRFdDM19IQVNfNDBCSVRfRE1BX1FVSVJLIEJJVCgwKQ0KPiANCj4gUXVpcmsgZmxh
Z3MgYXJlIGdvb2QsIGJ1dCBpZiB3ZSBoYXZlIDEwIGRpZmZlcmVudCBhZGRyZXNzIHNpemVzIHRo
YXQncyANCj4gMTAgZmxhZ3MuIEp1c3QgbWFrZSBhIGRtYV9hZGRyZXNzYWJsZV9iaXRzIGZpZWxk
IGhlcmUgdG9vLCBhbmQgdGhlbiBpdCANCj4gaXMganVzdCBhIHN0cmFpZ2h0IGFzc2lnbm1lbnQu
DQo+IA0KDQpSaWdodCwgZG9uJ3QgY3JlYXRlIG5ldyBxdWlyayBmbGFnIGZvciB0aGlzLiBQYXNz
IGFzIGEgZHdjMyBwcm9wZXJ0eSB0bw0KdGhlIGNvcmUuDQoNClNlZSBob3cgdGhhdCBpcyBkb25l
IGhlcmU6DQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvMjAyNTExMTIwNTUzNDYu
MTY1NS0xLWNhb2hhbmdAZXN3aW5jb21wdXRpbmcuY29tLw0KDQpIb3dldmVyLCBJIGRvbid0IHRo
aW5rIHRoZSBhYm92ZSBpcyBhcHBsaWVkIHRvIG1haW5saW5lIHlldC4NCg0KQlIsDQpUaGluaA==

