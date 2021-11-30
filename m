Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 147454641C4
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 23:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345224AbhK3WtE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Nov 2021 17:49:04 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35596 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345097AbhK3WtE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Nov 2021 17:49:04 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C606342226;
        Tue, 30 Nov 2021 22:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1638312344; bh=wObTqkpN9FBQetDWzWlkQxy9VERfeGn41OUkIIrcDiQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=kLzfqVaicDkdXbw18upnu9oHKKo/muY/F+OoawG51g0Xz8y6m7MJa3MhRQdu2DSHV
         mZSUBSLvOu7q+fUHv/Xq9/2NJ+YzJJrZsFsOxbuVR71IRn6yDsF958fvBkKnLpeI6y
         CcXCKkjwT02gXb3XV0EghsYqes/aSzqUNnKOuCLRCoIjAktsXENtHWiB9T69L/xIvZ
         k74iT/3Q41kgtFzW2RWJFAMRxcwaAAqU2wBMXju7O22OpewdqPhA9DoiuTJrmjigg6
         6oyVdZhXsIgh74LRYwdI/texv9mA/UC/MfyfaiLsAN82bjDYmMvoy5lk94hTvWZuwX
         c9zTc0YYIMOrQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 61838A0070;
        Tue, 30 Nov 2021 22:45:43 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A473780210;
        Tue, 30 Nov 2021 22:45:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="eOrGsAbd";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqsC4/0HnkjafGl9tb6B3RXfXLgZzF51jSZiKRPfRgrBYKSwvscm0ElOsC0GYQiidwEmehCJc6F3m3S8yEQIAcUc6xvsjLi/C4I4z2uQqFwIRA7OmTr5V1M8v0R4l05+ixkwSPd6TQ3D4GeA6Do9507gWQxV0263Aset7IA+VuChRrVuLu6taNbtfaB0X2SqZUtX5rTEjGAnzvY8XEQ9J4gm5elDeAfkY2iu6uHlIOkE34wb0xLYa0qnN34p/0+Kj98fCkhHlpu5JvkOWEPJz28VtNbSv4Wjcx30vTTIP6KZA9+XCuZrzScWZA4mEs58lc6U9SL+HG315RXLzYDWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wObTqkpN9FBQetDWzWlkQxy9VERfeGn41OUkIIrcDiQ=;
 b=Lp6Ju7tTbP7Hm7OdEIZUiNx/R3AsdKBX5GTqnwe3ujcAkzF2k5oo5rPREysEFG91bd6/2+oPcfKYEeZ8qIomjsr3CrLAxoLle0W4LPZrO4WlP7VAmj2zFJMICru7G3EEMWnqI8OVXTcAR3AITYc1mHFWKRW78PeIvRIM/QuSraz37mztzh/jGqUFaWuJLXAyqSR0w84052PMOLsJmjvnVK3ou9oysmJBus3bxEF+aY1tkZwLQMfiPB5Thm+p0lvdTob49IkjlBtyhCFHTFtDtOWnJDh2bet+3YTEKWXLgNHIoEZJkamPS7h9siZLGfBtGqD/UmCAQuLMo4PisPrkGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wObTqkpN9FBQetDWzWlkQxy9VERfeGn41OUkIIrcDiQ=;
 b=eOrGsAbdtQciXiad5BFlE+KccM1DMQsCXbTIShrhFlL2IoFa8W/AGcwIGyNplX4nzR5fSyArMwEACao0wAlV37ybTdYYkG7IXruCmlGE03xpFfVCiwRMsQPwFeDpjk/jp68rpZq7Gjiu63NVMEEGF4DJWO4PLbYb+owDxIVDX/8=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB2632.namprd12.prod.outlook.com (2603:10b6:a03:6c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Tue, 30 Nov
 2021 22:45:36 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5865:4cfa:3e30:26d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5865:4cfa:3e30:26d6%7]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 22:45:36 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Support Multi-Stream Transfer
