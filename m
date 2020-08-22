Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4882324E9CE
	for <lists+linux-usb@lfdr.de>; Sat, 22 Aug 2020 22:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgHVUfn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Aug 2020 16:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgHVUfm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Aug 2020 16:35:42 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E955C061573
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2020 13:35:42 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id x25so2799178pff.4
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2020 13:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4cAuFbtWgOu0Vwpo+5CB6s1MDGwSGnrYE0ZMfmOVMYY=;
        b=RkJtzBxLMEKQfGWiPGBWKEPCpdgJlPWVTkb01ErPmT+6VoDpB4po2ONhi6/TS7Ym4E
         po/pPH99ygloqDFbSBR90LutISn7yclx8Nqg5U/HXCv4kr5RA7SYKccGSeOMGkuPe5/F
         NM8ccf/KTgQRzf7952U7aocUn1kzdoxim5dEgjivbFKlCSwEtfaJ7ePqR5iZFFFBZ+B6
         eLQq91M2Yb8AVLRKBA7iZ2B++qbkgznhR34woHWI0NH0iq+rgKX18+6DGDHrhZlhYS3n
         Vs3oUpc22I6uvXiBo6KRSINSFDq9sggp/5ho9jOYXVWbsEM+HLJW2nU7cjjPl5Wv3u30
         CpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4cAuFbtWgOu0Vwpo+5CB6s1MDGwSGnrYE0ZMfmOVMYY=;
        b=nh9bqqQBUKOlW4yu0c/ou2Wx++HcB62BojvxxulaSHnYIALZIIkNhB07YTCsEbx9Y8
         OmWHIGqlyWXRfUN7SucInqUqyFbzQK0J9wToKqNeYM3cAAr8eymwkH5oxQtpJCv7Hnmi
         6BIh8Mgij+hnxMZBzcVvnprcz70i0xRdo/Wjv0Wgg0wVhw/IHG9PvjAIv9sUH4fwVNkw
         Hu02lS+/wi8xzBhiW+HoyulbaOcAvi9pGz7M0B90dtInEUDZ6RMa+zTUlrNPUiyT5hwG
         Py7cQFQlZBA2sdk02aFyiieHAnhA4Ysn4IUaxGSMNwROlW9u2Q2R3IcZUxmyD7VD5OId
         F2uQ==
X-Gm-Message-State: AOAM530oti4sK+XmH5p7ECw3KbNLoceH1+ye0v/bx53xmQybBu8p7q7S
        z6B1hpAUrhi1pNIe+uwSIzWaHZvJuDBJAIFO/VZghBqEhiFWVQ==
X-Google-Smtp-Source: ABdhPJzxcwETqDxNgzIcbMS5xzeyZ/SZ9kE7GcJXk35avMO7fRithmEj8WKotMdJ4BZVeTMl/mS8190TRTzPq2YC570=
X-Received: by 2002:a63:5825:: with SMTP id m37mr6356105pgb.257.1598128539662;
 Sat, 22 Aug 2020 13:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqbrUhE-D3QoeUkr=FnTks_a+KRxLpScghMefEZp9GHD55E_Q@mail.gmail.com>
 <20200822200107.GA288350@rowland.harvard.edu>
In-Reply-To: <20200822200107.GA288350@rowland.harvard.edu>
From:   yunhua li <yunhual@gmail.com>
Date:   Sat, 22 Aug 2020 13:35:28 -0700
Message-ID: <CAMqbrUiRfk7uy+oPwwsvjL+CZNGEFGonGRx5LMGyQ7UTwrPA8A@mail.gmail.com>
Subject: Re: XCHI bulk transaction latency, data lost, NAK stats
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

HI Alan Thanks for your response.
> What is the communication speed of the camera?  480 Mb/s (USB-2), 5000
Mb/s (USB-3) or something else?  And how much data does the camera send
for each frame?
It is 5000Mb/s (USB 3.0),  each video frame is about 2880000, 30 fps.

> 20 - 200 seconds?  That's an awfully long latency.  Much longer than you
would expect from random fuctuations; it indicates that something is
going badly wrong.
Sorry it is 0.02 ~ 0.2 seconds delay,  when image got corrupted,

> It depends on what other devices are attached to the USB bus.  They may
or may not require some reserved bandwidth.
There is no other USB device connected to the system.
if no other USB device, and no  Isochronous transaction, Bulk
transaction (This camera) should be able to use all bandwidth, am I
correct?

Thanks.
Yunhua

On Sat, Aug 22, 2020 at 1:01 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Sat, Aug 22, 2020 at 11:02:16AM -0700, yunhua li wrote:
> > Hello all
> > For USB Bulk transaction,
> > 1. If there are NAK, and retransmit happens on a physical layer, does
> > XHCI provide any statistical counter, e.g. how many retries for that
> > URB, how can I get those counters or enable it for that TRB?
>
> I'm not an expert on xHCI.  Still, as far as I know, there are no such
> counters.
>
> > 2. If Data is lost, XHCI have to resend URB request?  how long it will
> > take before it resend URB request?  Is that a configurable timeout on
> > XHCI spec?
>
> I believe it is not configurable.  It will depend on how much other
> traffic there is on the bus.  If the bus is only lightly loaded then the
> retry time should be much less than 1 ms, probably something like 10 us
> or so.  Maybe even smaller.
>
> > The following are some  background of my question.
> > I have a XHCI USB Host controller, there are 4 ports. I only connect
> > one port to a USB 3.0 camera.  and running program keep reading data
> > from device, guvcview -d /dev/video0,
> > the camera keeps sending 30 frames/second, normal within each frame,
>
> What is the communication speed of the camera?  480 Mb/s (USB-2), 5000
> Mb/s (USB-3) or something else?  And how much data does the camera send
> for each frame?
>
> > XHCI driver sends URB request -> Device response URB, response time is
> > about 10 ~ 200ms.
> > Some times, the response time takes 20 000 ~ 200 000 ms, as a result,
> > the image gets corrupted.
>
> 20 - 200 seconds?  That's an awfully long latency.  Much longer than you
> would expect from random fuctuations; it indicates that something is
> going badly wrong.
>
> > From the USB device(Camera) firmware debugging tool, I can see that
> > the Device actually did submit DMA in time, when this big latency
> > happens firmware will complain, DMA buffer overflow.
> > looks software works correctly on both sides.
> > I'm trying to understand why the latency is not consistent?
>
> It sounds like you need to use a USB bus analyzer to measure the
> packets on the wire.
>
> > 3. I have 4 USB ports on the XHCI host controller, but only 1 device
> > connects,  does other 3 empty port take any USB bandwidth?
>
> They do not.
>
> >  is there
> > anything related to bandwidth allocation I should look at it?
>
> It depends on what other devices are attached to the USB bus.  They may
> or may not require some reserved bandwidth.
>
> > 4. anything related PCIe I should look at? I enabled PCIe error
> > reporting, No error found?
>
> It's hard to imagine that your long latencies are caused by PCIe.
>
> Alan Stern
