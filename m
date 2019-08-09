Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E067F87A4F
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 14:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406731AbfHIMin (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 08:38:43 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:12228 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406338AbfHIMin (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Aug 2019 08:38:43 -0400
IronPort-SDR: Ks+vOe71oqrwKfdn7yp2FzesdTWinSqgFmPmfDNn+6wUldl8f6+TURLR7QB1UoyKllYZXHprAO
 F7HIPxMbitL3lmM4QgMYUM5xt0/w7BbfVXG5U6aNG1zHmxieHULSw9MyxYfEjdrsL5l8wVN4iv
 W3jN3hZFTDC89a/xJYA8D0MbhPdJWruzkURlLzTtExRpwFiYa96y6gkeQZqO0rprNVChuMWSCC
 hQOZviKo96Lvs2gkJPSmxnhdMOUmtrOtUDjqmmrBGSxzd3wq1XMvQoibpmHNBZ3B/ekk7HwBm8
 Ru8=
X-IronPort-AV: E=Sophos;i="5.64,364,1559548800"; 
   d="scan'208";a="40323747"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 09 Aug 2019 04:38:41 -0800
IronPort-SDR: 8TmV3LDZcRgzFkw0lPJabnAsI8Coyl8ahAXO+9I6CjfCf1bI2xWUh1ps237RNS2i3H2NRcggLw
 wiGfwWZw3K7r56ytwVs/yxSDjGKDvuntaUxIQnLHVaUgaQfm85DGWUJPnDxpDMZEhZ/hcDHk2U
 wSQD1tuqnSY2MsZWUUfgX9vIZcvHtXc6hn/a8HGpn79ng0PwG1BX+8FUnVzPBXRCfmxkQ43Ljh
 bis/L3orCgWfDAghIz8lDJCKl78yalPW1ihjMo82liEFEZIz7rfAwTopCjQIgwaISiF1FR94Cy
 cas=
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
Subject: AW: AW: AW: KASAN: use-after-free Read in usbhid_power
Thread-Topic: AW: AW: KASAN: use-after-free Read in usbhid_power
Thread-Index: AQHVQVT8kp3cH3z0AEy3rfqKg0QMQKbaMLqAgAAB/4CAANH5gIAAXcMAgBY/mwCAAAvuAIAA2G/Q///144CAAChbQP///+iAgAATm0D///XXgAAFC+Zw
Date:   Fri, 9 Aug 2019 12:38:35 +0000
Message-ID: <932dbc769a80416eb736e6397c126ce9@SVR-IES-MBX-03.mgc.mentorg.com>
References: <CAAeHK+wb8=Z65_1CGcj0ShT6+NiQSDKhEkBVx+8vPe3kJF8+6g@mail.gmail.com>
 <Pine.LNX.4.44L0.1908081522290.1319-100000@iolanthe.rowland.org>
 <caf422aebd314ab8a5dd96ac2d9bb198@SVR-IES-MBX-03.mgc.mentorg.com>
 <20190809075555.GA20409@kroah.com>
 <8e43085507b849e49e858e5388f3e13c@SVR-IES-MBX-03.mgc.mentorg.com>
 <d7f1f3dc-03b3-34b8-657b-13c7b91ee361@redhat.com>
 <86ef050c477841a6951fd984b38c9f04@SVR-IES-MBX-03.mgc.mentorg.com>
 <9c955960-8b50-30dd-732a-92c62e5761cc@redhat.com>
In-Reply-To: <9c955960-8b50-30dd-732a-92c62e5761cc@redhat.com>
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

SGkgYWdhaW4sDQoNCj4+DQo+PiBIZXksIGkgZGlkIG5vdCB3YW50IHRvIHRyaWdnZXIgYW4gZWFy
dHF1YWtlIGluIHRoZSBiYXNlbWVudCBvZiB0aGUga2VybmVsIDstKQ0KPj4gTXkgaW50ZW50aW9u
IHdhcyB0byBwcmV2ZW50IHNvbWUgY3Jhc2hlcywgYW5kIGhlbHAgZGV2ZWxvcGVycyB0byBmaW5k
IHRoZWlyIGJ1Z3MuDQo+PiBJIHRoaW5rIG15IHBhdGNoIGV4YWN0bHkgZG9lcyB0aGlzLg0KPiAN
Cj4gSGVoZSwgYWN0dWFsbHkgZHJpdmVycyBub3QgYmVpbmcgYWJsZSB0byBibG9jayB1bmJpbmQg
aGFzIGJlZW4gYnVnZ2luZyBtZQ0KPiBmb3INCj4gYSB3aGlsZSBub3csIGJlY2F1c2UgdGhlcmUg
YXJlIGNhc2VzIHdoZXJlIHRoaXMgd291bGQgYmUgcmVhbGx5IGhlbHBmdWwuDQo+Pj4gMSkgbWFr
ZSByZXNvdXJjZXMgcmVmY291bnRlZCwgaGF2ZSBjaGlsZCByZXNvdXJjZXMgdGFrZSBhIHJlZiBv
biB0aGUgcGFyZW50DQo+Pj4gMikgRGlzYWxsb3cgdW5iaW5kIG9uIGRldmljZXMgd2l0aCBib3Vu
ZCBjaGlsZC1kZXZpY2VzPw0KPj4+DQo+PiBFeGFjdGx5IHdoYXQgaSB3YXMgdGhpbmtpbmcgb2Yg
aW4gZmlyc3QgYXR0ZW1wdHMuDQo+PiBCdXQgaSBmZWFyIHRoYXQgd291bGQgYnJlYWsgZXZlbiBt
b3JlIHVzZSBjYXNlcy4NCj4+DQo+PiBIYW5zLCBkaXJlY3RseSByZWdhcmRpbmcgdGhlIGRyaXZl
cjoNCj4+IFRoZSBwcm9ibGVtIGkgc2VlIGlzIHRoYXQgdGhlIHhoY2lfaW50ZWxfdW5yZWdpc3Rl
cl9wZGV2IHdoaWNoIGlzIGFkZGVkDQo+PiBhcyBhbiBhY3Rpb24gd2l0aCBkZXZtX2FkZF9hY3Rp
b25fb3JfcmVzZXQoKSBpcyBjYWxsZWQgbGF0ZSBieSB0aGUgZnJhbWV3b3JrLA0KPj4gbGF0ZXIg
dGhhbiB0aGUgdXNiX2hjZF9wY2lfcmVtb3ZlKCkgaW4geGhjaV9wY2lfcmVtb3ZlLg0KPj4gSXMg
dGhlcmUgYW55IGNoYW5jZSB0byB0cmlnZ2VyIHRoaXMgYmVmb3JlPw0KPj4gVGhpcyBpcyB3aGF0
IEdyZWcgbWVhbnQgd2l0aCAicmlnaHQgb3JkZXIiLg0KPiANCj4gQWgsIEkgbWlzc2VkIHRoYXQg
cGFydCwgc3VyZSB0aGF0IHNob3VsZCBiZSBlYXN5LCBqdXN0IHN0b3AgdXNpbmcNCj4gZGV2bV9h
ZGRfYWN0aW9uX29yX3Jlc2V0KCkgYW5kIGRvIHRoZSB4aGNpX2ludGVsX3VucmVnaXN0ZXJfcGRl
digpDQo+IG1hbnVhbGx5IGF0IHRoZSByaWdodCB0aW1lLiBUaGUgZG93bnNpZGUgb2YgdGhpcyBp
cyB0aGF0IHlvdSBhbHNvDQo+IG5lZWQgdG8gbWFrZSBzdXJlIGl0IGhhcHBlbnMgYXQgdGhlIHJp
Z2h0IHRpbWUgZnJvbSBwcm9iZSBlcnJvci1wYXRocw0KPiBidXQgZ2l2ZW4gdGhlIGJ1ZyB5b3Ug
YXJlIGhpdHRpbmcsIEkgZ3Vlc3MgdGhhdCBpcyBwcm9iYWJseQ0KPiBhbHJlYWR5IGEgcHJvYmxl
bS4NCj4gDQpASGFuczoNClN1cmUsIHdpbGwgaGF2ZSBhIGxvb2sgYXQgdGhpcy4gSSB0aGluayBp
IGhhdmUgZm91bmQgd2hlcmUgdG8gZG8gdGhhdCwNCmJ1dCBuZWVkIHRvIGNoZWNrIGhvdyB0byBn
ZXQgdGhlIHBkZXYgcG9pbnRlciB0aGVyZSAuLi4uDQoNCkBHcmVnOg0KSSBhbSBzdGlsbCBjb25m
aWRlbnQgdGhhdCBteSBwYXRjaCBpbiBfX3JlbGVhc2VfcmVnaW9uIHNob3VsZCBiZSB0YWtlbiBp
bi4NCg0KU2l0dWF0aW9uIG5vdyB3aXRob3V0IG15IHBhdGNoOg0KSWYgd2UgaGF2ZSBhIGRldmlj
ZSBkcml2ZXIgKG9yIHdoYXRldmVyKSByZWxlYXNpbmcgYSByZXNvdXJjZSwgdGhlIG93bmVyIG9m
DQp0aGUgY2hpbGQgd2lsbCBoYXZlIG5vIG5vdGlmaWNhdGlvbiB0aGF0IHRoZSBwYXJlbnQgaXMg
Z29uZS4NCkFjY2Vzc2luZyB0aGUgcGFyZW50IChhdCBsZWFzdCB0aGlzIHdpbGwgaGFwcGVuIHdo
ZW4gdHJ5aW5nIHRvIGZyZWUgdGhlIHJlc291cmNlKQ0KbWlnaHQgaGF2ZSBjaGFuZ2VkIG1lbW9y
eSBhdCB0aGUgcGFyZW50IGxvY2F0aW9uLCBhbmQgd2hhdCBoYXBwZW5zIG1pZ2h0DQpiZSBhbiBh
Y2Nlc3MgdG8gdW5tYXBwZWQgbWVtb3J5LCB3aGF0ZXZlciAtIGFuIG9vcHMgYW5kIHdlIGRvbid0
IGtub3cgd2h5Lg0KVGhhdCdzIHdoYXQgaSBleHBlcmllbmNlZCBhbmQgaHVudGluZy4NCg0KU2l0
dWF0aW9uIHdpdGggdGhlIHBhdGNoIGFwcGxpZWQ6DQpUaGUgb3duZXIgZ2V0cyBhIG5vdGlmaWNh
dGlvbiAocGFyZW50PU5VTEwpIGFuZCB3ZSBoYXZlIGFuIGluZGljYXRpb24gaW4NCnRoZSBrZXJu
ZWwgbG9nLg0KSWYgYW4gb3duZXIgb2YgdGhlIHJlc291cmNlIHdoZXJlIHRoZSBwYXJlbnQgaXMg
Z29uZSBjaGVja3MgZm9yIHRoZSBwYXJlbnQsDQp3ZSBhcmUgZmluZS4gSWYgaGUgZG9lc24ndCBj
aGVjazogd2UgaGF2ZSBhIE5VTEwgcG9pbnRlciBkZXJlZiB3aXRoIGEgd2FybmluZw0KbWVzc2Fn
ZSBwb2ludGluZyB0byB0aGUgcm9vdCBjYXVzZS4NCg0KSXNuJ3QgaXQgYmV0dGVyIHRvIGhhdmUg
YSBwb2ludGVyIHRvIGEgY3Jhc2ggcmF0aGVyIHRoYW4gaGF2aW5nIHVucmVsaWFibGUNCnJhY3kg
Y3Jhc2hlcyBpbiBzdWNoIGEgY2FzZT8NCg0KSGF2ZSBhIG5pY2Ugd2Vla2VuZC4NCg0KQmVzdCBy
ZWdhcmRzDQpDYXJzdGVuDQo=
