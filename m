Return-Path: <linux-usb+bounces-4333-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B01128185AE
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 11:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C710F1C23302
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 10:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C56914F67;
	Tue, 19 Dec 2023 10:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JOqph5km";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="L3ZBaLZV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="i5lmAz5f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DDD14AAA
	for <linux-usb@vger.kernel.org>; Tue, 19 Dec 2023 10:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BJ9bBBE015811;
	Tue, 19 Dec 2023 02:19:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=VNlBqE4NsDQG6w6zgTZdH/mVeczEuu1ZmrTdBNOkLEE=; b=
	JOqph5kmyHHZURbLXTiVlUUW8sjS8C76eLI5zoveSIgpPvlCZuZ3InH9h4YfQePC
	IO9jwXnJ7dcRdhrqK6O9EM3XHFDge2qbybEWRygYRkREAHPKdy8cY6cnNM8/dsoS
	AGpZiTfCsIHyF/heUc+KNaDwfH4svfNjHZkx72ilPzUb3CBAQM74dKTpQxngpJG6
	k/SwEwLCFikzSRFL59Hnn1Vpl0BAkzT4S+qGcspnXA/kkDJ915hxS0rQYI0hIEsx
	t/5ClRl3TyR50+Hwp0A3YBFYaJ4d5/OPp0YbJnUbf4RFqXCocCgHbDJhvUY/NjV1
	Kf31aojOy/SDI/cs9d/Gew==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3v2xsatk31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Dec 2023 02:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1702981193; bh=VNlBqE4NsDQG6w6zgTZdH/mVeczEuu1ZmrTdBNOkLEE=;
	h=From:To:Subject:Date:References:In-Reply-To:From;
	b=L3ZBaLZVHMb3zrAsu+FMDEbN2zo6mS8TgEMisdBuyDYqVNXI//mphreR3kZMDA04+
	 OTyKn22JNePVr+/LzNvuj+ZOWIW8/j0XusIAnQsDGfXKNFfLPxne7XZ1Yi/fFZBNny
	 39YMlAT0Y+/vjNl8vqwTVwgmV3K4D5yytO+zfulKiR13c+Yg08TRI98RcxU1G1dQfX
	 O+Nv99eV8PIzT86jkcjbO6CheXt0dddAmAxRHQ9c+AO37tWewNOXT9JqwaC7fPEzY2
	 DQb4B3xUSN4i3WUejukLsIVCvOrSxLOdVfIuOHbnG5OqFHyDZBvoXQMuZHPQBZ0md6
	 WCYQjO99J6KLg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 78D9340521;
	Tue, 19 Dec 2023 10:19:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 011FBA009D;
	Tue, 19 Dec 2023 10:19:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=i5lmAz5f;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 83069401C6;
	Tue, 19 Dec 2023 10:19:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTRHMUjcg+5x4wwTJP4Oyuuqs+4kaUWnTXEwmLQa6HXIheGQ2MhaDCLdSImoFr9YIva/zgx8z5cV+kO1+ukpQ2+9kdeqvCaap/5XoDRjxL00JU3dFPGuA+hdWDtatJpfOnesNzwvAchNj3XSJN+JrPI3xrqUuAfDtg87AgY0pWJUDkb0PHIWPzTIxR0LeB1Z/+wQhnI1AsQVe8D4kDSCZmqZHQiO5vDZ2mcfY4P0hBEiBqDNkGrAYbLHOHrL0XDnhO+J7TR3OztjX43X/52PGouKaWN1ib1Dfwxp3cDqhYoRFCMjqDfQJbN5ye/emIp+4E7ae54uxEo/gfpRQWv1BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNlBqE4NsDQG6w6zgTZdH/mVeczEuu1ZmrTdBNOkLEE=;
 b=a6AhfnqDcqQ6c49V57QC4nXVQYbTXNTCYjztREqInQD9DJ4rgWpOuuGqMkzTCZUL0AZNLEpnaF2W2kK30FUiySCvFGIZwN5y0XSUZziZjNXcNrRGLQKc/QoYrODm6QaD+0vyc667Z/Gg8wV4buAntAoZVpQpSn9JIqD5+skhSrLN/Z/hcCRHp6JQfRltZun9SoDDMpgcXtCbqJ+1K6gd/+wYgTVXWX4vxjOJxVjpYniB0cFxzFK0q+qH4O0nj9R2s8k661SsogcvrtnlzesOabwUU7Adm3xmy6e/oHyX2xSgm/tc/tXSKe+ozz71eHu2ExdJbY/P9Udq7yuu2Mmdaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNlBqE4NsDQG6w6zgTZdH/mVeczEuu1ZmrTdBNOkLEE=;
 b=i5lmAz5fZua+QbGTaYhy+gvucHRl0fcduLRl34yDq+d33S2ViHx0zEF86SttmmG8GyUqUC0zaOpRAa6frZ+P5V+7JV4hq9am/ByyiZyyh9WZqUOXZZAG6mnOLWSJ3aleclOX8Dq9TwhBtjmtdqNU08xf9Cr27NOSxzXCZQBOI90=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by MW3PR12MB4555.namprd12.prod.outlook.com (2603:10b6:303:59::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 10:19:49 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::94f2:3161:83a2:4680]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::94f2:3161:83a2:4680%3]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 10:19:49 +0000
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
 AQHaF9Jh+M4x1h3P7ECYkgn6i43CXLCGUQGAgAegwICAAByPAIABdJ8AgAAvCwCAADDCgIAEb16AgALo3YCAEaY1gIAGblUAgAFKpAA=
