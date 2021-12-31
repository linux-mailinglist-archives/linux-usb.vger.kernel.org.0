Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C1248228F
	for <lists+linux-usb@lfdr.de>; Fri, 31 Dec 2021 08:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242729AbhLaHCo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Dec 2021 02:02:44 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:40516 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229699AbhLaHCn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Dec 2021 02:02:43 -0500
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2AA1C47D28;
        Fri, 31 Dec 2021 07:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1640934163; bh=fqbsNHqTq/Jex4l6g9PQ8MUxfgDGVN2GKTQ8mqfzXTU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=MiXteFLJljAFkkE9MSSSWbggtHShV7rqsWwEEb3nDfkJVN2Bm/L7qJjRwKbBbMocQ
         c1VlYNcWokAaPsROoMpfZ38dvWHHh+NUpDLHTu4Chk16cJ9nZlkxkCoJGJ+RHWWplb
         Fa8xBxkVuz2GE0mqHtY7MXJjBpJSlGYJNQE4AFyGjhH/EtLAS6YgAyA8oDmJjf8HE3
         2vrWQ6x7IBMRGsu1Vz4lCA+6DAoTX0lv122LSkzpUS/unbPqTp8YjAKezG39Uhx7I6
         NTCGbGJsNRrfx5wOR9C6EIyjaATP67HoLzryl6UEZCBBbv51k7rrxSw8ga19ArlaRX
         N+Rk4mG8JlSMg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6D741A005C;
        Fri, 31 Dec 2021 07:02:42 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9528F8007A;
        Fri, 31 Dec 2021 07:02:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="RwrA1Y07";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7qrrilVxGxjhTxkPoE0XjGR1ykbZZSsYV9JPWxjafFkAhtj9zlrNrHLLmh1Az4o9pimfdAKY/iLetSIANUaeNAHTKqNnEy8YTyemPFYwreMFPRWjQyF1Yu8AP9mbWbW1fYkjsI4qDbSA9E+pSx3/k6c53xYEqK8bgLxW3obottCNvWyukAHHR6kHVqt3IQ+WVV31uazEn0MyUqmfDwDUY2X9btTFvw7vmeEZCLpVT/hCKgMKw1maQZvxOJDqKTdXxpLIjX6aDRsZixPSYgLSBgRnnyq1hasWZrL/Ws//ijJkR3Ju4499GneHRPIubhPnFMoIKV8ilDhBpTrJoIGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqbsNHqTq/Jex4l6g9PQ8MUxfgDGVN2GKTQ8mqfzXTU=;
 b=JeRQmFzC/zEKLI3Fi4mlCjkTFxkkJEUwIgKbc6MbKNVd0OiBlnyC6Ixx+QLM6BRTQC94xz+YvbendXU7AmXO1QPPQZKnAuFsowFdwyS04WWqj/ZWVm41m901q0tFED8wHSlwH98n2KNjnhR36iv7xcwdhSei4pnse/8QfQk0Kalgaw9bhKCFRC4JtZPJehxSAWLzdH+1QKrE0yjWcXYBsp1viWouqHSTNxlBZmjRiLdS766B/u/PAdrs7ceK3n7BTQis7TuoVHW5PmaDe23nU5iX9N3dCRAWgP4SU48gRd2l0L/8aKWIDiD8ie7noDJsw9H1TwXHVxxM75Ppn1ebyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqbsNHqTq/Jex4l6g9PQ8MUxfgDGVN2GKTQ8mqfzXTU=;
 b=RwrA1Y07D/9pMfoSrNkcj/WA54+3M5NdjQ/Bn+Whb3PHGgJpfpZgB4f4N+n33XftGCOtl9MMCEj6vXcRPutAae3LzC5dLDIqjAyw7WAsaOF7G6Pdtt/35CwfLO6ar6pBJBv2nieb9uLdMvjpnf4yX+V0HYmpCCrdz6xGXtzcvLk=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Fri, 31 Dec
 2021 07:02:38 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b4:d43c:d55f:a754]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b4:d43c:d55f:a754%6]) with mapi id 15.20.4844.013; Fri, 31 Dec 2021
 07:02:37 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     youling 257 <youling257@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "william.allentx@gmail.com" <william.allentx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
