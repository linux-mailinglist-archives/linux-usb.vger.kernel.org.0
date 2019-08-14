Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1C28CEF3
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 11:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfHNJDv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 05:03:51 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:48857 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbfHNJDu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Aug 2019 05:03:50 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Wed, 14 Aug 2019 05:03:50 EDT
IronPort-SDR: qy/lQTX/iVY3sy0E0QujRKU+2MMSYQ7ecPhcc++NoXWr8cu97t+BxgwAxvfkrWENknxAXB5wMw
 Z5Jrzg45Fu/QOJ2HGK61daspIGnIz85RXTl98mAAomx2l2sSF9lhBZ9/IKIjaKKeHu6dAMr7Kp
 PYVW2kDnnMQfB/JalJOwicAXNcOH4NdelYnIjG38hvy2syk84SzmcSqz5kohuvdS0HjYtd0DPO
 /K83EBvSpHiMg+gqeokeUwJhTBtKFCEbAkBlo1BJcqCP/cyHc4kldu9lqjPdV2/WxgiHz91QbG
 9ew=
X-IronPort-AV: E=Sophos;i="5.64,384,1559548800"; 
   d="scan'208";a="42243215"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 14 Aug 2019 00:56:43 -0800
IronPort-SDR: LPZ6d1wc0Goz0NH/3POlzZMzFt3LHoPsZAArgTOtk6a55zFFyvRdZcgNIDUxDLspEovJ8LmiDr
 WSRtwW7D0bTdQHcu2A2KuSUjzPmvCw+GhGMH04geRvcE+zw1ZshZFsWPem66F6LsQbS7JnEtHi
 RO5B0/ARzb49GvjmPeEamneu6jEOjcKultlSltL/i/I/uIl65w8MEMXnoPvyvYC+45Jv49uZhT
 c6swAVhva16nf9SMRG2WMJ/f+So/8siiLhF210kxlCwOx2OBzCaushtjhg5eL91xYERF03DjVV
 7Ds=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Oliver Neukum <oneukum@suse.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters
Thread-Topic: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters
Thread-Index: AdVSeH/taFnFr9I1T4OXjPctlrQ3Ev//86kA///uBTA=
Date:   Wed, 14 Aug 2019 08:56:38 +0000
Message-ID: <f5e22fea4e1c4baeb2fc98d324ad9060@SVR-IES-MBX-03.mgc.mentorg.com>
References: <db0e8930ea94408ca7a38192ddfd203f@SVR-IES-MBX-03.mgc.mentorg.com>
 <1565771508.25764.3.camel@suse.com>
In-Reply-To: <1565771508.25764.3.camel@suse.com>
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

Pj4gUGx1Z2dpbmcgdGhlbSBpbnRvIHRoZSBzYW1lIHBvcnQgKCEpIG9uIG15IGRldmljZSBvbmUg
b2YgdGhlbSBpcw0KPj4gcmVjb2duaXplZCBhcyBTdXBlclNwZWVkLCB0aGUgb3RoZXIgYXMgaGln
aCBzcGVlZCA/Pz8NCj4+ICh3b3JraW5nIG9uIDQuMTQuMTI5IExUUykNCj4+DQo+PiBGcm9tIGRt
ZXNnLCB0aGUgImZhdWx0eSIgb25lOg0KPj4gWyAgNTMwLjU4NTg3MV0gdXNiIDEtMjogbmV3IGhp
Z2gtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgNCB1c2luZw0KPj4geGhjaV9oY2QgICA8PDw8PDw8
PDwgSFVIID8/Pz8NCj4+IA0KPiBYSENJIGlzIG5vdCBsaWtlIEVIQ0kuIEl0IG5lZWRzIG5vIGNv
bXBhbmlvbiBjb250cm9sbGVyLCBhcyBpdCBzZXJ2ZXMNCj4gYWxsIHNwZWVkcy4NCj4gDQouLi4N
Cj4gDQo+IFRoaXMgaXMgb24gYSBsb3dlciBsYXllciB0aGFuIGF4ODgxNzkuIFRoaXMgY29tZXMg
ZnJvbSB4aGNpX2hjZC4NCj4gSXMgdGhpcyBhIHJlZ3Jlc3Npb24/DQo+IA0KSSBkb24ndCB0aGlu
ayBpdHMgYSByZWdyZXNzaW9uLg0KDQpNZWFud2hpbGUgc29tZSBtb3JlIHN0cmFuZ2UgdGhpbmdz
Og0KRGVwZW5kaW5nIG9uIGhvdyBmYXN0IGkgcGx1ZyBpbiB0aGUgImZhdWx0eSIgb25lLCBzb21l
dGltZXMNCml0IGlzIHJlY29nbml6ZWQgYXMgYSBTdXBlclNwZWVkIHRvby4NCkJ1dCB0aGVuLCBp
IGhhdmUgbWFkZSB0aGUgZm9sbG93aW5nIG9ic2VydmF0aW9uOg0KLSBwaW5nIGZyb20gdGhlIGRl
dmljZSB0byBhIGhvc3Qgd29ya3MgKGFuZCB2aWNlIHZlcnNhKQ0KLSBzY3AtaW5nIGEgZmlsZSBm
cm9tIGhvc3QgdG8gdG8gZGV2aWNlIHRoZSBhZGFwdGVyIHN1ZGRlbmx5IHN0YWxscywNCiAgYnV0
IGkgZG9uJ3Qgc2VlIGFueSBlcnJvciBtZXNzYWdlIGluIGRtZXNnDQotIGRldmljZSB0aGVuIGlz
IHN0YWxsZWQsIHBpbmcgZG9lc24ndCB3b3JrIGFueSBtb3JlDQotIHVuYmluZC9iaW5kIGRyaXZl
ciByZWNvdmVycyB0aGUgYWRhcHRlcg0KICAoYW5kIGFsd2F5cyByZXR1cm5zIFN1cGVyU3BlZWQg
bW9kZSkNCi0gcGluZyB3b3Jrcywgc2NwIGJyZWFrcyBpdCBhZ2Fpbg0KLSBsZWF2aW5nIHRoZSBk
ZXZpY2UgaW4gc3RhbGwsIHNjcCB0ZWxscyAibG9zdCBjb25uZWN0aW9uIg0KICBvbiB0aGUgaG9z
dCBhZnRlciB+MTAgbWludXRlcw0KDQpJcyB0aGVyZSBzb21ldGhpbmcgaSBjYW4gZG8gdG8gZm9y
Y2UgYW4gZXJyb3IgbWVzc2FnZSB0byBiZSBzZWVuDQp3aGVuIHRoZSBFVEgyVVNCIGFkYXB0ZXIg
c3RhbGxzPw0KDQpNeSBjdXJyZW50IGFzc3VtcHRpb24gaXMgdGhhdCB0aGUgc2lnbmFsIHF1YWxp
dHkgb2YgdGhlIFVTQiBwb3J0IGlzIGF0IGENCmNvcm5lciBjYXNlLCBhbmQgdGhlcmVmb3JlIHNv
bWUgImJldHRlciIgQWRhcHRlcnMgd29yaywgc29tZSAiYmFkIG9uZXMiDQpkb24ndC4gQnV0IGFz
IHRoZXJlIGlzIG5vIGVycm9yIG1lc3NhZ2Ugc2VlbiBpbiB0aGUgZG1lc2csIGkgYW0gc29tZWhv
dyBsb3N0Lg0KDQpCZXN0IHJlZ2FyZHMNCkNhcnN0ZW4NCg==
