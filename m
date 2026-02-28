Return-Path: <linux-usb+bounces-33807-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N6EJjo+ommq1AQAu9opvQ
	(envelope-from <linux-usb+bounces-33807-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 02:00:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB001BF923
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 02:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5FC2307AA5B
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 01:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4397284896;
	Sat, 28 Feb 2026 01:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vgaezp79";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Yrljy39D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MaWO1HJL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738C32820A9
	for <linux-usb@vger.kernel.org>; Sat, 28 Feb 2026 01:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772240436; cv=fail; b=EPVmRsNU3MIulEvxnc2WVoXofD9/d79yZVwnZP013baPFzMdNtJNpBBZbu46AVp/X36DJrsToz2J3UQ3By7dNO8l1vXnrW+syUhgW628o5ujqxKycVMi1zteEkrJvKO8hjKPsmM7//WgZceq80GH9lLojx3nJxy+Xgw8ulfkI/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772240436; c=relaxed/simple;
	bh=xxG1JY2BiK6vy2PMvOTYnuShTiqDCvKHd8nTDSQdEHY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cdh9vZV77WK8VtSh2Mt06ZzLYy6JJlY+54mQUg5s2YAqUwgMTn8No6SrOEWrVMb6YeyNeTUwnyMOebbft5j31mtNLE/3jPF1MHGkqUoJgvAhLbb00G4Tx4WI9Pws0TP5e7Rxl4VgFu5wXk6i5UTrBU/OYOr0rZ1ZwmaUOIE6D0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=vgaezp79; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Yrljy39D; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MaWO1HJL reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RLB6Gu2856349;
	Fri, 27 Feb 2026 17:00:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=xxG1JY2BiK6vy2PMvOTYnuShTiqDCvKHd8nTDSQdEHY=; b=
	vgaezp79DSw5X/7WmCu5K23uYFCJO2V0EBuaoOGVwDlGa3NGD8ikvjjdGtmGrPPV
	WPyLZ5ThqcV/2YxO4QYw/4aFN95Rqdst7y3Z7CCY+80+UheXBSlJy7o8BWMkt8u0
	/nCgkf5GB1jMe0DR6xTt1bZ2SeLMKP8LwNA847pCJz3KYIuugyyHsfdp2arg10Rt
	bWb5yUNtFIUi9aNIEYxdk3KtzSOndiX6/AvukDJ1JYfunU21K3TWf6dULH/Nah8H
	+BE7hDokazqbs1rTcSX29IX40O3+S+VeC688kzIcppeU4AeRZOz/C658thMLdppC
	n+ponCgpiMwLFzZlv0xZqA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4ckgyksjmq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 17:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772240403; bh=xxG1JY2BiK6vy2PMvOTYnuShTiqDCvKHd8nTDSQdEHY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Yrljy39DYXhFFYk81idMjkoMbjzURhNOBvTa9/+jNv4xe6vnsRqaR8+kjairhRDHm
	 w/AAX/bySUGtuKpR2MR7c0Dr7JhyLZxQlHYzlgILWRINoTEmQce5GrmHL7/CrF5Pxy
	 0nZbtK0ARSLd9cmZQ1rbQXpH5uuYKO7f/kG/ScFxm4drHvb0h9nbqPuF0x1xK7U/4M
	 /X4m468FUBlI47qrlV69IVUJGpjtsKN6b3A79ujhaLOO2du6YAw3+h10tFkWHRLaxP
	 PvbZJRAvHI9ezK2hMGeqSgC28zhFfwzuUBoKxNGMzZWO4ilK3HvMEhvGOyBCvG2nSd
	 yYxLP2SKizSBA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 36FDA40343;
	Sat, 28 Feb 2026 01:00:02 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A68A6A006D;
	Sat, 28 Feb 2026 01:00:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=MaWO1HJL;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00105.outbound.protection.outlook.com [40.93.13.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3A3232205C0;
	Sat, 28 Feb 2026 01:00:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdZhOxCOoXTHkwHA+ciNJcE1LS0kbfXuL1AAXev2FG11Fpo5rhS5VICwkw2HHTr8WIzCyiZeMGObzUV4FS+6iXu5de8/eD4A8gq9mlhTKDghY+05b/goOwiXgG9W4GJKKwTRLl8u5qrIfYfLsxRQ09LKQ670xbpHJ64ykyPozbZ0vnJxKx/7YQrgquWPGwyzzdbtroiT/RovQCe6oO5gYIzOMFqj1KcL0N7TSo5FdhUugQkvGd7odhJgnh83p735HN2lmYlpUkIhCS2gVhBBr5U6l9rEqton6sU2XPinlM24H1G9uyS20rMr3b2/9FCFXU+xzSsEEOFXkZXtPZDKkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxG1JY2BiK6vy2PMvOTYnuShTiqDCvKHd8nTDSQdEHY=;
 b=tXMTgiIChFRZWymq6T3hHTN+7DapqaOqoYJNoMtr9WdFavQMkdMUmE9xcwsKrl0JM3JzuWRU49Rt1v6NYvjJtq+KKZfiO7gNDNf5tZSOh1HOKWFkHmOKpC8EZ3J6RAiEB2gn5XdMZ/5QGEzYUO97/0q2a6XwMXI8l1UIzUDpzlR2G67msa9HL8LAHGYxYWq/MbC6l1czI5ksJqzuxa4GyRVEzK2v5fDfoHr3+HImuy3kCsBq+Ay2mOkAKyv/WwttG6GIZr+GWwrgQxmObCts1NVwqJv5FWq6UkMQAvbGNv00cXQrtUzAt6Ci5lz9Sh9Tf4YUfKPyhdJS5Q7c3M2+tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxG1JY2BiK6vy2PMvOTYnuShTiqDCvKHd8nTDSQdEHY=;
 b=MaWO1HJLYC/Qq/yGFT6JVQsyXt3JUTcLrTAZu8Zu3xEgViiJMeJIyo5ByGtD+fppZu2cHOcipYIJE83rN0E0igs3APXw/aPxjZ8opmBII8xF6gTdlY+DYc07allf4r+eQYuZHr9dVnNtqPXl+p5/625XCNfD4NcIKRbo4zT0USw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB6485.namprd12.prod.outlook.com (2603:10b6:8:c6::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16; Sat, 28 Feb 2026 00:59:57 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 00:59:56 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] usb: dwc3: Support USB3340x ULPI PHY high-speed
 negotiation.
Thread-Topic: [PATCH v3 1/1] usb: dwc3: Support USB3340x ULPI PHY high-speed
 negotiation.
Thread-Index: AQHcp+1Q5pzyw6begke12WBfH9akjrWXSzcA
Date: Sat, 28 Feb 2026 00:59:56 +0000
Message-ID: <20260228005948.p4jniuf2zwws3ek5@synopsys.com>
References: <20260227133038.45150-1-ingo.rohloff@lauterbach.com>
 <20260227133038.45150-2-ingo.rohloff@lauterbach.com>
In-Reply-To: <20260227133038.45150-2-ingo.rohloff@lauterbach.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB6485:EE_
x-ms-office365-filtering-correlation-id: 62d00db6-b297-41a7-b3d1-08de7664b070
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 Ng0yG3Zx8KYJfULMIJIWieThWZF+5XY2N+JNUEDTw2VCDJPL37WwQyfUuky6pcJH9nHnfGeGtXQiBD2fC6gHP5wsx7Yvy7/5dicPOFrrYQwcBNiToaP+pk5V4/DjdCnpqHt5mA1VMNN5uIZAzmXn2hnFn8V6BDpPn1v6jQIf5s8I80WhkEAQjb4QFBJNxlBmHhQqPXoEytoyz7oVmZhHDtLyrojE2psX3Yr8BJzFANBQYfoV1/94uN36jrsBp5Yhtd86R+qWxIw06LBxyIlhftbkKvIJTK5DZzv1wxXzJihdeuNnYW8yqVAQUGOsnFCpa7UJmZaMLoHjlpUqww+/mbYAksRkUvSDpjg9YR7ACVyvKN5ZDA1ihPxF8R1fx6AfMy+kzdgdDaD2Lx0JAPjOTE1oQ1FAaNLN9llnce66ZbItH0+unzdzFzObUeRTsUalgrRMivQS96qUK+sE2QLwjCebmSD6/dFz6Cv4CSkT24KIzFRSVzOxTmD9YLMS0TeJarP7Mw270fW9vRgrzp+UiBuUGrUreMBJslJKsFJUHry9FmgZxIM+fN0JEc2Z22ezRbgpMu236lg82xZi6t/yw792m5Rv4beNbZUw7AcJs5NHM4jvZjHANSSfbm4yrGLOz/6ektqqRo0XJ5IAy3HNwQlrjZz1aQky3DohE+HCjQZB/x/nVemOD+hsjfZgX+HiLmD3NBcYeKKNpbiXFDw5wAdyVS0zGowR2z4IsUSeGh8+cn/U07hu1mZMXyCrP26I
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Uk5WMHhyYWUzQVlLcnlGckY0ZHZZVWJhOUhBSHNyeElhWUo2NzVETFFHYy9X?=
 =?utf-8?B?NDhrSEZNZ3NJWlNNcElRdjM2SWM0MWRPTzRyM1BuMlV1MXFWUUFoeGcrNEM0?=
 =?utf-8?B?TkFOZ3BLNWpJODQ5dzk1RDNyWkVMZmtoSWRMUUtKamZkVFBPR0JRd2tMb1l5?=
 =?utf-8?B?aWR4OHpEWkgxd1JKNzk5c1EwaC9PZ0xGTFdsdDB3b3ArY1A3SExRcUdNWFBV?=
 =?utf-8?B?dWdYUnkzbVhpcGlCVXpOdUxLTjNDK2ZCYXBKKzFJM1psUkFndHg0dXZWZlBY?=
 =?utf-8?B?MEEzVE13Qm01TlBYd2dHcmMybUw5QTBzOVRMTDJGWG83bnRwcFN6N2VvSzNH?=
 =?utf-8?B?c1RtVTRuVEo4QitlNGFhVEZybVpCUjNhR3hHd1VheVIxU05iQnNjaCsyWUtl?=
 =?utf-8?B?d2JsQVhOZUxhTXJ4WE1oVXp5QzQyZXlqdjNGanBnOE1IMGs2RU5rVm1YMGJI?=
 =?utf-8?B?MzVBRm03bGFQbzFNNHY1c1hnRXRDK0pHZFlPdXh3MWUrdTAxbHRjbEM0Z1pm?=
 =?utf-8?B?MnpBSHRrcElDQlYrZmFIendtdzdsTkpyR0V2Z1Iyak44MUprVFV0bzJxZzF3?=
 =?utf-8?B?S2Q1cmRPWnQ1RU55dkVIUHNBTkl6djk1SE1LYzdVdWNabE9tNExwWUVGUmhk?=
 =?utf-8?B?b0ZLN202ZnUzZ1Nkd3dhdXFTU001UVpsejVmQVN6UDJJOGlxWVBkWkpLRWJ2?=
 =?utf-8?B?akVubmdVYkppdVJlVEFYRmRLaUxsdVRyYmhLeDV4cU13Mi84L2NELzZ4SEVs?=
 =?utf-8?B?NzRtOHV1R3RNQk0xYmV5SU9nRnZ0WGJ4NFZ1amFmaUQ1ejhIVTdPakh3WG9I?=
 =?utf-8?B?ZHBucnlmWHBvazl6eUlaZVozejVGbVpSWW5yODEwMzRoWlJXUUNWQWVHVS9s?=
 =?utf-8?B?b1RIUVdWZ3dIdVZIZG5vVTRCU3BHWmIzbkJjS3JybUJTZDNHU0ZjbklqbklQ?=
 =?utf-8?B?cEdCYWdFdE10VElKblZ2OG1lYWc1eDFuNFNrbXUvdjkzNi8zenB2YzZKd3Ri?=
 =?utf-8?B?QWc0d0tSNlVpRkNhVW9aRkpsMURkRjdmVFJDTGNzZmhZODJzRWhSVzkvL0JX?=
 =?utf-8?B?eU9uT2I4RnBmSk5GOHhsTDJvbXQ2ZDZBM3BuZW92QmVoZWhld1ZWK2E1RG12?=
 =?utf-8?B?dVNGSDRlUER5UW4xdzJjd3FkYS83YVFMNHZRTEdnb0xNWW5KMkRtVDF3UHB4?=
 =?utf-8?B?enc4L2hIVUNQWlhDYTRHZXBvR2RSMmFrSTNnT1NkKytCbE5oV2d5aHNlVzVT?=
 =?utf-8?B?TW1wMGNXZlFaOE5ZWEZtejhmNTVDa2ovT2lJZzNYc0JwNXlhTkNzd3pwWXRH?=
 =?utf-8?B?emtSZXBqeE9PcDRnU2pTQkl3VEQyWjVjdTAwUjc4RUhMSkF5SjlScTBMRzVj?=
 =?utf-8?B?bkREOU9XaU1YdWM3MUFWRlpOSHhnbW1pSS8yYXU4eGx5V0pkaDNHYVAvNkZX?=
 =?utf-8?B?RlE5UDgreGdpaVlackdIY2JGZHkyVkhYamcvMjl2MHIxSHVJWGZKUkdHMkFR?=
 =?utf-8?B?ZTd6T0lPUDVJRytueE5CVkZmMFlFSm5QYjVGSklkUmhnSnB2b0hnZ2dORG02?=
 =?utf-8?B?SGVOcjQ5M1FLSWJTMjhFVzBhclFGODR6aUFGMFJrckRqTFdoVkliVGZ6c3dM?=
 =?utf-8?B?KzhCbFdoWDF0RDBzbndVV0lnVCt6aHlGQTZYUkoya3BURWIvSTBEdmpVWFRP?=
 =?utf-8?B?WWRWdGc3ekNHeExjQ3d5aVI4M2lBZ1VJVzlZNDFTZVc2MDZ0bnB3Y2RsRUlY?=
 =?utf-8?B?T3dlK094UXp3SWQ5dGZpR3VrR2xqekVXU2VYWVFLUDN3SFZYUllSVlh3Yy9M?=
 =?utf-8?B?eS90VGhPZEgydEhUdEFWOG1XK0JBb0ZsUzYrbHUzVFJRNkVGZ0FNaFVMTW1Q?=
 =?utf-8?B?MUZxZlc5TDh2TDc3Q1VWc0F4YWxsTHlhMjNZUUVaRmxhc05NWUVrUnN4eGVZ?=
 =?utf-8?B?VVlENkFkSys3dGJxNmZ2NEY1UmhlcHMwamdCczBUK3pNTnBDdUlmRk1OWVlq?=
 =?utf-8?B?Y25NU3FFV2cwNE45cFgya25SdXpUeWdCQ3I4dU50MlpiSThGbXhhZzQ0WFhy?=
 =?utf-8?B?b2ovSlRyeFEzRFFCUXYwSVVFUkZDUWsybWhha3hkejMxV3A2T3JmaHBoN1pO?=
 =?utf-8?B?eFJ1YmlqQ0ROQitXNHJIZGVxcHgvaE44Qm0vMC8vWUpVTmE5NjdYQU5XVEVJ?=
 =?utf-8?B?aDQ1Yyt0OXU0cG0rTDRFN2IyR0tJN1BhSjY5ZHd0ZFlyMW5kUmt3a09KYk1y?=
 =?utf-8?B?cWdLZW1aNHFQWmVLaGx2TWIzMkFkT3BzS3Z4dnA0d0RHRExnbGJ6cXpnSWhD?=
 =?utf-8?B?SUlNRVpRbnJuL1JHbW9aTWpvZzZOUWZ3MzlUdVFHMW96bENvWE5Fdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46F6E3018FA60646A827DC48A8B6038D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eQXestiAxIFbLnq+PtsPd6ojoUHcak1wTMcfJ5ak4Q5rIgkqXwNetdX73Ewvxa0up5ui/XAS5xni0Vl3g9jzZj3xEz7uY/g9SxrfeFh2I9EkeVjMHf4foViGwL9YuBz2Ea4Ygwrg5mQMWh2dciy4N1ksAlOIDZF4/IG4HCAFMY+DHYhaRRYUtyOcDmtRcyXKrbb2W2+hZ9/uLI/0QwEbMtruyPmupwlxwg2YZRab167Bz0esnev6KDeUedFTT7P6WqzAiXeyF2IeQMHXdIbIlzHFB6gOZ7v1aLbxOq2u+ksI33dd4345DykI/N0tmnwGtI9q+UGWEBJancWHqMWC8FD5dJHCnaPWS9sARlbGBhcBIyCwOw2qE9J0n4V0eZftWfBQbC8pEECEFeFGVZV2YaTEO0FOZuFtlAFVDx9Ubpyi7fFGzdFVl19Zfn3PMOLwVa7GU++EnmfZuRGPDtR1oHnCiS1lSIVESlQ9dD5z9gU7IH+FQArxcAALcIBlRosAab1AhziZCl0EBfeT7Vcxitod1jHZpBQCF3hRCA+ATgfNpTirFCKVQFz/ffY0KX1xt9Wvi8gguZqzSV9EVM1VL9hCfdwvGxuONvL0UBdCZE5VLsAHWWgx7sA4qN+2GfBQW/cP7U3UV6uy6GdhQfy6Bg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d00db6-b297-41a7-b3d1-08de7664b070
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2026 00:59:56.1770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qxyVo7uRglWN/xmBCoQzy6UyMAozz2OG0XjBPzrN/7uo2mH9Aevcb3nXdQfFrtDF4UiMAx+Q4wcRB6GLXVtfQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6485
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDAwNyBTYWx0ZWRfXwZK6a+BmGqkU
 KwArTgt2wDW0f72hOU+0XNy/tGZ3EW+o+xmSnBcwfL8jzEVnRKgA95M/cb/cyrSrh7ybxIQL6oW
 BdUW6ztDokXL1+sX3RjvzbWRSa8tqBuGrBB4/rsvUGKqdg/9/oWh216NIjyknPczX2nsAm4n9Y7
 QiQQPvbuKNmRggYzWR9i7lj9/V1ORwOFywOcenWqRetblXrCb0JGtOaS41THKVa8fXzAl/PBJhj
 148qYNYwWqw0qwdXcAYUi8CrpcpsvK0nFmD9rKqvXoiJitiN3ZPUh4e8Q3z4OpKL8AhKjSJIYWu
 0iT+1yxqwD9agInAxW62BXIRT5Wcx23bDiH0hly1ThOr5g71xcHv/hOQwq0BDdLLUANu7YTvnP5
 mP63NnvyFPwJ2DK62qEc/R98QyO+gQXl0M+4H8i6yxyuXEMQYSYESiAwlSkvdHjmo4TaBMtQkRu
 WZnz2xhVxoCzTYvhzpw==
X-Proofpoint-GUID: yHJrw5X7oM5rV9xCiy03VQXyt19ioigN
X-Proofpoint-ORIG-GUID: yHJrw5X7oM5rV9xCiy03VQXyt19ioigN
X-Authority-Analysis: v=2.4 cv=fubRpV4f c=1 sm=1 tr=0 ts=69a23e13 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=XYAwZIGsAAAA:8 a=TZ5gh4L_AAAA:8 a=JSe3Hgbxt_TPIYlOVhkA:9 a=QEXdDO2ut3YA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22 a=2pkA1AvaAoXcNePaGM_w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602280007
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[bounces-33807-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EDB001BF923
X-Rspamd-Action: no action

T24gRnJpLCBGZWIgMjcsIDIwMjYsIEluZ28gUm9obG9mZiB3cm90ZToNCj4gVGhlIE1pY3JvY2hp
cCBVU0IzMzQweCBVTFBJIFBIWSByZXF1aXJlcyBhIGRlbGF5IHdoZW4gc3dpdGNoaW5nIHRvIHRo
ZQ0KPiBoaWdoLXNwZWVkIHRyYW5zbWl0dGVyLiBTZWU6DQo+ICAgICBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cDovL3d3MS5taWNyb2NoaXAuY29tL2Rvd25sb2Fkcy9lbi9EZXZpY2VE
b2MvODAwMDA2NDVBLnBkZl9fOyEhQTRGMlI5R19wZyFjdUFaamlVWnlHNTFXTGlmWkVSb05DUXNx
WndxUzVKcUhfcXNjazBsOGpBeEJVdWFhckVINUNvdldWQzZXSzdsdGFtSHhhdmNRekhhZVV4WDJL
UzRJUG5iMEtjTHMwVSQgDQo+ICAgICBNb2R1bGUgMiAiRGV2aWNlIEVudW1lcmF0aW9uIEZhaWx1
cmUgd2l0aCBMaW5rIElQIFN5c3RlbXMiDQo+IA0KPiBGb3IgZGV0YWlscyBvbiB0aGUgYmVoYXZp
b3IgYW5kIGZpeCwgcmVmZXIgdG8gdGhlIEFNRCAoZm9ybWVybHkgWGlsaW54KQ0KPiBmb3J1bSBw
b3N0OiAiVVNCIHN0dWNrIGluIGZ1bGwgc3BlZWQgbW9kZSB3aXRoIFVTQjMzNDAgVUxQSSBQSFks
IFp5bnFNUC4iDQo+IA0KPiBUaGlzIHBhdGNoIHVzZXMgdGhlIFVTQiBQSFkgVmVuZG9yLUlEIGFu
ZCBQcm9kdWN0LUlEIHRvIGRldGVjdCB0aGUNCj4gVVNCMzM0MCBQSFkgYW5kIHRoZW4gYXBwbGll
cyB0aGUgbmVjZXNzYXJ5IGZpeCBpZiB0aGlzIFBIWSBpcyBmb3VuZC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEluZ28gUm9obG9mZiA8aW5nby5yb2hsb2ZmQGxhdXRlcmJhY2guY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jIHwgMTYgKysrKysrKysrKysrKysrDQo+ICBkcml2
ZXJzL3VzYi9kd2MzL2NvcmUuaCB8ICA0ICsrKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvdWxwaS5j
IHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDMgZmls
ZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXggY2FjYzRl
YzlmN2NlLi5jYzE4MTg2MzVlYjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IEBAIC03ODIsNiArNzgyLDIw
IEBAIHN0YXRpYyBpbnQgZHdjM19oc19waHlfc2V0dXAoc3RydWN0IGR3YzMgKmR3YywgaW50IGlu
ZGV4KQ0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMgdm9pZCBkd2MzX2hzX2Fw
cGx5X3VscGlfcXVpcmtzKHN0cnVjdCBkd2MzICpkd2MpDQo+ICt7DQo+ICsJaWYgKGR3Yy0+ZW5h
YmxlX3VzYjJfdHJhbnNjZWl2ZXJfZGVsYXkpIHsNCj4gKwkJaW50IGluZGV4Ow0KPiArCQl1MzIg
cmVnOw0KPiArDQo+ICsJCWZvciAoaW5kZXggPSAwOyBpbmRleCA8IGR3Yy0+bnVtX3VzYjJfcG9y
dHM7IGluZGV4KyspIHsNCj4gKwkJCXJlZyA9IGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0MzX0dV
U0IyUEhZQ0ZHKGluZGV4KSk7DQo+ICsJCQlyZWcgfD0gRFdDM19HVVNCMlBIWUNGR19YQ1ZSRExZ
Ow0KPiArCQkJZHdjM193cml0ZWwoZHdjLT5yZWdzLCBEV0MzX0dVU0IyUEhZQ0ZHKGluZGV4KSwg
cmVnKTsNCj4gKwkJfQ0KPiArCX0NCg0KVGhpcyBzaG91bGQgYmUgcGxhY2VkIGluIGR3YzNfdWxw
aV9pbml0KCkgb3IgZHdjM191bHBpX2RldGVjdF9xdWlya3MoKS4NCg0KPiArfQ0KPiArDQo+ICAv
KioNCj4gICAqIGR3YzNfcGh5X3NldHVwIC0gQ29uZmlndXJlIFVTQiBQSFkgSW50ZXJmYWNlIG9m
IERXQzMgQ29yZQ0KPiAgICogQGR3YzogUG9pbnRlciB0byBvdXIgY29udHJvbGxlciBjb250ZXh0
IHN0cnVjdHVyZQ0KPiBAQCAtMTM2MSw2ICsxMzc1LDggQEAgaW50IGR3YzNfY29yZV9pbml0KHN0
cnVjdCBkd2MzICpkd2MpDQo+ICAJCQlyZXR1cm4gcmV0Ow0KPiAgCQl9DQo+ICAJCWR3Yy0+dWxw
aV9yZWFkeSA9IHRydWU7DQo+ICsNCj4gKwkJZHdjM19oc19hcHBseV91bHBpX3F1aXJrcyhkd2Mp
Ow0KPiAgCX0NCj4gIA0KPiAgCWlmICghZHdjLT5waHlzX3JlYWR5KSB7DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IGlu
ZGV4IDY3YmNjOGRjY2M4OS4uOTRhMmE1NTUxOGM5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBAQCAtMzAy
LDYgKzMwMiw3IEBADQo+ICAjZGVmaW5lIERXQzNfR1VTQjJQSFlDRkdfU1VTUEhZCQlCSVQoNikN
Cj4gICNkZWZpbmUgRFdDM19HVVNCMlBIWUNGR19VTFBJX1VUTUkJQklUKDQpDQo+ICAjZGVmaW5l
IERXQzNfR1VTQjJQSFlDRkdfRU5CTFNMUE0JQklUKDgpDQo+ICsjZGVmaW5lIERXQzNfR1VTQjJQ
SFlDRkdfWENWUkRMWSAgICAgICAgQklUKDkpDQoNClVzZSB0YWIgZm9yIHNwYWNpbmcuDQoNCj4g
ICNkZWZpbmUgRFdDM19HVVNCMlBIWUNGR19QSFlJRihuKQkobiA8PCAzKQ0KPiAgI2RlZmluZSBE
V0MzX0dVU0IyUEhZQ0ZHX1BIWUlGX01BU0sJRFdDM19HVVNCMlBIWUNGR19QSFlJRigxKQ0KPiAg
I2RlZmluZSBEV0MzX0dVU0IyUEhZQ0ZHX1VTQlRSRFRJTShuKQkobiA8PCAxMCkNCj4gQEAgLTEx
NjMsNiArMTE2NCw4IEBAIHN0cnVjdCBkd2MzX2dsdWVfb3BzIHsNCj4gICAqCTMJLSBSZXNlcnZl
ZA0KPiAgICogQGRpc19tZXRhc3RhYmlsaXR5X3F1aXJrOiBzZXQgdG8gZGlzYWJsZSBtZXRhc3Rh
YmlsaXR5IHF1aXJrLg0KPiAgICogQGRpc19zcGxpdF9xdWlyazogc2V0IHRvIGRpc2FibGUgc3Bs
aXQgYm91bmRhcnkuDQo+ICsgKiBAZW5hYmxlX3VzYjJfdHJhbnNjZWl2ZXJfZGVsYXk6IFNldCB0
byBpbnNlcnQgYSBkZWxheSBiZWZvcmUgdGhlDQo+ICsgKiAgICAgICAgICAgICAgICAgIGFzc2Vy
dGlvbiBvZiB0aGUgVHhWYWxpZCBzaWduYWwgZHVyaW5nIGEgSFMgQ2hpcnAuDQo+ICAgKiBAc3lz
X3dha2V1cDogc2V0IGlmIHRoZSBkZXZpY2UgbWF5IGRvIHN5c3RlbSB3YWtldXAuDQo+ICAgKiBA
d2FrZXVwX2NvbmZpZ3VyZWQ6IHNldCBpZiB0aGUgZGV2aWNlIGlzIGNvbmZpZ3VyZWQgZm9yIHJl
bW90ZSB3YWtldXAuDQo+ICAgKiBAc3VzcGVuZGVkOiBzZXQgdG8gdHJhY2sgc3VzcGVuZCBldmVu
dCBkdWUgdG8gVTMvTDIuDQo+IEBAIC0xNDA2LDYgKzE0MDksNyBAQCBzdHJ1Y3QgZHdjMyB7DQo+
ICAJdW5zaWduZWQJCWRpc19tZXRhc3RhYmlsaXR5X3F1aXJrOjE7DQo+ICANCj4gIAl1bnNpZ25l
ZAkJZGlzX3NwbGl0X3F1aXJrOjE7DQo+ICsJdW5zaWduZWQJCWVuYWJsZV91c2IyX3RyYW5zY2Vp
dmVyX2RlbGF5OjE7DQo+ICAJdW5zaWduZWQJCWFzeW5jX2NhbGxiYWNrczoxOw0KPiAgCXVuc2ln
bmVkCQlzeXNfd2FrZXVwOjE7DQo+ICAJdW5zaWduZWQJCXdha2V1cF9jb25maWd1cmVkOjE7DQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL3VscGkuYyBiL2RyaXZlcnMvdXNiL2R3YzMv
dWxwaS5jDQo+IGluZGV4IDU3ZGFhZDE1ZjUwMi4uZTFhMWE1OGY4NjJjIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3VzYi9kd2MzL3VscGkuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL3VscGku
Yw0KPiBAQCAtMTQsNiArMTQsOCBAQA0KPiAgI2luY2x1ZGUgImNvcmUuaCINCj4gICNpbmNsdWRl
ICJpby5oIg0KPiAgDQo+ICsjZGVmaW5lIFVTQl9WRU5ET1JfTUlDUk9DSElQIDB4MDQyNA0KPiAr
DQo+ICAjZGVmaW5lIERXQzNfVUxQSV9BRERSKGEpIFwNCj4gIAkJKChhID49IFVMUElfRVhUX1ZF
TkRPUl9TUEVDSUZJQykgPyBcDQo+ICAJCURXQzNfR1VTQjJQSFlBQ0NfQUREUihVTFBJX0FDQ0VT
U19FWFRFTkRFRCkgfCBcDQo+IEBAIC04Myw2ICs4NSw0NSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHVscGlfb3BzIGR3YzNfdWxwaV9vcHMgPSB7DQo+ICAJLndyaXRlID0gZHdjM191bHBpX3dyaXRl
LA0KPiAgfTsNCj4gIA0KPiArc3RhdGljIHZvaWQgZHdjM191bHBpX2RldGVjdF9xdWlya3Moc3Ry
dWN0IGR3YzMgKmR3YykNCg0KQ2FuIHdlIHJlbmFtZSB0aGlzIHRvIGR3YzNfdWxwaV9zZXR1cCgp
IG9yIGR3YzNfdWxwaV9jb25maWcoKT8NCg0KSSB3b3VsZCBhdm9pZCB0byB1c2UgdGhlIHRlcm0g
InF1aXJrIiwgaXQncyB0byBpbmRpY2F0ZSBzb21ldGhpbmcncw0KYnJva2VuLiBJbiB5b3VyIGNh
c2UsIEkgdGhpbmsgaXQncyBtb3JlIGNvcnJlY3QgdG8gbm90ZSB0aGF0IGl0IGp1c3QNCmEgY29u
ZmlnIHNwZWNpZmljIHRvIHlvdXIgY2hpcC4NCg0KPiArew0KPiArCWludCByZXQ7DQo+ICsJdTE2
IHZlbmRvcl9pZCwgcHJvZHVjdF9pZDsNCg0KSnVzdCBtaW5vciBmb3JtYXR0aW5nIHN0eWxlIHJl
cXVlc3Q6IENhbiB3ZSBkZWNsYXJlIHZhcmlhYmxlcyBpbg0Kc2VwYXJhdGUgbGluZXMgYW5kIGtl
ZXAgdGhlbSBpbiByZXZlcnNlZCBjaHJpc3RtYXMgdHJlZSBzdHlsZT8NCg0KPiArDQo+ICsJLyog
VGVzdCB0aGUgaW50ZXJmYWNlICovDQo+ICsJcmV0ID0gZHdjM191bHBpX3dyaXRlKGR3Yy0+ZGV2
LCBVTFBJX1NDUkFUQ0gsIDB4YWEpOw0KPiArCWlmIChyZXQgPCAwKQ0KPiArCQlyZXR1cm47DQo+
ICsNCj4gKwlyZXQgPSBkd2MzX3VscGlfcmVhZChkd2MtPmRldiwgVUxQSV9TQ1JBVENIKTsNCj4g
KwlpZiAocmV0IDwgMCkNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJaWYgKHJldCAhPSAweGFhKQ0K
PiArCQlyZXR1cm47DQo+ICsNCj4gKwl2ZW5kb3JfaWQgPSBkd2MzX3VscGlfcmVhZChkd2MtPmRl
diwgVUxQSV9WRU5ET1JfSURfTE9XKTsNCj4gKwl2ZW5kb3JfaWQgfD0gZHdjM191bHBpX3JlYWQo
ZHdjLT5kZXYsIFVMUElfVkVORE9SX0lEX0hJR0gpIDw8IDg7DQo+ICsNCj4gKwlwcm9kdWN0X2lk
ID0gZHdjM191bHBpX3JlYWQoZHdjLT5kZXYsIFVMUElfUFJPRFVDVF9JRF9MT1cpOw0KPiArCXBy
b2R1Y3RfaWQgfD0gZHdjM191bHBpX3JlYWQoZHdjLT5kZXYsIFVMUElfUFJPRFVDVF9JRF9ISUdI
KSA8PCA4Ow0KPiArDQo+ICsJcHJfaW5mbygNCg0KVXNlIGRldl9kZWJ1ZygpLiBOb3JtYWwgdXNl
cnMgcHJvYmFibHkgZG9uJ3QgbmVlZCB0byBrbm93IHRoaXMgaW5mby4NCg0KPiArCQkiZHdjM191
bHBpOiBWZW5kb3JJRCAweCUwNHgsIFByb2R1Y3RJRCAweCUwNHhcbiIsDQo+ICsJCXZlbmRvcl9p
ZCwgcHJvZHVjdF9pZA0KPiArCSk7DQo+ICsJc3dpdGNoICh2ZW5kb3JfaWQpIHsNCj4gKwljYXNl
IFVTQl9WRU5ET1JfTUlDUk9DSElQOg0KPiArCQlzd2l0Y2ggKHByb2R1Y3RfaWQpIHsNCj4gKwkJ
Y2FzZSAweDAwMDk6DQo+ICsJCQkvKiBNaWNyb2NoaXAgVVNCMzM0MCBVTFBJIFBIWSAqLw0KPiAr
CQkJZHdjLT5lbmFibGVfdXNiMl90cmFuc2NlaXZlcl9kZWxheSA9IHRydWU7DQoNCkRvIHdlIHJl
YWxseSBuZWVkIHRoaXMgZmllbGQgZW5hYmxlX3VzYjJfdHJhbnNjZWl2ZXJfZGVsYXkgYW55bW9y
ZSBub3cNCnRoYXQgd2UgaGF2ZSB0aGlzIGNoZWNrIGJhc2Ugb24gdGhlIFByb2R1Y3RJRD8NCg0K
PiArCQkJYnJlYWs7DQo+ICsJCX0NCj4gKwkJYnJlYWs7DQo+ICsJfQ0KPiArfQ0KPiArDQo+ICBp
bnQgZHdjM191bHBpX2luaXQoc3RydWN0IGR3YzMgKmR3YykNCj4gIHsNCj4gIAkvKiBSZWdpc3Rl
ciB0aGUgaW50ZXJmYWNlICovDQo+IEBAIC05Miw2ICsxMzMsOCBAQCBpbnQgZHdjM191bHBpX2lu
aXQoc3RydWN0IGR3YzMgKmR3YykNCj4gIAkJcmV0dXJuIFBUUl9FUlIoZHdjLT51bHBpKTsNCj4g
IAl9DQo+ICANCj4gKwlkd2MzX3VscGlfZGV0ZWN0X3F1aXJrcyhkd2MpOw0KPiArDQo+ICAJcmV0
dXJuIDA7DQo+ICB9DQo+ICANCj4gLS0gDQo+IDIuNTIuMA0KPiANCg0KVGhpcyBpcyBhIG11Y2gg
YmV0dGVyIHNvbHV0aW9uIHRoYW4gYmVmb3JlIQ0KDQpUaGFua3MsDQpUaGluaA==

