Return-Path: <linux-usb+bounces-22483-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 636B6A79824
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 00:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67C933AD9FD
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 22:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8541F4CAB;
	Wed,  2 Apr 2025 22:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="madBsHR2";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cgTJMgpY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YdL1Vqyb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3DB126F0A
	for <linux-usb@vger.kernel.org>; Wed,  2 Apr 2025 22:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743632513; cv=fail; b=nJhiSKZWq1jeYytSY4Zv+yhqBDUqvEpR3IQ+aI5Aks9BbpgpavuQLBKARz4YywpQaAPxFIflT7CADKHCn3QrPpL69tiKo2HKmsofiDfgZZaqFXV4y+UmIPP4kIqbpgpccujqbBwSfEESVIwdHTQ4uSs7VU6lo9UO4pL8oRYVB4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743632513; c=relaxed/simple;
	bh=4bVpZP3gVjXYeZGNKcsiCf/L95HxeWTWWDurOAZEoV4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tySn9rTVIQYW3Hknt5ixKWxkwFIGk7W/XR0Nc8X4jrVpNbPyhySdD0bKBebrUqoxdyI2tA9hGsv4Jew76B8DGWVwmDhiQfGyLNPzZI0foa7cO/jLVQfCFY0ont9tu39mD2YiLYPRo1Ot6iuWVQr1zlN1qiVx0EN0mlUDNdS2ubM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=madBsHR2; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cgTJMgpY; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YdL1Vqyb reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532HUjEf028256;
	Wed, 2 Apr 2025 15:21:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=4bVpZP3gVjXYeZGNKcsiCf/L95HxeWTWWDurOAZEoV4=; b=
	madBsHR2OvkC0Kx3KF4XQNKTjss7e2XncWKuDkK7HDdv5nGAaoKC9cUccO2LZ/hY
	4jA9IQP1UBv2+ZRF3M2d1ud6mwuFMf/JlSGp0Fg37cqQSgfCvEojPj5Ungncg4kV
	pkDiX5rW9WjAr1Nr8LVg8E53a2yyKBNZOwey6MAJxSXGYyJt7cgCFhko4plYzry4
	9h0k+OgjdJosGBf3DjyeW3Aij9K/Z7g2gbxvG4Er50jjMFpmO2bOFzgBAzI4Lhiw
	8oFPHW/sqCgWY0awE+s3ttWP+vmAgaoGqrmETXzR1I27v4AF+b/sKkmDw8W2f3H7
	wRU0J/qNXihLSsLnS5Cy3w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45s5egaqpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 15:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1743632499; bh=4bVpZP3gVjXYeZGNKcsiCf/L95HxeWTWWDurOAZEoV4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cgTJMgpYdpjdTTP2cAz+pHTEcMF82/VbSfwyB1RezLQER5nrD0suEUyYovJybPEHX
	 8BN7Ac/rzjL/m0lkuiL/mxLwd0kyjR3oKWvZooTjZpL1qtSjguitSMoZy6XS2v/dJq
	 O71oBDff50fHKDxnTUjw25fDttDa/WeE106rqpP2DuiKfj+J/dg3I09cSInoajWZdE
	 PK1XYfn72NK+vvUK8fIFQuzKA3g2BnGbp/3jK6opn8GZRgJOquwTmEPTXOUGUeDwCd
	 vuK2UpqJVsMjzjwhojoEEDuL2G4kkJH2WXV2NKMYUHJBFPPkEx1M394X9d5jv/sGqS
	 AhXsGVoH09czQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 833E24012B;
	Wed,  2 Apr 2025 22:21:39 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 02343A006E;
	Wed,  2 Apr 2025 22:21:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YdL1Vqyb;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id F256B4021B;
	Wed,  2 Apr 2025 22:21:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgwRtTRF5qO40H3Je82u6klZ8NIfq+oe8/VtzFRz6L66w/557atyUpD3Sws+X9EGKPDPlUqCh9KUJcHYocHD2asPko5eVCb1z7Owl7b9NYfHqkf1bQFrXXgb3snotu67DlN3N/I7L6Em/ucQTi3CcufOxDZLY8Lb2eejJNO6V5pr02sJXdGffVvtB79STU4P+439ljHSi/ruGN+ZOfKAbyrTevbA25IkpRXCb55mCmQwytWGe2fKHgVtWkqp6mATshzJaWkGLWC1LhkIDoxT0eAFM1EJ98ikoB43jbH0cKaOrb3+wc5kJknN13Kz/Ogh4/tHzLK+Z0h/fHeBurpCpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bVpZP3gVjXYeZGNKcsiCf/L95HxeWTWWDurOAZEoV4=;
 b=fGBY1CkzNMrofjGd5YroaV/OnzssumJN33gWTZUIRTfwTybMsxVW1W9ssQcs5Hd5mESFzyWPYWHg7KM1PqwRcV+0Tq18ynL7LGYT9aZDFgUsus5DdcfhsoQF4wdmvo0JtAobHgToZAluuDaDglMGk655Ta3RpmYXEtuIFGnyVpheafcMqzLJDLG+xr6hothNmsUZU6bVT+4Ew+oRX1QYort7ayJEKpCapL+9rY+Qe5JRt9ljPI1eAmMqtnU5WN4bMBEibIhAgmfnaAK0dil/IBuOxXuTM8JSbfgiAUNHHanJpf1oeMSHIXhaVXRGOUVxIEWpkOZBh45RQKza22638g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bVpZP3gVjXYeZGNKcsiCf/L95HxeWTWWDurOAZEoV4=;
 b=YdL1Vqybuu4fZ+bLxj7XW5clzwySS3yfqoFwBvMSLgufX5aPTCWH05dmmMoKAam6l28Ze8SYRV7I9efy5k5tCgCpMlhWbCjJsBg80VZRoIWvLfVq7yH5gWzPlSoijxqY/3PgSpdLn5VTZvh2hEbVhTVXXYQ8ZC7KlPwWtK4B3a4=
