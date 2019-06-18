Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B97CF4A233
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 15:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729050AbfFRNbn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 09:31:43 -0400
Received: from mail-pg1-f180.google.com ([209.85.215.180]:40331 "EHLO
        mail-pg1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbfFRNbn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 09:31:43 -0400
Received: by mail-pg1-f180.google.com with SMTP id w10so3059446pgj.7
        for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2019 06:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wrSsDvVujzONLYuHd7ETPPrSaHzxwoG9w0OakV6nUm0=;
        b=f/1mIfs+6dtpzmQwolr2Ok5GYtauTsXgnbM6zGBcb+PJoVHx4XA8w+cv/Z+SJRLNO5
         zZ0KZQ9ISaJSEXNKaeBDLIlrSnxE6dUgtKem3IJVgQ4ORrku7SziCBD27+3PVt05IShC
         fovwyF6lhk930owWJY6FAtBlWHkJXBsm+OVFojK36eAhcNOHfbV1hMcEoWe0CqhpagPK
         JpakXiis6XOzemvUr6wghbpWuAunenm2KCdp3WWSweXBjYo9dR6yVNiUiPAexXtS19gh
         yKQLCJCk81VGNLHId7zY9/XWdR63IJ/ovmUjqymYEZoPNP5pHNiH/FvnJSFXUoqnncrW
         I1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wrSsDvVujzONLYuHd7ETPPrSaHzxwoG9w0OakV6nUm0=;
        b=NiNYujarbL/gilvLTi2u1QLCk+oslzYl8wTgAL3fJZeyvFaZs3GLfTGUaq8tjEkhoh
         AQJfRJUwX37m2s/2tS85AvI4Jtvd2ornm7g0dDR5zG8ljNIsk6f5sR+3hugA90OwcURE
         /O6DGuPb9d1jwfTCQGx0oYA4zajfM2/JMsVQeTrQTmOor62Rd5qHYCWtjJ6l8f2hxQdr
         i3pYUxwKDFBAc5eaMzjRWT0BmYRuhWuv7tlKic5TCRGLDOc/GNJKnpF+avK2pE1YzUcJ
         haMA9Y0Gvmmlk8ZVX62M1+WHfd6n5QjTgl7PlcIOU9IN+DcIQ91H9Yy4FdySg8UfnCmQ
         r9pQ==
X-Gm-Message-State: APjAAAVtQfxCXau9AqVBi8lvvBo2GkNK0OjJNa2W7Z8GOTsOSX71txfR
        ALf2OjcZD+Y+QCJClvv3+C/DSyzXPzqXgqKpjr9rRw==
X-Google-Smtp-Source: APXvYqw6ghcHvwbaq6lHcCfluZIaPHp6xRg12yr6UtbVj6QvYx2EVJdLt8awStOEr0apAYleLnbz8kRlR5g048azr/M=
X-Received: by 2002:a62:1c91:: with SMTP id c139mr113314954pfc.25.1560864702216;
 Tue, 18 Jun 2019 06:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+xxn1dSJBwBv7g=Mp3e9XARmJwb9JgjLjbDLx0rE+9tew@mail.gmail.com>
 <Pine.LNX.4.44L0.1906071056380.1612-100000@iolanthe.rowland.org> <CAAeHK+yoEVJDQJCp0gXjX2t+QT_c-CqR+NnhtTTYOg6aj=MhQA@mail.gmail.com>
In-Reply-To: <CAAeHK+yoEVJDQJCp0gXjX2t+QT_c-CqR+NnhtTTYOg6aj=MhQA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 18 Jun 2019 15:31:30 +0200
Message-ID: <CAAeHK+xDZEc_Qxfj8xoht0Tn-4ANVAtd=Xj-oYPU53EQq1J5Og@mail.gmail.com>
Subject: Re: Pass transfer_buffer to gadget drivers
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 7, 2019 at 5:05 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Fri, Jun 7, 2019 at 5:02 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Fri, 7 Jun 2019, Andrey Konovalov wrote:
> >
> > > > > The problem is that I want to receive that data (from the data stage)
> > > > > from within my gadget driver module. But it's not passed to the
> > > > > setup() callback. And the question is: how do I do that then?
> > > >
> > > > I just caught up on this thread...
> > > >
> > > > The answer is simple: The gadget driver's setup() callback routine
> > > > submits a request for endpoint 0.  The Data Stage data is sent or
> > > > received (depending on the direction encoded in the Setup information)
> > > > by this request.
> > >
> > > Ah, OK, got it, thanks!
> > >
> > > Although while looking at the dummy_hcd implementation, I saw that it
> > > accesses usb->transfer_buffer in case USB_REQ_GET_STATUS in
> > > handle_control_request(), which is called right before the setup()
> > > callback is called. So the data already available there without any
> > > additional requests. Is this an implementation detail that is specific
> > > to dummy_hcd?
> >
> > Yes, it is.  dummy-hcd is unusual in that it combines both a USB host
> > controller and a USB device controller in a single driver.
> >
> > Normal UDC drivers do handle USB_REQ_GET_STATUS on their own without
> > requiring the use of an explicit usb_request, because they handle the
> > entire transfer internally and don't involve the gadget driver.
> > However, they don't have access to any transfer_buffer; all they can do
> > is exchange packets with the host.
>
> OK, I see. Thanks a lot!

Another question: do I understand correctly, that we only proceed with
submitting an URB to get the data for the control OUT request
(ctrl->bRequestType doesn't have the USB_DIR_IN bit set) if
ctrl->wLength != 0?

>
> >
> > Alan Stern
> >
