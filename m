Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3631927BD31
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 08:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgI2GdL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 02:33:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:54582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgI2GdL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Sep 2020 02:33:11 -0400
Received: from saruman (91-155-214-30.elisa-laajakaista.fi [91.155.214.30])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 778BC2083B;
        Tue, 29 Sep 2020 06:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601361190;
        bh=m6DyyF/+B8MZw4H7/njgsE8QaGZ5PWJb9jKdWOjhJp4=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=v6Ht8y68XR+vB5oX9CBCeszJPrCjcE1ySSzD1yyF7KiPuFeAexqYPAedfTM8tFn5X
         zzpF5ETMX0TyBhrl5zpiknll0n+AzLZgsbavIA4Jsl/UFvPzhMwoxm+yB9VvdB8ZMn
         psPQPqZtKxu0Obnm+EC98b6GqVYlyD7B6QBUwjIo=
From:   Felipe Balbi <balbi@kernel.org>
To:     Sid Spry <sid@aeam.us>, linux-usb@vger.kernel.org
Subject: Re: ConfigFS: bcdUSB forced to 0x0210
In-Reply-To: <ce4fc6f6-726e-48b3-97bb-0de2b3801615@www.fastmail.com>
References: <ce4fc6f6-726e-48b3-97bb-0de2b3801615@www.fastmail.com>
Date:   Tue, 29 Sep 2020 09:33:03 +0300
Message-ID: <87k0wd9jog.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

