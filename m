Return-Path: <linux-usb+bounces-4970-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A80C82C8CF
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 02:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B4AD1C21F01
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 01:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072B714F6E;
	Sat, 13 Jan 2024 01:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nl9u+zyA";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="l3xi0E7f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ix4kPp1C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B639134C2
	for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 01:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40CMTqfX013812;
	Fri, 12 Jan 2024 17:33:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=/lPakePEFUOi5YMpyISSGNa6jo3bXiGU2viMG00GdOY=; b=
	nl9u+zyAhixnzHE8EfgtijzamraMDMyf0Uw965lfCHGQVzDAjpGGnmVUTbCDNmRV
	pR2Ylow1tjsKA6Vrebi+fZNgNRfdkcsRG7fseHvhlgnxIwZP3+kTlCVdSd7XrqNe
	MX00ZQamqK4PA4/2NJzPqml01BS916fUdPJeomef0ebKN7t10PgbWqtm7Svsbdl6
	3QXDE+ibHc2r2iASdkBHSF4gE+uF1kH2QKZLIOukGYMo9Q+TwKZSKWQXKPJREhjS
	k38fBMXCIi5ZKyvJwAWEhEuPwZ/XHyvleBJnSisqEXNUjLof6ME/FSQu1AkyiKc6
	yB8Xf5/yIeUZ8LMD+fvl5w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3vkdawrp06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 17:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1705109621; bh=/lPakePEFUOi5YMpyISSGNa6jo3bXiGU2viMG00GdOY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=l3xi0E7fI4Zw6SyrxNnEgr5Jn9oxt68cf/Nd8CvLfZIcsOs3tdvVQxirSvj34Us9L
	 icqNzS5+GI+6P0dkf/+2B3l5mso0iJnYpi1MRa/m4cSrHNef9pvY+S59uFgf36sDu6
	 8L3Zb+bvbSKD3Y/Kug1pur302p9Oo8I9KDxaddCbPd2+AJt+3GUfjO2cuVnS8TGC9o
	 6fJadQCozD4PdiwcRCR0Gmm51tiDjpnfCb2OI7MTglE/IPiwzvNzKwy5zv7Esoftrn
	 Z3sdiFnYtHNAOLD8B/L6Uyz32iDI1KakUXW8yIvgf/gXyI8S+hZsNmgvIU42Q4iTOh
	 XdMlWRFTerzhw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4918B400A2;
	Sat, 13 Jan 2024 01:33:40 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C515CA00BC;
	Sat, 13 Jan 2024 01:33:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Ix4kPp1C;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6276A40467;
	Sat, 13 Jan 2024 01:33:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exo0X37Min/CMdrfPhfEepvAtcNBCdej0HJaNIPs9abxS7JA5Ka8CGlPsEC7tS+3o0tLYJSfKMmlLBwp3fnXKQ0QYF/2UHtfHSAgmUoVrIhqb2Gtx501OHL3TuBXR6outZ+a3OjIyveFWWuwa6Chg/9LhCYlmuMaBWf7UV9KuS0/0wBayUEOqF8kEaa/FQU0nn96y+fFcW2oIXJskA/LOabsHqIVGUNAQ0RqfjY9D/hPnv2rmR4fpiyyKrIGn0fPTQ83h5yUaQgyoXvoc7NfV9lQCkp9qY02dpN2x5kBr69YTJl3U1utmjE0DyNtSd3Ujyz81o1am3OZ40RRbENN1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lPakePEFUOi5YMpyISSGNa6jo3bXiGU2viMG00GdOY=;
 b=AztAVLRYr0Qosys+Zs4qjmKqZaZ/dh2NZYridsQbLspAyCBzyR4DSwvcTHe0eoeZZIbADVEY21dPXBWy2+7tkuV7eFlfiSn2gKdPN1PAjtEvWaA4GrtsKWPN4iq3Ver74DDAppS42+uu0qrw6UWOMWoJr5QUxh+mCMFimeCeHtyeWZTaWl5ch3MEgRRGOjfkuNbZgWMRZw1pd+RpH2eObfHcsdvgBfb2RHRlMGaWg0hvQH42fpWkjj0P987EPZr6Qx/RAVfH9NjWCwBmDMc8YR7paRa7cz6355BwyFCHY07upbSwBu2Kbc+pmxT8UgUD7waNtGOklbJdfKI+bBnR4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lPakePEFUOi5YMpyISSGNa6jo3bXiGU2viMG00GdOY=;
 b=Ix4kPp1C1ARs3CUyu4go3zn7heoihdQKk/2hKDvqsgjfNUmT4KD+sYwvWKhi11pjiOu2eMq3YJ2OMTk3OBHLGs13hvNimXFJMz/JWa40jY9LMpUNvEY0FwCqNGUf5tzv5BJSYWxbj0uy4QCxikIAHGN2Ran8LNc8DF3NlpUBlok=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA0PR12MB4496.namprd12.prod.outlook.com (2603:10b6:806:9b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Sat, 13 Jan
 2024 01:33:32 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3%3]) with mapi id 15.20.7181.015; Sat, 13 Jan 2024
 01:33:32 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "johan@kernel.org" <johan@kernel.org>,
        "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
        "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
        "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Vivek Dasmohapatra <vivek@collabora.com>,
        "piyush.mehta@amd.com" <piyush.mehta@amd.com>,
        "ray.huang@amd.com" <ray.huang@amd.com>
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Thread-Topic: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Thread-Index: 
 AQHaHWVQyO2xJEu1EUm3AscfDvsycrCZEZEAgADm+gCAAN61AIA3OYEAgAIYloCAAO4SAIACLscA
