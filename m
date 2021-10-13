Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8B742C8C5
	for <lists+linux-usb@lfdr.de>; Wed, 13 Oct 2021 20:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238606AbhJMShm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 14:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238539AbhJMShm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Oct 2021 14:37:42 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7185EC061749
        for <linux-usb@vger.kernel.org>; Wed, 13 Oct 2021 11:35:38 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t9so15725369lfd.1
        for <linux-usb@vger.kernel.org>; Wed, 13 Oct 2021 11:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rDZnrWeGoRepjCpc3OfdE7YBAKz9l8dGQzHDHMy8dnQ=;
        b=oSzrrLlxsTaGxHPrpBBYUO/5vjshvULo7erMOdXFwdQT+zjQQthv7fbm5CKDFlstZz
         d1u7g7byscGhtUM0UI2KJ7BQgB35rSea/uDhwxbQowcyDN+yTwYCUFaji+pbVBgpfNMW
         yN1Qb74Tgew1fpYUM4NfBccjKTeioOd48UuKrkkeCrm58GJYb5f4Xb6eeGRddnOxtrlm
         QHOdoKajbgqCa1a68KCnvqgCl1OEVjurDd9aafe6MCe5nmSB7HHKNNN43e8PfU16g43C
         6Lh6BkN0wxX9xLKpF2RDTyyNyFMc9GHigBdRyc4IjxQbht0Vi9CSP1XQE7CPU0JfILfa
         Bsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rDZnrWeGoRepjCpc3OfdE7YBAKz9l8dGQzHDHMy8dnQ=;
        b=LPTootIKorkP5mFl3ZwRSMDmY6LC4GC8kCF3ZnQ7uFl4K8EEpVCGQeuWkoXwYiNMC3
         YHWwaG7myUPUJUG0zgDHeVNAiZk2uHa4PDO9ds9Aqvsuv90Tujx9czoiApiRfCjQ9jAk
         9H48LRF2T7RL96uR3FhJ4BB8DrNwUoApM38X2bDUpA82GjyeNFqoI/lCDcBro+FQbjil
         9Ene9OZtEOPklMzA3m/AsgsYfxzBHzthe+Bp6SFxCw2vpkoHhO9VxBinjawVj0F34Djs
         zHp3N3ADW8zV8y2XhYNI4a+2D02czybIM+LZvzHlLfoluJzu4tENdNEnaiJWy/5hnE7X
         hSmA==
X-Gm-Message-State: AOAM533RhbkX+ijfXdrs8Qc+HRaFe08fvffZgmcSSSulbW1KTZhRXV3F
        LGuYSY6QBpEk6LJQvYzTPcT85uQbXUCySjrj6DSCcg==
X-Google-Smtp-Source: ABdhPJzAgS8wHJY6I62EzOdlpG6Sg72jMybOxEQEvOVXJ89i5iNti04/Bk0r5R9a/na9HoO2A9r4MW+N1hLwSjz2nN8=
X-Received: by 2002:a05:6512:1103:: with SMTP id l3mr611705lfg.550.1634150135927;
 Wed, 13 Oct 2021 11:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210927123830.1278953-1-arnd@kernel.org>
In-Reply-To: <20210927123830.1278953-1-arnd@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 13 Oct 2021 11:35:24 -0700
Message-ID: <CAKwvOd=rFUfuTgK14y__3OQdgwzBCLp+ZVUUqsXfOmSCe1M8Mg@mail.gmail.com>
Subject: Re: [PATCH] [RFC] usb: gadget: avoid unusual inline assembly
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 27, 2021 at 5:38 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang does not understand the "mrc%?" syntax:
>
> drivers/usb/gadget/udc/pxa25x_udc.c:2330:11: error: invalid % escape in i=
nline assembly string
>
> I don't understand it either, but removing the %? here gets it to build.
> This is probably wrong and someone else should do a proper patch.
>
> Any suggestions?

https://gcc.gnu.org/onlinedocs/gccint/Output-Template.html says:
>> =E2=80=98%=E2=80=99 followed by a punctuation character specifies a subs=
titution that does not use an operand. Only one case is standard: =E2=80=98=
%%=E2=80=99 outputs a =E2=80=98%=E2=80=99 into the assembler code.

I don't think the intention was to have `mrc?` in the emitted
assembler (is that even valid?), so it's not clear to me what this
point of `%?` was. Patch LGTM.

>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/usb/gadget/udc/pxa25x_udc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc=
/pxa25x_udc.c
> index a09ec1d826b2..52cdfd8212d6 100644
> --- a/drivers/usb/gadget/udc/pxa25x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa25x_udc.c
> @@ -2325,7 +2325,7 @@ static int pxa25x_udc_probe(struct platform_device =
*pdev)
>         pr_info("%s: version %s\n", driver_name, DRIVER_VERSION);
>
>         /* insist on Intel/ARM/XScale */
> -       asm("mrc%? p15, 0, %0, c0, c0" : "=3Dr" (chiprev));
> +       asm("mrc p15, 0, %0, c0, c0" : "=3Dr" (chiprev));
>         if ((chiprev & CP15R0_VENDOR_MASK) !=3D CP15R0_XSCALE_VALUE) {
>                 pr_err("%s: not XScale!\n", driver_name);
>                 return -ENODEV;
> --
> 2.29.2
>


--=20
Thanks,
~Nick Desaulniers
