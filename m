Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3F41F7280
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jun 2020 05:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgFLDjA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Jun 2020 23:39:00 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:21162 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726321AbgFLDjA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Jun 2020 23:39:00 -0400
X-UUID: 77f1412f29c14dbe97be15954031967c-20200612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=2vt1fP2Pv2sBuK3kCBi7QAIK77QfXBuuHgboplad8oc=;
        b=NjwK7zLTVflom0KTM61+KvD6VkOn1KKdeVOy3P+EQU1T5Xn0zs18Cv9pK6LT5cmzPFVaru4lMntgE4S+wyevBDwy2Vc+a1ckDg+yxqeeReS73hmjQ66612vRnZcRNErh7lg3CrUFMwWLYTsAb7yqBFARPW17F5DbOkdfi6q+oSw=;
X-UUID: 77f1412f29c14dbe97be15954031967c-20200612
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <macpaul.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1154677435; Fri, 12 Jun 2020 11:38:52 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Jun 2020 11:38:45 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Jun 2020 11:38:44 +0800
Message-ID: <1591933130.15994.23.camel@mtkswgap22>
Subject: Re: [PATCH v2] usb/gadget/function: introduce Built-in CDROM support
From:   Macpaul Lin <macpaul.lin@mediatek.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bart Van Assche <bvanassche@acm.org>,
        EJ Hsu <ejh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Peter Chen <peter.chen@nxp.com>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
        Macpaul Lin <macpaul.lin@gmail.com>,
        "Justin Hsieh" <justinhsieh@google.com>,
        Hakieyin Hsieh <hakieyin@gmail.com>
Date:   Fri, 12 Jun 2020 11:38:50 +0800
In-Reply-To: <20200610143100.GB11727@rowland.harvard.edu>
References: <1591756349-17865-1-git-send-email-macpaul.lin@mediatek.com>
         <1591769718-3287-1-git-send-email-macpaul.lin@mediatek.com>
         <20200610143100.GB11727@rowland.harvard.edu>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIwLTA2LTEwIGF0IDEwOjMxIC0wNDAwLCBBbGFuIFN0ZXJuIHdyb3RlOg0KPiBP
