Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBF221BAE7A
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 21:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgD0Tvj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 15:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726205AbgD0Tvi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Apr 2020 15:51:38 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270DAC0610D5
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2020 12:51:38 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id p25so9488263pfn.11
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2020 12:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x7xWj6j9n+9+cfjCADqZgyuvG4fjTtrHxxoI8cwoBm8=;
        b=FVFYqvUc2XmhOAQa+HP4qbn3f2ePzMmwzJOQD9n97Mtv0n1CMY+WlxNjjSBbt2gEiW
         ERpcN3ewRsp1ZcMyqWAeStCJsVadu1CFhxpl6hsocOhpGp8WZSiunBkn0g0eL5CbcXnX
         CqlXgcUOMWjJVrAarqEPYmpB39laVFpT1FK2tdMviV0YKGYO2fo8XzYTG48qbfPOsc4x
         TqmCzxhjf4mRJL+hpYYRfYwn5XkRGPVHEh18A6UJUKFACJeUBQXdjR0deNtpLQHbdSMv
         ctirxEab5dAziWDiD4qeDc0VrrIJoEbV+DGs9fmUMF/CqXrMdq3j3h1yGZD2DloRiTuV
         bIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x7xWj6j9n+9+cfjCADqZgyuvG4fjTtrHxxoI8cwoBm8=;
        b=MSYio8Fi97BkQYo5TXnJifmgCc+5PzKcA0H+wRdH7gV70zzwvYYOebmmqFfZc61OcU
         f6xjXe606Pmx/5+urUJpnenfjmo+OVU5t/g4qKDk0LK/eN2NM0Hx6VQ1ZRr9uquAFQVl
         Hu/Z3YKEdWOMf4rkjXhLiPK1FrwF4W2pHSpNXlHuQTXWpS3YcyjBhcSCRs4b1d76UdJO
         i83SewxofFp4cQbbUbnobYlCGRef6GNtDdW2f5vQ6YD3cys47ZhzY3rf5oFfp6ErtGtM
         HDWEPgHPBEA0LkVkQg87pJ5InlNM+NsDzZMznEi2obxLY2yTECuPCGElQ0FuhVhwf0sf
         a0Ig==
X-Gm-Message-State: AGi0PuYBJ2BKgZbQ78u21vPgJHqiw3Ei1FWcwLSnvPq7+k7L4p9NFuqm
        Cx41xJdhUPcdQ+XVm38cCq4/HQF+zo/aaqqnLVv9nw==
X-Google-Smtp-Source: APiQypJUKqJR9LqWGZuTphH82p6tQklQT/2BkcjWF3wL5Oshz4nurByK098EsRNt45RAm6WE5rJeEtb3QKkjycvUd1M=
X-Received: by 2002:a63:cf02:: with SMTP id j2mr115081pgg.130.1588017097425;
 Mon, 27 Apr 2020 12:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+x7Fihwriocp8Kpr+AQks6h3syZa+g0Wd+Q62fg-y93Lg@mail.gmail.com>
 <Pine.LNX.4.44L0.2004092015180.30065-100000@netrider.rowland.org> <CAAeHK+wYc1De7AN12mkkjDsx-PJODOAvBCOtcDSykSjq6gwCNA@mail.gmail.com>
In-Reply-To: <CAAeHK+wYc1De7AN12mkkjDsx-PJODOAvBCOtcDSykSjq6gwCNA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 27 Apr 2020 21:51:26 +0200
Message-ID: <CAAeHK+ykiDzvzFu1sKLXqiGxsnJP_iKXGttNk22Smzu1O31p=Q@mail.gmail.com>
Subject: Re: Testing endpoint halt support for raw-gadget
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 24, 2020 at 9:36 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Fri, Apr 10, 2020 at 2:29 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Thu, 9 Apr 2020, Andrey Konovalov wrote:
> >
> > > Hi Alan and Greg,
> > >
> > > I've been thinking about what kind of features raw-gadget might be
> > > missing, that would allow more flexibility in emulating USB devices.
> > > One of the things that is currently missing is halting endpoints.
> > > Adding this functionality seems to be fairly easy, but it's unclear to
> > > me how to test it. Any suggestions?
> >
> > You should use the usbtest driver along with the testusb program in
> > tools/usb.  Of course, to do it you will need a userspace driver for
> > raw-gadget.  usbtest works best with gadget-zero, but it can be used
> > (in degraded form) with any USB device.
>
> Hi Alan,
>
> I've started working on a test suite for raw-gadget based on the
> usbtest module as you suggested and have a few questions:

Another question, which actually seems to be a major problem.

It looks like automatic endpoint selection based on required features
doesn't work in raw-gadget. The way it tries to do that is iterating
over the list of available endpoints and finding one that has the
right direction and transfer type. But it seems that the right way to
do that (like it's done in usb_ep_autoconfig()) is to also patch the
bEndpointAddress field of the endpoint descriptor.

Currently with raw-gadget the endpoints are supposed to be enabled
after a set_configuration/set_interface request from the host, so it's
too late to patch the endpoint descriptor (the one that was sent to
the host during enumeration). I'm guessing that sending one endpoint
descriptor during enumeration and then using a different one (with
patched bEndpointAddress) to set ep->desc before doing usb_ep_enable()
won't work (as there's going to be mismatch in endpoint addresses
between the host and the UDC), right?

I wonder what we can do about that. It seems that we actually need to
parse the descriptors and figure out the right endpoints before the
enumeration starts.
