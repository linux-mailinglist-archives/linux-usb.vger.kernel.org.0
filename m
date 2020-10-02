Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A32280DAE
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 08:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgJBGyq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 02:54:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:48312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbgJBGyq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Oct 2020 02:54:46 -0400
Received: from saruman (91-155-214-30.elisa-laajakaista.fi [91.155.214.30])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B00A206DD;
        Fri,  2 Oct 2020 06:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601621685;
        bh=z4hrLfS2vbsNKuA/4CFaG1UIGVRS4fPgGADyjGM/3UU=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=mqm5tG2wZFAUQHwvREi9paYIQnAtqCyeqs3lRjvpdLz3boBauvUaL7OB9OlWC51xC
         uZccn3dzS1h69bDvRo7N7BH1aTsXOh9HT1pWJ077vE/71abh2rc83UKzhYWECe97vI
         p2m+W4uA3e1WVR3Vxkvqy5ya0XT19FwNGrSGNG4Q=
From:   Felipe Balbi <balbi@kernel.org>
To:     Sid Spry <sid@aeam.us>, linux-usb@vger.kernel.org
Subject: Re: ConfigFS: bcdUSB forced to 0x0210
In-Reply-To: <8baba7f6-35aa-49a6-89eb-f57164cab41f@www.fastmail.com>
References: <ce4fc6f6-726e-48b3-97bb-0de2b3801615@www.fastmail.com>
 <87k0wd9jog.fsf@kernel.org>
 <8baba7f6-35aa-49a6-89eb-f57164cab41f@www.fastmail.com>
Date:   Fri, 02 Oct 2020 09:54:39 +0300
Message-ID: <87ft6xxgls.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

