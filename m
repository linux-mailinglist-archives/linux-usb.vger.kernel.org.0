Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7C9F5ACB
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2019 23:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730933AbfKHWSv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Nov 2019 17:18:51 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33670 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730923AbfKHWSv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Nov 2019 17:18:51 -0500
Received: by mail-pg1-f193.google.com with SMTP id h27so4903051pgn.0
        for <linux-usb@vger.kernel.org>; Fri, 08 Nov 2019 14:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7IqcEdYpIhKi7OhB48nFEV4cOEv0bt3kSka2RQuhHz8=;
        b=TwbUgVQWwmE9El4cplMMqkhD6lFeocES3EUaM4ERY+x67cSpXlpUv0iPKzXbSuwJWv
         m+j1IRJnoXZl66UtGaV7D2vEt5/G19fT1Qri0hTubfAKw1Sn/19KXh6eOskZM4yRwdLa
         Eg+P2n6vrhkm1ROMj9E7U4NZu620y1DJGNS/ZeMzJInzmu0ciIAAf5w8pZKOyT3m95W9
         5GJ3831+TWQJmCCsY7CprfqE+476rujpBTIEAa/Ma7rDb2LwnkWD0+wUGkweH7UO9sh2
         AaJMfiyFIS2nW1u2fIP5eXA7g3IU1GyvDEltuUdVWjsmIDsUyhSgbHT8AwKac/YMlBBm
         4nTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7IqcEdYpIhKi7OhB48nFEV4cOEv0bt3kSka2RQuhHz8=;
        b=T4KDjYmTxa4VhINLoFGTB1+3jetLgqQYWcpXANV1CARZkPkx+GrlCHXZEm64EW+leM
         +RVwHa6NnIiHAGZ5I7newMl8SoGid1TXXlwY3NQ3QTsi+D0xfT2/kX9YH4nKQoe2awCG
         6FL5VIWU/4zmhxSz88nknnZmt+5CpdBfNQfEQ26pLgOjkBFLvDCMbC3AtySrSGXfefZI
         60BbXFSD+KL0OVAqYllhcrUL6dvZwHF+YwcINxGV6y90IUsLq7nDqFfCInYWcXz4cJ8/
         QRwpo4EyEC4qg1pNtj0UhDzrVmccoBBe24DXRny2o/rxjOdhkawnMu5XEu7Mpl6Hp19j
         ggKA==
X-Gm-Message-State: APjAAAX81VYD9WQ3YF//ePWACoKKwIUMKpJmHrjdm/Z6e71R7UETu3AC
        +i+aNHoX/EZlt5pxHSOekGNBSlw7BtEL9CSvR1Ia0A==
X-Google-Smtp-Source: APXvYqzdyUzLuAwMhZW4y2OkjG5vQLw1oKoAkmXM11M5t1OqHZxwhul/lYCXfT3gnN8OvRnQ28xVp9c+pxtGRtMIXwk=
X-Received: by 2002:a17:90a:35d0:: with SMTP id r74mr16848412pjb.47.1573251530363;
 Fri, 08 Nov 2019 14:18:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573236684.git.andreyknvl@google.com> <Pine.LNX.4.44L0.1911081642461.1498-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1911081642461.1498-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 8 Nov 2019 23:18:39 +0100
Message-ID: <CAAeHK+zyvqJs_5X61NriLdHoityTdVJ0O=a-xrcq+-7Vb_F0FQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] usb: gadget: add raw-gadget interface
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Felipe Balbi <balbi@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 8, 2019 at 10:45 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, 8 Nov 2019, Andrey Konovalov wrote:
>
> > This patchset (currently a single patch) adds a new userspace interface
> > for the USB Gadget subsystem called USB Raw Gadget (I don't mind changing
> > the name to something else if there are better ideas). This is what
> > currently being used to enable coverage-buided USB fuzzing with syzkaller:
> >
> > https://github.com/google/syzkaller/blob/master/docs/linux/external_fuzzing_usb.md
> >
> > Initially I was using GadgetFS (together with the Dummy HCD/UDC module)
> > to perform emulation of USB devices for fuzzing, but later switched to a
> > custom written interface. The incentive to implement a different interface
> > was to provide a somewhat raw and direct access to the USB Gadget layer
> > for the userspace, where every USB request is passed to the userspace to
> > get a response. See documentation for the list of differences between
> > Raw Gadget and GadgetFS.
> >
> > This patchset has been pushed to the public Linux kernel Gerrit instance:
> >
> > https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2144
> >
> > Andrey Konovalov (1):
> >   usb: gadget: add raw-gadget interface
> >
> >  Documentation/usb/index.rst         |    1 +
> >  Documentation/usb/raw-gadget.rst    |   60 ++
> >  drivers/usb/gadget/Kconfig          |    9 +
> >  drivers/usb/gadget/Makefile         |    2 +
> >  drivers/usb/gadget/raw.c            | 1150 +++++++++++++++++++++++++++
>
> As a general rule, gadget drivers don't go directly in
> drivers/usb/gadget.  raw.c counts as a legacy driver (because it's not
> written to use the composite gadget framework), so it belongs in
> drivers/usb/gadget/legacy.  That's where the gadgetfs driver lives, for
> example.

Hi Alan! Sure, I'll move it to legacy/ in v2. Thanks!
