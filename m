Return-Path: <linux-usb+bounces-4158-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52995812FF4
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 13:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C06C3B2143C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 12:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D8D41777;
	Thu, 14 Dec 2023 12:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rm3bTNl3";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VrTKqQVT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QkGLhWYO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBEB112
	for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 04:24:07 -0800 (PST)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BEB5qN0021418;
	Thu, 14 Dec 2023 04:24:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=b9B+j7GrPxcf9wmDAcp2pJeL2/AURToXvMKZSayVewk=; b=
	rm3bTNl3PZUu4+D3kecCkTTh9Aacz+f1/RFgPfJUXPdLUTpBx0QDYkLhPC46RPxT
	wXb+rDC1uVUVOzoN6FvXwbH2ReoNmeNhZt+i+580XqFxBEh5SdRg5CbxDOSR2Rdz
	eU1kiMTCXTeAkbA/jePmwOEMYyPtO6EAJ5+QI7JGziHdR9JTEls6LmzKRvswsxE1
	zylT6DTZu11YBVENQV6R3KDW2/nWHd4NAMJn7ZDNsPucpCv+wpdW6N7oASGSvvAG
	L4zuGL69Um6Dd7cClN4RF0NSGjWtG4ARaX2DSZErmPC19Pv4jlY/JfvcV81a0wDW
	wNttgLqOUEp129y9WRwmLQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3uxnyx5c0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 04:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1702556643; bh=b9B+j7GrPxcf9wmDAcp2pJeL2/AURToXvMKZSayVewk=;
	h=From:To:Subject:Date:References:In-Reply-To:From;
	b=VrTKqQVThpz0gnb+GUkYVEzTcnHugqSWF5fOQ1sP4Vu6QZYjlX92R+cBiiEuPv+vS
	 VG8NI2IO3yu6E+i8AybycsXrqyxua0YpMj/RP2RBE68Fl0qWo0dc0X3zkT4iv2fj57
	 HG64G2bS8WAMAmRDYlKKO3UYGaTb8NGrtaW77WOi9ApskvgTAPE/L/cXD80kga/coa
	 yhPtGRTbT2ZL6D5ftooohJU9ri+C4f17yhW5k6OiKbrLulkW/KrYcLjihGcxneshMd
	 obP2v/ejqOglSlwiUPe8XOcVFd9Shm3jpZBmWEYyJn/XfcN26frjQ+M7JE9cQP+Jpw
	 QFb31D1DZhvww==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 77C4640407;
	Thu, 14 Dec 2023 12:24:03 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 1D572A0267;
	Thu, 14 Dec 2023 12:24:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=QkGLhWYO;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6CE7A400A2;
	Thu, 14 Dec 2023 12:24:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkD5jwe1DOyCWEb+hOfo3zpFB2jBDnlzYKxehsyZos/QBQvuuu99YIlaiaccmPjDdTO1a82iOuIITakIoYG/fbie+iC1rIf/aKnLGAUYz0kQ0MJOWp5FOLxZstqxDNg0A4VHyGpsRwR6ABbh+j2yPNql5nonh9JSmNAEarohYE8Zu5pBvhGxqlXXYEnfaWKV/HiqTjO9AmBUQb4x3m9xFTQOCabrxbD88XuF4K1g5KR/Z/62yP/JZmb7AujvN60nxDyQtBDaMoMwvzxHYJwiHVr2RWnELBtL48kiPeNiIH1rOklXkzyqnkP4z/y/TzKqNrMToX8GAKOXOGf5XhEJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9B+j7GrPxcf9wmDAcp2pJeL2/AURToXvMKZSayVewk=;
 b=JtvVbmQW3q1lOy9W3B4HFMY/R8Kj0mJ2d2GWdgd8AhJhKOnvgbk8rCZGwHmcrOV7jbKWup1BRoT4VyjIM3GpuIN/ovCdXmxIQWeDUrNwMRB2Kh2nwpiX+x7gmNgGXn4nxAvqp11IPfOaoAOhbNJ6Pxw0l8UM9RTKphxF1mteFMtpOp6fQDN6yF2Hm1aOsFnC/GQdbEAOkZVwQNhum+2Z+HEdDHA/nzdGV9lUazoFMN3TlM7z5+1RnrPg5Lr9piJSYNQusi7iZB2L5TiHty9mrUheXxlEFYkCQJkfrrq4Ys4DCYEuexy7cqeJHS6w5w7o+MpkM5HrEBDWUy1mIG52Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9B+j7GrPxcf9wmDAcp2pJeL2/AURToXvMKZSayVewk=;
 b=QkGLhWYO0q/jASyrhaCy1vBkZlY184xzR3A3UChkDo2qpwL6TlpJTkBZTQd+PrM1YhLvcvOxrkiRANpuBCGKAmo628TfzU7bVlfgBwXkESRLCAnQBk1pMtS9JZCj1f4SNhvColRPzMqOQtgxJ9oXIZINC+L9p/1k+wXO6hsa/qQ=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by SA1PR12MB6725.namprd12.prod.outlook.com (2603:10b6:806:254::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 12:23:59 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::94f2:3161:83a2:4680]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::94f2:3161:83a2:4680%3]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 12:23:59 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Ivan Ivanov <ivan.ivanov@suse.com>,
        "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrea della Porta
	<andrea.porta@suse.com>