Received: from DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) by
 SJ2PR12MB8689.namprd12.prod.outlook.com (2603:10b6:a03:53d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 22:21:33 +0000
Received: from DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::e2e0:bc6d:711f:eeb]) by DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::e2e0:bc6d:711f:eeb%7]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 22:21:33 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Frode Isaksen <fisaksen@baylibre.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Frode Isaksen <frode@meta.com>
Subject: Re: [PATCH] usb: dwc3: ep0: prevent dwc3_request from being queued
 twice
Thread-Topic: [PATCH] usb: dwc3: ep0: prevent dwc3_request from being queued
 twice
Thread-Index: AQHbnyLuqf9Hu8uhE0ul0JwT/TVjubOPgwsAgADYZoCAAKFwAA==
Date: Wed, 2 Apr 2025 22:21:33 +0000
Message-ID: <20250402222128.2soczlkfwonz7r3p@synopsys.com>
References: <20250327141630.2085029-1-fisaksen@baylibre.com>
 <20250401234908.npkn5h3vdyefkvxr@synopsys.com>
 <26644fc1-98c1-4443-9809-b7e4d6cec2e3@baylibre.com>
In-Reply-To: <26644fc1-98c1-4443-9809-b7e4d6cec2e3@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5984:EE_|SJ2PR12MB8689:EE_
x-ms-office365-filtering-correlation-id: 4040730c-cd7f-45d7-dddc-08dd7234b98f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q0dXbEVNSDhPMSt6UkFPejNVbGNiSHBiR2RWZGpLVzRoeUdKZEJOK1JpY2ZS?=
 =?utf-8?B?OTRxdGVhUXdKdHJ6YkMrb25mYVJKdjkyaUNQMFphWkdSODdZWVh0UXh3YlNz?=
 =?utf-8?B?YVdNZk8wSkdNNXFtOEp1VThnM0FYdktuS2JqeUhQTitqYkh6ZEhhZ2JkWUlF?=
 =?utf-8?B?YlZSclprQUNiQU15T1M1SU9HZUFNL2NSNTY5T0I3MVdpbnVXcXlHRGQvVFFF?=
 =?utf-8?B?R1YwMGNoYjNqK24wTUNBVDFEVndKbmFxY3RDMWNxbmUyWmN3VVJ2N3NhWDFF?=
 =?utf-8?B?OEVzRW1lanFRanFuMnZ4dGR5eWRtYTI2M2dnSW5VajhwMU5YeDkzZjdZc05I?=
 =?utf-8?B?b0tpcWdxVW5XM1NKOTRST2tzYllXckpTNjNOdmx3QlJoTnFvbG15M0tqbTVx?=
 =?utf-8?B?ZVI2enYwSTZmMVpQL2Y3Tit2Z2FCWUdoZHRjZGJ3NDBXRGVKZzMxRHdJWWxR?=
 =?utf-8?B?NHBmMU1DSU9jTVJzSzhXcHZqTTUrWlJBdytmQWhYQ0dpVDhlNFdKMzFnSWZv?=
 =?utf-8?B?bHYyQk81V3RyN04ySEpQOHVnTmlocWhBa01XakVSb0lGRU5GWE90dmVwUWJr?=
 =?utf-8?B?ZzNoN3phMTlhd1JVdEpZbytyVFhmdnZiZDRFdVZnYVJqRjExYXNhWmYzWXcw?=
 =?utf-8?B?bFQrTk5VZ2NMMjQ5d09Ba1o1UHQ2SHZNc2p4KzdYQVJ3R1pMRzYxZGkvQkF1?=
 =?utf-8?B?UitvRUFIcDIyaGloallGOGhzandYbWNqZjBjd2JuVHBsQ1d1TDBpWDE2SjUw?=
 =?utf-8?B?Q0hIK1FEVW02YVNybCtzVmsvbExxQ2owcXpmWFhiK0h6endUWnRtS00zL1Fm?=
 =?utf-8?B?Ni9hOFFJSmJ2YnlzYVc3L2R1QWlFVTljOFoyOGRDUUIwRVFqd0d4UE5iOFE4?=
 =?utf-8?B?ZzdTdFZiOGpOYWhDWlhWd0JNRE1qMjZQME5IVlFyVStnV0dVaWFVVDQyQVBY?=
 =?utf-8?B?ZDh1algrVGxTMFhvYWRjdEtBak1LOUdYLzhGcVJ5RmpvWDFpaUdySGtSVSsw?=
 =?utf-8?B?MitZczV6bUpwYTFTaytnc00ybmU5ZFhFdUJKcVRUTTR6UDNzSko2MXRMWEU1?=
 =?utf-8?B?SUVza05Rbzk4T3NFZWZyQXN3bDdDbmc5cU5taEpjNUtsMnNaQkZBaFhxVXdj?=
 =?utf-8?B?NXlXUi9rZ2IvYVA4ZzRoVlM2NVJDNC8zbmhPY0FhdHdKZG1rMmlCZ242S3ZF?=
 =?utf-8?B?dHVmNFFmZ2JsUzA0am1IVWJXSTgxaUdCblJFNXg4TFN1RUNDMXA3RGJTMEpC?=
 =?utf-8?B?RkxscmR1Z1Q0VlYvSnhJWWs2QklRZkVLQjRaS1RETjA3Qi9TWWZQcDYyeWFY?=
 =?utf-8?B?cko3djJ3UTBpeFMvUzA0OFpDczZUYUZ3TmpQd3E2bkFRdTFrOWh5MVk5WmZL?=
 =?utf-8?B?L0ppV1lZdVU4K3VJakxlaVlFa0dGbVg4cGtKQzZua2V2cEc1YTZDV0hjTXFW?=
 =?utf-8?B?ZFJzNVFyQnU5TzhXbXJzaUdCTTNxNXFUSmZYS1U2dkJxME5CVDROaXU0bU1B?=
 =?utf-8?B?bXJUeVY1WVZoeUhvRlRrL1FUWlpuSFJTUmw2ekJnbWZ0VVhlWUU3Y3ErWG94?=
 =?utf-8?B?M0JXZ3hVWEtuQmIwa1Vybm16SElTazVoRGV1ZGk0a2J2aEZqRUxCWmhlMXJX?=
 =?utf-8?B?L3NwYllhcWp2dWQzQ3FDazU5cEtENGFBWTJRRWpmcyswQ3hkY2ovT2lvSjVX?=
 =?utf-8?B?bFlwZmp6d2ZDdy92WW04bHdyWmprZmxPNUtPejVvN1dXbVhFT0c4eTR2bEpp?=
 =?utf-8?B?SWxMZ1hjTmZzTGQrVlMwbGtvYUxMODJCQlRycWZyOS9zM2phcGd4ZFFFVXBp?=
 =?utf-8?B?c21DNUgreldkOFZ6RkkwOWIyVWJNakRqU3JycVUwYkxsT3haaVBxR3hjZ29L?=
 =?utf-8?B?TFMzL3FjVEo3LzVOT1F4bDdmOU1FWUlxUGMvV1lPM1BMNk9QL2d3T2trekNw?=
 =?utf-8?Q?7uRyNsMPuW8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5984.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L0hZdzVTaHJYTGRQcUpTTnlrVWJPMzJFem5EZG5pZy9DVHBFK3dGTmUzY0pD?=
 =?utf-8?B?TWNlL0pjRGFhNmZPWVNCcGIrc1ovWVpYWUpJc0F4cWtZL3lSenVoTnY1U0F1?=
 =?utf-8?B?SmJLK0hwdVJQYW5YOWpMTmlvcVNiN01CdWRGdzBOOWw4ZzFac2M2VnBlR25v?=
 =?utf-8?B?Y1h0QlNpTTJ4bVRrNTBUL3MrOEptb0NjTkhsYjMvZFFuZkdGSEQwVzMvRGZx?=
 =?utf-8?B?d3NTNFlmWEI4Y2ZlQWtRbm1LTTN1dmRlMTRuMG5hYlBmU0hjNEpMK2JKR0Er?=
 =?utf-8?B?S0tyOG9KbW5qTmdUK1Jad2VOSFVWSExCSHlwQU9RUWRPYVZMcWJFMHVDcS9W?=
 =?utf-8?B?NlRzTFFod2NaZHp6N1l0UWNtWFB3ck5zcTRFZWlJNmpxK1RxQnNYOGlSYTEz?=
 =?utf-8?B?YzVKb09yZWdWYzJUaVlFL1lwQ1BCaVRxVURvNWQxeUFOYndtSWJ6clVVMFg1?=
 =?utf-8?B?WFYvQjRHVTg5RUtPRFpCNkdoak43RnVDdHVuSGRvMWFRTithRzFvemUxTDZF?=
 =?utf-8?B?ODdSU2szMWlvQncwZEY0TDVXRkY3NE5oT0pWMFBYQ01lN3FUKzFyQlBjalpo?=
 =?utf-8?B?Q2hOeGZHSjNQQm11eFYwaW1mbnphSlJRWWhPUC9tS2dNNFZNam8ranY5Sm43?=
 =?utf-8?B?SG9RaDQ5VDUwMkhqQ25BVVA0RTZLUHhLUVlGeW5oN2FtdDVhY2o3ZHgzNThs?=
 =?utf-8?B?YXlyUDBJUUNKck9ZTGxEbHBYU3ZpMXhwQVJzK0xtZmV2RGhlS3c5N0Z2WWR2?=
 =?utf-8?B?Y2dKck8rV2ViOUFmR1RTa3BOT3Q1NGV4ZWRoTmQvVkpncnMrRUJ5bnVYMDBa?=
 =?utf-8?B?NjhIMWJxUkhpSjF4YWM4UHNrZFFsbjJQVkQ5WWJaL2FISFY0L3NRMWh2UU9C?=
 =?utf-8?B?aEVVSzJva1RmVm5LejFoQTcxcDhlMW9SNnJmYTIzWThjOGRuSjJYdHY2UTlF?=
 =?utf-8?B?QW5qMEhmQUFGNU9PNkk1Q0NHeU9iN3pPRDB4Y0tqcTF0VHlGaVpoMm1aSUNJ?=
 =?utf-8?B?aTNpTUtyNTh0VlBHLzAwaXFkeG9KV0R1YUhsMGNBSU1kaytLRlRVVDJEdWdo?=
 =?utf-8?B?bG5MOWRvNWlxeC8xcDRYWWJTZGNYS3pkZnl0R3NtRlZWQjdSZVhOVWhpYWgz?=
 =?utf-8?B?YmUrZjBMVyt0TzRMcndDaDV0M0plUkFTUU5XeTBnTURDTnFqN1ZLQ0p1STFw?=
 =?utf-8?B?Y1l3bTBKUUo0dnVPdTEwYXA5Nm5RSlIyN2VTNFNreWVzSlI5azZFdGVndm9R?=
 =?utf-8?B?WXAzQ0ZPV1J4V2xuSnZVZGVRd09VQm4yZmFVby9LNUpzYWtJQksrdmVMNDhw?=
 =?utf-8?B?NE9rZTBvSzc0STE5MEN3Q0RkWkc1QjdwdGxRTmNPTXgwYlNiYit6UFY3WCtW?=
 =?utf-8?B?bzgxZVJvUmNFWHY2SEtPTzNDQUpMR0xLQmtTVmFKTEhiWjdtd0p5dU9haW1m?=
 =?utf-8?B?dFRoMStVZ3A0WW5MWE5aREhJSXVnbVhBb21uN2dRWUVhdXc2MkhyM0tnYkc2?=
 =?utf-8?B?Q2plSXVZYi9BemlWMWwyTWdPUUtEM2dIQ0FuTGJEdENzVjdNNVYrRHNDaExT?=
 =?utf-8?B?eE4yY3NWa3BJNGxEUWVDNVhIS2oyZU1LTDRzU1pZRHlvbDJPWVZZYVNFbm1L?=
 =?utf-8?B?b0xZcS9TNUxVUG0xanBZaU9EQlpPUmcvUjVOcjVnbHRVeCt5TjJqQUd6emtX?=
 =?utf-8?B?Tkp3bTNWMUVMNWliWTFrQXNFVmJya3J1bHQ5NEhoUzFQM0VmZzMrdEFURXRh?=
 =?utf-8?B?QVl1MnZhRFRNQnlzUVFHZG9KZm9tQVBKd25FR2lVL0FDQUNIQ0NDVXlFRVJs?=
 =?utf-8?B?OTIrT09KTlgxZDBBN3h6ckI2Rzh5cU1DcG9mZHhpa0ZUVThNam9tc3VPaGdG?=
 =?utf-8?B?SDg2SkFJQWtVLy95TzV6bEV6MHpKUGpSTU55aDA2WnlkR2dYUUplU3pDb1h3?=
 =?utf-8?B?Q1JNTExTS0hKUlVnRGw4QlVIYXdnMHZmc1ZoUlN6ei91bzRud25rK0lzMWpT?=
 =?utf-8?B?cnp4L0dNSk1oNHFwU3ByTW9aK1pjSTZqMlVtVGd4N1dxMmFrUXZvL1h4eVRO?=
 =?utf-8?B?VTBLWUVOSnBKajhEODFZM0tZYUdObHYxN3pOL1M1WlRoaGV3OFMyTkpPKzVR?=
 =?utf-8?Q?Qw3jFbtLGdCLP2KaJE6RLmFPz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68999952EC984D4BA96C67E72EB149A4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ChjDVReHKO+pKn46TtieN5ZkkbsM2YcFYTJHF+iph/ssXN06IM+3b2DHjhdEZCrO/1lhaIOTXRFRhB+AZxB7RyqM4z8NDck/aE1KWf4t//TjXY+DbqQb/1GBU0gfK61ufGyOH5hnDxHuwrEhDm8z+zdfmQxyaXMZELFFs+nsn6JkZo9SGO/CcvSHMU/ms65RKCsXCQVCdBk5reDQp/QF4S6PV85Dfi7dVdcdNNKi7lAqAJNonNnhgpTusf+wcdj2jytqe27QagN9Ke0W9OhmM8+WPJ2F5gfl9tu8+YmzEYRmmuW/wkphfYnjvSaROASh6ClkPLSgpamSgxfUjB6mgQ99pGeWB0AEwpWxETXOGKcMND3KOLkRYax+mpWICBbUl57Ucl7cZdfr82emDnVc5nBx3VMJDqdl+pfrIcaR86igX2ueCs3SxNN5bV8rUtteiZTX7FbuOItyXlQhcVYDkPkTgDvDvzxQLyOqYadWTJO7sQ3LA9QlDSpt/GdDiK8jWvaYWP8EnLYLA0uXyZuSB9Afm5eOsL0gDubDlD6hx+Myyi87LS0aEfwXGTbzRJzyT+OEtwjwCb0bNG9nNJgQlRYPAPG7X0Ip+IK/07nxAQpGsitR7JsBUmu8eyxab0DimEQuiOLXHmnG2w8v6QNiWw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5984.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4040730c-cd7f-45d7-dddc-08dd7234b98f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 22:21:33.3494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sYtOXIgCwcuj5qZr+AvmHMUgQABVZUg7RDP6Gnkn8gWpjcjG7KI4j1dQeLEQpU9JnU3UKlYWl8rG+9wkhOQVzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8689
