Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBBAC11AD5B
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 15:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729686AbfLKOYn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 09:24:43 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37942 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfLKOYm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 09:24:42 -0500
Received: by mail-lf1-f66.google.com with SMTP id r14so16858585lfm.5
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 06:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=vXagUjoDwOILH4knoZ7XggkqJmjTTvfQh6XFK7u7NaY=;
        b=i6Cr/ivBHJ90aejro3fBk0PqOc37XrKof6YerpuXmqLgxB8haAXYuWAVPt2L4Dv/M9
         RhAeQwlNhFao1EFmVBuUfwy6Kk5l7z95IbdKYbiMJjrV7hW806cpThUf6RlyJ+0KAGhF
         qRWFu/FrAiqp1JrUOrVGxzaeZuevZlp21CP3MBJGYW79UJ/GH7hvCNlVJsk8pS3PUwVg
         QqmuKFAVav8aatZ+iv8qPXDOhgLqiJR5kpKPU4/+meGo7FH7yxZW44eCOVfwYQ2bYPHN
         vE/rxWkj7/oHVBuJHKzGaktwPm4fuxyW+xzm1kgpvfEKsemiu6lM12w6x7zsSBpmWVK1
         LsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=vXagUjoDwOILH4knoZ7XggkqJmjTTvfQh6XFK7u7NaY=;
        b=OTZ2RfrxnZvAHfeYvQZ5KdUU1F5fY6OQ70WQtnaZElfirEIFx9adWuUehKTvGf2UBF
         tE4KBCPO80QdCJKNp11MF5AOulloKtXVACpPf+cEImer2pd8W+nuE4yvRNv8/698EkTK
         C5gSlI7DwsAPanoCHMpeR7NqdmVBHL/vefRcbTTq9FouTdqAE07arci22g2D+qe9HObq
         RDfuzCuszJRW9p80x1AhcNgynENefGri8FTIYIZvA/FeuoBpvYgrX5Nkr6Bs0/XxhLQK
         dxost36SgNZLR6nkRfzjZIbtXh1fRq+T2IYRi8TBUhD1R/v5BOZ8cZ7vGGUcVdFZhjh7
         FzWg==
X-Gm-Message-State: APjAAAWFyuO60o2Ae/x+xwKA/xufPL3qXYrDz1jBxaASo7EU328Iu5dH
        78nCGiqDILk6KgG6C/BqtfgS1OBW2Tw=
X-Google-Smtp-Source: APXvYqx9AppZig+KrznekSazq2+8r3kkWPGjwTcC8GUdkFj3DE+IgsCz6R96CjG8g/O+g6yiB6iaaw==
X-Received: by 2002:ac2:5444:: with SMTP id d4mr2479929lfn.49.1576074280624;
        Wed, 11 Dec 2019 06:24:40 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id e14sm1434357ljj.36.2019.12.11.06.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 06:24:39 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB fixes for v5.5-rc2
In-Reply-To: <87h827x7mv.fsf@kernel.org>
References: <87h827x7mv.fsf@kernel.org>
Date:   Wed, 11 Dec 2019 16:25:26 +0200
Message-ID: <87eexbx7l5.fsf@kernel.org>
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


(off course I forgot linux-usb, sorry)

Felipe Balbi <balbi@kernel.org> writes:

> Hi Greg,
>
> here's a list of 4 patches to be merged for the next -rc cycle.
>
> Sorry for the long delay, but since I changed jobs recently, I'm still
> getting the hang of things. Moreover, my laptop failed couple of days
> ago. :-s
>
> I'll try to avoid these long delays in the future by scheduling a
> specific time every week to go over the linux-usb mailing list.
>
> Cheers
>
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c3=
5a:
>
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-=
for-v5.5-rc2
>
> for you to fetch changes up to e5b5da96da50ef30abb39cb9f694e99366404d24:
>
>   usb: gadget: fix wrong endpoint desc (2019-12-10 14:56:10 +0200)
>
> ----------------------------------------------------------------
> USB: fixes for v5.5-rc2
>
> Only four patches here this time around. Three of them are on dwc3
> fixing some small bugs related to our 'started' flag.
>
> None are major fixes but they're important nevertheless.
>
> ----------------------------------------------------------------
> EJ Hsu (1):
>       usb: gadget: fix wrong endpoint desc
>
> Tejas Joglekar (1):
>       usb: dwc3: gadget: Fix logical condition
>
> Thinh Nguyen (2):
>       usb: dwc3: gadget: Clear started flag for non-IOC
>       usb: dwc3: ep0: Clear started flag on completion
>
>  drivers/usb/dwc3/ep0.c                | 8 ++++++++
>  drivers/usb/dwc3/gadget.c             | 5 ++++-
>  drivers/usb/gadget/function/f_ecm.c   | 6 +++++-
>  drivers/usb/gadget/function/f_rndis.c | 1 +
>  4 files changed, 18 insertions(+), 2 deletions(-)
>
> --=20
> balbi

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3w/FYACgkQzL64meEa
mQZRAQ//ZAqF9sUjjwmU93Ze7Kt0hx06QeOm2tOONkcV3WAT58xM13bmVgJo9+1M
yJdkOA6xDI8Aujag/8E9ce3igATzk34pMUa/7ZUEu/ehYjevKpuVG3G6U8WCZjPK
SyR/s4Cqg5nf89YGIqNgKi1K6OZo1mokm4biQWeqAvY3t7L5IBy2KAxaFd3Bfarr
Q6WWotBHLpbNN8WCFmcxHAexLmEcu94EEsaXxLOKXlRkbhUrHPGmcgKqPaWGVtae
n8us3cjj9PS4TWDrQbwHdYjT5dAQLk6PAjXXwHoblzfXWM0SHy68bhqp0ato1nHz
jCmJAZFiqmqgMsb4sE7yOCAjE0ffiVThUEDQ2aOgk4kJ4uXXF8jo+Z0t6VkQ3ORY
+pF8PDxmlvVXJOCMhaw2xNKVYOUnr5vuMc+KJPQIA12KyrQjypwwNFFm0ksu/zl9
PIsHehBcEZkBMNqv9QSfw4sGOSlyBG0lMJFFU+PrGt/fIkE7jS+RU1kUgACLGmLs
BN830vtMNu2SRDRT9NEUETjIxLisjf5ClQZ19vmB9DoyWJJHMP02GDtfkowb5yIY
YSZHxkn8aCWaEuuk9Th/j0p/F9XZHiELffuAvN+i6V1e36yhtReH4aT9DlzJc4lE
5dSTI7BQTO2tIjUcYF2CFIHUIbki2t/a7VV78omBosRyixaZa/k=
=0Hnd
-----END PGP SIGNATURE-----
--=-=-=--