Date: Tue, 19 Dec 2023 10:19:49 +0000
Message-ID: <dabaed00-4c1b-e48e-472e-09ed601919cf@synopsys.com>
References: <20231115144514.15248-1-oneukum@suse.com>
 <f0bd323a-8384-e303-907f-5d533af6d71e@synopsys.com>
 <ZWRbkdTASTNJB8Fv@apocalypse>
 <f293d306-54fb-ecb5-4515-70a6c1faf1b1@synopsys.com>
 <ZWWsGknhNuVggNNa@apocalypse>
 <bfb8e693-7085-430c-0481-3d6630168240@synopsys.com>
 <d8176b8a6851974a692804f006d59d3324903b62.camel@suse.com>
 <079ddad4-ab41-49ac-6d86-d90075320dcd@synopsys.com>
 <ZWwltzMB8gq5k5oe@apocalypse>
 <07250e1e-c5ca-0586-b53f-7f2bb3d19b39@synopsys.com>
 <ZYBY6LdDLRc0XBx_@apocalypse>
In-Reply-To: <ZYBY6LdDLRc0XBx_@apocalypse>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|MW3PR12MB4555:EE_
x-ms-office365-filtering-correlation-id: fe4dad0b-926f-44f9-09a0-08dc007c086e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OyeNjFUyl/dzuPjWXaGuw8Vnl08NFfJYyaIGxTlQea6VIaI7eX/BCoXf/gSnIvI5HMSor96kSvptyEOCftU1xIhjQcKvmpplikaozqL4pH7tF/1Xx2A7b3vT/XJlsN6QH4R3+6pmBdKB6sE+1eWyahTsvYk+yWB+Uw0hqdFZKs3M80DYZNcTakvHxeeMlwaZ44v+Pk7LU8It2c/PcVM/REOMF2yAW3ZuTSZ0+NIKEXD70WQ8tamN7I5g3YR1O2r2x4PjhWcrqgKGEguKIpxjIKNbs/MlsNMNtVoBtpGa8/z4QiW36ZSL2Lq9G5DGWdpIKNZzjggsA1/OdUyyMnSdvNDKEuBmGMcF+pOBJKJPtfhkgOlATPDZps2/emhu+hnb7Ui+rbppEXvbddIK3tvOH11AKZaDIOyiboKqSRFjXTq8bwaAxYVDK9zU5taeJTtJ9gSlqYtHbDSdJyWyvzObfTXc/s6g8Ddez8iNauDatokyuDyxAbkAufYbcn+MCjndVP/qfndb1pwPHZRC0uGrwv1tfqOzGYXce58bHDu6YtqAKMSiQL/gSOps86VBB13xY7Pu/eh5F224+57GaF12qxqx9MdaY63BpyWYScYhG/DRppd5O3BeMSBAZwjDcY/8Yfvs/GQ1bjcjGYJbrxPDiMpNYu1TDLdGJ/He1wF4fVAolACO7ZJRRmmmqwcUDd1q
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(366004)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(31696002)(86362001)(36756003)(66899024)(91956017)(478600001)(53546011)(41300700001)(6506007)(76116006)(66476007)(66446008)(64756008)(66946007)(66556008)(71200400001)(38070700009)(26005)(122000001)(2616005)(6512007)(38100700002)(66574015)(2906002)(4001150100001)(110136005)(6486002)(5660300002)(316002)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RkhhdFF3U0x4Q3pYV2Njc2M1RDhMa20yNzIwdEpDMjBQV1pwbmJRZ3VZTllv?=
 =?utf-8?B?SXRCRFlmK2J3YTQ5RFRzejU1TzNLVWNBM0pKb3FyQ25GU2g5MFpqQVZEYWcz?=
 =?utf-8?B?YzdSU05ESHdIaHpqL1o2WlloemJ2L2paUEJNVDFlVXhQWHZLSnlTV0U0R3U1?=
 =?utf-8?B?UEhibG9ha2tPQ2pUamNnaVRlTDAxOGpxWmRsdVFUNFAyVmtLYzRkNjhNTzVL?=
 =?utf-8?B?UW5GZmZIM01RV3JEbEZrV0ZMMFAvL3pWQW9EZHhUYmdQa25CdHdUTkJ0bkwv?=
 =?utf-8?B?M0dXREVXMnptbW9ITVJhUy91UDRyOG41YlUwSWhZZjdHd3VyZVhFTVprWFgr?=
 =?utf-8?B?MnBKd1BlYTNKZk1RNFEza2F4TURraEo3ZGZwZ2grTkg0ZE4xR3B4M1hQMjUy?=
 =?utf-8?B?dnA5WlgvUm0yWFVBUjcrS01VRDNZc3dKelVlWHl3RGFEZmRINUNXbGVjYWF0?=
 =?utf-8?B?a0F4MU5wZ1lUUlVQN0JKOTRwWW5lUnZNVVNIeUp1bnNtaitBVHBlaDNtSTJC?=
 =?utf-8?B?RW9IVmhIUnVmRmh3N1Z3Z3VDOVdva0VKSENka3JsbUVJaEl1a2xueUJKTkZZ?=
 =?utf-8?B?dnpOY3NUaEZyQXBGcnFaWEc1aW0wM3lhelNQQ25ackhBMzBkbS96eS90c3Y0?=
 =?utf-8?B?YUxEVWtDSjd5VzRGZVhSN3lRY1JWUFVCR1N2cU5GaktBMHlHWktrTjB2UDM3?=
 =?utf-8?B?aVY5N29Na3J6UmJRU053NFlOc2hIZVh4KzhFdzB0TDdENm9WVDNjRFlsOTZB?=
 =?utf-8?B?N0tTbmt6dmxKQmhGTWV5U055MFM5QWJiMFM1d3prQXdBUUl2MzdUS2hMVVVq?=
 =?utf-8?B?Y2hSWnFrTHd3SktFMTd5VndSMXBuQlhKc2FucGpsUk9YU1BzTlVlS251ejFT?=
 =?utf-8?B?ZUVPYnNJWk9iOGFya0pLclM1aUFwakJaQWRrNGU1eEdUeVg4RGJQWXN1aE1C?=
 =?utf-8?B?TmtrS2ZIYzRYM3VGWC9TN1NUUk43R212cFlvUnRicXJuSmRoUlNEQmFDd1hy?=
 =?utf-8?B?aE54eXF2Q2tnR0c1eWh0KzIvMGJvVUJka1Z0YmxObnQ0SzNLc1ZXS2dnUUp1?=
 =?utf-8?B?U3ZnOE8weFZqZHJxYi9MWGFQMFZtWi9sdEJMWnlza1haNFdsTmExUSthRFhW?=
 =?utf-8?B?N3ZuZG40eklhSGh6bUc4UlgzamwyYVRpcmg3bHBVUWZiS2RGalR2Y3p0cyth?=
 =?utf-8?B?VlNkSnROSGJ2enlYSkVVNU1KTUhQWVIvaCtKUm5kL2k5NzBYTTY0QVlGQlN6?=
 =?utf-8?B?dTRHdWcrNGNKL3BrQ2ZUNTU2SnBmL3FiVm0vTStzbWJocUV3RTZQZ2F0c0ZK?=
 =?utf-8?B?aW5ONE1xYVU0WU5lUGYxVGVYNm5kcEJWeCt4RWd6YVpJbVY0TWZaYzRTWlZh?=
 =?utf-8?B?Qk4vdWZqSHFqY3FnbTJ5d2tlcTlIcnpqWXhFNXhUakNxS3RlMWZsek1haHUw?=
 =?utf-8?B?WFlvVi9zK1dHaE9NUzBBZ3RyMjNqSmtYWUE2Qkk1dlJJR3ZTYSt3WHRVRUVT?=
 =?utf-8?B?aG9UaUFvdEZKVHBCWXFrNCs1T1BGdEhpd203cEQ2U3E2U1RlZFJzbmQxSEpP?=
 =?utf-8?B?WUhIbTcwbml0aUk5TDJIaGt3NXZWN1Z3ZVJVUmt2RVdyRWtjd0FJN0lJUmcv?=
 =?utf-8?B?azZZZFI4bjFQQy9yeFhDVDFyQUtaaVhrQlV3UkhMSmQ1YUNlN2liSWhadWcz?=
 =?utf-8?B?Qm95T0RrTnQ1NzAzNmJORUs2bDNvKzh4NytTbWlMS25wTHAvdmp4a0RrZGEy?=
 =?utf-8?B?UXlwOUp0aWlFMU5OZndiMnlrUFZVVTRZblFuTFFEaFJWNlRqWnZ6bHo4VzF5?=
 =?utf-8?B?L1RGcFU2ZkJHQ24rUGtYNTJkcVpZeUliT2I2QUE4SjFWYmh1OHRld3Bxb2ti?=
 =?utf-8?B?aVA3T0trNlJKd29oT2hWcnhpUU12cXE3OFBndzdhSi9xOFg3S3UxZGZxdi90?=
 =?utf-8?B?SCtRWDllYm9RaEJvZXI3dUJnQXhTMk5TcEY2V0xCNWNHaHNoUWV0aHN6STBW?=
 =?utf-8?B?TTUzVlFNZmNRNmJhcXdsUVA5azAvdEVrU0VLQUtENmkweU5ONk90SlVvWFFS?=
 =?utf-8?B?dEZHYStxc0JRSHZkSklHbmNrK1B3eVRXRzNISmcvVE5qYWR2VXdBSTlYQmgy?=
 =?utf-8?Q?9IPrRnPJfCb72wSL+WuodDayn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC43DC2AC427444E9CA66030F565266C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	bCqjU8BDilLjsBtmqPQD1Knh4eFpqnKD1vqLHIQw7txi4+FupRKVB5oJ+Pe6pTK7AnnGGsnc39xj7bxS6jtMUGdt14J3UiASUlgDLBbGrfb9DtNCUFquOW4se62z0Iuvggyx79hdMS/S3Pa/oRo8gB8fwPT1CkUFc3+KWzjo7a8ZBhz9RyO3XjJu+YS0cX6OfjAyBzlYbiAtvD1N/EPzOYLjrk+nfOX8Hr58dJXpQE1fWcMBD2M134NCj/BwErZVlXusgO4LVw0ZUvsWWmTE0RNjo3qOOZwbAM9uIpwBMESBFUYUNXY9ufGnKEyT4QNHzC/EIwGA95T66VOErhAZWDJngFghZmzQUodTzpQ+MyPr/bwnR7x6QzDuQEl53JIDYi9i+ILmfa+0AWYb9O64sXEQkR3Njg8A5ncjCm0O2Ys17GABmHwbXfx/mfzXD7u4iOSGuRIi4UZlkhLkPIo/GIDDJfO+rnPLm+frkMdzsu8J6Um9RI4SlnnCT8ebRd6jH/BTLlLT4YNaYbPECdALtLIXkVGqqze8EbVljG6zUElcBSg3etMeJkf2f6fgdS4o86QgmNaZkqjib/F6YRuBf6QsF9vBzDOHQsTsiL06dy4OVc7mxM+GAKhEyyE5bz3kUOhopctmN2axU6/5Dm2+3w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4dad0b-926f-44f9-09a0-08dc007c086e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2023 10:19:49.6666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +sxAxK1T6S0D6c3/q1VkP+l95JA12HJpFGuDfotn7khI7dK/I8WrquuL7haKwp5yY8YTdfQRvbX855Z+tOjfog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4555