X-Proofpoint-GUID: xxGihIJTwneY4mUm8ijCAeMJOfTMjSoY
X-Proofpoint-ORIG-GUID: xxGihIJTwneY4mUm8ijCAeMJOfTMjSoY
X-Authority-Analysis: v=2.4 cv=BrKdwZX5 c=1 sm=1 tr=0 ts=67edb874 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VabnemYjAAAA:8 a=2yVQ8JfDqJ1GQoP4jMEA:9 a=QEXdDO2ut3YA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_10,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504020144

T24gV2VkLCBBcHIgMDIsIDIwMjUsIEZyb2RlIElzYWtzZW4gd3JvdGU6DQo+IE9uIDQvMi8yNSAx
OjQ5IEFNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVGh1LCBNYXIgMjcsIDIwMjUsIEZy
b2RlIElzYWtzZW4gd3JvdGU6DQo+ID4gPiBGcm9tOiBGcm9kZSBJc2Frc2VuIDxmcm9kZUBtZXRh
LmNvbT4NCj4gPiA+IA0KPiA+ID4gUHJldmVudCBkd2MzX3JlcXVlc3QgZnJvbSBiZWluZyBxdWV1
ZWQgdHdpY2UsIGJ5IGNoZWNraW5nDQo+ID4gPiByZXEtPnN0YXR1cy4NCj4gPiA+IFNpbWlsYXIg
dG8gY29tbWl0IGIyYjZkNjAxMzY1YSAoInVzYjogZHdjMzogZ2FkZ2V0OiBwcmV2ZW50DQo+ID4g
PiBkd2MzX3JlcXVlc3QgZnJvbSBiZWluZyBxdWV1ZWQgdHdpY2UiKSBmb3Igbm9uLWVwMCBlbmRw
b2ludHMuDQo+ID4gPiBDcmFzaCBsb2c6DQo+ID4gPiBsaXN0X2FkZCBkb3VibGUgYWRkOiBuZXc9
ZmZmZmZmODdhYjJjNzk1MCwgcHJldj1mZmZmZmY4N2FiMmM3OTUwLA0KPiA+ID4gICBuZXh0PWZm
ZmZmZjg3YWI0ODViNjAuDQo+ID4gPiBrZXJuZWwgQlVHIGF0IGxpYi9saXN0X2RlYnVnLmM6MzUh
DQo+ID4gPiBDYWxsIHRyYWNlOg0KPiA+ID4gX19saXN0X2FkZF92YWxpZCsweDcwLzB4YzANCj4g
PiA+IF9fZHdjM19nYWRnZXRfZXAwX3F1ZXVlKzB4NzAvMHgyMjQNCj4gPiA+IGR3YzNfZXAwX2hh
bmRsZV9zdGF0dXMrMHgxMTgvMHgyMDANCj4gPiA+IGR3YzNfZXAwX2luc3BlY3Rfc2V0dXArMHgx
NDQvMHgzMmMNCj4gPiA+IGR3YzNfZXAwX2ludGVycnVwdCsweGFjLzB4MzQwDQo+ID4gPiBkd2Mz
X3Byb2Nlc3NfZXZlbnRfZW50cnkrMHg5MC8weDcyNA0KPiA+ID4gZHdjM19wcm9jZXNzX2V2ZW50
X2J1ZisweDdjLzB4MzNjDQo+ID4gPiBkd2MzX3RocmVhZF9pbnRlcnJ1cHQrMHg1OC8weDhjDQo+
ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyb2RlIElzYWtzZW4gPGZyb2RlQG1ldGEuY29t
Pg0KPiA+ID4gLS0tDQo+ID4gPiBUaGlzIGJ1ZyB3YXMgZGlzY292ZXJlZCwgdGVzdGVkIGFuZCBm
aXhlZCAobm8gbW9yZSBjcmFzaGVzIHNlZW4pIG9uDQo+ID4gPiBNZXRhIFF1ZXN0IDMgZGV2aWNl
LiBBbHNvIHRlc3RlZCBvbiBULkkuIEFNNjJ4IGJvYXJkLg0KPiA+ID4gDQo+ID4gPiAgIGRyaXZl
cnMvdXNiL2R3YzMvZXAwLmMgICAgfCA1ICsrKysrDQo+ID4gPiAgIGRyaXZlcnMvdXNiL2R3YzMv
Z2FkZ2V0LmMgfCAxICsNCj4gPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykN
Cj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMgYi9kcml2
ZXJzL3VzYi9kd2MzL2VwMC5jDQo+ID4gPiBpbmRleCA2NjZhYzQzMmY1MmQuLmUyNmMzYTYyZDQ3
MCAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMNCj4gPiA+ICsrKyBi
L2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMNCj4gPiA+IEBAIC05MSw2ICs5MSwxMSBAQCBzdGF0aWMg
aW50IF9fZHdjM19nYWRnZXRfZXAwX3F1ZXVlKHN0cnVjdCBkd2MzX2VwICpkZXAsDQo+ID4gPiAg
IHsNCj4gPiA+ICAgCXN0cnVjdCBkd2MzCQkqZHdjID0gZGVwLT5kd2M7DQo+ID4gPiArCWlmIChX
QVJOKHJlcS0+c3RhdHVzIDwgRFdDM19SRVFVRVNUX1NUQVRVU19DT01QTEVURUQsDQo+ID4gTGV0
J3Mgbm90IHVzZSBXQVJOLiBQZXJoYXBzIGRldl93YXJuPw0KDQo+IEkgY29waWVkIHRoZSBjb2Rp
bmcgc3R5bGUgZnJvbSBjb21taXQgYjJiNmQ2MDEzNjVhICgidXNiOiBkd2MzOiBnYWRnZXQ6DQo+
IHByZXZlbnQNCj4gDQo+IGR3YzNfcmVxdWVzdCBmcm9tIGJlaW5nIHF1ZXVlZCB0d2ljZSIpLCBz
byBtYXliZSBhIGZvbGxvdy11cCBwYXRjaCB0byBjaGFuZ2UgZnJvbSBXQVJOIHRvIGRldl93YXJu
IGZvciB0aGUgdHdvIHBhdGNoZXMgPw0KDQpXZSBjYW4ganVzdCB1c2UgZGV2X3dhcm4gaGVyZSwg
d2UgZG9uJ3QgbmVlZCAyIHNlcGFyYXRlIHBhdGNoZXMgZm9yIHRoaXMNCmNoYW5nZS4gVGhlIG90
aGVyIHBsYWNlIGNhbiBiZSByZXdvcmtlZCBpbiBhIHNlcGFyYXRlIHBhdGNoLg0KDQo+IA0KPiA+
IA0KPiA+ID4gKwkJCQkiJXM6IHJlcXVlc3QgJXBLIGFscmVhZHkgaW4gZmxpZ2h0XG4iLA0KPiA+
ID4gKwkJCQlkZXAtPm5hbWUsICZyZXEtPnJlcXVlc3QpKQ0KPiA+ID4gKwkJcmV0dXJuIC1FSU5W
QUw7DQo+ID4gPiArDQo+ID4gPiAgIAlyZXEtPnJlcXVlc3QuYWN0dWFsCT0gMDsNCj4gPiA+ICAg
CXJlcS0+cmVxdWVzdC5zdGF0dXMJPSAtRUlOUFJPR1JFU1M7DQo+ID4gPiAgIAlyZXEtPmVwbnVt
CQk9IGRlcC0+bnVtYmVyOw0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2Fk
Z2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ID4gPiBpbmRleCA4OWE0ZGM4ZWJm
OTQuLmMzNDQ0NmQ4YzU0ZiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2Fk
Z2V0LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gPiA+IEBAIC0z
MDAyLDYgKzMwMDIsNyBAQCBzdGF0aWMgaW50IF9fZHdjM19nYWRnZXRfc3RhcnQoc3RydWN0IGR3
YzMgKmR3YykNCj4gPiA+ICAgCWR3Yy0+ZXAwX2JvdW5jZWQgPSBmYWxzZTsNCj4gPiA+ICAgCWR3
Yy0+bGlua19zdGF0ZSA9IERXQzNfTElOS19TVEFURV9TU19ESVM7DQo+ID4gPiAgIAlkd2MtPmRl
bGF5ZWRfc3RhdHVzID0gZmFsc2U7DQo+ID4gPiArCWR3Yy0+ZXAwX3VzYl9yZXEuc3RhdHVzID0g
RFdDM19SRVFVRVNUX1NUQVRVU19VTktOT1dOOw0KPiA+ID4gICAJZHdjM19lcDBfb3V0X3N0YXJ0
KGR3Yyk7DQo+ID4gPiAgIAlkd2MzX2dhZGdldF9lbmFibGVfaXJxKGR3Yyk7DQo+ID4gPiAtLSAN
Cj4gPiA+IDIuNDguMQ0KPiA+ID4gDQo+ID4gSSdtIHN0aWxsIG5vdCBjbGVhciBob3cgdGhpcyBj
YW4gaGFwcGVuLiBBcmUgeW91IHRlc3RpbmcgdGhpcyBhZ2FpbnN0DQo+ID4gbWFpbmxpbmU/IENh
biB5b3UgcHJvdmlkZSB0aGUgZHdjMyB0cmFjZXBvaW50cz8NCj4gDQo+IEkgd2FzIG5vdCBhYmxl
IHRvIHJlcHJvZHVjZSB0aGlzIGxvY2FsbHkuIFdhcyBzZWVuIG9uIDUuMTAsIHRlc3RlZCBvbiA2
LjENCj4gYW5kIDYuNi4NCj4gDQoNCldpdGhvdXQgdW5kZXJzdGFuZGluZyBob3cgdGhpcyBjYW4g
aGFwcGVuIGFuZCB3aHkgaXQgaXMgbmVlZGVkLCB3ZQ0Kc2hvdWxkIG5vdCBqdXN0IGFwcGx5IHRo
aXMuIEtlcm5lbCB2NS4xMCwgdjYuMSwgYW5kIHY2LjYgYXJlIHJlYWxseSBvbGQuDQpXZSBoYXZl
IGEgbG90IG9mIGZpeGVzIHNpbmNlIHRoZW4uIFBsZWFzZSBzZWUgaWYgdGhpcyBpcyByZXByb2R1
Y2libGUNCnVzaW5nIG1haW5saW5lLg0KDQpUaGFua3MsDQpUaGluaA==

