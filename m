Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 802ED4C34C4
	for <lists+linux-usb@lfdr.de>; Thu, 24 Feb 2022 19:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232900AbiBXS32 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Feb 2022 13:29:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232439AbiBXS31 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Feb 2022 13:29:27 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E3C12B76F
        for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022 10:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645727335;
        bh=9UepHg6RDq2T6wyz+uObUVgnhjeErD5yyXjWGH/z+IE=;
        h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To:References;
        b=ggBIbIpdHYsAAdsXLpzR82b+yR0RzuFefjktf5YW6r2r+LpsJ9iTXxgOWEGXd52Mm
         1Dr0limpX5KKEaS/pHbsWnRrSGHCPf0c8UHwsgMKGpzaachA6EflgeMiUBoz2Xpb2D
         x3aDiNw38DWeSycFAv9om2ll7W83G4raGKh/Bq9A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from felics-pocket.localdomain ([213.235.133.39]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N2V0H-1oMzLk19WJ-013wQk for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022
 19:28:55 +0100
Received: from localhost.localdomain (localhost.localdomain [IPv6:::1])
        by felics-pocket.localdomain (Elektropostamt) with ESMTP id 608005BD5D0C
        for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022 19:28:41 +0100 (CET)
Date:   Thu, 24 Feb 2022 19:28:36 +0100
From:   Felix Becker <linux.felixbecker2@gmx.de>
To:     linux-usb@vger.kernel.org
Subject: Re: [usbserial] device 0421:069a is supported, in fact.
Message-ID: <20220224192836.3154b8cf@gmx.de>
In-Reply-To: <YheJtJ/p5QIsphYd@hovoldconsulting.com>
References: <20220208125958.295e8a0b@gmx.de>
        <YgKKQSOuwBy1cQ6H@kroah.com>
        <20220208201506.6c65834d@gmx.de>
        <YheJtJ/p5QIsphYd@hovoldconsulting.com>
X-Mailer: Claws Mail 3.18.0git303 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bP9cHGp9C8r5_U/ESCTTT/i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:er9zOYSK3rKzR6nZQrL63LX9VEhpgxX743JPugFfKal1U1XQBah
 4ArqiE1Pu5aWqHQ7HAvqz9j6Eo+SxYLGnmjIFDim0XeIvW8QQpHM4S3om5rzJhRsUqvbNdK
 VibuFhGbydy1tkdQb2fh5uMGG2LtkeGLHkecnw4woots+uxBOfJ7drzXBG+nb76XieEA6yd
 Yh70XM/LGsmDaBJRMq77w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PW+MXrULdaI=:x37A2jGZ2SGlrph4nIKfT+
 M5gEtv3DKhmz0CopD5BwjsWro8Fn0KicBoTQsZtaxa3ccdIBAsxWF9kJtHqEK/ZTgorVXfEGe
 KeXKZK69nT6MzfndxtZaxnU0xdyvEr3nQasvVl0ifcz1YwPRayqqYGBU5rRorzrvfe/UzfRzA
 A3QU5Z59XcS8kRNRt+qgNFYqwzDK54em6p2LmwvONOn2wgGwm+GOt2zXUDeSOL2QkjKNPeWHx
 YZnTgsW+P0EaFfGoNgHk0mAw5K4EiyQUiQdweQ/rqkWp71DCWJ/uxlNzqWa/6hBLQci02GHzU
 8zgT9WArrn4CSk4fyC7K8qJf8zSFXDMufGNaS8zXMl3N8qYYbfxXnjLZ+UwMz8yw3WrpS+66I
 Vf6Bewlu8UYVJVNsBSjwyO/e6DRQx3aC5adHmUtfwtZyPHtopSFeRARICZN32EG9HS5470Fz6
 7Xhog1vc3WmuiBr1D4gGm99P3WL4B6u5MJIwuvz89Qi1+XWFxPT4+DAFJAbndugslOSkJMnIu
 0shw5RqCn3SfUD8He7/Hu1TflYxp2B9W6hvPwG1NEoXuOOT7lPaBpc6+NPBbBozO+sjByi/Ai
 AVl38AT10LMZFZnTjxj1mAHm8qGZ8xTG76qPbBDeish6iEcXOPFOTBfS1EHfZeYrh2zLNETo8
 Ry79eQeDBDVv3otdXiGz1aYIJGC8Rn2vrxXFLF2Kk0Lpu7xpS5gQworUXedoNPAM1FXroDH8w
 /tNRj2/jD2+cmgWJUt7qNXieXpi6vq7qGJIIYEOV3HXqNvowgUpswztmzOaw3Gyt2N2EvLLEZ
 vuKKgJCsatdpdeUpiWEHr4omXYj6POKr6SxgoEeZ4AC1/FcPKzcwHLk7kTsToTMgl3eifu33G
 l6fvEYsMNvtmgIdPwj8ZNkEteMuEpd3v1KuO4AxOa6qpfmNEuvl/6SdzXnmC9mjLse3/8Jagh
 4VDjYhvqWvaqNvofWOLmyECPL2EJeuXzYOBeF7vWKyyLY/Fod/b8KyN8vNnwxR+1blYKQN8ue
 lGuKI0N4c1lDs6z5icjHgf13ypv0duAexcotJNtTkIyiHF4z4JEnv6sG3IoW/ZTSZC5WerdQc
 yyKkZjaO69S6gY=
X-Spam-Status: No, score=0.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--Sig_/bP9cHGp9C8r5_U/ESCTTT/i
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Feb 2022 14:35:48 +0100, Johan Hovold <johan@kernel.org>
wrote about "Re: [usbserial] device 0421:069a is supported, in fact.":

> On Tue, Feb 08, 2022 at 08:15:36PM +0100, Felix Becker wrote:
>=20
> > On Tue, 8 Feb 2022 16:20:33 +0100, Greg KH
> > <gregkh@linuxfoundation.org> wrote about "Re: [usbserial] device
> > 0421:069a is supported, in fact.":=20
> > > Can you provide the output of `lsusb -v -d 0421:069a` for us? =20
> >=20
> > Attached (without `usbserial` loaded to specifically drive this
> > phone): `lsusb_0421:069a.nodriver.log` =20
>=20
> Will you be able to test the patch and let us know if it works as
> intended?

Yes, with some delay, I will come back to you.

I suppose also other Nokia phones will work like that, but I cannot
name any specific.

Regards & thanks!


--=20
Mamihlapinatapai:

"Der Blick zwischen zwei Personen, von denen jede w=C3=BCnschte, die andere
w=C3=BCrde etwas initiieren, was beide begehren, aber keine wagt den ersten
Schritt zu tun."

"The look shared by two people, each wishing that the other will
initiate something that they both desire, but are unwilling to suggest
or start themselves."

(Ein Wort aus der Sprache der "Yaghan" / A word from the language of
the "Yaghan").

--Sig_/bP9cHGp9C8r5_U/ESCTTT/i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoQC1DtG8M9RevkfXW6j9HlIpTekFAmIXzlQACgkQW6j9HlIp
Tem+4RAAljiSMddSAE98iwcegBPxtX3Q5fLznh3YRckluxyBaC+frWMKDqwMIVfj
2kvOZOE+2F2xJii+Qm0wj+WtE1bZSarIb7ztnZHXlR3vK4mXef2ghXN+B6M1yqin
grWkspdASlwiLt5NsV4xMCCvY7Cd/6J4cDKsKasa0q3qrPOpckz2wPqIQAjjpoNE
k6JrWp5tqTqMAOHyiz5SaOjd1gBft9rfUdEiM2FkL8KT3ipl9FUEVj4J4vTJk4Wv
5/gYIE8Ur5zaBdCSk9iaH+/1DYjHmNQC9MnYzZUpKJqrypPnmFum3UWiTGMlPSO/
WMvpt+1fBEHIM+5E0rjvPDi/g+uA8ztg6Ym8Ph5lFGeibjUbrwiHwtRR4hSg4Xs1
Lt8jog8C/TbMowXpGEpyvOk+GQlog9BDt31OLKbPx4sMfwQ8mzWDuQi1o9LK9ZUP
q3q0k64ioE1+ZcynqRO5bV7UbpOE9zpKibngtnlb//KOl0UP0arjP2b6sWRsEwH3
0HCFH9DqbmDpqUZ+3RESkpVTghjRFptxVQedE4ZGC5fh2AqYiT0+HWZOhr21ajQ/
JzpUJj1kQg3Ef9Vqz9kv43wW/dCateTY1HNclijpXKk/KZw2vqPrHC5sCFZk2/GJ
1WKHPJzL9GYxhotBOeFu4q0Jq4Od2a6kkD6YhlLDUQOBfiq2RPM=
=BzEk
-----END PGP SIGNATURE-----

--Sig_/bP9cHGp9C8r5_U/ESCTTT/i--
