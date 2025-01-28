Return-Path: <linux-usb+bounces-19802-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09611A20333
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 03:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51FC2163AB7
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 02:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B0318C928;
	Tue, 28 Jan 2025 02:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Yr7s0V/2";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="g8eDBXuh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZO4hCAKs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58FC25A636;
	Tue, 28 Jan 2025 02:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738032273; cv=fail; b=IxVdLOtPNn2HVzOJtLf1g7jLO39dXc/m/+Fw/Y2JinFHdX6aTsAHjvXZP2lyvOqvr2yGxQpzJOu8lKMOURhoy0AkJaSuMt9kVXsgXftITgr6K5/qjGfVCMXdfBsVXX8rtf2HzATn+u+cx/UyM8yzniECHTdE+7tmc363dxhrJd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738032273; c=relaxed/simple;
	bh=q1HvHoWmNNwLJbDvuKZyp94/Nk9squXSwDxLvKtScSs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N043lpQoAdXgYXUjV040JvV6dC5URFFgfyCdrOG+Ho7VTaD9t08gywss1BfKBGrD0Pvou4Gd8PSQZGF2K7/gswQ2FItbK8VscgrFT9vejYk6fy7vHzfDqxoBGTMb/1zajlasLZ+IJDiKcXp4eVRMQuge5TYYHn2AoSPpU6Kvcs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Yr7s0V/2; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=g8eDBXuh; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZO4hCAKs reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S1ORG6012819;
	Mon, 27 Jan 2025 18:44:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=q1HvHoWmNNwLJbDvuKZyp94/Nk9squXSwDxLvKtScSs=; b=
	Yr7s0V/23VoEftF8UVrB7Fa4LI8+8Y8LhEjLvzLqpQ2lq9XyVQa00sD/iyehJMnK
	Y/n9ybArs3hh0SbQzqqL2/zn0kFXh2N+g48F04BSGmfdTVWFefW5+5T8KZtBJi7r
	PqoWsv/eTJIDLC7NyFaJR/t0X2Zp+hd/886VF2yNmfxztUY61DSXrD6LaFqeaCuX
	KnMQdTUzQ5S7I49ApIVqNvmEUFyDlEK+0cCHPsrWjgWo7XFGo1k3jjSbxbnzmEGR
	pPtBM0YAujd3DsqwRgmhLZX+KHCUkHVMCb+ADt1XFMACf3P47PEhIRryZrUAq7qL
	UaqGuBWXLbQb4FOfKZXbIA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44efadst4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 18:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1738032262; bh=q1HvHoWmNNwLJbDvuKZyp94/Nk9squXSwDxLvKtScSs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=g8eDBXuhZDRVVYDTHI/ceaMNNXwm/uzTJM5eUqniSXYMS/ZzVV2PiYYmIT4sFWoR8
	 SDVzotKERb9evS76q2AMKIloldRurN0gUhU8Tpkq5WJVZJoxhiqLQ1Qj5nrpb4UBpf
	 7XLStM/t5dohABqeZkNFD7b5pR1i3KwJpEY95knCT32Gu2B3H3dJqqVY57Ia7G3Jod
	 uBFYUNR92Ooxlbl6hQ5kBKnq8eHpN+ZvnpSlu6I7mgSbNgzkCX7OyNNROjBTwf4GuD
	 uA/R2sWsme2Csb6n/+dCOlR4mwozg44sPszNhqMiPybnyUGzHkWv+qCI+HVI0EixMW
	 T6D8927vyEODA==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 93D6F40515;
	Tue, 28 Jan 2025 02:44:22 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 53909A0085;
	Tue, 28 Jan 2025 02:44:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ZO4hCAKs;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A3485405A9;
	Tue, 28 Jan 2025 02:44:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhr1KlV3l7jsq3rBRblw4qLp01cNJUaQQpaBPq2XCGly1mh4erDFc9P3WOqfQvrlQW0pyAelFYS7LrW91dfDM94Dwp0O41KaV/gMHIXNDRcnB3aWjC6D0lzpC1qj+kXOPF1dSoqVKucGcxylWL+1VAfpiKIwM8W9vONm8SIc1os5CHPyBWGh5tm5jTtFK7NOKy6cwO9d6o6vxJ/Eutonvn64Palbw+R64BVcQNh+SPsRcHxHZCeU9isctdpF9ZXrcMfbZIYLyjMrI9J5TZwJvmn9u+xwMy1ocKGM6wC+M9p3wNDALZ7QCnoKqk8yW7f17pidARRpg3Ap26R7LnKq8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1HvHoWmNNwLJbDvuKZyp94/Nk9squXSwDxLvKtScSs=;
 b=PHkZGD6XyqFw/1Rrj6MQxs1T6Os/A4q+CYul2cYUeu2/Y8dZtVLJNtXQ81Onjp5W/Er9GzhrJd0PI/pKVWguQmGCPMx1bwdpFvzhjJwFggIp2N5XH0vHZM5IQ9dX6iu7gKYAcSiZTvW6GPsljKgvWM9j6fLoL7SL7k9zn0zaCvjDJ20u5am9eHozr0NHnpedxkZPfe6MasL1dFaulzNVwzjRtiaMu5N4WsGUEN8Uhii1LzXG0ODkSu8neMPwj0wvui+1eUAHDPcgE/3/fF9RHnym3Wp4QlNgtO75+NyrW/cPbL4EFo9Bz7iNEw0i6NKyhNf5awEh19tdk77aN6S4gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1HvHoWmNNwLJbDvuKZyp94/Nk9squXSwDxLvKtScSs=;
 b=ZO4hCAKsiqqhyUBTyv3uhkRDQ87X5VdJ4a6v+B+4u1Xig/z7+G6HfCt6OAnHIK0ZcOrswrophywVP1oj3PmnwuwJukof2RRmtkl4sQQbcK2oJv2lJakZgIR5kDj2UzWCf63WlyRZJ89wBEnTtF/F2aEMHKNTucrCuTkrNTt923M=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY5PR12MB6203.namprd12.prod.outlook.com (2603:10b6:930:24::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 02:44:17 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 02:44:17 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Badhri Jagan Sridharan <badhri@google.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jameswei@google.com" <jameswei@google.com>,
        "stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH v1] usb: dwc3: gadget: Prevent irq storm when TH
 re-executes
Thread-Topic: [PATCH v1] usb: dwc3: gadget: Prevent irq storm when TH
 re-executes
Thread-Index: AQHbbjXlOsxglH89uEOeQnhFYdXNErMrgJ8A
Date: Tue, 28 Jan 2025 02:44:17 +0000
Message-ID: <20250128024416.7i3i2vmw2ioy5huf@synopsys.com>
References: <20250124075911.811594-1-badhri@google.com>
In-Reply-To: <20250124075911.811594-1-badhri@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY5PR12MB6203:EE_
x-ms-office365-filtering-correlation-id: 23d85d90-6a55-4e2b-4704-08dd3f45a915
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U0lwbWRJSElOVWNXdWM4Y1RmNTZ0Kzd1Lzc3bjFNM0NaUTMzUmFzYmFWelpj?=
 =?utf-8?B?Ny83VDE0ZWR6Tnc2UHNRclpYNkdrZnNtKzJ0Zm9kVHNmclhQYm9UMVV5dVN4?=
 =?utf-8?B?Y3hwamJaWXRkY3ZnUmNjcTN3czBUZFRvaC9tN2RuenpCVFJQQitnMXBYT1ZV?=
 =?utf-8?B?VTBzMlV3YmhhQ2l3ZW8xbCsrZkp4MXBhT0Y4S3FsKzJTVXlvcVhLWEUzaTkx?=
 =?utf-8?B?TzBCZGovcWNlSTFmdmhFM2V6bE80UjIvWkJqRlJ2bUZXb1RGbnNDUFprWTR0?=
 =?utf-8?B?UG1DSmphM2dCZVZ0cnRXbGpKSlo2elNIYkFZWU5VM3AwcndOQlhrS0pUb2dh?=
 =?utf-8?B?RFlLR2lLNW9MZWNHcjZHOXlPeXdCS3RFbEFZNlRFK1lGODg5WUMyNGtFZy93?=
 =?utf-8?B?cXpPQUtPWit4akJBZWVVUTVVb0R2YnNhOVVYTS9IYXNuRTZMY0FYSVY5Z1Fr?=
 =?utf-8?B?WExGdFY4c3N0QlhIRmsvcDY1akMwMEZJTWROejlqUjc4VHlWWlh1SndBcjR0?=
 =?utf-8?B?dnF0QmhESWhpVHFBVlM5UVpPZkRpSFNxVWxtaU9uMWx3QUt1bUVmdERhQVFu?=
 =?utf-8?B?RkZ5RWhienZuN3FBZUNtL3Y2TjNudXZXUEdrWHRBTTdzSVdibUF3OHVYWGx0?=
 =?utf-8?B?NWV5Z3lWVlRMWHVvQXRNSVJwbGN3SlQrY1ZsL0duT0l0a1hKNUF5dGxGSnhY?=
 =?utf-8?B?ak9keEtJWjEyTHdyUC9lalVXUVV3ckxoOExoSlR6VFZ0MTlESklKM2s4ajlD?=
 =?utf-8?B?Wk5xTGNuTGU2aGI1NGJhbGdIR3p0dnFpTVJ4bDNEQUpVV3JMZk5RZkpQTHh4?=
 =?utf-8?B?bkl4aW9WbUdtZGJmM2diSy9XbDBDaXBsL2kzcUJ0em43N2N6Tk1xKzRhWTVm?=
 =?utf-8?B?TGRjRkxKUnVvZmZaOU1BSnB0RXhOa1VacGNtZDZyMjhVbzZrRS93SThyU0Y5?=
 =?utf-8?B?dHNTZFA2amlLV0hCaE1rZlc4dEtLcG1PT2VsY1NvaVRnVFZlQnpRa1hEKzN3?=
 =?utf-8?B?dXVSV2UrTVdBWlZCa1FhbUpmVXVwaVEwWGtISFU2SVRvZ0ZXbjhOQjdicEFp?=
 =?utf-8?B?Qmc2RHpDSzhqV0VqM1lOdG9FYlYrNEZuZ2YvZVhBc3Y0K29LcFlxNE9aaVhU?=
 =?utf-8?B?Mm14M2tXRmR1ZWZmemtyZGdlVE4wbGF1bmFneDlsdkdnK3pwMnpDZ2VEcmhm?=
 =?utf-8?B?RzBqUmxYR0JMaFl3NDNFa0ZDdm5DWUlTVG9FRDFzQ1YzN2w4RUFYejdOM3Iv?=
 =?utf-8?B?MlQrL3FqTm9qRzREcVVvbXBHbEJ6VTFubUxnT096MXc4anBQUDRnNDdpZGg0?=
 =?utf-8?B?N2ltWFZrMHZJTytWNm1wSEJkYzdTK0lpUmNxOVhRbWlEemFuNUJPZlBNUEtW?=
 =?utf-8?B?Vkh3a0pPMDdaZTVQdDRKSDJPbWZOanc1SGZwcjZHZUl5QjNsbkR0WWJmYk1N?=
 =?utf-8?B?dEl5c0xPdzh0QkJaRE9TLzBhRGYraGFIUk9WNDNGZ0dQOVFWSlh0UW93SFpw?=
 =?utf-8?B?QVBVVEJWQkcxdlUrblhyTGNpeEJjdFVOOTQvZDI5M2NGN3pKYWxFRUkrMG1Q?=
 =?utf-8?B?cXM0UlhmNTBUQmRyK3dFZXRDYUlHdTJHdjlQUzFmd2dHeWZiNVhMNEJRTGJv?=
 =?utf-8?B?b0IwQlhBcklrRS9rS3BuSDZtUzJuQVlzN1ZOMzYwU1lORndJQkxXbHpWMy9a?=
 =?utf-8?B?L0lQU3FaYXdMbXA5ZVU4clZyeGJLVWlraUlrR1NEZ2NTUlJUdjhZSC9hWnNX?=
 =?utf-8?B?TU1RSSt5Zlgwc0p6TDgwNVVJWDFzQUlhenhVWkRaSmFudlhORVhmZjRxRC9r?=
 =?utf-8?B?RVNjSEFETVhCQjE4UWRuVitKVjlGSFI4MEpRL0xRQnZEZ1Nici91TUE4bElK?=
 =?utf-8?B?U3NpdE9mSUhsODF1Ym9YMy8rdzdybDI0V3FKRXdZalZEZzlCR1JnMUNKWG9N?=
 =?utf-8?Q?eYzTjGr/OwYktpCOBXjgG2RIE0JmpVtJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bzNlR0RiTEYwNlNpSFdSanFRVzNIQTlNQzJxK2tSZ3hEZjlEVXdkamZmSjZB?=
 =?utf-8?B?RSt0djRHN1BCTHI2SUNKZnZIc3pZRy9OcTU0R0NyNldMdEVrN2dGS0Z6MzlO?=
 =?utf-8?B?bDd5S0Nrb09DZVBCNmQwdmVXaEd6QW5DdHBMbFNlUXUrYTc4Q2p2bVpuVkh2?=
 =?utf-8?B?WXZobzlCeUxKRXNNQUsvM2NsTTRGb0xhU2RWRW5YdFFQa0VvUEp5ZTVKV1lS?=
 =?utf-8?B?bmZjbVlEUmR3d2EvWitXa2FnOXh0MFlKelRUVjB1Q3pCS0wwbWpHcmRVaUdT?=
 =?utf-8?B?N1hNMmRrelpLSFUzMThBM2FMZzZqTUc2NW9MV041aGZuNjJzRmtrRXlCeHFZ?=
 =?utf-8?B?L21ZazFYSHJ1b29aRUwvMklzcG51TVBOeFVCaTErR1FTOXNjSTNuSXV6R1pK?=
 =?utf-8?B?UVpKbVFwZnpuN0R4RFVkRG5UNVNxQkIydFV3YWxnY1o4MUhQWnZ5TUZndk5h?=
 =?utf-8?B?TFd3N29sZ0FLQnE4VW9nVytHS1Q4RFJ0bEtXSjUzbzN0ZUJEWW9GTzF3YkZW?=
 =?utf-8?B?VVZRcGNSN01YMHVsZDNEd1FsVFgwZjQ0bmt6VU0yZ05nc2NZNWwwYkN0UmVn?=
 =?utf-8?B?UE0rZDRCUGFDTjFaNWtnYkhrSEhEcU1QM0w2TlBNelRSTDJCb0FoenIySG00?=
 =?utf-8?B?NXBSYkl3Sjh3enF6U0g5Ty9QM3BzdkdDNU0zYmtWRk1wVkVPaGNwWndBUXZ5?=
 =?utf-8?B?YTZoaDBVQkVQa3ZxdXVQVTZsMUhVQ1BRQWluTUkzQk5TQ044aEllMzRlYUhT?=
 =?utf-8?B?Ry9lYmE3YmhMcFVTVFU2blNRaUdKTmRybExVSEZpRjgvWHVadUZsdUVKWVdI?=
 =?utf-8?B?YTFBZGs0dDBtRWw0SVI0bkIvd0lqemVKTDdpVnoxRUtmMkp1T2JHa3o4VmNB?=
 =?utf-8?B?UWdhd0dOU3dVMXhkUnRQbmg0V3pvSXpFdEpzZVdJYkZTelFjemNTT2ZlUHZu?=
 =?utf-8?B?UHJvRS9QRU5JZjB2RTE0ZUM5Q3MrdXhsakhWWWVHUHZXeTRpdVZ5U3dMK1BN?=
 =?utf-8?B?ZHBUcTNMV1dieDlpeiszWEhpUlhzVXRNUWlka083WWpFTGxyR1Brc282b2ta?=
 =?utf-8?B?SjQzZlJaODlCaEV5emFMN0RHdUU5MzdPeFFyTW1lbnIvL1hQaEtQMndBMVhF?=
 =?utf-8?B?Tnp3TFF6OEs5ZWZmeTN5NGZYYy83RCtDalFLV2ovTjFPaVJWcncrY2tQaWFK?=
 =?utf-8?B?eUo4S1ZlVE1FQjk3ZDB3aGg4VE1obWF0dk9kdndHR0kzZWRvQlhpUy9XdmQ0?=
 =?utf-8?B?VGcxSlpVeFZCZHppVnB4aU5zalNGeElkM0d6NzdxUVVZb25RRzdBcU15MDlE?=
 =?utf-8?B?cHpsNk9pOS9PWTUrL2pac2hvQWwvanh5disydHJpb3R4ZTFocGRhcGJHb3Y5?=
 =?utf-8?B?c0tpaWZ1WDBCKzlyM3hZQzBKa2ZNVmFqRGlhRTROOFFaZTN1LzNTcU02U1pD?=
 =?utf-8?B?VkdqczY2RDNnTFF5S2t4NEV6RkgzYW9DRlZTdzJ3T1BVNTFYTVh5dGVqL25T?=
 =?utf-8?B?bE90Sy90NU9saDZhUlRDRW1DT3Qrc0V0N1BLbGZBWDJtOUlKRGMwZHhSSVBv?=
 =?utf-8?B?MUc1TzI5cEFDVFNpblFjcEdqZko5ckZWMjNWbit4R2M0K25rbXNtOURWenFx?=
 =?utf-8?B?SGhtaHJnYzBuVVVOQUJQTTl1TGlQNU0rS0dRR25ZQ1ZqcU42WUdBcGc3OEk2?=
 =?utf-8?B?dmFaTVZFWDlKOHJMdU80MTVxcnBKWDFEcnQrNkVzMTZ6TTdVYkNESUR1eDNH?=
 =?utf-8?B?Zzd5clRPaUI4SHpsa0ZKZ3pDb01lQVhTZHZwa1JJRGZtMDFKc1BiSzFIZmhn?=
 =?utf-8?B?OUZRb1JvNTNNc1g1YlZXeFByZGZuUEEvSHIzaFFnL3h6SVZ0YU9vdEhLR1dj?=
 =?utf-8?B?TVVZOVMreXpYVnRjVm5kd01SZFNWUmRlSGdQOE0zSUNlMHNZcU9abzQ1cUJP?=
 =?utf-8?B?NWNBRHBQMFVwaEVuWThTZmFvVXZIQjU3Qk5mNnVpYUVjOXV4MDFiQk5lRmd4?=
 =?utf-8?B?WVp1U1NoejlxSnJndXBTTngwYU13NzF6blNxeTI4VFJ4WXlIc2ovRnVGNWRQ?=
 =?utf-8?B?Q29mc2gxeGdDZ0ptN0V5L2VHZzUyQ29rbUsvNVY4YisxSHYzVGxydytUNWpK?=
 =?utf-8?Q?Z267JqJzZG0a7WUA4umxv2/nX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A746EE29974BA4459B424E0D28A43A9A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o4JT6bSXUizRlApTr2A+2JdxIuICoTuS5vDzBrxY9RX3xgStbPNnvBbEgu4B2+sIcCRvIqvsFzVst1JfyJJ7YFvFz33uC8CNN0xnu7Z3Db5+AwpW/Q8eWQeBTbr3x6kx2ZstW6NiiGUeOhD+gW5gwN9qx8uuV18t9iToPq6gBGFO5uwG6vJlc4dEdj65Z22b2P94jZBESLxPwOSgyyqCG8+PS4K6EVmJtDAiuPIdOaCPYTgpNVRRYYWEpeFz6vSVyK0BCxppG75zm8yosJXmSVKxE3dXC7qltZcWMcYDEbAExkxSyDCyO755yVz6b8uwTrQmFlQViN0Mgi0387AY+U+ppmzOnGTQA1ePb25tZlNd4+vJ0jl6FtapzTzWSwD2AYWGmtA3PpJTm5tCCPJoomvFKtg0DzITOrHh6vvk3EKVxVdP7YMYvmHhM1ZwPSR09RthVh1VdMfmRMnZ2u+qxNjI+Baj7WUlUH+Ir1WybglTDL4aokLACCO9IABCTj4Ox/CtcS+JnSMku7q2TTXtnEkFh29LcG6+6X+HDD7r34j6D1zeIS02mwwya0rwf74C2Y/fwK4Tht4ccn1f0tFxHshd2wA1Z5iuMt/41/uui5czUIll6JTLO7toYUBHZVY5D1HndC2Fu6fmnCcQ//vqXg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d85d90-6a55-4e2b-4704-08dd3f45a915
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 02:44:17.8399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LXS4bjKzFcHrnccDy/pjJIDq0GPNp9VXMGBp+nKZmAu7cDzBPMp9Ld8qp0Ert/3sh6uBzWq/Y9edmkoWm72w1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6203
X-Proofpoint-ORIG-GUID: Pqt_XxGlmVCjzKHOU-nOnUq6LesBftiF
X-Proofpoint-GUID: Pqt_XxGlmVCjzKHOU-nOnUq6LesBftiF
X-Authority-Analysis: v=2.4 cv=VtfZA/2n c=1 sm=1 tr=0 ts=67984487 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=zOGKDB3LpYuGi7PvficA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_12,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=676 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501280017

T24gRnJpLCBKYW4gMjQsIDIwMjUsIEJhZGhyaSBKYWdhbiBTcmlkaGFyYW4gd3JvdGU6DQo+IFdo
aWxlIGNvbW1pdCBkMzI1YTFkZTQ5ZDYgKCJ1c2I6IGR3YzM6IGdhZGdldDogUHJldmVudCBsb3Np
bmcgZXZlbnRzDQo+IGluIGV2ZW50IGNhY2hlIikgbWFrZXMgc3VyZSB0aGF0IHRvcCBoYWxmKFRI
KSBkb2VzIG5vdCBlbmQgdXAgb3ZlcndyaXRpbmcNCj4gdGhlIGNhY2hlZCBldmVudHMgYmVmb3Jl
IHByb2Nlc3NpbmcgdGhlbSB3aGVuIHRoZSBUSCBnZXRzIGludm9rZWQgbW9yZQ0KPiB0aGFuIG9u
ZSB0aW1lLCByZXR1cm5pbmcgSVJRX0hBTkRMRUQgcmVzdWx0cyBpbiBvY2Nhc2lvbmFsIGlycSBz
dG9ybQ0KPiB3aGVyZSB0aGUgVEggaG9ncyB0aGUgQ1BVLiBUaGUgaXJxIHN0b3JtIGNhbiBiZSBw
cmV2ZW50ZWQgaWYNCj4gSVJRX1dBS0VfVEhSRUFEIGlzIHJldHVybmVkLg0KPiANCj4gZnRyYWNl
IGV2ZW50IHN0dWIgZHVyaW5nIGR3YzMgaXJxIHN0b3JtOg0KPiAgICAgaXJxLzUwNF9kd2MzLTEx
MTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA4NjY6IGlycV9oYW5kbGVyX2V4aXQ6IGlycT0x
NCByZXQ9aGFuZGxlZA0KPiAgICAgaXJxLzUwNF9kd2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4u
LiA3MC4wMDA4NzI6IGlycV9oYW5kbGVyX2VudHJ5OiBpcnE9NTA0IG5hbWU9ZHdjMw0KPiAgICAg
aXJxLzUwNF9kd2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA4NzQ6IGlycV9oYW5k
bGVyX2V4aXQ6IGlycT01MDQgcmV0PWhhbmRsZWQNCj4gICAgIGlycS81MDRfZHdjMy0xMTExICAo
IDExMTEpIFswMDBdIC4uLi4gNzAuMDAwODgxOiBpcnFfaGFuZGxlcl9lbnRyeTogaXJxPTUwNCBu
YW1lPWR3YzMNCj4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAu
MDAwODgzOiBpcnFfaGFuZGxlcl9leGl0OiBpcnE9NTA0IHJldD1oYW5kbGVkDQo+ICAgICBpcnEv
NTA0X2R3YzMtMTExMSAgKCAxMTExKSBbMDAwXSAuLi4uIDcwLjAwMDg4OTogaXJxX2hhbmRsZXJf
ZW50cnk6IGlycT01MDQgbmFtZT1kd2MzDQo+ICAgICBpcnEvNTA0X2R3YzMtMTExMSAgKCAxMTEx
KSBbMDAwXSAuLi4uIDcwLjAwMDg5MjogaXJxX2hhbmRsZXJfZXhpdDogaXJxPTUwNCByZXQ9aGFu
ZGxlZA0KPiAgICAgaXJxLzUwNF9kd2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA4
OTg6IGlycV9oYW5kbGVyX2VudHJ5OiBpcnE9NTA0IG5hbWU9ZHdjMw0KPiAgICAgaXJxLzUwNF9k
d2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA5MDE6IGlycV9oYW5kbGVyX2V4aXQ6
IGlycT01MDQgcmV0PWhhbmRsZWQNCj4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFsw
MDBdIC4uLi4gNzAuMDAwOTA3OiBpcnFfaGFuZGxlcl9lbnRyeTogaXJxPTUwNCBuYW1lPWR3YzMN
Cj4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwOTA5OiBp
cnFfaGFuZGxlcl9leGl0OiBpcnE9NTA0IHJldD1oYW5kbGVkDQo+ICAgICBpcnEvNTA0X2R3YzMt
MTExMSAgKCAxMTExKSBbMDAwXSAuLi4uIDcwLjAwMDkxNTogaXJxX2hhbmRsZXJfZW50cnk6IGly
cT01MDQgbmFtZT1kd2MzDQo+ICAgICBpcnEvNTA0X2R3YzMtMTExMSAgKCAxMTExKSBbMDAwXSAu
Li4uIDcwLjAwMDkxODogaXJxX2hhbmRsZXJfZXhpdDogaXJxPTUwNCByZXQ9aGFuZGxlZA0KPiAg
ICAgaXJxLzUwNF9kd2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA5MjQ6IGlycV9o
YW5kbGVyX2VudHJ5OiBpcnE9NTA0IG5hbWU9ZHdjMw0KPiAgICAgaXJxLzUwNF9kd2MzLTExMTEg
ICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA5Mjc6IGlycV9oYW5kbGVyX2V4aXQ6IGlycT01MDQg
cmV0PWhhbmRsZWQNCj4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4g
NzAuMDAwOTMzOiBpcnFfaGFuZGxlcl9lbnRyeTogaXJxPTUwNCBuYW1lPWR3YzMNCj4gICAgIGly
cS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwOTM1OiBpcnFfaGFuZGxl
cl9leGl0OiBpcnE9NTA0IHJldD1oYW5kbGVkDQo+ICAgICAuLi4uDQo+IA0KPiBDYzogc3RhYmxl
QGtlcm5lbC5vcmcNCj4gRml4ZXM6IGQzMjVhMWRlNDlkNiAoInVzYjogZHdjMzogZ2FkZ2V0OiBQ
cmV2ZW50IGxvc2luZyBldmVudHMgaW4gZXZlbnQgY2FjaGUiKQ0KDQpJIGRvbid0IHRoaW5rIHRo
aXMgc2hvdWxkIGJlIENjIHRvIHN0YWJsZSwgYXQgbGVhc3Qgbm90IHRoZSB3YXkgaXQgaXMNCnJp
Z2h0IG5vdy4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBCYWRocmkgSmFnYW4gU3JpZGhhcmFuIDxiYWRo
cmlAZ29vZ2xlLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgMiAr
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3
YzMvZ2FkZ2V0LmMNCj4gaW5kZXggZDI3YWY2NWViMDhhLi4zNzZhYjc1YWRjNGUgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdj
My9nYWRnZXQuYw0KPiBAQCAtNDUxOSw3ICs0NTE5LDcgQEAgc3RhdGljIGlycXJldHVybl90IGR3
YzNfY2hlY2tfZXZlbnRfYnVmKHN0cnVjdCBkd2MzX2V2ZW50X2J1ZmZlciAqZXZ0KQ0KPiAgCSAq
IGxvc2luZyBldmVudHMuDQo+ICAJICovDQo+ICAJaWYgKGV2dC0+ZmxhZ3MgJiBEV0MzX0VWRU5U
X1BFTkRJTkcpDQo+IC0JCXJldHVybiBJUlFfSEFORExFRDsNCj4gKwkJcmV0dXJuIElSUV9XQUtF
X1RIUkVBRDsNCg0KVGhpcyBsb29rcyBsaWtlIGEgd29ya2Fyb3VuZCB0byB0aGUgaXNzdWUgd2Ug
aGF2ZS4gSGF2ZSB5b3UgdHJpZWQgdG8NCmVuYWJsZSBpbW9kIGluc3RlYWQ/IEl0J3MgdGhlIGZl
YXR1cmUgdG8gaGVscCBhdm9pZCB0aGVzZSBraW5kIG9mIGlzc3VlLg0KDQpUaGFua3MsDQpUaGlu
aA0KDQo+ICANCj4gIAljb3VudCA9IGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0MzX0dFVk5UQ09V
TlQoMCkpOw0KPiAgCWNvdW50ICY9IERXQzNfR0VWTlRDT1VOVF9NQVNLOw0KPiANCj4gYmFzZS1j
b21taXQ6IDcwY2QwNTc2YWEzOWM1NWFhYmQyMjc4NTFjYmEwYzYwMWU4MTFmYjYNCj4gLS0gDQo+
IDIuNDguMS4yNjIuZzg1Y2M5ZjJkMWUtZ29vZw0KPiA=