Date: Sat, 13 Jan 2024 01:33:32 +0000
Message-ID: <20240113013320.mrqqrdajrnw62kis@synopsys.com>
References: <20231122165931.443845-1-gpiccoli@igalia.com>
 <2dfbf5c9-dd38-c919-c604-618ad08ce456@igalia.com>
 <20231205012336.mn7b7f4zypwcyv6w@synopsys.com>
 <9efaed91-d246-cf3c-efc0-e866f88a943d@igalia.com>
 <d85a5507-4d4a-9e60-fbd1-68b42afb2143@igalia.com>
 <20240111020119.5u3k3csn3bi2zhtw@synopsys.com>
 <849d11d9-9302-4d76-01b6-b5046f474fda@igalia.com>
In-Reply-To: <849d11d9-9302-4d76-01b6-b5046f474fda@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA0PR12MB4496:EE_
x-ms-office365-filtering-correlation-id: eb6e831f-4c1c-4d8c-cd2d-08dc13d7a71f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 navlwA70V9p0xDPld6If2OlLnjCzzPhmt30sz4nWpCfSwUfstwhuOPPPdUpngfub+Uzy6lzxYm1cxbCsul2B8KifAAhOsER0r7ChgaAIlw2NQVisuOeopOc3SmQCh4jur09rhuHAT3SmnDkNBKUaTGwGo5u6gnSinaeiFOr+0gW/jrVG+HrOW+qW7LZX498kf6SnzcDYoc+AroRyzFVB1NLinbUkgib8MsdqVz3N2DFGfq70kxTSN1c13wG65Fl+ye12zpxcb5a5u/TqGmMXhTvgzHuHE2Li4B/2OJbYNTD+aCzqFax91s+zK4ZA+GRKQXjktZuQhBh0EERp3YCEzU6g1eMYASZluXZMwIl8n7RKWQOQLQmGwieo+QTGAmf9tzRYMxxqJUBIBP1tCo/bvwlctfPybDUKu1rbM/KuU2EgIoMzGJt/zR+fG6S3VoBCWe+oZ/NkyP+fxNvbfgGhdI8MwZdTaDuKaKziymHYZZP8fez2qvsF/kYCg4vMQr0clW8M7aj8AVxfTrt/i7rxIpYf5k+NmPYM00C9S0bogRs36t11xMZcMjgscLXx/OB3SHJPfVJNAq7ualgtqKY08z95PSIumDM3nElFd9OV16gNuHuUbAuZqeng+agoSYtn
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(5660300002)(122000001)(38100700002)(8676002)(8936002)(4326008)(2906002)(7416002)(26005)(2616005)(1076003)(83380400001)(86362001)(6916009)(6506007)(6512007)(53546011)(71200400001)(316002)(478600001)(91956017)(66476007)(54906003)(64756008)(66946007)(76116006)(66556008)(36756003)(66446008)(6486002)(38070700009)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VG1zYnovZHNUc1pHT2VuTU8zYU0zRFBsU2ZjTVBZSlhISytCWTdJamFrb1Zx?=
 =?utf-8?B?QTRUM2wrTUVKeWpCanVTTzJLZmFpQnZTU2txdVcwL3FQTStKTC82TGIwQjZl?=
 =?utf-8?B?eGMyMUpBMEFtYkkvRkRiZVR3SVRZZ0xtUDBLeVprS2lBQ2hsWG5FSWp6U3F5?=
 =?utf-8?B?QkU2WCtLWi95dVI2TDVDWm9JVTJ2ckdSeXcxT0ppNnQ1dGN1UTRPSFArTHFZ?=
 =?utf-8?B?VHBFQi9BamptaWxJS2Q3bkNQdkFJa21GWXNlTFVEaVh0RWhmZkozVW1tQkdm?=
 =?utf-8?B?WHJtV1dFMjhySXJzNmk3dWJ4TDFOUzhLbDM1Z3FBbFZES3hMb0RXWGE1cm5x?=
 =?utf-8?B?SXdSZ1RSMDJVenRlRnhkaGE5dzF5QkgzeVVKQ2t0NDRnUVJ2ZUhoUjc5R29W?=
 =?utf-8?B?a2YreGZsSGpSaFM4ZVJWUVRubmNqenFVOHBnUngwQ3lMRTY2Q2NqS1cxRXE2?=
 =?utf-8?B?TWRoUGZQR3QxNk1GaXk2OThncDRJSGpsYmt3RXNScFlKN2dTQmc4ZXFhVFpy?=
 =?utf-8?B?Q2sxMGxTU1BlVTJaYzArTGlLcDdvUmZmMUE4TEdUNGNKUnRVUnRTUDB4Z0ky?=
 =?utf-8?B?L0N4MHhBbGE1eXRjWU5URHh2b0wxZnNhZ3QxMnZqNFdmSlkyVGpFd3BadjJv?=
 =?utf-8?B?M21UeVREcGNUN0wvZmIzMGVNdVV2d040SkRFUWlqTHdoL3dwbE1mWmlESnMr?=
 =?utf-8?B?aTd2aUFVVFJOTDZXTTZSd1Y2NzdMTm54eWFjalp1am1aTVVsNyt0a21ZT01l?=
 =?utf-8?B?NWdzMEh0Znp1MkhHbldKZkhMOXZxazhwVDBZcWtFaE53TCs1QWwxUEhBanow?=
 =?utf-8?B?R1RzTTN4Z0JGQjJzejdRK0ppZ0RoMWY0M2N6d1cyWS9uYTE3NU1nNU45ankz?=
 =?utf-8?B?Smpsb0dQbVkybnZQUGJaY2o4Y1VydHhJRWU0bzNTTjlZVzd4ZTlXa1k1MDQ3?=
 =?utf-8?B?bm1kMHgxaUswdWorMkJyMFVrcUJTWHd6S0FlRlFXL05iTHd6RWRqMCtBRGR3?=
 =?utf-8?B?M0xmMzhxN3pxSXlraTl1UTZFVlBsY2M1SGs1NnVBV0pwMW9xR0NRUTUxNWJR?=
 =?utf-8?B?OXpRejdZVENMS2xKbFJOU0lscjI1eEZyZFJlMkxLVFdBc20xOG9zL2ZVdGJR?=
 =?utf-8?B?c3RtZGZNamNoSldYelFCUEtaV1Frd1hxY01oK2M0WWVSVWZBVEhVWEdoMGVl?=
 =?utf-8?B?OUlISXJhTHhNSm1FK3NhOVF0VysxekpuMXBEc3ZURHFiOGxycXNKdzc5L0xL?=
 =?utf-8?B?dUVydTZSV1hsblJCTVFPOGdqMXdTL1NqQ1ZFaUVrNTZXTmJwQXJNTTg3aGVG?=
 =?utf-8?B?cXJBOC9PY0JpR29DaVl5U0QwZ0Y3a1FsREVtVGVDNXFYQTFVMENhNnMzTWpr?=
 =?utf-8?B?eGNjdUlsRGNNY21JdUw2bkxycUFsN28wQkhNbm9NWlRsZG9nUzJmdnZWaDJx?=
 =?utf-8?B?bXlGSjluS05tZWNaYStXOEEvZjJBeFltQnZCTnJ4MGpvQzdyMFZyYVZxaXRU?=
 =?utf-8?B?cXVVYzV4T1RJK1hBcGxsMXRCaFE0UExTQWxxSjd1Wm5KSEoxeUs2V1VQUTF3?=
 =?utf-8?B?aU5XQk9WTzcrRzd0SU1pRHpjeEJ2bzh2N3NLbTdHdENjeXJaNXNsRkUzbW1s?=
 =?utf-8?B?T05SSUtGMFdGRGJhMWpndENQMXFScEJTMVZiVExPdFliNEQxK3dtQUdQNGNr?=
 =?utf-8?B?eWdOUUdtVjMyRlZrV0Z0bXl5V3VGbG5KalJHSmd0QmQ3K2NNZDNOek1pRnho?=
 =?utf-8?B?ZmpXd09WUjJTRzlGMjdjUHhxSXhVMG9GS0JNY0ZPdVhaTEd1Mnc1SE5IMmR3?=
 =?utf-8?B?OWZTRW9wUHltMUIvWXdEQTdrL2hvbVd3TEorL3RJcFRKRU0rNVJWblZnY3VE?=
 =?utf-8?B?N0c4TFVianZlelh3U2ZqWXRyRUtBRFZUYWNLZjczdEM5TjJ5Mnc2c3BWc0h4?=
 =?utf-8?B?OHVqNVBmSk5iRzdlSnhvUlFLNlRRbUZKaUFYUDVSNVIyaC9HblpsZzdYMzlM?=
 =?utf-8?B?YVU3c0NQY2hySmR2ZGI1YU1iSDI3QlhROUQrd1ZJVFpmRTlEQUNmdjFtQzh1?=
 =?utf-8?B?Q0NXL0ZNd3h4RndiUWU4Ri91YUxhZXM3QXVJWFNNVXZ6R3JSb3J5MTRzaUl6?=
 =?utf-8?Q?b2aCrpIZ/UNATsTCPNQB6ng0D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41AF2E42C54F7B4D919459978D1F7BB3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	0E0hqhtwNvJMqSRVdRp7C/AJ9AK2FNPL/TJtYg9Kh/uxH1bbDBebTch377hfwW6GuXe4Zeovcx+wQc+5TFjEo9FXp7HZs37YqQnBM2TV0VHlE9BgWIB4PfUov+IGOFiSYws0kUMv+0fXzB5dIzFu0ncYjrjfpGR/ov7D6+SBHg/vo/2KtqCJOg2sneYOtmr2jXjQBOKMBzq1Y5edN4IDtVQJu5ZEyC89lrGpq2Jld+ECWVLc1f9NHwlHWHdvs5LhZEJbd9JgcEeLQFq8tHUknDCor2L1L3anZZDv2vbIL+0S+M8kAZx4Qi6soqDR4pPzNojQo4XJt4ls8D0x0WQIyKijbRV+6bNAwhB9o5pXUN+qQe4/xOjBGdcer/ADZ7FlOIoSFwohb/b/R1sThFHwmGiLNZYPbm+01qrfPQqfPFwPQvF90SvMGM+Yq3sEM3Gx5IR9KYYdet+IIvbxhAEQFahF0CyYP0i001JcwQtXI1IRfHHf5v5ymeCHVpj6MZq8m7rNSZitqccrDGlCvoLCAbHyzreMPTKaR5mW4mHTFzAuLClGwl6XdoPQHy/Rg914OcjJhRR8NIo0xmJa0VISzkeaDH3BQKR2UfquQh+3Q+jU11b7mSVz/Sy1IA0peF39YSE8HT63oOaOmhmWc7h02Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6e831f-4c1c-4d8c-cd2d-08dc13d7a71f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2024 01:33:32.2059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m62ny3RlxcoNXodGz1Dt2xUKnTORv0z5eHn6MkAUYskah/Jjl/wYfds/Q0WdjrsyvDmICJHzzVgj4DbNmWRaTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4496
