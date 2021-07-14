Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357C53C7B86
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 04:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237456AbhGNCPH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 22:15:07 -0400
Received: from smtp.bonedaddy.net ([45.33.94.42]:53802 "EHLO
        smtp.bonedaddy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237409AbhGNCPH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 22:15:07 -0400
Received: from [192.168.1.209] (n49-190-172-168.per1.wa.optusnet.com.au [49.190.172.168])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pabs3@bonedaddy.net)
        by smtp.bonedaddy.net (Postfix) with ESMTPSA id BD08C180043;
        Tue, 13 Jul 2021 22:12:14 -0400 (EDT)
Authentication-Results: smtp.bonedaddy.net; dmarc=fail (p=none dis=none) header.from=bonedaddy.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
        s=mail; t=1626228736;
        bh=HyUAKLaw2bp8FZDs25LdGWfFsJykNZt02sRTd/WkJM0=;
        h=Subject:From:To:Cc:In-Reply-To:References:Date;
        b=iLhjborlyvlaIOQHy921+tvti0zaH4d1yBCKySk1JndwirRMNgU12yyuWj5DIgR9B
         qOynrVa98CY5ly7ll7xGL/Z1LntBYJYAbLgqWxma4EUZLXIBgc6AzLoBiG55kl9ED3
         HOcMEFydNGgakWP0kyRd4cQGcEvHgPc5b5kur6XJueglRgiPWkaZRNalfqQ1TTHOEr
         ZD43tqaMe1qYHyccxnBvioSt9W4bTIutE6lhbh2qjCFEG60RxgOWMAUkR/MVkztGdi
         3q2pmojfES4D5P6jMjIvKOeK3jhLvSh0xmoeuxOAtuqBEaELZ7FDuP+SwpU7l5+O1K
         Sg4rbV3kO96HA==
Message-ID: <acfda565cf77cf79bdf951ddccb64420c2fdf288.camel@bonedaddy.net>
Subject: Re: proposal: move Linux userspace USB gadget projects to
 linux-usb GitHub organisation?
From:   Paul Wise <pabs3@bonedaddy.net>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Krzysztof Opasiak <k.opasiak@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        linux-usb@vger.kernel.org
In-Reply-To: <YO00rA8sTT2mrdOv@kroah.com>
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
         <ac8342bbedc5aa0f5754cb6830e6d5628cc022f1.camel@bonedaddy.net>
         <YO0cL+4gzLSyTY7f@kroah.com>
         <6be6edd3a30888ef7181735a1bbdac579578fd99.camel@bonedaddy.net>
         <YO00rA8sTT2mrdOv@kroah.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-k0wBg2SL2f/V/qEf893P"
Date:   Wed, 14 Jul 2021 10:11:51 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.40.2-1 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-k0wBg2SL2f/V/qEf893P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-07-13 at 08:37 +0200, Greg KH wrote:

> Ah, hopefully people actually realize this :)

GitHub makes it fairly obvious even in text based browsers, for eg:

https://github.com/codilime/veles

> I find it suprising that if these projects are really being used, and
> there are problems, that none of the companies using them are
> contributing back to the projects for these issues.

It appears Samsung is using them in Tizen and Collabora has some
interest in them, presumably for some of their customers and the commit
logs and bug reports show a few other companies. I expect that the
projects are mostly considered "good enough" infrastructure that they
don't have enough motivation to assign much work time to them.

> The technical things should be easy for those companies to help with,
> the "advocacy" is a different thing, and that you should be able to do
> today by submitting talks to conferences to get the word out.=C2=A0 Almos=
t
> all conferences have travel stipends for speakers that are not sponsored
> by companies to travel.

Of course, all of the work needed can be done by anyone volunteering in
their spare time or work time when no higher priority work needs doing,
but allocating funding towards these projects would make it easier for
this work to be prioritised.

> good luck!

Seems like luck will be needed indeed.

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-k0wBg2SL2f/V/qEf893P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAmDuR+MACgkQMRa6Xp/6
aaMCWA//Z/2/OQ9+lsTiT7fN0p5wx4msucVbWUVHuZNRU66Mp0g4QEtSZD9E39Fc
L2BSS3Bmd37K/Gj1nsqsIz6ozrEfCvFPLPL6BjFijluWlFTpK7QkmAwgI0LGl5+9
qTn4KZoMLRXmBwdK6yjzAJZ4W2ifvd/YOxxjVg+s9DgICNfEis10H6t5ySGwRDcQ
sEM8TkFWUDWCb5M32BR+2vOY2K0s7uyzie0zegaRr13k42pqMePo/ab/UEevUlNm
DINy8K8wKPRnH/3+FdMwKs164feJ0DYw8yjyH4yd+OBuq1KK9y3A0/cIgu48DJXh
afRPVA2jp+DFylpnkBzJdq0T05UcyVmB7WGK5YmQin3sLC7GjSqv5Vg58dwG9mUE
qA07l8ZCw0OgtsIxcKm+jmwU5ts4in3bM5L3lo8WN0VrDGmAsWucIeOwDCcczJ2E
Ehx87M5C8i7NmjX6wH3PDbPzV6CrUW1X7HqsFXxsPjaTJHpyitOId7dl1dVfivqj
EkGAiZgYt5yz3Wfzwza9V362ZXRjnplo/j010ropjWzULMJ8XPBkcNi/wbRwbQWk
946jwIU4xyD/lVWD5YIjNHSwhk82ACHMeFxisgtZMaSfSotd+8KNoiFNx7ReBD1d
pu/c3Pc7/uJqWcvjmoX8emx53Cx6l3ow8Q5pNgyGgcPeYIKr6w8=
=1/tS
-----END PGP SIGNATURE-----

--=-k0wBg2SL2f/V/qEf893P--

