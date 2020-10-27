Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9DB29CA09
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 21:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1831142AbgJ0USQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 16:18:16 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:46078 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1831139AbgJ0USQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Oct 2020 16:18:16 -0400
Received: by mail-vs1-f67.google.com with SMTP id r1so1600340vsi.12
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2020 13:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=x5S85K1yKGbYgWkn0d3djUo2W9yMnfITU9bTMzcWbVQ=;
        b=rfoTQNnuz/KOqhjOmm1Hr4/CrQ/T/INA9njPNTxujMU7pKLDfcKhfXxmuyL19uOQ8f
         5qcJ2Jdnm+1/g1SrU65xypkqe5lHYe7ZGM5fGEYp8q1mn7KlGAiNBdmTtXzPhCOpVhaX
         vh8vGe7Cx4h3X4Fom43GMdiGhFjnB2SigrPOXbVz+OlLj6UaW35GWH3YDneFy8sYAgwx
         MQCaIVj8ofIfgNnKGN0qE3kPv07gcutZU+SBXaXtTEhvMka59YSE4f+RhpyXsEZvW5gL
         zeaZ8PlYKZLE+ijf+sCe+++qLzU4wfnr4puDWYbRSmWNqPU3qjJuXIPhk6vGTe7zg0BR
         elXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=x5S85K1yKGbYgWkn0d3djUo2W9yMnfITU9bTMzcWbVQ=;
        b=oOOWgUhe5MrgsrH6ouA32U5fNnGYfzaMbL4hmGjS9AJfnMiACK3HqIEeBYuUqrHodZ
         pbbMmHglda7RHmtn05koaSq/AZQ4A1Bx/b9lYwGgCdi544QBqVZrCGYakzC3acn8X9eh
         KOdVz+M+/+hD7qgLBAGKOdBzggM3SCyGmPDqqH7Yn6atw2cDxkkTmQgkByHQiHnO3A0b
         Gzt1Z7QOMbGc3hdbsynM590mcD3xae9FaZD3tjsEoUMqJEv7sw4q55gW6wDNowapqHgk
         Q9OVQhuocvUehF09R67iUoVeyePrdiLwQX+YZcHu7OIjcE03SOJmOdQuQrKTxOeEAf0G
         WayA==
X-Gm-Message-State: AOAM5332xYS3xLwXIWspqYENvyK6avD9P78Uq+Kcgzl4jaFhtdrYAnRL
        OasJsR5utc6pdc/4EZkz8ONGAIfgkCd94/+CApM=
X-Google-Smtp-Source: ABdhPJwEemBe8i7dpwG1HeYmK2mQxRuoJA2pec9dJzUnB6ddimBe3hN6RY0ecmJ4TYyq5x5o1fjiuPY+GBY1gPmFEt4=
X-Received: by 2002:a67:798e:: with SMTP id u136mr3361341vsc.47.1603829893715;
 Tue, 27 Oct 2020 13:18:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9f:264f:0:0:0:0:0 with HTTP; Tue, 27 Oct 2020 13:18:13
 -0700 (PDT)
In-Reply-To: <CA+uuBqZ6JhCq1ydU-9A+en3QO=9zX9LuEJ8+P0YvEzUE+9sYoA@mail.gmail.com>
References: <20200916015621.EFCDA374023F@freecalypso.org> <20200929101330.GQ24441@localhost>
 <CA+uuBqY83q+UiRsYxBckXvbtYf4sRxqB_8eXXPgEKAOqTwD=vg@mail.gmail.com>
 <20201005105722.GN5141@localhost> <CA+uuBqZ6JhCq1ydU-9A+en3QO=9zX9LuEJ8+P0YvEzUE+9sYoA@mail.gmail.com>
From:   Mychaela Falconia <mychaela.falconia@gmail.com>
Date:   Tue, 27 Oct 2020 12:18:13 -0800
Message-ID: <CA+uuBqZSozH_513OyiDyuh1DcvPrCkBer=_wedLQEEFSbdDrkw@mail.gmail.com>
Subject: Re: [PATCH 0/3] a family of FTDI-based devices that need ftdi_sio quirks
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

Our last exchange regarding my proposed ftdi_sio driver patch adding
the needed quirk for DUART28C took place 3 weeks ago on October 5.
Your last argument against my patch was this one:

https://marc.info/?l=linux-usb&m=160189545216969&w=2

And here is my rebuttal to that argument made the same day:

https://marc.info/?l=linux-usb&m=160192817717108&w=2

In your October 5 argument you wrote:

> Let me give this some more thought.

It has been 3 weeks - do you have any more thoughts that address my
not yet answered rebuttal arguments in defense of my patch?  My key
arguments are:

* The "standard" behaviour of Linux and other Unix-derived OSes of
unconditionally asserting DTR & RTS on tty port open (or upon leaving
B0 state) without giving userspace any ability to say "no, please
don't do it" is a philosophical design bug, one that goes all the way
back to original 1970s UNIX - but long-standing tradition does not
make right.

* Particularly in the present age of USB-serial adapters with LVCMOS
rather than RS-232 electrical signals, this Unix/POSIX/Linux serial
port handling philosophical design bug is hampering hardware engineers'
ability to produce otherwise clean and elegant circuit designs.

* Because Windows does NOT exhibit the same philosophical design bug
in this regard as Unix/POSIX/Linux, there may be hw devices that were
made for use with Windows, that depend on glitch-free DTR and/or RTS,
and which will fail to work correctly with current Linux.  When such
cases occur, the party at fault is Linux and not the hardware design -
the hardware engineers were merely exercising their natural right to
make simple and elegant circuit designs that work well with OSes that
are free of philosophical design bugs, it is not our fault as hw
engineers that Linux inherited a philosophical design bug from Ancient
UNIX by way of POSIX.

* A minimally invasive surgical solution in the form of driver quirks
that suppress the traditional DTR & RTS behaviour for those specific
hw devices for which it is unacceptable is more practical than trying
to fix the root-cause Unix philosophical design bug 45 y too late.

I would appreciate a response to my arguments.

Sincerely,
Mychaela,
custom hardware designer,
she/her/hers
