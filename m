Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF3A746FAAC
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 07:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237006AbhLJGh2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 01:37:28 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:58314 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236965AbhLJGh1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 01:37:27 -0500
X-UUID: 03e3f6f274874ffeba8eaad6e2943839-20211210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=jW0E6lxQlKNybU5i7eEBZvTV8TnrOogj/3xvDI7n6g4=;
        b=aPK5cknEUYn+4ZTVgXoG0GjpnifxUqHyK1RFytCov3Mo+xZAJrCRvpl6Z74926CFioLeZtF2/kwmQoTnneUyriiMvzOQmHCc19tCwwcu/zkYfNML69Uj+QO2BCHhzZKQNFvkdw0nsTg4F4UyzbSYVRibxbOHVdtW7q45ApevYLI=;
X-UUID: 03e3f6f274874ffeba8eaad6e2943839-20211210
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1481594071; Fri, 10 Dec 2021 14:33:49 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 10 Dec 2021 14:33:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Dec 2021 14:33:47 +0800
Message-ID: <d363d5ca3b0059d7085fe1790b7f57bff80147ff.camel@mediatek.com>
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: Add USB xHCI controller for
 mt8195
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Date:   Fri, 10 Dec 2021 14:33:48 +0800
In-Reply-To: <9db3cb96-ac67-151d-5674-b56c5abbe348@collabora.com>
References: <20211102060049.1843-1-chunfeng.yun@mediatek.com>
         <20211102060049.1843-3-chunfeng.yun@mediatek.com>
         <9db3cb96-ac67-151d-5674-b56c5abbe348@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCAyMDIxLTExLTI2IGF0IDExOjM2ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMDIvMTEvMjEgMDc6MDAsIENodW5mZW5nIFl1biBoYSBzY3JpdHRv
