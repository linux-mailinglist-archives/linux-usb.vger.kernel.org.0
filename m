Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC54A22D6E4
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 12:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgGYKvO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 06:51:14 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:36672 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726618AbgGYKvN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 06:51:13 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 15B81401EF;
        Sat, 25 Jul 2020 10:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595674273; bh=HVNxTfgXopWH6ko/eeMOAWR114TqYFk8G/C+DPq24KU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=T4AGiL2a0X67XFhd9SmPHCkFch1QGkAr5gFPNUnssfg64rKd+M9chmJSFsiYcfPej
         907XxEWa0+nsKCWTeA2nrhs5izsER91UaKZEa2yZZITd6tQcLzb0DDr/sUs315koNy
         vq91C0sGylvDl/U8t+W9bnlQmCsZP5fT3MnpD/QnLax0ECWnMwsI3c7Olg7OL4xoy4
         VWP+snPh5o3tdvnQtJA+48mBTVcFIovNU3Cwxp4flRat/DrOKcK1ZDIa2uWYAXubZA
         U7tMUf+Po40mS+FAn/elNE3zj1AzjYs2/BPwyI+FjZpot2/hBKfUd9dxe9sFY6tjAB
         U0pbZUyAGPPkg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7ED35A0071;
        Sat, 25 Jul 2020 10:51:12 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5D935801BF;
        Sat, 25 Jul 2020 10:51:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="fZQ7r4B6";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WR2WuIrucgZhZodvl3OcXt3+tYQmLTLX9djAzR1CV6aJu9zGBClOPE59lvXPSQ0gN6a2jgillzAlWGHIwZFsiqkwSSCmdL/EdVVFjeRCOchxLgW+bVgZG26lQOl0lMkvvvzZ+E+1xu2c3v7ROhs1PYhtWMnyWRCZ4FvIl2Ocjp+oxeAhUELWoDsvHXsIbRqeQQO4odzTB6iRsGK+ebi+/wJr3IDXttYKWn0A0pUb8kUa8rNIKyQSRjGM9P/bRvl4TeT4kMzQfmnioyOEJWAPTPVwr2qea06Uw502gF6YkniRyx7qzRo4NhxdRSsLoacy6hE5/w5nlQm3Op5d4rITxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVNxTfgXopWH6ko/eeMOAWR114TqYFk8G/C+DPq24KU=;
 b=gMFIHpAa71MWy9PyqW6WY2v3aTjk3I9irReVFSuSgrAu7UHOqVRvK7qr3htotGOcJjxmR7w5jgM85QA6VgB60EQIg49fMSeJsTJWQ36KUL+ygvJsrMaBCoohWaZAu5fJMtTcvwrx/9J/Ojp9BBRiFUqUenW/WBpR29IgtQApdAvYnL1F7qjvy+8L8MYQnJn5VvXBmzfsyO5YyEqEHyFtkLk+VAfLDe1CQ1lDpSj8DRQKUS92pHjT7IBwVMKu3N+HudSNHc7mxqcQK64ICB0ex3CtrVBfdR9mt7YxSRdkUrbGNAND9SWQGy/MeFgR5eEp0C96WozYLNnqW74L+oasBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVNxTfgXopWH6ko/eeMOAWR114TqYFk8G/C+DPq24KU=;
 b=fZQ7r4B63uOnIzC1/YLCSjMLrHTyXWn1WMLGfp4AiiCaAr/gKjEz8Q9/fNhXmnhWzGnKaPImfhq37mlh1sX5GdbfN7OorITESY+uZumdd7OTfgyneZ/+cxB/5rWdDtm2u32OmFVzwW1+eEjXEdJs08JrePeJlkZ80gMMo779UD8=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB4164.namprd12.prod.outlook.com (2603:10b6:a03:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Sat, 25 Jul
 2020 10:51:07 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3216.028; Sat, 25 Jul 2020
 10:51:07 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 07/12] usb: common: Add function to get num_lanes and
 transfer rate
Thread-Topic: [PATCH v3 07/12] usb: common: Add function to get num_lanes and
 transfer rate