Thread-Topic: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
Thread-Index: AQHXFK9aaZXyhujf3U2dpApLGjyr3Kp7QfkAgABMwgCB0UUQAIAABYYAgAAYe4CAALNAgIAAGW4AgAAKDQCAABKeAIAAJEWA
Date:   Fri, 31 Dec 2021 07:02:37 +0000
Message-ID: <ae6d47c7-68f2-e482-c6ef-d2c63e2a9057@synopsys.com>
References: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
 <20211230131014.21886-1-youling257@gmail.com> <Yc20WPbIad44/3rd@kroah.com>
 <CAOzgRdbeQ69pWbagFwTvV4ZcYGBE5GkwdqcuxxGFLXBJSy-GMA@mail.gmail.com>
 <6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.com>
 <CAOzgRdb+Ru8AL=wUquysbqd8uGkNSDzSNfOSW3Fs2Pd6BGxo1w@mail.gmail.com>
 <1d63d954-13fb-f9c6-b2e7-d350ace2aa5a@synopsys.com>
 <CAOzgRdbgepUHKCmg8wR0s0bvYyuWNachi_EP6c9n_mRvQkXmGw@mail.gmail.com>
In-Reply-To: <CAOzgRdbgepUHKCmg8wR0s0bvYyuWNachi_EP6c9n_mRvQkXmGw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b10cbff-e756-4f22-67e5-08d9cc2b8793
x-ms-traffictypediagnostic: BY5PR12MB4116:EE_
x-microsoft-antispam-prvs: <BY5PR12MB41165C1EFF9AF8C2141DEE8CAA469@BY5PR12MB4116.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FRwYgzJtBYp5THKnGRho7gc/94b7jpz1bv246RcMmoJpc40upw9IxnhqcsgCluASGAO5iZAA35tgRRklVJ5nDi4hVy+IY9wytFcfR54cfoBTlhWsk8WFMdtWQBA8tn9m7MbLlS8a8bDg6j95Ox53EoC3f0IjMyBVsrNEBkiMpUa+zAUEg5HSnIPZNZIW/12p2s4yLSXzF5PQj6/9oVHSkeppajMXnmr/gmkJTiI+n53pi5J1oWOQbqj4yKSWPyGvD36VLzxth4PKDYz3y8i/8XhBsw3BHSL5/F/R3W/lFeQpQxZmCrm9Tm9sl1ya17pkb+Ltbekl7gVwstu8PCvHaO5/Zyjp5IYszyy+HeeI9Z5feZVn0lbJCCY6aIzUmqH5Mu5Q4L/0QSUtqhxwZ5x878osKsPfaXXtfCTjjrcUEv4UQKm5DZ+b5f+HmJjo3eKBgbFrGfOhi3euuFGHOQ99SpmFUfQAG18QqmW0qb0B09xM3hQs+W6ns8yLHl7NV3WauDrtytlXcDgb8rk4TI3aGyOFKbYQLG3ZxRiIWJ0jt7nwBwr0fOVQFJGDn37Y9Cpaxig2zTj/OYAJ9BTW0cQFNjUZ3N0ZxoGFnqU/if9jqtM1qRAyItRH6lqLtENkIQ1frUDL/wuxeIgEAAFRUSuqO8t6GaLCHhI5oaQWLjghZQ1iR0hKG7c8bfXvE8Z0lnJDB6VDOYodk+OnjGvyQY351qGohVVFWHJblJjzeSdUulRlJUbpldRtkzJ4hPNORo6jQr0+atUV3as0EEgIUxQnsg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(36756003)(2906002)(31696002)(4001150100001)(31686004)(38070700005)(86362001)(83380400001)(54906003)(4326008)(5660300002)(8676002)(2616005)(38100700002)(110136005)(66556008)(66476007)(66446008)(66946007)(76116006)(186003)(508600001)(64756008)(26005)(71200400001)(6512007)(122000001)(6486002)(8936002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXBSajRKTUV1SjNKWWc1bXY2ekZHcXVwK3VJRFY1S3RzRnY1UzU1eStEYVdL?=
 =?utf-8?B?dXZOS0w2QSt5VUt3QmN5MDAwc3hWT2FYbEhEYnlYYzQ0MWxUOW5GOFp1eitG?=
 =?utf-8?B?ZlMrQ0JkWEhsNWxaakhBZnRjVlRjSDM4ZzNEdDJmYytUM09oRjJRYVZuVDRP?=
 =?utf-8?B?emJkaEdES3lCTHlZSGpmOVN3M0JrV09MSmhPNTB0VCswdjBJS1poUlR6U25w?=
 =?utf-8?B?bzMyL0ljTkQ1d0RLc1F1YWw0azRCTmlrTEJZenpMVVFMZVc2WkVPMkU3MGFD?=
 =?utf-8?B?aDk0ZnFsQ2g1N282SDNheEtVV1dSV2VxcXF6Z1dUbGZwNnB4Tmw5MnBRZkV1?=
 =?utf-8?B?bG5aeFp6bW4vd09Wc3BIa1ZMcTJQZ2RKendsOGJUaWw4NVY3a00vcmp4Tm52?=
 =?utf-8?B?NmZxSUhWZHBsTmpBWkMxNW9vazJPRDJ3QmE5VnFjQnQ0WFpZRVJOdTRvZlA5?=
 =?utf-8?B?YzIwalErQ0NId1o3QWlMWXJ3VVdGWTBaeVRVTllxeDlya1ZHSlo5cC8yZFRC?=
 =?utf-8?B?cHJtRkR6c2tBcXJyN0JMSE1wVGZIWDliL09rRHBLWFBBc1pheDJaamFGWlNu?=
 =?utf-8?B?ZVBqU3ZqM2xOeUcweXhDN1JqcHNMU2Z4eGthYVMxak9SbkVpeGhHY1Q1Q3dn?=
 =?utf-8?B?dGRJQnJPdnBmdk55aldaakYvNXNOUTdPcTB0UDlHdFdLQlFUY3hMTVZvVlND?=
 =?utf-8?B?R0dHOWE1UjVvQVpzcXkwc1BZbGVqREtwOXpKcExmRG8xRXZyQVh3bzJORFRR?=
 =?utf-8?B?aS84RWViNVpsMjNxajhWd0NoaFozMTUrVkQvNitMN0kvb1FoeGE4UVMxY1lt?=
 =?utf-8?B?cVhib2RzMUtlVnBwU3VYaGw0a1E1Lzc0SnpGcjlKblhwaEVuU2E0QWtWZ28v?=
 =?utf-8?B?YU9DZEo3TW1DcXFxQ05HM3Qya0xUWGxWVU9PUGNlWjBTdklmSC8wZkdxTjAw?=
 =?utf-8?B?eDFMVGhEajhnVmd3c200UURZeVUyTnh6cEVQK2JXNjNrR1dYRTdEY3dFbjFa?=
 =?utf-8?B?TXdocTdzTjlkK01DWjZoZ05GQWQ3eXZhL3hWa0pIa2t4eWFCaUNqcmJyVk1Y?=
 =?utf-8?B?aThXUk9rbm9PODM5T0lDczVnSmkwdHhhZzgxSi9lU0RaUUtOMG9SSFh0NlBj?=
 =?utf-8?B?cmdNZVJSVEhNVHQ0LzU3dGhqckpuRWp0eEtyeWt3QnBKVk1vYmlJL2hxWXRX?=
 =?utf-8?B?OWlFSjBucFA3bEZoL0dqNVFOclRWUHNlSEkyS3Y4SkdYMWl1TkdLQWpsb24r?=
 =?utf-8?B?THN5TUV0b01rRHU4WmFCSjRCSnRtY1E2UUJub0FnVkgyWlc5MjcxZG82NUM1?=
 =?utf-8?B?RG1aYVBmZHlMRG4rUFZyUkhPTkR2R0t0TFdwTk4rbjBaemlDMVJ6ZGZrK28x?=
 =?utf-8?B?RFBlNHRzaWtiaVRydE9oK2FCREtxdWRFaHFFQjYzQ2RNa2o3dHJNMG5QSmFx?=
 =?utf-8?B?WUp0eG1QNEgvWFF5M0NOK1cxeGxhZVpQZzEwZDFDSFMvQUlseDk0WXVITm9x?=
 =?utf-8?B?cUJWazhHeit6Y2ZnNjdxa2w3Ykp3QUk1eFRkZUhFa2VkZlQ4RWU2UW9CcTlF?=
 =?utf-8?B?RXBtSFU3UU5PS01qUHBURmFMblQzekJnNU5vOXN0SEE0eldiZmVTeXRnamwx?=
 =?utf-8?B?UERXNmt0RUhNVTZFeGwxUktZR0Z6T1NUdWNPUFBsM05PdWhYeGg0SC8rMURF?=
 =?utf-8?B?NjljQ3VJall1NFFPR1hUcXYzQ3dpcGxLRWV1cWg4SmlxTXd4QnhqNG9lczk2?=
 =?utf-8?B?SFdTRHVPd0JMUHQzclU4czJJNkdnY1lsSmN0V1ZoWVQ1eWNVUU9JME91bXc0?=
 =?utf-8?B?dThWdytiVUo4UlBqcEVDU21qU0JibE5WMEtSdVFqSG4waHQybHJENkRqVFVa?=
 =?utf-8?B?ZEFtcUtkcGNrTGVwWVlhVnV3TFFidHhHWkEydG1SbE1scnowcXV2bnA4N3pa?=
 =?utf-8?B?Y1YwazFEZGdmclRndS91QmZ0L3U1QW84eUJ0c1BOZXo2OG9td3RjK09Xbnps?=
 =?utf-8?B?aFFueUU1eHRzRHhtcCtoOUJNTXdHNUREdVNSWlRzdE0wTituTlBmMm96Zk53?=
 =?utf-8?B?amhIWU4yTjBLVWZYaWRWNUxVLy9OK2lmNlJ1RllMTHRrL25PcUlYTldDWG5q?=
 =?utf-8?B?ZTdIeDU4S0MrdGZqODN0cFZ2bDFYbi9kc2ltMTFhTnA3bjhJanpOdmx6VmdM?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED19824EE8ED1A4DB40E27C315ADFD9C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b10cbff-e756-4f22-67e5-08d9cc2b8793
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2021 07:02:37.5349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vQHHzelJt2ODlQxieJoMDrJ0h3J5iIfeVbpbsu/kq40mrNe93SAGWfLMHUQX19z6N7huVnckpcV4y0LDYQcPGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

eW91bGluZyAyNTcgd3JvdGU6DQo+IDIwMjEtMTItMzEgMTE6NDYgR01UKzA4OjAwLCBUaGluaCBO
Z3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+Og0KPj4gSGksDQo+Pg0KPj4geW91bGlu
ZyAyNTcgd3JvdGU6DQo+Pj4gdGVzdCB0aGlzIHBhdGNoLCBjYXQgL3N5cy9idXMvdXNiL2Rldmlj
ZXMvNC0xL3NwZWVkLCAxMDAwMA0KPj4+IFsgICA3NC42OTQyODRdIHVzYiA0LTE6IG5ldyBTdXBl
clNwZWVkIFBsdXMgR2VuIDJ4MSBVU0IgZGV2aWNlIG51bWJlcg0KPj4+IDIgdXNpbmcgeGhjaV9o
Y2QNCj4+PiBbICAgNzQuNzUwMzI5XSB1c2Itc3RvcmFnZSA0LTE6MS4wOiBVU0IgTWFzcyBTdG9y
YWdlIGRldmljZSBkZXRlY3RlZA0KPj4+DQo+Pj4gYnV0IHNwZWVkLCBwY2llIHRvIHVzYjMuMiBn
ZW4yeDIsIFdSSVRFOiBidz02NDJNaUIvcyAoNjczTUIvcyksDQo+Pj4gNjQyTWlCL3MtNjQyTWlC
L3MgKDY3M01CL3MtNjczTUIvcyksIGlvPTEwMDBNaUIgKDEwNDlNQiksDQo+Pj4gcnVuPTE1NTct
MTU1N21zZWMNCj4+PiBSRUFEOiBidz00NjdNaUIvcyAoNDkwTUIvcyksIDQ2N01pQi9zLTQ2N01p
Qi9zICg0OTBNQi9zLTQ5ME1CL3MpLA0KPj4+IGlvPTEwMDBNaUIgKDEwNDlNQiksIHJ1bj0yMTQw
LTIxNDBtc2VjDQo+Pj4NCj4+PiB0aGUgbWFpbmJvYXJkIHVzYjMuMiBnZW4yeDEsIFdSSVRFOiBi
dz04MzhNaUIvcyAoODc4TUIvcyksDQo+Pj4gODM4TWlCL3MtODM4TWlCL3MgKDg3OE1CL3MtODc4
TUIvcyksIGlvPTEwMDBNaUIgKDEwNDlNQiksDQo+Pj4gcnVuPTExOTQtMTE5NG1zZWMNCj4+PiBS
RUFEOiBidz03NTNNaUIvcyAoNzkwTUIvcyksIDc1M01pQi9zLTc1M01pQi9zICg3OTBNQi9zLTc5
ME1CL3MpLA0KPj4+IGlvPTEwMDBNaUIgKDEwNDlNQiksIHJ1bj0xMzI4LTEzMjhtc2VjDQo+Pj4N
Cj4+DQo+PiBMZXQncyBhdm9pZCB0b3AtcG9zdC4NCj4+DQo+PiBTb21lIGNvbW1lbnRzOg0KPj4g
MSkgSnVzdCBiZWNhdXNlIHRoZSBob3N0IGlzIGNhcGFibGUgb2YgZ2VuMngyLCBpdCBkb2Vzbid0
IG1lYW4gaXQgd2lsbA0KPj4gcnVuIGF0IGdlbjJ4MiBzcGVlZC4gWW91ciBkZXZpY2UgY2FuIG9u
bHkgb3BlcmF0ZSB1cCB0byBnZW4yeDEgc3BlZWQsIHNvDQo+PiB0aGF0J3MgdGhlIGxpbWl0LiBU
aGUgdGVzdCBzcGVlZCBmb3IgZ2VuMngxIGFib3ZlIGlzIG5vdCB1bnJlYXNvbmFibGUuDQoNCj4g
bXkgZGV2aWNlIGNhbiBvbmx5IG9wZXJhdGUgdXAgdG8gZ2VuMngxIDEwZ2JwcyBzcGVlZCBvbiB3
aW5kb3csIG9ubHkNCj4gNWdicHMgb24gbGludXgga2VybmVsIDUuMTZyYzcuDQoNCldpdGggdGhl
IGNoYW5nZSBJIHByb3ZpZGVkLCB5b3Ugd2VyZSBhYmxlIHRvIHJ1biB0ZXN0IGF0IGdlbjJ4MSwg
YWxiZWl0DQpzbG93ZXIgdGhhbiBleHBlY3QuIChpLmUuIHdyaXRlIHNwZWVkIGF0IDY3M01CL3Mg
Zm9yIEFTbWVkaWEgaG9zdCBtdXN0DQpiZSBTU1ApLiBUaGUgaXNzdWUgd2l0aCBkZXZpY2UgdW5h
YmxlIHRvIG9wZXJhdGUgYXQgU1NQIGlzIGF0IGxlYXN0DQphbnN3ZXJlZC4NCg0KSWYgeW91J3Jl
IGxvb2tpbmcgdG8gZmluZCBvdXQgd2h5IHRoZSBwZXJmb3JtYW5jZSBpcyBzbG93LCBjb25maXJt
IHRoZXNlDQppdGVtcyBmaXJzdDoNCg0KMSkgQXJlIHlvdSB1c2luZyB0aGUgc2FtZSBhcHBsaWNh
dGlvbiB0byB0ZXN0IG9uIExpbnV4IHRvIGNvbXBhcmUgd2l0aA0KV2luZG93cz8gKExvb2tzIGxp
a2UgeW91J3JlIHVzaW5nIENyeXN0YWxEaXNrTWFyayBmb3IgeW91ciBXaW5kb3dzIHRlc3QpDQoN
CjIpIElmIHlvdSdyZSB1c2luZyB0aGUgc2FtZSBhcHBsaWNhdGlvbiwgYXJlIHlvdSB1c2luZyB0
aGUgc2FtZSB0ZXN0DQpwYXJhbWV0ZXJzIGFuZCB2ZXJzaW9uPw0KDQozKSBJcyB5b3VyIGRldmlj
ZSBvcGVyYXRpbmcgaW4gQk9UIG9yIFVBU1AgaW4gTGludXg/IFVBUyBQcm90b2NvbCBpcw0KZ2Vu
ZXJhbGx5IGZhc3Rlci4gTmV3ZXIgZGV2aWNlIGdlbmVyYWxseSB1c2VzIFVBU1AsIGFuZCBJIGFz
c3VtZSB5b3Vycw0KaXMgYSBuZXdlciBkZXZpY2UgKGNoZWNrIHlvdXIgZW5jbG9zdXJlKS4gTWFr
ZSBzdXJlIHRoZXJlJ3Mgbm8gcXVpcmsNCnByZXZlbnRpbmcgdGhlIGRldmljZSBvcGVyYXRpbmcg
aW4gVUFTUC4NCg0KSWYgYWxsIG9mIHRob3NlIGFyZSBjaGVja2VkIG91dCwgeW91IGNhbiBzdGFy
dCBjYXB0dXJpbmcgbG9ncyBzbyBvdGhlcnMNCm1heSBsb29rIGludG8gaXQuDQoNCkJSLA0KVGhp
bmgNCg0KKGJ0dywgSSdsbCBiZSBvbiB2YWNhdGlvbiBmb3IgYSB3ZWVrLCBtYXliZSBvdGhlcnMg
Y2FuIGhlbHAgd2hpbGUgSSdtIGF3YXkuKQ0K