biBXZWQsIEp1biAxMCwgMjAyMCBhdCAwMjoxNToxOFBNICswODAwLCBNYWNwYXVsIExpbiB3cm90
ZToNCj4gPiBJbnRyb2R1Y2UgQnVpbHQtSW4gQ0RST00gKEJJQ1IpIHN1cHBvcnQuDQo+ID4gVGhp
cyBmZWF0dXJlIGRlcGVuZHMgb24gVVNCX0NPTkZJR0ZTX01BU1NfU1RPUkFHRSBvcHRpb24uDQo+
ID4gDQo+ID4gMS4gU29tZSBzZXR0aW5ncyBhbmQgbmV3IGZ1bmN0aW9uIGlzIGludHJvZHVjZWQg
Zm9yIEJJQ1IuDQo+ID4gMi4gU29tZSB3b3JrIGFyb3VuZCBmb3IgYWRhcHRpbmcgQW5kcm9pZCBz
ZXR0aW5ncyBpcyBpbnRyb2R1Y2VkIGFzIHdlbGwuDQo+IA0KPiBZb3UncmUgZ29pbmcgdG8gaGF2
ZSB0byBnaXZlIGEgbXVjaCBiZXR0ZXIgZXhwbGFuYXRpb24gb2Ygd2hhdCB0aGlzIA0KPiBkb2Vz
LiAgRm9yIHBlb3BsZSB3aG8gZG9uJ3Qga25vdyB3aGF0IEJ1aWx0LUluIENEUk9NIHN1cHBvcnQg
aXMsIHdoYXQgDQo+IHlvdSB3cm90ZSBpcyBtZWFuaW5nbGVzcy4NCj4gDQo+IEZvciBleGFtcGxl
LCBob3cgaXMgQklDUiBzdXBwb3J0IGRpZmZlcmVudCBmcm9tIHRoZSBDRFJPTSBzdXBwb3J0IA0K
PiBhbHJlYWR5IHByZXNlbnQgaW4gdGhlIGRyaXZlcj8gIEFuZCB3aGF0J3Mgc28gc3BlY2lhbCBh
Ym91dCBpdCB0aGF0IGl0IA0KPiBuZWVkcyBpdHMgb3duIGtjb25maWcgc2V0dGluZz8NCj4gDQo+
ID4gQEAgLTM2OSw2ICszNzIsMTAgQEAgc3RhdGljIHZvaWQgc2V0X2J1bGtfb3V0X3JlcV9sZW5n
dGgoc3RydWN0IGZzZ19jb21tb24gKmNvbW1vbiwNCj4gPiAgCWlmIChyZW0gPiAwKQ0KPiA+ICAJ
CWxlbmd0aCArPSBjb21tb24tPmJ1bGtfb3V0X21heHBhY2tldCAtIHJlbTsNCj4gPiAgCWJoLT5v
dXRyZXEtPmxlbmd0aCA9IGxlbmd0aDsNCj4gPiArDQo+ID4gKwkvKiBzb21lIFVTQiAyLjAgaGFy
ZHdhcmUgcmVxdWlyZXMgdGhpcyBzZXR0aW5nICovDQo+ID4gKwlpZiAoY29tbW9uLT5iaWNyKQ0K
PiA+ICsJCWJoLT5vdXRyZXEtPnNob3J0X25vdF9vayA9IDE7DQo+IA0KPiBIb3cgaXMgdGhpcyBj
b25uZWN0ZWQgd2l0aCBCSUNSPyAgSWYgc29tZSBVU0IgMi4wIGhhcmR3YXJlIHJlcXVpcmVzIHRo
aXMgDQo+IHNldHRpbmcsIHNob3VsZG4ndCBpdCBhbHdheXMgYmUgdHVybmVkIG9uPw0KPiANCj4g
QmVzaWRlcywgd2h5IGRvZXMgc29tZSBoYXJkd2FyZSByZXF1aXJlIHRoaXM/ICBXaGF0IGdvZXMg
d3JvbmcgaWYgDQo+IHNob3J0X25vdF9vayBpcyBzZXQgdG8gMD8gIElmIGl0IGNhdXNlcyBwcm9i
bGVtcywgd2h5IGRpZG4ndCB3ZSBiZWNvbWUgDQo+IGF3YXJlIG9mIHRoZW0gbWFueSB5ZWFycyBh
Z28/DQoNClRoYW5rcyBmb3IgQWxhbiBhbmQgR3JlZydzIHN1Z2dlc3Rpb24sIHdlIHdpbGwgY2hl
Y2sgdGhlc2UgaXNzdWVzIGFuZA0Kc2VlIGlmIGEgYmV0dGVyIHNvbHV0aW9uIGNvdWxkIGJlIHdv
cmsgb3V0Lg0KDQo+ID4gQEAgLTUyNyw3ICs1MzQsMTYgQEAgc3RhdGljIGludCBmc2dfc2V0dXAo
c3RydWN0IHVzYl9mdW5jdGlvbiAqZiwNCj4gPiAgCQkJCXdfbGVuZ3RoICE9IDEpDQo+ID4gIAkJ
CXJldHVybiAtRURPTTsNCj4gPiAgCQlWREJHKGZzZywgImdldCBtYXggTFVOXG4iKTsNCj4gPiAt
CQkqKHU4ICopcmVxLT5idWYgPSBfZnNnX2NvbW1vbl9nZXRfbWF4X2x1bihmc2ctPmNvbW1vbik7
DQo+ID4gKwkJaWYgKElTX0VOQUJMRUQoVVNCX0NPTkZJR0ZTX0JJQ1IpICYmIGZzZy0+Y29tbW9u
LT5iaWNyKSB7DQo+ID4gKwkJCS8qDQo+ID4gKwkJCSAqIFdoZW4gQnVpbHQtSW4gQ0RST00gaXMg
ZW5hYmxlZCwNCj4gPiArCQkJICogd2Ugc2hhcmUgb25seSBvbmUgTFVOLg0KPiA+ICsJCQkgKi8N
Cj4gPiArCQkJKih1OCAqKXJlcS0+YnVmID0gMDsNCj4gPiArCQl9IGVsc2Ugew0KPiA+ICsJCQkq
KHU4ICopcmVxLT5idWYgPSBfZnNnX2NvbW1vbl9nZXRfbWF4X2x1bihmc2ctPmNvbW1vbik7DQo+
ID4gKwkJfQ0KPiANCj4gVGhpcyBpcyBhIHZlcnkgc3RyYW5nZSB3YXkgb2YgZW5mb3JjaW5nIGEg
c2luZ2xlLUxVTiByZXN0cmljdGlvbi4gIFdoeSANCj4gZG8gaXQgaGVyZT8gIEEgbXVjaCBtb3Jl
IGxvZ2ljYWwgcGxhY2Ugd291bGQgYmUgd2hlcmUgY2ZnLT5ubHVucyBpcyBzZXQgDQo+IHVwIG9y
aWdpbmFsbHkuDQo+IA0KPiA+ICsJCUlORk8oZnNnLCAiZ2V0IG1heCBMVU4gPSAlZFxuIiwgKih1
OCAqKXJlcS0+YnVmKTsNCj4gDQo+IFRoaXMgZGVidWdnaW5nIGxpbmUgaXNuJ3QgbmVlZGVkLg0K
PiANCj4gPiAgCQkvKiBSZXNwb25kIHdpdGggZGF0YS9zdGF0dXMgKi8NCj4gPiAgCQlyZXEtPmxl
bmd0aCA9IG1pbigodTE2KTEsIHdfbGVuZ3RoKTsNCj4gPiBAQCAtMTMyOSw3ICsxMzQ1LDcgQEAg
c3RhdGljIGludCBkb19zdGFydF9zdG9wKHN0cnVjdCBmc2dfY29tbW9uICpjb21tb24pDQo+ID4g
IAl9DQo+ID4gIA0KPiA+ICAJLyogQXJlIHdlIGFsbG93ZWQgdG8gdW5sb2FkIHRoZSBtZWRpYT8g
Ki8NCj4gPiAtCWlmIChjdXJsdW4tPnByZXZlbnRfbWVkaXVtX3JlbW92YWwpIHsNCj4gPiArCWlm
ICghY3VybHVuLT5ub2Z1YSAmJiBjdXJsdW4tPnByZXZlbnRfbWVkaXVtX3JlbW92YWwpIHsNCj4g
DQo+IEhvdyBpcyBub2Z1YSBjb25uZWN0ZWQgdG8gQklDUj8gIE9yIHRvIHByZXZlbnRfbWVkaXVt
X3JlbW92YWw/DQo+IA0KPiA+ICAJCUxEQkcoY3VybHVuLCAidW5sb2FkIGF0dGVtcHQgcHJldmVu
dGVkXG4iKTsNCj4gPiAgCQljdXJsdW4tPnNlbnNlX2RhdGEgPSBTU19NRURJVU1fUkVNT1ZBTF9Q
UkVWRU5URUQ7DQo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gQEAgLTI2OTIsNiArMjcwOCw3
IEBAIGludCBmc2dfY29tbW9uX3NldF9jZGV2KHN0cnVjdCBmc2dfY29tbW9uICpjb21tb24sDQo+
ID4gIAljb21tb24tPmVwMCA9IGNkZXYtPmdhZGdldC0+ZXAwOw0KPiA+ICAJY29tbW9uLT5lcDBy
ZXEgPSBjZGV2LT5yZXE7DQo+ID4gIAljb21tb24tPmNkZXYgPSBjZGV2Ow0KPiA+ICsJY29tbW9u
LT5iaWNyID0gMDsNCj4gPiAgDQo+ID4gIAl1cyA9IHVzYl9nc3RyaW5nc19hdHRhY2goY2Rldiwg
ZnNnX3N0cmluZ3NfYXJyYXksDQo+ID4gIAkJCQkgQVJSQVlfU0laRShmc2dfc3RyaW5ncykpOw0K
PiA+IEBAIC0yODk1LDYgKzI5MTIsMzMgQEAgc3RhdGljIHZvaWQgZnNnX2NvbW1vbl9yZWxlYXNl
KHN0cnVjdCBmc2dfY29tbW9uICpjb21tb24pDQo+ID4gIAkJa2ZyZWUoY29tbW9uKTsNCj4gPiAg
fQ0KPiA+ICANCj4gPiArI2lmZGVmIENPTkZJR19VU0JfQ09ORklHRlNfQklDUg0KPiA+ICtzc2l6
ZV90IGZzZ19iaWNyX3Nob3coc3RydWN0IGZzZ19jb21tb24gKmNvbW1vbiwgY2hhciAqYnVmKQ0K
PiA+ICt7DQo+ID4gKwlyZXR1cm4gc3ByaW50ZihidWYsICIlZFxuIiwgY29tbW9uLT5iaWNyKTsN
Cj4gPiArfQ0KPiA+ICsNCj4gPiArc3NpemVfdCBmc2dfYmljcl9zdG9yZShzdHJ1Y3QgZnNnX2Nv
bW1vbiAqY29tbW9uLCBjb25zdCBjaGFyICpidWYsIHNpemVfdCBzaXplKQ0KPiA+ICt7DQo+ID4g
KwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCXJldCA9IGtzdHJ0b3U4KGJ1ZiwgMTAsICZjb21tb24t
PmJpY3IpOw0KPiA+ICsJaWYgKHJldCkNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+
ID4gKwkvKiBTZXQgTHVuWzBdIGlzIGEgQ0RST00gd2hlbiBlbmFibGUgYmljci4qLw0KPiA+ICsJ
aWYgKCFzdHJjbXAoYnVmLCAiMSIpKQ0KPiA+ICsJCWNvbW1vbi0+bHVuc1swXS0+Y2Ryb20gPSAx
Ow0KPiA+ICsJZWxzZSB7DQo+ID4gKwkJY29tbW9uLT5sdW5zWzBdLT5jZHJvbSA9IDA7DQo+ID4g
KwkJY29tbW9uLT5sdW5zWzBdLT5ibGtiaXRzID0gMDsNCj4gPiArCQljb21tb24tPmx1bnNbMF0t
PmJsa3NpemUgPSAwOw0KPiA+ICsJCWNvbW1vbi0+bHVuc1swXS0+bnVtX3NlY3RvcnMgPSAwOw0K
PiA+ICsJfQ0KPiA+ICsNCj4gPiArCXJldHVybiBzaXplOw0KPiA+ICt9DQo+IA0KPiBXaGVyZSBk
byB0aGVzZSBhdHRyaWJ1dGVzIGV2ZXIgZ2V0IGV4cG9ydGVkIHRvIHN5c2ZzPw0KPiANCj4gPiAr
I2VuZGlmDQo+ID4gIA0KPiA+ICAvKi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0qLw0KPiA+ICANCj4gPiBAQCAt
MzQ2Myw2ICszNTA3LDcgQEAgdm9pZCBmc2dfY29uZmlnX2Zyb21fcGFyYW1zKHN0cnVjdCBmc2df
Y29uZmlnICpjZmcsDQo+ID4gIAkJbHVuLT5ybyA9ICEhcGFyYW1zLT5yb1tpXTsNCj4gPiAgCQls
dW4tPmNkcm9tID0gISFwYXJhbXMtPmNkcm9tW2ldOw0KPiA+ICAJCWx1bi0+cmVtb3ZhYmxlID0g
ISFwYXJhbXMtPnJlbW92YWJsZVtpXTsNCj4gPiArCQlsdW4tPm5vZnVhID0gISFwYXJhbXMtPm5v
ZnVhW2ldOw0KPiANCj4gSXNuJ3QgdGhpcyBzZXQgYWxyZWFkeT8gIElmIG5vdCwgaXQgaXMgYSBi
dWcgdGhhdCBoYXMgbm90aGluZyB0byBkbyB3aXRoIA0KPiBCSUNSLg0KPiANCj4gPiAgCQlsdW4t
PmZpbGVuYW1lID0NCj4gPiAgCQkJcGFyYW1zLT5maWxlX2NvdW50ID4gaSAmJiBwYXJhbXMtPmZp
bGVbaV1bMF0NCj4gPiAgCQkJPyBwYXJhbXMtPmZpbGVbaV0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfbWFzc19zdG9yYWdlLmggYi9kcml2ZXJzL3VzYi9n
YWRnZXQvZnVuY3Rpb24vZl9tYXNzX3N0b3JhZ2UuaA0KPiA+IGluZGV4IDNiOGM0Y2UyYTQwYS4u
NzA5N2UyZWE1Y2M5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlv
bi9mX21hc3Nfc3RvcmFnZS5oDQo+ID4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9u
L2ZfbWFzc19zdG9yYWdlLmgNCj4gPiBAQCAtMTQwLDUgKzE0MCw4IEBAIHZvaWQgZnNnX2NvbW1v
bl9zZXRfaW5xdWlyeV9zdHJpbmcoc3RydWN0IGZzZ19jb21tb24gKmNvbW1vbiwgY29uc3QgY2hh
ciAqdm4sDQo+ID4gIHZvaWQgZnNnX2NvbmZpZ19mcm9tX3BhcmFtcyhzdHJ1Y3QgZnNnX2NvbmZp
ZyAqY2ZnLA0KPiA+ICAJCQkgICAgY29uc3Qgc3RydWN0IGZzZ19tb2R1bGVfcGFyYW1ldGVycyAq
cGFyYW1zLA0KPiA+ICAJCQkgICAgdW5zaWduZWQgaW50IGZzZ19udW1fYnVmZmVycyk7DQo+ID4g
LQ0KPiA+ICsjaWZkZWYgQ09ORklHX1VTQl9DT05GSUdGU19CSUNSDQo+ID4gK3NzaXplX3QgZnNn
X2JpY3Jfc2hvdyhzdHJ1Y3QgZnNnX2NvbW1vbiAqY29tbW9uLCBjaGFyICpidWYpOw0KPiA+ICtz
c2l6ZV90IGZzZ19iaWNyX3N0b3JlKHN0cnVjdCBmc2dfY29tbW9uICpjb21tb24sIGNvbnN0IGNo
YXIgKmJ1Ziwgc2l6ZV90IHNpemUpOw0KPiA+ICsjZW5kaWYNCj4gPiAgI2VuZGlmIC8qIFVTQl9G
X01BU1NfU1RPUkFHRV9IICovDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC9m
dW5jdGlvbi9zdG9yYWdlX2NvbW1vbi5jIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3N0
b3JhZ2VfY29tbW9uLmMNCj4gPiBpbmRleCBmN2U2YzQyNTU4ZWIuLjhmZTk2ZWVkZGYzNSAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vc3RvcmFnZV9jb21tb24u
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi9zdG9yYWdlX2NvbW1vbi5j
DQo+ID4gQEAgLTQ0MSw2ICs0NDEsMjkgQEAgc3NpemVfdCBmc2dfc3RvcmVfZmlsZShzdHJ1Y3Qg
ZnNnX2x1biAqY3VybHVuLCBzdHJ1Y3Qgcndfc2VtYXBob3JlICpmaWxlc2VtLA0KPiA+ICAJCXJl
dHVybiAtRUJVU1k7CQkJCS8qICJEb29yIGlzIGxvY2tlZCIgKi8NCj4gPiAgCX0NCj4gPiAgDQo+
ID4gKwlwcl9ub3RpY2UoIiVzIGZpbGU9JXMsIGNvdW50PSVkLCBjdXJsdW4tPmNkcm9tPSVkXG4i
LA0KPiA+ICsJCQlfX2Z1bmNfXywgYnVmLCAoaW50KWNvdW50LCBjdXJsdW4tPmNkcm9tKTsNCj4g
DQo+IEFub3RoZXIgZGVidWdnaW5nIGxpbmUgdGhhdCBzaG91bGRuJ3QgYmUgcHJlc2VudCBpbiB0
aGUgZmluYWwgcGF0Y2guDQo+IA0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBXT1JLQVJPVU5E
IGZvciBBbmRyb2lkOg0KPiA+ICsJICogICBWT0xEIHdvdWxkIGNsZWFuIHRoZSBmaWxlIHBhdGgg
YWZ0ZXIgc3dpdGNoaW5nIHRvIGJpY3IuDQo+ID4gKwkgKiAgIFNvIHdoZW4gdGhlIGx1biBpcyBi
ZWluZyBhIENELVJPTSBhLmsuYS4gQklDUi4NCj4gPiArCSAqICAgRG9uJ3QgY2xlYW4gdGhlIGZp
bGUgcGF0aCB0byBlbXB0eS4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKGN1cmx1bi0+Y2Ryb20gPT0g
MSAmJiBjb3VudCA9PSAxKQ0KPiA+ICsJCXJldHVybiBjb3VudDsNCj4gPiArDQo+ID4gKwkvKg0K
PiA+ICsJICogV09SS0FST1VORDogU2hvdWxkIGJlIGNsb3NlZCB0aGUgZnNnIGx1biBmb3Igdmly
dHVhbCBjZC1yb20sDQo+ID4gKwkgKiB3aGVuIHN3aXRjaCB0byBvdGhlciB1c2IgZnVuY3Rpb25z
Lg0KPiANCj4gVGhhdCBpcyBub3QgYSBncmFtbWF0aWNhbCBFbmdsaXNoIHNlbnRlbmNlLg0KPiAN
Cj4gPiArCSAqIFVzZSB0aGUgc3BlY2lhbCBrZXl3b3JkICJvZmYiLCBiZWNhdXNlIHRoZSBpbml0
IGNhbg0KPiA+ICsJICogbm90IHBhcnNlIHRoZSBjaGFyICdcbicgaW4gcmMgZmlsZSBhbmQgd3Jp
dGUgaW50byB0aGUgc3lzZnMuDQo+ID4gKwkgKi8NCj4gPiArCWlmIChjb3VudCA9PSAzICYmDQo+
ID4gKwkJCWJ1ZlswXSA9PSAnbycgJiYgYnVmWzFdID09ICdmJyAmJiBidWZbMl0gPT0gJ2YnICYm
DQo+ID4gKwkJCWZzZ19sdW5faXNfb3BlbihjdXJsdW4pKQ0KPiA+ICsJCSgoY2hhciAqKSBidWYp
WzBdID0gMDsNCj4gDQo+IFRoaXMgc2VlbXMgbGlrZSBhbm90aGVyIGJ1ZyBmaXggdGhhdCBoYXMg
bm8gY29ubmVjdGlvbiB3aXRoIEJJQ1IuDQo+IA0KPiBBbGFuIFN0ZXJuDQo+IA0KPiA+ICsNCj4g
PiAgCS8qIFJlbW92ZSBhIHRyYWlsaW5nIG5ld2xpbmUgKi8NCj4gPiAgCWlmIChjb3VudCA+IDAg
JiYgYnVmW2NvdW50LTFdID09ICdcbicpDQo+ID4gIAkJKChjaGFyICopIGJ1ZilbY291bnQtMV0g
PSAwOwkJLyogVWdoISAqLw0KPiA+IC0tIA0KPiA+IDIuMTguMA0KDQpUaGFua3MhDQpNYWNwYXVs
IExpbg0KDQo=

