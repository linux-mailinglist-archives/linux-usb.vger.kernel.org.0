Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF991B8726
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2020 16:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgDYOto (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Apr 2020 10:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726087AbgDYOto (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Apr 2020 10:49:44 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E78C09B04B
        for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2020 07:49:43 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 7so5358972pjo.0
        for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2020 07:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IPqO96Q5+g40QOrs3rM+d9dbOYKmnjQE2NUGlPfPzCQ=;
        b=b/5BKVcZaxD1Gol2V5yxbdXZ0e34uwntYdylaU+ke4IitnhWXGyGwVbbW88X1j5s2v
         2/KOusNnzwSpZpFGoQ5pCa7wtgPKn2O6UO8sUQutyT9b9vwErfPn4OY4W7/ialW4c38M
         1HhUWlr7a26wK3PFZNxuAtpi0L9I5hdoB6f207X7c+q9/dY3ivVMjwvd15gbWg/nXLFD
         lQfmYqwDeQb/1SDqV6SqZD8H5l4Mv4sX1gct1lxfwdYtz6nvGma7SEJfiZes2CNdNXHc
         1QS1mnHZ2NuCeNHijFee/10OHn1inhA2uO1z+Gl9L+4AUfD/U2Kalx0aE6WzJkqlqKwc
         jnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IPqO96Q5+g40QOrs3rM+d9dbOYKmnjQE2NUGlPfPzCQ=;
        b=Ao1d13sdpUAJvBpkTRTVThTI+n/rsNPuC3Erv6eES0xVTEuG6rH4/AC0RKrfJRMYH0
         A29Knm6q+V+3FMmwFV6F/udC3O7N/L7vLyBpsGfI7YONFHJXRl5miwwzP0Rcxu0FqzWU
         Wk6IRQXERYHhVrjD5FAEUQYGr5+c3z0AX3Jj14Aw8/OBEHRVpc/Y9F//9m1R77W1B+Mv
         BTRHXcXz8MQVcr95CsIzWn7QdfNu2JHGp+GK8L4/TQaX8Hki4HwYeN8KdFGLHt3420SG
         j82sV0QRV9mAlLU5klc1qAlQI5M+EsUnXkXmeBLa84wBHTB26XezMK4RKylVE6zMKIvJ
         ytZA==
X-Gm-Message-State: AGi0PuYl3pZg4VxoHQE+0U0aO1+31UIY+bCWiKeNBet7k8DMwntu/OIw
        EcdanehODIpMKGK9CSxwL73uh7njreDryluUvzxGdg==
X-Google-Smtp-Source: APiQypJZqiCOJysY2HVbUwziyQUyFMET30DN0OClGLHoiZPYMAWbO3lfjHVmxkgQs5+YFggfnKSBjTeN+ZbEz1oalUQ=
X-Received: by 2002:a17:902:b592:: with SMTP id a18mr15074876pls.147.1587826182891;
 Sat, 25 Apr 2020 07:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+z1O4KgCnxrpD9yvYFUGybNmKPHVEcHetuQHz2J9V4n4w@mail.gmail.com>
 <Pine.LNX.4.44L0.2004242118210.17660-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2004242118210.17660-100000@netrider.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Sat, 25 Apr 2020 16:49:31 +0200
Message-ID: <CAAeHK+z5DXp9HL+=9z2cEOHpBUuhAV_EmDHucyc4+GtSaYJFjg@mail.gmail.com>
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

On Sat, Apr 25, 2020 at 3:53 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, 24 Apr 2020, Andrey Konovalov wrote:
>
> > On Fri, Apr 24, 2020 at 9:36 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> > > Hi Alan,
> > >
> > > I've started working on a test suite for raw-gadget based on the
> > > usbtest module as you suggested and have a few questions:
> > >
> > > 1. (Re test #10:) Currently there's no way to stall USB (control)
> > > requests with raw-gadget (which is what happens when you return -EPIPE
> > > from gadget's setup() callback AFAIU). Is stalling an important part
> > > of the protocol? Should we somehow support it? AFAIU gadgetfs also has
> > > no ability to stall requests that are passed to userspace.
>
> Yes, stalling is important, and you do need to support it.  gadgetfs
> does have a way to stall requests on ep0 from userspace: just perform
> I/O in the "wrong" direction.  If the host sends a control-IN request
> and the user does a read of the ep0 file, or if the host sends a
> control-OUT request and the user does a write, gadgetfs will call
> usb_ep_set_halt.  (However I do not remember how the setup_can_stall
> flag is meant to work.)

Ah, so halting ep0 after having successfully received a setup stage
request (setup() callback returns 0) will result in a stall during the
data stage (I hope I'm using those "stage" terms right) without the
gadget needing to queue an URB as it happens during a normal response?
Shouldn't this halt the endpoint until the user (or the gadget)
unhalts it? Does this work when we want to just stall a single
request? What happens with the requests that come after?

>
> > > 2. Re test #4: the test fails with length that is not divisible by
> > > endpoint's max packet value when using dummy_hcd (assuming that gadget
> > > keeps queueing URBs with max packet length), as dummy_hcd's transfer()
> > > function sets status to -EOVERFLOW when this happens. Is this
> > > expected?
>
> Yes, it is.  If you want to avoid overflow errors, you have to set the
> "vary" parameter to a multiple of the bulk-IN endpoint's maxpacket
> value and the "length" parameter to a multiple of that.

OK, got it. Those tests actually also fail with g_zero. I guess the
way to use usbtest in a particular setup (with particular host and
device controllers) is to first run the tests with e.g. g_zero, find
the ones that fail, and don't run those with raw-gadget or whatever
you're trying to test.

> > > 3. Re test #7: the test fails when e.g. vary parameter is set to some
> > > odd value when using dummy_hcd. AFAIU this happens since dummy_hcd
> > > doesn't have no_sg_constraint flag set and therefore the sanity check
> > > in usb_submit_urb() fails. Is this expected?
>
> No, I don't think so.  Have you tried setting no_sg_constraint?
> Probably we just forgot to do it.

Will try.

> > 4. Re test #13: it seems that both dummy_hcd and the UDC on Raspberry
> > Pi Zero handle host driven endpoint halts themselves without any need
> > to support them on the gadget side. Thus this test can't really be
> > used to test the halt implementation I have for raw-gadget. Are there
> > other ways to test it?
>
> Have you tried running the USBCV tests, available from usb.org?  They
> need a Windows host to run on but are otherwise pretty straightforward.
> If a mass-storage gadget (like g-mass-storage) can pass the USBCV
> Mass-Storage test, for example, that's a pretty stringent verification.
>
> Try them on any userspace gadget drivers you have lying around.

Didn't yet get to those, I'll try them too.

Thanks!
