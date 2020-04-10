Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 906F11A47C6
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2020 17:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgDJPNR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Apr 2020 11:13:17 -0400
Received: from mail-pl1-f181.google.com ([209.85.214.181]:32858 "EHLO
        mail-pl1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgDJPNR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Apr 2020 11:13:17 -0400
Received: by mail-pl1-f181.google.com with SMTP id ay1so764642plb.0
        for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2020 08:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XeogREMVwf0cgeT4ozB9w7tc5DpX25iOcdIiE1Oe5Jw=;
        b=Ml2rjPkXYsEqbbATAPLk/TPvu8U/hGlzBzLDl11nsY6KmC7sQkGOJ16o7FNh//fs3n
         SILDbJCUS7ugHauR8H+Ji0yX2IPWYMEm4AzRCdbMxqtig/WLqMX3xaaTg+1s8hV5cuKw
         2l3LxLo0X9aC/pt/Sya/NgkogxQIV77censqQV9n9CTNMBMKlIk2NiGqXL5u9hpAJwpN
         cU5Vafvd+gxJ8IxkahXWD5reKqSXj90N2bUN3EejBtYlbToHe2kWwiAX5N3w+YmqnNoW
         aeow1dKxMrc7+enorMlN3uvqLZWgwscPzou99w5h+tDMU0RyuVgOlvNS4Ci83ocKIJwD
         Xp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XeogREMVwf0cgeT4ozB9w7tc5DpX25iOcdIiE1Oe5Jw=;
        b=c7xfpJKt9ct4X31l3O8P/LQpSQeJaMXWihdKgccGWCBQkyF1P2CQSHL4UpRz4zWdi1
         CH0RmHCHe8mhxwfqWzyD0nM+M9eZgTwWvurIIF4O6Ifadgx5JgQxpnX6PV7Win2uxYY0
         U14MwjuAosldrR8yX9iEVffr8SQpLhmNAPDM8fnBOshbZNK8UdAmwaWTmbXkmuB8qmD8
         KyhA52YH34zEPGz5D/XO3e9TQ4T1Ab3FuuuH75xQNa9tL0eWlxhCZAsjN/EMWhNZ2UdI
         +bbTB/61cY8O5f9Z52tgx3BZo2KmCyn7Qwftlbpylg+MMM7iKw6mLYP30NSz7N4Q9wuv
         MlIw==
X-Gm-Message-State: AGi0PubOm9ErnR4I477kcpHmwzGUtIYs4hukJHgIT45BbiShSWj1ta7Z
        Xg+D7sVIq1SYov9hgtZoxn/ep9+83/LoGBAjhAqDCD5XRxI=
X-Google-Smtp-Source: APiQypJ4DwqFy9etemnzs6rmugnqKqA7FVaGq6BrJ9FBktkzaTbLfyMSPrrQsuIAp0BtH4HNFd+v6JYVUem7MQSrNUc=
X-Received: by 2002:a17:902:8204:: with SMTP id x4mr1742182pln.336.1586531596495;
 Fri, 10 Apr 2020 08:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+x7Fihwriocp8Kpr+AQks6h3syZa+g0Wd+Q62fg-y93Lg@mail.gmail.com>
 <Pine.LNX.4.44L0.2004092015180.30065-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2004092015180.30065-100000@netrider.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 10 Apr 2020 17:13:05 +0200
Message-ID: <CAAeHK+x5-z85v97ySvX+5=sJTn=hVbpkbCiQBZCD-6BKvKPSpQ@mail.gmail.com>
Subject: Re: Testing endpoint halt support for raw-gadget
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 10, 2020 at 2:29 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, 9 Apr 2020, Andrey Konovalov wrote:
>
> > Hi Alan and Greg,
> >
> > I've been thinking about what kind of features raw-gadget might be
> > missing, that would allow more flexibility in emulating USB devices.
> > One of the things that is currently missing is halting endpoints.
> > Adding this functionality seems to be fairly easy, but it's unclear to
> > me how to test it. Any suggestions?
>
> You should use the usbtest driver along with the testusb program in
> tools/usb.  Of course, to do it you will need a userspace driver for
> raw-gadget.  usbtest works best with gadget-zero, but it can be used
> (in degraded form) with any USB device.

Oh, right, I'll try that!

> > Also, are there some other features that might make sense to add? I
> > see that e.g. GadgetFS has GADGETFS_FIFO_STATUS/FLUSH ioctls. Are
> > those useful?
>
> I believe that was included just as an emulation of some existing UDC
> hardware.  It's rather controller-specific, not of general interest.
> (The general idea is that the UDC says that an IN request completes
> when its data has been loaded into the controller's FIFO, rather than
> when the data has actually been sent to the host.)

OK, then I guess raw-gadget won't need those at least just yet.

> Have you implemented wedge as well as halt?  Wedge is needed for the
> mass-storage protocol; as far as I know it isn't used anywhere else.

No, I didn't know about "wedge" at all :) Looks like the API for it is
really simple, just usb_ep_set_wedge(). I'll need to figure out what
it is and how it works, and I'll send a patch that adds halt/wedge
support then.

> And have you given any thought to suspend/resume support?  It's a bit
> tricky because you have to consider both gadget suspend and USB bus
> suspend.

Hm, no. Is there something specific I need to consider to support it?
I guess I'll need to read about how it works as well, before I can
understand what it would require and ask meaningful questions.

> Nothing else springs to mind.

Something else: I've been testing raw-gadget with various UDCs that I
have [1] and everything seems to work, except for emulating SuperSpeed
devices with net2280. I've just found it out yesterday night, and
haven't had a chance to debug that yet, but if you know about some
potential issues I could encounter with SuperSpeed/USB3+, please let
me know.

Thank you, Alan!

[1] https://github.com/xairy/raw-gadget#usb-device-controllers