Og0KPiA+IEFkZCBhbGwgZm91ciBVU0IgeEhDSSBjb250cm9sbGVycyBmb3IgTVQ4MTk1DQo+ID4g
DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsu
Y29tPg0KPiA+IC0tLQ0KPiA+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUu
ZHRzaSB8IDc5DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hh
bmdlZCwgNzkgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiANCj4gSGVsbG8hDQo+IFRoYW5rcyBmb3Ig
dGhlIHBhdGNoISBIb3dldmVyLCB0aGVyZSBpcyBzb21ldGhpbmcgdG8gaW1wcm92ZS4uLg0KPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRz
aQ0KPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRzaQ0KPiA+IGlu
ZGV4IGE1OWMwZTlkMWZjMi4uMjYzZWViZmQyZWExIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE5NS5kdHNpDQo+ID4gQEAgLTgsNiArOCw3IEBADQo+ID4gICAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTk1LWNsay5oPg0KPiA+ICAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4gPiAgICNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4NCj4gPiArI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL3BoeS9waHkuaD4NCj4gPiAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9w
b3dlci9tdDgxOTUtcG93ZXIuaD4NCj4gPiAgIA0KPiA+ICAgLyB7DQo+ID4gQEAgLTgyMyw2ICs4
MjQsMjYgQEANCj4gPiAgIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gICAJCX07DQo+ID4g
ICANCj4gPiArCQl4aGNpMDogdXNiQDExMjAwMDAwIHsNCj4gPiArCQkJY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxOTUteGhjaSIsDQo+ID4gIm1lZGlhdGVrLG10ay14aGNpIjsNCj4gPiArCQkJ
cmVnID0gPDAgMHgxMTIwMDAwMCAwIDB4MTAwMD4sIDwwIDB4MTEyMDNlMDAgMA0KPiA+IDB4MDEw
MD47DQo+ID4gKwkJCXJlZy1uYW1lcyA9ICJtYWMiLCAiaXBwYyI7DQo+ID4gKwkJCWludGVycnVw
dHMgPSA8R0lDX1NQSSAxMjkgSVJRX1RZUEVfTEVWRUxfSElHSA0KPiA+IDA+Ow0KPiANCj4gSGVy
ZSwgYW5kIG9uIHRoZSBvdGhlciB4aGNpIG5vZGVzIChmcm9tIHdoYXQgSSBrbm93LCB4aGNpezAs
MSwzfSksDQo+IHlvdSBzaG91bGQgdXNlDQo+IGludGVycnVwdHMtZXh0ZW5kZWQgYW5kIGRlY2xh
cmUgdGhlIHdha2V1cCBpbnRlcnJ1cHQgb24gcGlvLg0KPiANCj4gCQkJaW50ZXJydXB0cy1leHRl
bmRlZCA9IDwmZ2ljIEdJQ19TUEkgMTI5DQo+IElSUV9UWVBFX0xFVkVMX0hJR0ggMD4sDQo+IA0K
PiAJCQkJCSAgICAgIDwmcGlvIDIxOQ0KPiBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KPiANCj4gCQkJ
aW50ZXJydXB0LW5hbWVzID0gImhvc3QiLCAid2FrZXVwIjsNCk9rLCB0aGlzIHBhdGNoIGRvZXNu
J3Qgc3VwcG9ydCBydW50aW1lIHN1c3BlbmQsIHdpbGwgYWRkIGl0IGluIG5leHQNCnZlcnNpb24s
IHRoYW5rcyBhIGxvdA0KDQo+IA0KPiANCj4gPiArCQkJcGh5cyA9IDwmdTJwb3J0MCBQSFlfVFlQ
RV9VU0IyPiwgPCZ1M3BvcnQwDQo+ID4gUEhZX1RZUEVfVVNCMz47DQo+ID4gKwkJCWFzc2lnbmVk
LWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9VU0JfVE9QPiwNCj4gPiArCQkJCQkgIDwmdG9w
Y2tnZW4NCj4gPiBDTEtfVE9QX1NTVVNCX1hIQ0k+Ow0KPiA+ICsJCQlhc3NpZ25lZC1jbG9jay1w
YXJlbnRzID0gPCZ0b3Bja2dlbg0KPiA+IENMS19UT1BfVU5JVlBMTF9ENV9END4sDQo+ID4gKwkJ
CQkJCSA8JnRvcGNrZ2VuDQo+ID4gQ0xLX1RPUF9VTklWUExMX0Q1X0Q0PjsNCj4gPiArCQkJY2xv
Y2tzID0gPCZpbmZyYWNmZ19hbyBDTEtfSU5GUkFfQU9fU1NVU0I+LA0KPiA+ICsJCQkJIDwmaW5m
cmFjZmdfYW8NCj4gPiBDTEtfSU5GUkFfQU9fU1NVU0JfWEhDST4sDQo+ID4gKwkJCQkgPCZ0b3Bj
a2dlbiBDTEtfVE9QX1NTVVNCX1JFRj4sDQo+ID4gKwkJCQkgPCZhcG1peGVkc3lzIENMS19BUE1J
WEVEX1VTQjFQTEw+Ow0KPiA+ICsJCQljbG9jay1uYW1lcyA9ICJzeXNfY2siLCAieGhjaV9jayIs
ICJyZWZfY2siLA0KPiA+ICJtY3VfY2siOw0KPiA+ICsJCQltZWRpYXRlayxzeXNjb24td2FrZXVw
ID0gPCZwZXJpY2ZnIDB4NDAwIDEwMz47DQo+ID4gKwkJCXdha2V1cC1zb3VyY2U7DQo+ID4gKwkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gKwkJfTsNCj4gPiArDQo+ID4gICAJCW1tYzA6IG1t
Y0AxMTIzMDAwMCB7DQo+ID4gICAJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1tbWMi
LA0KPiA+ICJtZWRpYXRlayxtdDgxOTItbW1jIjsNCj4gPiAgIAkJCXJlZyA9IDwwIDB4MTEyMzAw
MDAgMCAweDEwMDAwPiwNCj4gPiBAQCAtODQzLDYgKzg2NCw2NCBAQA0KPiA+ICAgCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsNCj4gPiAgIAkJfTsNCj4gPiAgIA0KPiA+ICsJCXhoY2kxOiB1c2JAMTEy
OTAwMDAgew0KPiA+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS14aGNpIiwNCj4g
PiAibWVkaWF0ZWssbXRrLXhoY2kiOw0KPiA+ICsJCQlyZWcgPSA8MCAweDExMjkwMDAwIDAgMHgx
MDAwPiwgPDAgMHgxMTI5M2UwMCAwDQo+ID4gMHgwMTAwPjsNCj4gPiArCQkJcmVnLW5hbWVzID0g
Im1hYyIsICJpcHBjIjsNCj4gPiArCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDUzMCBJUlFfVFlQ
RV9MRVZFTF9ISUdIDQo+ID4gMD47DQo+IA0KPiAJCQlpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZn
aWMgR0lDX1NQSSA1MzANCj4gSVJRX1RZUEVfTEVWRUxfSElHSCAwPiwNCj4gDQo+IAkJCQkJICAg
ICAgPCZwaW8gMjE4DQo+IElSUV9UWVBFX0xFVkVMX0xPVz47DQo+IA0KPiA+ICsJCQlwaHlzID0g
PCZ1MnBvcnQxIFBIWV9UWVBFX1VTQjI+Ow0KPiA+ICsJCQlhc3NpZ25lZC1jbG9ja3MgPSA8JnRv
cGNrZ2VuDQo+ID4gQ0xLX1RPUF9VU0JfVE9QXzFQPiwNCj4gPiArCQkJCQkgIDwmdG9wY2tnZW4N
Cj4gPiBDTEtfVE9QX1NTVVNCX1hIQ0lfMVA+Ow0KPiA+ICsJCQlhc3NpZ25lZC1jbG9jay1wYXJl
bnRzID0gPCZ0b3Bja2dlbg0KPiA+IENMS19UT1BfVU5JVlBMTF9ENV9END4sDQo+ID4gKwkJCQkJ
CSA8JnRvcGNrZ2VuDQo+ID4gQ0xLX1RPUF9VTklWUExMX0Q1X0Q0PjsNCj4gPiArCQkJY2xvY2tz
ID0gPCZwZXJpY2ZnX2FvDQo+ID4gQ0xLX1BFUklfQU9fU1NVU0JfMVBfQlVTPiwNCj4gPiArCQkJ
CSA8JnBlcmljZmdfYW8NCj4gPiBDTEtfUEVSSV9BT19TU1VTQl8xUF9YSENJPiwNCj4gPiArCQkJ
CSA8JnRvcGNrZ2VuIENMS19UT1BfU1NVU0JfUDFfUkVGPiwNCj4gPiArCQkJCSA8JmFwbWl4ZWRz
eXMgQ0xLX0FQTUlYRURfVVNCMVBMTD47DQo+ID4gKwkJCWNsb2NrLW5hbWVzID0gInN5c19jayIs
ICJ4aGNpX2NrIiwgInJlZl9jayIsDQo+ID4gIm1jdV9jayI7DQo+ID4gKwkJCW1lZGlhdGVrLHN5
c2Nvbi13YWtldXAgPSA8JnBlcmljZmcgMHg0MDAgMTA0PjsNCj4gPiArCQkJd2FrZXVwLXNvdXJj
ZTsNCj4gPiArCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArCQl9Ow0KPiA+ICsNCj4gPiAr
CQl4aGNpMjogdXNiQDExMmEwMDAwIHsNCj4gPiArCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDgxOTUteGhjaSIsDQo+ID4gIm1lZGlhdGVrLG10ay14aGNpIjsNCj4gPiArCQkJcmVnID0gPDAg
MHgxMTJhMDAwMCAwIDB4MTAwMD4sIDwwIDB4MTEyYTNlMDAgMA0KPiA+IDB4MDEwMD47DQo+ID4g
KwkJCXJlZy1uYW1lcyA9ICJtYWMiLCAiaXBwYyI7DQo+ID4gKwkJCWludGVycnVwdHMgPSA8R0lD
X1NQSSA1MzMgSVJRX1RZUEVfTEVWRUxfSElHSA0KPiA+IDA+Ow0KPiA+ICsJCQlwaHlzID0gPCZ1
MnBvcnQyIFBIWV9UWVBFX1VTQjI+Ow0KPiA+ICsJCQlhc3NpZ25lZC1jbG9ja3MgPSA8JnRvcGNr
Z2VuDQo+ID4gQ0xLX1RPUF9VU0JfVE9QXzJQPiwNCj4gPiArCQkJCQkgIDwmdG9wY2tnZW4NCj4g
PiBDTEtfVE9QX1NTVVNCX1hIQ0lfMlA+Ow0KPiA+ICsJCQlhc3NpZ25lZC1jbG9jay1wYXJlbnRz
ID0gPCZ0b3Bja2dlbg0KPiA+IENMS19UT1BfVU5JVlBMTF9ENV9END4sDQo+ID4gKwkJCQkJCSA8
JnRvcGNrZ2VuDQo+ID4gQ0xLX1RPUF9VTklWUExMX0Q1X0Q0PjsNCj4gPiArCQkJY2xvY2tzID0g
PCZwZXJpY2ZnX2FvDQo+ID4gQ0xLX1BFUklfQU9fU1NVU0JfMlBfQlVTPiwNCj4gPiArCQkJCSA8
JnBlcmljZmdfYW8NCj4gPiBDTEtfUEVSSV9BT19TU1VTQl8yUF9YSENJPiwNCj4gPiArCQkJCSA8
JnRvcGNrZ2VuIENMS19UT1BfU1NVU0JfUDJfUkVGPjsNCj4gPiArCQkJY2xvY2stbmFtZXMgPSAi
c3lzX2NrIiwgInhoY2lfY2siLCAicmVmX2NrIjsNCj4gPiArCQkJbWVkaWF0ZWssc3lzY29uLXdh
a2V1cCA9IDwmcGVyaWNmZyAweDQwMCAxMDU+Ow0KPiA+ICsJCQlzdGF0dXMgPSAiZGlzYWJsZWQi
Ow0KPiA+ICsJCX07DQo+ID4gKw0KPiA+ICsJCXhoY2kzOiB1c2JAMTEyYjAwMDAgew0KPiA+ICsJ
CQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS14aGNpIiwNCj4gPiAibWVkaWF0ZWssbXRr
LXhoY2kiOw0KPiA+ICsJCQlyZWcgPSA8MCAweDExMmIwMDAwIDAgMHgxMDAwPiwgPDAgMHgxMTJi
M2UwMCAwDQo+ID4gMHgwMTAwPjsNCj4gPiArCQkJcmVnLW5hbWVzID0gIm1hYyIsICJpcHBjIjsN
Cj4gPiArCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDUzNiBJUlFfVFlQRV9MRVZFTF9ISUdIDQo+
ID4gMD47DQo+IA0KPiAJCQlpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZnaWMgR0lDX1NQSSA1MzYN
Cj4gSVJRX1RZUEVfTEVWRUxfSElHSCAwPiwNCj4gDQo+IAkJCQkJICAgICAgPCZwaW8gMjIxDQo+
IElSUV9UWVBFX0xFVkVMX0xPVz47DQo+IA0KPiAJCQlpbnRlcnJ1cHRzLW5hbWVzID0gImhvc3Qi
LCAid2FrZXVwIjsNCj4gDQo+ID4gKwkJCXBoeXMgPSA8JnUycG9ydDMgUEhZX1RZUEVfVVNCMj47
DQo+ID4gKwkJCWFzc2lnbmVkLWNsb2NrcyA9IDwmdG9wY2tnZW4NCj4gPiBDTEtfVE9QX1VTQl9U
T1BfM1A+LA0KPiA+ICsJCQkJCSAgPCZ0b3Bja2dlbg0KPiA+IENMS19UT1BfU1NVU0JfWEhDSV8z
UD47DQo+ID4gKwkJCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JnRvcGNrZ2VuDQo+ID4gQ0xL
X1RPUF9VTklWUExMX0Q1X0Q0PiwNCj4gPiArCQkJCQkJIDwmdG9wY2tnZW4NCj4gPiBDTEtfVE9Q
X1VOSVZQTExfRDVfRDQ+Ow0KPiA+ICsJCQljbG9ja3MgPSA8JnBlcmljZmdfYW8NCj4gPiBDTEtf
UEVSSV9BT19TU1VTQl8zUF9CVVM+LA0KPiA+ICsJCQkJIDwmcGVyaWNmZ19hbw0KPiA+IENMS19Q
RVJJX0FPX1NTVVNCXzNQX1hIQ0k+LA0KPiA+ICsJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9TU1VT
Ql9QM19SRUY+Ow0KPiA+ICsJCQljbG9jay1uYW1lcyA9ICJzeXNfY2siLCAieGhjaV9jayIsICJy
ZWZfY2siOw0KPiA+ICsJCQltZWRpYXRlayxzeXNjb24td2FrZXVwID0gPCZwZXJpY2ZnIDB4NDAw
IDEwNj47DQo+ID4gKwkJCXdha2V1cC1zb3VyY2U7DQo+ID4gKwkJCXVzYjItbHBtLWRpc2FibGU7
DQo+ID4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gKwkJfTsNCj4gPiArDQo+ID4gICAJ
CW5vcl9mbGFzaDogbm9yQDExMzJjMDAwIHsNCj4gPiAgIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ4MTk1LW5vciIsDQo+ID4gIm1lZGlhdGVrLG10ODE3My1ub3IiOw0KPiA+ICAgCQkJcmVn
ID0gPDAgMHgxMTMyYzAwMCAwIDB4MTAwMD47DQo+ID4gDQo+IA0KPiBSZWdhcmRzLA0KPiAtIEFu
Z2Vsbw0K

