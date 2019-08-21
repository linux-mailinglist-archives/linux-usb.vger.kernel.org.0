Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3FF97911
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 14:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbfHUMRh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 08:17:37 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38046 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfHUMRh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 08:17:37 -0400
IronPort-SDR: sXhlF8BZauWXQyFo5S46mruoWnKgO7Tlw2CvzZE5/z5S454d5dcyIhFZ14eJ4v42NVlzltyPVA
 lm3yRVgE0m2Y1rssvZty72E+ExcgibUNwpf4wzMTMaIRAhSZEHOJWGzRQpoi6XzXKLTdpyhAFb
 mjPtB0cuZc9U/u/PGf3Cg9Kh6OrAYM4LGrFkR7HepXLN/DbPPgx1LXY12++/S296kGeHUt4SJ9
 BaaqYSm7nDh6VktLkvAUcNRAvmmm1Bs6uPRiZ+muSpeHCUT3sLzJOMjZp0lc7lVtS4NwK6GtgT
 jiA=
X-IronPort-AV: E=Sophos;i="5.64,412,1559548800"; 
   d="scan'208";a="42439119"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 21 Aug 2019 04:17:36 -0800
IronPort-SDR: T4c/ujjmw/+9zApZzsEzDm+ZUOVJxXhPZurhTz/eFdGlDBOOtqIL43cckavXBqPt143ACc4KJb
 vzij8EkoGUjV3JA+abWuN8qwMIU9AAt0TNJSAZzzrhBmYh/sH3rOXvJ54EaQ1HUVd2BrdBaccl
 FAbWiZE7AmNj2XOM9oYLyQcaIC/4qY7ctgDUvPMYpLy3333JH32iacsdxUbKId9XAieBWN7IfF
 usbkHA8KrgL7LhrtCutBontmhgvtQCa9HP1POO2KtFOnwkX7HV9ikIt3tAoxikoAi+ICy7+QPr
 MHg=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     "wharms@bfs.de" <wharms@bfs.de>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "greg@kroah.com" <greg@kroah.com>
Subject: AW: problems with Edgeport/416
Thread-Topic: problems with Edgeport/416
Thread-Index: AQHVWBIYNX3xNGRgBkW3E536acORx6cFehQg///2BQCAABJB0A==
Date:   Wed, 21 Aug 2019 12:17:31 +0000
Message-ID: <2a533cdf9743457bb4998b0409f28f3d@SVR-IES-MBX-03.mgc.mentorg.com>
References: <5D5D285D.3080908@bfs.de>
 <741cf63f72e443ba9158c9c123fcccc7@SVR-IES-MBX-03.mgc.mentorg.com>
 <5D5D332A.3010504@bfs.de>
In-Reply-To: <5D5D332A.3010504@bfs.de>
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

PiA+IChkb2luZyBhICJjYXQgL3N5cy9rZXJuZWwvZGVidWcvZHluYW1pY19kZWJ1Zy9jb250cm9s
IHwgZ3JlcCB1c2IiIGhlbHBzDQo+IG11Y2gpDQo+ID4NCj4gSSBzZWUgYSBidW5jaCBvZiBtZXNz
YWdlcy4gd2hhdCBkbyB5b3UgZXhwZWN0IG1lIHRvIGRvID8gSSBoYXZlIDQxMiBsaW5lcywNCj4g
c2hvdWxkDQo+IGkgc2VuZCB0aGVtID8NCj4gDQpGcm9tIHRoZSBsb2cgb2YgeW91ciBrZXJuZWwg
bWVzc2FnZXMsIGl0IHNlZW1zIHRoYXQgdWhjaV9oY2QgdGFrZXMgb3ZlciB0aGUgdHJhbnNwb3J0
Lg0KU28geW91IHNob3VsZCBkbw0KDQplY2hvIC1uICdtb2R1bGUgdWhjaV9oY2QgPXAnID4gL3N5
cy9rZXJuZWwvZGVidWcvZHluYW1pY19kZWJ1Zy9jb250cm9sDQplY2hvIC1uICdtb2R1bGUgdXNi
Y29yZSA9cCcgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9keW5hbWljX2RlYnVnL2NvbnRyb2wNCg0KPiBJ
IGRpZCBub3Qga25vdyBhYm91dCBkeW5hbWljLWRlYnVnLCBmb3J0dW5hdGVseSBsaW51eCBkcml2
ZXJzIHNpbXBseSB3b3JrDQo+IHRoZXNlIGRheXMgOikNCkhlbHBzIGEgYml0IHRvIGJldHRlciB1
bmRlcnN0YW5kIHdoYXQgZ29lcyB3cm9uZy4NCklmIHlvdSBsb29rIGludG8gZG1lc2cgYWZ0ZXIg
ZW5hYmxpbmcgdGhlIGR5bmRlYiBtZXNzYWdlcywgeW91IHNob3VsZCBzZWUgbXVjaCBtb3JlIHRo
YW4NClVTQiBjb25uZWN0IG1lc3NhZ2VzLg0KDQpCdXQgYmUgYXdhcmUgdGhhdCB0aGVyZSBhcmUg
cXVpdGUgYSBsb3Qgb2YgbWVzc2FnZXMgdGhhdCBhcHBlYXIgaW4gZG1lc2cuDQpCZXN0IGlzIHRv
IGVuYWJsZSB0aGUgZHluZGJnLCB0aGVuIGltbWVkaWF0ZWx5IHBsdWcgaW4gdGhlIGRldmljZSwg
YW5kDQphZnRlciBhIGZldyBzZWNvbmRzICg1IHNlY29uZHMgb3Igc28pIHlvdSBzaG91bGQgZG8g
YQ0KZG1lc2cgPiBteWxvZy50eHQNClRoZW4geW91IGhhdmUgdGhlIGRtZXNnIGNhcHR1cmVkIGlu
dG8gdGhlIHRleHQgZmlsZSBteWxvZy50eHQgYW5kIHlvdSBoYXZlIHRpbWUgdG8gY2hlY2sgaXQu
DQpDaGVjayBmb3IgVVNCIGVycm9yIG1lc3NhZ2VzIGluIHRoaXMgZmlsZS4NCg0KQmVzdCByZWdh
cmRzDQpDYXJzdGVuDQoNCg==
