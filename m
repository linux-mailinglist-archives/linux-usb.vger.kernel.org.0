Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB0C22D564
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 08:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgGYGPS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 02:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgGYGPS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 02:15:18 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EE4C0619D3;
        Fri, 24 Jul 2020 23:15:16 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id d17so12081139ljl.3;
        Fri, 24 Jul 2020 23:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=yarEScAGd6XGZ94TnSJFtvlG/Le/t/rjt+/tnfhAA3g=;
        b=S3MVN4jP9TFwnXlTM8zHPTfCfzgvZOyjCoxerCHgDV3H7jUXkz6qpZ7+QkJhtUCbrL
         643HI+JaWp/P+qL3KwKx0LgRgsHAYYQyDCUfrBAHFvHuywKdZfGjxTJvhIfntW8f4bSV
         IAkSUBGL6VfTlpc1BWtwpvyBpONKrfTwNeHJ44FzNmVbJhLKACOe/CCbtIE8Q3kdxqc+
         RccSAn1O998Y8fGlRJVFs0dp7KhDfcv2K22W/Lwlz0SGDIQd9vmEB2NZrU0yZAvnn0Mi
         u/CFPbmwwlvbu+XFT2207R9qXhs+C85xg7Tp8+33P2LS+YM4mL7nxBDH4ZXNPrPuDR6O
         QFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=yarEScAGd6XGZ94TnSJFtvlG/Le/t/rjt+/tnfhAA3g=;
        b=j4En5flHvdISh/5g/RRknT9bxN3sFaWFWUa/H14FZu/s0+x4+PEJJ3Ijicq4IFybh9
         XNJy8FwmvScDzzFjII2d1CPK0Wn/zm398X4/JTqUhN3P1+O1REg7sgigPIUwxTS2BewP
         vShLp+p8EOpGXvurUMjYB2n1I5RIvpEyTBvJIMfLLt355iMNu0IE8Uk6+hQ7LkZq0wfH
         NauCzpY5liaolvf0mdsh5QWiNdq9/9dEI7ljNqc2KCkaNizV7/gMP9q+4eEwZBkbkaWc
         x6FO4IpFahyubQwIYUGPFyyXnFhYy34C2yrKDxmzwmKgO0MTtfuk2eWzpEIpl9lrHyD9
         bcCA==
X-Gm-Message-State: AOAM532pErW+Q09kbEPAYyrPFnZ8+VOFjNgRrBu7zjVFpWIacQMBXjtX
        ttX71F54LWRazoKQsAOJSrZNQNhab7I=
X-Google-Smtp-Source: ABdhPJyQaP/mO/wccLaOFNpO3Idde5YWc2dbxH636dtJvDUQnk4BeLAwNBlDHz6YnqISmFqlTqvEhQ==
X-Received: by 2002:a2e:3619:: with SMTP id d25mr5690353lja.204.1595657714698;
        Fri, 24 Jul 2020 23:15:14 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id h21sm767049ljk.31.2020.07.24.23.15.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 23:15:13 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>,
        "Zhang\, Qiang" <Qiang.Zhang@windriver.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOg==?= [PATCH] usb: gadget: function:
 printer: Add gadget dev interface status judgment
In-Reply-To: <20200624092950.GA1751086@kroah.com>
References: <20200615094608.26179-1-qiang.zhang@windriver.com> <BYAPR11MB26324BC70657061DA849A384FF950@BYAPR11MB2632.namprd11.prod.outlook.com> <20200624092950.GA1751086@kroah.com>
Date:   Sat, 25 Jul 2020 09:15:09 +0300
Message-ID: <87tuxwnms2.fsf@kernel.org>
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

Greg KH <gregkh@linuxfoundation.org> writes:

> On Wed, Jun 24, 2020 at 08:59:40AM +0000, Zhang, Qiang wrote:
>> Hello, Greg KH
>> Please have you review the patch?
>
> I am not the gadget driver maintainer :)
>
> Give Felipe a chance to catch up...

It has been in my testing/next for a while, actually :-)


=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8bze0ACgkQzL64meEa
mQbPmRAAykBzTcjcRDcmTG4yF8GR8Az1kkbC1aypul2tVcr6miEH47AJy0T4jE7F
JXIffVRhAxD2xmZclRwLm1que8anRF3Cx3v3zV15S1fSUcOpDgF4BWEzNjY5PM+P
QQ6OLfeV2/TyJBZ5CuvE87QmwuthHSOHO6fC7/pi3gnaiMYsfkEMWTA/abcIfMlq
Ndyps4IZhAhzN9v/jYFxvGWc47nAEO1J2uaDtX8K0HXti/TpBdBkZvu1PIAL+zaD
0A5hVCyP73VXjKwlms/lqv0RjUNuud3TYo3dkywmhjlr4wPKoDL7gqCMLWik8G7b
zXwZQgmsRFrO1XREVZaaTaVIwnFsvHNArXMh116A5u8S5dTUehfXLQfeAqdR6RX6
eZ5zhy+ktnJebPplWrCkUlUqL19AGeNsqyCFawGtphPVUNHTjYGJeadJ8ref9EV6
Iy0jf8osCAMnlOqWznFN76G++nvDgLUA3LYBW/PR3+cEW93LSgBmM295LhFCxRRG
J6jVduGprhwINy0WI+r7rcpTcoTFiyFVnTXl2vHB3XTZ0LvijNMCQYWMJ5dQky+o
0h1rrNZkQPzf1zPiR+GDs6g01kHKWYYqu7Sj/SAKx7Uu7QFqbufdi5uSDufW1V1l
F9xKkpKglT8RerOqqKm/A1GGdnCGOYG/qVACuDP6OTPqmeSV8ro=
=mjJF
-----END PGP SIGNATURE-----
--=-=-=--
