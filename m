Return-Path: <linux-usb+bounces-31936-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 652C7CF4DEB
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 18:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 15A5C300B029
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 17:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368CE26ED5D;
	Mon,  5 Jan 2026 17:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="n5i0QeXB";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WJzaiPFQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pffDeO+4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E5386348;
	Mon,  5 Jan 2026 17:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767632486; cv=fail; b=vDdFMkvwU2FNE7qiF8Cs/1CJWLCx0vN9l2nDAxdbVJRYvEvwrQDb8P6Y14Hj+2cBphrRKbC0ia5CYTSvgmjWbtEr6Grkz6GT4K5/NDTzqkNX0lNOrymjL4KI/fIf0H+Vh8ItmL0L+9gqsjFnrowzLEFBy1mYsga8X0zefF384xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767632486; c=relaxed/simple;
	bh=L0wep4RoYQGP36uUr99ekKh8iAGMRfxI9Qo2UQwkBMw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FohN5sEJoPwbZHsIiDIziVNxmd+VMPJ1vfguIYdwbHehXE2Flp8mfrLCfv25cIWvufTVHnuO7p9Iub2HsROgXYY1PXBpqLOo6AoD1tptDeKInQBugEE7534f6du9FUQrOTUengreoIg2xnb0dmjaGoePCi1eFlvwWZQ1MaVOjH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=n5i0QeXB; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WJzaiPFQ; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pffDeO+4 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605EhmOB1310890;
	Mon, 5 Jan 2026 09:01:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=L0wep4RoYQGP36uUr99ekKh8iAGMRfxI9Qo2UQwkBMw=; b=
	n5i0QeXBAW6xB9/Naa8kH0Jp0Q+ABY+yCI77of+VP3qQOLv59fIc17kCX9bleICT
	xmgiTOeQEhF9Kwv4JyIUTwWdhswhjs6Y02Sf+8FsfmIcGaKZKDNMBKPOOOMn3fRc
	oFVnlH4qZtRhVEkvVAnM7t0Ra9mE6ufKDAWC4t5OW0ChVH1+BGhyVsYcguKhVt8I
	OgqSoHGZx3VgVwtpNTf1fs2u6aq6iAeKh0RQfHuHxbKdjvoPu5z/PZcjvpS9WA7X
	Ha6JywjYE1zLDR/fHXScJWl2XbdxtqKrKuCs0HSBLaSGJBRdVlpbh9SFi7s8Baqe
	b41MH4WpynIYhB4X6wBsag==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4bf30qwue3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 09:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1767632476; bh=L0wep4RoYQGP36uUr99ekKh8iAGMRfxI9Qo2UQwkBMw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=WJzaiPFQ4YnAXvMO2b8Y/gV41xXTJqNLl55wHbWEtNB7v6TS778JaXHiXVQ7pQB9F
	 bQlyjpk+HDZ7QsxWNe7PiLLhQGTJXy7pOSBmCDm1qPcj7/MBsYNt6kAQEyvfuIDQpa
	 pYvmp9SoF2XRRi0JN884H/YxTGJeqnMYGhJbqHsUgipZZgwHN4CYaznYvsvdR07sWD
	 +fO7hUdSZatZiMdJnschZnRksRYWT4PCeL1S8n3RHzf4e6gVBZu1uN8Bb2y5Pr+cqj
	 AJT3OIT3uDNxMkqzXZHu0ylICToO6UnIa6/8Xccd9WWUyl5sT5ZVGQCDkTJPaH7Js5
	 9V4ZgsoPdeYeg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CC674405B9;
	Mon,  5 Jan 2026 17:01:15 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6B595A00B4;
	Mon,  5 Jan 2026 17:01:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=pffDeO+4;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00106.outbound.protection.outlook.com [40.93.10.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6DA0B40235;
	Mon,  5 Jan 2026 17:01:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSrk9QQpQWdNaveGaJUYp97lUh1t10E4N4i0zUzVN8jmcShNkBTFli2gVqSfepNTDJmfwH/4V6d5nCCLu/GmETnpFEwiUIuVCZYql1Hp+euUoUCnLCx4durNYMVfb/po2Sy/RUN0GRXadogIbu8PkR/a9cMScS1IgpKrfvJtunWl8W+kaJLYYRITHFWS584v/+C0x+OEAfh/dotnEckcA5fMBMwCvAQ3kBruO998IfAWB2NU8h83DUC4O8TTaJN3CTeAuUsK/wPWy7cKCj486MDefzAd6MwAbwJWhID9cP1o7jSIgUxA4bhCWD5ShLEl5qFUFFhwtBrSLVc+spNJ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0wep4RoYQGP36uUr99ekKh8iAGMRfxI9Qo2UQwkBMw=;
 b=W7X/pQSSidCiLbLREntTMQWGAIRMQtnTzekskYqF7ZzEObMjmqMzKKI8caIaAoXi08ayoqaef03nQZvOcfUIgaWZXhiyXxpLCyxfKyhwZfko1ZwEaSF38cFgZhEVFjbU3pzQKcjF5oC9413S5mTcxNZ1lf+mnoVTxgt7Fk4I9cSGItWhKTCUZ/65Qkk2tho2C2+I1gJcSZDFD+hMaVU2DijSAPgprgvF9I8VtLZn4V3MIYLxCGYUqNv3w49gorRsTQUy8W4zCD/quDX5ZyDHOWBPdZSD2/ol5WxWq9QUvwsLwSOHHxx0P3g8BySR1CaLklcVVfWpB3DutX89v8LtPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0wep4RoYQGP36uUr99ekKh8iAGMRfxI9Qo2UQwkBMw=;
 b=pffDeO+4hiKiLJ71TxQiC5SBx61gPrDEX3ST3w0Ka00mD47GwDKTkA6hUxw1Kx0a69kDMyc2YNQX8INYnHGM+BO86QyYy1Lxise6iiBsZufFdq8hEHZ7L7Yxr++bOYuiMpxKd3sN0689xCSk/aWkV2EIk07AZErvk/5N3BMId+A=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by BN7PPF2E18BD747.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6ca) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 17:01:00 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 17:01:00 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Add the DWC3 instance name in traces