X-Proofpoint-GUID: djV4UygAKQurAn2I06XE6tDOtAPphntR
X-Proofpoint-ORIG-GUID: djV4UygAKQurAn2I06XE6tDOtAPphntR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxlogscore=963 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401130010

T24gVGh1LCBKYW4gMTEsIDIwMjQsIEd1aWxoZXJtZSBHLiBQaWNjb2xpIHdyb3RlOg0KPiBIaSBU
aGluaCwgdGhhbmtzIGZvciB5b3VyIHJlc3BvbnNlISBNeSBjb21tZW50cyBhcmUgaW5saW5lIGJl
bG93Og0KPiANCj4gDQo+IE9uIDEwLzAxLzIwMjQgMjM6MDEsIFRoaW5oIE5ndXllbiB3cm90ZToN
Cj4gPiBbLi4uXQ0KPiA+IA0KPiA+IEkgYXNzdW1lIHRoZXJlIHdhcyBhIHJvbGUgc3dpdGNoIG5l
Z290aWF0aW9uIHRvIHN3aXRjaCB0byBkZXZpY2UgbW9kZQ0KPiA+IHN1Y2Nlc3NmdWxseSBoZXJl
IGJlZm9yZSB0aGUgbmV4dCBzdGVwPw0KPiANCj4gWWVzLCBleGFjdGx5LiBXZSBoYXZlIGFuIG91
dC1vZi10cmVlIGRyaXZlciB0aGF0IHJlYWRzIHRoZSBwb3J0IHN0YXRlDQo+IHRocm91Z2ggc29t
ZSBBQ1BJIG1lc3NhZ2UgdG8gc3dpdGNoIG1vZGVzLCBidXQgdG8gYmUgMTAwJSBjbGVhcjoNCj4g
DQo+ICoqVGhpcyBPT1QgZHJpdmVyIHdhcyBmYWN0b3JlZCBvdXQgZm9yIG91ciB0ZXN0cyoqIC0g
aW4gb3RoZXIgd29yZHM6IGFsbA0KPiB0ZXN0cyBtYWRlIHdlcmUgZG9uZSBieSBtYW51YWxseSBj
aGFuZ2luZyB0aGUgcG9ydCBtb2RlICh2aWEgZGVidWdmcykNCj4gYW5kIHdhaXRpbmcgc29tZSBz
ZWNvbmRzIGZvciB0aGF0IHRvIHNldHRsZS4gVGhpcyBPT1QgZHJpdmVyIGlzIG5vdCBldmVuDQo+
IGNvbXBpbGVkIGZvciByZWNlbnQga2VybmVscyAoaXQgcnVucyBpbiBhIGRvd25zdHJlYW0gNi4x
IGtlcm5lbCkuDQo+IA0KPiANCj4gPj4+IDNiKSBpZiBQQ0llIFBNRSBpcyBub3QgdXNpbmcgTVNJ
cywgRGVjayBzdXNwZW5kcyBhbmQgcmlnaHQgYWZ0ZXIgKGxlc3MNCj4gPj4+IHRoYW4gYSBzZWNv
bmQpLCB3YWtlcyB1cCBwcm9wZXJseS4NCj4gPj4+DQo+ID4gDQo+ID4gWW91ciBwbGF0Zm9ybSBp
cyBEUkQgcmlnaHQ/IElmIHRoYXQncyB0aGUgY2FzZSwgdGhlbiBpdCBzaG91bGQgYmUgdXNpbmcN
Cj4gPiBsZXZlbCBpbnRlcnJ1cHQuIEl0IHNob3VsZCBub3Qgc3VwcG9ydCBNU0kgdW5sZXNzIGl0
J3MgaG9zdCBtb2RlIG9ubHkuDQo+ID4NCj4gDQo+IFllcywgRFJEIGluZGVlZCAtIGJ1dCBpdCdz
IHRoZSAqKlBDSSBQTUUgaW50ZXJydXB0KiogIHRoYXQgdXNlcyBNU0ksIG5vdA0KPiB0aGUgVVNC
IFBDSSBkZXZpY2UuIEhlcmUgaXMgYW4gb3V0cHV0IG9mIGxzcGNpOg0KPiANCj4gJCBsc3BjaSAt
dmtubnMgMDQ6MDAuMw0KPiAwNDowMC4zIFVTQiBjb250cm9sbGVyIFswYzAzXTogQWR2YW5jZWQg
TWljcm8gRGV2aWNlcywgSW5jLiBbQU1EXQ0KPiBWYW5Hb2doIFVTQjAgWzEwMjI6MTYzYV0gKHBy
b2ctaWYgZmUgW1VTQiBEZXZpY2VdKQ0KPiAgICAgICAgIFN1YnN5c3RlbTogVmFsdmUgU29mdHdh
cmUgVmFuR29naCBVU0IwIFsxZTQ0OjE3NzZdDQo+ICAgICAgICAgRmxhZ3M6IGJ1cyBtYXN0ZXIs
IGZhc3QgZGV2c2VsLCBsYXRlbmN5IDAsIElSUSAyNg0KPiAgICAgICAgIE1lbW9yeSBhdCA4MDAw
MDAwMCAoNjQtYml0LCBub24tcHJlZmV0Y2hhYmxlKSBbc2l6ZT0xTV0NCj4gICAgICAgICBDYXBh
YmlsaXRpZXM6IFs0OF0gVmVuZG9yIFNwZWNpZmljIEluZm9ybWF0aW9uOiBMZW49MDggPD8+DQo+
ICAgICAgICAgQ2FwYWJpbGl0aWVzOiBbNTBdIFBvd2VyIE1hbmFnZW1lbnQgdmVyc2lvbiAzDQo+
ICAgICAgICAgQ2FwYWJpbGl0aWVzOiBbNjRdIEV4cHJlc3MgRW5kcG9pbnQsIE1TSSAwMA0KPiAg
ICAgICAgIENhcGFiaWxpdGllczogW2EwXSBNU0k6IEVuYWJsZS0gQ291bnQ9MS84IE1hc2thYmxl
LSA2NGJpdCsNCj4gICAgICAgICBDYXBhYmlsaXRpZXM6IFtjMF0gTVNJLVg6IEVuYWJsZS0gQ291
bnQ9OCBNYXNrZWQtDQoNCkFyZSB5b3Ugc2hvd2luZyBNU0kgZW5hYmxlZD8gVGhhdCBsb29rcyBs
aWtlIE1TSSBpcyBkaXNhYmxlZC4NCg0KPiAgICAgICAgIENhcGFiaWxpdGllczogWzEwMF0gVmVu
ZG9yIFNwZWNpZmljIEluZm9ybWF0aW9uOiBJRD0wMDAxIFJldj0xDQo+IExlbj0wMTAgPD8+DQo+
ICAgICAgICAgS2VybmVsIGRyaXZlciBpbiB1c2U6IGR3YzMtcGNpDQo+ICAgICAgICAgS2VybmVs
IG1vZHVsZXM6IGR3YzNfcGNpDQo+IA0KPiBOb3csIEkgKipndWVzcyoqIHRoaXMgaXMgZXhwZWN0
ZWQsIGJ1dCB0aGVyZSBpcyBhIGRpZmZlcmVuY2UgaW4NCj4gL3Byb2MvaW50ZXJydXB0IGJldHdl
ZW4gZGV2aWNlIGFuZCBob3N0IG1vZGU6DQo+IA0KPiAkIGdyZXAgMjY6IC9wcm9jL2ludGVycnVw
dHMgfCB0ciAtcyBcICAjIGRldmljZSBtb2RlDQo+IFtlbXB0eV0NCj4gDQo+ICQgZ3JlcCAyNjog
L3Byb2MvaW50ZXJydXB0cyB8IHRyIC1zIFwgICMgaG9zdCBtb2RlDQo+ICAyNjogMCAwIDAgMCAw
IDAgMCAwIElPLUFQSUMgMjUtZmFzdGVvaSB4aGNpLWhjZDp1c2IzDQoNCkxvb2tzIGxpa2UgaXQn
cyBsZXZlbCBpbnRlcnJ1cHQgaGVyZS4gSSBkb24ndCBzZWUgImVkZ2UiIG9yIE1TSQ0KaW50ZXJy
dXB0LiBJcyB0aGUgcGNpZV9wbWUgc2hhcmUgdGhlIHNhbWUgaW50ZXJydXB0IGxpbmUgYXMgdGhl
IHVzYg0KY29udHJvbGxlcj8NCg0KSSdtIG5vdCBzdXJlIGhvdyB0aGUgU1RFQU0gREVDSyBpcyBk
ZXNpZ25lZC4gRG9lcyB0aGUgT09UIGRyaXZlciBtYW5hZ2VzDQp0aGUgcG93ZXIgc3RhdGUgcmVx
dWVzdCBvdXRzaWRlIG9mIHRoZSBQQ0kgUE0gZm9yIGRldmljZSBtb2RlIGFuZCBub3QNCmp1c3Qg
cmVhZGluZyB0aGUgcG9ydCBzdGF0ZT8gSWYgdGhhdCdzIHRoZSBjYXNlLCB0aGUgaXNzdWUgY291
bGQgYmUgaW4NCnRoZSBPT1QgZHJpdmVyPw0KDQo+IA0KPiANCj4gPj4+IFsuLi5dIEFuIGV4YW1w
bGU6IGEga2V5Ym9hcmQgb3IgYSBkaXNrDQo+ID4+PiBjb25uZWN0ZWQgd2hlbiB0aGUgVVNCIHBv
cnQgaXMgb24gZGV2aWNlIG1vZGUgZG9lc24ndCByZXByb2R1Y2UuIEFsc28sIEkNCj4gPj4+IHRo
aW5rIEkgZGlkbid0IHRlc3QgImluIFVTQjMgc3BlZWQiIC0gY291bGQgeW91IGRldGFpbCBtb3Jl
LCBub3Qgc3VyZSBpZg0KPiA+Pj4gSSB1bmRlcnN0b29kIHRoYXQgcHJvcGVybHkuDQo+ID4gDQo+
ID4gSSBtZWFuIHRvIGFzayB3aGV0aGVyIHRoaXMgdGVzdCB3YXMgZG9uZSB3aGlsZSBvcGVyYXRp
bmcgaW4gU3VwZXJTcGVlZA0KPiA+IG9yIFN1cGVyU3BlZWQgUGx1cy4NCj4gDQo+IFdlbGwsIEkn
bSBub3Qgc3VyZSBpZiBJIGtub3cgaG93IHRvIGFuc3dlciB0aGF0IGhlaA0KPiBDaGVja2luZyAi
bHN1c2IgLS10cmVlIiBpbiBob3N0IG1vZGUgZ2l2ZXMgbWU6DQo+IA0KPiAvOiAgQnVzIDA0LlBv
cnQgMTogRGV2IDEsIENsYXNzPXJvb3RfaHViLCBEcml2ZXI9eGhjaS1oY2QvMXAsIDEwMDAwTQ0K
PiAvOiAgQnVzIDAzLlBvcnQgMTogRGV2IDEsIENsYXNzPXJvb3RfaHViLCBEcml2ZXI9eGhjaS1o
Y2QvMXAsIDQ4ME0NCj4gDQo+IFdoZW4gSSBzd2l0Y2ggdG8gZGV2aWNlIG1vZGUsIHRoZXJlIGlz
IG5vIG91dHB1dCAoYW5kIEkgdGhpbmsgdGhpcyBpcw0KPiBleHBlY3RlZCwgcmlnaHQ/KS4gT3Iu
Li50aGUgcXVlc3Rpb24gd2FzIGFib3V0IHRoZSBVU0IgcG9ydCBpbiBteQ0KPiBsYXB0b3AsIHRo
ZSBvbmUgSSdtIGNvbm5lY3Rpbmcgb24gdGhlIERlY2s/DQo+IA0KPiBBcG9sb2dpZXMgZm9yIG15
IGhhcmQgdGltZSB1bmRlcnN0YW5kaW5nIHRoaXMgb25lLi4uDQo+IA0KDQpObyBwcm9ibGVtLiBJ
IHdhcyByZWZlcnJpbmcgdG8gY29ubmVjdGVkIHNwZWVkLiBUaGUgcHJpbnQgYWJvdmUgZG9lc24n
dA0Kc2hvdyBhbnkgZGV2aWNlIGNvbm5lY3RlZC4gUE1FIGdlbmVyYXRpb24gY2FuIGNvbWUgZnJv
bSBVU0IyIG9yIFVTQjMNClBNVS4gSSB3YW50ZWQgdG8gY2hlY2sgaWYgdGhlIHByb2JsZW0gd2Fz
IGJlY2F1c2Ugb2Ygb25lIG9mIHRoZW0gaXMNCm1pc2JlaGF2aW5nLCBidXQgSSBkb24ndCB0aGlu
ayBpdCdzIHJlbGF0ZWQgdG8gdGhpcy4NCg0KPiANCj4gPj4+PiBbLi4uXSANCj4gPj4+ICJEaWQg
eW91IGNoZWNrIGlmIHRoZSBkcml2ZXIgaGFuZGxlZCB3YWtldXAgZnJvbSBQTUUgYW5kIHByb3Bl
cmx5DQo+ID4+PiByZXN0b3JlIHRoZSBjb250cm9sbGVyPyIgPC0gSSB0aGluayBJIGRpZG4ndCAt
IGhvdyBkbyB5b3Ugc3VnZ2VzdCBtZSB0bw0KPiA+Pj4gY2hlY2sgdGhhdD8NCj4gPiANCj4gPiBJ
ZiBpdCdzIGluIGRldmljZSBtb2RlLCBhbmQgeW91IG1lbnRpb25lZCBQTUUsIHRoYXQgbWVhbnMg
dGhhdCB0aGUNCj4gPiBkZXZpY2Ugd2FzIGluIGhpYmVybmF0aW9uLiBJIGFzc3VtZSB0aGF0IHlv
dSdyZSBub3QgdXNpbmcgdGhlIG1haW5saW5lDQo+ID4gZHdjMyBkcml2ZXIgaWYgU3RlYW0gRGVj
ayBzdXBwb3J0cyBoaWJlcm5hdGlvbiBhbmQgd2FzIGluIGhpYmVybmF0aW9uDQo+ID4gYmVmb3Jl
IHRoZSBjb25uZWN0aW9uLiBPdGhlcndpc2UsIFBNRSBzaG91bGQgbm90IGJlIGdlbmVyYXRlZC4g
SWYgaXQNCj4gPiBkb2VzLCBzb21ldGhpbmcgaXMgYnJva2VuIGFuZCByZXF1aXJlcyBhIHdvcmth
cm91bmQgKGFzIHRoZSBvbmUgeW91DQo+ID4gaGF2ZSkuDQo+IA0KPiBUaGVyZSB3YXMgbm8gaGli
ZXJuYXRpb24gKFM0IHN0YXRlKSBpbnZvbHZlZCwganVzdCB0byBjbGFyaWZ5IC0gaXQncyBhDQo+
IG1lbV9zbGVlcCAvc3VzcGVuZCB0byBSQU0gb3BlcmF0aW9uLCB1c3VhbGx5IGNhbGxlZCBkZWVw
IHNsZWVwIC8gUzMuIEFuZA0KPiBpbmRlZWQsIHRoZSBQTUUgc2VlbXMgdG8gYmUgZ2VuZXJhdGVk
IGFuZCBwcmV2ZW50cyB0aGUgbWVtX3NsZWVwIChvciBpdA0KPiBkb2VzIHNsZWVwIGJ1dCBpbnN0
YW50bHkgd2FrZXMtdXAsIHdoaWNoIGlzIHRoZSBjYXNlIHdpdGggbGV2ZWwgaW50ZXJydXB0cyku
DQoNCkkgd2FzIHJlZmVycmluZyB0byB0aGUgY29udHJvbGxlciBoaWJlcm5hdGlvbiBhbmQgbm90
IHN5c3RlbQ0KaGliZXJuYXRpb24uIFMzIHdpbGwgY2F1c2UgdGhlIHhoY2kgZHJpdmVyIHRvIHB1
dCB0aGUgaG9zdCBjb250cm9sbGVyIHRvDQpnbyBpbnRvIGhpYmVybmF0aW9uIGFuZCBzZW5kIGEg
cG93ZXIgc3RhdGUgY2hhbmdlIHJlcXVlc3QgdGhyb3VnaCBQQ0kNClBNLiBVc3VhbGx5IHRoZSBw
b3dlciBzdGF0ZSBjaGFuZ2Ugd291bGQgcHV0IHRoZSBjb3JlIGluIEQzIGFuZCBwYXNzZXMNCnRo
ZSBjb250cm9sIHRvIHRoZSBQTVUsIGFuZCBQTUUgZ2VuZXJhdGlvbiBjYW4gaGFwcGVuIHRoZW4u
IFNpbWlsYXINCmJlaGF2aW9yIGFwcGxpZXMgdG8gZGV2aWNlIG1vZGUsIGJ1dCB0aGUgcG93ZXIg
c3RhdGUgY2hhbmdlIG1heSBiZSB0aWVkDQp0byBhIGRpZmZlcmVudCBpbnRlcmZhY2UgdGhhbiBQ
Q0kgUE0/DQoNClBlcmhhcHMgeW91J3JlIG1pc3NpbmcgdGhlIGxvZ2ljL2Zsb3cgdG8gdXBkYXRl
IHRoZSBwb3dlciBzdGF0ZSBjaGFuZ2UNCndoZW4gaW4gZGV2aWNlIG1vZGUuIEFuZCBwZXJoYXBz
IHB1dHRpbmcgdGhlIGNvbnRyb2xsZXIgaW4gaG9zdCBtb2RlDQpwYXNzZXMgdGhlIGNvbnRyb2wg
dG8geGhjaSBhbGxvd2luZyB0aGUgZHJpdmVyIHRvIHByb3Blcmx5IG1hbmFnZSB0aGUNCnBvd2Vy
IHN0YXRlIHByZXZlbnRpbmcgUE1FIGZyb20gZ2VuZXJhdGVkPyBJdCdzIGEgbGl0dGxlIGRpZmZp
Y3VsdCB0bw0KZGVidWcgd2l0aG91dCBtb3JlIGluZm8uDQoNCkRpZCB5b3Ugc2VlayBoZWxwIGZy
b20gdGhlIHZlbmRvcj8NCg0KPiANCj4gSSdsbCBjaGVjayBib3RoIFN0ZWFtIERlY2sgbW9kZWxz
IChMQ0QgYW5kIE9MRUQpIHRvIHNlZSBpZiBib3RoIGNhbiBiZQ0KPiBxdWlya2VkIGluIHRoZSBz
YW1lIHdheSBhbmQgcHJvdmlkZSB0aGVuIGEgc2ltcGxlIHBhdGNoIGRvaW5nIHRoYXQgZm9yDQo+
IHJldmlldywgbWFrZXMgc2Vuc2U/DQo+IA0KDQpJIGFzc3VtZSB5b3UgcnVsZWQgb3V0IHByb2Js
ZW1zIGZyb20gYmFkIGNhYmxlIG9yIGZhdWx0eSBsYXB0b3AvZGV2aWNlPw0KDQpUaGFua3MsDQpU
aGluaA==

