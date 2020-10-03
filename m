Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07052821CB
	for <lists+linux-usb@lfdr.de>; Sat,  3 Oct 2020 08:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbgJCGIF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Oct 2020 02:08:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:33592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgJCGIF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 3 Oct 2020 02:08:05 -0400
Received: from saruman (91-155-214-30.elisa-laajakaista.fi [91.155.214.30])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F6F9206DD;
        Sat,  3 Oct 2020 06:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601705284;
        bh=o+Xt6lOesTuVXUr0tBaf0ZxxkIERyNCyMlNyvdfJNQw=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=dON61oHvYPAtqB3Po5c88ximxgUuyaNJKYvq9Qy8YNMNUolmGgq1U1EgF3Hz+oCnM
         oncRykCbDt19ljl18Sr4QJXJUBEVyKL3TeUH9fx8a+S03V4mJBNnwHWQPkUoUV8LUH
         ngq6TJn7wDGX4K9JZSV2QgHjkKXPWA/lsxZpj0L4=
From:   Felipe Balbi <balbi@kernel.org>
To:     Sid Spry <sid@aeam.us>, linux-usb@vger.kernel.org
Subject: Re: ConfigFS: bcdUSB forced to 0x0210
In-Reply-To: <7d974f24-c297-4e4f-97aa-76ae85f897db@www.fastmail.com>
References: <ce4fc6f6-726e-48b3-97bb-0de2b3801615@www.fastmail.com>
 <87k0wd9jog.fsf@kernel.org>
 <8baba7f6-35aa-49a6-89eb-f57164cab41f@www.fastmail.com>
 <87ft6xxgls.fsf@kernel.org>
 <7d974f24-c297-4e4f-97aa-76ae85f897db@www.fastmail.com>
Date:   Sat, 03 Oct 2020 09:07:57 +0300
Message-ID: <87d01zyh8i.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

