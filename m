Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC7C9877F3
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 12:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406394AbfHIKzE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 06:55:04 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:57981 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfHIKzE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Aug 2019 06:55:04 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Fri, 09 Aug 2019 06:55:03 EDT
IronPort-SDR: yOOwguE8ZmYCWuZIsbfNIBZ28APf9NMNKbSP4WObXO6/19wGItype7qGMx+JS2fC7vA2O7AM7b
 esXwvRaSHOHbNvYuiVACesJjXy3Xkzq7KXPq+K1rhtMmr5JEFteQd1gKL6WjUsaEbCUxhE/PGs
 d0DEuk73yw8zRRODI6APSJBnE5YJy2fiJnvmmbTEC9Yodmie7OEPDqljHELt4lUg3r/AEN39MV
 Mqg6XWXmTHE1AXhDIamUGvDTrIMoB9NuTOOa85YQaG1NeLIYoTID2gycvmUToDgas+m0/QnI3K
 O/s=
X-IronPort-AV: E=Sophos;i="5.64,364,1559548800"; 
   d="scan'208";a="40302433"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 09 Aug 2019 02:47:56 -0800
IronPort-SDR: qkFtwpnuQvwYfjYSAeADy3uFMZqRnpKirSjVwuYtODmEHF3G+jLO9+I7nDz9R8zl6wzegieRHt
 gknB11EGOzfP00cpAlpfiEI/6IxTE1oxz7yeVeOEq5u3hJHZ3UQqV3hq7AYo8G1+htJ2nbH3Oz
 8prdR9uK/VlKtypHMR7fw7exQjKM9EyAAZhItkcU02JlnyItBNWyHtNNZ35Hv9PX/xxYkKVbGh
 kRpBdQsnWEaX94fFx0EkKBuKiSBfXC6z4GLCwNm+arASST67jlawPe/Q/ehOvhKNQue6WlOZRH
 gi4=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Andrey Konovalov <andreyknvl@google.com>,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>
Subject: AW: AW: KASAN: use-after-free Read in usbhid_power
Thread-Topic: AW: KASAN: use-after-free Read in usbhid_power
Thread-Index: AQHVQVT8kp3cH3z0AEy3rfqKg0QMQKbaMLqAgAAB/4CAANH5gIAAXcMAgBY/mwCAAAvuAIAA2G/Q///144CAAChbQP///+iAgAATm0A=
Date:   Fri, 9 Aug 2019 10:47:50 +0000
Message-ID: <86ef050c477841a6951fd984b38c9f04@SVR-IES-MBX-03.mgc.mentorg.com>
References: <CAAeHK+wb8=Z65_1CGcj0ShT6+NiQSDKhEkBVx+8vPe3kJF8+6g@mail.gmail.com>
 <Pine.LNX.4.44L0.1908081522290.1319-100000@iolanthe.rowland.org>
 <caf422aebd314ab8a5dd96ac2d9bb198@SVR-IES-MBX-03.mgc.mentorg.com>
 <20190809075555.GA20409@kroah.com>
 <8e43085507b849e49e858e5388f3e13c@SVR-IES-MBX-03.mgc.mentorg.com>
 <d7f1f3dc-03b3-34b8-657b-13c7b91ee361@redhat.com>
