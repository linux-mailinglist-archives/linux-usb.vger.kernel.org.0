Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13CBA13BF39
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 13:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730196AbgAOMKC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 07:10:02 -0500
Received: from mail-lj1-f174.google.com ([209.85.208.174]:33132 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgAOMKB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 07:10:01 -0500
Received: by mail-lj1-f174.google.com with SMTP id y6so18317856lji.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 04:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=cvS2LSNNM8/ibzNW2MtTZk0AbsDbGmksvtGWXLochu4=;
        b=I4CPw8SkRWyBbZaUDlufFdawqGGdHD0ALRpzRXXRLWR9C8H0pDta/APPWKkjKZ99bq
         R9f75kDal8+C+nVAHI123uMKpVOw2inUyd5Muv0Bvn31P5ui1cuA81Bh7PQSQN6bRmmf
         FASkKDNmV2pRIHalGh9Iy6s5iK33VHim5giKUL1r+xCs6+3EugskmYEXKz6IqGWyVbwP
         EWVBWd1AVSPKCbRHAROfoPqyRdlJqZIf9pMd7dlRoJI0mp5FNOkEMsANBXeilMZccce+
         y5wHeGtSauhgGhXY4bqctMaOk3yDYwxI6nMjFu0nQuaMr4RE44JHoDZwkoETzcCHkwib
         8bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=cvS2LSNNM8/ibzNW2MtTZk0AbsDbGmksvtGWXLochu4=;
        b=ETTeYHdwZNM0jCy04v5WgNQjycxEtCsuagW8m0dZezD4Y+YeE2a29ekmJ048ktxEOm
         OFexY0CW+hRdtD0K2SIbx+lfICfpkeHSCepAhSCGDzyUIvdFvUiy9v6Do2L+BGzJABQ8
         HDgNFcHNHc6tpKLx76u1OuUoPPro2P017RJ1crnRDInQNUg6YCVug+Q8m5GbIAuj0UY8
         0n8nANrrbsmN95jmUw8OqNtR4zIJyKcqGmB30ktwDvjD/QZnDRPaKtKsNp8CNlPLzQMX
         dbCGGxXu4qlBKEr9RHQHOaFCy3NtE+JLC/TKgu2zkPOY+Y1ODleTY8zm2NeMIvpKQ5sN
         l2sA==
X-Gm-Message-State: APjAAAU9fOaJaPmYWsqSDu0JaYQ6uExZHHLRHItQPDLNhgRIEKtoftoa
        WdMjxS+Br4/FIu/jtElFwmNn11s8WYdcpA==
X-Google-Smtp-Source: APXvYqxRYiMLkOUocjsDD6UMDAUECSEqLdbQg5f6Lk9aiz+An7JnZ5rHG3EaSvDF0Eb1FbBjZzKAvw==
X-Received: by 2002:a2e:9f52:: with SMTP id v18mr1605767ljk.30.1579090199611;
        Wed, 15 Jan 2020 04:09:59 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id y8sm9085749lji.56.2020.01.15.04.09.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 04:09:59 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB: changes for v5.6 merge window
In-Reply-To: <87zheo6i14.fsf@kernel.org>
References: <878sm96pzf.fsf@kernel.org> <20200115092813.GA3153837@kroah.com> <20200115093746.GA3177342@kroah.com> <8736ch6mbe.fsf@kernel.org> <20200115120334.GB3270387@kroah.com> <87zheo6i14.fsf@kernel.org>
Date:   Wed, 15 Jan 2020 14:11:00 +0200
Message-ID: <87wo9s6ht7.fsf@kernel.org>
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


Hi again,

Felipe Balbi <balbi@kernel.org> writes:
>>> Out of curiosity, what are you using to flag those? Is checkpatch doing
>>> that now?
>>
>> No, I'm using some scripts originally based on code that Stephen uses
>> for linux-next (you would have got the same report from him when he
>> merges in your tree.)  I published them on the workflows@vger.k.o
>> mailing list a while back if you are interested in them.
>
> Cool, I'll look for them. Thanks

For anyone interested:

https://lore.kernel.org/workflows/20190926195143.GA1742392@kroah.com/

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4fAVQACgkQzL64meEa
mQaiYxAAhGmhHclzfhpQU8JjxIHE998xrZ69sZgK5dxAJq2yDvDUF4agHxzWsFgu
Iv+cJ3Ch+CI5RPYvfbIR91w5BgGlLTOGRZx/YXqZUJUcD9DU8e6zRm4LHkzeTtrD
KFYcOyicVp04hXAh+mJ5Pq7fG+07bk5Van3ryakD3kT4NPuvu0dQEvl3qm8Ha0Tc
2sRkHG2GwUvF98HqucY/mlsRuJnckJ3SbIH+aO5kqv8nM02VxHy0MXcxWDQSXUGb
ESpomYgc2Nk2cZ0i05QGrO3E4OpWMm97d8okqkysDUSslYAe/zpIjT2cfKv43j3p
teODjwuQSViRd60MbK2gnDB6SUhxosPAdCY70RRQnfKAjHrM3KBWsLNqcoTW3tZD
FtnaScj3SHPe6Q99C1St6Na1bWPLZpM1EJwghQMxFZOTNKJzSeUvDgtAlB0T38PK
6efV+Bd7LuKWogtfh/FP5Qc/B1W9VY6OD/tKwDbGWr4lYpEkmAjEMoboBu7uLxpX
kWJ7QprCSBpwYWfJHjKKOmvMi57jxv6EJr/kkAkjJtRUuXG81YDKSjUAc5y6RwzR
AQucLjGYkugsRIi3jvPtUqnkwZLHg6VL7vGlFyRDx3HlW8QRq7S+HSw+Y7SkDXD3
f4cSo/SCYl3/H3Y1npQwr3naLlZq2kTm8flwV3AyzzUasmxGXp8=
=O7ka
-----END PGP SIGNATURE-----
--=-=-=--
