Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA8842588
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2019 14:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730790AbfFLMYJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jun 2019 08:24:09 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40056 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbfFLMYJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jun 2019 08:24:09 -0400
Received: by mail-pg1-f194.google.com with SMTP id d30so8848892pgm.7
        for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2019 05:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HTx9pVShws6E3KRlDHnLkT1ceEgoq0Q1R6D1MiARoYk=;
        b=qbnMOAJQ7YZuZQHSzfFhyctbh3UPHW+0kHTH/qAEYyEGcDkBNp8Apok45chdC8AVEl
         uV6Z3MvqeCUwn46J4zE0Lo3lJafcYJV4UTPOnJKU0+kqs5Hr6xHC/kEbwPUpismM2FFd
         fwy8NH6NDxyOdV1m5jMuSoSQiUMR+3+zca/9WKGWtJ5qjxzTEIMIPhTziLO2yMwvXFAY
         DOEPS0XeuTlCCzoXSS26QySZTXwfFMFrmAFY/NqOblLMTi4lG6Iw0KjatAoYr0oSoN5S
         cXmEq1/f4IJD0XIdFXRYndA6QQ6lmtOFNfHToDl870cFE1Shv2jHOtd4zT3MxaHU4C7S
         +Wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HTx9pVShws6E3KRlDHnLkT1ceEgoq0Q1R6D1MiARoYk=;
        b=ZakWe6NJGLqVZ0mxruEV8mlD/4ZMa2lgghbz9GdDeu0srjTy9yuMJF2AadpXkC6udM
         b9DMd3vTcy5+n1Ud6ZcB6z3fOzCY1Qhedd2jTSJEH6YKa9j8hBA3LDBojzl9oMVDfXin
         OKRQgUHw/bL24zbArJbDLAwohnrBEURMmU8DIh4DDcQndZADkXKOnuX4HmLnpiGeE8Ab
         maeNL8g944Nj9G6U3KpzNOoyyIpXamJl7puIx37fkI6SUNqDMT09dg2ss5Xot1cqw8u5
         aOAFXZRI/0NrKRmkTydsSmHZCohpcopBp+Rh5in0ENdPtb6Lcljpn3rFFofLkrxN+x+J
         Ak8A==
X-Gm-Message-State: APjAAAXskPuJ7okh85KXIi4H3hXLqAJqBgPny9iCa21co+Rg+GhTxIko
        823t4/fUSh0nqt0juUEzciLFysWQ1z19RaVM9H0=
X-Google-Smtp-Source: APXvYqxs/ugqVjP6LoP5yo2vYW9Xl1OUlbSXi1XtpF1OrI16Pr3Z6IecPpBn7ZCm4/ViygTysPSKReHe4zwWcbPPpBo=
X-Received: by 2002:a63:c5:: with SMTP id 188mr25296142pga.108.1560342248096;
 Wed, 12 Jun 2019 05:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
 <20190611075431.GB7918@kuha.fi.intel.com> <CAB31r6V+PYppYJz29u_hfpiL6xqhhe+-2xZTRpqOmpLrtCdh8Q@mail.gmail.com>
 <20190612095532.GB19831@kuha.fi.intel.com>
In-Reply-To: <20190612095532.GB19831@kuha.fi.intel.com>
From:   Vladimir Yerilov <openmindead@gmail.com>
Date:   Wed, 12 Jun 2019 22:23:56 +1000
Message-ID: <CAB31r6WFwkJwnkqCy3Lw4f2ybZ63EoJFxAcLyDFvm_gHkLRrOQ@mail.gmail.com>
Subject: Re: kernel NULL pointer dereference, ucsi bug
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Yes, it works.
I've built 5.2-rc4 with this patch and it works fine now, the problem is go=
ne.
It is great that I didn't have to downgrade BIOS as a last resort in
my attempts to workaround this issue.

Thank you!

Cc to Greg in order to let him know that it is resolved now.

=D1=81=D1=80, 12 =D0=B8=D1=8E=D0=BD. 2019 =D0=B3. =D0=B2 19:55, Heikki Krog=
erus <heikki.krogerus@linux.intel.com>:
>
> On Tue, Jun 11, 2019 at 10:19:27PM +1000, Vladimir Yerilov wrote:
> > Hi Heikki,
> >
> > > What do you have connected to the USB Type-C connectors on the
> > machine when that happens?
> >
> > Now, on 5.2-rc4, it happens only during boot and when power cord is
> > connected to laptop's type-c charging port. Another port, which does
> > not support charging, does not cause this problem, I mean I can have
> > something connected to it or not, no issue is observed if charger is
> > disconnected. I even tried to connect my hub to the guilty charging
> > port, everything works fine until hub is powered from the charger, in
> > that case the bug happens again. This differs from my previous tests
> > when whatever I had connected to the charging port, caused failures,
> > even type C to A OTG cable. To summarize: now it happens when power
> > cord from the charger is connected during the boot, but if I connect
> > it after boot (e.g. after logging in to my X session), no crash
> > occurs.
> >
> > > Can you use the machine normally when nothing is connected to the USB=
 Type-C connectors
> >
> > Yeah, everything is great when nothing is connected to the faulty
> > charging port during the boot, and charger may be connected later, but
> > it's kinda... wrong.
> >
> > > Is it possible to send complete dmesg output after that happened?
> >
> > You can find everything attached (done with journalctl -k -xb)
>
> Thanks. I don't see anything the driver is doing wrong. I'm attaching
> a patch. Can you test if it fixes the issue?
>
> Br,
>
> --
> heikki



--=20
----
Best regards,
Vladimir Yerilov
