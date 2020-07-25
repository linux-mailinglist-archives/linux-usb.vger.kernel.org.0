Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03FD322D433
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 05:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgGYDQJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 23:16:09 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:40573 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726572AbgGYDQJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 23:16:09 -0400
X-UUID: d1955812dbea4c0f9d1d88df0e882fb9-20200725
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=EXoAXc1by99yUmzjQ75n6gpYA6SPGcecNLHOPO4do8A=;
        b=RF4EIZDnQwcTnal5xCO6CtLe4JKS0n92PtVrg+vrggAw/QOrqyTzwitBwjLKG4RYwTk1JdgOLMkScekMMPQUtXzB6zjsGXeIaCaOFWCGtIPTG97F/bs9VD0LautImhLZiiWahQlK8gOdGS51WviNG9wYYpzKTr0wME78kEk7CtU=;
X-UUID: d1955812dbea4c0f9d1d88df0e882fb9-20200725
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 897527574; Sat, 25 Jul 2020 11:16:02 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 25 Jul
 2020 11:16:01 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 25 Jul 2020 11:16:00 +0800
Message-ID: <1595646889.23885.68.camel@mhfsdcap03>
Subject: Re: [PATCH v3 03/12] usb: gadget: Expose sublink speed attributes
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, John Youn <John.Youn@synopsys.com>
Date:   Sat, 25 Jul 2020 11:14:49 +0800
In-Reply-To: <500284ccf0353ee17a6bee8fa55011f801e17630.1595631457.git.thinhn@synopsys.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
         <500284ccf0353ee17a6bee8fa55011f801e17630.1595631457.git.thinhn@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 87007FF420E079D9B8E3DB7E81AA786FFE938FB10FB0104F5A5232DD514CDA842000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCAyMDIwLTA3LTI0IGF0IDE2OjM4IC0wNzAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+
