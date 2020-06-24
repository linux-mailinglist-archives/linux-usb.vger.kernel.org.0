Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAA7207C56
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jun 2020 21:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391324AbgFXTnv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jun 2020 15:43:51 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:52818 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391221AbgFXTnu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Jun 2020 15:43:50 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7C5F540107;
        Wed, 24 Jun 2020 19:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1593027829; bh=oSPahZVBUdK6cVbL7Fty2lHPJMriEDbkhK6C0vzgVfM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=jL2Xc601rf1QAx7Flc9JxyAHcY6Z/6fOHQPu0jma2dg73dajhUwzViEdMHnqgR47h
         T9z+LGZEihIhb5JUx6Klyz5dKHaxNCO3dmZVAEUK++WMc7YSGOxCJjcU+UHLtaVCLV
         oqrDtCZJtngRs2+rIw3SPcn6NprWyoWNYIblEtJET3tnWMx2wgz9ejXyJvkakTF7Sd
         BZmGEh0Q7R1b0J3HS0v/bm+NAsHlvwfwl+Go5Udyp5r/BYXcUP4HaFdKbxcOWAJOZU
         HC87gx/qZo0RgzJGEqT5/kVpwN8rW86+MFvun3CShitzmh0zczD4V19JWYcK32nvpI
         e6DdZE2QIiYFg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id B5521A0080;
        Wed, 24 Jun 2020 19:43:47 +0000 (UTC)
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2059.outbound.protection.outlook.com [104.47.37.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2E284800CA;
        Wed, 24 Jun 2020 19:43:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="AI8lcY0n";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSle4Bu6QY476cJsiudU9T3GcotI9oMP9kh8pI9v4jTm1EXtVWihJQrNox/QiR851UHoRET3XYw1+5S04FuX0+QmwohI+9ReGhQhO1+Uru8ykvQwqiOrlOC9v4sJVG6P5PktZyQdsqTRIkGp9c8NaCpqCMyhOlgXpNEPWaCswT2E7wM5rThESRyD+Qy7MeR4kZaAaZRyz2VfSQy5Vl8H/YDjXASIeYAgPco6jsOUlGOsGyOSh5ybdQu/7Z220TQ1symmz3KHy5dRLDT7W2oyQh5bn5PvLZWxPojlAJ6ZuT1KoVdWXzg/m2J7etBeAa4j+y8/MmvJKoCUtAI+0S1QQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSPahZVBUdK6cVbL7Fty2lHPJMriEDbkhK6C0vzgVfM=;
 b=STmaP8rrdEc/X9Jrg/KOM/tzsh3GtOgNY+m9jP3/FcOuRF6gWdft0NFnEbFrHbt7vNaRdYrYiX8dwEpXDr9NkjQV64GHh0Op0KyFUOkIe5Iqocj78E2kRS7+aEONkD1ErTC8B+d6JlIFDdgGN+OQG9f53Zh5B/hjZ1J+ew+lvBNiKSTBJhiP6GxL2Hr8Y3yHctojj5UPRuN7IP2mQLieF9cZRunPgt4yTrDeB2MMxAL1PxSikVnWAVwez54y6A+Saai4M4m+qa4KFyG/MiUQ3toqsyWtVI9GiDfnUOXYT53lYX0QWLljddjg+R5OA1k7BaK7Z7x1TAp9jNWGQ6ii0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSPahZVBUdK6cVbL7Fty2lHPJMriEDbkhK6C0vzgVfM=;
 b=AI8lcY0n1U4pS8m0H1WTfUD3EreTzm5KkIqVbfLUmnq3RruO0HX//+GMKxCsmuh67OpV+jBbu/tiaGvUnbsZVJh1LiKjQvLSwHfcMBCJdFfdkCrZj4z6QQlZR1TVafC5jQkDRvYJUXxSq27hxLUwk6FZJ/8atQX5MwdDQ2d70+c=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3464.namprd12.prod.outlook.com (2603:10b6:a03:d9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 19:43:44 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 19:43:44 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] usb: dwc3: gadget: when the started list is empty
 stop the active xfer
Thread-Topic: [PATCH v2 2/2] usb: dwc3: gadget: when the started list is empty
 stop the active xfer
Thread-Index: AQHWSjaj7K1Gp+npaE+NDqNrQxvXHKjoKxuA
Date:   Wed, 24 Jun 2020 19:43:44 +0000
Message-ID: <da8703b4-035d-ba47-e8a5-5c4dd5005b45@synopsys.com>
References: <20200624144907.9604-1-m.grzeschik@pengutronix.de>
 <20200624144907.9604-3-m.grzeschik@pengutronix.de>
In-Reply-To: <20200624144907.9604-3-m.grzeschik@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.7.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d84cd77-b78a-4102-00e9-08d81876e790
x-ms-traffictypediagnostic: BYAPR12MB3464:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3464D98890C101F5FB066B6EAA950@BYAPR12MB3464.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AYrhWoury0+krLDdNshxMUSRWLn+M+XZnteslJZEGj5uUtGeV3czbNAkY58qYTg8oUZVpRz6igQF7umCjyiDeAS+ITkpTnrdpSZvmE/oV1aPdn1mwJBRuJB6kE3rdw95e9daqUhS6xfUqYjpDEzke3E56DdAUxM3nh9KIZOwGmr1OpCT63GPJFucj3JFrtGP0S5Ih8zoqBdp3l4J5DYdLaXlNGMT8JzOXZCEBWNZxmuSph9h+0NkCyyXNrqJKAjfQwb7xFhoEC9pZVF4HvMh0i5jFGukTto+lymrSfk2B3Nv3vwas2rr6D1Fm9oVYkA9ygkk8wZ+Pznhe6jPeOlY/h/OkDb7RJgeKogc6WQLpPx+DPi4BPznpSZjD6paC5lb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(396003)(346002)(39860400002)(376002)(8936002)(54906003)(186003)(86362001)(64756008)(66446008)(4326008)(110136005)(478600001)(66556008)(76116006)(66946007)(5660300002)(66476007)(6506007)(31696002)(36756003)(83380400001)(6512007)(71200400001)(26005)(31686004)(316002)(2906002)(8676002)(2616005)(6486002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: mJX3/1am9Cnpg5FxbZDp/CsVNiehBBdNuraNvQpZw0cCV/hm4nQPVOBkXEN6irYSyFzy6Bcyw9c2XYpZGWwMc2MwtA1lwn9vu+ddem28CG1KxxW9IMOd+jgAZz0LkQvb4l9yOfHUKQ8k8t9yRoupTwrJ/I6D4KnWq5i/M+EJJSaFAcViA6E8RhBKa4rLYZmw8YReuh+tCmOnKMQqC0EdoQkTr8LYKqDrhabNUZHLmcqSrYcijGKYpM05qwKUwTzKzP4Tmv41nPktler5/FpJ9nO+SRN6ooQnbnvYFc90ZN7PHTKKa1LHMi3g9slIDCt6/mdG16sIqeX3HbfaaNULVE4vT+XqZu9oFRcB+6ZigpJWpNI88/zIYhaGog8aeSAHF1Xvc9pP0MoZwjvBPB8eb8/d359mV19szLyS8Yai9Q2PYwMqqa+lF2SlLMHEk798aUUwBPl821b+IEK4qZzMkEdJomoblrmBTmj0h2drBf0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <28BB7ADEB3F60C45847ECE32A15592D7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d84cd77-b78a-4102-00e9-08d81876e790
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 19:43:44.2077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ieOeNRs/DBX0o4COvJI7u7kG2W2BVB/EPFlwte4bqn3AhjAr60N1TRUPlvuQ+KpVjMgd10H0WoQQsf7UwsftVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3464
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiBXaGVuIHdlIGhhdmUgbm90aGluZyBs
ZWZ0IHRvIGJlIHF1ZXVlZCBhZnRlciBoYW5kbGluZyB0aGUgbGFzdCB0cmINCj4gd2UgaGF2ZSB0
byBzdG9wIHRoZSBjdXJyZW50IHRyYW5zZmVyLiBUaGlzIHdheSB3ZSBjYW4gZW5zdXJlIHRoYXQN
Cj4gdGhlIG5leHQgcmVxdWVzdCB3aWxsIGJlIHF1ZXVlZCB3aXRoIGFuIG5ldyBhbmQgdmFsaWQg
dGltZXN0YW1wDQo+IGFuZCB3aWxsIG5vdCBkaXJlY3RseSBydW4gaW50byBhbiBtaXNzZWQgeGZl
ci4NCj4NCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBHcnplc2NoaWsgPG0uZ3J6ZXNjaGlrQHBl
bmd1dHJvbml4LmRlPg0KPg0KPiAtLS0NCj4gdjEgLT4gdjI6IC0gVGhpcyBQYXRjaCByZXBsYWNl
cyB0aGUgZm9sbG93aW5nIHBhdGNoIGJ5IE1pY2hhZWwgT2xicmljaDoNCj4gICAgICAgICAgICAg
IHVzYjogZHdjMzogZ2FkZ2V0OiByZXN0YXJ0IHRoZSB0cmFuc2ZlciBpZiBhIGlzb2MgcmVxdWVz
dCBpcyBxdWV1ZWQgdG9vIGxhdGUNCj4NCj4gICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwg
NSArKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJz
L3VzYi9kd2MzL2dhZGdldC5jDQo+IGluZGV4IDA5NjJkZGQ3ZmJmNmFlNi4uYjJiOGI5MTFhYzc5
YjM5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsrKyBiL2Ry
aXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gQEAgLTI3MjksNyArMjcyOSwxMCBAQCBzdGF0aWMg
Ym9vbCBkd2MzX2dhZGdldF9lbmRwb2ludF90cmJzX2NvbXBsZXRlKHN0cnVjdCBkd2MzX2VwICpk
ZXAsDQo+ICAgCWlmIChkZXAtPmZsYWdzICYgRFdDM19FUF9FTkRfVFJBTlNGRVJfUEVORElORykN
Cj4gICAJCWdvdG8gb3V0Ow0KPiAgIA0KPiAtCWlmIChzdGF0dXMgPT0gLUVYREVWICYmIGxpc3Rf
ZW1wdHkoJmRlcC0+c3RhcnRlZF9saXN0KSkNCj4gKwlpZiAoKHN0YXR1cyA9PSAtRVhERVYgJiYg
bGlzdF9lbXB0eSgmZGVwLT5zdGFydGVkX2xpc3QpKSB8fA0KPiArCQkodXNiX2VuZHBvaW50X3hm
ZXJfaXNvYyhkZXAtPmVuZHBvaW50LmRlc2MpICYmDQo+ICsJCQlsaXN0X2VtcHR5KCZkZXAtPnN0
YXJ0ZWRfbGlzdCkgJiYNCj4gKwkJCWxpc3RfZW1wdHkoJmRlcC0+cGVuZGluZ19saXN0KSkpDQoN
ClRoZSAtRVhERVYgY2hlY2sgaXMgYWxzbyBmb3IgaXNvYywgbWF5YmUgcmVhcnJhbmdlIHRoaXMg
Zm9yIGVhc2llciByZWFkOg0KaWYgKHVzYl9lbmRwb2ludF94ZmVyX2lzb2MoZGVwLT5lbmRwb2lu
dC5kZXNjKSAmJg0KIMKgwqDCoCBsaXN0X2VtcHR5KCZkZXAtPnN0YXJ0ZWRfbGlzdCkgJiYNCiDC
oMKgwqAgKGxpc3RfZW1wdHkoJmRlcC0+cGVuZGluZ19saXN0KSB8fCBzdGF0dXMgPT0gLUVYREVW
KSkNCg0KPiAgIAkJZHdjM19zdG9wX2FjdGl2ZV90cmFuc2ZlcihkZXAsIHRydWUsIHRydWUpOw0K
PiAgIAllbHNlIGlmIChkd2MzX2dhZGdldF9lcF9zaG91bGRfY29udGludWUoZGVwKSkNCj4gICAJ
CWlmIChfX2R3YzNfZ2FkZ2V0X2tpY2tfdHJhbnNmZXIoZGVwLCBmYWxzZSkgPT0gMCkNCg0KQlIs
DQpUaGluaA0K
