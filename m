Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 705D130B63A
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 05:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbhBBENW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 23:13:22 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:37030 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231419AbhBBENK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 23:13:10 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 82EA6C008C;
        Tue,  2 Feb 2021 04:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612239130; bh=JxpaiSm+UIV32TdG/YEWdggHH1rdoUuMHQ7cjexvQy4=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=ADat2UfPqP/lOlIVzEYG6zcrIU4ACy7D1FB9C1oWUF0PcdoiZszRTH6YP3rhN5EmQ
         xSrxyAHF9sgBQE5TsQ3TcK+qS7cQ90F+YpEqTLZCyxuNNqgNW4BPNAtoZM9gCi6F4C
         T/rv1mb19pb8oicH+9G30HYi2uEQg0z8PPOrzegJvOcviL9/w71INXQ+404NKJ3c+4
         iLMMjqucPVyrPVj4kolJwxBQ5OjVkVDLE6onj3oCVfvD/wUFi5W0byYmHbdRSpJjt2
         lVmYgY/sXTwoL8wkt7hPDjAs+Mlo4502jZotdg3nHMXRDcxyHsX2EcQifln1itbQjX
         7Yylg0g8V1Efg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3C46DA006C;
        Tue,  2 Feb 2021 04:12:06 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 606B18020F;
        Tue,  2 Feb 2021 04:12:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ua6bWjx5";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCjZJN09F+wddmVNhvTBmHTnoiN4yyjO3CLqfX5piAE6lu2/f9bCEsu8zg40q43QPpG4fE0KEopVTiJPDhplRIBj4qyAmIIyojLgRt+rKTJ8suedQOA6PlqbMnJfixydmLaVQyn62md9cKrfYHkh18ImzEGFzQm3tYkR0ht2X/0rnVWw1ED/tC4L8uycHZZ+A3vN8IDRgJj465rvwvD5HjN1oMzdfiy31Lo8214KGw/p3DslXiG81fTqsOcI1IO/NQs1rcW8xD5a+kEm0EPGWdKjQwOetj49m2d6TmPUvTgwK/cZ88lbEQieCGQ8QtgRjb/9zP9S7MiWO2u1lq1dxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxpaiSm+UIV32TdG/YEWdggHH1rdoUuMHQ7cjexvQy4=;
 b=V6TcFfYC1ViigN0AIbDg5+P+IHpv10GIR1CqiROgk2PrmLw1e7y4L2yaj1/GET1JfKaP82heEVCKDUuTGQflzHGyVefGnI3dfymkQG9H2O3Mk+toUkz1c+iWzWZputqUGsqZvMGtCLktznybOA9OsOimijuuwkBZQrqu9eFwtBaqv6FBfWlC2O8T9oywx67wubVBnTF//xbtYh9TSuKivClRHj9de9frD1bvi+sWC9Jc5uNj5bISXgjq3ubj4vTjp1F8W94g42HiVdawmZun2UQJypXGOyUSCAwE9gQIp0uLFCY8LkVBkYvGFmwBwXYAaOJuNtgH7a4u9TOpCzJCFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxpaiSm+UIV32TdG/YEWdggHH1rdoUuMHQ7cjexvQy4=;
 b=ua6bWjx5FNliVb/foxUKRS1y6USsWyYMqgYHjNGha2T9psXvuXsEG6A24Xg3FVzZcaSPR3bpugxpWrLgl9PElOb1+o6h0RGpPVwEt+FcIVoCOUi+PiCZRkCNpSx7+z8LNdgEguL1ogh5wiyrxaTdZvdhmmeuoJxD/4qSRHYcCio=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3206.namprd12.prod.outlook.com (2603:10b6:a03:130::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 2 Feb
 2021 04:12:01 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3805.026; Tue, 2 Feb 2021
 04:12:01 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Hardik Gajjar <hgajjar@de.adit-jv.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Allen Pais <allen.lkml@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        Romain Perier <romain.perier@gmail.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>
Subject: Re: [RFC PATCH 1/8] usb: core: Track SuperSpeed Plus GenXxY
Thread-Topic: [RFC PATCH 1/8] usb: core: Track SuperSpeed Plus GenXxY
Thread-Index: AQHW+RVroWeLopWkwkKWg6GgXLcWXKpEOxqAgAAB9YCAAAKyAIAAAS8A
Date:   Tue, 2 Feb 2021 04:12:01 +0000
Message-ID: <05c8479c-673c-98be-e44f-77acf4cf9886@synopsys.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
 <3ea65aec93bca0e4e44a786a5af5b669d8c6570d.1612237179.git.Thinh.Nguyen@synopsys.com>
 <3b486e82-fa5d-f39e-069e-7bae4424cb86@embeddedor.com>
 <2d8ad81a-6f5e-4cd3-618d-8e6d943792f5@synopsys.com>
 <e2d540a1-6bd5-da39-fa79-5e69f2279a5a@embeddedor.com>
In-Reply-To: <e2d540a1-6bd5-da39-fa79-5e69f2279a5a@embeddedor.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
authentication-results: embeddedor.com; dkim=none (message not signed)
 header.d=none;embeddedor.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ca725ae-58fa-4eb7-c98f-08d8c730b138
x-ms-traffictypediagnostic: BYAPR12MB3206:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB32069798F3F89E8F71E4F7C6AAB59@BYAPR12MB3206.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eMsXeObSdgXg0l2upE6XrO5XyL6+BPSlPDpQl3qs8laRBhiPxypEiOmyTkAugZcQMjLgmXqPeRN4NqM2p2U/7qmgeVP5ksrwpQCdUpMXj0/E98FQQhUAeRRRm/aFwKBucDfvtef+MIHuLzKe6e8IEWRHRDdU/1+Igho+o/1Bog0m7YoXoz66QkX7kNMrNKAMe5RZ9TWQQwQ0gMPenhJOmGLZNhHIM5Yndp+8JcJgPYQtGZ+ws6TIX5eOPuCPrCR5iB07U/8hP/AfRW8xcIHXw+BuGgL0F/Y/dsqNDc4lELLg5PF466r85nE6dlbHhaMJ83JupNvlla2KCq+1x4xkRnBTkOxiyjHG67XxMwwFnEadjwaaEdjIjzqr+3FnFuF+dl7p8ZoahkQsoZ1H7G+1MLK6/tjNcNEWf6zocGv45LpbAvQrxZXDkLowiHbVUmH3oMc7hVWQAKxUl5lO6vzLrcJi+ASr8+AyjIW4vQElolSre+8w1WX9tb7583Lfw8sfB1uGJiYiMMQjC9EzusJhFbQJ4OM+oSXQzj5Ym14cbXRU6AehKDvEArdYiZMuDhb/bKc9GNPKrUKhEZasJ16VSl+vojpCJxzzmZcTOnCW+8TisgYk4qWZTdd5pnlLbvn6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(366004)(376002)(396003)(39860400002)(136003)(346002)(6486002)(5660300002)(66556008)(31696002)(71200400001)(6506007)(26005)(31686004)(66476007)(921005)(86362001)(6512007)(316002)(110136005)(64756008)(2616005)(66446008)(36756003)(7416002)(186003)(76116006)(2906002)(478600001)(53546011)(8676002)(8936002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aDhVYXRZcUFtQWpkZ3pNNVp1TDZRUHI5K3dOWUVyZ0dHa3h3akwzSDI0Tnpj?=
 =?utf-8?B?TWZURFhoN2lBYnErQ3YvQWZIK0lyZnA4RmNJVG4vOVdMemNGZUtFYjBtSWVz?=
 =?utf-8?B?KzNsemdTSGZiVFJaTi9pL2NaMHkvYUZvVFRpTGtMU1N0YVlZN2tKWnlQUDFI?=
 =?utf-8?B?eDVEM1RmWG9lMW1ZL3ZYaHhHTy9xWkJPbkVaVlpPbStBMDVMTmFObENLQlVh?=
 =?utf-8?B?ZkxWS0xPNVRoNEJwR2dJWlpzZHlESDVLamJnek9pbUlSSkJmcm03QkZ1OTR2?=
 =?utf-8?B?RlM1Nld3V3FJQlREYjRYa3p0KzhtNGRtcDJMZUNEZERHNlFGelRIVW9zdHYr?=
 =?utf-8?B?UnpuelBtSWZvTzdaSk4rdzRTOXE5eG5ncmhmMGpVWmhwZXc4OVVNSm4wOXNp?=
 =?utf-8?B?K0pNOXYxcDMvb0RKZFI0czE5Y01EUW4xd3lKOVl3ZHVqc3Q4OU5lZkxTa05p?=
 =?utf-8?B?WFA4eFpQazBkRHdxN2M5NVh1aG44L2pxOEdiUE5uNTUvaXRRVXNBNDhROXVR?=
 =?utf-8?B?c1ZQb2xkNjJjTVlUZzYwNXZ2MHR2WS8wUXBtQjhDTTRwMDE3eXJDbXFFcjVm?=
 =?utf-8?B?dXUyT2wydFY3ZGlkd2ZONGpVaXJvc2poeWtmWkR3U3k3LzJobmpBSHVwMDZK?=
 =?utf-8?B?YkhpbnJEV2xLdnBvY1I5NWpFMVRPOCtMYWRwODhiTzFHaG1RckNKU0QzTndK?=
 =?utf-8?B?c0JFMUZmWGNrb3AzRjNFOUgzMVhvU3pXUWtQdUIrejQwYW9sRDFqWmJLQmZT?=
 =?utf-8?B?WjJkUkVhWmU0K3dEWDdjWDF0KzVsVHpORG5Rb1dsNkp0dEdzSXUrZjlLM3N5?=
 =?utf-8?B?bU9BMG1wS1p2YXBLWWFBNWdzbUhjMU5oSDd1aE0wOEVOMVZkUmJWZXNyY3d4?=
 =?utf-8?B?a2pta1QrUHZicXlXSWtZVktqaG9HWjhEcVFlZEdmVXRTZXlBZTRFeDlYeEFx?=
 =?utf-8?B?bVB6UlltR2NnZk5qKzBhNG51WmxqWlloZnhhcENzU2pGcTZVcm91R0MrVWc1?=
 =?utf-8?B?Qnc4anozdXU4TVE1Uk03ZmR6Q2k0VDdtMXM3RmxNS0FuZHU2d1U4T0xVK0p0?=
 =?utf-8?B?M0dobTlsT1JORkZ1UlhWbm4zWHltTmMyNzI5MEpMMUl4K1BBRWFsN1dPNFg4?=
 =?utf-8?B?MmJ1TkdBQ2orV09La0JNYUE3WU85SldGSmlCbkwzMmovejlRZ0J6SlJERVZV?=
 =?utf-8?B?WWk1U2FPMmVUV1NqSWZTMUNPcVoxYzFmZnhTOGxxZTdxbGxOeWNCeGNzaGQr?=
 =?utf-8?B?cy9sNFVEUHdMY0J1NE50RTcwamU0cEFwa3FxazlBTmVCZTUyc1BEVFhLeVZN?=
 =?utf-8?B?SytEVmR5MlM4RFlpa0tNV2JSckhTUW9ZL1lsaXNLNTVDSFhlSWdhazFlSGtk?=
 =?utf-8?B?MTdrdFMxZGxDOXExeGxnTkRiYlhqTlpVOGkzQ05LejJJTTV3eFFERWROUjBH?=
 =?utf-8?Q?lBMSpnKn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <339B9D5523A1BF408080BD1E47DFEC5A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca725ae-58fa-4eb7-c98f-08d8c730b138
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 04:12:01.7532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYZB+GAfy6wj58LmHS//ugW0u/eR6/82q6rMiCsLhBe6vC9RJKsXtEA2gvEw1IieHqvtR8yRI3IN2qKNW4KltA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3206
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

R3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToNCj4NCj4gT24gMi8xLzIxIDIxOjU4LCBUaGluaCBO
Z3V5ZW4gd3JvdGU6DQo+IFsuLl0NCj4NCj4+Pj4gKy8qKg0KPj4+PiArICogZ2V0X3BvcnRfc3Nw
X3JhdGUgLSBNYXRjaCB0aGUgZXh0ZW5kZWQgcG9ydCBzdGF0dXMgdG8gU1NQIHJhdGUNCj4+Pj4g
KyAqIEBoZGV2OiBUaGUgaHViIGRldmljZQ0KPj4+PiArICogQGV4dF9wb3J0c3RhdHVzOiBleHRl
bmRlZCBwb3J0IHN0YXR1cw0KPj4+PiArICoNCj4+Pj4gKyAqIE1hdGNoIHRoZSBleHRlbmRlZCBw
b3J0IHN0YXR1cyBzcGVlZCBpZCB0byB0aGUgU3VwZXJTcGVlZCBQbHVzIHN1Ymxpbmsgc3BlZWQN
Cj4+Pj4gKyAqIGNhcGFiaWxpdHkgYXR0cmlidXRlcy4gQmFzZSBvbiB0aGUgbnVtYmVyIG9mIGNv
bm5lY3RlZCBsYW5lcyBhbmQgc3BlZWQsDQo+Pj4+ICsgKiByZXR1cm4gdGhlIGNvcnJlc3BvbmRp
bmcgZW51bSB1c2Jfc3NwX3JhdGUuDQo+Pj4+ICsgKi8NCj4+Pj4gK3N0YXRpYyBlbnVtIHVzYl9z
c3BfcmF0ZSBnZXRfcG9ydF9zc3BfcmF0ZShzdHJ1Y3QgdXNiX2RldmljZSAqaGRldiwNCj4+Pj4g
KwkJCQkJICAgdTMyIGV4dF9wb3J0c3RhdHVzKQ0KPj4+PiArew0KPj4+PiArCXN0cnVjdCB1c2Jf
c3NwX2NhcF9kZXNjcmlwdG9yICpzc3BfY2FwID0gaGRldi0+Ym9zLT5zc3BfY2FwOw0KPj4+PiAr
CXUzMiBhdHRyOw0KPj4+PiArCXU4IHNwZWVkX2lkOw0KPj4+PiArCXU4IHNzYWM7DQo+Pj4+ICsJ
dTggbGFuZXM7DQo+Pj4+ICsJaW50IGk7DQo+Pj4+ICsNCj4+Pj4gKwlpZiAoIXNzcF9jYXApDQo+
Pj4+ICsJCWdvdG8gb3V0Ow0KPj4+PiArDQo+Pj4+ICsJc3BlZWRfaWQgPSBleHRfcG9ydHN0YXR1
cyAmIFVTQl9FWFRfUE9SVF9TVEFUX1JYX1NQRUVEX0lEOw0KPj4+PiArCWxhbmVzID0gVVNCX0VY
VF9QT1JUX1JYX0xBTkVTKGV4dF9wb3J0c3RhdHVzKSArIDE7DQo+Pj4+ICsNCj4+Pj4gKwlzc2Fj
ID0gbGUzMl90b19jcHUoc3NwX2NhcC0+Ym1BdHRyaWJ1dGVzKSAmDQo+Pj4+ICsJCVVTQl9TU1Bf
U1VCTElOS19TUEVFRF9BVFRSSUJTOw0KPj4+PiArDQo+Pj4+ICsJZm9yIChpID0gMDsgaSA8PSBz
c2FjOyBpKyspIHsNCj4+PiBXaHkgYSBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gY29tcGFyaXNvbiBo
ZXJlPw0KPj4+IFdoeSBub3QganVzdCBhIGxlc3MgdGhhbiBjb21wYXJpc29uIChpIDwgc3NhYykg
Pw0KPj4+DQo+Pj4gVGhhbmtzDQo+Pj4gLS0NCj4+PiBHdXN0YXZvDQo+PiBUaGUgU1NBQyBoZXJl
IG1hdGNoZXMgd2l0aCB0aGUgU1NBQyAoU3VibGluayBTcGVlZCBBdHRyaWJ1dGUgQ291bnQpIGZy
b20NCj4+IHRoZSBVU0IgMy4yIHNwZWMuIEl0J3MgemVybyBiYXNlZC4gRS5nLiBzbyBTU0FDIG9m
IDMgaXMgNCBudW1iZXIgb2YNCj4+IFN1YmxpbmsgU3BlZWQgQXR0cmlidXRlcy4gVGhhdCdzIHdo
eSAiPD0iLg0KPiBJIHNlZSwgd2hhdCdzIHdvcnRoeSBvZiBhdHRlbnRpb24gaXMgdGhhdCBfaV8g
aXMgYmVpbmcgdXNlZCBhcyBhbiBpbmRleA0KPiBmb3IgYm1TdWJsaW5rU3BlZWRBdHRyW10sIGp1
c3QgYSBjb3VwbGUgb2YgbGluZXMgYmVsb3c6DQo+DQo+Pj4+ICsJCXU4IHNzaWQ7DQo+Pj4+ICsN
Cj4+Pj4gKwkJYXR0ciA9IGxlMzJfdG9fY3B1KHNzcF9jYXAtPmJtU3VibGlua1NwZWVkQXR0cltp
XSk7DQo+IAkJCQkJCQleXl4NCj4gCQkJCQkJCWhlcmUNCj4NCj4gYXJlIHdlIHN1cmUgdGhhdCB0
aGlzIGRvZXNuJ3QgY2F1c2UgYW4gb3V0LW9mLWJvdW5kcyByZWFkPw0KPiAJCQkJCQkNCj4gLS0N
Cj4gR3VzdGF2bw0KDQpJdCBjYW4gaWYgdGhlIGh1YiBvdXRwdXQgc29tZSBib2d1cyB2YWx1ZSBm
b3IgU1NBQy4gUGxlYXNlIG5vdGUgdGhhdCBJJ20NCnVzaW5nIHRoZSBzYW1lIGxvZ2ljIGFzIHRo
ZSBwcmV2aW91cyBpbXBsZW1lbnRhdGlvbiBmb3IgcG9ydF9zcGVlZF9pc19zc3AoKS4NCg0KVGhh
bmtzLA0KVGhpbmgNCg0KPg0KPj4+PiArCQlzc2lkID0gRklFTERfR0VUKFVTQl9TU1BfU1VCTElO
S19TUEVFRF9TU0lELCBhdHRyKTsNCj4+Pj4gKwkJaWYgKHNwZWVkX2lkID09IHNzaWQpIHsNCj4+
Pj4gKwkJCXUxNiBtYW50aXNzYTsNCj4+Pj4gKwkJCXU4IGxzZTsNCj4+Pj4gKwkJCXU4IHR5cGU7
DQo+Pj4+ICsNCj4+Pj4gKwkJCS8qDQo+Pj4+ICsJCQkgKiBOb3RlOiBjdXJyZW50bHkgYXN5bW1l
dHJpYyBsYW5lIHR5cGVzIGFyZSBvbmx5DQo+Pj4+ICsJCQkgKiBhcHBsaWNhYmxlIGZvciBTU0lD
IG9wZXJhdGUgaW4gU3VwZXJTcGVlZCBwcm90b2NvbA0KPj4+PiArCQkJICovDQo+Pj4+ICsJCQl0
eXBlID0gRklFTERfR0VUKFVTQl9TU1BfU1VCTElOS19TUEVFRF9TVCwgYXR0cik7DQo+Pj4+ICsJ
CQlpZiAodHlwZSA9PSBVU0JfU1NQX1NVQkxJTktfU1BFRURfU1RfQVNZTV9SWCB8fA0KPj4+PiAr
CQkJICAgIHR5cGUgPT0gVVNCX1NTUF9TVUJMSU5LX1NQRUVEX1NUX0FTWU1fVFgpDQo+Pj4+ICsJ
CQkJZ290byBvdXQ7DQo+Pj4+ICsNCj4+Pj4gKwkJCWlmIChGSUVMRF9HRVQoVVNCX1NTUF9TVUJM
SU5LX1NQRUVEX0xQLCBhdHRyKSAhPQ0KPj4+PiArCQkJICAgIFVTQl9TU1BfU1VCTElOS19TUEVF
RF9MUF9TU1ApDQo+Pj4+ICsJCQkJZ290byBvdXQ7DQo+Pj4+ICsNCj4+Pj4gKwkJCWxzZSA9IEZJ
RUxEX0dFVChVU0JfU1NQX1NVQkxJTktfU1BFRURfTFNFLCBhdHRyKTsNCj4+Pj4gKwkJCW1hbnRp
c3NhID0gRklFTERfR0VUKFVTQl9TU1BfU1VCTElOS19TUEVFRF9MU00sIGF0dHIpOw0KPj4+PiAr
DQo+Pj4+ICsJCQkvKiBDb252ZXJ0IHRvIEdicHMgKi8NCj4+Pj4gKwkJCWZvciAoOyBsc2UgPCBV
U0JfU1NQX1NVQkxJTktfU1BFRURfTFNFX0dCUFM7IGxzZSsrKQ0KPj4+PiArCQkJCW1hbnRpc3Nh
IC89IDEwMDA7DQo+Pj4+ICsNCj4+Pj4gKwkJCWlmIChtYW50aXNzYSA+PSAxMCAmJiBsYW5lcyA9
PSAxKQ0KPj4+PiArCQkJCXJldHVybiBVU0JfU1NQX0dFTl8yeDE7DQo+Pj4+ICsNCj4+Pj4gKwkJ
CWlmIChtYW50aXNzYSA+PSAxMCAmJiBsYW5lcyA9PSAyKQ0KPj4+PiArCQkJCXJldHVybiBVU0Jf
U1NQX0dFTl8yeDI7DQo+Pj4+ICsNCj4+Pj4gKwkJCWlmIChtYW50aXNzYSA+PSA1ICYmIGxhbmVz
ID09IDIpDQo+Pj4+ICsJCQkJcmV0dXJuIFVTQl9TU1BfR0VOXzF4MjsNCj4+Pj4gKw0KPj4+PiAr
CQkJZ290byBvdXQ7DQo+Pj4+ICsJCX0NCj4+Pj4gKwl9DQo+Pj4+ICsNCj4+Pj4gK291dDoNCj4+
Pj4gKwlyZXR1cm4gVVNCX1NTUF9HRU5fVU5LTk9XTjsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiAg
LyoNCj4+Pj4gICAqIFJldHVybiAxIGlmIHBvcnQgc3BlZWQgaXMgU3VwZXJTcGVlZFBsdXMsIDAg
b3RoZXJ3aXNlDQo+Pj4+ICAgKiBjaGVjayBpdCBmcm9tIHRoZSBsaW5rIHByb3RvY29sIGZpZWxk
IG9mIHRoZSBjdXJyZW50IHNwZWVkIElEIGF0dHJpYnV0ZS4NCj4+Pj4gQEAgLTI4NTAsOSArMjky
NiwxMSBAQCBzdGF0aWMgaW50IGh1Yl9wb3J0X3dhaXRfcmVzZXQoc3RydWN0IHVzYl9odWIgKmh1
YiwgaW50IHBvcnQxLA0KPj4+PiAgCQkvKiBleHRlbmRlZCBwb3J0c3RhdHVzIFJ4IGFuZCBUeCBs
YW5lIGNvdW50IGFyZSB6ZXJvIGJhc2VkICovDQo+Pj4+ICAJCXVkZXYtPnJ4X2xhbmVzID0gVVNC
X0VYVF9QT1JUX1JYX0xBTkVTKGV4dF9wb3J0c3RhdHVzKSArIDE7DQo+Pj4+ICAJCXVkZXYtPnR4
X2xhbmVzID0gVVNCX0VYVF9QT1JUX1RYX0xBTkVTKGV4dF9wb3J0c3RhdHVzKSArIDE7DQo+Pj4+
ICsJCXVkZXYtPnNzcF9yYXRlID0gZ2V0X3BvcnRfc3NwX3JhdGUoaHViLT5oZGV2LCBleHRfcG9y
dHN0YXR1cyk7DQo+Pj4+ICAJfSBlbHNlIHsNCj4+Pj4gIAkJdWRldi0+cnhfbGFuZXMgPSAxOw0K
Pj4+PiAgCQl1ZGV2LT50eF9sYW5lcyA9IDE7DQo+Pj4+ICsJCXVkZXYtPnNzcF9yYXRlID0gVVNC
X1NTUF9HRU5fVU5LTk9XTjsNCj4+Pj4gIAl9DQo+Pj4+ICAJaWYgKGh1Yl9pc193dXNiKGh1Yikp
DQo+Pj4+ICAJCXVkZXYtPnNwZWVkID0gVVNCX1NQRUVEX1dJUkVMRVNTOw0KDQo=
