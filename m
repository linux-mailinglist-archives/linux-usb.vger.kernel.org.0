Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA61936BDB0
	for <lists+linux-usb@lfdr.de>; Tue, 27 Apr 2021 05:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbhD0DTs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 23:19:48 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50930 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231363AbhD0DTp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Apr 2021 23:19:45 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E988BC00D1;
        Tue, 27 Apr 2021 03:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619493542; bh=nbz+Yept/Hho9jf+hcGYtr42STSMGrPPlOH8YOf98eI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=WzuubocB+SUyB641qoOTMp5IqcQsLcgjaKGkMePTCbSDEX+VxijC1kvyMLZivQ+cP
         4Hu4K2rXj3cYX2G2uX8iTbm3jQKvrJwTpdB/aTyEzZIBOIcVr4yeSrhAGpqD/5XF8D
         q3BP0qyNReiTB4NR3PNnhigQd/VEhx1Hu1K1QHWh7fl2vrPAraAvAtUYf4xcsmr+Oe
         pjXxBAu5DYJukvHQ8M8rRAUaQhDIv/HcL+tYO4PoN1zaa9gx8BmQMFRF+074IKh8JK
         KU7FREOo2xpGMu3JZsRmyrz77NaBjvXCwNz5b07RNYmQRHpj5g/DZUYALHjAapDKd6
         qkADE0CukwOaA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 029E0A0096;
        Tue, 27 Apr 2021 03:19:00 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1A6F3400A2;
        Tue, 27 Apr 2021 03:18:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="rhCbI/fM";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MH7tVADZrBFIkrGhzgwTASwygc8LvEh/d2QEAvGBmkSEDA+SGfw4nf7SaSGvUssvfNMycbtare2mIdJgL0q83i7/deH9YoSwVHI1FCC5vGjZXMM54psbY8J9zmpjF2OBn6DBur8/gY2TKXOHzloeKYQYNiqbqUwcc1FkMwfkHSFbKk55JwyjNdMWvRDRXaLq8mHyJEqP0wcffSwQO8Hrq7Kfx2/T2p3NPbhZOXFcteHuvujx2LSqa3B0kB72iLH3SmwdZ74RSvVCVXtcLfzKybIsf+rHD7U/jbJbPh/O88Z2RAFAAoq+lSXykfJAFf/WJm1dkCTbWD38H18/u1gHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbz+Yept/Hho9jf+hcGYtr42STSMGrPPlOH8YOf98eI=;
 b=PyCLCeKiFuZk+U1SMuX8oCKEEoyK+eDcqQt7/rBnk/w5BKAWqvZkX//eoXaXbVwuZ1AS1y0IDHzWNYxIVNixwg1Ai/+eos8Y+S7DSVZ5k1XFt0DxpuftcqOoO7FKjnptGy289SZCu/9SQY47uZAvWPyKx0Z7RgvV3wy9KTPM6xDkPnS3Tfb5zIg20D8hLigOtWkF4DNVraWJex+PhViVqiHz0hjYITC2+IdUFRQFgLUOeFd/1hwQwv9tTMBvIvMmY4iZs4482Pa5+2Lw7gVSuuIUjt5a3u5TmXPs0+6HQzJ08xi1HL3RcsN0NFh360XKIQGIVasOtCkPA1H/jQeSyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbz+Yept/Hho9jf+hcGYtr42STSMGrPPlOH8YOf98eI=;
 b=rhCbI/fMZjHgANajQZ8S91jaOdzhQaZgr25MaXk5U0p+CLzHvbbO97cha24EnD2LIQ8o6+hngzwnrgdWG5KvwLUZ48/K/7fkHZW6Q54ro2XySO8gGcr++BYVhpuzl9Gq9LuD1o04e5R3G+Svshx7wPXVKUfR6FqJ64Q+xQNMYiU=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4643.namprd12.prod.outlook.com (2603:10b6:a03:1ff::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.26; Tue, 27 Apr
 2021 03:18:57 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 03:18:57 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Michael Grzeschik <mgr@pengutronix.de>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Thread-Topic: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Thread-Index: AQHXNu+9eF7qglWLLkOrzqiL1Cef+6rAXlSAgACdCQCAAKd/AIAARdUAgAANY4CAACI/gIABPhqAgAAPfgCAAEv0gIAAY/OAgAOkbIA=
Date:   Tue, 27 Apr 2021 03:18:57 +0000
Message-ID: <50e13b71-bdc1-6279-a224-bfc99cf10dc8@synopsys.com>
References: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
 <20210421204837.4185-3-m.grzeschik@pengutronix.de>
 <87o8e6mvue.fsf@kernel.org> <20210422201812.GC6975@pengutronix.de>
 <871rb1msmx.fsf@kernel.org> <20210423102738.GD6975@pengutronix.de>
 <87y2d9l0a2.fsf@kernel.org> <20210423131807.GE6975@pengutronix.de>
 <87k0osksgo.fsf@kernel.org> <20210424091206.GF6975@pengutronix.de>
 <87eeezlrvm.fsf@kernel.org>
 <68ae9066-b349-ba70-59c6-c2388b386b66@synopsys.com>
In-Reply-To: <68ae9066-b349-ba70-59c6-c2388b386b66@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec353d8b-da20-4d7a-90f4-08d9092b3211
x-ms-traffictypediagnostic: BY5PR12MB4643:
x-microsoft-antispam-prvs: <BY5PR12MB46437FB3ACC85C0664248EE3AA419@BY5PR12MB4643.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hkF+X+ltsY7yvLCOufRMbKdndUmVtunTSwuIUcL1Tg0YioR6hAZ23LyfXv/Efac1rpGGf8GshSDB1SV3tZO9kRoQlGZn25hjiw0GpJM5x9yRV2QyXnkRkVXGrrFkwEBvYQIHJe+sW0Ojjm+nR4PNHHcCyadjIuV9/2Mk1YQbfFA+qxVmU2J1usxrGhrFLBbMSllTyfxkqfMXzjeLBUHvmV/Y4V2w+FpWxeoXAcWi/RadeL//9lers6id30dTuet0gNQN44WeOt3s76JSc7f4EYv8L9YRXUyqKZBPd0qFQmmEyWSKpndwJTy4eQJZvtp9ePf+1Cjnj0njMD63cWb8G0XeOOMCsFD++sGvRCqfGAX7lkEt514nzuuH7q80iiTYimXYSWvbd7exgNIy7s6U9sXrw9FBNDtIZhFNUH3iijfv4Y+3y+uTsHhAx0Ma0BKDpZPurTYjFELzvX0Z94BjQWGheT7AWmwyJgqctQ7JQCe2Tgz8DymGgSa90db9yp3KaioS3Zqq5UvrbPJRMvHSfG2nTQxFNZ2ib+y9e8O3XyGDDrLGKViMndqcWBEi89QUcLfabeaxILM3zNJzYv6zLIVB+VKwCMsKBCBfFb6EQqL1LZL7VTQ+UxV6nRtBEfLyqBQ14PvWvuJPL8UcZ5nJZmC6HCXX7Takp4pTutehnw7VYSm87nEbhbuEm/g3ujOJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(396003)(39860400002)(376002)(136003)(71200400001)(31686004)(64756008)(83380400001)(54906003)(86362001)(478600001)(8676002)(76116006)(2906002)(31696002)(122000001)(6486002)(38100700002)(26005)(66476007)(66446008)(8936002)(2616005)(5660300002)(186003)(36756003)(66556008)(66946007)(6506007)(6512007)(110136005)(316002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TzJTS1EzWVlWa29wR3R5T2VndlZqMDRoWmk1bk1qUzNBMk9FYURaY1l5MDc5?=
 =?utf-8?B?RXZGU2h1dTdLUXJWWXJSbzFwLzZwSEI2RlQzTWxFeWhTaE5FNEc2eWZYWTIy?=
 =?utf-8?B?aVBpN3BLbFdOeTFHOWVLWFZ6VSt0TzJWYi9HL1ZWZ0VWRWxmK0MwL0EyVkpl?=
 =?utf-8?B?bEd0U1VyZHM4UHAyN0RYTkI3MGhXQXFweG1kNTloR1RpUFdNUGpWSUU4Wkl5?=
 =?utf-8?B?QzRUbHM4bkxqdDJvbS9CUUJhaVF6eEU1azUwVEIydjZIb3UrWHIyOHpBNjJB?=
 =?utf-8?B?bXhQWXB0V3d1d1F3UVhmd2s5aksvNDkrNHNpczBoOXRWaDd1eDYvanp4TE1K?=
 =?utf-8?B?OFZzVnZ4bnVSTTZPUjFYZXlkSTFRbEdNOUt4S1M1bmNVOWpmTFhXS0g5TjFK?=
 =?utf-8?B?VDg1MG04dEdLaGh5bGl3NHBHSHdoR1FRRmtuS0l1a2ZoS0daekt6V0tZTzBN?=
 =?utf-8?B?R0Y0dzZxa0t3YncxRllwRWdFN1hDY3NFWjVBRUtHVEhmajU4ekZjOEZxV3d5?=
 =?utf-8?B?Rjd6TDFGcVI3ekxWSGpqK0tvM0pVUWwwa0l3NXhmRkk5V0VBSE1ZTzJFOWxh?=
 =?utf-8?B?cWdRWmhrSGYwZUQzWU5aL1U0Y09IcUsyM0lqaHBzWWZGQ3FQS2tLYjRpRlpY?=
 =?utf-8?B?eFhaUUxGa0ZOaDczcnRHWjA0Qll1dnNRRlpZQUtJK1Y1YXZ0Q1M2RHpWYURE?=
 =?utf-8?B?Ky9BWDBvVTZSYmdIdXhMSmNtUEhlZmVvUmJ6Y0hsUklISjg5Qnc1OGcrNDc1?=
 =?utf-8?B?a1BMOFNtTGJVY2NxdHlpcjVIRFV0bXRZT2hmc1ZWTmVCZXBxTHM1bzNmNFpn?=
 =?utf-8?B?eVZpYmR2ZWRtRE5iY3luTGpWaXFaZTRSb2RheVlEbUhGeDR4SnZMQldPRWFy?=
 =?utf-8?B?aHQ1VFVWelR0Uks0SjNoSUp3a21IcEsyakJoMkpxTUFIc2Z0elh2Qld0ejdE?=
 =?utf-8?B?T0o1Z1dDRzFtT2NRTXJMcXA2QXJXSndkbTl1RDdlQmtRU3huK2t3UkZocVZk?=
 =?utf-8?B?NmE4dm8xZzQyN3VLMVhGTURURGg5RHVXTllUeXMrd21Ddkg1RG9kWnBFamZj?=
 =?utf-8?B?dEF4Sit5SXp6TWRnTldneEE5NkVOK2dyQUZzcnZBSlVvWHA0NTVwQWw0QmY3?=
 =?utf-8?B?YzA1OHZPODJTekw1MFNqWXRYaHl1NzljSm5OcEhBT01hSUVwODBjdXEramF5?=
 =?utf-8?B?dFdLK01OL2tlbzhILytxbWdsU3VzZ3FPVzNLUkQxR0tsb3NuN1dTUHVEckt4?=
 =?utf-8?B?TXJlaDVVS0NJVkxHSXo3dEY2Z0VlUVJya0dvSkNkN3NQcm9rVks5MU5QNUtW?=
 =?utf-8?B?eFZLd01QQ29RZWM4NjN6QllQWUZxVXRDWVh2OXRWTmJpU21UQ2w3MEM3emZ1?=
 =?utf-8?B?OWorUGlsUzBnN1d4anRuT2cwUTR6UmhSRzFYSHJxTit5MXJXQjRkMDlTdXly?=
 =?utf-8?B?RVZVMzhmYzVZMndIWkUyMDhuU3htRFIzcW1NV1Nha3FQcjZoL3NFVC9ZZUQw?=
 =?utf-8?B?YWk1b0FBMWpSRUhSYkVYYkNvWi9nQkRvUXRuZ0VhVVNrTGM3cW5sMUx2cDV2?=
 =?utf-8?B?YWZmeFZLZ3krc0d3VnRjNjhvU090R1VRVVR0WFlxeGIvT0hEelhXOURzZE9x?=
 =?utf-8?B?WFE2a1lBYXlmZWhHNnU2UEJsRXdsWXZ6Znd6cWlyOWFlUHJPS015RjdzM2tn?=
 =?utf-8?B?UjVwYWQvYXZEdlMycEU4Zk1Ca3BxUDhyNVlXWlk0ei9SNWFFZld1Y01FQUZH?=
 =?utf-8?Q?mr/SjborRs3riks4ZYw8ksgyOrThCxE4vUiUi5w?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B08385EBD189B44288136E261C8A98C7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec353d8b-da20-4d7a-90f4-08d9092b3211
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 03:18:57.7271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PL3QxKXYZ0HXPREcT5Vimv25BJ9nxF2SkffXKvo8kYqzAYoc8LlbN2XI7Skb3sQYl8zVF/04aT06emBHJZE+Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4643
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWljaGFlbCwNCg0KVGhpbmggTmd1eWVuIHdyb3RlOg0KPiBGZWxpcGUgQmFsYmkgd3JvdGU6
DQo+Pg0KPj4gSEksDQo+Pg0KPj4gTWljaGFlbCBHcnplc2NoaWsgPG1nckBwZW5ndXRyb25peC5k
ZT4gd3JpdGVzOg0KPj4NCj4+IDxiaWcgc25pcD4NCj4+DQoNCg0KPGJpZ2dlciBzbmlwPg0KDQoN
Cj4gSSB0aGluayBJIHNlZSB0aGUgaXNzdWUgdGhhdCBNaWNoYWVsIHJlcG9ydGVkLg0KPiANCj4g
VGhlIHByb2JsZW0gaXMgdGhhdCB3ZSdyZSB1c2luZyBudW1fcGVuZGluZ19zZ3MgdG8gdHJhY2sg
Ym90aCBwZW5kaW5nIFNHDQo+IGVudHJpZXMgYW5kIHF1ZXVlZCBTRyBlbnRyaWVzLiBudW1fcGVu
ZGluZ19zZ3MgZG9lc24ndCBnZXQgdXBkYXRlZCB1bnRpbA0KPiBUUkIgY29tcGxldGlvbiBpbnRl
cnJ1cHQgKGllIFhmZXJJblByb2dyZXNzKS4gQmVmb3JlIHRoZSBkcml2ZXIgcXVldWVzDQo+IG1v
cmUgU0cgcmVxdWVzdHMsIGl0IHdpbGwgY2hlY2sgaWYgdGhlcmUncyBhbnkgcGVuZGluZyBTRyBp
biB0aGUgc3RhcnRlZA0KPiByZXF1ZXN0IGxpc3QgYmVmb3JlIGl0IHByZXBhcmVzIG1vcmUuIFNp
bmNlIHRoZSBudW1fcGVuZGluZ19zZ3MgZG9lc24ndA0KPiBnZXQgdXBkYXRlZCB1bnRpbCB0aGUg
cmVxdWVzdCBpcyBjb21wbGV0ZWQsIHRoZSBkcml2ZXIgZG9lc24ndCBwcm9jZXNzDQo+IG1vcmUg
dW50aWwgdGhlIHJlcXVlc3QgaXMgY29tcGxldGVkLg0KPiANCj4gSSBuZWVkIHRvIHJldmlldyBt
b3JlIG9uIE1pY2hhZWwncyBwYXRjaGVzIG5leHQgd2VlaywgYnV0IEkgdGhpbmsgd2hhdA0KPiBo
ZSBzdWdnZXN0ZWQgbWFrZXMgc2Vuc2UgKGluIHRlcm0gb2YgcHJvcGVybHkgdXNhZ2Ugb2YgcXVl
dWVkIHNncyB2cw0KPiBwZW5kaW5nIHNncykuIEJUVywgcGxlYXNlIGNvcnJlY3QgbWUgaWYgSSdt
IHdyb25nLCBidXQgd2UgZG8gbW9kaWZ5DQo+IG51bV9xdWV1ZWRfc2dzLg0KPiANCg0KVGhlcmUn
cyBzdGlsbCBzb21lIGlzc3VlIHdpdGggeW91ciBwYXRjaC4gSSB0aGluayB0aGlzIHNob3VsZCBj
b3ZlciBpdC4NCkxldCBtZSBrbm93IGlmIGl0IHdvcmtzIGZvciB5b3UuDQoNCk5vdGU6IHRoaXMg
aG93ZXZlciBwcm9iYWJseSBuZWVkcyBtb3JlICJUZXN0ZWQtYnkiIGFuZCByZXZpZXdzDQp0byBt
YWtlIHN1cmUgSSdtIG5vdCBtaXNzaW5nIGFueXRoaW5nLiBJIG9ubHkgcmFuIHNvbWUgYmFzaWMg
dGVzdHMsDQphbmQgd2lsbCBuZWVkIHRvIHJ1biBtb3JlLg0KDQpMZXQgbWUga25vdyBpZiB0aGlz
IG1ha2VzIHNlbnNlLg0KDQpCUiwNClRoaW5oDQoNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQppbmRleCBkZDgwZTVj
YThjNzguLjA0MGNjNjdiMzM2MSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0
LmMNCisrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCkBAIC0xMjQ0LDYgKzEyNDQsNyBA
QCBzdGF0aWMgaW50IGR3YzNfcHJlcGFyZV90cmJzX3NnKHN0cnVjdCBkd2MzX2VwICpkZXAsDQog
ICAgICAgICAgICAgICAgICAgICAgICByZXEtPnN0YXJ0X3NnID0gc2dfbmV4dChzKTsNCiANCiAg
ICAgICAgICAgICAgICByZXEtPm51bV9xdWV1ZWRfc2dzKys7DQorICAgICAgICAgICAgICAgcmVx
LT5udW1fcGVuZGluZ19zZ3MtLTsNCiANCiAgICAgICAgICAgICAgICAvKg0KICAgICAgICAgICAg
ICAgICAqIFRoZSBudW1iZXIgb2YgcGVuZGluZyBTRyBlbnRyaWVzIG1heSBub3QgY29ycmVzcG9u
ZCB0byB0aGUNCkBAIC0xMjUxLDcgKzEyNTIsNyBAQCBzdGF0aWMgaW50IGR3YzNfcHJlcGFyZV90
cmJzX3NnKHN0cnVjdCBkd2MzX2VwICpkZXAsDQogICAgICAgICAgICAgICAgICogZG9uJ3QgaW5j
bHVkZSB1bnVzZWQgU0cgZW50cmllcy4NCiAgICAgICAgICAgICAgICAgKi8NCiAgICAgICAgICAg
ICAgICBpZiAobGVuZ3RoID09IDApIHsNCi0gICAgICAgICAgICAgICAgICAgICAgIHJlcS0+bnVt
X3BlbmRpbmdfc2dzIC09IHJlcS0+cmVxdWVzdC5udW1fbWFwcGVkX3NncyAtIHJlcS0+bnVtX3F1
ZXVlZF9zZ3M7DQorICAgICAgICAgICAgICAgICAgICAgICByZXEtPm51bV9wZW5kaW5nX3NncyA9
IDA7DQogICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCiAgICAgICAgICAgICAgICB9DQog
DQpAQCAtMjg2NywxNSArMjg2OCwxNSBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X2VwX3JlY2xh
aW1fdHJiX3NnKHN0cnVjdCBkd2MzX2VwICpkZXAsDQogICAgICAgIHN0cnVjdCBkd2MzX3RyYiAq
dHJiID0gJmRlcC0+dHJiX3Bvb2xbZGVwLT50cmJfZGVxdWV1ZV07DQogICAgICAgIHN0cnVjdCBz
Y2F0dGVybGlzdCAqc2cgPSByZXEtPnNnOw0KICAgICAgICBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnM7
DQotICAgICAgIHVuc2lnbmVkIGludCBwZW5kaW5nID0gcmVxLT5udW1fcGVuZGluZ19zZ3M7DQor
ICAgICAgIHVuc2lnbmVkIGludCBudW1fcXVldWVkID0gcmVxLT5udW1fcXVldWVkX3NnczsNCiAg
ICAgICAgdW5zaWduZWQgaW50IGk7DQogICAgICAgIGludCByZXQgPSAwOw0KIA0KLSAgICAgICBm
b3JfZWFjaF9zZyhzZywgcywgcGVuZGluZywgaSkgew0KKyAgICAgICBmb3JfZWFjaF9zZyhzZywg
cywgbnVtX3F1ZXVlZCwgaSkgew0KICAgICAgICAgICAgICAgIHRyYiA9ICZkZXAtPnRyYl9wb29s
W2RlcC0+dHJiX2RlcXVldWVdOw0KIA0KICAgICAgICAgICAgICAgIHJlcS0+c2cgPSBzZ19uZXh0
KHMpOw0KLSAgICAgICAgICAgICAgIHJlcS0+bnVtX3BlbmRpbmdfc2dzLS07DQorICAgICAgICAg
ICAgICAgcmVxLT5udW1fcXVldWVkX3Nncy0tOw0KIA0KICAgICAgICAgICAgICAgIHJldCA9IGR3
YzNfZ2FkZ2V0X2VwX3JlY2xhaW1fY29tcGxldGVkX3RyYihkZXAsIHJlcSwNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdHJiLCBldmVudCwgc3RhdHVzLCB0cnVlKTsNCkBAIC0yODk4
LDcgKzI4OTksNyBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X2VwX3JlY2xhaW1fdHJiX2xpbmVh
cihzdHJ1Y3QgZHdjM19lcCAqZGVwLA0KIA0KIHN0YXRpYyBib29sIGR3YzNfZ2FkZ2V0X2VwX3Jl
cXVlc3RfY29tcGxldGVkKHN0cnVjdCBkd2MzX3JlcXVlc3QgKnJlcSkNCiB7DQotICAgICAgIHJl
dHVybiByZXEtPm51bV9wZW5kaW5nX3NncyA9PSAwOw0KKyAgICAgICByZXR1cm4gcmVxLT5udW1f
cGVuZGluZ19zZ3MgPT0gMCAmJiByZXEtPm51bV9xdWV1ZWRfc2dzID09IDA7DQogfQ0KIA0KIHN0
YXRpYyBpbnQgZHdjM19nYWRnZXRfZXBfY2xlYW51cF9jb21wbGV0ZWRfcmVxdWVzdChzdHJ1Y3Qg
ZHdjM19lcCAqZGVwLA0KQEAgLTI5MDcsNyArMjkwOCw3IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRn
ZXRfZXBfY2xlYW51cF9jb21wbGV0ZWRfcmVxdWVzdChzdHJ1Y3QgZHdjM19lcCAqZGVwLA0KIHsN
CiAgICAgICAgaW50IHJldDsNCiANCi0gICAgICAgaWYgKHJlcS0+bnVtX3BlbmRpbmdfc2dzKQ0K
KyAgICAgICBpZiAocmVxLT5yZXF1ZXN0Lm51bV9tYXBwZWRfc2dzKQ0KICAgICAgICAgICAgICAg
IHJldCA9IGR3YzNfZ2FkZ2V0X2VwX3JlY2xhaW1fdHJiX3NnKGRlcCwgcmVxLCBldmVudCwNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzKTsNCiAgICAgICAgZWxzZQ0K