Subject: Re: [PATCH] USB: dwc2: write HCINT with INTMASK applied
Thread-Topic: [PATCH] USB: dwc2: write HCINT with INTMASK applied
Thread-Index: 
 AQHaF9Jh+M4x1h3P7ECYkgn6i43CXLCGUQGAgAegwICAAByPAIABdJ8AgAAvCwCAADDCgIAEb16AgALo3YCAEaY1gA==
Date: Thu, 14 Dec 2023 12:23:58 +0000
Message-ID: <07250e1e-c5ca-0586-b53f-7f2bb3d19b39@synopsys.com>
References: <20231115144514.15248-1-oneukum@suse.com>
 <f0bd323a-8384-e303-907f-5d533af6d71e@synopsys.com>
 <ZWRbkdTASTNJB8Fv@apocalypse>
 <f293d306-54fb-ecb5-4515-70a6c1faf1b1@synopsys.com>
 <ZWWsGknhNuVggNNa@apocalypse>
 <bfb8e693-7085-430c-0481-3d6630168240@synopsys.com>
 <d8176b8a6851974a692804f006d59d3324903b62.camel@suse.com>
 <079ddad4-ab41-49ac-6d86-d90075320dcd@synopsys.com>
 <ZWwltzMB8gq5k5oe@apocalypse>