Thread-Topic: [PATCH] usb: dwc3: gadget: Support Multi-Stream Transfer
Thread-Index: AQHX5Zlf/E0n+cs5GUmIDJmzqWkwgawbqy0AgAEBmYA=
Date:   Tue, 30 Nov 2021 22:45:36 +0000
Message-ID: <b0450cf3-d165-9239-83db-f7e619e4c7e9@synopsys.com>
References: <cd9c7a8bf11f790983ac546222dd114893f16b3a.1638242424.git.Thinh.Nguyen@synopsys.com>
 <87zgpmyuho.fsf@kernel.org>
In-Reply-To: <87zgpmyuho.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7148139c-8289-4ac9-f1ca-08d9b4532029
x-ms-traffictypediagnostic: BYAPR12MB2632:
x-microsoft-antispam-prvs: <BYAPR12MB2632E717B6875C6BFAF9C1EEAA679@BYAPR12MB2632.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FR3zbfZajIFhJkefGyCFlHEy66KMHuzMGuDHNKZnTLtuz8eBEFuyVBGlJGV8teIwZ9Yrm1n04iTmmPAAtKmFRcCwGxAJ2u6samVBopUIzPKihikUk6ZrFl00m0U1EAvhDioyJtT5kHMn+0zROpt34OCI81889jNuNMf8UxGlDOwmT95HrRqaIKqhVS6IXKRWc1ec8cYxJFWG6VQJ9AVB9x70MzVTbmmu8x4DT9+KBCxFwNZr7qO1jfD9iQ28WYh5Q98H4wdilJ1VthO699m1VPbbFtedYCLB1HjUHRrsi/RlzLEODnWfeKl4wt9TzT21lqMKA/U1xDUa6KvREMXwRDrR6PYDD3taM24MkLFoMmWOCQ7vL/4U2G5QxwUof+PRtOJfGU2Ae4E3zOZUu+b1Iumub7OG6LiGo2yuU5nTeNnnLOtVIBAoI/Ys/pD86+8+ldfesCyutubrWTiQRiHNf7iws03B1bNslXyk+GLGIgB4qo+VeG1PgEXmx5DEaiAEjeNvwYdAP96d0Mscj5KyAgCPfJ5ljboUlccZOSGVAfNweJ5fJc6p8OuqmwhEOcE9+FZoUTdmXvJ04sXHiwVyyujyDpQQDV2yeQJjXGoeaJ0IOCCAUBVgCR1yxZQbe729oh9GlXPjUz5hlbyVtiMMtelr0kBEcKZtUxH5cRW/Odup9h4aqo+5vxTm27bCnP1cup3PTbZIq23S7vFHfpwj3OnVMn72p/8rjBpy94fpmippzIZ+eLKV7pPVGA1RpA0Ofzq/R1NHjjzmwglrkiDV4A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66446008)(66556008)(8936002)(186003)(66476007)(64756008)(316002)(71200400001)(107886003)(6506007)(508600001)(6512007)(76116006)(31686004)(86362001)(26005)(110136005)(38070700005)(66946007)(5660300002)(36756003)(122000001)(38100700002)(83380400001)(31696002)(2616005)(6486002)(4326008)(8676002)(2906002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUxOcEpSS21CbklvS0pReisrKzBpb3ZRRnhta3VLMTEzTVFKNTJOdTJHdHdL?=
 =?utf-8?B?WGZrREY4WjJFSWg3YW8xMmFBS3loeHN2cm1sa3RaSG5wL0lnOWRpekJqbFh6?=
 =?utf-8?B?Q1FoQjF5QUR0dmhja0l3N1g1TU43QjJMREFvZU9ERlVFZ3UyUXd0N2UwNDVO?=
 =?utf-8?B?VE5tS29WMExxdlQ1Y0FhTEppK2pZSzlrTFJocVRiUGptQUl0RnRCUmNGWTN3?=
 =?utf-8?B?cGhDR1hjRmQvZy83SlZ6UGRRVEZFZE1BWFhzaXhIWW0zZGZHb1ZobzYvbGFG?=
 =?utf-8?B?Zjlod0xoSXlsRERRcnpYcFMxSGdtcnVFR01LK2E4c2ljcklKNGVCd2M4UzhL?=
 =?utf-8?B?aU1BYmlrdndrbm4zaERkUk5XdGRhdVBwUEJKaGFQdVpHdkNTZGVwRmRhbmdX?=
 =?utf-8?B?bzdINEVWYm40bmQvMEU0MkFhR0p5eXg2S1BSU3dJSWFHb3lNQkZBd01GY3U4?=
 =?utf-8?B?MzdvV0NlQWJuZXJNZXNWaGlqRHorbldnYVFSeThMRWhqbHlXblNONUxpa3Iz?=
 =?utf-8?B?ZlNxNWtYM0xieVdxcCt0b0tEY3E3c05oYzhLTHltUFhUbnpBcmxHTjNwRm9z?=
 =?utf-8?B?MllDVGFFRFJyQitOMjlnYUt4dVN2dS95ckRmV1lGcUdxNGdHdzZncnA1K2Ew?=
 =?utf-8?B?dThaNjhaT2VXVS9IUG14VmFRUGNwbVBaQjYrYWduVUJKMEMweE54cjM4Tzc3?=
 =?utf-8?B?SllSMC9wcEh1NmUvKzVIanV4SXk1a0hwV3FST0Y2R2YwWHhacWVVak9FeTZO?=
 =?utf-8?B?enA3OTZQWGd4TUY1WDdjaXJLZ1FoSCsvbFpwZXAxek5kSFRSbzV2NWM3RWd3?=
 =?utf-8?B?Q2FUNXA5Nml4U015MjBiSkZTSUdnTEZLaWlNNE5oOVFRQWpCazJsemZyd1JM?=
 =?utf-8?B?dUtIZlVVN3FiRnBCTHFQSnlnbXd0RjNVNFd5SnVlczFwWDVRMkNnRzNPa0dN?=
 =?utf-8?B?Q1V0UkxRL0FWUTB6V1VNdXB3RS9pTnhaWUppWTFTQUJHVXk4MFk0R0dUaFhJ?=
 =?utf-8?B?SDF1OHlTS2EvZUFuQld6Skgyb3N5eTFDQXd5R09lS3BIZWkwcHNqd28rZkp3?=
 =?utf-8?B?bTJHY09SanUwWEF5L0tpckFEODdkNEdiVE1jVW9CaHg0dG13a0Q5NDZ4V0FH?=
 =?utf-8?B?TWd3RnZuWmRXR1RPeTE0ZHZvWk9xbXc0VmR2UXVlejVXSWhXM25RYWdvcmxV?=
 =?utf-8?B?elBxUmxmR3FRTWMxWlhZQTJ3MExqNUZOcldIWlc4eW1KRVNSeWpveGV3MlVq?=
 =?utf-8?B?dndiREdjeFdrcmRHRUoxVzAyR3MzWkhqT1E4dFVSMHJjQ25QRzEwaTRMYkFY?=
 =?utf-8?B?Nlg5am5IMnM5V20xOXRSbkpMaGFhWVQwUUo4QStiNS9zaUZTQ2s3azh5eWtV?=
 =?utf-8?B?M0ZPS2Y4RmVoL0JnVWR4dE9FNE9lNkp2Ri96YnF2N3U5YnNJV1F5ZXJoWlpT?=
 =?utf-8?B?UlZuNmhvd0JpQ2V0eXBlUXB6SnJJaGhRWlN0ZTBBV1diM0ttOFNzZnArZ2xD?=
 =?utf-8?B?NVcrZU9ZVUVwMzdKaEdZYlFYbHB2bmdDMnIxSUVhSkRkSzEvZHM3SzVtS2t6?=
 =?utf-8?B?YzFyQVA3MmNBNGRITktZWjFjSGNmKzVEN3VaSERYOEJSTzl6QWVqQmlHS0xN?=
 =?utf-8?B?UnhsdXJUOEZuSVl5WUNDMGl5SDVWYXZvL0ttajlRSUkwUGNOZE5oNU52Nk9y?=
 =?utf-8?B?ODBKYUtsSSs1bWxLcGxkT2huMnFoR3VkeGxnTWIxa2lsTkI1OUkzT2JNN1lS?=
 =?utf-8?B?bUJuV1h1RG5IQTVLZS83ZDQ5L29yZml0MUhXTzRBL3Y1M1Y5bkI5Mk1weUQ5?=
 =?utf-8?B?NEZWc2EyQXNFZWV6cnBMeGdTekZUNTJ1ZlhveVE0cTMxZXF4VU50OUsrYTlQ?=
 =?utf-8?B?QTNmbTZmaENkdStqZ2R2cVJFb3JOM1JTand6Q0Qzd0pZL0FBV1RINk1jcm1P?=
 =?utf-8?B?UDltd1ZSMmZoSjU0T2wxWVQ2ZlFZZ05nczBmU2pHYUFJZzArVExPTXF4aFdS?=
 =?utf-8?B?UjRzdm5rdlpaYnpSZmNBN25XN1dNR3FxWjBZazFuMHVNK3FNdkZCSGtlTDNS?=
 =?utf-8?B?bHk4QlJ5b0FNTGR6aEY0Z21wanF1NXRRaElBamhnekhwYzNNSmJnNE80bFQ2?=
 =?utf-8?B?QnF1aXlVYy9HZ0FoS210Zm5jdGRZcGZ6ZFpwbTBuWlMvR0U0WE4rYTJLeFBJ?=
 =?utf-8?B?V0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F071ED87898D0245BDBA2BDA1AB151FF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7148139c-8289-4ac9-f1ca-08d9b4532029
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2021 22:45:36.2192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TQI2iIRcWOiyZd9us8MRlK15+tg0qLS1kmoRlEmSYQZT1WL048zmUY1G8zINIYaOFdxre1faMd5BfzlnfGjMWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2632
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KDQpGZWxpcGUgQmFsYmkgd3JvdGU6DQo+IA0KPiBIaSBUaGluaCwNCj4gDQo+
IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4gU3lu
b3BzeXMgaW50cm9kdWNlZCBhIG5ldyBlbmhhbmNlbWVudCB0byBEV0NfdXNiMzIgY2FsbGVkIE11
bHRpLVN0cmVhbQ0KPj4gVHJhbnNmZXIgKE1TVCkgdG8gaW1wcm92ZSBidWxrIHN0cmVhbXMgcGVy
Zm9ybWFuY2UgZm9yIFN1cGVyU3BlZWQgYW5kDQo+PiBTdXBlclNwZWVkIFBsdXMuIFRoaXMgZW5o
YW5jZW1lbnQgYWxsb3dzIHRoZSBjb250cm9sbGVyIHRvIGxvb2sgYWhlYWQNCj4+IGFuZCBwcm9j
ZXNzIG11bHRpcGxlIGJ1bGsgc3RyZWFtcy4NCj4gDQo+IEZpbmFsbHkhISBUaGlzIGlzIGEgZ3Jl
YXQgaW1wcm92ZW1lbnQgdG8gdGhlIGNvcmUgOi0pDQo+IA0KPj4gUHJldmlvdXNseSwgdG8gaW5p
dGlhdGUgYSBidWxrIHN0cmVhbSB0cmFuc2ZlciwgdGhlIGRyaXZlciBoYXMgdG8gaXNzdWUNCj4+
IFN0YXJ0IFRyYW5zZmVyIGNvbW1hbmQgYW5kIHdhaXQgZm9yIHRoZSBzdHJlYW0gdG8gY29tcGxl
dGUgYmVmb3JlDQo+PiBpbml0aWF0aW5nIGEgbmV3IHN0cmVhbS4gQXMgYSByZXN1bHQsIHRoZSBj
b250cm9sbGVyIGRvZXMgbm90IHByb2Nlc3MNCj4+IFRSQnMgYmV5b25kIGEgc2luZ2xlIHN0cmVh
bS4gV2l0aCB0aGUgZW5oYW5jZW1lbnQsIGFzIGxvbmcgYXMgdGhlcmUgYXJlDQo+PiBuZXcgcmVx
dWVzdHMsIHRoZSBkd2MzIGRyaXZlciBjYW4ga2VlcCBwcmVwYXJpbmcgbmV3IFRSQnMgYW5kIHRo
ZQ0KPj4gY29udHJvbGxlciBjYW4ga2VlcCBjYWNoaW5nIGFuZCBwcm9jZXNzaW5nIHRoZW0gd2l0
aG91dCB3YWl0aW5nIGZvciB0aGUNCj4+IHRyYW5zZmVyIGNvbXBsZXRpb24uDQo+Pg0KPj4gVGhl
IHByb2dyYW1taW5nIGZsb3cgaXMgc2ltaWxhciB0byByZWd1bGFyIGJ1bGsgZW5kcG9pbnQgd2l0
aCBhIGZldw0KPj4gYWRkaXRpb25hbCBydWxlczoNCj4+DQo+PiAxKSBDaGFpbmVkIFRSQnMgb2Yg
dGhlIHNhbWUgc3RyZWFtIG11c3QgaGF2ZSBhIG1hdGNoaW5nIHN0cmVhbSBJRA0KPj4gMikgVGhl
IGxhc3QgVFJCIG9mIGEgc3RyZWFtIG11c3QgaGF2ZSBDSE49MA0KPj4gMykgQWxsIHRoZSBUUkJz
IHdpdGggTFNUPTAgbXVzdCBoYXZlIENTUD0xDQo+Pg0KPj4gRGVwZW5kcyBvbiB0aGUgYXBwbGlj
YXRpb24gYW5kIHVzYWdlLCBpbnRlcm5hbCB0ZXN0cyBzaG93IHNpZ25pZmljYW50DQo+PiBwZXJm
b3JtYW5jZSBpbXByb3ZlbWVudCBpbiBVQVNQIHRyYW5zZmVycyB3aXRoIHRoaXMgZW5oYW5jZW1l
bnQuDQo+IA0KPiBEb2VzIHRoaXMgbWVhbiB0aGF0IHdlIGNhbiBub3cgaXNzdWUgU3RhcnQgVHJh
bnNmZXIgZm9yIGVhY2ggb2YgdGhlDQo+IHN0cmVhbXMgb24gdGhlIHNhbWUgZW5kcG9pbnQ/IFNo
b3VsZCB3ZSBzdGFydCBoYXZpbmcgcGVyLXN0cmVhbSBUUkJzLA0KPiB0aGVuPyBNYXliZSB3ZSBk
b24ndCBuZWVkIGEgZnVsbCAyNTYgVFJCcyBmb3IgZWFjaCBzdHJlYW0sIHBlcmhhcHMgMTYgdG8N
Cj4gMzIgVFJCcyBmb3IgZWFjaCBzdHJlYW0gb3VnaHQgdG8gYmUgZW5vdWdoPw0KPiANCg0KU29y
cnksIEkgbWF5IG5vdCBiZSBjbGVhciBpbiB0aGUgZGVzY3JpcHRpb24uIEp1c3QgbGlrZSBwcmV2
aW91c2x5LA0KYmVmb3JlIHdlIGNhbiBpc3N1ZSBhIFN0YXJ0IFRyYW5zZmVyIGNvbW1hbmQsIHdl
IG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQNCnRoZSBlbmRwb2ludCB0cmFuc2ZlciBpcyBjb21wbGV0
ZWQgb3IgZW5kZWQgZmlyc3QuIFRoYXQgaGFzbid0IGNoYW5nZWQuDQpIb3dldmVyLCBwcmV2aW91
c2x5LCB3aGlsZSB0aGUgZW5kcG9pbnQgaXMgc3RhcnRlZCwgYWxsIHRoZSBUUkJzIG5lZWQgdG8N
CmJlIG9mIHRoZSBzYW1lIHN0cmVhbSBpZC4NCg0KVGhlIGVuaGFuY2VtZW50IGhlcmUgYWxsb3dz
IHRoZSBlbmRwb2ludCB0byByZW1haW4gInN0YXJ0ZWQiIHdpdGgNCm11bHRpcGxlIHN0cmVhbXMg
b2YgZGlmZmVyZW50IElEcy4gVGhlIGRyaXZlciBjYW4gYWRkIG5ldyBzdHJlYW1zL1RSQnMNCndp
dGggVXBkYXRlIFRyYW5zZmVyIGNvbW1hbmQuDQoNCk1TVCBpcyBtYWlubHkgZm9yIGRldmljZSBp
bml0aWF0ZWQgc3RyZWFtLiBXZSBkb24ndCBtYWludGFpbiBtdWx0aXBsZQ0KVFJCIHJpbmdzIChv
bmUgb2YgZm9yIGVhY2ggc3RyZWFtKSBhcyB4SENJIGRyaXZlciBmb3IgZWFjaCBhY3RpdmUNCnN0
cmVhbS4gRm9yIGRldmljZSBpbml0aWF0ZWQgc3RyZWFtLCB0aGUgZGV2aWNlIHdpbGwgaGF2ZSBj
b250cm9sIG9mIHRoZQ0Kc3RyZWFtL3RyYW5zZmVyIG9yZGVyLiBUaGUgb3JkZXIgd2lsbCBiZSB0
aGUgb3JkZXIgb2YgdGhlIHN0cmVhbQ0KcmVxdWVzdHMgcXVldWVkIGJ5IHRoZSBmdW5jdGlvbiBk
cml2ZXIuDQoNClRoZSBkd2MzIGRyaXZlciBjYW4gaW5kaWNhdGUgdGhlIGxhc3QgVFJCIG9mIGEg
c3RyZWFtIElEIHdpdGggQ0hOPTAuDQpUaGlzIHdpbGwgdGVsbCB0aGUgY29udHJvbGxlciB0aGF0
IGl0IG5lZWRzIHRvIHN3aXRjaC9pbml0aWF0ZSBzdHJlYW0gb24NCnRoZSBuZXh0IFRSQidzIHN0
cmVhbSBJRC4NCg0KSW4gc2hvcnQsIHdlIHdpbGwgc3RpbGwga2VlcCB0aGUgMjU2LVRSQiByaW5n
IHBlciBlbmRwb2ludC4gVG8ga2VlcCB0aGUNCmRyaXZlciBiZWhhdmlvci9pbXBsZW1lbnRhdGlv
biBzaW1wbGUgYW5kIGNvbnNpc3RlbnQgd2l0aCByZWd1bGFyIGJ1bGssDQp3ZSB3aWxsIG9ubHkg
bmVlZCB0byBpc3N1ZSBTdGFydCBUcmFuc2ZlciBhdCB0aGUgYmVnaW5uaW5nIGFuZCBjb250aW51
ZQ0KdG8gcHJlcGFyZSBuZXcgVFJCcyBmcm9tIGRpZmZlcmVudCBzdHJlYW1zIHVzaW5nIHRoZSBz
YW1lIFRSQiByaW5nLiBXZQ0KanVzdCBuZWVkIHRvIGZvbGxvdyB0aGUgcnVsZXMgbm90ZWQgaW4g
dGhlIGNvbW1pdCBtZXNzYWdlLg0KDQpCUiwNClRoaW5oDQo=
