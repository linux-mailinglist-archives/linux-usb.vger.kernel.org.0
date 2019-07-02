Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D69895D429
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 18:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfGBQW6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 12:22:58 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41325 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfGBQW6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 12:22:58 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so18553798wrm.8
        for <linux-usb@vger.kernel.org>; Tue, 02 Jul 2019 09:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jG/Q75qDOR7plmuYpaGm0iLn7CnHXYAvRBkK8IXCAog=;
        b=g3WmdNfSyLLFPq0kH7dJwg2DK/lI8Dz7liEQLYgZPtQsYC9ETw+qPRdiL4EqJvD5t7
         ad8WYjoT0ovYMls+4n4aN28233tx48mh8s0QPlq3k2Gl4t3arn+PDbgL9dRVLDLaLCLO
         B4MKrvOtXd0T+/biow1uUkIQn6HExfJ/QdQkpBXhaJX5zIOWz0aDXo2U+nbwD7vgpKow
         gfppvvD/O6Nsp+yH/7fT5Xl5flwEcO46v2Mxx4T2zf3+IHr1MY3TyKY6/7JmkiYJHYcX
         nnf5QM6/WyDQ0ZADC/auL9ZVDzH21q7RwVpiLKEeoXGVRYILk70TaXQ/9xsL0UBsg/9M
         oiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jG/Q75qDOR7plmuYpaGm0iLn7CnHXYAvRBkK8IXCAog=;
        b=VXs4ZsJRQ+JTVl6YpGmwFB9H4VJS+zUZz1YvJHazoWSsXVj4vkJJi6Atd2XIIZ3XBc
         1qDnXFLpTkFDoKr3BlSBg3Lu2xZ/nSQdj5kHERJrJP3nnMYM4Vn6m+5F21EFFGvJoRPt
         31TRTAdMv6jJguaPP7GtezG/CZ781zCkZktiDm266VgGcsCJi3U9x0L0IaVonKCrq0bt
         SFLwoULEbZ8nvh1k/zRTLbYJvpNdulBmCd4QqQLt3lWGHPqqtQJOZvtDdtFNkfPuCn23
         OK4zWwsBWFWLkT2jHF/QPGchQz5LOd1oszqTISNFMzBOmH4jatg8LLT7Z/HEt4c+PGUI
         /4Mg==
X-Gm-Message-State: APjAAAX9d+0u+gBBfGm66B4sekXMX60xwDxXpay9zXshb+TSb1HWc9fx
        ip/HndGdYgb3lckN3AM/aLNqwcJtAtB2Q2ucnLI=
X-Google-Smtp-Source: APXvYqzejQoOQww8WULJ3mBGNcet3EOpZeC+x1Wa4eiEi9Hq868ZX/Q7VnMbQs3o0Y4tREvoknmdNBQ+9gmwbS4N9Ic=
X-Received: by 2002:adf:b64e:: with SMTP id i14mr25050442wre.248.1562084576275;
 Tue, 02 Jul 2019 09:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190701122114.2952-1-charlesyeh522@gmail.com>
 <20190701133233.GI27333@localhost> <CAAZvQQ4Eb8CZbFUG=ZApDyft2ig8mOSj4shbQv_UVCw0pm8p_Q@mail.gmail.com>
 <20190701152942.GA3787@localhost>
In-Reply-To: <20190701152942.GA3787@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Wed, 3 Jul 2019 00:22:45 +0800
Message-ID: <CAAZvQQ6JDgkC2SD4eYzBVYhq3ApMwWc_-gXQQVMBH+CaXZSK5A@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v6] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
>         pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
>                         PL2303_HXN_FLOWCTRL_MASK,
>                         PL2303_HXN_CTRL_RTS_CTS);
>

Indent continuation lines at least two tabs<<--Done.

> I'm asking why you write the value 0 instead of 3 (or say, 0xfc)? Your
> documentation said bit 0 and 1 are used to reset the up and downstream
> pipes.
>
> To be more specific; what happens if I
>
>         1. set bit 0
>         2. clear bit 0?
>
> and leave the other bits alone (write back the same value, e.g. 0xfe).
>

You are right..
set "1" is reset.
set "0" is nothing.

I have used pl2303_update_reg instead pl2303_vendor_write which to reset
the upstream and downstream pipe data

Charles.


Johan Hovold <johan@kernel.org> =E6=96=BC 2019=E5=B9=B47=E6=9C=881=E6=97=A5=
 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Jul 01, 2019 at 11:11:02PM +0800, Charles Yeh wrote:
> > > > +             if (spriv->quirks & PL2303_QUIRK_LEGACY) {
> > > > +                     pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_=
MASK,
> > > > +                             0x40);
> > >
> > > No need to break this line even if you end up with slightly more than=
 80
> > > chars.
> > >
> > OK. I will ignore "WARNING: line over 80 characters".
>
> Yeah, it's ok to go slightly above 80 chars when it improves readability.
>
> > > > +             } else if (spriv->type =3D=3D &pl2303_type_data[TYPE_=
HXN]) {
> > > > +                     pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL=
,
> > > > +                             PL2303_HXN_FLOWCTRL_MASK,
> > > > +                             PL2303_HXN_CTRL_RTS_CTS);
> > >
> > > Again, continuation lines should be indented at least two tabs furthe=
r
> > > (you only use one tab now).
> > >
> >
> > I have done it the way you do today...but after checking
> > ./scripts/checkpatch.pl.. I got another warning message...
> > So I am a little confused now...
> > Previously before submitting.. must first pass ./scripts/checkpatch.pl
> > check. No ERROR, or WARRING message...
> >
> > I will return to the office tomorrow ... I will post another warning
> > message (according to the way you mentioned)
>
> checkpatch isn't always right. Just remember to indent continuation
> lines at least two tabs further, such as
>
>         pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
>                         PL2303_HXN_FLOWCTRL_MASK,
>                         PL2303_HXN_CTRL_RTS_CTS);
>
> > >         } else if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]) {
> > >
> > > > +                     pl2303_vendor_write(serial, PL2303_HXN_RESET_=
CONTROL,
> > > > +                             0);
> > >
> > > You again completely ignored my question about why you're wring 0
> > > instead of 3 here.
> > >
> > > I'll ignore your patch until you explain.
> >
> > 3. In pl2303_open: Because TYPE_HXN is different from the instruction o=
f reset
> >    down/up stream used by TYPE_HX.
> >    Therefore, we will also execute different instructions here.
> >    The default of chip Reset Control is 0xFF(TYPE_HXN), therefore we wi=
ll
> >    write 0x00 to reset down/up stream(TYPE_HXN).
>
> I'm asking why you write the value 0 instead of 3 (or say, 0xfc)? Your
> documentation said bit 0 and 1 are used to reset the up and downstream
> pipes.
>
> To be more specific; what happens if I
>
>         1. set bit 0
>         2. clear bit 0?
>
> and leave the other bits alone (write back the same value, e.g. 0xfe).
>
> Johan
