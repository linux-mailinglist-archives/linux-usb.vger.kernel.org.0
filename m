Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1A47538696
	for <lists+linux-usb@lfdr.de>; Mon, 30 May 2022 19:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239673AbiE3RJO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 May 2022 13:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237650AbiE3RJM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 May 2022 13:09:12 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2763F59956
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 10:09:11 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-f2a4c51c45so15037316fac.9
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 10:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3pPgLSe0hAiUkDeapON9X9XhXqKwvlbha3rD5980Slg=;
        b=KlCDIygRoDdJLTnC3YaeKwYRz3sSNjR8UO7T8XU4vU3AyYyeuG+cCY2JdYivqOAbv2
         DWWAyjrD2XFkhSCT6o4UZ3kGYMRgCFsv2OJozGiOwoVfsD9A0h/E/aPMSDnkFnx+EW0O
         j86K6+1f6r0luUxRPwgqB4YFZpc9nwsxdlHMEEznYnuVGWI7ZAetXmocWNz0Qd0TO0KL
         BDTxfMK9hocvDatFgqIYkXGvwAvcovpkSNAkr4iJFjgniWWhV+6OrF7vbopZhgyFFh53
         /+ocMw8VD9hW7dLZR2r/MRGh0lqwFtVhjqYNrbdhW4wG7FCoYrqPbVKk0TVT4jtBfI3F
         ZiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3pPgLSe0hAiUkDeapON9X9XhXqKwvlbha3rD5980Slg=;
        b=qaqzVFzw3FICtx7VDfHyPsEbvHJxIE93W2kRTXaY7A2OIi6NAe5wcd5sIREY+PUCuS
         apHWoZOoN3788KChozyRz9wNGT0brrb/OX7pMtBuKzClUmPxx8A/KMQuWfbvAYWwfLoj
         0lukl3B8xRnxmHwT01To1Ufum4CqrKuyYK71EIF/htZitxzymz+iFUV+67PCgGv6LBRk
         aDobxz+IODlBxl09ioonbwqUq04xwKlsNkBhky1EDuMo/US6krGj+1dB2+eyueDv5PJ4
         iUK3vE8lbDrJIx95aLXeHjLyi6RtBltZA7RulAgwhDzlgFXb7RP+nQYg+dbJU1lfVTzD
         +cZw==
X-Gm-Message-State: AOAM532rm9e7C5R5/+2X+EVOe1qk+eqO+NWIIWbmEGkx4R3ScY7wAuNm
        aIiRRlskZYNZZEBzwE86ywjxqZguG52YKnVzPrJkIdhdZ+g=
X-Google-Smtp-Source: ABdhPJynATd2XDhJOcjctXN/rF6wfMkZpEXSA2U2go77lRiHAdqlshmANp/pacGpOneVuXT4refFZtToJZWJZMKKj6o=
X-Received: by 2002:a05:6870:3509:b0:f3:44ea:f034 with SMTP id
 k9-20020a056870350900b000f344eaf034mr1640591oah.216.1653930550373; Mon, 30
 May 2022 10:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220530090003.351702-1-c.lobrano@gmail.com> <CAGRyCJHZA2WB=qPh8-HD6VMTHs2xWApbtQTLLSngVzm=S7XqFA@mail.gmail.com>
In-Reply-To: <CAGRyCJHZA2WB=qPh8-HD6VMTHs2xWApbtQTLLSngVzm=S7XqFA@mail.gmail.com>
From:   Carlo Lobrano <c.lobrano@gmail.com>
Date:   Mon, 30 May 2022 19:07:21 +0200
Message-ID: <CA+KuA8cOuqnNyG8HQ-e=9XjL6reA_ZtohBdXHVWi5oSuDwXzRw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: serial: Add support for Telit LN910Cx 0x1250 composition
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Daniele,

On Mon, 30 May 2022 at 17:31, Daniele Palmas <dnlplm@gmail.com> wrote:
>
> Hi Carlo,
>
> Il giorno lun 30 mag 2022 alle ore 15:53 Carlo Lobrano
> <c.lobrano@gmail.com> ha scritto:
> >
> > 0x1250: rmnet, tty, tty, tty, tty
> >
> > Signed-off-by: Carlo Lobrano <c.lobrano@gmail.com>
> > ---
> >
> > v2: use RSVD in place of NCTRL for interface 0 (rmnet)
> >
> >  drivers/usb/serial/option.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> > index 152ad882657d..cd9aa61ec801 100644
> > --- a/drivers/usb/serial/option.c
> > +++ b/drivers/usb/serial/option.c
> > @@ -1275,6 +1275,8 @@ static const struct usb_device_id option_ids[] = {
> >           .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
> >         { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1231, 0xff),    /* Telit LE910Cx (RNDIS) */
> >           .driver_info = NCTRL(2) | RSVD(3) },
> > +       { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1250, 0xff),    /* Telit LE910Cx (rmnet) */
> > +         .driver_info = RSVD(0) },
>
> The content of the patch looks good, but the subject needs to be
> fixed, since the composition does not belong to "LN910Cx", but
> "LE910Cx": sorry for not having noticed that in v1.
>
> Since you are there, it would be also preferred to have the prefix as:
>
> USB: serial: option: ....
>
> and maybe it could be worth adding something more in the body than
> only the single composition, e.g.
>
> Add support for...
>
> Thanks,
> Daniele
>
> >         { USB_DEVICE(TELIT_VENDOR_ID, 0x1260),
> >           .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
> >         { USB_DEVICE(TELIT_VENDOR_ID, 0x1261),
> > --
> > 2.25.1
> >

thank you for your review. There is definitely a typo in modem's name,
and I also agree with your other notes.
I will update the patch with what you suggested

Thanks,
Carlo
