Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26B9213BF2B
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 13:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730279AbgAOMFR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 07:05:17 -0500
Received: from mail-lj1-f170.google.com ([209.85.208.170]:37251 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgAOMFR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 07:05:17 -0500
Received: by mail-lj1-f170.google.com with SMTP id o13so18251094ljg.4
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 04:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=fMWGFVZ9r5nq8FZ9NHarxscuEP7oFh4ovPwsM+UXojU=;
        b=hBrwByU/7ndhuaRLru/ZxFvvjsaxUQ6/rEJOV9ehR2on+2gGeShBBc0k71CtGqQRpW
         eoYOmMtL+nIJkWWnJZlrXw/prC79g2XzL0MAZoUnffSch7meEct7dOMhGcUMTT/shgM/
         VixFYCJnsZntHsjbrR5QJqxM2RprAc2wTG+oKEFYhyU/PPqi4jLkDn4saN8DRawzCrea
         d86nKCbDKrgYFAnOb+suow+kiQYPBLDzk3SG/pH75CLWmF0WlWJnnRG1CN2hN1NicWzR
         Iyo028AWZfJ2zKILjfWzH/w+Feu9UsDFYNfWkbfL+3E5UlfvczHwIJWXx0n19O58hN/n
         QXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=fMWGFVZ9r5nq8FZ9NHarxscuEP7oFh4ovPwsM+UXojU=;
        b=JTkkvaWfQANqDFi5K4C9ASC0eOrBdLO129TayVXjrPtKJvwIli53TIRbImQLNMzax7
         CWwI6yJBTESybGW4gKgJuq6ZJiG6F5pagOvhk//t96rLP0wNu6buf+7O6b1PA+YXrVRc
         lxRI0HjZ0TOqMIujUEj8JATqq9JRvSd5FkE2DcFpFtNKH8ObWgUjA7KU38ydOMAzamSR
         mlZTEcl1pv7NfaMD9nwoR9lzAUT/AMhFLzMg+5PLPBygDp6JLuDNDzKLAWmLEIbypAbp
         rCTJ5+kCv750gNyNKlaFECvW9KKNFf1GD97UR+80I3kasf8FItwr/PyLAgbRY2Ryn1sF
         XYAQ==
X-Gm-Message-State: APjAAAWhdmvjKN/1LmMkzydiTUVfKZljE28ikn+olZ42XBXqDL8xAloa
        BznzxChRZ8ndCJoni4rAsFmBLejmER4PAQ==
X-Google-Smtp-Source: APXvYqznNmxOQKCyXETPBDO5UcwMtLfyOKE25NPiJC5L2pJHlfslDhZKR3ySd87Gopiu14N4Cr+Chw==
X-Received: by 2002:a2e:6c13:: with SMTP id h19mr1539255ljc.221.1579089915298;
        Wed, 15 Jan 2020 04:05:15 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id w20sm9084723ljo.33.2020.01.15.04.05.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 04:05:14 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB: changes for v5.6 merge window
In-Reply-To: <20200115120334.GB3270387@kroah.com>
References: <878sm96pzf.fsf@kernel.org> <20200115092813.GA3153837@kroah.com> <20200115093746.GA3177342@kroah.com> <8736ch6mbe.fsf@kernel.org> <20200115120334.GB3270387@kroah.com>
Date:   Wed, 15 Jan 2020 14:06:15 +0200
Message-ID: <87zheo6i14.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>> > On Wed, Jan 15, 2020 at 10:28:13AM +0100, Greg Kroah-Hartman wrote:
>> >> On Wed, Jan 15, 2020 at 11:14:28AM +0200, Felipe Balbi wrote:
>> >> >=20
>> >> > Hi Greg,
>> >> >=20
>> >> > here's my pull request for v5.6 merge window. If you want anything =
to be
>> >> > changed, let me know.
>> >>=20
>> >> Did you send this twice?  Any difference?
>> >>=20
>> >
>> > I did a pull, and get this problem when checking the patches:
>> >
>> > Commit: 6a6ae4e8e926 ("usb: gadget: f_ncm: Use atomic_t to track in-fl=
ight request")
>> > 	Fixes tag: Fixes: 40d133d7f5426 ("usb: gadget: f_ncm: convert to new =
function interface
>> > 	Has these problem(s):
>> > 	        - Subject has leading but no trailing parentheses
>> > 	        - Subject has leading but no trailing quotes
>>=20
>> Oh, I missed those.
>>=20
>> > I'll go fix it up, but that will break your tree if you try to merge as
>>=20
>> Thanks for fixing. I'll reset my tree to yours.
>>=20
>> > I will have to rebase :(
>>=20
>> no worries.
>>=20
>> Out of curiosity, what are you using to flag those? Is checkpatch doing
>> that now?
>
> No, I'm using some scripts originally based on code that Stephen uses
> for linux-next (you would have got the same report from him when he
> merges in your tree.)  I published them on the workflows@vger.k.o
> mailing list a while back if you are interested in them.

Cool, I'll look for them. Thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4fADcACgkQzL64meEa
mQbksg//cGHxE5/nw6uQwFtVFlew+nsAUMJikoDB7L3N42maX49Lwi854unTJMqW
JvdQ0mopfCvERiS5rmXhmyc+UWFV89EazWzbdNNPu0SyNPqqudHo7NmQeJ3yAwoz
Gx/rkExdnLzY8tOiRdgBKbEkbY/fKFw2FTskLyCJ7FMEegTHgZJX4epjC2RvuAXa
prvOPa6rtuME1bAxC1W58HCAPOkNYzpQ0R98cshUAfvoJe/F2eYABBXC1vneoA0F
z9Yd/29BsUE8/4qiOIYTa0yyDv59ZkYGiWgO048LdzoaSgRWxfokcs+Oa7ejq77y
z2ePIXrPpTSvN88lLr4fhsYAj4FKj16B5UPfz5pgec64vQMurD8tWbuMkt5hQ6ZS
BfDr/Lft3bFS1FBrAre2BQ88yvmYKuUONrtCYpAqyz8Y76E4QZqU/JfKRnZ6XYO9
48tc6w4GPz4M3Z0DKnP7GkpsKqs6vIx/tGjQ1LTesRPfplSZiQfNBVabDzzkvvvA
QFpLibKkz2wrY59KZyuRn44qYP/oCm344TQG1GEKot/1etFGoN5jLmHSyS9Z67U2
13qsSdHPX5O+Y0gB09EOvxF3t4H1tMUWu5fA4W2ioYaAz6VeELSpI6aMuD0CRYJN
NsaNv90oTz7FTY0rBbr7H7Y5jNMe217iYLu0sYsJOIJlICCIFj0=
=PM6o
-----END PGP SIGNATURE-----
--=-=-=--
