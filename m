Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4207F459F3
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 12:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbfFNKHj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jun 2019 06:07:39 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43716 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbfFNKHj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jun 2019 06:07:39 -0400
Received: by mail-io1-f65.google.com with SMTP id k20so4435973ios.10
        for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2019 03:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qf8PHbkL3B/l72GonBnfO+o+kfcHi+xlbv1V8+Yu9H8=;
        b=Nze2vSNWGMnDuIsmu9CwRv9sd1vXXAuBa/0XWY8Fqay26cpx6IQ0KmyQsXdNTEcAYz
         dEDHdnX6ik9X3LjP69Tzde3UwUYdG4rfucYSDcKyICp++OrZ+nqAxb7g+s1n+V0fMoR8
         oxwqMbWecoeiYUEdEhytkDtvByUfx0NH36EeVCzESgET/ZGoiuOLwu9ArzeRxvXLwrLE
         vlAJRvE7bnB9xWvY/tC6LvkALrIDpQMb9Se6NnKoLF/KZtOTV8RjmUxaysNbBphIaQ4G
         YDkVmA7cX6vA+aNzPFWQzuvxOuk7teP0u0t1GVLCLmQ6Xxd7pO+1cYncGG816IkecYyo
         qFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qf8PHbkL3B/l72GonBnfO+o+kfcHi+xlbv1V8+Yu9H8=;
        b=unnL76LgXZcLvhigOUXlGshW6GgovRIFCklYMOC3l/i2E/gq2ESVQqAksdtbSRKQgr
         hipQdNnsBWNatQsMEL7zuazhD0FUd7HNJHZWCClu5aKO/63XF62TUwREjVT1QL/E2F7R
         yWfooVDCJs/eoPNgl7FmCwxrpjVEiQCXPi8Ib0TpWsYdJcu79ASKcwKx6GDzbg7PZb+X
         Cva6oNfGaeCtqsvcEVRwaFt3KsFNYsPZ0MdVmk5F1VeuerCmU9NjQGvdBDnfI3GQxPMG
         QsxJRq55ElrvTFmlSodx7O5Vvxt0cuBKvtSoHRJQKE95dv9v3GoBoYLfmiSWEckhPAuh
         dI8w==
X-Gm-Message-State: APjAAAWq1ywa5+u6849wb3VYUoU1aIK5/1Wk0ldeLu+bfT4B+3IFInxq
        59GoOZK+DWENpd161wQ1EJLKO1ig1tiqxSO657EY4Q==
X-Google-Smtp-Source: APXvYqzqZvOvNp9+a7Fxr8daBh+LynsviCQtwp9j/GWi1m8rr5CaY7dfhQUeT5IMXaQ/HxM6QR5qmRCk/L+k0JekNG4=
X-Received: by 2002:a5d:9d83:: with SMTP id 3mr54028927ion.65.1560506858876;
 Fri, 14 Jun 2019 03:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190614094353.23089-1-ard.biesheuvel@linaro.org> <20190614100536.GA8466@kroah.com>
In-Reply-To: <20190614100536.GA8466@kroah.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Fri, 14 Jun 2019 12:07:25 +0200
Message-ID: <CAKv+Gu9vRJpM6giRLfxdvR6_uA-Yht8+nnNeKh=hBkJ=iCp-wA@mail.gmail.com>
Subject: Re: [PATCH v2] wusb: switch to cbcmac transform
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 14 Jun 2019 at 12:05, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jun 14, 2019 at 11:43:53AM +0200, Ard Biesheuvel wrote:
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
> > v2: - use finup()/digest() where possible, and process b0+b1 using a single
> >       call to update()
> >     - make 'stv_hsmic_hs' static const and remove comment regarding GCC 4.1
> >
> > NOTE: I don't have any hardware to test this, but the built-in selftest
> >       still passes.
>
> No one has this hardware :)
>

I kind of suspected that :-)

> I'll take this, but I think I'll be moving all of the wireless usb code
> to staging to drop it in a few kernel versions as there are no users of
> it anymore that I can tell.
>

That is fine. I just wanted to make sure it stops using an interface
that I am eager to make private to the crypto subsystem, but the
resulting code is arguably better in any case.

Thanks,
