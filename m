Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA979783B
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 13:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfHULnn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 07:43:43 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:45357 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbfHULnn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 07:43:43 -0400
IronPort-SDR: 7qYMe52O+6+cX9ILn2VrcZ60xO8C5HqiR0DpY5fap19sNdVNaac9NichAbIzOx+kqIr0kNSsak
 obvrCpcg2cRBC8i2VxTxFNmvXvhy+lhwyI6ZFbHuzxDXW/z3a3DUmk8n+JxRQDmTNUmwgB2r3n
 lUzDdV1uwb/GmNpFpanUfnIdyjQHq3XevK11yk0BGpDy9SeAz/b56QM79tZF00XdKk4An4ctoJ
 N/dokn4sB8NphJX0SSGd55e0T7TK54hKvP3eUQ6BdfigSbfBVaJNzr+swKNfyUNQNmZ7tf0z2z
 3Xs=
X-IronPort-AV: E=Sophos;i="5.64,412,1559548800"; 
   d="scan'208";a="40633339"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 21 Aug 2019 03:43:41 -0800
IronPort-SDR: OdAxIr29+X1P4ZNhztEz8ldzboLQak8QMfuKYM2L71THKYTF1J6rMvlN58Al2ilEK1yXt1U3qp
 nPlidmnjSkEN370c/DVOoGngZFWSq/cunu4KkUFtMuQuVrkPJKISd36pD4XsCZ192ueiYJ9rKj
 qPMaS07yXhvJf1Aes6Rv0W0OxzfzqM6iQdjS6gZCikgVJPjVG/V/7f4QgqHBp0KOEc2jNevLcJ
 1neNhgoCHSM7HL2FYTJb//nnBMeXdB/dK2YN31+9CQ5uAKvFVwy26LLvv/KNhqIPU01Sxvy3Gc
 m78=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     "wharms@bfs.de" <wharms@bfs.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "greg@kroah.com" <greg@kroah.com>
Subject: AW: problems with Edgeport/416
Thread-Topic: problems with Edgeport/416
Thread-Index: AQHVWBIYNX3xNGRgBkW3E536acORx6cFehQg
Date:   Wed, 21 Aug 2019 11:43:36 +0000
Message-ID: <741cf63f72e443ba9158c9c123fcccc7@SVR-IES-MBX-03.mgc.mentorg.com>
References: <5D5D285D.3080908@bfs.de>
In-Reply-To: <5D5D285D.3080908@bfs.de>
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