DQpIaSwNCg0KIlNpZCBTcHJ5IiA8c2lkQGFlYW0udXM+IHdyaXRlczoNCj4gSGksIEkgY2FuJ3Qg
ZW5hYmxlIFVTQjMgd2l0aCBlLmcuIGZfbmNtIGJlY2F1c2UgYmNkVVNCIGlzIGFsd2F5cyByZXNl
dCB0byAweDAyMTA6DQo+DQo+ICQgc3VkbyBzaCAtYyAnZWNobyAiMHgwMzAwIiA+IC9zeXMva2Vy
bmVsL2NvbmZpZy91c2JfZ2FkZ2V0L2cxMS9iY2RVU0InDQo+ICQgY2F0IC9zeXMva2VybmVsL2Nv
bmZpZy91c2JfZ2FkZ2V0L2cxMS9iY2RVU0IgDQo+IDB4MDMwMA0KPiAkIHN1ZG8gc2ggLWMgJ2Vj
aG8gImZlODAwMDAwLnVzYiIgPiAvc3lzL2tlcm5lbC9jb25maWcvdXNiX2dhZGdldC9nMTEvVURD
Jw0KPiAkIGNhdCAvc3lzL2tlcm5lbC9jb25maWcvdXNiX2dhZGdldC9nMTEvYmNkVVNCIA0KPiAw
eDAyMTANCj4gJCB0cmVlIC9zeXMva2VybmVsL2NvbmZpZy91c2JfZ2FkZ2V0L2cxMQ0KPiAvc3lz
L2tlcm5lbC9jb25maWcvdXNiX2dhZGdldC9nMTENCj4g4pSc4pSA4pSAIGJjZERldmljZQ0KPiDi
lJzilIDilIAgYmNkVVNCDQo+IOKUnOKUgOKUgCBiRGV2aWNlQ2xhc3MNCj4g4pSc4pSA4pSAIGJE
ZXZpY2VQcm90b2NvbA0KPiDilJzilIDilIAgYkRldmljZVN1YkNsYXNzDQo+IOKUnOKUgOKUgCBi
TWF4UGFja2V0U2l6ZTANCj4g4pSc4pSA4pSAIGNvbmZpZ3MNCj4g4pSCwqDCoCDilJTilIDilIAg
Yy4xDQo+IOKUgsKgwqAgICAgIOKUnOKUgOKUgCBibUF0dHJpYnV0ZXMNCj4g4pSCwqDCoCAgICAg
4pSc4pSA4pSAIE1heFBvd2VyDQo+IOKUgsKgwqAgICAgIOKUnOKUgOKUgCBuY20uMCAtPiAuLi8u
Li8uLi8uLi91c2JfZ2FkZ2V0L2cxMS9mdW5jdGlvbnMvbmNtLjANCj4g4pSCwqDCoCAgICAg4pSU
4pSA4pSAIHN0cmluZ3MNCj4g4pSCwqDCoCAgICAgICAgIOKUlOKUgOKUgCAweDQwOQ0KPiDilILC
oMKgICAgICAgICAgICAgIOKUlOKUgOKUgCBjb25maWd1cmF0aW9uDQo+IOKUnOKUgOKUgCBmdW5j
dGlvbnMNCj4g4pSCwqDCoCDilJTilIDilIAgbmNtLjANCj4g4pSCwqDCoCAgICAg4pSc4pSA4pSA
IGRldl9hZGRyDQo+IOKUgsKgwqAgICAgIOKUnOKUgOKUgCBob3N0X2FkZHINCj4g4pSCwqDCoCAg
ICAg4pSc4pSA4pSAIGlmbmFtZQ0KPiDilILCoMKgICAgICDilJzilIDilIAgb3NfZGVzYw0KPiDi
lILCoMKgICAgICDilILCoMKgIOKUlOKUgOKUgCBpbnRlcmZhY2UubmNtDQo+IOKUgsKgwqAgICAg
IOKUgsKgwqAgICAgIOKUnOKUgOKUgCBjb21wYXRpYmxlX2lkDQo+IOKUgsKgwqAgICAgIOKUgsKg
wqAgICAgIOKUlOKUgOKUgCBzdWJfY29tcGF0aWJsZV9pZA0KPiDilILCoMKgICAgICDilJTilIDi
lIAgcW11bHQNCj4g4pSc4pSA4pSAIGlkUHJvZHVjdA0KPiDilJzilIDilIAgaWRWZW5kb3INCj4g
4pSc4pSA4pSAIG1heF9zcGVlZA0KPiDilJzilIDilIAgb3NfZGVzYw0KPiDilILCoMKgIOKUnOKU
gOKUgCBiX3ZlbmRvcl9jb2RlDQo+IOKUgsKgwqAg4pSc4pSA4pSAIHF3X3NpZ24NCj4g4pSCwqDC
oCDilJTilIDilIAgdXNlDQo+IOKUnOKUgOKUgCBzdHJpbmdzDQo+IOKUgsKgwqAg4pSU4pSA4pSA
IDB4NDA5DQo+IOKUgsKgwqAgICAgIOKUnOKUgOKUgCBtYW51ZmFjdHVyZXINCj4g4pSCwqDCoCAg
ICAg4pSc4pSA4pSAIHByb2R1Y3QNCj4g4pSCwqDCoCAgICAg4pSU4pSA4pSAIHNlcmlhbG51bWJl
cg0KPiDilJTilIDilIAgVURDDQo+DQo+IEJvYXJkIGlzIGEgUkszMzk5IGJhc2VkIFJvY2tQcm82
NC4NCg0Kd2hhdCdzIHlvdXIgbWF4X3NwZWVkPw0KDQotLSANCmJhbGJpDQo=

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9y1R8RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbmgA/9Egd1hA85Q33HjJKE9MeUEe+2hXS3npIY
9nwJsAgTUKw2wP+L7q16NK8+O8XRXmRhRF6xWb3zEETWGJlB/c0Ox5FFtBWG04Zc
hsVW4Q/orv7SKvBN2PBUr62hYHMSkMgTEQaXFfjjVQESeNtjcpghAYYlSav1L/AU
WjGdhoNCK4UpNaVb6fgxUiQpecmTvREAvMNPPmyX1lHwu6FJcoNpNbVVGLEfYrig
n9oEpU4d7actv+k7I530k4tpkZ32pdMvltXu8lz8Bvite6sNBlfB2hYdn60GKF/y
wNEh0wTsk0F2TV8NYhMWaBA/OVPn2s3c8l2KB0xQQ7lsonEEQeeQu5RuS7M52I6C
CJq62rnAwsBHlRomW/FfLe01xWfgfPrPWB0KQxjbILwwP2VvC2CUM49r+wCIBIQH
c5gNln4fvouhSy0NJ3lHkE9SsuAxZxKB0HsHPZ6SGc6WyNqyWlnpofuQzReR+p2n
KYjomz5lWRMryDV0u29Fb5HALsgITBvDBlimS3EOc3ABBqlUCi/JisEi3FBcoiY8
CTVZi57Zm/vxndZQvcG2gMOi8HMHIHPUhs365xWhzzbZH7Zgk/S9CbaOIEsb7pEH
3EXV09rWaiyn+RJNLIPlkLzi5WaUFoSSfa+k/stCE2vyV2qCinTa72e/Pz5ozlqq
xT1rAZcaqKc=
=q5ug
-----END PGP SIGNATURE-----
--=-=-=--
