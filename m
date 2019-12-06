Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB2C01154AD
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 16:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfLFP5E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 10:57:04 -0500
Received: from mail-qv1-f45.google.com ([209.85.219.45]:42670 "EHLO
        mail-qv1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfLFP5E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 10:57:04 -0500
Received: by mail-qv1-f45.google.com with SMTP id q19so60335qvy.9
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2019 07:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xQn+49wpM+77/OckGdhTeDtAyRioQwcBTMymG1Vydcs=;
        b=TKie7vyeHu/n+ho2A1i6MRZqp3EYf+8fBWMYJw2AoYJQUnjwyv4bWfltQGxkyruFBf
         vKp3gfXuroZAaHk4LkSuyjC29VCC3Yj7swmkEroBOus8+ARnhSI5ZvdqTyC96iSep9SW
         FL1JEtW6COSPm65DxXMski+CB/oFfD3braUr5GLsyXQr4bh0om1qydHLSaYZhk+Bqimn
         RH7yfCcdWAdQtirZqC0ZrhpG6iKt2tdDInMhnLrM28LJ2yoEU5ONPms2JXxozQ/hIUqh
         yzX6LRYm8o0Uy/n5XXPAxyA2fCzbTWTviV8vAID5JfdY+QToTtarG6cwk0WrHWL8ySCE
         0jQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xQn+49wpM+77/OckGdhTeDtAyRioQwcBTMymG1Vydcs=;
        b=ktSqb6hqdLW0mV8XNeglsf1hGwd2kgj4jXDGSpBekG9KB1jHia7/pSednusd5ZPxQq
         /t6kZxOavKPrlAo/oU5KUP05LaX6ySuJXRDRROjOWoqPIycJwpTxHHbc3BgznIUZ/amC
         Np7/djcm+fDXZsr3FmhKWQvcnsxJukaNToMLmQPDhPtuOERp0b9lojXCNTkJ2qiceoaX
         lxPWcalFTFtv/26sreIzn5IERe2/7r2sAu2doUatj0QrZ7wo5liJVSLTfXs1+dhc/P4Q
         kbuL4T9gJbguMbTzJyBd1+0pTld5eMvYaE/RuAlKwHgoOfdX4tUYh3/IblqFETqzHO87
         LZxw==
X-Gm-Message-State: APjAAAW4fWCC8Jdc44O5TDZY9XSggxlE/9ALMqKfPCX7Pq7hQv3qkCCM
        Vc2wEUp2VeJ8nH0HsNUkAMDuQ/f7erVz0+cL+2QVwKSw
X-Google-Smtp-Source: APXvYqxOXc+i5qf8eR/U9hem/q94koCA12H8zsn/BiBqFg0Ka782J/uQe8tfN5nujEZsCh4EFb8t+6WtRQXpQ/LF3EQ=
X-Received: by 2002:a0c:f7c3:: with SMTP id f3mr13253207qvo.52.1575647823270;
 Fri, 06 Dec 2019 07:57:03 -0800 (PST)
MIME-Version: 1.0
References: <20191118133251.21401-1-dnlplm@gmail.com> <20191205145731.GM10631@localhost>
 <CAGRyCJGPzxT8AChC6sq-8v-PAQJFuY-bZqoHmoJiwGCyxrTgZg@mail.gmail.com> <20191206154330.GP10631@localhost>
In-Reply-To: <20191206154330.GP10631@localhost>
From:   Daniele Palmas <dnlplm@gmail.com>
Date:   Fri, 6 Dec 2019 16:56:52 +0100
Message-ID: <CAGRyCJGt1dsiRRgEJ9Yj2YrVW2OGVQ-6zFOh4P75Dbq0+sH5eA@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/1] usb: serial: option: add ZLP support for 0x1bc7/0x9010
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno ven 6 dic 2019 alle ore 16:43 Johan Hovold
<johan@kernel.org> ha scritto:
>
> >
> > > I wonder whether using option is the right thing to do here. We're just
> > > currently throwing everything modem related in here it seems. :)
> > >
> >
> > I understand your concern. At first, in fact, I tried to add support
> > for this in usb-serial-simple, but the change seemed to me more
> > impacting than the one I had to do for adding support in option.
> >
> > Let me know if you want me to continue investigating the
> > usb-serial-simple way or you have another advice.
>
> Yeah, I was thinking along those lines as well. Let me get me get back
> to you on that.
>

Ok, thanks, I'll wait for your thoughts on that before submitting V3
for the current patch.

Regards,
Daniele

> Johan
