Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A831BB308
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 02:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgD1AvG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 20:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726016AbgD1AvF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Apr 2020 20:51:05 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C11C03C1A8
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2020 17:51:03 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t9so378376pjw.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2020 17:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uIxHeyUT0MWqX8LEK/icP5QQWSSIlZXViCebQjrap3c=;
        b=ZM+Pw5Sh5tZTZos9c9mS/Ox5PwoI3mbjDBxexkGjA58wFnVpBG8A6axmzTJE4jtuRo
         XavVV80nqPvhAndOBS2FoNRSQN9laRGdc2hzapoVJPbGEm4bXFIrHdhm/t/l81P1QH67
         s3+FxaRmIU1vqOdkVRBOQM7uDePOj5pLI78Cp3bg6S09RmnoyZonwmxWqUJHeR4Ceita
         /JbN8JFoxebrlf/poiyHdvGyXW5oR4p5IWs3F+sHAXda0MErEb5XiaWzO1auEo3T3PPu
         lhQBiYnYvG+dGHLqp9KEoaFsYbmqcwT/E6rt+4n779xY9mCI1dTE3VdTdGwou2FR0B3W
         b/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uIxHeyUT0MWqX8LEK/icP5QQWSSIlZXViCebQjrap3c=;
        b=nDyE95am1M8/6Uz7UJxxST0qiXDOo4SKU92mlOqt0fyUeANQgMWG9z+EKwVnvyIMoY
         bMQrrV9MZlSm0ySEOX0q982A8rtSMl08860eEozDZyN4ZfHGO4O0d41/2d39A7MkVr4I
         iUBJF43GeYwJVi8eoUvxtVtSgnpBAxr7v+9ET4RWw7EaIGyCe+GgndDWXY9MAu4mCDF7
         9YI2MvjZD1Nw7+EslTWo+czKueiZ6vPH2XdCVySlNfbUzO6Qn/rSAZ+blXII4q0hHr71
         DS/RBu4+MoDip92UDXhIDSHJIkHjzsLaLvasH9MV0cY4T9ganNmBZdWK27E9RdawXVgz
         +bHQ==
X-Gm-Message-State: AGi0PuYAzR6MxKe/LlRkmcEDqnWJ0znCAMoIBS5MdoZwNYECGKokTz7W
        V6cBs4vGD6I/XO6MXm1y0xJWstEw0lo+ir+JPlB+JmXGTLukFA==
X-Google-Smtp-Source: APiQypKA1+P0GZ0LFmJX801M4bSq5lI4InphoIXOZJ7iSm++gkZUVWZgObjO7f5SHAsmQRLMfMkm7yKZxX5v2YhnTRM=
X-Received: by 2002:a17:90b:198e:: with SMTP id mv14mr1743021pjb.69.1588035062985;
 Mon, 27 Apr 2020 17:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+x7Fihwriocp8Kpr+AQks6h3syZa+g0Wd+Q62fg-y93Lg@mail.gmail.com>
 <Pine.LNX.4.44L0.2004092015180.30065-100000@netrider.rowland.org>
 <CAAeHK+wYc1De7AN12mkkjDsx-PJODOAvBCOtcDSykSjq6gwCNA@mail.gmail.com>
 <CAAeHK+ykiDzvzFu1sKLXqiGxsnJP_iKXGttNk22Smzu1O31p=Q@mail.gmail.com> <CAAeHK+xqQC4guQrSs3JTCM+Bm=ZHKNT=4zgucTo9xbcz6htEZw@mail.gmail.com>
In-Reply-To: <CAAeHK+xqQC4guQrSs3JTCM+Bm=ZHKNT=4zgucTo9xbcz6htEZw@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 28 Apr 2020 02:50:51 +0200
Message-ID: <CAAeHK+xMva7Rx9M0fUX+6G5me1rV8dGPK-KPhNac3vAtJFee-A@mail.gmail.com>
Subject: Re: Testing endpoint halt support for raw-gadget
To:     Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 27, 2020 at 10:47 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Mon, Apr 27, 2020 at 9:51 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > On Fri, Apr 24, 2020 at 9:36 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > >
> > > On Fri, Apr 10, 2020 at 2:29 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > >
> > > > On Thu, 9 Apr 2020, Andrey Konovalov wrote:
> > > >
> > > > > Hi Alan and Greg,
> > > > >
> > > > > I've been thinking about what kind of features raw-gadget might be
> > > > > missing, that would allow more flexibility in emulating USB devices.
> > > > > One of the things that is currently missing is halting endpoints.
> > > > > Adding this functionality seems to be fairly easy, but it's unclear to
> > > > > me how to test it. Any suggestions?
> > > >
> > > > You should use the usbtest driver along with the testusb program in
> > > > tools/usb.  Of course, to do it you will need a userspace driver for
> > > > raw-gadget.  usbtest works best with gadget-zero, but it can be used
> > > > (in degraded form) with any USB device.
> > >
> > > Hi Alan,
> > >
> > > I've started working on a test suite for raw-gadget based on the
> > > usbtest module as you suggested and have a few questions:
> >
> > Another question, which actually seems to be a major problem.
> >
> > It looks like automatic endpoint selection based on required features
> > doesn't work in raw-gadget. The way it tries to do that is iterating
> > over the list of available endpoints and finding one that has the
> > right direction and transfer type. But it seems that the right way to
> > do that (like it's done in usb_ep_autoconfig()) is to also patch the
> > bEndpointAddress field of the endpoint descriptor.
> >
> > Currently with raw-gadget the endpoints are supposed to be enabled
> > after a set_configuration/set_interface request from the host, so it's
> > too late to patch the endpoint descriptor (the one that was sent to
> > the host during enumeration). I'm guessing that sending one endpoint
> > descriptor during enumeration and then using a different one (with
> > patched bEndpointAddress) to set ep->desc before doing usb_ep_enable()
> > won't work (as there's going to be mismatch in endpoint addresses
> > between the host and the UDC), right?
> >
> > I wonder what we can do about that. It seems that we actually need to
> > parse the descriptors and figure out the right endpoints before the
> > enumeration starts.
>
> Or maybe somehow expose all endpoints and their features (like
> GadgetFS) and let userspace put proper addresses into endpoint
> descriptors before enumeration starts.

I think this is the way to go, giving the userspace maximum control
over what's going on. Seems not too hard to implement too. The only
part that is not clear to me is how to figure out the endpoint address
that a particular UDC endpoint expects to have.

Most of the time endpoints are named as something like "ep1in" or
"ep2out", and AFAIU the number in the endpoint name is the address.
However net2280 seems to have weird endpoint names "ep-a", "ep-b",
etc. Looking at usb_ep_autoconfig_ss(), those endpoints supposedly
have sequential addresses starting from 1 (for each in/out type). But
then in the GadgetFS example [1] e.g. "ep-a" corresponds to address 7,
which I don't understand. My guess is that this is done to handle both
dummy_udc and net2280 in a single if case, but I'm not sure.

[1] http://www.linux-usb.org/gadget/usb.c