Thread-Topic: [PATCH v2 0/3] Add the DWC3 instance name in traces
Thread-Index: AQHcfjoBtXqdJ9szpEOmIm3MfZ3JrrVDhZyAgAA56YCAAAR8AIAACTMA
Date: Mon, 5 Jan 2026 17:01:00 +0000
Message-ID: <20260105170044.vuuoyiszyptokmfp@synopsys.com>
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
 <2026010555-squealing-easily-7659@gregkh>
 <20260105161145.podzns57ekzjg3pj@synopsys.com>
 <2026010528-animal-avenging-dad2@gregkh>
In-Reply-To: <2026010528-animal-avenging-dad2@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|BN7PPF2E18BD747:EE_
x-ms-office365-filtering-correlation-id: 1e3ef34c-4955-480a-6da8-08de4c7c00ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TFBrVngxNUJrb2NjV3lwZ2kzK0htOXMwYWpxY3p1YnJzeVozK0lwK3IyQm0x?=
 =?utf-8?B?cGxQVGk2SmxwbExQMi9GekluVmQ0N3Y5REhWc1YyNWVldG5hc2RrWHplOWRy?=
 =?utf-8?B?NElBUmx5NDlXZ1hzTzBPQlFjYmNtKzdKeGlsU1FUNTI3NStIeHNYcUUvU1I1?=
 =?utf-8?B?UzF0QU1LNGk3UVZWMHVtTkw1YVJNYVltcFpvMEVIbytxVElRcThGRVZUTG1M?=
 =?utf-8?B?OEJ6MExoc2UxT0dNNHFnT0NLWDUwMnZaU2xRWFpwc1c3TkpaYnBwQ29jeFZz?=
 =?utf-8?B?VkQzSS9wZ1l2akswak82MHdVR044NFA0U1V2RGw5Tmptc0RFZlhQV2JJRzUz?=
 =?utf-8?B?aG1xdHVoMmR1ZzJwQWFCdUdTclRrbTNKWm1GNkNRMUUzMVNvS3NIalBVRzQ5?=
 =?utf-8?B?UWVrU0FWNlJzM2taMHVUeU9TMEZWZld3Y1lNTW9Sdzh4WU81UE1HUVEwSUtq?=
 =?utf-8?B?Qkl6blNMRXVReTJZOSs5Q2NrTEtieDQ5QVZlWCtwUjdWZEsrb0Nsek4xb3NG?=
 =?utf-8?B?VU0xWGR4WG9ZWU5nUDhidktBZ1BZZE1pakdsdkhaQkY3SmVJVld5MllIZ0dV?=
 =?utf-8?B?akZGaTNPK1d4TGVkNlJpRlQvTXlPN3ZxNnV4d01scEJ3N1U0UVk5eWlVWE1R?=
 =?utf-8?B?aGRJeTkwL0Q5Z2tGdW9tY3A1aXAxdkFhY1g5ZGJrZlFDRjhwbGtrWmdWQVVs?=
 =?utf-8?B?NjZCR2VEQXB3UTF0MmtBdVdDc3V2VU8wdkd5WUFlWWpoZnA3Tm9ZQjBQdVpl?=
 =?utf-8?B?UzBEdmpBK0lnWERSSDlrZWFjS3hKTGRTR1N0TUplYTkwc1Q2bUxIWXY1eXVX?=
 =?utf-8?B?bFJWZHNLa053eW1IWEtEWnF3ZHV2dllLUTlORFlVNVJuM0M5Wlh1bDRYSjF6?=
 =?utf-8?B?MXN1K1MzM3RvaGFGU3kycnZwRG9xUHkyMWpvVkQ4YUVKaVcrdnMxL0dGNWlU?=
 =?utf-8?B?K0IzNG5iall4cEkwa2F0Uk5DVU8xK1k4aS96N3Y3VHNadzEvRTY1N2diS2pG?=
 =?utf-8?B?dVhIcm9ma1pJelhjQVY5ZnlhUkZQYXhBaEdoRnJzU2c2QkNYTW5JTWx3bTA0?=
 =?utf-8?B?MWx1NVZOQ000WThRTjhlTEpYR1k4N1VrUWI3OVV0RUlnZXNsQ2FZN2pod3A1?=
 =?utf-8?B?aDRrUGpvYnl5aUVzb2g2eEFjQkZiaTEwVWI5OW5YVC9wM2RuMFI0MFNMY25K?=
 =?utf-8?B?TitLZ1VVU05FY3hjWGVKUTBRMHFTWERvaU15OWdoakxjTHg1eUZZamFMKzRQ?=
 =?utf-8?B?bVNCaGF2Qk50eG5sZEdVU3Joc0tkTTVrTlRVNWc3ZXYrWFJ0L2MwZjlHcm5P?=
 =?utf-8?B?aUxnMm9uRUtzSU8rZzQ5ak9qbmVtakx2YnprTXdueHRhY3JUYlhYQkVKKyth?=
 =?utf-8?B?ZmhQUis1amdWTjh1b1pPa2FqbDFSbXkyaWNVZ3I1eWVNVDBuSmlVNTI1MDhl?=
 =?utf-8?B?T3ZiOXRxMEM4SEhISzNLcE02N0R0Yi91SEFDNGMwOEljcEsxRXEwWVJRTGg5?=
 =?utf-8?B?R1BLLzhxZ0RjWTRuemxSS0RqZ1VpRXhSZzcrSjZpalkxSnE3ZzdYZ016OUZz?=
 =?utf-8?B?M2Rka0lMVkNuSGlST3ZEdXBjTi9ITGlwVTBPZ2txRys1MTc1ZHdoNksrWG5y?=
 =?utf-8?B?dkxOWGdTS3lBZlU2UWpxdVNaa1I3U0NDTkdQQXF2ZFpSbUxGR3J5V2NseTBZ?=
 =?utf-8?B?aEloWk9qNmhHczUvRjRxR2o0NkxLajBPUTVPUVVPQ1B0UStielk0amlWb0Vi?=
 =?utf-8?B?V2ZkdzlNaXdhbUIvbUxKVjZEMTR2aVNLV21wWnZCU3dJbmJSdE5ML0hPVndK?=
 =?utf-8?B?elJ0cThQRjBDb0tXVmd0N05oNVdVSjNtZzhMMWFYWWx2L3M3REdFVjNlUlNz?=
 =?utf-8?B?QUFOaW85bjRjU3pGM0FtNzJZbWxpR0tyQXVtNE92VlVEb2xFSTU0bFdpUitN?=
 =?utf-8?B?VGFOZm4raENmNytXN0NpcWpYam4wTHlCNStZbGg4ZUFFdk1yU3JTQVRtT2tL?=
 =?utf-8?B?TVdiSW5INUpIYmtyWTUrZGdodFZOakFuYkYzUlN5RE5TNWFrRWxpcERlMUJm?=
 =?utf-8?Q?TJonWI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2IxTFY4TWxlQnA5ekpoaTFKL2lxUmFkZm1jUlBUb3NBS1hGdE5na2tPTGpO?=
 =?utf-8?B?QW52cHU5dTJybUFkclQvd0tmRUJlQ2JDdEtMak1LaHZFTFFNNDVBWXQyaWxD?=
 =?utf-8?B?Zm5LNmltaHhvQkF5L3duVzZjdjE1ZDFQWTJ1OTNzMHVwWmc0ZmljQVQzRGZp?=
 =?utf-8?B?cHhxR2tmdGFzM2FrWEcweVlYRXdiQnJ3VmYrNDhoa0NOK2NRalR3dUd3SnBU?=
 =?utf-8?B?a2Y2UDZvQXM0enU1SFcrblJ4L0FSV09NMldpVUUxL1pJT0tVcWYxWlJBdHpx?=
 =?utf-8?B?ZzIzb0V3T2VnL3hOQkoreWFmWkJnUlQvRUxhU3EyMjY0WE0vYXRyYmpoc1Vm?=
 =?utf-8?B?aXFmWjJRd2xab2tVeWFJaHFsMDNCL3Q0RVJvTjlZdGJtcXEzcThzTnoyOTdJ?=
 =?utf-8?B?NmRqeXVPLzRuNGFoZ0Rtam44amtXREh4eENUcU5DdHB4Rm1mR0RDQnhWZGJu?=
 =?utf-8?B?Uk83cTZMMlVLZnBUMmdvM1dWNnc4bVRpTk5RTHdtcHNmOHNwbVRFb0tQUXZR?=
 =?utf-8?B?emJCVndkb1ExNklIR2RSTnd1dkhCVnZMdFNPM2RkT3NqaUhTZUhJditQc0t0?=
 =?utf-8?B?Ym1IZU95aWl3dWJrby9JbFhncFdIWmQ3bTRwaHp0YmtHN1M4TWtDT1c4Q2E4?=
 =?utf-8?B?aE04Y3lCQXBtMkMrUmF0M1NxTkJqekFhL2tvK2ovS2k5SVoydHBNeTRYMklW?=
 =?utf-8?B?TDN3cTIrWEpRKzVlT2RTYngreGdMWjR4ellwWDRINlk1M0lTNnhGamhMUVc1?=
 =?utf-8?B?d1JUMjBGdmV1TVpYWnVPQ0FGa3QwNkdDOWFFUFE2ZDRjd2JRNUFxVVNWd0Ns?=
 =?utf-8?B?VXRPYWx6Y2lkcDhqWE94ak5EaW1NaGZXcmtnNG9DUnI1emVlWkpjR0gvRW5V?=
 =?utf-8?B?MWVxYWhtcTNxRi9RQURaaGQrSEhKUFZmd25Fc1MxaC84R2J1bDNOTnBpYlov?=
 =?utf-8?B?ZzFCdXZ6YkJUM2gyOUdrR1VhUmUvcUlXY2Z2Z1BRZFd5MFdUZVRWSktZQUti?=
 =?utf-8?B?K2I3M3ViT2JKS2UzZDBCYlAyaDB5VlgxdFZmUUhwdkJNcktUQVpPdlJKNjBE?=
 =?utf-8?B?eTBienVDRU9mUVJobG9EM212RHhFWUJwYUlOejZzYzREbEFqWDlCNEFibW0y?=
 =?utf-8?B?Tm01QUsvSjBWNExuUDF0TzhHaGJTWC8wT1FudVJWNldoTUl1d3pyVjByb3pk?=
 =?utf-8?B?VjRlTzR6T09iTUpZd1ZrY1Y1Zkg0ZGdTSTVEZnZsc08xNlBHU1AycEdFYzh6?=
 =?utf-8?B?bDFWam55WjQyUzgxdzhVaWtNL3hHM1dqcklkUjRYR1ZtOEpJQnY0N2xnaU83?=
 =?utf-8?B?Zkgza3MzcnRtRm9MQUFGaGYxYW5tWEJIN1RMSEJ5L21sMklpTUYzaEtVUmZM?=
 =?utf-8?B?NDNrY1U1S2x6aUtOYjRvbHpoN3UyeVNFTjMyMTR5emNSazZmWW5GOGFxQkI1?=
 =?utf-8?B?cmNtbzZFNnNQQ0FIamNtSTZFSGRxd0FqM1JQcGNFVHhXTC9DZlR5MVN4aEYw?=
 =?utf-8?B?emZzV216ZGkwek1MdW9EMEw5RW9ReXhkVWJrL0cvQUNSZC9yazRESlMydHFt?=
 =?utf-8?B?M0ZyRmk4QTR5bExRbmJIWE1xSDZUekJsNHlmcnNESGZPNzA1UkRIVzZYcFZh?=
 =?utf-8?B?elJJeXZBMmt4UVVvSG9mOEZJckxNaXZhcXV2L0JOY2tSeEszdzhaSTU3UnFo?=
 =?utf-8?B?eldGYnQxS0t0N2d5MjBWMVNaUWhITC80OHZNcEo4ZmJ4SjVTZFJCT1Q5TVd1?=
 =?utf-8?B?NmZMM2MxZmZ1ZHBHN3pqWm5RWVlnL3JrcXpxQlY1TExkQll2RlVzbWhJa3k0?=
 =?utf-8?B?eVdHVmNXUit1YU03NDBlRE1OdHRRczJRYUZiQWFEN2pLaWMvY2lhcFlWQzlv?=
 =?utf-8?B?K2dPcTZjb2hKa3FKeUhsNE1kc0x4b2dxQm9iTno0QUN6dEt0Q3VVNEQvbXlS?=
 =?utf-8?B?VmFHNTJJMnJsSkZIVHBabzN4WkpaMjM3bGZFZk5JUDhHdkFKdmtUYmg0SVN0?=
 =?utf-8?B?UEk1RTloK2dETVRGVlNwdVlCL2tLVmJWNStWZkVmb2drM21pcTBsOHhja0h5?=
 =?utf-8?B?WXJLemtnY3RIQ3NQMlAzQUNVbEQ3anZPdDY4QmVWLy8wSjlQNUtkSm9sbGpQ?=
 =?utf-8?B?citMakY0V1VFQlNRRzRJYXZhcTA0QzJ4ZzJyNGpOTmpMRitLSmRNdjZxanZX?=
 =?utf-8?B?NU9Qdnd5WTYwUEdoYmpicWdTNzBLd0x0dWVGNXRGaHJxM0Zpa2R3T3FhV3hp?=
 =?utf-8?B?WTVwOCtPYUdnVkJoZ1JqaStkWk5JSndxanpxWnlHVnpkWTB0Nmw2ejVJRHNH?=
 =?utf-8?B?dnpiVDlHeUtZODArTmNPQjVraENMaUlhZ0VyK0Nvbit3ZjF5eHZGUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A82DC585534F534ABAFA595FD16F8AEE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K2wy650Nlr5O4wunCDPDurPChIUKImv0T7GwteoSrW4oJ47cgs5T7G6kfahr7PUzHvRq7YYckgNdlbK5RLBQBy5+L6RsJu7QqXbZfknj2/hE1R8PeREZZ6OutvD6CF1XkLtswIQHblhMs/MqCtJxey0I95G4KVHSzDlhWBeDc8+z/Gh8oGD/wc0VTR1ub3lHyh6bRsIsgGtRf7nVG81KGrv290IfaOhI8bJqH1NktKmSVPSQJwnTZXQbFOhbAKVYYCw4guiwPwTokBggNnI/uF0S8Nhrm8NT8uNTLmQCZqngoHqXnl2LgcVXH9+dkzA6YVetQpjxPd2zIVMh/5BGxO1S2Ik1Uy0tiJQT+mqgkSTcIlmfU8+bra3V3fcOq5mQ+yzAQ1h4FtY7fG6d/zpGSM0mivzpbPA4VV0U1bX2iNLh7ljukt/Hp4+IHOdKv1tZbYLHefG1vt+3t/MKuWn2q1+Y8i7Im3T6HH7mmz+jQ0wlPEFwx5+X9zo/rWug6UmBiVpbWLJiCpcxJvziKJ+gkRNTxeLVTP6UiBGK6FlVY7beyGvPojmshaei574DjPZJKLERvuEYRWxDIMZNsaGqutsBs20geEoyPvH83+1mzVXjF4hySbtrZSohXqHm7+1N5qm4Dj/qZvP9/HQ7e7EJnA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3ef34c-4955-480a-6da8-08de4c7c00ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 17:01:00.3484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3sV+G7cMn210nt6++TkiE7GwgICuNAnGNygh62qPQcgU+tBZn9ZVn2UPUciKqJZY0HUpHvSmGMA+WOu+hcYwSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF2E18BD747