In-Reply-To: <d7f1f3dc-03b3-34b8-657b-13c7b91ee361@redhat.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiANCj4gV2UgYXJlIHRhbGtpbmcgbWVtb3J5LW1hcHBlZCBpbyBoZXJlLCBzbyBpdCBjYW5ub3Qg
anVzdCBiZSAicmUtdXNlZCIsIGl0DQo+IGlzIHdhdCBpdCBpcy4gSSBndWVzcyB0aGUgUENJIEJB
UiBjb3VsZCBiZSByZWxlYXNlZCBhbmQgdGhlbiB0aGUgcGh5c2ljYWwNCj4gYWRkcmVzcyB0aGUg
cmVzb3VyY2Ugd2FzIGF0IGNvdWxkIGJlIHJlLXVzZWQgZm9yIGFub3RoZXIgcGllY2Ugb2YgTU1J
bywNCj4gYnV0IEFGQUlLIG91dHNpZGUgb2YgUEk9Q0kgaG90cGx1ZyB3ZSBuZXZlciByZWxlYXNl
IEJBUnMuDQo+IA0KPiBNYXliZSB3ZSBuZWVkIHRvIHJlZi1jb3VudCByZXNvdXJjZXMgYW5kIGhh
dmUgdGhlIGFwcmVudCBmcmVlIG9ubHkgYmUNCj4gYSBkZXJlZiBhbmQgbm90IHJlbGVhc2UgdGhl
IHJlc291cmNlIHVudGlsIHRoZSBjaGlsZCByZXNvdXJjZSBhbHNvDQo+IGlzIGZyZWUtZWQgZG9p
bmcgYW5vdGhlciBkZXJlZj8NCj4gDQo+IEkgbXVzdCBzYXkgdGhhdCB0byBtZSBpdCBzb21ldGlt
ZXMganVzdCBzZWVtcyBsaWtlIGFsd2F5cyBhbGxvd2luZyB1bmJpbmQNCj4gaXMgYSBiYWQgaWRl
YS4gQW5vdGhlciBleGFtcGxlIG9mIHRoaXMgaXMgdGhpbmdzIGxpa2UgdmlydGlvLCB3aGVyZQ0K
PiB3ZSBjYW4gaGF2ZSBhIGZpbGVzeXN0ZW0gYmFzZWQgb24gdmlydGlvLWJsb2NrLCBidXQgdGhl
IHZpcnRpbyBpbnRlcmZhY2UNCj4gYmV0d2VlbiB0aGUgaHlwZXJ2aXNvciBhbmQgdGhlIGd1ZXN0
LWtlcm5lbCBpcyBhIFBDSS1kZXZpY2UgYW5kIGluIHRoZW9yeQ0KPiB0aGUgdXNlciBjb3VsZCB1
bmJpbmQgdGhlIHZpcnRpbyBkcml2ZXIgZnJvbSB0aGF0IFBDSS1kZXZpY2UsIGFmdGVyIHdoaWNo
DQo+IHRoZSB3aG9sZSBob3VzZSBjb21lcyBjcmFzaGluZyBkb3duLg0KPiANCj4gSSBhbHNvIGtu
b3cgdGhhdCB0aGUgZXh0Y29uIGZyYW1ld29yayBpbiBpdHMgY3VycmVudCBpbmNhcm5hdG9uDQo+
IGRvZXMgbm90IGRlYWwgd2l0aCB1bmJpbmQgcHJvcGVybHkuLi4NCj4gDQo+IE1heWJlIGl0IGlz
IHRpbWUgdGhhdCB3ZSBhbGxvdyBkcml2ZXJzIHRvIGJsb2NrIHVuYmluZCBpbnN0ZWFkIG9mDQo+
IHRyeWluZyB0byBzdXBwb3J0IHVuYmluZCBpbiByZWFsbHkgY29tcGxleCBzaXR1YXRpb25zIHdo
ZXJlIG5vcm1hbA0KPiB1c2UtY2FzZXMgd2lsbCBuZXZlciBuZWVkIGl0ID8NCj4gDQo+IEkgZG8g
cmVhbGl6ZSB1bmJpbmQgaXMgdmVyeSB1c2VmdWwgZm9yIGRyaXZlciBkZXZlbG9wZW50IHdpdGhv
dXQNCj4gcmVib290aW5nLg0KPiANCg0KSGV5LCBpIGRpZCBub3Qgd2FudCB0byB0cmlnZ2VyIGFu
IGVhcnRxdWFrZSBpbiB0aGUgYmFzZW1lbnQgb2YgdGhlIGtlcm5lbCA7LSkNCk15IGludGVudGlv
biB3YXMgdG8gcHJldmVudCBzb21lIGNyYXNoZXMsIGFuZCBoZWxwIGRldmVsb3BlcnMgdG8gZmlu
ZCB0aGVpciBidWdzLg0KSSB0aGluayBteSBwYXRjaCBleGFjdGx5IGRvZXMgdGhpcy4NCiANCj4g
MSkgbWFrZSByZXNvdXJjZXMgcmVmY291bnRlZCwgaGF2ZSBjaGlsZCByZXNvdXJjZXMgdGFrZSBh
IHJlZiBvbiB0aGUgcGFyZW50DQo+IDIpIERpc2FsbG93IHVuYmluZCBvbiBkZXZpY2VzIHdpdGgg
Ym91bmQgY2hpbGQtZGV2aWNlcz8NCj4gDQoNCkV4YWN0bHkgd2hhdCBpIHdhcyB0aGlua2luZyBv
ZiBpbiBmaXJzdCBhdHRlbXB0cy4NCkJ1dCBpIGZlYXIgdGhhdCB3b3VsZCBicmVhayBldmVuIG1v
cmUgdXNlIGNhc2VzLg0KDQpIYW5zLCBkaXJlY3RseSByZWdhcmRpbmcgdGhlIGRyaXZlcjoNClRo
ZSBwcm9ibGVtIGkgc2VlIGlzIHRoYXQgdGhlIHhoY2lfaW50ZWxfdW5yZWdpc3Rlcl9wZGV2IHdo
aWNoIGlzIGFkZGVkDQphcyBhbiBhY3Rpb24gd2l0aCBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQo
KSBpcyBjYWxsZWQgbGF0ZSBieSB0aGUgZnJhbWV3b3JrLA0KbGF0ZXIgdGhhbiB0aGUgdXNiX2hj
ZF9wY2lfcmVtb3ZlKCkgaW4geGhjaV9wY2lfcmVtb3ZlLg0KSXMgdGhlcmUgYW55IGNoYW5jZSB0
byB0cmlnZ2VyIHRoaXMgYmVmb3JlPw0KVGhpcyBpcyB3aGF0IEdyZWcgbWVhbnQgd2l0aCAicmln
aHQgb3JkZXIiLg0KDQpBbnl3YXksIGkgcmVhbGx5IGFwcHJlY2lhdGUgdGhlc2UgZGlzY3Vzc2lv
bnMsIHRoYW5rcyBmb3IgYWxsDQp5b3VyIHBhdGllbmNlLg0KDQpCZXN0IFJlZ2FyZHMNCkNhcnN0
ZW4NCg0K
