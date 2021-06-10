Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E843A27D0
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 11:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhFJJLA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 05:11:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:45444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229895AbhFJJLA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Jun 2021 05:11:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 736DB613F5;
        Thu, 10 Jun 2021 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623316144;
        bh=dVil8GqDefw3NrzGtEwwRo2nkdFlVIHdyo5RRTS319Y=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=H240bBNNOEpH9D+r+IafX3ylLEKlBoMwNLmUaaj3YHbTca/hkfzSE3olUSECzDQdu
         cIHZvtyG1GsYM3Xa9PvbyUdHwa3MRfmyAOPjjpNTqHYgxLn1gSLdmFb05GoDTqHW1Z
         a0qEyM2/yi+6W3MGYqugIv0TVQv2EiRNaUmcN5rEPbG6+QQBr62zj0KpGBw/pG1ueT
         /jpv5/kA5CX9AKJaHky7EkqWATQUXk9JYYD2wX5jW56FHoxvESdk3dv7qwUooLGn4f
         1isaFK9m6HSePhyx86uNrAqy2foMNZWSRBJKC74H0Vvdu1LJlvtbuLwUkWiTPwmEwN
         EVRnC5lePbttA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Marian-Cristian Rotariu <marian.c.rotariu@gmail.com>,
        Greg KH <greg@kroah.com>
Cc:     linux-usb@vger.kernel.org, mircescu@gmail.com
Subject: Re: [PATCH] usb: dwc3: ep0: fix NULL pointer exception
In-Reply-To: <CA+i-z3XHqsSBb6KC-Y0hvQqk-u2O07B-jrp836FL2Z=woHe_uQ@mail.gmail.com>
References: <20210608162650.58426-1-marian.c.rotariu@gmail.com>
 <YMCDyCgwOaTBKg9f@kroah.com>
 <CA+i-z3XHqsSBb6KC-Y0hvQqk-u2O07B-jrp836FL2Z=woHe_uQ@mail.gmail.com>
Date:   Thu, 10 Jun 2021 12:08:55 +0300
Message-ID: <87bl8e2ijc.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Marian-Cristian Rotariu <marian.c.rotariu@gmail.com> writes:

>> How did you create this?  It's one level too "deep" for git.
> I forgot to rebase it on the adequate kernel repo. Sorry for that.
> We use an in-house repo where the 4.19 kernel is inside a directory
> as you could see.

Make sure you can reproduce the bug with upstream too. If you can run
upstream, at a minimum provide a minimal method for reproducing the NULL
pointer deref.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDB1qgRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUi9iAf7BT31QlMCJWT58x5b25C28hsMdSByJPG5
FZNbpmQc+P6Sbv7jTQZ1Afqh3mE7iJltVW/44ODayihh80BIYzWh5Zas/6LXXxa+
RnIgmCcfnBsqvX5TGgvlT2LR2YxT0+DV0yvXXQQS7F6YFxMXrFhe5c4eONIcV2Hc
pBsBXJpElS8GhnNgfvm/DKgNcvZl1EJsCyKj9uRzLB2LaK8xZN7KmnTem17WUNM7
XsVEc6HjseBPgdxt+vpLT9FYiWcnEpTSJ27ZhsGAbUh5FiKITh7qfRwxxxijbeYv
J5iwiag87lP/Io3gOjaMmcoWXczp5IytZ2/+exASHgfxQ9RcUVmbyw==
=Ox/o
-----END PGP SIGNATURE-----
--=-=-=--