X-Proofpoint-ORIG-GUID: 4rWoIsExLk3-2ksw6EqljdM8mV2D_c1H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE0OCBTYWx0ZWRfXzmCXLZUffc2Q
 dMPTJ5x7RrMacjBvlNQbTalz8EE/PCc5yjMLrQ8B/xZLqXfBpN7/KxXB6Lb1YT89VP5YQ9LrYGy
 +vTe0t85tiQfkOV9MTah+rzVF3cTCPposbAL0x0NQvHpCuIU2ftES5Ye7bhIo2yyfe1W8lAhEJL
 7A/35kXei1QS9waNQjSdqmsVW6r4fgtwXAKIRiKsYjgtPL+Kis7iJHwgvQg7IE0bbFMWZeypb6A
 fdjW9+JjvOzz8t5/Cikfcm/TYWBygMbl4pzHm4WOf+vSzCJKcr+GjH4atv5nKSjkmx8/WMkbcP2
 VK4K0I3OVoUryVvAll1isY9bPK2Eympw0fOOVwE2oFjf9VQ0c59DjHm1d+Ek8Hz5XdYRCiyydnj
 PvH/IbhFoUWtQh3RCtWrKKf7hUvp/e0hirTD9YdGezluGTOiO5c8blM1JvkyYBmJPXvx8acMCyE
 kzL5F7aZ+gwWLGusQDg==