X-Proofpoint-GUID: uGUsWlO2jDjIssFqN7ZEs-3-65qNpOgN
X-Proofpoint-ORIG-GUID: uGUsWlO2jDjIssFqN7ZEs-3-65qNpOgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 spamscore=0 mlxlogscore=588 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312190076

SGkgQW5kcmVhLA0KDQpPbiAxMi8xOC8yMyAxODozNiwgQW5kcmVhIGRlbGxhIFBvcnRhIHdyb3Rl
Og0KPiBIaSBNaW5hcywNCj4gDQo+IE9uIDEyOjIzIFRodSAxNCBEZWMgICAgICwgTWluYXMgSGFy
dXR5dW55YW4gd3JvdGU6DQo+PiBIaSBBbmRyZWEsDQo+Pg0KPj4gT24gMTIvMy8yMyAxMDo1Miwg
QW5kcmVhIGRlbGxhIFBvcnRhIHdyb3RlOg0KPj4+IEhpIE1pbmFzLA0KPj4+DQo+Pj4gT24gMTA6
MjYgRnJpIDAxIERlYyAgICAgLCBNaW5hcyBIYXJ1dHl1bnlhbiB3cm90ZToNCj4+Pj4gSGkgSXZh
biwNCj4+Pj4NCj4+Pj4gT24gMTEvMjgvMjMgMTg6NDMsIEl2YW4gSXZhbm92IHdyb3RlOg0KPj4+
Pj4NCj4+Pj4+IEhpIE1pbmFzLA0KPj4+Pj4NCj4+Pj4+IE9uIFR1ZSwgMjAyMy0xMS0yOCBhdCAx
MTo0OCArMDAwMCwgTWluYXMgSGFydXR5dW55YW4gd3JvdGU6DQo+Pj4+Pj4NCj4+Pj4+PiBEb2Vz
IHRoaXMgInNwdXJpb3VzIiBpbnRlcnJ1cHQgYnJva2UgeW91ciB0ZXN0cz8NCj4+Pj4+DQo+Pj4+
PiBJdCBpcyBub3QganVzdCBzb21lIGtpbmQgb2Ygc3ludGhldGljIHRlc3QgY2FzZSB0aGF0IHdh
cyBicm9rZW4uDQo+Pj4+PiBidXQgcmVhbCB3b3JsZCB1c2FnZS4gWW91IGNhbiBmaW5kIGNvbXBs
YWlucyBhYm91dCB0aGlzIGVycm9yIG9uDQo+Pj4+PiB2YXJpb3VzIGludGVybmV0IGZvcnVtcywg
anVzdCBzZWFyY2ggZm9yIGR3YzJfaGNfY2hobHRkX2ludHJfZG1hDQo+Pj4+PiBhbmQgaXQgaXMg
bm90IHNvIGRpZmZpY3VsdCB0byByZXByb2R1Y2UuDQo+Pj4+Pg0KPj4+Pj4gV2l0aG91dCBkYXRh
Ym9vayBJIGFtIG5vdCBzdXJlIHdlIGNhbiBjcmVhdGUgYmV0dGVyIGZpeCwgYnV0IGlmDQo+Pj4+
PiB5b3UgZGV2ZWxvcCBkaWZmZXJlbnQgc29sdXRpb24gSSB3aWxsIGdsYWRseSB0ZXN0ZWQgaXQu
DQo+Pj4+Pg0KPj4+Pj4gUmVnYXJkcywNCj4+Pj4+IEl2YW4NCj4+Pj4gMS4gSW4gYWRkaXRpb24g
dG8gSENDSEFSeCBhbmQgZXBfdHlwZSBwcmludGluZyBwbGVhc2UgYWRkIHByaW50aW5nIG9mDQo+
Pj4+IEdSWEZTVFNSIGlmIEVQIGlzIElOIG9yIEdOUFRYU1RTIGlmIEVQIGlzIE9VVCwgYW5kIHBy
b3ZpZGUgZG1lc2cgd2l0aA0KPj4+PiBlcnJvciBjYXNlLg0KPj4+DQo+Pj4gSGVyZSdzIHRoZSBs
b2csIGJlZm9yZSBjb21lbnRpbmcgdGhlICdnb3RvJyBvdXQ6DQo+Pj4NCj4+Pg0KPj4+IFs2ODQ4
MjkuMjA2ODU0XSAtLUhvc3QgQ2hhbm5lbCBJbnRlcnJ1cHQtLSwgQ2hhbm5lbCAyDQo+Pj4gWzY4
NDgyOS4yMDY4NjZdICAgaGNpbnQgMHgwMDAwMDAxMiwgaGNpbnRtc2sgMHgwMDAwMDAwNiwgaGNp
bnQmaGNpbnRtc2sgMHgwMDAwMDAwMg0KPj4+IFs2ODQ4MjkuMjA2ODc1XSAgIGhjY2hhclsyXSA9
IDB4MDE1Yzk4MTAsIGNoYW4tPmVwX3R5cGU9Mw0KPj4+IFs2ODQ4MjkuMjA2ODgzXSAgIEdSWFNU
U1IgPSAweDAwMEUwMDAyDQo+Pj4gWzY4NDgyOS4yMTQ4NTFdIC0tSG9zdCBDaGFubmVsIEludGVy
cnVwdC0tLCBDaGFubmVsIDYNCj4+PiBbNjg0ODI5LjIxNDg2NF0gICBoY2ludCAweDAwMDAwMDEy
LCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+Pj4gWzY4
NDgyOS4yMTQ4NzZdICAgaGNjaGFyWzZdID0gMHgwMTVjOTgxMCwgY2hhbi0+ZXBfdHlwZT0zDQo+
Pj4gWzY4NDgyOS4yMTQ4ODZdICAgR1JYU1RTUiA9IDB4MDAwRTAwMDcNCj4+PiBbNjg0ODI5LjIx
Nzg1M10gLS1Ib3N0IENoYW5uZWwgSW50ZXJydXB0LS0sIENoYW5uZWwgNQ0KPj4+IFs2ODQ4Mjku
MjE3ODY5XSAgIGhjaW50IDB4MDAwMDAwMTIsIGhjaW50bXNrIDB4MDAwMDAwMDYsIGhjaW50Jmhj
aW50bXNrIDB4MDAwMDAwMDINCj4+PiBbNjg0ODI5LjIxNzg4MV0gICBoY2NoYXJbNV0gPSAweDAw
OWM4ODAxLCBjaGFuLT5lcF90eXBlPTMNCj4+PiBbNjg0ODI5LjIxNzg5MV0gICBHUlhTVFNSID0g
MHgwMDBFMDAwNQ0KPj4+IFs2ODQ4MjkuMjIyNjQ3XSAtLUhvc3QgQ2hhbm5lbCBJbnRlcnJ1cHQt
LSwgQ2hhbm5lbCAwDQo+Pj4gWzY4NDgyOS4yMjI2NTldICAgaGNpbnQgMHgwMDAwMDAyMSwgaGNp
bnRtc2sgMHgwMDAwMDQyNiwgaGNpbnQmaGNpbnRtc2sgMHgwMDAwMDAyMA0KPj4+IFs2ODQ4Mjku
MjIyNjcxXSAgIGhjY2hhclswXSA9IDB4MDFkOGQyMDAsIGNoYW4tPmVwX3R5cGU9Mg0KPj4+IFs2
ODQ4MjkuMjIyNjgxXSAgIEdSWFNUU1IgPSAweDAwMDcwMDQ0DQo+Pj4gWzY4NDgyOS4yMjI2OTZd
IC0tSG9zdCBDaGFubmVsIEludGVycnVwdC0tLCBDaGFubmVsIDANCj4+PiBbNjg0ODI5LjIyMjcw
NF0gICBoY2ludCAweDAwMDAwMDAyLCBoY2ludG1zayAweDAwMDAwNDA2LCBoY2ludCZoY2ludG1z
ayAweDAwMDAwMDAyDQo+Pj4gWzY4NDgyOS4yMjI3MTRdICAgaGNjaGFyWzBdID0gMHgwMWQ4ZDIw
MCwgY2hhbi0+ZXBfdHlwZT0yDQo+Pj4gWzY4NDgyOS4yMjI3MjRdICAgR1JYU1RTUiA9IDB4MDAw
NzAwNDQNCj4+PiBbNjg0ODI5LjIyMjc0MF0gZHdjMiAzZjk4MDAwMC51c2I6IGR3YzJfaGNfY2ho
bHRkX2ludHJfZG1hOiBDaGFubmVsIDAgLSBDaEhsdGQgc2V0LCBidXQgcmVhc29uIGlzIHVua25v
d24NCj4+PiBbNjg0ODI5LjIyMjc1OF0gZHdjMiAzZjk4MDAwMC51c2I6IGhjaW50IDB4MDAwMDAw
MDIsIGludHN0cyAweDA0MDAwMDA5DQo+Pg0KPj4NCj4+IFNvcnJ5IGZvciBkZWxheWVkIHJlc3Bv
bnNlLg0KPj4gSSBndWVzcyB0aGUgY2F1c2Ugb2YgaXNzdWUgaXMgYmVjYXVzZSBvZiBjaGFubmVs
IGhhbHRlZCBpbnRlcnJ1cHQgbGF0ZQ0KPj4gZm9yIGFib3V0IH40MC01MHVzLiBJbiBhYm92ZSBs
b2csIENoYW5uZWwgMCB0d2ljZSBhc3NlcnQgaW50ZXJydXB0Og0KPj4gZmlyc3QgZm9yIEFDSyAo
WGZlckNvbXBsZXRlIG1hc2tlZCkgYW5kIHNlY29uZCBmb3IgQ2hhbm5lbF9IYWx0ZWQuIFRoZXNl
DQo+PiBhbGwgaW50ZXJydXB0cyByZWxhdGVkIHRvIHNhbWUgQlVMSyBJTiB0cmFuc2Zlci4gSWRl
YWxseSB0aGVzZSAzIHNvdXJjZQ0KPj4gb2YgaW50ZXJydXB0IChBQ0ssIFhmZXJDb21wbCBhbmQg
Q2hIYWx0KSBzaG91bGQgYmUgYXNzZXJ0ZWQgdG9nZXRoZXIuDQo+PiBUbyBjaGVjayBpdCBsZXRz
IGRvIGZvbGxvdzoNCj4+IDEuIERvIG5vdCBhbGxvdyB1bm1hc2sgQUNLIGludGVycnVwdCBpbiBm
dW5jdGlvbg0KPj4gZHdjMl9oY19lbmFibGVfZG1hX2ludHMoKS4gSnVzdCBjb21tZW50ICJoY2lu
dG1zayB8PSBIQ0lOVE1TS19BQ0s7Ig0KPj4gMi4gcmVtb3ZlIGNvbW1lbnQgZm9yICJnb3RvIGVy
cm9yIg0KPj4gMy4gcmVtb3ZlIHByaW50aW5nIEdSWFNUU1IgYW5kIEdOUFRYU1RTDQo+PiA0LiBi
dWlsZCBpbiBub24gdmVyYm9zZSBkZWJ1ZyBtb2RlDQo+PiBJdCdzIGp1c3QgdGVtcG9yYXJ5IHNv
bHV0aW9uIHRvIGNoZWNrIEFDSyBpbmZsdWVuY2Ugb24gdGhlIGlzc3VlLg0KPj4NCj4+IFRoYW5r
cywNCj4+IE1pbmFzDQo+IA0KPiBUZXN0aW5nIHRoZSBjaGFuZ2VzIHlvdSBzdWdnZXN0ZWQgcmV2
ZWFsZWQgdGhhdCAiQ2hIbHRkIHNldCwgYnV0IHJlYXNvbiBpcyB1bmtub3duIiBlcnJvcg0KPiBp
cyBub3Qgc2hvd2luZyB1cCBhbnltb3JlLCBidXQgd2Ugbm93IGhhdmUgc29tZSAiVHJhbnNhY3Rp
b24gZXJyb3IiIGFzIHNob3duIGluIHRoZQ0KPiBmb2xsb3dpbmcgbG9nOg0KPiANCj4gDQo+IFsx
Mzk0MS41OTAyNTJdICAgaGNpbnQgMHgwMDAwMDAxMiwgaGNpbnRtc2sgMHgwMDAwMDAwNiwgaGNp
bnQmaGNpbnRtc2sgMHgwMDAwMDAwMg0KPiBbMTM5NDEuNTkwMjYzXSAgaGNjaGFyWzVdID0gMHgw
MGRjODgwMSwgY2hhbi0+ZXBfdHlwZT0zDQo+IFsxMzk0MS41OTIyNDBdIC0tSG9zdCBDaGFubmVs
IEludGVycnVwdC0tLCBDaGFubmVsIDQNCj4gWzEzOTQxLjU5MjI0OV0gICBoY2ludCAweDAwMDAw
MDEyLCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+IFsx
Mzk0MS41OTIyNThdICBoY2NoYXJbNF0gPSAweDAxNWM5ODEwLCBjaGFuLT5lcF90eXBlPTMNCj4g
WzEzOTQxLjYwMDI0M10gLS1Ib3N0IENoYW5uZWwgSW50ZXJydXB0LS0sIENoYW5uZWwgMg0KPiBb
MTM5NDEuNjAwMjYzXSAgIGhjaW50IDB4MDAwMDAwMTIsIGhjaW50bXNrIDB4MDAwMDAwMDYsIGhj
aW50JmhjaW50bXNrIDB4MDAwMDAwMDINCj4gWzEzOTQxLjYwMDI3M10gIGhjY2hhclsyXSA9IDB4
MDE1Yzk4MTAsIGNoYW4tPmVwX3R5cGU9Mw0KPiBbMTM5NDEuNjA1NTIxXSAtLUhvc3QgQ2hhbm5l
bCBJbnRlcnJ1cHQtLSwgQ2hhbm5lbCAzDQo+IFsxMzk0MS42MDU1MzldICAgaGNpbnQgMHgwMDAw
MDAwMywgaGNpbnRtc2sgMHgwMDAwMDAwNiwgaGNpbnQmaGNpbnRtc2sgMHgwMDAwMDAwMg0KPiBb
MTM5NDEuNjA1NTQ5XSAgaGNjaGFyWzNdID0gMHgwMWQ4MzIwMCwgY2hhbi0+ZXBfdHlwZT0yDQo+
IFsxMzk0MS42MDgyNDJdIC0tSG9zdCBDaGFubmVsIEludGVycnVwdC0tLCBDaGFubmVsIDYNCj4g
WzEzOTQxLjYwODI1Nl0gICBoY2ludCAweDAwMDAwMDEyLCBoY2ludG1zayAweDAwMDAwMDA2LCBo
Y2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+IFsxMzk0MS42MDgyNjZdICBoY2NoYXJbNl0gPSAw
eDAxNWM5ODEwLCBjaGFuLT5lcF90eXBlPTMNCj4gWzEzOTQxLjYwOTY4NV0gLS1Ib3N0IENoYW5u
ZWwgSW50ZXJydXB0LS0sIENoYW5uZWwgMQ0KPiBbMTM5NDEuNjA5Njk2XSAgIGhjaW50IDB4MDAw
MDAwMjMsIGhjaW50bXNrIDB4MDAwMDAwMDYsIGhjaW50JmhjaW50bXNrIDB4MDAwMDAwMDINCj4g
WzEzOTQxLjYwOTcwNl0gIGhjY2hhclsxXSA9IDB4MDFkOGQyMDAsIGNoYW4tPmVwX3R5cGU9Mg0K
PiBbMTM5NDEuNjE2MjQzXSAtLUhvc3QgQ2hhbm5lbCBJbnRlcnJ1cHQtLSwgQ2hhbm5lbCA1DQo+
IFsxMzk0MS42MTYyNjJdICAgaGNpbnQgMHgwMDAwMDAxMiwgaGNpbnRtc2sgMHgwMDAwMDAwNiwg
aGNpbnQmaGNpbnRtc2sgMHgwMDAwMDAwMg0KPiBbMTM5NDEuNjE2MjcyXSAgaGNjaGFyWzVdID0g
MHgwMTVjOTgxMCwgY2hhbi0+ZXBfdHlwZT0zDQo+IFsxMzk0MS42MTk1MTRdIC0tSG9zdCBDaGFu
bmVsIEludGVycnVwdC0tLCBDaGFubmVsIDANCj4gWzEzOTQxLjYxOTUyN10gICBoY2ludCAweDAw
MDAwMDIzLCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+
IFsxMzk0MS42MTk1MzhdICBoY2NoYXJbMF0gPSAweDAxZDhkMjAwLCBjaGFuLT5lcF90eXBlPTIN
Cj4gWzEzOTQxLjYyMDAxNV0gLS1Ib3N0IENoYW5uZWwgSW50ZXJydXB0LS0sIENoYW5uZWwgMg0K
PiBbMTM5NDEuNjIwMDI3XSAgIGhjaW50IDB4MDAwMDAwMDMsIGhjaW50bXNrIDB4MDAwMDAwMDYs
IGhjaW50JmhjaW50bXNrIDB4MDAwMDAwMDINCj4gWzEzOTQxLjYyMDAzN10gIGhjY2hhclsyXSA9
IDB4MDFkODMyMDAsIGNoYW4tPmVwX3R5cGU9Mg0KPiBbMTM5NDEuNjI0MjQwXSAtLUhvc3QgQ2hh
bm5lbCBJbnRlcnJ1cHQtLSwgQ2hhbm5lbCAzDQo+IFsxMzk0MS42MjQyNDldICAgaGNpbnQgMHgw
MDAwMDAxMiwgaGNpbnRtc2sgMHgwMDAwMDAwNiwgaGNpbnQmaGNpbnRtc2sgMHgwMDAwMDAwMg0K
PiBbMTM5NDEuNjI0MjU5XSAgaGNjaGFyWzNdID0gMHgwMTVjOTgxMCwgY2hhbi0+ZXBfdHlwZT0z
DQo+IFsxMzk0MS42MjczNDddIC0tSG9zdCBDaGFubmVsIEludGVycnVwdC0tLCBDaGFubmVsIDQN
Cj4gWzEzOTQxLjYyNzM2M10gICBoY2ludCAweDAwMDAwMDkyLCBoY2ludG1zayAweDAwMDAwMDA2
LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+IFsxMzk0MS42MjczNzNdICBoY2NoYXJbNF0g
PSAweDAxZDhkMjAwLCBjaGFuLT5lcF90eXBlPTINCj4gWzEzOTQxLjYyNzM5MV0gZHdjMiAzZjk4
MDAwMC51c2I6IC0tSG9zdCBDaGFubmVsIDQgSW50ZXJydXB0OiBUcmFuc2FjdGlvbiBFcnJvci0t
DQo+IFsxMzk0MS42Mjc0MzJdIC0tSG9zdCBDaGFubmVsIEludGVycnVwdC0tLCBDaGFubmVsIDYN
Cj4gWzEzOTQxLjYyNzQ0MF0gICBoY2ludCAweDAwMDAwMDEwLCBoY2ludG1zayAweDAwMDAwNDE2
LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDEwDQo+IFsxMzk0MS42Mjc0NTBdICBoY2NoYXJbNl0g
PSAweDgxZDhkMjAwLCBjaGFuLT5lcF90eXBlPTINCj4gWzEzOTQxLjYzMjI0MF0gLS1Ib3N0IENo
YW5uZWwgSW50ZXJydXB0LS0sIENoYW5uZWwgMQ0KPiBbMTM5NDEuNjMyMjQ4XSAgIGhjaW50IDB4
MDAwMDAwMTIsIGhjaW50bXNrIDB4MDAwMDAwMDYsIGhjaW50JmhjaW50bXNrIDB4MDAwMDAwMDIN
Cj4gWzEzOTQxLjYzMjI1N10gIGhjY2hhclsxXSA9IDB4MDE1Yzk4MTAsIGNoYW4tPmVwX3R5cGU9
Mw0KPiBbMTM5NDEuNjM1NTI4XSAtLUhvc3QgQ2hhbm5lbCBJbnRlcnJ1cHQtLSwgQ2hhbm5lbCA1
DQo+IFsxMzk0MS42MzU1NDNdICAgaGNpbnQgMHgwMDAwMDAwMywgaGNpbnRtc2sgMHgwMDAwMDAw
NiwgaGNpbnQmaGNpbnRtc2sgMHgwMDAwMDAwMg0KPiBbMTM5NDEuNjM1NTUzXSAgaGNjaGFyWzVd
ID0gMHgwMWQ4MzIwMCwgY2hhbi0+ZXBfdHlwZT0yDQo+IFsxMzk0MS42NDAyNDRdIC0tSG9zdCBD
aGFubmVsIEludGVycnVwdC0tLCBDaGFubmVsIDANCj4gWzEzOTQxLjY0MDI2M10gICBoY2ludCAw
eDAwMDAwMDEyLCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAy
DQo+IFsxMzk0MS42NDAyNzJdICBoY2NoYXJbMF0gPSAweDAxNWM5ODEwLCBjaGFuLT5lcF90eXBl
PTMNCj4gWzEzOTQxLjY0MjA3OF0gLS1Ib3N0IENoYW5uZWwgSW50ZXJydXB0LS0sIENoYW5uZWwg
Ng0KPiBbMTM5NDEuNjQyMDg2XSAgIGhjaW50IDB4MDAwMDAwMjMsIGhjaW50bXNrIDB4MDAwMDA0
MDYsIGhjaW50JmhjaW50bXNrIDB4MDAwMDAwMDINCj4gWzEzOTQxLjY0MjA5NV0gIGhjY2hhcls2
XSA9IDB4MDFkOGQyMDAsIGNoYW4tPmVwX3R5cGU9Mg0KPiBbMTM5NDEuNjQ4MjQzXSAtLUhvc3Qg
Q2hhbm5lbCBJbnRlcnJ1cHQtLSwgQ2hhbm5lbCAzDQo+IFsxMzk0MS42NDgyNjJdICAgaGNpbnQg
MHgwMDAwMDAxMiwgaGNpbnRtc2sgMHgwMDAwMDAwNiwgaGNpbnQmaGNpbnRtc2sgMHgwMDAwMDAw
Mg0KPiBbMTM5NDEuNjQ4MjcyXSAgaGNjaGFyWzNdID0gMHgwMTVjOTgxMCwgY2hhbi0+ZXBfdHlw
ZT0zDQo+IFsxMzk0MS42NTIyNDBdIC0tSG9zdCBDaGFubmVsIEludGVycnVwdC0tLCBDaGFubmVs
IDQNCj4gWzEzOTQxLjY1MjI0OF0gICBoY2ludCAweDAwMDAwMDEyLCBoY2ludG1zayAweDAwMDAw
MDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+IFsxMzk0MS42NTIyNTddICBoY2NoYXJb
NF0gPSAweDAwOWM4ODAxLCBjaGFuLT5lcF90eXBlPTMNCj4gWzEzOTQxLjY1NjI0MV0gLS1Ib3N0
IENoYW5uZWwgSW50ZXJydXB0LS0sIENoYW5uZWwgMQ0KPiBbMTM5NDEuNjU2MjU2XSAgIGhjaW50
IDB4MDAwMDAwMTIsIGhjaW50bXNrIDB4MDAwMDAwMDYsIGhjaW50JmhjaW50bXNrIDB4MDAwMDAw
MDINCj4gWzEzOTQxLjY1NjI2Nl0gIGhjY2hhclsxXSA9IDB4MDE1Yzk4MTAsIGNoYW4tPmVwX3R5
cGU9Mw0KPiBbMTM5NDEuNjY0MjQwXSAtLUhvc3QgQ2hhbm5lbCBJbnRlcnJ1cHQtLSwgQ2hhbm5l
bCA1DQo+IFsxMzk0MS42NjQyNDhdICAgaGNpbnQgMHgwMDAwMDAxMiwgaGNpbnRtc2sgMHgwMDAw
MDAwNiwgaGNpbnQmaGNpbnRtc2sgMHgwMDAwMDAwMg0KPiBbMTM5NDEuNjY0MjU3XSAgaGNjaGFy
WzVdID0gMHgwMTVjOTgxMCwgY2hhbi0+ZXBfdHlwZT0zDQo+IA0KPiANCj4gVGhlIHBpbmcgZmxv
b2QgaXMgb3RoZXJ3aXNlIHdvcmtpbmcsIGV4Y2VwdCBmb3IgYSBtaW5vciBwZXJjZW50YWdlIGxv
c3MgKH4wLjclKS4NCj4gTWFueSB0aGFua3MsDQo+IA0KPiBBbmRyZWENCg0KVGhhbmtzIGZvciB0
ZXN0aW5nLg0KDQpNaW5hcw0K

