Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3DA0332E3
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2019 16:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729334AbfFCO6u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jun 2019 10:58:50 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38023 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729123AbfFCO6t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Jun 2019 10:58:49 -0400
Received: by mail-pg1-f194.google.com with SMTP id v11so8434076pgl.5
        for <linux-usb@vger.kernel.org>; Mon, 03 Jun 2019 07:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/YmcpXNB3GtxjI0gi8TM4oLDZ/ddRxsoZKMUEoa2+RQ=;
        b=LDM9pzCuBg06bpYz0KdRX+sSvYt2RPGYKRQ6Ax2xuwHmYIyWmEwRP5PBiFKMyW9xjQ
         G7YjY4lK6qAStXZcymn564fnX+1LvWTVuqiJbTlZsewhzUj8AQQLB8lGShkIQa0Xw2bI
         1o80oqiJzvHAz8CIPa6p4dz3r/tABtFEgARHZ1JOsErFjIYEHpWFKi6O9inv27hTr2ap
         /Iz0giPDYPgCzu7/UbAZf++N+BFdtXVBk1KUMfhNlvLtNtIDt7uaiNyX7ek1BfAkNAlB
         jZ5GFNfKpHayo2irnLSxdpgkYTlG//KTQYakM8Re/SKo/MfIXvcrvJ9VekClABHQ6xmT
         8UIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/YmcpXNB3GtxjI0gi8TM4oLDZ/ddRxsoZKMUEoa2+RQ=;
        b=jlLVhGt778EzYBh5U0Jm/kVnN8VSS9QjdTwu2XRgv9b3f8TUPWMqxJx9IU34niX0DT
         qRKq3uMZjRLmfMg0rOM+Qw8efSKkYB/2vrK1lJsbO6K5if1a0CldMAIUoXKy/fDjKOox
         0WVkzADVDL8idjuoddc/YMTeLh9fh7ftniOqexf8LZnWCar8HNpu7vXadhBNz1JZbKn2
         UcPXvTtV5tJkGdFM2g8F246SfQLA3WUYDh91hYbgH2JJN3FAJT0LqMZfCyub44losWrQ
         hBxhBlGizjsjfsJD1h+4y2S6kinr/Py696TaPXqx7oEwI8+1OZZKgEjfZRiHwMqg0FIh
         PM1Q==
X-Gm-Message-State: APjAAAXcoduD8/m96JzLInf43mmF0m9Ia826Vclxp0FOUQvE8vcGTdrZ
        TrHdqSpTRCG0q/ORMj6BzPqIx0ut7MO6ao5A3dYphgrypqA=
X-Google-Smtp-Source: APXvYqwgLeNi+kJ9tf9mkdaPYabezoneWlyEZyhVZRiZGvFErNCFVA5kdfXc6QyeLET1STo+Lq7+Nif2j+i4aIlgq4w=
X-Received: by 2002:aa7:8052:: with SMTP id y18mr453002pfm.169.1559573929194;
 Mon, 03 Jun 2019 07:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
 <20190603131258.GA10397@kroah.com>
In-Reply-To: <20190603131258.GA10397@kroah.com>
From:   Vladimir Yerilov <openmindead@gmail.com>
Date:   Tue, 4 Jun 2019 00:58:38 +1000
Message-ID: <CAB31r6VK12FXoPh6eNfE1v_Tgjv917Nh7699=TZpm4SkCVMm-w@mail.gmail.com>
Subject: Re: kernel NULL pointer dereference, ucsi bug
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No, I can't.

Unfortunately, this exceeds the scope of my knowledge. I simply don't
know enough to understand your request correctly. What I can is to
compile and try some pre-rc1 5.2 kernel and see how it goes. Also I
managed to trace the source of this problem more precisely.
The issue happens only during the boot with any cable connected to USB
type C charging port. I have 2 of them: one with power delivery / data
transfer / video output capabilities, another one is capable for data
transfer only. So the failing one is power delivery port. No matter
what is connected - I tried charger cable, OTG cable (C to A USB) and
USB type C hub - all cause the same bug, but only charger's one
actually had power from the wall.

Plugging a cable *after* logging in, however, doesn't seem to cause
any of what I've described in the original bugreport.

Thank you for your help,
Vladimir


=D0=BF=D0=BD, 3 =D0=B8=D1=8E=D0=BD. 2019 =D0=B3. =D0=B2 23:13, Greg KH <gre=
gkh@linuxfoundation.org>:
>
> On Sun, Jun 02, 2019 at 09:24:43PM +1000, Vladimir Yerilov wrote:
> > Good day,
> >
> > There's a problem with ucsi starting from 5.2-rc1 (maybe earlier
> > versions of 5.2 are affected too).
> > Recently I've tried these versions of rc3 (commits), all have this issu=
e:
> > 3ab4436f688c2d2f221793953cd05435ca84261c (05/31)
> > 3ea3091f1bd8586125848c62be295910e9802af0
> > cd6c84d8f0cdc911df435bb075ba22ce3c605b07 (rc2)
>
> Can you run 'git bisect' to see what the exact offending patch is?
>
> thanks,
>
> greg k-h



--=20
----
Best regards,
Vladimir Yerilov