IFRoZSBVU0IgMy4yIHNwZWNpZmljYXRpb24gc3VwcG9ydHMgZHVhbC1sYW5lIGFuZCBkaWZmZXJl
bnQgdHJhbnNmZXINCj4gcmF0ZXMgZm9yIHN1cGVyLXNwZWVkLXBsdXMuIERldmljZXMgb3BlcmF0
aW5nIGluIHN1cGVyLXNwZWVkLXBsdXMgY2FuDQo+IGJlIGdlbjJ4MSwgZ2VuMXgyLCBvciBnZW4y
eDIuDQo+IA0KPiBBIGdhZGdldCBkcml2ZXIgbWF5IG5lZWQgdG8ga25vdyB0aGUgZ2FkZ2V0J3Mg
c3VibGluayBzcGVlZHMgdG8gcHJvcGVybHkNCj4gc2V0dXAgaXRzIHRyYW5zZmVyIHJlcXVlc3Rz
IGFuZCBkZXNjcmliZSBpdHMgY2FwYWJpbGl0eSBpbiBpdHMNCj4gZGVzY3JpcHRvcnMuIFRvIGRl
c2NyaWJlIHRoZSB0cmFuc2ZlciByYXRlIGluIHN1cGVyLXNwZWVkLXBsdXMgZnVsbHksDQo+IGxl
dCdzIGV4cG9zZSB0aGUgbGFuZSBjb3VudCBhbmQgc3VibGluayBzcGVlZCBhdHRyaWJ1dGVzIHdo
ZW4gb3BlcmF0aW5nDQo+IGluIHN1cGVyLXNwZWVkLXBsdXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBUaGluaCBOZ3V5ZW4gPHRoaW5obkBzeW5vcHN5cy5jb20+DQo+IC0tLQ0KPiAgQ2hhbmdlcyBp
biB2MzoNCj4gIC0gTm9uZQ0KPiAgQ2hhbmdlcyBpbiB2MjoNCj4gIC0gTm9uZQ0KPiANCj4gIGlu
Y2x1ZGUvbGludXgvdXNiL2dhZGdldC5oIHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC91c2IvZ2FkZ2V0LmggYi9pbmNsdWRlL2xpbnV4L3VzYi9nYWRnZXQuaA0KPiBpbmRl
eCA1MmNlMWY2YjhmODMuLmJkOTgyNjY5NjA5YyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51
eC91c2IvZ2FkZ2V0LmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC91c2IvZ2FkZ2V0LmgNCj4gQEAg
LTMzOSw2ICszMzksMTUgQEAgc3RydWN0IHVzYl9nYWRnZXRfb3BzIHsNCj4gICAqIEBzcGVlZDog
U3BlZWQgb2YgY3VycmVudCBjb25uZWN0aW9uIHRvIFVTQiBob3N0Lg0KPiAgICogQG1heF9zcGVl
ZDogTWF4aW1hbCBzcGVlZCB0aGUgVURDIGNhbiBoYW5kbGUuICBVREMgbXVzdCBzdXBwb3J0IHRo
aXMNCj4gICAqICAgICAgYW5kIGFsbCBzbG93ZXIgc3BlZWRzLg0KPiArICogQG51bV9sYW5lczog
TnVtYmVyIG9mIGxhbmVzIGluIHVzZS4NCj4gKyAqIEBtYXhfbnVtX2xhbmVzOiBNYXhpbXVtIG51
bWJlciBvZiBsYW5lcyB0aGUgVURDIHN1cHBvcnRzLg0KPiArICogQHNzYWM6IFN1Ymxpbmsgc3Bl
ZWQgYXR0cmlidXRlIGNvdW50LiBUaGUgbnVtYmVyIG9mIHN1Ymxpbmsgc3BlZWQNCj4gKyAqCWF0
dHJpYnV0ZXMgaXMgc3NhYyArIDEuDQo+ICsgKiBAc3VibGlua19zcGVlZDogQXJyYXkgb2Ygc3Vi
bGluayBzcGVlZCBhdHRyaWJ1dGVzIHRoZSBVREMgc3VwcG9ydHMuIFN1YmxpbmsNCj4gKyAqCXNw
ZWVkIGF0dHJpYnV0ZXMgYXJlIHBhaXJlZCwgYW5kIGFuIFJYIGZvbGxvd2VkIGJ5IGEgVFggYXR0
cmlidXRlLg0KPiArICogQHNwZWVkX3NzaWQ6IEN1cnJlbnQgc3VibGluayBzcGVlZCBhdHRyaWJ1
dGUgSUQgaW4gdXNlLg0KPiArICogQG1pbl9zcGVlZF9zc2lkOiBTdWJsaW5rIHNwZWVkIGF0dHJp
YnV0ZSBJRCB3aXRoIHRoZSBtaW5pbXVtIHNwZWVkLg0KPiArICogQG1heF9zcGVlZF9zc2lkOiBT
dWJsaW5rIHNwZWVkIGF0dHJpYnV0ZSBJRCB3aXRoIHRoZSBtYXhpbXVtIHNwZWVkLg0KPiAgICog
QHN0YXRlOiB0aGUgc3RhdGUgd2UgYXJlIG5vdyAoYXR0YWNoZWQsIHN1c3BlbmRlZCwgY29uZmln
dXJlZCwgZXRjKQ0KPiAgICogQG5hbWU6IElkZW50aWZpZXMgdGhlIGNvbnRyb2xsZXIgaGFyZHdh
cmUgdHlwZS4gIFVzZWQgaW4gZGlhZ25vc3RpY3MNCj4gICAqCWFuZCBzb21ldGltZXMgY29uZmln
dXJhdGlvbi4NCj4gQEAgLTQwNiw2ICs0MTUsMTcgQEAgc3RydWN0IHVzYl9nYWRnZXQgew0KPiAg
CXN0cnVjdCBsaXN0X2hlYWQJCWVwX2xpc3Q7CS8qIG9mIHVzYl9lcCAqLw0KPiAgCWVudW0gdXNi
X2RldmljZV9zcGVlZAkJc3BlZWQ7DQo+ICAJZW51bSB1c2JfZGV2aWNlX3NwZWVkCQltYXhfc3Bl
ZWQ7DQo+ICsNCj4gKwkvKiBTU1Agb25seSAqLw0KPiArCXVuc2lnbmVkCQkJbnVtX2xhbmVzOw0K
PiArCXVuc2lnbmVkCQkJbWF4X251bV9sYW5lczsNCj4gKwl1bnNpZ25lZAkJCXNzYWM7DQo+ICsj
ZGVmaW5lIFVTQl9HQURHRVRfTUFYX1NTQUMgMw0KPiArCXN0cnVjdCB1c2Jfc3VibGlua19zcGVl
ZAlzdWJsaW5rX3NwZWVkW1VTQl9HQURHRVRfTUFYX1NTQUMgKyAxXTsNCj4gKwl1bnNpZ25lZAkJ
CXNwZWVkX3NzaWQ7DQo+ICsJdW5zaWduZWQJCQltaW5fc3BlZWRfc3NpZDsNCj4gKwl1bnNpZ25l
ZAkJCW1heF9zcGVlZF9zc2lkOw0KY2hlY2twYXRjaCB3YXJuaW5nOg0KDQpXQVJOSU5HOlVOU1BF
Q0lGSUVEX0lOVDogUHJlZmVyICd1bnNpZ25lZCBpbnQnIHRvIGJhcmUgdXNlIG9mICd1bnNpZ25l
ZCcNCg0KPiArDQo+ICAJZW51bSB1c2JfZGV2aWNlX3N0YXRlCQlzdGF0ZTsNCj4gIAljb25zdCBj
aGFyCQkJKm5hbWU7DQo+ICAJc3RydWN0IGRldmljZQkJCWRldjsNCg0K

