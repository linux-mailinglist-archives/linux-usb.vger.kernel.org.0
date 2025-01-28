Return-Path: <linux-usb+bounces-19799-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA83A20326
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 03:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2413A1886D37
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 02:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F255E1465AD;
	Tue, 28 Jan 2025 02:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gO6x/vwk";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QvJhJjdm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OugIXhRf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C71132C85;
	Tue, 28 Jan 2025 02:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738030921; cv=fail; b=aoWLvXdP5RRPYrXlIl00u0nHbbEUA0sUjUe9T8qCCz6G+vpFJbZeF9biE4wRv1ugfnOdjjU7rOBB4iwLbfiHwUbqDpP1DIOIv1gW0aQyo2RtZl7TeJcVDmkJHC80dwIPIiILfaKnwcBgkxeRoHmO4WF0Udd3g8MoVGzNutI+KWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738030921; c=relaxed/simple;
	bh=en2xVQcopyosxRyiTSeoUU2XL2ks4Kl4uEF4hwHH448=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wm0FA+PfpVSnfLOr8DB4U9ZL026bhB374puB86dRuDfRrrDxK1KuW8iaPZmS2XsglTHND/1ZKXS9AU2BKYVZQujBPmgKp+Ge9Y3J5CxONN4qET0wC5X17WcWRTppqT+r7PHoesnknbQfH7wg0EwElBhaEq3i0cQwfNJdXqtoLrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gO6x/vwk; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QvJhJjdm; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OugIXhRf reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RN1uNC019530;
	Mon, 27 Jan 2025 18:21:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=en2xVQcopyosxRyiTSeoUU2XL2ks4Kl4uEF4hwHH448=; b=
	gO6x/vwkT784iU1MVFiK3TAZSyvzm4vYd/5YVcYn4572Kl3SJSXFGYLtkb9EEbIw
	GKJeuSM1/fb/P1amXFtIzu5OGuOtdJI9xF+XV0UONExJrrbQlO/Xgvbos2lOvnHr
	Hs4eSWLh4JKof8zBauLOQw2oLMs5akNq8k4Jx7q6Rtf8qSRJGQVOpXRUAuj/ENuo
	FJ03DtjVFeyVCZmqSkeTVSAhkNz93A104cLIBERliExgYXMeZuwuKD9cCV4j4EnQ
	QUEF69pzzDueUBq7j1UWVoFNxJAZ5G20Y8beD3H4WVnt84x3imYdNkbAZxTsPLwo
	/BcQNwTsxCWo5sEVHFo03A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44ekf58kw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 18:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1738030906; bh=en2xVQcopyosxRyiTSeoUU2XL2ks4Kl4uEF4hwHH448=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QvJhJjdm/jHOolcgknOGq8dKI74FfPgKaBfXQ5UfzTxjWu7bV3qMVHhL1CRNTINPG
	 yvLL+sP1m3/2jYZcOAFwIEa/GA1oMwi9VuZw/KLq2PST665zglzeGRqSfDtv/VeiEz
	 GybQBVsvRBJSeJ6RTtikrr9l6w11t8Yf2K+hKjlkqczdK3V6Kbb6ZzJYD621mcXAQ1
	 UfjOH1z23SlXOxALWqgeO3lTOFjuT1lxBRTm3a+I2p9l61KrmoIA/2L6WG0GVSUxv/
	 0eWlKHVGjv3CUwYpeOJ5/UcoooO33dBDcYtP8penDEvDaejfy5ckswqZ/LJtxMwvIl
	 S2ODd+Xyl+DYw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7A10440110;
	Tue, 28 Jan 2025 02:21:46 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BBCF7A007B;
	Tue, 28 Jan 2025 02:21:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OugIXhRf;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B52F240120;
	Tue, 28 Jan 2025 02:21:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQSq7ovfH1VmUv9AhAPlmRZYyba5IwPeFZ0HNyvtYMHf3vs35fC2PUCEZOIpg5aZ4iK4751kmmWHgdZa+V0u9xXWC4KPG2F/nSgOyUddDq1IwiH3E+dSysXjTFJaj/CBTkH5SbZRX+WcvguIffux56FgUx3h/xjGmIwO5CP1kxKabgnjY3oUIXOognD7KyIlVAjVw6X/PBYgyX3KLeuTsLE2yjrwVcrcc1YwQSCYyFhwo2gzN4rVeRtxmKih25yYy7SKs3YHpRGGLuWEfdRgbzq/zEdGW/iAiMAhy/IWWDYbpulkVUl4InTNzgkhXTIpHQ7a6ArIzUZCwxY/lvYYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=en2xVQcopyosxRyiTSeoUU2XL2ks4Kl4uEF4hwHH448=;
 b=dw5nhaKfykWkkv2750YjgkMyhRfsQpg+2pTDybMLj7tukZMkigu8ok3Ln9Ln0lty/mRZt46dsa9Royc4ezPpZikZX02rnvvmQHGc19vWjYO8S9Yr94nRMZjhyp6jr3hmtxIHuuecusw9iA7kNwrZxeTksKjgV7aiyjQhbbzChY5TWbkExbplatvjRlElOsaWS9EcjQFwBGCAkG/GlGtmmlyl5XyIc1nM+NosQy0qeuWIOTZtQYkswhp3GiBaAZUVlzLA4D3vRfUslaNYNStkNRcwbaKaUuEnSeqCJtvsuG8VscIkaQ030b5STyFXtfLC2maylWWC0YWDXc2YZUDvZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=en2xVQcopyosxRyiTSeoUU2XL2ks4Kl4uEF4hwHH448=;
 b=OugIXhRfuV2AhEZ/wkvF5fZp94YcwVFBgk0pQ5Q0e+dKbBE+1hOQtAkRK4aMkT8MLADy6B+OGDHt0xhyinAQif2ojxQWI7LbHPf+dN0KKtTXABqCFxF2VrfF40iNa4z3i5yHadiqyzZz0p/ea6G0qflqrs2bGKxZo4iXeQ4/f8U=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB8070.namprd12.prod.outlook.com (2603:10b6:8:dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 02:21:41 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 02:21:40 +0000
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
Subject: Re: [PATCH v1 3/3] usb: dwc3: gadget: Skip endpoints ep[18]{in,out}
 on Intel Merrifield
Thread-Topic: [PATCH v1 3/3] usb: dwc3: gadget: Skip endpoints ep[18]{in,out}
 on Intel Merrifield
Thread-Index: AQHbaC0e4vvQDZrPEUCV4IbmsnNVa7MaD3SAgADpBICABvSAAIABFsCAgAiCoQA=
Date: Tue, 28 Jan 2025 02:21:40 +0000
Message-ID: <20250128022134.3xuw263bet5akoa4@synopsys.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-4-andriy.shevchenko@linux.intel.com>
 <20250116233937.s7mv5mu4tfuaexy2@synopsys.com>
 <Z4pcMUDsFZ8-deW_@smile.fi.intel.com>
 <20250121234616.eomj7r73o6ce3u2r@synopsys.com>
 <Z5EbnXy-BRmgFpVh@smile.fi.intel.com>
In-Reply-To: <Z5EbnXy-BRmgFpVh@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB8070:EE_
x-ms-office365-filtering-correlation-id: c651993c-52da-4c15-a174-08dd3f428041
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Qis2N1g1N0VEZk5RMFZFNzJKYzJWVkNyQVFjYlNNTDdhSlQ4Z252Y0VpSUFp?=
 =?utf-8?B?ZFdTNG91V0lnUlY4ZU5xeC9GNUpQekg1Yzd0WFZJb1pjT29PTWpwR2JDNjlR?=
 =?utf-8?B?c2Vaemczc1gzRXNvUDl6R0FvL2dOWEY1cWY0ZERmT1hmMmJCc00xU2tqcWJX?=
 =?utf-8?B?TURrT2FoWGo4dUNoNXcxWWFoZ0xvVVRVc3Nsa0VMMjBBWjhsTXJ1SE9yR3Nk?=
 =?utf-8?B?YVJaOTk1YmM3b2YvbzVVZTFEYkt4V2tubGVCZnA4aWszWnM0TFlWaFd1c3FX?=
 =?utf-8?B?Sk16WkJ4K0ZBT0dZQ2lQYWFwVVI4MDk3T0FlaFhyY3dMNWhzODRVSXBRWlgx?=
 =?utf-8?B?N2t0emxnWFZZczBMQ0dpR0wwSU1kVzdaVUp3bDh1WXFUL1d5V0NBYU9mMkg4?=
 =?utf-8?B?aDZ0T1NHMEZyQjJCZzdVdVFWSDA1OXhZeGZkeUZHY2RNMXRmT0E1a2dPU1pX?=
 =?utf-8?B?VmwrTHNGLzZpVHpaWHBCdmp0K05FVkg5QyttZTBuVHhheE5tbFRtSEV2R3hV?=
 =?utf-8?B?QStLQlI4Q3E3UzZqMkhwK0k5YVZDSmViMlVyV0U0M1gyWUovRUlRUmZyeCtJ?=
 =?utf-8?B?L0RFQ2dCaW14VXpsKzQzUitFd29wUElGblA5WXdCNmJsRHdQM2NoTFhpVHBT?=
 =?utf-8?B?NXVZRStDYjFIZFpYYnFTWWxvUG1aTzZlMWJ0Nnh1T1JqMFF1emhzN3hPR1Zr?=
 =?utf-8?B?bkNubjgzY25PbHlpMERzV1I0MXRSZ0VtRDdpbVZqVWlZYmRsODdyTUtqNWdk?=
 =?utf-8?B?OFJyM3BRZXpIdm1wRytaOFptSGdrQk8raGg3V3BLd3NHVXUxbVI5S05FRzhK?=
 =?utf-8?B?UEMrdlBlazhWMlNTU0dZcTZFRklrNWdWc2lYYksvWC9zaHdtSEtZa3NzNGxr?=
 =?utf-8?B?OTdFRFFtMkJZakFVQ0p0QjM0eEhDRnk1SWlFSmljV3hzQi9PdlNoOWUwK0xL?=
 =?utf-8?B?a01oRVJGajFSKzcydFdNTmE5ajZBb2I2MTRuRlEwWUxyQTU1VEg5ZHN4R2pR?=
 =?utf-8?B?QjdIT0lHdXlYREZIMXdTU2hQODdPcmtZdkFLUjRyQlhyVnU0TkF1TW5ESHE3?=
 =?utf-8?B?QVdEUWttY3ZuNU9GSjVPeWxENnFkbHk2cWhNSlYwcTh4b2xiUkUwWUpGQXN5?=
 =?utf-8?B?NnNTYnZoS0pralVnS3l1TDRiQUJqRVJjejhXREJ0Njh4eUJXMXJCNytneTNO?=
 =?utf-8?B?Rm5oWG9vMHhPWCs4TjU4RWhkRm5vSXpDRTYxSGh4aVY3TmhRMHF5eWtZR1ZZ?=
 =?utf-8?B?TUl5S3Y5eDUwTjJJSHcvTlBGbUVTTm5PUlJnQ3diVk40WWp2WW10dlorQ1A3?=
 =?utf-8?B?RlZLU3MyVy96L3IvT2VKOExmUkF6UWRMSG9DL0RTdE5xK3djUkhYa0F3MmxY?=
 =?utf-8?B?NGhNR25DNUZlT3RDWFRUc3BCTG9kN09iWXNhQm12cEVZZTVVbU4zUjdndHF1?=
 =?utf-8?B?cXowVmRIeHErVHlMK2M1THBtRWRhendUVFhoaFIweXQ2djhISTk0YkhldE5Z?=
 =?utf-8?B?d1JqeUZFcUZlc2FtekM5RXdSMk1tNitDOC95UEpzQWFqa01DRnQ5QSs4MjBu?=
 =?utf-8?B?ZHVuaVRBRWxHcEpxcWlERUtwUDF2ZzRkZWlpU2ZsNzhTcXBZOFlIRVJ6Q2x3?=
 =?utf-8?B?MVB5elcya1pZWHJITlhsNy9JNlV1SkhGcVFQVjRabGpYbk1PR2g3c3pYVGha?=
 =?utf-8?B?S1pDanZteHVXdWNySE1SYzd6QlZHMnNLcWVVSVFIMmNFMWVFbXpobDdUYlZT?=
 =?utf-8?B?RjNOS0crbUdNd1FHYVdxLzV2UVJqaFAwUGhpYUk0TS9uUVlMdWRkQWIvajEr?=
 =?utf-8?B?UGpJd28zRzVpaUROaXRndmlZSjk2Ny82OE92T3RzOHF5TUYxTUdGUWlyNU5M?=
 =?utf-8?B?NkwvWE9EZVhCaTZkdFBuQlE4MmFCRTMvVlduV3kwb0lQWWcrUVo1YnlaMmp1?=
 =?utf-8?Q?J7B/bsbXQcJ3EH7eo8mvVgTtNzAfuqof?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TGRIeFZkVlRDb0pac2REZGE0YU5zbmhtUjY1UWU1UU5KNVBIV3JIb0hKZUVB?=
 =?utf-8?B?RDBNK1o1aWlRMDQxbzFXTWVTVUh3Vmp6QmNRU3NTRFY3ODdGeCtHUkJRNGRI?=
 =?utf-8?B?d1AwWEFZRDFWV09UL1hQcVg2RFl4MnVLVkRIdWNZUmVOU1czRVU0emEvT2Vk?=
 =?utf-8?B?RHhSQzV3eTZSbUpTVmhXWkRXRDh4ajhXSkdya0M0K0wvelV2OGVFT1lXOXhW?=
 =?utf-8?B?QmJ2S21VSUlKZ0wwSm5SbGN4QmNaM2JTb2pVd1JhVGpEcW1XelZDNXczb1lx?=
 =?utf-8?B?bmxGdWU1azMzenhCZm0weTdraktFelhWZzk0ZXNOWGhsL3NzSkNQRks3RTMz?=
 =?utf-8?B?MVk5dVhlOGtEc2VFUEVYRzhkVUE3c3lyVnVvSHVoYUZaeXl5Um11aEZwSUVh?=
 =?utf-8?B?VHIxMGs5aFpkdDEzZTZ5Uk1TSnNweE5yZWxYd0kzcUI3MnFUdEJOakUxYmM3?=
 =?utf-8?B?MWlTMCs3OExLSGNJZHJicHlJV3F0dFZDMFNvRnRwRmlLcUg3ZnJ0Mm9ZRHdW?=
 =?utf-8?B?aVV6dmlEamNNajdmSTM5Z3dnZDlwYjBFb2pPc1BoREtSMTZQZ3UxdUJ3bDZM?=
 =?utf-8?B?OHJJb2VFcHFjQXRWUmp5L0JoWGVEL0Y2Q0IrRG5MV3FsYU13dlR0TUNhYTFP?=
 =?utf-8?B?UXVTT0pBSWVndVdRejhrTmo0elJOSWV6KzRzRElJbjc5b0pZd0s5KzZmNldv?=
 =?utf-8?B?L1ZabE9CdVRCb1htdWNJc1pkU3JYOFh2a0xVYXVuS1pkcjZBeUF2dkphbFov?=
 =?utf-8?B?VWl1K0lyNk55a1pPK2luUXhQbWFQNmUxRlhmK3N4T1l0Z0YxL0dySHcwanRj?=
 =?utf-8?B?UWpUbnNNcWJzRVJmenZ3dHpFVHZVb0lIcEVaUi9yS2owVk5iWEdtZjFyMnVT?=
 =?utf-8?B?NmNQYnVpcGk2RjdYM1pncjVsTEJsVG0xNkFKTVhaVm54eTdkdWtvajJ4RnAy?=
 =?utf-8?B?Mzh1cExqLzZSYW1PbkdCckxQN0NiMVRmbmZ0SjVKa0ZSajRMQ3dGK0ZZMTMv?=
 =?utf-8?B?aWt3dFZwQjVjNVd6bVJzUWwyUzVsQ2RMVm8vL3Y0R2Y1L3BvQUNxbklNR1pi?=
 =?utf-8?B?cGlzcnFyU3dyNjMzMmRBa0JGYWlRYlQwajFKRFVUSVBKVXZzdC95MlZsaXAy?=
 =?utf-8?B?dXBtU09jSlFXbjZSLytiaGVSSklTVlFqeUMyMHg3WXcrTmE1VSsrSi9SSzVn?=
 =?utf-8?B?U3J0L01zZnczcmI1MXh3QzJEUW82YXZvU0NpMXE1R0gvVDhNNzc3U29FRlh5?=
 =?utf-8?B?dkdDZ1JJY3F3SlpTdFhDZEc1R2NqMWQzZnNQb0Vjd2FoR2lQc3BRZzQ1TWtN?=
 =?utf-8?B?aDJIYnFZQzF0MElOSnUvY2VyVFc4aFAyWExGVENkRXcxaGUyeVo3a2dEYVZa?=
 =?utf-8?B?RmNmRlpNOG9PQnNSMHgraWR4c1FiRmFRdGMrbzR6SlhhOVRuUXhSTkVsNVRw?=
 =?utf-8?B?NW5LNG4vOSswSGFjVmVNVGVkdGRPdlJpTDlsUStXdmVWeXBCWStTcWtKSTRr?=
 =?utf-8?B?cmxrV1VWSURKNG11aDJJKzh2b2IvVjNLazNaRW5UeTU1NFRHcGIwTGFHd1VD?=
 =?utf-8?B?ZW5zL25DSDZLUEFIZUNkeXJhNXpIVkdGYjREWSt0ckQ2R01OVzRpSFJxdzdE?=
 =?utf-8?B?SmQ5TGFBRDE0SWVreXZUSXh6MUoyUm1qajRVVUZ3bE5EMXRValZqZkVEV3lq?=
 =?utf-8?B?UEtjZkd0MjJ3b2tXcE03KzVVaWpMNEYxcFVsN3daTlFxcVI1cHp2dEhLMFlM?=
 =?utf-8?B?VjBaT3JQaHUvdjNSSzNWdzN2Nmh1RC9pdGJIOEt6NmpBV2lST2xWNkIxQ3R1?=
 =?utf-8?B?dHlkUFNJanIxZUhFRXRBM2hRRXRzdElDYzY4Q0l5dzgwd3AwdlhNSjA4WlRn?=
 =?utf-8?B?OGZ6MDFnN1NLTFlLenBHazBxYTJ3M0NoM08xd28yWnVraWRQbDlxcnJ3ZWxC?=
 =?utf-8?B?WCtsb1hXZEduVCs5eEkraEpnZGlPWEVBU3VMRGUyT2lZZlZTSlVJbGRLT0ky?=
 =?utf-8?B?MkVsRWRvUzFXQ0N3akRBdFh4dUV4eFJwbzN4eGhMVTZQaEtPUXI1SmhjUkdp?=
 =?utf-8?B?VlRGSVdJQUcrUUlCT2FWbHgrSnZqMTNtN29nTmludzhHaFRiaDJTMG8wdGIz?=
 =?utf-8?Q?6yMATcryRRp1XWeNTspUlqFY6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0EEEC231D2E5D43AFFF102CF63B4D66@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fEHtJYxHEzQFBqqVBq9jJmSTsmnb8WGPttVZyUSuDOcWLds9IigUAAB3UoKrTJAxOgFM2GWlTLi4Iw6UETL5UUt1Ovdq/oVyO5z0Ux4aELIw2qPb08hnKO8D0AGKj/fGJnlyaVsBHgxL7DtKWSjO3DPaiW9S56J5AEs2WfNLhVlQ6fX9mjrIzDhOcb1b/TCR2P0uWf+2IpKPfuVCSSzi1CAtDF3KLRwd5xNy3aUENgV8wrgpPEDbY5xMYkoV+zxlEJkRmSfhfZ6fMiSgxAN0F4+4ilq1xoXNfpAxXQA9CSLx20ha6UF6AylurfM9maLFm1XBSZ4ICdoiXJucSx64PHa+y3L9+dUnDCQEioEnlTbRDan4m50moXSQsfY0THyEAA25JAaKId/FieurYFlyguepv4AKFi9JvWXranRg6YuKZ6NI5NluIdJ1jt31YMAvlglqBftNTvk8rHfNaemXo1LUJq0fTLKbHOsUXvmXZW4Tmww1wxALnHVdtcu2AMg/EqNzDaFky25KEcboEVaGaitU91KInAIm0O3WYoYfZYelRxaH4SZkxtCCJvuYawOVtyuW6ieOhqja9JeGTUR6r64ScfC5uggEWBdBEsIByOGxO/WM5AOdYe5Z932gHqJ8yLj7D4ADOIh59unkROJiVw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c651993c-52da-4c15-a174-08dd3f428041
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 02:21:40.8361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vydt4H0G2WLpgt6G8luFlLlRth6QF46afNG92d/qmYPzIXxCX3Zu/yeALDV5UFjwTsVkgyso4KsSoQj1NcvZjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070
X-Authority-Analysis: v=2.4 cv=ZdDnNtVA c=1 sm=1 tr=0 ts=67983f3b cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=Pz-ldSVp3gd2Y8g1OOQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: G513Z1n1YawNh1JuktE4DKaO4bpNlFP_
X-Proofpoint-ORIG-GUID: G513Z1n1YawNh1JuktE4DKaO4bpNlFP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_12,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280016

T24gV2VkLCBKYW4gMjIsIDIwMjUsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gVHVlLCBK
YW4gMjEsIDIwMjUgYXQgMTE6NDY6MTdQTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
IE9uIEZyaSwgSmFuIDE3LCAyMDI1LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+ID4gPiBPbiBU
aHUsIEphbiAxNiwgMjAyNSBhdCAxMTozOTo0MlBNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6
DQo+ID4gPiA+IE9uIFRodSwgSmFuIDE2LCAyMDI1LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+
IA0KPiAuLi4NCj4gDQo+ID4gPiA+ID4gKyAqIEludGVsIE1lcnJpZmllbGQgdXNlcyB0aGVzZSBl
bmRwb2ludHMgZm9yIHRyYWNpbmcgYW5kIHRoZXkgc2hvdWxkbid0IGJlIHVzZWQNCj4gPiA+ID4g
PiArICogZm9yIG5vcm1hbCB0cmFuc2ZlcnMsIHdlIG5lZWQgdG8gc2tpcCB0aGVtLg0KPiA+ID4g
PiA+ICsgKiDigKIgMSBIaWdoIEJXIEJ1bGsgSU4gKElOIzEpIChSVElUKQ0KPiA+ID4gPiA+ICsg
KiDigKIgMSAxS0IgQlcgQnVsayBJTiAoSU4jOCkgKyAxIDFLQiBCVyBCdWxrIE9VVCAoUnVuIENv
bnRyb2wpIChPVVQjOCkNCj4gPiA+ID4gDQo+ID4gPiA+IFBsZWFzZSB1c2UgcmVndWxhciBidWxs
ZXQgY2hhcmFjdGVyIGFuZCBsaXN0IHRoZSBlbmRwb2ludCBwZXIgbGluZS4NCj4gPiA+IA0KPiA+
ID4gV2hpY2ggaXMuLi4/DQo+ID4gPiANCj4gPiA+IFRvIG15IGN1cmlvc2l0eSwgd2hhdCdzIHdy
b25nIHdpdGggdGhlIGFib3ZlPw0KPiA+IA0KPiA+IFBsZWFzZSB1c2UgYSBjaGFyYWN0ZXIgdGhh
dCB3ZSBjYW4gZmluZCBvbiB0aGUga2V5Ym9hcmQgKC0gb3IgKiBmb3INCj4gPiBleGFtcGxlKS4N
Cj4gDQo+IEhtbS4uLiBXZSBjYW4gZmluZCBhbGwgY2hhcmFjdGVycyBvbiBrZXlib2FyZCBieSB1
c2luZyBzdGFuZGFyZCBhcHByb2FjaCBvZg0KPiB0eXBpbmcgVW5pY29kZSBvbmVzLiBJJ20gbm90
IHN1cmUgd2h5IHRoaXMgaXMgYSBwcm9ibGVtLiBMaW51eCBrZXJuZWwgaXMgVVRGLTgNCj4gcmVh
ZHkgcHJvamVjdCAoZnJvbSBzb3VyY2UgdHJlZSBwb2ludCBvZiB2aWV3KSwgYXQgbGVhc3QgSSBo
YXZlbid0IGZvdW5kIGFueQ0KPiBsaW1pdGF0aW9ucyBpbiB0aGUgZG9jdW1lbnRhdGlvbi4NCj4g
DQo+IE5vdGUsIHRoaXMgaXMgX25vdF8gYSBrZXJuZWwtZG9jIHN0eWxlIHRvIHdoaWNoIHlvdSBt
YXkgcmVmZXIgd2hlbiBwb2ludGluZyBvdXQNCg0KSSdtIG5vdCByZXF1ZXN0aW5nIHRoaXMgb3V0
IG9mIGFueSBrZXJuZWwtZG9jIHN0eWxlLiBJdCdzIGp1c3QgYQ0KcGVyc29uYWwgcHJlZmVyZW5j
ZSBhbmQgY29uc2lzdGVuY3kgaW4gZHdjMy4gSWYgaXQncyBub3QgdG9vIGRpZmZpY3VsdCwNCnBs
ZWFzZSB1c2UgIi0iLiBCdXQgaWYgeW91IG11c3QgaW5zaXN0LCBmdXR1cmUgbGlzdHMgd291bGQg
bmVlZCB0byBiZQ0KY29uc2lzdGVudCB0byB0aGlzIG5ldyB1bmljb2RlIHN0eWxlLiBUaGVuIEkg
d291bGQgbmVlZCB0byBhc2sgb3RoZXJzIHRvDQp1c2UgdGhlIG5ldyBVbmljb2RlIG9uZS4gVHlw
aWNhbGx5IHR5cGluZyAqIGRvZXNuJ3QgYXV0b21hdGljYWxseQ0KY29udmVydCB0byDigKIgdW5s
ZXNzIHlvdSBlZGl0IHVzaW5nIFdvcmQsIGFuZCBzbyBJIHByZWZlciBzb21ldGhpbmcgSSBhbmQN
Cm90aGVycyBjYW4gZWFzaWx5IGZpbmQgb24gdGhlIGtleWJvYXJkLg0KDQo+IHRvIHRoZSBob3cg
bGlzdHMgc2hvdWxkIGJlIHJlcHJlc2VudGVkLg0KPiANCj4gQnV0IGl0J3Mgbm90IGJpZyBkZWFs
IGZvciBtZSB0byBjaGFuZ2UgdGhlIOKAoiBjaGFyYWN0ZXIuDQo+IA0KPiA+IEFuZCB3aHkgd291
bGQgeW91IHdhbnQgdG8gbGlzdCB0aGVtIGxpa2UgdGhpczoNCj4gPiANCj4gPiAJKiBFbmRwb2lu
dCBBDQo+ID4gCSogRW5kcG9pbnQgQiArIEVuZHBvaW50IEMNCj4gDQo+IEJlY2F1c2U6DQo+IDEp
IHRoZXkgYXJlIGxvZ2ljYWxseSBjb25uZWN0ZWQ7DQo+IDIpIHRoZSBhYm92ZSBpcyB0aGUgZXhh
Y3QgY2l0YXRpb24gZnJvbSB0aGUgc3BlY2lmaWNhdGlvbiBhbmQgSSB3b3VsZCBsaWtlIHRvDQo+
IGtlZXAgaXQgdGhhdCB3YXkuDQo+IA0KPiA+IEFzIG9wcG9zZSB0bzoNCj4gPiANCj4gPiAJKiBF
bmRwb2ludCBBDQo+ID4gCSogRW5kcG9pbnQgQg0KPiA+IAkqIEVuZHBvaW50IEMNCj4gDQoNCklm
IHlvdSBwcmVmZXIgdG8ga2VlcCB0aGUgc25pcHBldCBvZiB5b3VyIHZlbmRvciBzcGVjaWZpY2F0
aW9uIGludGFjdCwNCndlIGNhbiBpbnN0ZWFkIGRvY3VtZW50IHRoaXMgZnVsbHkgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlIGFuZCBub3RlIHRoZQ0KRUJDIGZlYXR1cmUuIFJlbW92ZSB0aGVzZSBjb21t
ZW50cyBoZXJlLg0KDQpUaGFua3MsDQpUaGluaA==