SGkgV2FsdGVyLA0KDQppIGhhZCBhIHNpbWlsYXIgaXNzdWUgd2l0aCBhIGRpZmZlcmVudCBkZXZp
Y2UuDQpQbGVhc2UgY2hlY2ssIGlmIHlvdSBoYXZlIGR5bmFtaWMgZGVidWcgZW5hYmxlZCBpbiB5
b3VyIGtlcm5lbA0KKC9zeXMva2VybmVsL2RlYnVnL2R5bmFtaWNfZGVidWcvY29udHJvbCBleGlz
dHMpDQoNClRoZW4geW91IGNhbiBlbmFibGUgYWRkaXRpb25hbCBrZXJuZWwgbWVzc2FnZXMgdXNp
bmcNCmVjaG8gLW4gJ21vZHVsZSB4aGNpX2hjZCA9cCcgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9keW5h
bWljX2RlYnVnL2NvbnRyb2wNCmVjaG8gLW4gJ21vZHVsZSB1c2Jjb3JlID1wJyA+IC9zeXMva2Vy
bmVsL2RlYnVnL2R5bmFtaWNfZGVidWcvY29udHJvbA0KDQpDaGVjayB3aGljaCB1c2IgcmVsYXRl
ZCBtZXNzYWdlcyB5b3UgY2FuIGVuYWJsZSB0aHJvdWdoIHRoZSBkeW5hbWljX2RlYnVnLg0KKGRv
aW5nIGEgImNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9keW5hbWljX2RlYnVnL2NvbnRyb2wgfCBncmVw
IHVzYiIgaGVscHMgbXVjaCkNCg0KRmluYWxseSwgYSBmaW5lIHJlc291cmNlIGlzDQpodHRwczov
L3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y0LjExL2FkbWluLWd1aWRlL2R5bmFtaWMtZGVidWct
aG93dG8uaHRtbA0KDQpCZXN0IHJlZ2FyZHMNCkNhcnN0ZW4NCg0KPiAtLS0tLVVyc3Byw7xuZ2xp
Y2hlIE5hY2hyaWNodC0tLS0tDQo+IFZvbjogbGludXgtdXNiLW93bmVyQHZnZXIua2VybmVsLm9y
ZyBbbWFpbHRvOmxpbnV4LXVzYi0NCj4gb3duZXJAdmdlci5rZXJuZWwub3JnXSBJbSBBdWZ0cmFn
IHZvbiB3YWx0ZXIgaGFybXMNCj4gR2VzZW5kZXQ6IE1pdHR3b2NoLCAyMS4gQXVndXN0IDIwMTkg
MTM6MTgNCj4gQW46IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGdyZWdAa3JvYWgu
Y29tDQo+IEJldHJlZmY6IHByb2JsZW1zIHdpdGggRWRnZXBvcnQvNDE2DQo+IA0KPiBIZWxsbyBM
aXN0LA0KPiBkb2VzIHNvbWUgdXNlIGxpbnV4IHdpdGggYW4gRWRnZXBvcnQvNDE2ID8NCj4gDQo+
IEkgaGF2ZSBhIHN0cmFuZ2UgcHJvYmxlbS4gdGhlIGRldmljZSBpcyByZXNldHRpbmcgc29vbg0K
PiBhZnRlciBpIHN0YXJ0ZWQgdXNpbmcgaXQgKGJ1dCBub3QgaW1tZWRpYXRlbHkpLg0KPiBJIGRv
IG5vdCBzZWUgYSBrZXJuZWwgT09QUyBidXQgYSBjb21tb24gcGF0dGVybiBpczoNCj4gDQo+IDIw
MTktMDgtMjBUMTU6MTk6MzkuODI1ODEyKzAwOjAwIG9tbmZybW8xMCBrZXJuZWw6IFs2ODMyNzAu
NjU4NjIzXSB1c2INCj4gNy0xLjEuMjogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTEsIFBy
b2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCj4gMjAxOS0wOC0yMFQxNToxOTozOS44MjU4MTgrMDA6
MDAgb21uZnJtbzEwIGtlcm5lbDogWzY4MzI3MC42NTg2MjZdIHVzYg0KPiA3LTEuMS4yOiBQcm9k
dWN0OiBFZGdlcG9ydC80MTYNCj4gMjAxOS0wOC0yMFQxNToxOTozOS44MjU4MjErMDA6MDAgb21u
ZnJtbzEwIGtlcm5lbDogWzY4MzI3MC42NTg2MjhdIHVzYg0KPiA3LTEuMS4yOiBNYW51ZmFjdHVy
ZXI6IERpZ2kgSW50ZXJuYXRpb25hbA0KPiAyMDE5LTA4LTIwVDE1OjE5OjM5LjgyNTgyMyswMDow
MCBvbW5mcm1vMTAga2VybmVsOiBbNjgzMjcwLjY1ODYzMF0gdXNiDQo+IDctMS4xLjI6IFNlcmlh
bE51bWJlcjogRTYzOTY2MTAwLTENCj4gMjAxOS0wOC0yMFQxNToxOTozOS45ODU1NzErMDA6MDAg
b21uZnJtbzEwIGtlcm5lbDogWzY4MzI3MC44MTc5MDldIHVzYg0KPiA3LTEuMS4yOiBFZGdlcG9y
dCBUSSAyIHBvcnQgYWRhcHRlciBjb252ZXJ0ZXIgbm93IGF0dGFjaGVkIHRvIHR0eVVTQjQNCj4g
MjAxOS0wOC0yMFQxNToxOTozOS45ODU1OTQrMDA6MDAgb21uZnJtbzEwIGtlcm5lbDogWzY4MzI3
MC44MTgxMzJdIHVzYg0KPiA3LTEuMS4yOiBFZGdlcG9ydCBUSSAyIHBvcnQgYWRhcHRlciBjb252
ZXJ0ZXIgbm93IGF0dGFjaGVkIHRvIHR0eVVTQjUNCj4gMjAxOS0wOC0yMFQxNToxOTo0MC4wMDc5
NDMrMDA6MDAgb21uZnJtbzEwIG10cC1wcm9iZTogY2hlY2tpbmcgYnVzIDcsDQo+IGRldmljZSA4
ODogIi9zeXMvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MWQuMS91c2I3LzctMS83LTEuMS83
LTEuMS4yIg0KPiAyMDE5LTA4LTIwVDE1OjE5OjQwLjA1Mzc1MCswMDowMCBvbW5mcm1vMTAga2Vy
bmVsOiBbNjgzMjcwLjg4NTYyNl0gdXNiDQo+IDctMS4yLjI6IE5ldyBVU0IgZGV2aWNlIGZvdW5k
LCBpZFZlbmRvcj0xNjA4LCBpZFByb2R1Y3Q9MDI0Nw0KPiAyMDE5LTA4LTIwVDE1OjE5OjQwLjA1
Mzc5MSswMDowMCBvbW5mcm1vMTAga2VybmVsOiBbNjgzMjcwLjg4NTYzMF0gdXNiDQo+IDctMS4y
LjI6IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1mcj0xLCBQcm9kdWN0PTIsIFNlcmlhbE51bWJl
cj0zDQo+IDIwMTktMDgtMjBUMTU6MTk6NDAuMDUzNzk3KzAwOjAwIG9tbmZybW8xMCBrZXJuZWw6
IFs2ODMyNzAuODg1NjMzXSB1c2INCj4gNy0xLjIuMjogUHJvZHVjdDogRWRnZXBvcnQvNDE2DQo+
IDIwMTktMDgtMjBUMTU6MTk6NDAuMDUzODAwKzAwOjAwIG9tbmZybW8xMCBrZXJuZWw6IFs2ODMy
NzAuODg1NjM1XSB1c2INCj4gNy0xLjIuMjogTWFudWZhY3R1cmVyOiBEaWdpIEludGVybmF0aW9u
YWwNCj4gMjAxOS0wOC0yMFQxNToxOTo0MC4wNTM4MDMrMDA6MDAgb21uZnJtbzEwIGtlcm5lbDog
WzY4MzI3MC44ODU2MzddIHVzYg0KPiA3LTEuMi4yOiBTZXJpYWxOdW1iZXI6IEU2Mzk2NjEwMC01
DQo+IDIwMTktMDgtMjBUMTU6MTk6NDAuMDY1NTY5KzAwOjAwIG9tbmZybW8xMCBrZXJuZWw6IFs2
ODMyNzAuODk3NDA2XSB1c2INCj4gNy0xLjEuMzogbmV3IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBu
dW1iZXIgOTAgdXNpbmcgdWhjaV9oY2QNCj4gMjAxOS0wOC0yMFQxNToxOTo0MC4yMTM1NjkrMDA6
MDAgb21uZnJtbzEwIGtlcm5lbDogWzY4MzI3MS4wNDYzMTZdIHVzYg0KPiA3LTEuMi4yOiBFZGdl
cG9ydCBUSSAyIHBvcnQgYWRhcHRlciBjb252ZXJ0ZXIgbm93IGF0dGFjaGVkIHRvIHR0eVVTQjYN
Cj4gMjAxOS0wOC0yMFQxNToxOTo0MC4yMTM1OTQrMDA6MDAgb21uZnJtbzEwIGtlcm5lbDogWzY4
MzI3MS4wNDY3ODJdIHVzYg0KPiA3LTEuMi4yOiBFZGdlcG9ydCBUSSAyIHBvcnQgYWRhcHRlciBj
b252ZXJ0ZXIgbm93IGF0dGFjaGVkIHRvIHR0eVVTQjcNCj4gMjAxOS0wOC0yMFQxNToxOTo0MC4y
NDIwMzQrMDA6MDAgb21uZnJtbzEwIG10cC1wcm9iZTogY2hlY2tpbmcgYnVzIDcsDQo+IGRldmlj
ZSA4OTogIi9zeXMvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MWQuMS91c2I3LzctMS83LTEu
Mi83LTEuMi4yIg0KPiAyMDE5LTA4LTIwVDE1OjE5OjQwLjMwMTU3OCswMDowMCBvbW5mcm1vMTAg
a2VybmVsOiBbNjgzMjcxLjEzMzM4MF0gdXNiDQo+IDctMS4yLjM6IG5ldyBmdWxsLXNwZWVkIFVT
QiBkZXZpY2UgbnVtYmVyIDkxIHVzaW5nIHVoY2lfaGNkDQo+IDIwMTktMDgtMjBUMTU6MTk6NDAu
MzU3NTU5KzAwOjAwIG9tbmZybW8xMCBrZXJuZWw6IFs2ODMyNzEuMTkyODE1XSB1c2INCj4gNy0x
LjEuMzogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTE2MDgsIGlkUHJvZHVjdD0wMjQ3
DQo+IDIwMTktMDgtMjBUMTU6MTk6NDAuMzU3NTg0KzAwOjAwIG9tbmZybW8xMCBrZXJuZWw6IFs2
ODMyNzEuMTkyODIwXSB1c2INCj4gNy0xLjEuMzogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZy
PTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCj4gMjAxOS0wOC0yMFQxNToxOTo0MC4zNTc1
ODgrMDA6MDAgb21uZnJtbzEwIGtlcm5lbDogWzY4MzI3MS4xOTI4MjJdIHVzYg0KPiA3LTEuMS4z
OiBQcm9kdWN0OiBFZGdlcG9ydC80MTYNCj4gMjAxOS0wOC0yMFQxNToxOTo0MC4zNTc1OTErMDA6
MDAgb21uZnJtbzEwIGtlcm5lbDogWzY4MzI3MS4xOTI4MjVdIHVzYg0KPiA3LTEuMS4zOiBNYW51
ZmFjdHVyZXI6IERpZ2kgSW50ZXJuYXRpb25hbA0KPiAyMDE5LTA4LTIwVDE1OjE5OjQwLjM1NzU5
MyswMDowMCBvbW5mcm1vMTAga2VybmVsOiBbNjgzMjcxLjE5MjgyN10gdXNiDQo+IDctMS4xLjM6
IFNlcmlhbE51bWJlcjogRTYzOTY2MTAwLTINCj4gMjAxOS0wOC0yMFQxNToxOTo0MC41MTM3MDIr
MDA6MDAgb21uZnJtbzEwIGtlcm5lbDogWzY4MzI3MS4zNDkxMDNdIHVzYg0KPiA3LTEuMS4zOiBF
ZGdlcG9ydCBUSSAyIHBvcnQgYWRhcHRlciBjb252ZXJ0ZXIgbm93IGF0dGFjaGVkIHRvIHR0eVVT
QjgNCj4gMjAxOS0wOC0yMFQxNToxOTo0MC41MTM3MjUrMDA6MDAgb21uZnJtbzEwIGtlcm5lbDog
WzY4MzI3MS4zNDkzMTFdIHVzYg0KPiA3LTEuMS4zOiBFZGdlcG9ydCBUSSAyIHBvcnQgYWRhcHRl
ciBjb252ZXJ0ZXIgbm93IGF0dGFjaGVkIHRvIHR0eVVTQjkNCj4gMjAxOS0wOC0yMFQxNToxOTo0
MC41MzcxMzgrMDA6MDAgb21uZnJtbzEwIG10cC1wcm9iZTogY2hlY2tpbmcgYnVzIDcsDQo+IGRl
dmljZSA5MDogIi9zeXMvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MWQuMS91c2I3LzctMS83
LTEuMS83LTEuMS4zIg0KPiAyMDE5LTA4LTIwVDE1OjE5OjQwLjYwMTc1NCswMDowMCBvbW5mcm1v
MTAga2VybmVsOiBbNjgzMjcxLjQzMzM4OV0gdXNiDQo+IDctMS4xLjQ6IG5ldyBmdWxsLXNwZWVk
IFVTQiBkZXZpY2UgbnVtYmVyIDkyIHVzaW5nIHVoY2lfaGNkDQo+IDIwMTktMDgtMjBUMTU6MTk6
NDAuNjAxNzk0KzAwOjAwIG9tbmZybW8xMCBrZXJuZWw6IFs2ODMyNzEuNDMzNjMxXSB1c2INCj4g
Ny0xLjIuMzogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTE2MDgsIGlkUHJvZHVjdD0w
MjQ3DQo+IDIwMTktMDgtMjBUMTU6MTk6NDAuNjAxNzk4KzAwOjAwIG9tbmZybW8xMCBrZXJuZWw6
IFs2ODMyNzEuNDMzNjM0XSB1c2INCj4gNy0xLjIuMzogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczog
TWZyPTEsIFByb2R1Yw0KPiANCj4gDQo+IEkgZGlkIHNvbWUgZXhwZXJpbWVudHMgKGNoYW5naW5n
IGNhYmxlcyBldGMpIGJ1dCBhbHdheXMgdGhlIHNhbWUuIEJ1dCB3aGVuDQo+IHRlc3RlZCB3aXRo
IGEgd2luZG93cyBzeXN0ZW0gaXQgd29ya2VkIGFsbCBmaW5lLg0KPiBsYXRlciBpIHVzZWQgYSBz
aW5nbGUgcG9ydCBVU0ItPlNlcmlhbCBhbmQgYWxsIHdvcmtlZCBhcyBleHBlY3RlZC4NCj4gDQo+
IEkgdGVzdGVkIHdpdGg6IE9wZW5zdXNlIDE1LjEgb24gYSBERUxMIGxhdGl0dWRlIEU1NDAwDQo+
IA0KPiB1bmFtZSAtYQ0KPiBMaW51eCBvbW5mcm1vMTAgNC4xMi4xNC1scDE1MS4yOC4xMC12YW5p
bGxhICMxIFNNUCBTYXQgSnVsIDEzIDE3OjU5OjMxIFVUQw0KPiAyMDE5ICgwYWIwM2I3KSB4ODZf
NjQgeDg2XzY0IHg4Nl82NCBHTlUvTGludXgNCj4gDQo+IEkgd291bGQgbGlrZSB0byBpbXByb3Zl
IHRoZSBzaXR1YXRpb24sIGRvZXMgYW55b25lIGhhcyB0aGF0IGRldmljZSA/IGFueSBoaW50cw0K
PiB3aGF0IHRvIGxvb2sgYXQgPw0KPiANCj4gcGxlYXNlIHJlcGx5IGRpcmVjdCwgaSBhbSBub3Qg
bWVtYmVyIG9mIHRoaXMgbGlzdC4NCj4gDQo+IHJlLA0KPiAgd2gNCj4gDQo+IA0KPiANCj4gDQo+
IA0KPiANCj4gDQoNCg==
