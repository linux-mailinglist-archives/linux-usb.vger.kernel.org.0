Return-Path: <linux-usb+bounces-5881-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F05849E9B
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 16:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F25451F21E7F
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 15:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A692E636;
	Mon,  5 Feb 2024 15:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="X7rJA15O";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ar0AM+rn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Pi/su1Kx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D8032C8E
	for <linux-usb@vger.kernel.org>; Mon,  5 Feb 2024 15:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707147661; cv=fail; b=RQ+hmb97iBH8LFsGbnZEFA6X6z8Jp1Gu1uoiOBvTKMpsfZORtxWuRb7v7Z3iAon/+4e6g38A21jjD1NAdkXz2ZBI6e5XQ31oKKSdXu3qEKOsBZyKTBYzL4HftLQhXZRcdgfv0h/+YK42EkSc9G2L6XiEFS1BA305IETaJ0N1L/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707147661; c=relaxed/simple;
	bh=rFS+TcxB73DYlkf1WXgm7YsRrhP+sztgq4n3ktvYeVY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rk8WnXlNEbVzcHEtBiid5j3O+wbgd/E61rk5JrB6hTWddj6FXX9k9W7cea+MuD8ZgqoXmrBsFYv70w5HsOVlUcBVy3qkFMdT3vmrHTCnTUkiha9O5w8bfBN9mpI+vB6M296Db5Yoy+zHwKBv6iwi34SId3lSLNNBpGDPWYLmyAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=X7rJA15O; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ar0AM+rn; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Pi/su1Kx reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415FaKDU003213;
	Mon, 5 Feb 2024 07:40:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=rFS+TcxB73DYlkf1WXgm7YsRrhP+sztgq4n3ktvYeVY=; b=
	X7rJA15O8uU8X6BgEyM5KZ5D6NsuLRvdkaNGOF3IpizReQj7zhzb/dmCCM2q+5rk
	yZcebsLMnZ5nRxKeIUo26V+gs2lShEfiaLo7TUcGD6PYviyGMig03f54FlV4xbU9
	gz7YWxgSUw/2Z7w+XTCV+bc20lglB9N60c+RP/InWh8nTgycoUR/rtnJnfZKRvwp
	2lcgTMusXtA29ktgnXyMf3h2u0cfr0WoqnKFbM4CZ3xYvl485aUR8MlREdcmT0RN
	n+qX+sQP/MFOMFOvgtlNUvLjR+sn+uTASCY8uY4nKX+1deOc6AuDkaMS2YLAJf7h
	nUJwdCRAjIv+GT09/pilbg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3w1nm6pujs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 07:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1707147648; bh=rFS+TcxB73DYlkf1WXgm7YsRrhP+sztgq4n3ktvYeVY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ar0AM+rnUN6WUl0oDdbOBKq0Ino7/CFY5Q/i0pRYchLbbc8sO2dsow9diJ83b4A2W
	 8BAwM3c9libHM/mxn5UcFJq94PPnKcgHGpHTfHDQHI4wYjLSO7hJrNUF7fHfqFYEmY
	 WWnexfrFN6OqNiioWAeW9nv1rqfq7Os7U/zT0NtRwpwzzCQb5Gwx9XZPg+OZXixqQh
	 BjTjpsyJskt3tivTfCiV4u8Rye7SuNayjRuNowS3bHb3km5ZCg4sNOOBppRSyiVE5X
	 QzOrNkIQWbX+of98kMbSC3SveDO3cY3lVK91SB+/8ivRhH/UBHCk49HxxN8y1MQlAf
	 Bl6LmZ3sy1+Lg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 97A18400A2;
	Mon,  5 Feb 2024 15:40:48 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3A78AA007B;
	Mon,  5 Feb 2024 15:40:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Pi/su1Kx;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7AF3740408;
	Mon,  5 Feb 2024 15:40:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+Nrfy97ze+zFKT6SW6pGKXf/0r2EWFSt5TuA9liBIEjSFmBOAlc3Fl7tIFlF5+1y21xF3raRfsz6904jNfiB6WrfNkpXbHjcVuE3VO/2TuLEIjqPX5/D/N3mhpfusNDIwT7Tl7jfu6933W6m5/ocu/7yqS1E+KFH4yuxXjXT84qfP/Z0zg8Gpb+KaiY0/dTiDIuLRRU9F74HwO91Yofl7rwKJdqhzv1d+ikAq/RbUgnGdzTVenA2hoS8b1SvoYGM0vviNVWVH6uuGwCZj8SzL986vC40XwIvHpO6BmdgFeoWeNK7rvrEUsPF/0PChOzouSpOIOPO++N+FEI7O1qDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFS+TcxB73DYlkf1WXgm7YsRrhP+sztgq4n3ktvYeVY=;
 b=DOqwxvP6DJGokx0i7aKhYFBjP5EyYtkn9WmKJ20ejod2IPw2ewZuLjaiHfxokS/CxDUIFAI2q4SnPWEnfBHtXvYjbOFqBdglFChsUuQ6z8cG92+/lM2ccP95x0bvkFk1bSg6V8FuKMs5IOp1Fq1ON53M4vOI55pGFe6N1mw9vcw4YKHkcD7KMDMTtUzrpF7Zx0Q4PB/dAVnvyVxMbRPiacG3ZrlIDwIXtC9GZ0dkVZhbudxMi2hT+6/ItDkSy9YkjoN4S6AsPuG0pXwDYd0EqXslR97zXuJ4wtGnuGW1/Q/zKvwkGhqtOcabAdo95kJ6rnntupzc6Mtd38K01Gafkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFS+TcxB73DYlkf1WXgm7YsRrhP+sztgq4n3ktvYeVY=;
 b=Pi/su1KxSx8keJwlJ5YingQ8FlKLHJnCokkjI8Cv7+OzdUd3u8XXoIXXJAW2OWcTulfO09lMZGVPnaGQXVKM8emZ208aWNRYzokTs0J2T7qqnTbN51WfE1MzHhZkzh0LQ0HOq3+2HreO0yl1ZBeEC+uzy/Szn8zSExh8dZGYV9s=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by IA0PR12MB8895.namprd12.prod.outlook.com (2603:10b6:208:491::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17; Mon, 5 Feb
 2024 15:40:44 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::5866:efa0:7f40:cd66]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::5866:efa0:7f40:cd66%3]) with mapi id 15.20.7270.016; Mon, 5 Feb 2024
 15:40:44 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Pavel Hofman <pavel.hofman@ivitera.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: gadget: dwc2: RK3308: Transmission to EP OUT stalls at
 larger packet size
