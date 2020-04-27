Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FE51BAFB7
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 22:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgD0Urk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 16:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726233AbgD0Urk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Apr 2020 16:47:40 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 143CBC0610D5
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2020 13:47:40 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id n11so1114678pgl.9
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2020 13:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GnHUw4yhIhacN0q8anH/Ee4JBNPpI6Q/WHP2Nffyhl4=;
        b=YRFmPxvX8x/0i3MN4Qg5QmpZ079SSmfR2wuN1MJ5GCAifx33OaoI7moZInhgCjCRf2
         HcG8gL1rOXNzrGFuemMHhO+5SHHPuKLYrLjpECvvvR6ajtfw8H9dl4KwG0M/vo4RUTWK
         83whd18iK/pNPM0dajSrpN5EZvytFEvUiVvJIahI0I3MPF6dB7Sp/k+QJEJLWT4u299/
         /W39ppBRRZTkN0Eaas3P3c+8/pj0incq2FR8qyy+SHMQLbNSMrqoMvdtY/Ptrjnl9k+3
         UDhajep1809o9U6MOxVvdef4vaPzK3VVBSI8PeriOhrT6wEM/xTk4DzdQsHKthRNgzMU
         8aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GnHUw4yhIhacN0q8anH/Ee4JBNPpI6Q/WHP2Nffyhl4=;
        b=mMjJVZ+EK6o7TkiX011JoDI4C9O64oOqr9GAR5dE/uVlJwfKQREZ12NXf7IzNY5hcW
         yKT8P5aaS18s7dbHoktOSBDipESbgTTJjw+suVzFyu6KhN/eZjShWPsAGH10CcQeJGde
         XYFuujhIwdYkemKDFubUGADi55bWArUraeFTpNJ3qZEGkEh4kQodJYIIVvMW41BBYIwK
         LoXOEkzDo2LECEFjjVxxtWf5BGdv9p8ejYwYg+/WzXbRLenr8YqFrAoDMu9y65LZmLuW
         dtto9P3rxaHNkXYeAEkJDLpCUogF54cP3JgFWhw2KYM4NAsmivSszUvNuG7EsO3Taxhu
         jtlw==
X-Gm-Message-State: AGi0PuZoSyUYwr5L+yO886Z5YHaN0Z2tpRXf/IY2L0QYP5vZCbm7h2zM
        IvxVKQeKGuovpQgsPvBM2ghta4RobHvD296pTcI1bQ==
X-Google-Smtp-Source: APiQypLQ7C7bN1+hcE8OwMjSH4vAkWF6sb/P8GmlJXmur8EEGVlKBay3X6rwWoDcwkFrzcVwqZVOPBXTUWRsmlMhGX8=
X-Received: by 2002:a63:1d54:: with SMTP id d20mr25128257pgm.286.1588020459352;
 Mon, 27 Apr 2020 13:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+x7Fihwriocp8Kpr+AQks6h3syZa+g0Wd+Q62fg-y93Lg@mail.gmail.com>
 <Pine.LNX.4.44L0.2004092015180.30065-100000@netrider.rowland.org>
 <CAAeHK+wYc1De7AN12mkkjDsx-PJODOAvBCOtcDSykSjq6gwCNA@mail.gmail.com> <CAAeHK+ykiDzvzFu1sKLXqiGxsnJP_iKXGttNk22Smzu1O31p=Q@mail.gmail.com>
In-Reply-To: <CAAeHK+ykiDzvzFu1sKLXqiGxsnJP_iKXGttNk22Smzu1O31p=Q@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 27 Apr 2020 22:47:28 +0200
Message-ID: <CAAeHK+xqQC4guQrSs3JTCM+Bm=ZHKNT=4zgucTo9xbcz6htEZw@mail.gmail.com>
Subject: Re: Testing endpoint halt support for raw-gadget
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Felipe Balbi <balbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 27, 2020 at 9:51 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Fri, Apr 24, 2020 at 9:36 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > On Fri, Apr 10, 2020 at 2:29 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Thu, 9 Apr 2020, Andrey Konovalov wrote:
> > >
> > > > Hi Alan and Greg,
> > > >
> > > > I've been thinking about what kind of features raw-gadget might be
> > > > missing, that would allow more flexibility in emulating USB devices.
> > > > One of the things that is currently missing is halting endpoints.
> > > > Adding this functionality seems to be fairly easy, but it's unclear to
> > > > me how to test it. Any suggestions?
> > >
> > > You should use the usbtest driver along with the testusb program in
> > > tools/usb.  Of course, to do it you will need a userspace driver for
> > > raw-gadget.  usbtest works best with gadget-zero, but it can be used
> > > (in degraded form) with any USB device.
> >
> > Hi Alan,
> >
> > I've started working on a test suite for raw-gadget based on the
> > usbtest module as you suggested and have a few questions:
>
> Another question, which actually seems to be a major problem.
>
> It looks like automatic endpoint selection based on required features
> doesn't work in raw-gadget. The way it tries to do that is iterating
> over the list of available endpoints and finding one that has the
> right direction and transfer type. But it seems that the right way to
> do that (like it's done in usb_ep_autoconfig()) is to also patch the
> bEndpointAddress field of the endpoint descriptor.
>
> Currently with raw-gadget the endpoints are supposed to be enabled
> after a set_configuration/set_interface request from the host, so it's
> too late to patch the endpoint descriptor (the one that was sent to
> the host during enumeration). I'm guessing that sending one endpoint
> descriptor during enumeration and then using a different one (with
> patched bEndpointAddress) to set ep->desc before doing usb_ep_enable()
> won't work (as there's going to be mismatch in endpoint addresses
> between the host and the UDC), right?
>
> I wonder what we can do about that. It seems that we actually need to
> parse the descriptors and figure out the right endpoints before the
> enumeration starts.

Or maybe somehow expose all endpoints and their features (like
GadgetFS) and let userspace put proper addresses into endpoint
descriptors before enumeration starts.
