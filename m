Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99EA847365
	for <lists+linux-usb@lfdr.de>; Sun, 16 Jun 2019 08:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfFPGwq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Jun 2019 02:52:46 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40617 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbfFPGwq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Jun 2019 02:52:46 -0400
Received: by mail-io1-f68.google.com with SMTP id n5so14581513ioc.7
        for <linux-usb@vger.kernel.org>; Sat, 15 Jun 2019 23:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MEroY9WdNJ3bMgtxlxAekXl4sdcVNdwZiEJJn+vw10s=;
        b=SSK4Jt0gPnA0wUcxHdu0WtXAcfUIRDsJegUmNQGwk/gn6CiASev/AMuVKohQFwMIg6
         YWn17sBNos0XNIZLTb1R8nJ/f29BZIX0HQwlek4zhv212dWwcyXXfLsL1Mx93WgtiNQm
         yv8UmjX8pxEb1OLNS9GrXtnhN/x+NBX7HtCRT1bd5z/eLk0EQfU1yTM86RNF5nAujawS
         56SjBcCxMWTYZC141A9P/WO4WdtBLGUMkqb+JbS5t1kJ3fCEMGW0uPPvHtbgTORa9fc2
         hhlaQ1US3pKySqhxRqXJLJcGsAtnVJIsAaZXdfMVr31G3kqe8etbBjfW9kc4xsWkJpwO
         pL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MEroY9WdNJ3bMgtxlxAekXl4sdcVNdwZiEJJn+vw10s=;
        b=OPZFS4uKZoohUhr1Rl89AJR2WVNWdQqv7yUVDD77CatkHrJAdGaUAgi9NpPYHpVccu
         B3zGsPsB7eRc664sxkbwgNBE6keRCBmCzo2hl90u2QR7bPEbW2zss3q+0ppf5KpLgv7v
         WHEhsHsA8otcR9xIcg0Do85eOOj/+nnHnt0e7j0cj4QNdY+1n8rPgSVerQ+N9rXLe2aO
         r+He7h94rV39DYwJ1+64kV26uGHwUzvFbU5F4f0tEh1lhSbn6ewA1n+rvqowS4MqjZIu
         vxhVKydy1qqP2NH4r5SgL971jRvMwWU7QE/QBh9/55j6/DbGn20Q9Ey+CCdcxuoC2DU0
         YePA==
X-Gm-Message-State: APjAAAXFAqZl9cheEhiDJZacOa7p2vklsyP/2h6XlSfXBMiu9m8fcXA8
        9ujS7tUqjmOSjzYdjDLO4JxkE1sZ2V6SgDAtumWXug==
X-Google-Smtp-Source: APXvYqzdUoCv2fiUjq2QrutOzMhc4eINkvnf/Jom7JC7pWW1nbM/MXmbf1vvC2LGdwiQghlFzy6bjkTRi30U03o4eEA=
X-Received: by 2002:a5d:9d97:: with SMTP id 23mr20300005ion.204.1560667965728;
 Sat, 15 Jun 2019 23:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190615091745.3100-1-ard.biesheuvel@linaro.org> <20190616012056.GA698@sol.localdomain>
In-Reply-To: <20190616012056.GA698@sol.localdomain>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Sun, 16 Jun 2019 08:52:32 +0200
Message-ID: <CAKv+Gu_j_y3oSPy8JbTdNYVjzsSw72gM+UcC6+u_WBtw6opX2Q@mail.gmail.com>
Subject: Re: [PATCH v3] wusb: switch to cbcmac transform
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 16 Jun 2019 at 03:20, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Sat, Jun 15, 2019 at 11:17:45AM +0200, Ard Biesheuvel wrote:
> > The wusb code takes a very peculiar approach at implementing CBC-MAC,
> > by using plain CBC into a scratch buffer, and taking the output IV
> > as the MAC.
> >
> > We can clean up this code substantially by switching to the cbcmac
> > shash, as exposed by the CCM template. To ensure that the module is
> > loaded on demand, add the cbcmac template name as a module alias.
> >
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > ---
> > v3: - add missing #include to fix build error spotted by kbuild test robot
> > v2: - use finup()/digest() where possible, and process b0+b1 using a single
> >       call to update()
> >     - make 'stv_hsmic_hs' static const and remove comment regarding GCC 4.1
> >
> > NOTE: I don't have any hardware to test this, but the built-in selftest
> >       still passes.
> >
> >  crypto/ccm.c                  |   1 +
> >  drivers/usb/wusbcore/crypto.c | 169 +++++---------------
> >  2 files changed, 45 insertions(+), 125 deletions(-)
> >
>
> drivers/usb/wusbcore/Kconfig also needs to be updated:
>
> diff --git a/drivers/usb/wusbcore/Kconfig b/drivers/usb/wusbcore/Kconfig
> index 12e89189ca7d..2ec17d6af1f8 100644
> --- a/drivers/usb/wusbcore/Kconfig
> +++ b/drivers/usb/wusbcore/Kconfig
> @@ -6,9 +6,7 @@ config USB_WUSB
>         tristate "Enable Wireless USB extensions"
>         depends on UWB
>          select CRYPTO
> -        select CRYPTO_BLKCIPHER
> -        select CRYPTO_CBC
> -        select CRYPTO_MANAGER

We'll need this one, as it isn't implied by any of the other ones, and
cbcmac(aes) will be composed of the ccm template and the aes cipher on
all architectures except arm64.

> +        select CRYPTO_CCM
>          select CRYPTO_AES
>         help
>           Enable the host-side support for Wireless USB.
>
> > diff --git a/drivers/usb/wusbcore/crypto.c b/drivers/usb/wusbcore/crypto.c
> > index edb7263bff40..9ee66483ee54 100644
> > --- a/drivers/usb/wusbcore/crypto.c
> > +++ b/drivers/usb/wusbcore/crypto.c
>
> Other than that, this patch looks correct.  There are a massive number of things
> that need to be cleaned up in this code, but I guess we don't really care since
> as Greg said, this driver is planned to be removed anyway.  (It also seems the
> wireless USB specification is no longer available at usb.org.)  So I'm not going
> to bother being very picky...
>

Thanks Eric.