DQpIaSwNCg0KIlNpZCBTcHJ5IiA8c2lkQGFlYW0udXM+IHdyaXRlczoNCj4+ID4+ICJTaWQgU3By
eSIgPHNpZEBhZWFtLnVzPiB3cml0ZXM6DQo+PiA+PiA+IEhpLCBJIGNhbid0IGVuYWJsZSBVU0Iz
IHdpdGggZS5nLiBmX25jbSBiZWNhdXNlIGJjZFVTQiBpcyBhbHdheXMgcmVzZXQgdG8gMHgwMjEw
Og0KPj4gPj4gPg0KPj4gPj4gPiAkIHN1ZG8gc2ggLWMgJ2VjaG8gIjB4MDMwMCIgPiAvc3lzL2tl
cm5lbC9jb25maWcvdXNiX2dhZGdldC9nMTEvYmNkVVNCJw0KPj4gPj4gPiAkIGNhdCAvc3lzL2tl
cm5lbC9jb25maWcvdXNiX2dhZGdldC9nMTEvYmNkVVNCIA0KPj4gPj4gPiAweDAzMDANCj4+ID4+
ID4gJCBzdWRvIHNoIC1jICdlY2hvICJmZTgwMDAwMC51c2IiID4gL3N5cy9rZXJuZWwvY29uZmln
L3VzYl9nYWRnZXQvZzExL1VEQycNCj4+ID4+ID4gJCBjYXQgL3N5cy9rZXJuZWwvY29uZmlnL3Vz
Yl9nYWRnZXQvZzExL2JjZFVTQiANCj4+ID4+ID4gMHgwMjEwDQo+PiA+PiA+ICQgdHJlZSAvc3lz
L2tlcm5lbC9jb25maWcvdXNiX2dhZGdldC9nMTENCj4+ID4+ID4gL3N5cy9rZXJuZWwvY29uZmln
L3VzYl9nYWRnZXQvZzExDQo+PiA+PiA+IOKUnOKUgOKUgCBiY2REZXZpY2UNCj4+ID4+ID4g4pSc
4pSA4pSAIGJjZFVTQg0KPj4gPj4gPiDilJzilIDilIAgYkRldmljZUNsYXNzDQo+PiA+PiA+IOKU
nOKUgOKUgCBiRGV2aWNlUHJvdG9jb2wNCj4+ID4+ID4g4pSc4pSA4pSAIGJEZXZpY2VTdWJDbGFz
cw0KPj4gPj4gPiDilJzilIDilIAgYk1heFBhY2tldFNpemUwDQo+PiA+PiA+IOKUnOKUgOKUgCBj
b25maWdzDQo+PiA+PiA+IOKUgsKgwqAg4pSU4pSA4pSAIGMuMQ0KPj4gPj4gPiDilILCoMKgICAg
ICDilJzilIDilIAgYm1BdHRyaWJ1dGVzDQo+PiA+PiA+IOKUgsKgwqAgICAgIOKUnOKUgOKUgCBN
YXhQb3dlcg0KPj4gPj4gPiDilILCoMKgICAgICDilJzilIDilIAgbmNtLjAgLT4gLi4vLi4vLi4v
Li4vdXNiX2dhZGdldC9nMTEvZnVuY3Rpb25zL25jbS4wDQo+PiA+PiA+IOKUgsKgwqAgICAgIOKU
lOKUgOKUgCBzdHJpbmdzDQo+PiA+PiA+IOKUgsKgwqAgICAgICAgICDilJTilIDilIAgMHg0MDkN
Cj4+ID4+ID4g4pSCwqDCoCAgICAgICAgICAgICDilJTilIDilIAgY29uZmlndXJhdGlvbg0KPj4g
Pj4gPiDilJzilIDilIAgZnVuY3Rpb25zDQo+PiA+PiA+IOKUgsKgwqAg4pSU4pSA4pSAIG5jbS4w
DQo+PiA+PiA+IOKUgsKgwqAgICAgIOKUnOKUgOKUgCBkZXZfYWRkcg0KPj4gPj4gPiDilILCoMKg
ICAgICDilJzilIDilIAgaG9zdF9hZGRyDQo+PiA+PiA+IOKUgsKgwqAgICAgIOKUnOKUgOKUgCBp
Zm5hbWUNCj4+ID4+ID4g4pSCwqDCoCAgICAg4pSc4pSA4pSAIG9zX2Rlc2MNCj4+ID4+ID4g4pSC
wqDCoCAgICAg4pSCwqDCoCDilJTilIDilIAgaW50ZXJmYWNlLm5jbQ0KPj4gPj4gPiDilILCoMKg
ICAgICDilILCoMKgICAgICDilJzilIDilIAgY29tcGF0aWJsZV9pZA0KPj4gPj4gPiDilILCoMKg
ICAgICDilILCoMKgICAgICDilJTilIDilIAgc3ViX2NvbXBhdGlibGVfaWQNCj4+ID4+ID4g4pSC
wqDCoCAgICAg4pSU4pSA4pSAIHFtdWx0DQo+PiA+PiA+IOKUnOKUgOKUgCBpZFByb2R1Y3QNCj4+
ID4+ID4g4pSc4pSA4pSAIGlkVmVuZG9yDQo+PiA+PiA+IOKUnOKUgOKUgCBtYXhfc3BlZWQNCj4+
ID4+ID4g4pSc4pSA4pSAIG9zX2Rlc2MNCj4+ID4+ID4g4pSCwqDCoCDilJzilIDilIAgYl92ZW5k
b3JfY29kZQ0KPj4gPj4gPiDilILCoMKgIOKUnOKUgOKUgCBxd19zaWduDQo+PiA+PiA+IOKUgsKg
wqAg4pSU4pSA4pSAIHVzZQ0KPj4gPj4gPiDilJzilIDilIAgc3RyaW5ncw0KPj4gPj4gPiDilILC
oMKgIOKUlOKUgOKUgCAweDQwOQ0KPj4gPj4gPiDilILCoMKgICAgICDilJzilIDilIAgbWFudWZh
Y3R1cmVyDQo+PiA+PiA+IOKUgsKgwqAgICAgIOKUnOKUgOKUgCBwcm9kdWN0DQo+PiA+PiA+IOKU
gsKgwqAgICAgIOKUlOKUgOKUgCBzZXJpYWxudW1iZXINCj4+ID4+ID4g4pSU4pSA4pSAIFVEQw0K
Pj4gPj4gPg0KPj4gPj4gPiBCb2FyZCBpcyBhIFJLMzM5OSBiYXNlZCBSb2NrUHJvNjQuDQo+PiA+
PiANCj4+ID4+IHdoYXQncyB5b3VyIG1heF9zcGVlZD8NCj4+ID4+IA0KPj4gPg0KPj4gPiAkIGNh
dCAvc3lzL2tlcm5lbC9jb25maWcvdXNiX2dhZGdldC9nMTEvbWF4X3NwZWVkIA0KPj4gPiBzdXBl
ci1zcGVlZA0KPj4gPg0KPj4gPiBMb29rcyBvay4gRnJvbSBXaW5kb3dzLCB0aGUgeEhDSSBkcml2
ZXIgcmVwb3J0cyB0aGF0IHRoZSBkZXZpY2Ugc3VwcG9ydHMNCj4+ID4gc3VwZXIgc3BlZWQgYnV0
IGNob29zZXMgaGlnaCBzcGVlZC4gSSBjYW4ndCBzZWUgdGhpcyBpbmZvIGZyb20gYSBMaW51eCBo
b3N0Lg0KPj4gDQo+PiBJdCdzIHByb2JhYmx5IGZhaWxpbmcgUnguRGV0ZWN0IGFuZCBmYWxsaW5n
IGJhY2sgdG8gaGlnaC1zcGVlZC4gV2hpY2gNCj4+IFVTQiBQZXJpcGhlcmFsIENvbnRyb2xsZXIg
aXMgdGhhdD8NCj4+IA0KPg0KPiBJdCdzIGEgZHdjMy4gSSByZWNlbnRseSBmb3VuZCB0aGF0IGlm
IEkgcGx1ZyB0aGUgZGV2aWNlIGludG8gaXRzZWxmICh0aGVyZSBhcmUgdHdvDQo+IGR3YzMsIG9u
ZSBvbiBhIEMgcG9ydCwgb25lIG9uIGEgZmVtYWxlIEEgcG9ydCkgdGhlIGRldmljZSBlbnVtZXJh
dGVzIGF0DQo+IHN1cGVyc3BlZWQgd2l0aCB0aGUgTkNNIGNvbmZpZ2ZzIGRyaXZlci4gQnV0IGNv
bm5lY3RpbmcgdG8gbXkgeDg2IG1hY2hpbmVzDQo+IGZhaWxzLg0KPg0KPiBJbiBhbiBlYXJsaWVy
IHRocmVhZCBJIGZvdW5kIHRoYXQgdGhlIHR5cGUgQyBwb3J0IHdvdWxkIG5vdCB3b3JrIHdpdGgg
VVNCMg0KPiBvciAzIGlmIGluIHRoZSAibm9ybWFsIiBkaXJlY3Rpb24gKGFzIG9wcG9zZWQgdG8g
InJldmVyc2VkIikuDQoNCnNvdW5kcyBsaWtlIGEgYm9hcmQgbGF5b3V0IHByb2JsZW0gdG8gbWUu
IENhbiB5b3UgY2FwdHVyZSBkd2MzDQp0cmFjZXBvaW50cz8gTW9yZSBpbmZvcm1hdGlvbiBoZXJl
Og0KaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvZHJpdmVyLWFwaS91c2Iv
ZHdjMy5odG1sI3JlcG9ydGluZy1idWdzDQoNCi0tIA0KYmFsYmkNCg==

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl94FT0RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbJJBAAs30Lz4oxwiD5UfR1Sc14EhDjZJkXhfmI
R/IquHUq7B7m6q4Mo9job/Mi7Aw2qL5EP3KrAgV1Ff7eks4QP8ukCj3MT+1b1FOJ
bQxaU/zNY8kUnienZWnfIGs0k6epw95RaHmDNyn/yi+FsrDXIxiWYm89Dua2OvOC
8fCXaZhx9U/TGFlMIffvfHRF7TWdHGJtooftAE9zd2Hwe7xCu5Oh6va4i33UPAze
pOvGWWBbjJFcg9lydameN1INP3KpzA/Z/TozT2ubeWzUCSa/NzEIIAuUsRL46jrm
j7FLPEI977aT4FfdaQ4gQaVDqjrWbcmUAnQLQW4c6XeFHyoHchkG4ztK+J45otCo
v2SO+cWCz3rDCiA7T5PCqNdFkBNo9/Q9uY6pD873CGVrmy8a5HDYuGFuJH0IYD/7
hhMUhNbt30i533CmEY6QTZc/ByV9iXStrE1k/xdmqZv9x4Pp1Obd+vNI6MdmbP/n
Su8W9y1nZjoVQNImG/MkJMNZkaRMITrLct2XkuU6hVa2RA4zRevgrlejiY7PD/sp
XGBZuOLt0ZZlvwPcWCa/SE0VfCmuikm6qvBfH8Fx8Gyv+asX1WGDKQ2SlzuF/QfH
0/hGzUhzF3aidMDSmt4bRHI4LY8EIqw6XXStB8RFUwc+yBMllHvIUf8xs57pRlZU
sW4SIRn/6iw=
=r9D+
-----END PGP SIGNATURE-----
--=-=-=--