X-Proofpoint-GUID: 4rWoIsExLk3-2ksw6EqljdM8mV2D_c1H
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=695bee5c cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=YaEtpaUcUarY5ibk7dkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2601050148

T24gTW9uLCBKYW4gMDUsIDIwMjYsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4gT24gTW9u
LCBKYW4gMDUsIDIwMjYgYXQgMDQ6MTE6NTBQTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0K
PiA+IEhpIEdyZWcsDQo+ID4gDQo+ID4gT24gTW9uLCBKYW4gMDUsIDIwMjYsIEdyZWcgS3JvYWgt
SGFydG1hbiB3cm90ZToNCj4gPiA+IE9uIE1vbiwgSmFuIDA1LCAyMDI2IGF0IDA1OjIzOjIyUE0g
KzA1MzAsIFByYXNoYW50aCBLIHdyb3RlOg0KPiA+ID4gPiBXaGVuIG11bHRpcGxlIERXQzMgY29u
dHJvbGxlcnMgYXJlIGJlaW5nIHVzZWQsIHRyYWNlIGV2ZW50cyBmcm9tDQo+ID4gPiA+IGRpZmZl
cmVudCBpbnN0YW5jZXMgZ2V0IG1peGVkIHVwIG1ha2luZyBkZWJ1Z2dpbmcgZGlmZmljdWx0IGFz
DQo+ID4gPiA+IHRoZXJlJ3Mgbm8gd2F5IHRvIGRpc3Rpbmd1aXNoIHdoaWNoIGluc3RhbmNlIGdl
bmVyYXRlZCB0aGUgdHJhY2UuDQo+ID4gPiA+IA0KPiA+ID4gPiBIZW5jZSBhcHBlbmQgdGhlIGNv
bnRyb2xsZXIgYmFzZSBhZGRyZXNzIGludG8gZnRyYWNlLiBUaGlzIG5lZWRzDQo+ID4gPiA+IHRo
ZSBmb2xsb3dpbmcgcmV3b3JrcyB3aGljaCBpcyBhZGRyZXNzZWQgdXNpbmcgdGhpcyBwYXRjaCBz
ZXJpZXMuDQo+ID4gPiA+IA0KPiA+ID4gPiAgIDEuIFJlbW92YWwgb2YgZGVwLT5yZWdzIGFuZCB1
c2UgZHdjLT5yZWdzIGV2ZXJ5d2hlcmUNCj4gPiA+ID4gICAyLiBVc2UgZHdjIHBvaW50ZXIgaW4g
YWxsIGR3YzNfcmVhZGwvd3JpdGVsKCkNCj4gPiA+ID4gICAzLiBBZGRpbmcgdGhlIGJhc2UgYWRk
ciBpbiB0cmFjZXMuDQo+ID4gPiA+IA0KPiA+ID4gPiBDaGFuZ2VzIGluIHYyOg0KPiA+ID4gPiAt
IEF2b2lkIHVzaW5nIG1hY3JvcyBmb3IgZHdjM19yZWFkbC93cml0ZWwoKQ0KPiA+ID4gPiAtIFVz
ZSBiYXNlIGFkZHJlc3MgaW50cmFjZXMgaW5zdGVhZCBvZiBkZXYgbmFtZS4NCj4gPiA+IA0KPiA+
ID4gV2FpdCwgd2h5IGNoYW5nZSB0aGlzPyAgVGhlIGRldiBuYW1lIGlzIHdoYXQgeW91IHNob3Vs
ZCBjYXJlIGFib3V0Lg0KPiA+ID4gImJhc2UgYWRkcmVzcyIgZG9lc24ndCBtYWtlIG11Y2ggc2Vu
c2UgYXMgdGhpcyBpcyBvbiBhIGxvdCBvZiBkaWZmZXJlbnQNCj4gPiA+IGJ1c3NlcywgcmlnaHQ/
DQo+ID4gPiANCj4gPiANCj4gPiBJIGFza2VkIFByYXNoYW50aCB0byBkbyBzby4gVGhlIHJlYXNv
biBpcyBiZWNhdXNlIHRoZSBkZXZpY2UgbmFtZSBpcyBub3QNCj4gPiBjb25zaXN0ZW50IGFuZCBu
b3Qgb2J2aW91cyBmb3IgZGlmZmVyZW50IGJ1c3Nlcy4gRm9yIGV4YW1wbGUsIGZvciBQQ0kNCj4g
PiBkZXZpY2VzLCB0aGUgZGV2aWNlIG5hbWUgbWF5IGJlIGluIGEgZm9ybSBvZiAiZHdjMy5OLmF1
dG8iLiBJZiB3ZSBvbmx5DQo+ID4gaGF2ZSBhY2Nlc3MgdG8gdGhlIHRyYWNlcyBhbmQgbm90IHRo
ZSB0ZXN0aW5nIHNldHVwICh3aGljaCBvZnRlbiBpcyB0aGUNCj4gPiBjYXNlKSwgaXQncyBkaWZm
aWN1bHQgdG8gdGVsbCB3aGljaCBpcyB3aGljaC4gQWxzbywgdmVyeSBvZnRlbiB0aGUNCj4gPiBj
b25zdW1lciBvZiB0aGUgdHJhY2VzIGlzIGFsc28gdGhlIGhhcmR3YXJlIHZhbGlkYXRpb24gZW5n
aW5lZXIsIGFuZA0KPiA+IElNTywgaXQncyBtb3JlIHVuZGVyc3RhbmRhYmxlIHJlYWRpbmcgYmFz
ZSBhZGRyZXNzIHRoYW4gZGV2aWNlIG5hbWUuDQo+IA0KPiBCdXQgYWxsIHlvdSBuZWVkIHRvIGtu
b3cgaXMgInRoaXMgaXMgZGlmZmVyZW50IHRoYW4gdGhlIG90aGVyIG9uZSIsIHlvdQ0KPiBkb24n
dCAibmVlZCIgdGhlIGlvIGFkZHJlc3MsIHJpZ2h0PyAgQW5kIGlmIHlvdSByZWFsbHkgZGlkLCBq
dXN0IGFkZA0KPiB0aGF0IHRvIHRoZSB0cmFjZSBhcyB3ZWxsIF93aGVuXyB5b3UgYWN0dWFsbHkg
bmVlZCBpdC4NCg0KVGhlIGJhc2UgYWRkcmVzcyBwcmVzZXJ2ZXMgdGhhdCBjb250ZXh0IHRvIGtu
b3cgd2hpY2ggaW5zdGFuY2UgaXMgd2hpY2guDQpJZiB3ZSBoYXZlIHRoZSBiYXNlIGFkZHJlc3Ms
IGRvIHdlIHN0aWxsIG5lZWQgdGhlIGRldmljZSBuYW1lPw0KDQo+IA0KPiBkZXZpY2UgbmFtZSBp
cyBob3cgTGludXggaGFuZGxlcyBkZXZpY2VzLCBwbGVhc2UgdXNlIHRoYXQgb3RoZXJ3aXNlIGl0
DQo+IGp1c3QgZ2V0cyBjb25mdXNpbmcgZm9yIGV2ZXJ5b25lIGluIHRoZSBlbmQgKGhpbnQsIHRl
YWNoIHRoZSBoYXJkd2FyZQ0KPiBlbmdpbmVlciB3aGF0IGl0IG1lYW5zLikNCj4gDQoNCkknbSBu
b3Qgc3VnZ2VzdGluZyB0byBjaGFuZ2UgaG93IHdlIHVzZSB0aGUgZGV2aWNlIG5hbWUgaW4gdGVy
bSBvZiBob3cNCkxpbnV4IGhhbmRsZSBkZXZpY2VzLiBUaGlzIGlzIGZvciB0aGUgdHJhY2UgZXZl
bnQgcHJpbnRzIHNwZWNpZmljIHRvDQpkd2MzLiBUaGUgYmFzZSBhZGRyZXNzIGNhcnJpZXMgdGhl
IGFkZGl0aW9uYWwgY29udGV4dCB3aGljaCB0aGUgZGV2aWNlDQpuYW1lIG1heSBub3QuIFdlIHNo
b3VsZCBub3QgYmUgY29uZnVzZWQgaW4gdGhlIGJlZ2lubmluZyBzaW5jZSB3ZSBhcmUNCm5vdCBy
ZXBsYWNpbmcgYW55IG9sZCBkZXZpY2UgbmFtZSBwcmludC4gVGhlcmUncyBub25lIHRvIGJlZ2lu
IHdpdGguDQpXZSdyZSBqdXN0IGFkZGluZyBuZXcgY29udGV4dCB0byB0aGUgdHJhY2UgZXZlbnQu
DQoNCkJSLA0KVGhpbmg=