Thread-Topic: usb: gadget: dwc2: RK3308: Transmission to EP OUT stalls at
 larger packet size
Thread-Index: AQHaWDlYK+JmFGKVjk6y9CgXZKFNMbD70I+AgAASRwA=
Date: Mon, 5 Feb 2024 15:40:44 +0000
Message-ID: <fb6f2c71-0362-0f17-bd86-725f772710b4@synopsys.com>
References: <91811ad2-991e-bd34-b3ec-2b92229bdd8b@ivitera.com>
 <758d6e5d-d5b4-2bcc-bd51-fb7b49356532@ivitera.com>
In-Reply-To: <758d6e5d-d5b4-2bcc-bd51-fb7b49356532@ivitera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|IA0PR12MB8895:EE_
x-ms-office365-filtering-correlation-id: e56a9036-acc8-420d-db8c-08dc2660d0ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Ebew1VTsKWZZvV08xD6iba7wJJTgwQKjIpHD9IB4zDpaLPjKZPPn0oB1kVKFk6a+H1jN8kTkq57dobQFByJGvJnklAAVUtnXjctkZj9H9uacMKTS8iAFxGOc54uZsMMTQ3EfeG4/h8yj7+mAfRUoSe0t7PU4Swo1w+tz3rx0Cpk1eZdj6k0PsoQquDFQTUdZ8/ueRDH35vXJAihQU+nCVOuXUozqAKbD8KAPTP5mlZHRisk/VmBZhdUSLHXW7sKv64bZ0l1iSBSJGOPU+ckGtN/mMggAjajInlcwMZ9UIpOj6Wz3ZFHmlXRfz+Py2eeYEvLs4/Ow7224tcKV7eh6SAH0I7QSW89i3eI82Muoap3Kzs4ZuczzmqgPnRr7rNyzpd64ntKsDyyUtEBluwW7K+OZ+n7C/UxR8RJEhGpfOBmwK2A2qTVA93Gx+zIWzhnktsIpjmnOACvjifxbJ0lbnsDiRN74+MegYYRwykLrCAe2sC7D4YstcqUNnyFCpzBKyKEjhf2i7VAanj9ww9LvFyGZe7VxFh1Bbw5/C/dLH0hJpLZeRqI3De8NNBJsV9ZyBvUt51pAGi2Sd0UN1N8xk9DZJqJeAgxBkA7IA54ynOltJXhOi9LhEt59B+xctqaH/iLTCCJXsyutpQa1M1V9kjhSMBHrI3jjpg2TFC125Wg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(396003)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31686004)(41300700001)(36756003)(2906002)(71200400001)(6506007)(4744005)(26005)(122000001)(38100700002)(53546011)(6512007)(2616005)(38070700009)(316002)(66476007)(6916009)(478600001)(76116006)(66446008)(86362001)(64756008)(6486002)(66946007)(4326008)(66556008)(31696002)(8676002)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YUhBYnJlRkZRdEc3MkJ2K3hCOFhPOG5hR3I4MnQ3bE1QeUxzMUpKN3poYm1l?=
 =?utf-8?B?MDRJb2JGaDdmMng1TzJqMGd5SDJLaXVIU2pydTYvb3ZDdHhOckUxVVJXRUxJ?=
 =?utf-8?B?dTcyeVdDWlNVV1g5K3ZwbG9aSkZmd1N5b2huTHdNY1NUVHVZWmVhdmFBSkNX?=
 =?utf-8?B?MlAyS3RSLzNUcU4raEhvUkJuZnRiSzMyUUg2dTVycStTWTdJMHIzSGN4d2Ft?=
 =?utf-8?B?amZBVS9xTGlrV3FNd2VYUko5VjgxVUo4ZUh5bTl1VE5BUE5EdWozY2pjZGRI?=
 =?utf-8?B?eHd3eHJ4cVIxR0pMSi9qQm9YWnlMZzBYdWg2eXluTzE5YWlKNkVNMDZwZ2Vv?=
 =?utf-8?B?RnBEQ1p3VU90Qjlwd2Z2YlRmUDJaMFV5aXkzeDBUSCtCb3NYcERWbXpiTUp4?=
 =?utf-8?B?alR4bmxOSmtBa21QYlZRQnVTZ2tLOHAyTnlvSmtPNXV3T3ljdEs0R1pGMXVm?=
 =?utf-8?B?ME5kTmFDUEhqLzl0c3NPSkxuVHUxKy8rWDQvSE55RDFPRWJuaEp1TWZkNE9T?=
 =?utf-8?B?WGw4ZVhFMFkvQnJTTEk4azdyWUtiN3NDMTY5QVQyV3I3TGsyVkNqNDJjS2Mz?=
 =?utf-8?B?eG5YMlp2WEFTZ0RmVm0yTWtzUkJMVE5GdU1DZXBpRkdpMXdZTnUwMUVEcXpZ?=
 =?utf-8?B?TW9FM3BiTm1FdnhmQ0U3WXFhVGdkQ3J0NS9WVHdNV3BNRENkK01JTkFFMWli?=
 =?utf-8?B?VTFORlVnNHczNzVKbjU5Tk9FbnVDWTFwRC8vZjJNdWFTNk9rR3Z5MWJqSUVw?=
 =?utf-8?B?c2lTOUZSRnZrNE9xNmNuWlZDeUIzTGZnNzFMZHozRms5bzhxQlRlekhSaEFn?=
 =?utf-8?B?NUozZldHT05pODBBbVdpVG53emw2UEpORmgvcFRrS0VhWXE2Qk5ZelZ6WWJ4?=
 =?utf-8?B?VXJieHVsdFpTbVNpZE1UaDJ1ZFcwK1dUaVkxN1ZYSGF0ZkloZnFmQmZueEx2?=
 =?utf-8?B?Z0E1R29WckFzZnJBUUo2ckd5WmlQaTdzektZeEdLKzFWTEZOUjZUOCtpblZV?=
 =?utf-8?B?UGlWM3FmMUxwemw3YUU5aTJxWm1FSDFMRWQzcDFjb2VzaUxJODR2N1didUlY?=
 =?utf-8?B?andQS1BWOWI1Z3luUHFvQzJFNDl2dUlrSDZkN3dMeVZYeitMMkZnMlRtd3J0?=
 =?utf-8?B?cmdOMTJYQlZyWkVDaUl1Y3YzSVhiUDF1dUFTSXVXZUJKeE8rdnBqSXlSdnRa?=
 =?utf-8?B?WEQ2Qm1PcGs2QnVlNWtNT0d1NUR0RVJRdTB0d0JySHZGMEdQZjg5TjVpMzBG?=
 =?utf-8?B?bHZpTDRNa21jbGV6QjZFY1BZUi8vZGs5TUxBQ1FpZ3ZaRi9NRG9jRkJ6cm5E?=
 =?utf-8?B?MmhJV0wvdC9vaWhUVXpVUjJ2OWs4UjFaeTBuenF5VW5QM1RON0NvR1BJWGZR?=
 =?utf-8?B?eTg0ZTRkZ1VDaHR6Y2V3NW85ck96RW5YTldSM1d0VCtzVmFqMmNNaHNscE5q?=
 =?utf-8?B?SEV2aXRJcTlaZ2JZcEMvT2RxbmNkVUhKcXJRVDVqbFJ6ZTJCTVVXUUV0MDBJ?=
 =?utf-8?B?VGkvVWgvbWdQNzhWa3IrbVJMaEZDbVlBT2Y2TzV3WFN2a0NTRlZhVy80cXZp?=
 =?utf-8?B?SmpFN09PUmhCZ0w3TlVUdmQrV1luSDRwb005RFNXQkJsSWZxUldTU0tDc3ls?=
 =?utf-8?B?dTFudVBTNGF2ZXdMdTJWL3FnY1BTOTcvckZTQVk0Ky9tTzNLWWp0N09VNnRJ?=
 =?utf-8?B?cTFCdVlYck1KamtQQmtEWjc0eWJSclVBNmI0NWJCVnZQYWk5Vzl3dGljZVVM?=
 =?utf-8?B?dWp2WUNkU0ZXcjVmZnFqMVN0a3hQb2dNRHZaVEo3K2x2TUNoTnJYQkZjZnBp?=
 =?utf-8?B?OFVwU09NMEYwaU5pU0VFNS9YY1VhTXRUQnZLZy9adnlEQmZSVkx1UHQ0N2hq?=
 =?utf-8?B?VWd5MHhyYmwxOXcwOFdnNURLbHB1ekFYRnZ6VTU4Y3FpcE53UnZ2M0dmS1Ny?=
 =?utf-8?B?cXdsYzV2cFU3NURQSmh1eDFXN0pYS0hoNVRvcVlieG5uaVIyb3dkeDZnK0JZ?=
 =?utf-8?B?aSs5TG1YREk2VnQxbjY2UFZaczRJZjlJWDAyYnd4OTltQmp5b2ZCVURlQi92?=
 =?utf-8?B?M211cVFUMHlUcWt1UldHc3ltQXp2S0lvWFdpdWZyclZjb2wwaDJzUDQxNVVM?=
 =?utf-8?Q?uOsqFj7nOEeFKX7JpK37xKxX+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8522395EF5C204CAD3ED1BE14900F00@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	l7iK1pczYjTUTukVTFLLaBFBTFQ0c6w4SQpTbgR0ldDtWdI3gKViZFhlZbjJiuh1L3oHykJIz/y2N5enwbDX2r53cPMxYsIzfosJAUWZLSrfpfqtn4UKf9z/cKcV7n4Ztd9704nxVyVNttCeHhEH+B481vHWDD1rzDxKDFOfnissbIgQ2hFQIyLhjBbv2GN1GsIR7KIepZGOYHKk+bBT1eNhniK6qS3/uI9rSObebJ+2Lof7ue63fRwKETJlWSTZrhEyBnVufLqGoLnmaqd3M1+ggAKuwN8CiZ2DmO+W7mkBjAwf2Lrt3nzR+ivT9igapDEczkb4ENZSm7CYB+fINRb26Ri3p+blGwCaOsAYGPnBZ2h0qX5+IP70pmZ26/TZ2RgkbXn0J5O3JZhmfWqYEOX3ln8oUfy9sNqSJSfc/JKsQGCqx43eW7sqOEkLmqxOuo/sC5vfj4JxmT8j8Nn2avL+WazZDIB7Ks0GSBTsnQymItq/2VutP4+W+s7tuFj7vTML4/uB+SQ7NsWrlh65aUVL9nhq1iilU8L2Ew/JAxWOV0pLoF6f7/K3rfNb+oRdhChxAqcSXDSap2EkiLXYSphgngc/tMtwlsPTdnT8vTjaF93guQWKJgHwR5QwhfRSwxW1qovDHTBrCI2a6Zhb8g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e56a9036-acc8-420d-db8c-08dc2660d0ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 15:40:44.0857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JV90IxDiPd9gTy9z+AlkHiwURZB3w+ItsRLUeSKyhuk19aMBK6BHv6UjjhOPLv77nvmU+Qwb0JyZRVdkOkE45w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8895
