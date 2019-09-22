Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B129BABE4
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 00:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbfIVWRf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 22 Sep 2019 18:17:35 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:39550 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727485AbfIVWRe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 22 Sep 2019 18:17:34 -0400
Received: by mail-io1-f51.google.com with SMTP id a1so28919628ioc.6
        for <linux-usb@vger.kernel.org>; Sun, 22 Sep 2019 15:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=dqobuf/BrOxXasMTwIqqq7pm/XDIEuujQtxgD/0IH0Y=;
        b=mDdKYe/K6r01mq7wWY7gpR/AdV/FAvCCoi/st/yOqa0vAAJ3+dGgdr6H9E3evIwqUD
         +4OLPi2tNmePOzPY+kpKnR+/WCv0euqbp8HnvnksX0TSn9X//ojOllbYWEzurdvbgIOe
         +kJ7nA6Bznu7idRywo0PNJXnHcrdJVq8Papb9Dmjf4gSzX/RzQVYtPECxyd+6U2aVmAI
         nzLjFfQ+ZlDHzrtbDhnSSGZIqwj57hbyjhOcdvHkWo6RrFpvTed0LjCTDd0Jl2ono75s
         2CpBb4UJZKyW9lstbMfypcqxIkJzxgX4vMhO1UzV4FeBpUpNsLXBkmrEGDrkPvnNGhSt
         mvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=dqobuf/BrOxXasMTwIqqq7pm/XDIEuujQtxgD/0IH0Y=;
        b=Gjq54IPibENHz2OPsCFd/T2vtIxPLmHa7fML/M3DphnWEtModB8PF5gZj64d/Mc9XF
         OIi1ezF9o6z9iZWyTcLpoQZ9ZaKhMoAXFhKyYNe240pQ//fZlj/flNzbs10DmR73EpnX
         Cnl5bSU3is4w5pqhqBv4o/MdRRuuVD7D2t7wbKL2ofx5G22lQV4oHkalFTZIRuRRmo1G
         f+aYqh8c7xRgiTWYWdXK9zvjv5E0UL0q/uZh15bV1qzSTv1GbUo7g+yNjeVbF3dpU00j
         LH9WoA1qIxqZJ5MCV2cKwWPm+0LDd901lCacsbgNr1DB6Hw9nxwiYeZhAc61YL5eACUZ
         FUYg==
X-Gm-Message-State: APjAAAV9V7VFG71SKcCDX2mMKSScorVcCjedA1j+ltu0COGOO5eS1sKF
        b9TE5WL20ZM5iF89pxVjcL82UgJPeoSjutrn4nYI8FYk
X-Google-Smtp-Source: APXvYqzf8lsZl42VwKFAzwFMLnvhOG3agalEKDiLFNKAjQPS+KF7wQgF9cKhQ5bNDL3zOWRD3mkHVE5FsEHahfFvI2g=
X-Received: by 2002:a6b:4902:: with SMTP id u2mr7974033iob.301.1569190653997;
 Sun, 22 Sep 2019 15:17:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP; Sun, 22 Sep 2019 15:17:33
 -0700 (PDT)
In-Reply-To: <20190921044510.GA990793@kroah.com>
References: <CAA=hcWRF00syz8jB1+qdy1pFA7Wk_B=1Z_DT5vYuQrzFKhtZbw@mail.gmail.com>
 <20190917120258.GB489142@kroah.com> <CAA=hcWTD2zYD0gVTu6sDuRqUcTOnn42Gm0s1tOGvBQdQ40Q7LA@mail.gmail.com>
 <20190918054744.GA1830105@kroah.com> <CAA=hcWR__j20ZQY9H8zzTryEatSfe+yXLYQXSaXMvgy3pwdJKg@mail.gmail.com>
 <20190921044510.GA990793@kroah.com>
From:   JH <jupiter.hce@gmail.com>
Date:   Mon, 23 Sep 2019 08:17:33 +1000
Message-ID: <CAA=hcWTwi+PRepcT9xS2G0YjtV7e6+YWwxTrKLSv_=7T61ty8Q@mail.gmail.com>
Subject: Re: Failed to connect to 4G modem
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On 9/21/19, Greg KH <gregkh@linuxfoundation.org> wrote:
> You should never have to update any userspace code or library if the
> kernel is updated as we guarantee backwards compatibility.  If we did
> break something, please let us know and we will work very hard to fix
> it.
>
> This is a guarantee we made back in 2007 or so, and have been sticking
> to it since.
>
> There is no "major" upgrade issue here, the kernel does a new release
> every 3 months and changes the number, showing it is "newer" than the
> previous one.
>
> Hope this helps,

That demystified the kernel version many people misinterpreted, so I
can tell my colleagues we are ensured there would be no libraries
changes upgrading 5.3 to 5.4 LTS.

Thank you so much.

Kind regards,

- jupiter

> greg k-h
>
