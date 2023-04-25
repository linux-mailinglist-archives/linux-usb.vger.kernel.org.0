Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5E986EE2EB
	for <lists+linux-usb@lfdr.de>; Tue, 25 Apr 2023 15:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233730AbjDYN02 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 09:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjDYN01 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 09:26:27 -0400
Received: from www484.your-server.de (www484.your-server.de [78.47.237.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4F44ED9
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 06:26:25 -0700 (PDT)
Received: from sslproxy01.your-server.de ([78.46.139.224])
        by www484.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <k.graefe@gateware.de>)
        id 1prIFx-0002In-KE; Tue, 25 Apr 2023 14:58:53 +0200
Received: from [2003:ca:6730:e8f8:2015:edd6:c621:94ed]
        by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <k.graefe@gateware.de>)
        id 1prIFx-000AaG-CV; Tue, 25 Apr 2023 14:58:53 +0200
Message-ID: <f147dabd-5c39-31c2-0ff0-f72745d7cd3f@gateware.de>
Date:   Tue, 25 Apr 2023 14:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From:   =?UTF-8?Q?Konrad_Gr=c3=a4fe?= <k.graefe@gateware.de>
Subject: [PATCH] usb: gadget: u_ether: Fix host MAC address case
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PeYfxXGYqxNbY0Dbqr0IBGxd"
X-Authenticated-Sender: k.graefe@gateware.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26887/Tue Apr 25 09:23:39 2023)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PeYfxXGYqxNbY0Dbqr0IBGxd
Content-Type: multipart/mixed; boundary="------------TGaVQIKlZpFX9TeO7uZWHE4k";
 protected-headers="v1"
From: =?UTF-8?Q?Konrad_Gr=c3=a4fe?= <k.graefe@gateware.de>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
Message-ID: <f147dabd-5c39-31c2-0ff0-f72745d7cd3f@gateware.de>
Subject: [PATCH] usb: gadget: u_ether: Fix host MAC address case

--------------TGaVQIKlZpFX9TeO7uZWHE4k
Content-Type: multipart/mixed; boundary="------------W7JUdTDMC5HFTTdfL1XMbmOE"

--------------W7JUdTDMC5HFTTdfL1XMbmOE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpBcyB0aGUgQ0RDLUVDTSBzcGVjaWZpY2F0aW9uIHN0YXRlcyB0aGUgaG9zdCBNQUMgYWRk
cmVzcyBtdXN0IGJlIHNlbnQgdG8NCnRoZSBob3N0IGFzIGFuIHVwcGVyY2FzZSBoZXhhZGVj
aW1hbCBzdHJpbmc6DQogICAgIFRoZSBVbmljb2RlIGNoYXJhY3RlciBpcyBjaG9zZW4gZnJv
bSB0aGUgc2V0IG9mIHZhbHVlcyAzMGggdGhyb3VnaA0KICAgICAzOWggYW5kIDQxaCB0aHJv
dWdoIDQ2aCAoMC05IGFuZCBBLUYpLg0KDQpIb3dldmVyLCBzbnByaW50ZiguLiwgIiVwbSIs
IC4uKSBnZW5lcmF0ZXMgYSBsb3dlcmNhc2UgTUFDIGFkZHJlc3MNCnN0cmluZy4gV2hpbGUg
bW9zdCBob3N0IGRyaXZlcnMgYXJlIHRvbGVyYW50IHRvIHRoaXMsIFVzYk5jbS5zeXMgb24N
CldpbmRvd3MgMTAgaXMgbm90LiBJbnN0ZWFkIGl0IHVzZXMgYSBkaWZmZXJlbnQgTUFDIGFk
ZHJlc3Mgd2l0aCBhbGwNCmJ5dGVzIHNldCB0byB6ZXJvIGluY2x1ZGluZyBhbmQgYWZ0ZXIg
dGhlIGZpcnN0IGJ5dGUgY29udGFpbmluZyBhDQpsb3dlcmNhc2UgbGV0dGVyLiBPbiBXaW5k
b3dzIDExIE1pY3Jvc29mdCBmaXhlZCBpdCwgYnV0IGFwcGFyZW50bHkgdGhleQ0KZGlkIG5v
dCBiYWNrcG9ydCB0aGUgZml4Lg0KDQpUaGlzIGNoYW5nZSBmaXhlcyB0aGUgaXNzdWUgYnkg
dXBwZXItY2FzaW5nIHRoZSBNQUMgdG8gY29tcGx5IHdpdGggdGhlDQpzcGVjaWZpY2F0aW9u
Lg0KDQpTaWduZWQtb2ZmLWJ5OiBLb25yYWQgR3LDpGZlIDxrLmdyYWVmZUBnYXRld2FyZS5k
ZT4NCi0tLQ0KICBkcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdV9ldGhlci5jIHwgMTAg
KysrKysrKysrLQ0KICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQoNCg0K
--------------W7JUdTDMC5HFTTdfL1XMbmOE
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-gadget-u_ether-Fix-host-MAC-address-case.patch"
Content-Disposition: attachment;
 filename="0001-usb-gadget-u_ether-Fix-host-MAC-address-case.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBkcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdV9ldGhlci5jIGRyaXZl