Thread-Index: AQHWYhOjeRkVZXshpUGFMJg4gOAOx6kYFBSAgAAKwwA=
Date:   Sat, 25 Jul 2020 10:51:07 +0000
Message-ID: <4c6bba0f-71fe-e96b-2be1-8177be2701da@synopsys.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
 <d86ccd4f97469cfe67cbce549b37d4df7cd8cb27.1595631457.git.thinhn@synopsys.com>
 <20200725101235.GA1093846@kroah.com>
In-Reply-To: <20200725101235.GA1093846@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.7.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb7a2371-9c0f-49c5-4d03-08d83088a29c
x-ms-traffictypediagnostic: BY5PR12MB4164:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4164F595A11C07AD5979E468AA740@BY5PR12MB4164.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qN+hBZU7MWQ/S3Ys9UY/zkmYrWONJZFfG6EDsbaEkO2GQZrKTJTdD1+pAHzr+R5S/k70BmACv1MdGP9R37ri5dygsdPrk8zZoZ1e0j0ys7Ke1G9AurUFQwQEjiLACsaX4eO2oiIzy4C+SW0UpC7Fnw/2rv23qvxX5nR1DVs5NDbWP0LTFMWhiOPE51rRTqWYaAX5AnSUGdSJWihPfbWq2udVKSX9AHvl/WfCn26tyHNvnvwXF4Wz5WqEpZu+L9xZjZ6vf+AIJQWY6EcYDpO3wlhoWlG+4lwuwyRtWclEr4z0AcxysarT+Iub4Zaqj+0N9MYTjQOv0gFO2csKwi7KHWGbmq3+u1T0WODn3GYHZMKBei/6vP+PAGkVwv3BzWsRkU/ZRoCwGrqyCWzP06YBTwCfmFvIS+Kk0DNFpPQZczYHDaeUJPX7pbthOV5MQQHqlHVaB9vzRydRRkshFtD92A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(39860400002)(366004)(396003)(376002)(316002)(2616005)(31686004)(66946007)(26005)(76116006)(66556008)(186003)(31696002)(66446008)(86362001)(66476007)(64756008)(36756003)(6486002)(4326008)(8676002)(8936002)(83380400001)(2906002)(71200400001)(6512007)(5660300002)(6506007)(966005)(54906003)(110136005)(478600001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: nDb7E61NhGrajFTNUwVlEGVzbz3taoRg22fVgSIRnbGflQIV2Xwb1Sta5GWRmgYVhNNj4tsRytZg5pYbCQmNbHnu3NlxX3zX14tK6Um4cHt5acnBpdj/OVAkkTa80YsxBrTQv33lqEDJOClrG5TCGpBhK3W09sjtE8v5GgBTPCnWn8AAoKJa3BpVVyANbqTL93uW3eprKEVqoNqR6KfXwD6/QcgIGWaqHzf1YnmVRQDFDg9jkdU2ACqQVnjAMcdI0Ix0+OlseAlTNnD1sYVkwLbLqr2tm8bmmqVzO2acBcd8+78dPxc85BG5dGCPzbU5AIv/D3LqK7Log/DLdCIAiYnGzfSoQ5UQ7YVgYKP7VtkgiXuL39yBsA3R7WI2ypp1co9WKYdqJZG5DXeX5vtmH081tzlF5oKmogIy1YbIqzLTlgXQjUS3495MT6E/ZQ80ZTRGKwIYaD52y7SXUTNApBRPn7TdU18hdERDEXW+LSQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82EC1909A77BC84DB33FD0DA1CF80420@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7a2371-9c0f-49c5-4d03-08d83088a29c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2020 10:51:07.3513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NPYmnNO0YLCTJ3CJp5kgWbk0fzqP6dvh+HqF5CZ/Vb+cPC7GiUrSQ1msEWvLth1Ey5AX1XmWJvc4V2r+J+qhEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4164
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

R3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiBPbiBGcmksIEp1bCAyNCwgMjAyMCBhdCAwNDoz
OToxMVBNIC0wNzAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBBZGQgYSBuZXcgY29tbW9uIGZ1
bmN0aW9uIHRvIHBhcnNlIG1heGltdW1fc3BlZWQgcHJvcGVydHkgc3RyaW5nIGZvcg0KPj4gdGhl
IHNwZWNpZmllZCBudW1iZXIgb2YgbGFuZXMgYW5kIHRyYW5zZmVyIHJhdGUuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogVGhpbmggTmd1eWVuIDx0aGluaG5Ac3lub3BzeXMuY29tPg0KPj4gLS0tDQo+
PiBDaGFuZ2VzIGluIHYzOg0KPj4gLSBBZGQgbmV3IGZ1bmN0aW9uIHRvIHBhcnNlICJtYXhpbXVt
LXNwZWVkIiBmb3IgbGFuZXMgYW5kIHRyYW5zZmVyIHJhdGUNCj4+IC0gUmVtb3ZlIHNlcGFyYXRl
IGZ1bmN0aW9ucyBnZXR0aW5nIG51bV9sYW5lcyBhbmQgdHJhbnNmZXIgcmF0ZSBwcm9wZXJ0aWVz
DQo+IE5vLCB3aHkgaGF2ZSB5b3Ugc3BsaXQgdGhpcyBpbnRvIGEgc2luZ2xlIGZ1bmN0aW9uIHRo
YXQgZm9yIHNvbWUgcmVhc29uDQo+ICJjYW4gbm90IGZhaWwiPw0KDQpUaGlzIHBhdGNoIHdhcyB1
cGRhdGVkIHRvIHJlYWQgZnJvbSBhIHNpbmdsZSBwcm9wZXJ0eSAibWF4aW11bS1zcGVlZCIgdG8g
DQpnZXQgdGhlIGRldmljZSBzcGVlZCwgZ2VuLCBhbmQgbnVtYmVyIG9mIGxhbmVzLiBTbyB3ZSB1
c2UgYSBzaW5nbGUgDQpmdW5jdGlvbiB0byBwYXJzZSB0aGlzIHByb3BlcnR5Lg0KDQpUaGlzIGNh
bWUgdXAgZnJvbSBvbiBSb2IncyBjb21tZW50czoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXVzYi9mNjhmMzk1Yy0wODIxLTllMzQtZjZjZi03NWZhNjBjOWEzNWJAc3lub3BzeXMuY29t
L1QvI21hYzNhNGQwYjFjMDI4NjZlM2JkYmQ2ODA5NTA2ZmJiZWU4YmY4NGMyDQoNCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8wODE4ZTg3Ni1lYTViLTllYmMtNzQyNy04ZTI2YjYy
N2U2YjRAc3lub3BzeXMuY29tL1QvI204NzE5MTMzM2NiMTBhN2YwY2FhZjUzM2JmYTE5ODcyNGQz
M2MyNTE5DQoNCg0KPg0KPj4gQ2hhbmdlcyBpbiB2MjoNCj4+IC0gTmV3IGNvbW1pdA0KPj4NCj4+
ICAgZHJpdmVycy91c2IvY29tbW9uL2NvbW1vbi5jIHwgNDcgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tDQo+PiAgIGluY2x1ZGUvbGludXgvdXNiL2NoOS5oICAg
ICB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDY5
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdXNiL2NvbW1vbi9jb21tb24uYyBiL2RyaXZlcnMvdXNiL2NvbW1vbi9jb21tb24uYw0KPj4g
aW5kZXggMTQzMzI2MGQ5OWI0Li41M2I0OTUwYzQ5ZTQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L3VzYi9jb21tb24vY29tbW9uLmMNCj4+ICsrKyBiL2RyaXZlcnMvdXNiL2NvbW1vbi9jb21tb24u
Yw0KPj4gQEAgLTc3LDE4ICs3Nyw1OSBAQCBjb25zdCBjaGFyICp1c2Jfc3BlZWRfc3RyaW5nKGVu
dW0gdXNiX2RldmljZV9zcGVlZCBzcGVlZCkNCj4+ICAgfQ0KPj4gICBFWFBPUlRfU1lNQk9MX0dQ
TCh1c2Jfc3BlZWRfc3RyaW5nKTsNCj4+ICAgDQo+PiAtZW51bSB1c2JfZGV2aWNlX3NwZWVkIHVz
Yl9nZXRfbWF4aW11bV9zcGVlZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+PiArdm9pZCB1c2JfZ2V0
X21heGltdW1fc3BlZWRfYW5kX251bV9sYW5lcyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+PiArCQkJ
CQkgZW51bSB1c2JfZGV2aWNlX3NwZWVkICpzcGVlZCwNCj4+ICsJCQkJCSBlbnVtIHVzYl9waHlf
Z2VuICpnZW4sDQo+PiArCQkJCQkgdTggKm51bV9sYW5lcykNCj4gV2hhdCBpcyB3cm9uZyB3aXRo
IGp1c3QgaGF2aW5nIG11bHRpcGxlIGRpZmZlcmVudCBmdW5jdGlvbnMgaW5zdGVhZD8NCg0KU2Vl
IG15IGNvbW1lbnQgYWJvdmUuDQoNCg0KPg0KPj4gICB7DQo+PiAgIAljb25zdCBjaGFyICptYXhp
bXVtX3NwZWVkOw0KPj4gKwllbnVtIHVzYl9kZXZpY2Vfc3BlZWQgbWF0Y2hlZF9zcGVlZCA9IFVT
Ql9TUEVFRF9VTktOT1dOOw0KPj4gKwllbnVtIHVzYl9waHlfZ2VuIG1hdGNoZWRfZ2VuID0gVVNC
X1BIWV9HRU5fVU5LTk9XTjsNCj4+ICsJdTggbWF0Y2hlZF9udW1fbGFuZXMgPSAwOw0KPj4gICAJ
aW50IHJldDsNCj4+ICAgDQo+PiAgIAlyZXQgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9zdHJpbmco
ZGV2LCAibWF4aW11bS1zcGVlZCIsICZtYXhpbXVtX3NwZWVkKTsNCj4+ICAgCWlmIChyZXQgPCAw
KQ0KPj4gLQkJcmV0dXJuIFVTQl9TUEVFRF9VTktOT1dOOw0KPj4gKwkJZ290byBkb25lOw0KPj4g
ICANCj4+ICAgCXJldCA9IG1hdGNoX3N0cmluZyhzcGVlZF9uYW1lcywgQVJSQVlfU0laRShzcGVl
ZF9uYW1lcyksIG1heGltdW1fc3BlZWQpOw0KPj4gKwlpZiAocmV0ID49IDApIHsNCj4+ICsJCW1h
dGNoZWRfc3BlZWQgPSByZXQ7DQo+PiArCQlnb3RvIGRvbmU7DQo+PiArCX0NCj4+ICsNCj4+ICsJ
aWYgKHN0cm5jbXAoInN1cGVyLXNwZWVkLXBsdXMtZ2VuMngyIiwgbWF4aW11bV9zcGVlZCwgMjMp
ID09IDApIHsNCj4+ICsJCW1hdGNoZWRfc3BlZWQgPSBVU0JfU1BFRURfU1VQRVJfUExVUzsNCj4+
ICsJCW1hdGNoZWRfZ2VuID0gVVNCX1BIWV9HRU5fMjsNCj4+ICsJCW1hdGNoZWRfbnVtX2xhbmVz
ID0gMjsNCj4+ICsJfSBlbHNlIGlmIChzdHJuY21wKCJzdXBlci1zcGVlZC1wbHVzLWdlbjJ4MSIs
IG1heGltdW1fc3BlZWQsIDIzKSA9PSAwKSB7DQo+PiArCQltYXRjaGVkX3NwZWVkID0gVVNCX1NQ
RUVEX1NVUEVSX1BMVVM7DQo+PiArCQltYXRjaGVkX2dlbiA9IFVTQl9QSFlfR0VOXzI7DQo+PiAr
CQltYXRjaGVkX251bV9sYW5lcyA9IDE7DQo+PiArCX0gZWxzZSBpZiAoc3RybmNtcCgic3VwZXIt
c3BlZWQtcGx1cy1nZW4xeDIiLCBtYXhpbXVtX3NwZWVkLCAyMykgPT0gMCkgew0KPiBXaGVyZSBh
cmUgYWxsIG9mIHRoZXNlIGRldmljZSBwcm9wZXJ0aWVzIGRvY3VtZW50ZWQ/DQoNCkl0J3MgY29t
aW5nIGZyb20gYSBzaW5nbGUgcHJvcGVydHkgIm1heGltdW0tc3BlZWQiLCBkb2N1bWVudGVkIGlu
IHBhdGNoIA0KNi8xMsKgICJ1c2I6IGRldmljZXRyZWU6IEluY2x1ZGUgVVNCIFNTUCBHZW4gWCB4
IFkiDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8zYmM0ZmI2YTBkN2MxYTll
YTRkNWQ5Mzg0YWRlMjZjOTA2NmM4N2QwLjE1OTU2MzE0NTcuZ2l0LnRoaW5obkBzeW5vcHN5cy5j
b20vVC8jdQ0KDQo+DQo+DQo+DQo+PiArCQltYXRjaGVkX3NwZWVkID0gVVNCX1NQRUVEX1NVUEVS
X1BMVVM7DQo+PiArCQltYXRjaGVkX2dlbiA9IFVTQl9QSFlfR0VOXzE7DQo+PiArCQltYXRjaGVk
X251bV9sYW5lcyA9IDI7DQo+PiArCX0NCj4+ICsNCj4+ICtkb25lOg0KPj4gKwlpZiAoc3BlZWQp
DQo+PiArCQkqc3BlZWQgPSBtYXRjaGVkX3NwZWVkOw0KPj4gKw0KPj4gKwlpZiAobnVtX2xhbmVz
KQ0KPj4gKwkJKm51bV9sYW5lcyA9IG1hdGNoZWRfbnVtX2xhbmVzOw0KPj4gKw0KPj4gKwlpZiAo
Z2VuKQ0KPj4gKwkJKmdlbiA9IG1hdGNoZWRfZ2VuOw0KPg0KPg0KPj4gK30NCj4+ICtFWFBPUlRf
U1lNQk9MX0dQTCh1c2JfZ2V0X21heGltdW1fc3BlZWRfYW5kX251bV9sYW5lcyk7DQo+PiArDQo+
PiArZW51bSB1c2JfZGV2aWNlX3NwZWVkIHVzYl9nZXRfbWF4aW11bV9zcGVlZChzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+PiArew0KPj4gKwllbnVtIHVzYl9kZXZpY2Vfc3BlZWQgc3BlZWQ7DQo+PiAg
IA0KPj4gLQlyZXR1cm4gKHJldCA8IDApID8gVVNCX1NQRUVEX1VOS05PV04gOiByZXQ7DQo+PiAr
CXVzYl9nZXRfbWF4aW11bV9zcGVlZF9hbmRfbnVtX2xhbmVzKGRldiwgJnNwZWVkLCBOVUxMLCBO
VUxMKTsNCj4gSGVyZSdzIGFuIGV4YW1wbGUgb2Ygd2h5IHRoaXMgaXNuJ3QgYSBnb29kIGZ1bmN0
aW9uLg0KPg0KPiBJdCBpc24ndCBzZWxmLWRlc2NyaWJpbmcuICBXaHkgZG8geW91IHBhc3MgaW4g
MyBwb2ludGVycyB5ZXQgdGhlIG5hbWUNCj4gb25seSBjb250YWlucyAyIHRoaW5ncz8NCg0KUmln
aHQuLi4gSSBjYW4gcmV2aXNlLg0KDQo+DQo+IHVzYl9nZXRfbWF4aW11bV9zcGVlZF9hbmRfbnVt
X2xhbmVzX2FuZF9nZW5lcmF0aW9uKCkgc2hvd3MgdGhhdCB0aGlzIGlzDQo+IG5vdCBhIGdvb2Qg
dGhpbmcsIHJpZ2h0Pw0KPg0KPiBBZ2FpbiwgMyBkaWZmZXJlbnQgZnVuY3Rpb25zIHBsZWFzZS4N
Cg0KU2hvdWxkIHdlIGhhdmUgMyBzZXBhcmF0ZSBwcm9wZXJ0aWVzIHRvIGRlc2NyaWJlIHRoZSBk
ZXZpY2U/IElmIHNvLCB0aGlzIA0Kd2FzIGRvbmUgaW4gdjIgb2YgdGhpcyBzZXJpZXMsIGJ1dCBS
b2IgaGFzIGRpZmZlcmVudCBpZGVhcy4gUGxlYXNlIGFkdmlzZS4NCg0KPg0KPj4gKwlyZXR1cm4g
c3BlZWQ7DQo+PiAgIH0NCj4+ICAgRVhQT1JUX1NZTUJPTF9HUEwodXNiX2dldF9tYXhpbXVtX3Nw
ZWVkKTsNCj4+ICAgDQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC91c2IvY2g5LmggYi9p
bmNsdWRlL2xpbnV4L3VzYi9jaDkuaA0KPj4gaW5kZXggMDExOTE2NDlhMGFkLi40NmNmZDcyZTcw
ODIgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3VzYi9jaDkuaA0KPj4gKysrIGIvaW5j
bHVkZS9saW51eC91c2IvY2g5LmgNCj4+IEBAIC01Nyw2ICs1NywxMyBAQCBlbnVtIHVzYl9saW5r
X3Byb3RvY29sIHsNCj4+ICAgCVVTQl9MUF9TU1AgPSAxLA0KPj4gICB9Ow0KPj4gICANCj4+ICsv
KiBVU0IgcGh5IHNpZ25hbGluZyByYXRlIGdlbiAqLw0KPj4gK2VudW0gdXNiX3BoeV9nZW4gew0K
Pj4gKwlVU0JfUEhZX0dFTl9VTktOT1dOLA0KPj4gKwlVU0JfUEhZX0dFTl8xLA0KPj4gKwlVU0Jf
UEhZX0dFTl8yLA0KPj4gK307DQo+PiArDQo+PiAgIC8qKg0KPj4gICAgKiBzdHJ1Y3QgdXNiX3N1
Ymxpbmtfc3BlZWQgLSBzdWJsaW5rIHNwZWVkIGF0dHJpYnV0ZQ0KPj4gICAgKiBAaWQ6IHN1Ymxp
bmsgc3BlZWQgYXR0cmlidXRlIElEIChTU0lEKQ0KPj4gQEAgLTk1LDYgKzEwMiwyNCBAQCBleHRl
cm4gY29uc3QgY2hhciAqdXNiX2VwX3R5cGVfc3RyaW5nKGludCBlcF90eXBlKTsNCj4+ICAgICov
DQo+PiAgIGV4dGVybiBjb25zdCBjaGFyICp1c2Jfc3BlZWRfc3RyaW5nKGVudW0gdXNiX2Rldmlj
ZV9zcGVlZCBzcGVlZCk7DQo+PiAgIA0KPj4gKy8qKg0KPj4gKyAqIHVzYl9nZXRfbWF4aW11bV9z
cGVlZF9hbmRfbnVtX2xhbmVzIC0gR2V0IG1heGltdW0gcmVxdWVzdGVkIHNwZWVkIGFuZCBudW1i
ZXINCj4+ICsgKiBvZiBsYW5lcyBmb3IgYSBnaXZlbiBVU0IgY29udHJvbGxlci4NCj4gWW91IGZv
cmdvdCB0aGF0IGl0IGFsc28gZGV0ZXJtaW5lcyB0aGUgImdlbiIuDQoNCk9rLiBXaWxsIGZpeC4N
Cg0KVGhhbmtzIQ0KVGhpbmgNCg0KDQo=
