Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E54538A8B
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 14:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728338AbfFGMpx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 08:45:53 -0400
Received: from mail-pg1-f171.google.com ([209.85.215.171]:39504 "EHLO
        mail-pg1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728268AbfFGMpx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jun 2019 08:45:53 -0400
Received: by mail-pg1-f171.google.com with SMTP id 196so1130535pgc.6
        for <linux-usb@vger.kernel.org>; Fri, 07 Jun 2019 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VUhLlIzkGHj2QoxM2YQxdy09BTKTJ0GGXKKHaWDvqwQ=;
        b=go96K8qAF23C/dmce3XinPcinljoINDp9yW9vcTeZnBvCuAqVWyGvxMYlaS97ETW40
         ONb3QRe0j3ExricaCJmvEgfi87vNa4h9gPkvO1agOxoCLxq5OTC3JZwKSoiT/jJwsyUT
         gjO0SeR7IYPwc3RXJDGjyiL6q6NvjFb79SbG3VvQMLI4f0lqYOFzfboYbznLbNI4lNyP
         +p7QDJCm4xA35w7IP8bIqGoIWcTxUIBoPCYJWjxNKp9KvAH52UHLcLwMiV0b/3xp5811
         2ya/DLYIGXFXcwEHy+Q7i8i4GnU/qOIA6r7tPJCr4vbr4bd4clGMw6CBQeOMWOQfy8vy
         TsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VUhLlIzkGHj2QoxM2YQxdy09BTKTJ0GGXKKHaWDvqwQ=;
        b=cMLRUcRdBL+0jKDsSkIwGzc+k66Euu6QGWJCr+Gi4wJP1gxBXQrxJWx+f2Pg0ARx76
         62DnJj2Pg7F2T1Vt3WQfHw1svJ+KZvZJjiHRfJy+EnwWh3SQ3bvMAgX6CI+05C2/pDZy
         CGZiG4cUbM4bVJXq9C4HFJ0gu5AvO0qWitP4EcSi0qfd+4hALIsjZXSubr71F9enrBbS
         Q2lB2WdLL2KqbiaLCSJJ5FvGMsgPNvl8PbhiZYpSMqRqyM0EQoa6LsBFtucD7JHRrP0N
         hYDzYvBicvEv6cprP8KPEsjWtbTgkPBOLrpZXQMP3sEJ8po9N/KlrpaxkNIoJ2MWd0Br
         hfaA==
X-Gm-Message-State: APjAAAWYjAE+O+z/p1yCds0nmrtCLztgSPIs84WbOawwyOGSh04b7Idx
        Hy2x3g2fSdrl8aqg2c+8QJ+8tlom8CSLkILIOumIuw==
X-Google-Smtp-Source: APXvYqwah11ndu1qUGqAL8JojzO7WrMmg3ivIRe5UnDZwj5Q8BJyo1GqPlF8xE2cw4pl7pHYmAfQK6h+T0mDZ57uZBA=
X-Received: by 2002:a63:1919:: with SMTP id z25mr2561291pgl.440.1559911551486;
 Fri, 07 Jun 2019 05:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+xRHB28N_VUbcCit=81+wKK=A9X3aA4rTa9aShy7b2Bnw@mail.gmail.com>
 <877e9xd2nx.fsf@linux.intel.com> <CAAeHK+xG7-U7kWp1uTT2oA1-Krr2iw8SGnzrciw+0kuLr1qsYA@mail.gmail.com>
 <874l51d1l3.fsf@linux.intel.com> <CAAeHK+x-6Xgefkj1279rSGru4u6jSkZ6Tm_3h9eeqzJ6xUnfgA@mail.gmail.com>
 <871s05d0rg.fsf@linux.intel.com>
In-Reply-To: <871s05d0rg.fsf@linux.intel.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 7 Jun 2019 14:45:40 +0200
Message-ID: <CAAeHK+y8Aj1r1XyNHwXe2dF_yxoQSe2_u4-aDOPkYk9Q9tRGzA@mail.gmail.com>
Subject: Re: Pass transfer_buffer to gadget drivers
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 7, 2019 at 2:43 PM Felipe Balbi
<felipe.balbi@linux.intel.com> wrote:
>
>
> Hi,
>
> Andrey Konovalov <andreyknvl@google.com> writes:
> >> >> Andrey Konovalov <andreyknvl@google.com> writes:
> >> >> > I've noticed that when the host performs a control request,
> >> >> > urb->transfer_buffer/transfer_buffer_length are not passed to the
> >> >> > gadget drivers via the setup() call, the only thing that is passed is
> >> >> > the usb_ctrlrequest struct. Is there a way to get the transfer_buffer
> >> >> > from within a gadget driver? If not, what approach would the best to
> >> >> > implement this?
> >> >>
> >> >> I think you need to further explain what you mean here.
> >> >>
> >> >> What do you mean by gadget driver in this case?
> >> >>
> >> >> If you mean the drivers under drivers/usb/gadget/{function,legacy}
> >> >> directories then there's no way that they can have access to anything
> >> >> from the host.
> >> >>
> >> >> Remember that gadget and host are two completely distinct units. The
> >> >> only thing they share is a USB cable. When it comes to Control
> >> >> Transfers, if a data stage is necessary, that must be encoded in the
> >> >> wLength field of the control structure.
> >> >>
> >> >> Also, host side does *not* pass its usb_ctrlrequest struct to the
> >> >> gadget, it passes a series of 8 bytes which are oblivious to where in
> >> >> memory they were from the host point of view.
> >> >>
> >> >> If if you have the same machine acting as both host and device, each
> >> >> side has no knowledge of that fact.
> >> >
> >> > Hi Felipe,
> >> >
> >> > What I meant is that any module (gadget driver) that implements
> >> > usb_gadget_driver struct callbacks and registers it, will only get
> >> > usb_ctrlrequest through the setup() callback, but not the
> >> > transfer_buffer/length.
> >>
> >> A control request is *always* 8 bytes. That's mandated by the USB
> >> specification.
> >>
> >> > And therefore it can't access the data that is
> >> > attached to a control request.
> >>
> >> There is no data attached to a control request. A Control Transfer is
> >> composed of 2 or 3 stages:
> >>
> >> - SETUP stage
> >>         an 8 byte transfer descriptor type thing
> >>
> >> - (optional) Data stage
> >>         if wLength of control request contains a value > 0, then this
> >>         stage fires up to transfer the amount of data communicated in
> >>         wLength (during previous stage).
> >>
> >> - Status Stage
> >>         A zero length transfer to communicate successful end of transfer
> >>         (in case it completes fine) or an error (in case of STALL
> >>         condition).
> >
> > Hm, then why does the usb_control_msg() function accepts a data and
> > size arguments? Which are described in the comment as "pointer to the
> > data to send" and "length in bytes of the data to send" accordingly?
> > Or is this the buffer for the response?
>
> That's for the data stage :-)

Sure =)

>
> usb_control_msg() is an upper lever API to encode and entire Control
> Transfer (all stages of it).
>
> What is the problem you see, then?

The problem is that I want to receive that data (from the data stage)
from within my gadget driver module. But it's not passed to the
setup() callback. And the question is: how do I do that then?

>
> --
> balbi
