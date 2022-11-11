Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A03A6260FB
	for <lists+linux-usb@lfdr.de>; Fri, 11 Nov 2022 19:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233739AbiKKSWe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Nov 2022 13:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232851AbiKKSWd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Nov 2022 13:22:33 -0500
X-Greylist: delayed 487 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Nov 2022 10:22:30 PST
Received: from norsu.hel.sur5r.net (norsu.hel.sur5r.net [IPv6:2a01:4f9:2b:18e5::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D68F1E2B
        for <linux-usb@vger.kernel.org>; Fri, 11 Nov 2022 10:22:30 -0800 (PST)
Received: from beer (unknown [IPv6:2001:470:1f15:53:e068:28ff:fe6d:7eee])
        (Authenticated sender: sur5r@sur5r.net)
        by norsu.hel.sur5r.net (Postfix) with ESMTPSA id B8B2E193EA00C;
        Fri, 11 Nov 2022 18:14:19 +0000 (UTC)
Date:   Fri, 11 Nov 2022 19:14:11 +0100
From:   Jakob Haufe <sur5r@debian.org>
To:     Salvatore Bonaccorso <carnil@debian.org>
Cc:     833035@bugs.debian.org, Chris Rhodin <chris@notav8.com>,
        ben@decadent.org.uk, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: Bug#833035: linux-image-3.16.0-4-amd64: Keyspan USB serial
 adapter USA-49WLC failed to load firmware
Message-ID: <20221111191411.0cc26c1d@beer>
In-Reply-To: <Y25mYI9tLSRJ7bbS@eldamar.lan>
References: <20160731071614.13615.81977.reportbug@proliant.robinstreet>
        <20220207153349.67de08dc@beer.h47.haufe.it>
        <20160731071614.13615.81977.reportbug@proliant.robinstreet>
        <YgIVt0i6zxGJFNDT@eldamar.lan>
        <Y25mYI9tLSRJ7bbS@eldamar.lan>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Sjb/WqhScWn=mEhhtGM2Zf9";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--Sig_/Sjb/WqhScWn=mEhhtGM2Zf9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Nov 2022 16:12:32 +0100
Salvatore Bonaccorso <carnil@debian.org> wrote:

> Jakob, were you able to forward the patch upstream? I'm including
> Johan and linux-usb list in this reply now.

No, I originally wanted to understand the differences of the firmware
loading mechanism as I assumed a patch migrating away from the unified
firmware interface would not be accepted anyway.

Unfortunately, I never found time to do this.

Thanks for bringing this up again.

Given I have two different affected devices, I am more than happy to
test any new versions of this patch.

Cheers,
sur5r

--=20
ceterum censeo microsoftem esse delendam.

--Sig_/Sjb/WqhScWn=mEhhtGM2Zf9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEe/X2rDZDH11A3BN6TPKyGPVNrj0FAmNukPMACgkQTPKyGPVN
rj0bEA//WdCCE9f76+BRzA+7JkmemApeq/AEA2lLOSkNChvSLtwm/rlXaR5eaDRs
TdY9IVjxBYK8G4buRiVejGkJPh7zRYBXw/UIddGxKuPJbcMPD10YoK/nhjAcTvG6
SZDBmOI0RmdOTPmqx1TFD+BbYgBC4PccPQUIx/ZzQR1ZczjLHVSSvhK4pU2I/pTX
/vzw7nvZMX8YfPL+9FVEOARZKT/u/fwb2UfNdIeRpotbdfWRLUQdvW/tI0Rjfqtd
wxKRH7FfO9QEt/F9I0cE5tyxM/IhoVjd3iPmtlrWXHNM5V68dKDj00f8mmImE1t0
snKpnwnMvxC4gR87/oNaCxlpOwl/IiYofwzLeNaFqBGdNazhvOLLfczqOuopzNd0
1JI6/oOMYftpFzo3oaXeNYPHTHVyrpMs3oZurPcPiXF8Kifh1nxqevd4EYf/LZTt
oiUts/5vySIi5t9dPN4V5fUUQx49sReBwO3Y0frZqx51pHM7lqByrJOlw0LI1Jkz
MW2wCvMy76ZXF0O/qvjcBCXBSrmmCBmkzd9UaTDNCbQiBKxqw3M30Hg2NtAffMbA
o6HHCoLFrxerzSFa+/DCqO1Ikkah+FbF79rCA8g46EKyfcHKVBTTLws2wLLe0hGk
YyIA+WZT6uOEKcFq8Ao1VLF/aabgD6U/DC1fuMy3AopZiFcZTZc=
=u7z3
-----END PGP SIGNATURE-----

--Sig_/Sjb/WqhScWn=mEhhtGM2Zf9--