DQpIaSwNCg0KIlNpZCBTcHJ5IiA8c2lkQGFlYW0udXM+IHdyaXRlczoNCj4gT24gVHVlLCBTZXAg
MjksIDIwMjAsIGF0IDE6MzMgQU0sIEZlbGlwZSBCYWxiaSB3cm90ZToNCj4+IA0KPj4gSGksDQo+
PiANCj4+ICJTaWQgU3ByeSIgPHNpZEBhZWFtLnVzPiB3cml0ZXM6DQo+PiA+IEhpLCBJIGNhbid0
IGVuYWJsZSBVU0IzIHdpdGggZS5nLiBmX25jbSBiZWNhdXNlIGJjZFVTQiBpcyBhbHdheXMgcmVz
ZXQgdG8gMHgwMjEwOg0KPj4gPg0KPj4gPiAkIHN1ZG8gc2ggLWMgJ2VjaG8gIjB4MDMwMCIgPiAv
c3lzL2tlcm5lbC9jb25maWcvdXNiX2dhZGdldC9nMTEvYmNkVVNCJw0KPj4gPiAkIGNhdCAvc3lz
L2tlcm5lbC9jb25maWcvdXNiX2dhZGdldC9nMTEvYmNkVVNCIA0KPj4gPiAweDAzMDANCj4+ID4g
JCBzdWRvIHNoIC1jICdlY2hvICJmZTgwMDAwMC51c2IiID4gL3N5cy9rZXJuZWwvY29uZmlnL3Vz
Yl9nYWRnZXQvZzExL1VEQycNCj4+ID4gJCBjYXQgL3N5cy9rZXJuZWwvY29uZmlnL3VzYl9nYWRn
ZXQvZzExL2JjZFVTQiANCj4+ID4gMHgwMjEwDQo+PiA+ICQgdHJlZSAvc3lzL2tlcm5lbC9jb25m
aWcvdXNiX2dhZGdldC9nMTENCj4+ID4gL3N5cy9rZXJuZWwvY29uZmlnL3VzYl9nYWRnZXQvZzEx
DQo+PiA+IOKUnOKUgOKUgCBiY2REZXZpY2UNCj4+ID4g4pSc4pSA4pSAIGJjZFVTQg0KPj4gPiDi
lJzilIDilIAgYkRldmljZUNsYXNzDQo+PiA+IOKUnOKUgOKUgCBiRGV2aWNlUHJvdG9jb2wNCj4+
ID4g4pSc4pSA4pSAIGJEZXZpY2VTdWJDbGFzcw0KPj4gPiDilJzilIDilIAgYk1heFBhY2tldFNp
emUwDQo+PiA+IOKUnOKUgOKUgCBjb25maWdzDQo+PiA+IOKUgsKgwqAg4pSU4pSA4pSAIGMuMQ0K
Pj4gPiDilILCoMKgICAgICDilJzilIDilIAgYm1BdHRyaWJ1dGVzDQo+PiA+IOKUgsKgwqAgICAg
IOKUnOKUgOKUgCBNYXhQb3dlcg0KPj4gPiDilILCoMKgICAgICDilJzilIDilIAgbmNtLjAgLT4g
Li4vLi4vLi4vLi4vdXNiX2dhZGdldC9nMTEvZnVuY3Rpb25zL25jbS4wDQo+PiA+IOKUgsKgwqAg
ICAgIOKUlOKUgOKUgCBzdHJpbmdzDQo+PiA+IOKUgsKgwqAgICAgICAgICDilJTilIDilIAgMHg0
MDkNCj4+ID4g4pSCwqDCoCAgICAgICAgICAgICDilJTilIDilIAgY29uZmlndXJhdGlvbg0KPj4g
PiDilJzilIDilIAgZnVuY3Rpb25zDQo+PiA+IOKUgsKgwqAg4pSU4pSA4pSAIG5jbS4wDQo+PiA+
IOKUgsKgwqAgICAgIOKUnOKUgOKUgCBkZXZfYWRkcg0KPj4gPiDilILCoMKgICAgICDilJzilIDi
lIAgaG9zdF9hZGRyDQo+PiA+IOKUgsKgwqAgICAgIOKUnOKUgOKUgCBpZm5hbWUNCj4+ID4g4pSC
wqDCoCAgICAg4pSc4pSA4pSAIG9zX2Rlc2MNCj4+ID4g4pSCwqDCoCAgICAg4pSCwqDCoCDilJTi
lIDilIAgaW50ZXJmYWNlLm5jbQ0KPj4gPiDilILCoMKgICAgICDilILCoMKgICAgICDilJzilIDi
lIAgY29tcGF0aWJsZV9pZA0KPj4gPiDilILCoMKgICAgICDilILCoMKgICAgICDilJTilIDilIAg
c3ViX2NvbXBhdGlibGVfaWQNCj4+ID4g4pSCwqDCoCAgICAg4pSU4pSA4pSAIHFtdWx0DQo+PiA+
IOKUnOKUgOKUgCBpZFByb2R1Y3QNCj4+ID4g4pSc4pSA4pSAIGlkVmVuZG9yDQo+PiA+IOKUnOKU
gOKUgCBtYXhfc3BlZWQNCj4+ID4g4pSc4pSA4pSAIG9zX2Rlc2MNCj4+ID4g4pSCwqDCoCDilJzi
lIDilIAgYl92ZW5kb3JfY29kZQ0KPj4gPiDilILCoMKgIOKUnOKUgOKUgCBxd19zaWduDQo+PiA+
IOKUgsKgwqAg4pSU4pSA4pSAIHVzZQ0KPj4gPiDilJzilIDilIAgc3RyaW5ncw0KPj4gPiDilILC
oMKgIOKUlOKUgOKUgCAweDQwOQ0KPj4gPiDilILCoMKgICAgICDilJzilIDilIAgbWFudWZhY3R1
cmVyDQo+PiA+IOKUgsKgwqAgICAgIOKUnOKUgOKUgCBwcm9kdWN0DQo+PiA+IOKUgsKgwqAgICAg
IOKUlOKUgOKUgCBzZXJpYWxudW1iZXINCj4+ID4g4pSU4pSA4pSAIFVEQw0KPj4gPg0KPj4gPiBC
b2FyZCBpcyBhIFJLMzM5OSBiYXNlZCBSb2NrUHJvNjQuDQo+PiANCj4+IHdoYXQncyB5b3VyIG1h
eF9zcGVlZD8NCj4+IA0KPg0KPiAkIGNhdCAvc3lzL2tlcm5lbC9jb25maWcvdXNiX2dhZGdldC9n
MTEvbWF4X3NwZWVkIA0KPiBzdXBlci1zcGVlZA0KPg0KPiBMb29rcyBvay4gRnJvbSBXaW5kb3dz
LCB0aGUgeEhDSSBkcml2ZXIgcmVwb3J0cyB0aGF0IHRoZSBkZXZpY2Ugc3VwcG9ydHMNCj4gc3Vw
ZXIgc3BlZWQgYnV0IGNob29zZXMgaGlnaCBzcGVlZC4gSSBjYW4ndCBzZWUgdGhpcyBpbmZvIGZy
b20gYSBMaW51eCBob3N0Lg0KDQpJdCdzIHByb2JhYmx5IGZhaWxpbmcgUnguRGV0ZWN0IGFuZCBm
YWxsaW5nIGJhY2sgdG8gaGlnaC1zcGVlZC4gV2hpY2gNClVTQiBQZXJpcGhlcmFsIENvbnRyb2xs
ZXIgaXMgdGhhdD8NCg0KLS0gDQpiYWxiaQ0K

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl92zq8RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYH0xAAwVgiZU4VWEsvzaqPjnvQDoU4bezZfiST
zbkoNAqcV1d4V/eo8sysCVidPAYoTYP9T1TA6uN5YSPhPBLLGCCf6E7N6i9xQx2j
muYSSwEKaSYnb+J43Sb1VPNq0PberN1VymSU7RdBkbIVSfwJHqX5cU15LL5cTJOl
fXo5FxcWHK2kNcFiAz9RXPYJdDYQ7Usc+mYh13QnXqEMOD37KzhQgrHKcgOZAdru
IgI0WQMFJCpZlt+90c8PytFNa5o/TzJ+xCvlzYmWTBTeWWaDTzI0OYpoUVEu07E0
7YkJ6rj+GZOl5aUwe3EW/rLtbcC73BqHMj45FJHS2SmZ1O7wV1qhgusf7bTC96t8
ygDj+KzfiOgySlklvzZE4fXZUyUNnv23Rd2cHv+7NEV/c+E5JhsGHyrMm53FQlwV
mekp5ERFMnh4XTH8J56JqfACbaWGbBfvVUpD1Mc5zAcfr6v3vHd2DSRI1oUhCrrS
QPy5OxAo5wdzVFZ6y7JcZVCHab37VvrOUov/5MCqLhg8T1nBb9r7QdJIdgshU/zL
Udt44TJ51sT6Ot34/P3cNQRBw5KmGE2FGJ2FVeJdpMHwbud6Lr+I7+qsinn8OhVe
jk3CBOuU9ECRxCTIAIlWP7hRS1OyFid1/G4jtHzwAHiUZSv/PB3hJvBD+g2l+kCJ
gP/7bx2Y1II=
=ydJc
-----END PGP SIGNATURE-----
--=-=-=--