X-Proofpoint-ORIG-GUID: tM3HgoSUdavspPUX0yl96xQMBiLoieyY
X-Proofpoint-GUID: tM3HgoSUdavspPUX0yl96xQMBiLoieyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 spamscore=0 clxscore=1011 mlxscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=554 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402050118

SGkgUGF2ZWwsDQoNCk9uIDIvNS8yNCAxODozNSwgUGF2ZWwgSG9mbWFuIHdyb3RlOg0KPiANCj4+
DQo+IEl0IHJlYWxseSBsb29rcyBsaWtlIHNvbWUgRE1BIHBlcmZvcm1hbmNlIGlzc3VlLiBTdHJl
YW0gOTgwIGJ5dGVzLyAyNTB1cyANCj4gKGJJbnRlcnZhbD0yKSBpcyBiaXRwZXJmZWN0LCBubyBk
cm9wcGVkIHBhY2tldHMuIFdoaWxlIDI0IGJ5dGVzLzEyNXVzIA0KPiAoYkludGVydmFsPTEpIGdl
dHMgc3R1Y2suIElJVUMgdGhlIERNQSBpcyBub3QgY2FwYWJsZSBvZiBjb3B5aW5nIHBhY2tldHMg
DQo+IGV2ZXJ5IDEyNXVzLiBQbGVhc2UgaXMgdGhlcmUgYW55IGNoYW5jZSB0byB0d2VhayB0aGUg
cGVyZm9ybWFuY2UgdG8gDQo+IGhhbmRsZSB0aGUgMTI1dXMgcGFja2V0cyByZWxpYWJseT8NCj4g
DQo+IFRoYW5rcyBhIGxvdCENCg0KUXVpY2sgYW5hbHlzaXMuDQoxLiBJbiBkbWVzZyBzZWVuIEJO
QSAoYnVmZmVyIG5vdCBhdmFpbGFibGUpIGludGVycnVwdCB3aGljaCBtZWFuIGRyaXZlciANCm5v
dCBwcmVwYXJlIERNQSBkZXNjcmlwdG9yIG9uIHRpbWUuDQoyLiBGb3IgYSB0cnkgcGxlYXNlIGRp
c2FibGUgZGVidWcgcHJpbnRpbmcgZnJvbSBnX2F1ZGlvOg0KWyAyMDgwLjEwNzcwMV0gdV9hdWRp
b19pc29fY29tcGxldGU6IGlzb19jb21wbGV0ZSBzdGF0dXMoLTYxKSAwLzEwMDANCjMuIFBsZWFz
ZSB0cnkgcnVuIGRldmljZSBpbiBCdWZmZXIgRE1BIGluc3RlYWQgb2YgRGVzY3JpcHRvciBETUE6
DQpwLT5nX2RtYV9kZXNjID0gaHctPmRtYV9kZXNjX2VuYWJsZTsNCnJlcGxhY2UgdG86DQpwLT5n
X2RtYV9kZXNjID0gMDsNCg0KVGhhbmtzLA0KTWluYXMNCg0K