cnMvdXNiL2dhZGdldC9mdW5jdGlvbi91X2V0aGVyLmMKaW5kZXggNjk1NmFkOGJhOGRkLi40
OWQyOWIwNGVmOTMgMTAwNjQ0Ci0tLSBkcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdV9l
dGhlci5jCisrKyBkcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdV9ldGhlci5jCkBAIC05
NTgsNiArOTU4LDcgQEAgRVhQT1JUX1NZTUJPTF9HUEwoZ2V0aGVyX2dldF9ob3N0X2FkZHIp
OwogaW50IGdldGhlcl9nZXRfaG9zdF9hZGRyX2NkYyhzdHJ1Y3QgbmV0X2RldmljZSAqbmV0
LCBjaGFyICpob3N0X2FkZHIsIGludCBsZW4pCiB7CiAJc3RydWN0IGV0aF9kZXYgKmRldjsK
KwlpbnQgaSwgc2xlbjsKIAogCWlmIChsZW4gPCAxMykKIAkJcmV0dXJuIC1FSU5WQUw7CkBA
IC05NjUsNyArOTY2LDE0IEBAIGludCBnZXRoZXJfZ2V0X2hvc3RfYWRkcl9jZGMoc3RydWN0
IG5ldF9kZXZpY2UgKm5ldCwgY2hhciAqaG9zdF9hZGRyLCBpbnQgbGVuKQogCWRldiA9IG5l
dGRldl9wcml2KG5ldCk7CiAJc25wcmludGYoaG9zdF9hZGRyLCBsZW4sICIlcG0iLCBkZXYt
Pmhvc3RfbWFjKTsKIAotCXJldHVybiBzdHJsZW4oaG9zdF9hZGRyKTsKKworCXNsZW4gPSBz
dHJsZW4oaG9zdF9hZGRyKTsKKworCWZvcihpID0gMDsgaSA8IHNsZW47IGkrKykgeworCQlo
b3N0X2FkZHJbaV0gPSB0b3VwcGVyKGhvc3RfYWRkcltpXSk7CisJfQorCisJcmV0dXJuIHNs
ZW47CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChnZXRoZXJfZ2V0X2hvc3RfYWRkcl9jZGMpOwog
Cgo=

--------------W7JUdTDMC5HFTTdfL1XMbmOE--

--------------TGaVQIKlZpFX9TeO7uZWHE4k--

--------------PeYfxXGYqxNbY0Dbqr0IBGxd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEUA99m0xJ9cFn0k9bgJOZiyvdweQFAmRHzo0FAwAAAAAACgkQgJOZiyvdweTQ
eQ//U97ndOFtw/KNhEch45srAN7w/fQaySeFCO9MziHpd4KtL6ycWBjDATRw4yvRGv4+z/p8q/H1
qHb+jC9wRKkT1v8cHanHeziLklfqMTpNJOaguttIT4nXBtEPtZIgjtrXHpVE9QOIE3cYvxtyWCZX
QiR7QxsZqwEq8/9wdAWWYK0tEV4FhZWnmiweDWYxEqLFuhfo4FLuq1NdNekwIWfpD+ouyXhuQiDo
TGGkNKmm/lw50cAJQ7wX5hQ1sxKZEH7kCZW+G5k9CwAWDQIttKFnCLUoMq+C9U8hMzKweVDtQ+Ek
ZhLBMuXmuGROyWd0A4Kgu+wbs95LT3/Uo3yC4IefbHOtEINyg+pt3+70LXgrkuIgpmVnN92XcKUu
RAYv6oKlBbTvnmJ7aopcAWnSKwhHI+A0GFO5Dag4beSpHB894ptyiAaI9oA77MaJLFZP0Iw0FzRA
yVrv1TPHEuISg9eYp/jMlt+EaUVEmMVlmWJxmJXX5h4tnRrSZRV6NGEWRuAsZls7oZ9wS2Lj8dls
2Qv3iiNniXCAF5vBD8mMInVxG1KItu7D83BhgSEYPmhtLljvbT+NFceVFhsMPFQNCDXQGpGHq9xf
QB9LV2sigGIYmNZjunuyVUUPce1SyekX3JipghGMqF02ufk3gisBjTWDaRrQ9ZaWyXfJcj1ZdsH8
xss=
=ec1s
-----END PGP SIGNATURE-----

--------------PeYfxXGYqxNbY0Dbqr0IBGxd--