In-Reply-To: <ZWwltzMB8gq5k5oe@apocalypse>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|SA1PR12MB6725:EE_
x-ms-office365-filtering-correlation-id: 9da73cc0-f2d4-4e88-74f5-08dbfc9f8c42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 57VrD9hZ0lAR/oWHhlPC2/fUY996AKTc32m5w9PtGKVvZH+aTgf9jUWbKIKs+5XnoEMfYfeFQf2HJVq4MQUwTkxOAsOQz9vDYce2HZT8MBlNRqcz3cqxmKNcbue1t+fl1pB4RyY+3orPnGzAj5rLpOTQGQSED+yJ7MzjpSMZ7n5Y84D1QFBYW8azs9JSXZLE0SUzQ8htK1c//04yJ81xXE4fKI1urAU8M0Go4+bQ+F6FAl1Cg2XCHJdqogJQhOe6vUtzXAz6w+3YJaYrJRbaoCGDN86Qa8r7BORW8PD0XhLB/R3XPbxG1NXC7T/b3U8NHLVoHW3PlxcsxqKd7Zfty7ZFd5JzfhYv0PjJ9J3/cYgBUwCZhpyIMfhHNUT8LX3ewQtBrEv3emPdNIz+osDuUKSKprUY1czEkM3jxHjLfMMG2vUAm4ftyHSmxO8V3LLzBNiPP7GHNimPa+1Urn/jYfrzy735PZl+MpcnFhSmF9gHOYSdMSdz/0zaXWl3pOoBx21LEKrjXJofQQQe8AJK2coGtf0dI1fG3Is64DYeJ5Ji0SoL6txvsDQ4sdoX5PQnmtThwXS3+Cn9HbeOnUdAUGWnLER3QHqSSFZX8sEEFkOsf9LLoOTzu9qBfuEO0i4ucMuZnNoTahOr2nzprIWufWiM6nGzyNi8bSZeIUN9U2OvU6DDtlGc8hrJcVRBqx8i
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(26005)(66899024)(38070700009)(36756003)(66574015)(41300700001)(6506007)(86362001)(122000001)(8936002)(71200400001)(53546011)(31696002)(8676002)(6512007)(5660300002)(478600001)(31686004)(38100700002)(6486002)(76116006)(110136005)(91956017)(66476007)(316002)(66946007)(64756008)(66556008)(66446008)(2906002)(2616005)(4001150100001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Qm94bkdnZ1J0ZWlGTFNBVWd6VUNnRi9zUlZJQW9MYkhjcDVEZ2VWd0RsWU1i?=
 =?utf-8?B?T05QMWwrcndxamRkL0plODlnRTFvNStrSnNCd000Wk01TWdNTFM5SUFFaEdE?=
 =?utf-8?B?S0RMV2dDcXhuWUxGMVlBY3NjMTF2SzRvTjlndmJ2QVBaU1RFUFFtSi9rVjJF?=
 =?utf-8?B?WTdPczJoQkFEYmtTdW9ON1FrUVZveGw0ZS9wUTFBd29xMGFwT2p0cjJxY2NS?=
 =?utf-8?B?OExYU3FxY05RaUxvK3dHVUhFZldmOTBhTEp0S3BLd1ZDNk5VMEdKSSt4SFEz?=
 =?utf-8?B?bkRBbHdjYlVlOG1PV2Y1Vmpod2szcG1RdzI3d0dJOXVoSEUxT1JRM0JnUEZp?=
 =?utf-8?B?amN2bi85VjhjWUo2NVQ0UXJ4THVOZE01cjUwbHdZWnAycEpWQThOTWdsYlV5?=
 =?utf-8?B?WkR0d24zc1VMWDduSHYySnZLM1VGbFBQUFNiaEE1STFhRDNXZzhQYk40NW1x?=
 =?utf-8?B?MEx2ZlpOZkplT0lGL2plRTdrK2tHakh4K0x6R0hMZzRPU2gxY2Yrc0hiN01t?=
 =?utf-8?B?WE02UFpxYldNclRSdVpqdEpRYXFVUXE5ZmlvU21XQkZ4Si9LMGxqSTVNSU8r?=
 =?utf-8?B?WXdUWEQ1cFBaa2o2VUJDNEJIT0FpZmNBYktKbGk1cG93N3lhRkIyODlQN2dT?=
 =?utf-8?B?UWtjMnNJUVVNWmE4WGUvRlE0di9PRVJLd3BOTWFPaEpHOEZSazQ5WU1OVFZ6?=
 =?utf-8?B?S1NMUzRLRHFlcklQUWNMSklsVFE1TTRKN3NpMloyb3pzSE9mUUhuNHRQb1RN?=
 =?utf-8?B?UWdZcjFxd3NBR3RIN3FlWnRUWnhndTEyeno0OGxWOXAya2FTRk8wRVBSa3ZE?=
 =?utf-8?B?MGVSSHpUWm10NUdXUW5XV2NlOXNSSDM2NXpmREFDOGVQaFRBbGRMc1JHRjhn?=
 =?utf-8?B?aVV0d2ZxUkcyOHpCd1lHVFpCTDA0Vlo5cUZsWXZwNGFwQ1pZS0E1YnRSTFEr?=
 =?utf-8?B?VEV3QTV1Z3BZRnF5Nm04RDUxeGlGOXlTWWIyZURYR2VWdFA2Sytma0g1d1Qy?=
 =?utf-8?B?dEZRQ0lnTld6WHVsU3dKK1JWQlM4ZFplaVcvVFhDcmJCbG5wbU9pQlc4RGs3?=
 =?utf-8?B?NE83QjBCcXN4TkdkWWNQRjc4MWgybUE3aDlnRzJTZGFOdjdtSkVvaStNNnFq?=
 =?utf-8?B?M1lwYzBJOGNnd3RhRmQ2V0JGbTJpZjQ4NTZZb0xHWGw5VENDNG04ZHNSV1ZJ?=
 =?utf-8?B?RGxvMFZrSmUrbm1oOVEzcmxGWXQ1VmliRTlmdUJqaXl2OVhpZTVXNmRZVGk4?=
 =?utf-8?B?aVo2ZGgvSjhkLzM3UDBwcXlUQUFZUE5aOUJvODFBc3diL0lTTVlaTHg0Znhw?=
 =?utf-8?B?dUl2bVlGcjUvSlplQzcrUmxpRGdIbTJZcnJKSlpsbjVhSENRTmw0c2JjZzA4?=
 =?utf-8?B?RVI1eU9xd2daWEFMaS9uOVdhYk1sU3ZiUlBKV0VaYUJUT210Q0xxZ2VMRU1H?=
 =?utf-8?B?R2dFRFRsbVREUnJRbThYZUhFeUhkU1Q2SVdhN0wwbjZHSFRGOUlVMVl5QnN2?=
 =?utf-8?B?T3o4azk5K0JJRlUrdzc5NWtJU0lzdVlrbUdwRlNYNHh2amE5bzZxM0oreGFv?=
 =?utf-8?B?b2F2SHJ6N2xNNlZqUkwrUjlwcnRVb2xBV1ZmcXFsTFd6S3VCdEsrTjA3RVNL?=
 =?utf-8?B?T2FNc0pxSGM1TUxmL1BCUmVRMnlScjl2RjFKUW8wQURWRGtXOFRRbWJmSmlS?=
 =?utf-8?B?VkpMejJmWXJ2VkJ1cW1hNW42aWxCTFhOaTh6aDY1T1FxMU5tR0xadit1MkRH?=
 =?utf-8?B?VWdVSDQrc240YVJoSWk2MEZFdGpxSmhvZ2RsdGNRcUlDeVBxZFpQRFZFckZs?=
 =?utf-8?B?Y3lxR3JYOWRzUWVySTJ6WDRqQkJmakhCSjBlRFM3RzhCaElSUWdtNjJJNm1a?=
 =?utf-8?B?Rzlrck9WSUZiYzZsaFVHR1NiQWUxemw4ZzhCMlNMNDV1SlZ2NWYyZmd4RjRT?=
 =?utf-8?B?ZVFFaG1VdVV2R0VoWGxSN05Ya3lqTWRIbkp0Uk5YMU5YcktWTnJFVW11cGRY?=
 =?utf-8?B?enVhUS9peFdneldrNkE3RmlFYjRPQXVvdEtjcmNqYldhU1hsajRHbEd6bmFm?=
 =?utf-8?B?a0NNTWFkWDgyVGdyYWxXRXZReGJRenNzdnF5NlZJZ05mYjMyL0ZRVm9pNENO?=
 =?utf-8?Q?CaRsDLwGXkywxGjI+PiRMjO0G?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <143075EAAB6CB3429246ED8B626EF2C7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	lwTgu7gsBYFzBCY1jXuweAgBnhPKa4cWN4rKO60ypW0Hi/S7+Ci1e8Rh9IQIP+1RSKGa3bsnZA6c8lCi9JujDY7Vc6RY0qqNeHZJcy5OukOslJqp4wP1GN8idDswfv3cw9KKVtrFs4yPsA22l28oL9Gg3A8RnJLVEKnkcuBfVaiD1jDX08jD9kiR5bTxBnBPFC8ECoqdmVdqBzU28IcYV3CcukG+5BPiBbL+uS3VCWYTt7Q70ebBgA5BZKq1xCdhAIcvM646h9v7wBeizZnolw/mCRiG4DDXoKRCvCfRpKs3m08GrmwXspPNL9Hlzeqjgogi+xm8epj+A/yHSd/e1TYIAhlP/svxr56Mh5LN2C6G2esDKYwaQvYWTM03czj+idmgkNAbY0eHijA8CZfTmBlKsItjKkVgfOlDCd3/3Nsxq6m7jx3FrRxqAk/3ffzcXGVamgor4D0u9uOuHXw0WCijkfQzOjc3kpDGegtfOCXKVqS5zD/vJgUw7I5hl+43186ufTX30KAS433+N23ytBRnjs+y18pQ+kmmgCS+qoCN8L8/mosl/ILv+O4ZHTz+meWrYxs1/wjBTpZN1GTNGlX/RPmPmo3BkmjK0Vkm4T5t9LHOJnisnUoQCkHX4tFXAykrRZFEF4sB4Hadp9PCww==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da73cc0-f2d4-4e88-74f5-08dbfc9f8c42
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 12:23:58.6196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CoFBQHVsSRSW+cq0RTcL7BjBHm8hQ7WqArMBMO8Dhhd0GzsAe3HBllYwqV0pbL2pkWwHwrQ/uDAzVYS5I4mZMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6725
X-Proofpoint-GUID: XLxL86boc_oP-SoPJdiFF17CNPYCfglZ
X-Proofpoint-ORIG-GUID: XLxL86boc_oP-SoPJdiFF17CNPYCfglZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 phishscore=0 spamscore=0 mlxlogscore=452 mlxscore=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312140085

SGkgQW5kcmVhLA0KDQpPbiAxMi8zLzIzIDEwOjUyLCBBbmRyZWEgZGVsbGEgUG9ydGEgd3JvdGU6
DQo+IEhpIE1pbmFzLA0KPiANCj4gT24gMTA6MjYgRnJpIDAxIERlYyAgICAgLCBNaW5hcyBIYXJ1
dHl1bnlhbiB3cm90ZToNCj4+IEhpIEl2YW4sDQo+Pg0KPj4gT24gMTEvMjgvMjMgMTg6NDMsIEl2
YW4gSXZhbm92IHdyb3RlOg0KPj4+DQo+Pj4gSGkgTWluYXMsDQo+Pj4NCj4+PiBPbiBUdWUsIDIw
MjMtMTEtMjggYXQgMTE6NDggKzAwMDAsIE1pbmFzIEhhcnV0eXVueWFuIHdyb3RlOg0KPj4+Pg0K
Pj4+PiBEb2VzIHRoaXMgInNwdXJpb3VzIiBpbnRlcnJ1cHQgYnJva2UgeW91ciB0ZXN0cz8NCj4+
Pg0KPj4+IEl0IGlzIG5vdCBqdXN0IHNvbWUga2luZCBvZiBzeW50aGV0aWMgdGVzdCBjYXNlIHRo
YXQgd2FzIGJyb2tlbi4NCj4+PiBidXQgcmVhbCB3b3JsZCB1c2FnZS4gWW91IGNhbiBmaW5kIGNv
bXBsYWlucyBhYm91dCB0aGlzIGVycm9yIG9uDQo+Pj4gdmFyaW91cyBpbnRlcm5ldCBmb3J1bXMs
IGp1c3Qgc2VhcmNoIGZvciBkd2MyX2hjX2NoaGx0ZF9pbnRyX2RtYQ0KPj4+IGFuZCBpdCBpcyBu
b3Qgc28gZGlmZmljdWx0IHRvIHJlcHJvZHVjZS4NCj4+Pg0KPj4+IFdpdGhvdXQgZGF0YWJvb2sg
SSBhbSBub3Qgc3VyZSB3ZSBjYW4gY3JlYXRlIGJldHRlciBmaXgsIGJ1dCBpZg0KPj4+IHlvdSBk
ZXZlbG9wIGRpZmZlcmVudCBzb2x1dGlvbiBJIHdpbGwgZ2xhZGx5IHRlc3RlZCBpdC4NCj4+Pg0K
Pj4+IFJlZ2FyZHMsDQo+Pj4gSXZhbg0KPj4gMS4gSW4gYWRkaXRpb24gdG8gSENDSEFSeCBhbmQg
ZXBfdHlwZSBwcmludGluZyBwbGVhc2UgYWRkIHByaW50aW5nIG9mDQo+PiBHUlhGU1RTUiBpZiBF
UCBpcyBJTiBvciBHTlBUWFNUUyBpZiBFUCBpcyBPVVQsIGFuZCBwcm92aWRlIGRtZXNnIHdpdGgN
Cj4+IGVycm9yIGNhc2UuDQo+IA0KPiBIZXJlJ3MgdGhlIGxvZywgYmVmb3JlIGNvbWVudGluZyB0
aGUgJ2dvdG8nIG91dDoNCj4gDQo+IA0KPiBbNjg0ODI5LjIwNjg1NF0gLS1Ib3N0IENoYW5uZWwg
SW50ZXJydXB0LS0sIENoYW5uZWwgMg0KPiBbNjg0ODI5LjIwNjg2Nl0gICBoY2ludCAweDAwMDAw
MDEyLCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+IFs2
ODQ4MjkuMjA2ODc1XSAgIGhjY2hhclsyXSA9IDB4MDE1Yzk4MTAsIGNoYW4tPmVwX3R5cGU9Mw0K
PiBbNjg0ODI5LjIwNjg4M10gICBHUlhTVFNSID0gMHgwMDBFMDAwMg0KPiBbNjg0ODI5LjIxNDg1
MV0gLS1Ib3N0IENoYW5uZWwgSW50ZXJydXB0LS0sIENoYW5uZWwgNg0KPiBbNjg0ODI5LjIxNDg2
NF0gICBoY2ludCAweDAwMDAwMDEyLCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZoY2ludG1z
ayAweDAwMDAwMDAyDQo+IFs2ODQ4MjkuMjE0ODc2XSAgIGhjY2hhcls2XSA9IDB4MDE1Yzk4MTAs
IGNoYW4tPmVwX3R5cGU9Mw0KPiBbNjg0ODI5LjIxNDg4Nl0gICBHUlhTVFNSID0gMHgwMDBFMDAw
Nw0KPiBbNjg0ODI5LjIxNzg1M10gLS1Ib3N0IENoYW5uZWwgSW50ZXJydXB0LS0sIENoYW5uZWwg
NQ0KPiBbNjg0ODI5LjIxNzg2OV0gICBoY2ludCAweDAwMDAwMDEyLCBoY2ludG1zayAweDAwMDAw
MDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+IFs2ODQ4MjkuMjE3ODgxXSAgIGhjY2hh
cls1XSA9IDB4MDA5Yzg4MDEsIGNoYW4tPmVwX3R5cGU9Mw0KPiBbNjg0ODI5LjIxNzg5MV0gICBH
UlhTVFNSID0gMHgwMDBFMDAwNQ0KPiBbNjg0ODI5LjIyMjY0N10gLS1Ib3N0IENoYW5uZWwgSW50
ZXJydXB0LS0sIENoYW5uZWwgMA0KPiBbNjg0ODI5LjIyMjY1OV0gICBoY2ludCAweDAwMDAwMDIx
LCBoY2ludG1zayAweDAwMDAwNDI2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDIwDQo+IFs2ODQ4
MjkuMjIyNjcxXSAgIGhjY2hhclswXSA9IDB4MDFkOGQyMDAsIGNoYW4tPmVwX3R5cGU9Mg0KPiBb
Njg0ODI5LjIyMjY4MV0gICBHUlhTVFNSID0gMHgwMDA3MDA0NA0KPiBbNjg0ODI5LjIyMjY5Nl0g
LS1Ib3N0IENoYW5uZWwgSW50ZXJydXB0LS0sIENoYW5uZWwgMA0KPiBbNjg0ODI5LjIyMjcwNF0g
ICBoY2ludCAweDAwMDAwMDAyLCBoY2ludG1zayAweDAwMDAwNDA2LCBoY2ludCZoY2ludG1zayAw
eDAwMDAwMDAyDQo+IFs2ODQ4MjkuMjIyNzE0XSAgIGhjY2hhclswXSA9IDB4MDFkOGQyMDAsIGNo
YW4tPmVwX3R5cGU9Mg0KPiBbNjg0ODI5LjIyMjcyNF0gICBHUlhTVFNSID0gMHgwMDA3MDA0NA0K
PiBbNjg0ODI5LjIyMjc0MF0gZHdjMiAzZjk4MDAwMC51c2I6IGR3YzJfaGNfY2hobHRkX2ludHJf
ZG1hOiBDaGFubmVsIDAgLSBDaEhsdGQgc2V0LCBidXQgcmVhc29uIGlzIHVua25vd24NCj4gWzY4
NDgyOS4yMjI3NThdIGR3YzIgM2Y5ODAwMDAudXNiOiBoY2ludCAweDAwMDAwMDAyLCBpbnRzdHMg
MHgwNDAwMDAwOQ0KDQoNClNvcnJ5IGZvciBkZWxheWVkIHJlc3BvbnNlLg0KSSBndWVzcyB0aGUg
Y2F1c2Ugb2YgaXNzdWUgaXMgYmVjYXVzZSBvZiBjaGFubmVsIGhhbHRlZCBpbnRlcnJ1cHQgbGF0
ZSANCmZvciBhYm91dCB+NDAtNTB1cy4gSW4gYWJvdmUgbG9nLCBDaGFubmVsIDAgdHdpY2UgYXNz
ZXJ0IGludGVycnVwdDogDQpmaXJzdCBmb3IgQUNLIChYZmVyQ29tcGxldGUgbWFza2VkKSBhbmQg
c2Vjb25kIGZvciBDaGFubmVsX0hhbHRlZC4gVGhlc2UgDQphbGwgaW50ZXJydXB0cyByZWxhdGVk
IHRvIHNhbWUgQlVMSyBJTiB0cmFuc2Zlci4gSWRlYWxseSB0aGVzZSAzIHNvdXJjZSANCm9mIGlu
dGVycnVwdCAoQUNLLCBYZmVyQ29tcGwgYW5kIENoSGFsdCkgc2hvdWxkIGJlIGFzc2VydGVkIHRv
Z2V0aGVyLg0KVG8gY2hlY2sgaXQgbGV0cyBkbyBmb2xsb3c6DQoxLiBEbyBub3QgYWxsb3cgdW5t
YXNrIEFDSyBpbnRlcnJ1cHQgaW4gZnVuY3Rpb24gDQpkd2MyX2hjX2VuYWJsZV9kbWFfaW50cygp
LiBKdXN0IGNvbW1lbnQgImhjaW50bXNrIHw9IEhDSU5UTVNLX0FDSzsiDQoyLiByZW1vdmUgY29t
bWVudCBmb3IgImdvdG8gZXJyb3IiDQozLiByZW1vdmUgcHJpbnRpbmcgR1JYU1RTUiBhbmQgR05Q
VFhTVFMNCjQuIGJ1aWxkIGluIG5vbiB2ZXJib3NlIGRlYnVnIG1vZGUNCkl0J3MganVzdCB0ZW1w
b3Jhcnkgc29sdXRpb24gdG8gY2hlY2sgQUNLIGluZmx1ZW5jZSBvbiB0aGUgaXNzdWUuDQoNClRo
YW5rcywNCk1pbmFzDQo=

