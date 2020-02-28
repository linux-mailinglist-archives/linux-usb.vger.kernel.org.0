Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34AEB173CA2
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2020 17:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgB1QOx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Feb 2020 11:14:53 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:46074 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbgB1QOx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Feb 2020 11:14:53 -0500
Received: by mail-vk1-f195.google.com with SMTP id f17so143347vkk.12
        for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2020 08:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sdfucJr4oGXmK/lbY5RGk72YXwrFDcIl2yf5ZBumLmc=;
        b=Y19jelF+yAj3D9yhRoea0pkJgxFOHFphhYx6vuwZohk2gP08M+tUPLgTNxVPjM3yLd
         9tG7853yVeWuZ0dH2FfBEO57PhITSljU8G0GoDefm7OknQYhjKftArSFAi8Y+0gyamUA
         rNN4hYtWHbpmrbLEc1SF3YbEu6q75JEbBCZ4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sdfucJr4oGXmK/lbY5RGk72YXwrFDcIl2yf5ZBumLmc=;
        b=mXKiuCCnmoCxgKIEzfAp97pPxPyY0vazOSGQHhZvEW+4+LUuAZjdGCYLRpvukzHb8j
         e1iF+PeFCe4F3Bz0koCUA0p2LlJUQO2GcAPHDozKGS85d6PwzOId3ZbTWC82eFWYhT/A
         LbDvrIvtaECDBKFX+g7/2USUmxeCPb2hqja6SFPgNlDzIjk/7wNbF+Xhqf1q8UM8raup
         ZLCgD+6MN/V3d8cnSV7+RlnQMnoAA24SHqaMtzK7L+8jvXEV8ylkj982s4By7XTwh+lH
         cjd1n0TqCperKLWg0LyF4z14+AVunoxk+5HPQhMclkSe/Ly5OiYtTo1HyzS/g3O7G39a
         QTrg==
X-Gm-Message-State: ANhLgQ3+4/8xY/wASG9G+kUNDLNhpnTSwvEVqGZTHZFAaY19BgDF7dcW
        sVe511W9Likp6wq4cjJJ0vBtNboNJTA=
X-Google-Smtp-Source: ADFU+vtZpqK2URibP1J+sp68MK/D9ra2AIEQhvdhm5k8ZEuWOsmTRAe7EWlXQ9kySA7YZIcLeniEVQ==
X-Received: by 2002:ac5:c807:: with SMTP id y7mr2903930vkl.92.1582906489549;
        Fri, 28 Feb 2020 08:14:49 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id k20sm3092200vki.6.2020.02.28.08.14.47
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 08:14:48 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id c7so1159977uaf.5
        for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2020 08:14:47 -0800 (PST)
X-Received: by 2002:ab0:45b6:: with SMTP id u51mr2409303uau.120.1582906487233;
 Fri, 28 Feb 2020 08:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20200226210414.28133-1-linux@roeck-us.net> <20200226210414.28133-2-linux@roeck-us.net>
 <CAD=FV=WDd4E-zDW73kb-qHo1QYQrD3BTgVpE70rzowpgeXVy7w@mail.gmail.com>
 <ce3357a1-467f-1241-ae0d-2e113116ca8d@roeck-us.net> <f94fc372-d81b-e8e4-e7ef-780fe7db1237@roeck-us.net>
In-Reply-To: <f94fc372-d81b-e8e4-e7ef-780fe7db1237@roeck-us.net>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 28 Feb 2020 08:14:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VNsOo--1x+pkwhWOWSGAQyVB6g6CE+o4q7phPSXaDXRw@mail.gmail.com>
Message-ID: <CAD=FV=VNsOo--1x+pkwhWOWSGAQyVB6g6CE+o4q7phPSXaDXRw@mail.gmail.com>
Subject: Re: [RFT PATCH 1/4] usb: dwc2: Simplify and fix DMA alignment code
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>,
        Boris ARZUR <boris@konbu.org>, linux-usb@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Martin Schiller <ms@dev.tdt.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Feb 27, 2020 at 8:28 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 2/27/20 2:27 PM, Guenter Roeck wrote:
> > On 2/27/20 2:06 PM, Doug Anderson wrote:
> [ ... ]
> >>> -       if (urb->num_sgs || urb->sg ||
> >>> -           urb->transfer_buffer_length == 0 ||
> >>> +       if (urb->num_sgs || urb->sg || urb->transfer_buffer_length == 0 ||
> >>> +           (urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) ||
> >>>             !((uintptr_t)urb->transfer_buffer & (DWC2_USB_DMA_ALIGN - 1)))
> >>
> >> Maybe I'm misunderstanding things, but it feels like we need something
> >> more here.  Specifically I'm worried about the fact when the transfer
> >> buffer is already aligned but the length is not a multiple of the
> >> endpoint's maximum transfer size.  You need to handle that, right?
> >> AKA something like this (untested):
> >>
> >> /* Simple case of not having to allocate a bounce buffer */
> >> if (urb->num_sgs || urb->sg || urb->transfer_buffer_length == 0 ||
> >>     (urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP))
> >>   return 0;
> >>
> >> /* Can also avoid bounce buffer if alignment and size are good */
> >> maxp = usb_endpoint_maxp(&ep->desc);
> >> if (maxp == urb->transfer_buffer_length &&
> >
> > No, transfer_buffer_length would have to be a multiple of maxp. There
> > are many situations where roundup(transfer_buffer_length, maxp) !=
> > transfer_buffer_length. I agree, this would be the prudent approach
> > (and it was my original implementation), but then it didn't seem to
> > cause trouble so far, and I was hesitant to add it in because it results
> > in creating temporary buffers for almost every receive operation.
> > I'd like to get some test feedback from Boris - if the current code
> > causes crashes with his use case, we'll know that it is needed.
> > Otherwise, we'll have to decide if the current approach (with fewer
> > copies) is worth the risk, or if we want to play save and always
> > copy if roundup(transfer_buffer_length, maxp) != transfer_buffer_length.
> >
>
> Thinking more about this, the situation is actually much worse:
> In Boris' testing, he found inbound transactions requested by usb
> storage code with a requested transfer size of 13 bytes ... with
> URB_NO_TRANSFER_DMA_MAP set. This means the requesting code has
> provided a DMA ready buffer, transfer_buffer isn't even used,
> and we can not reallocate it. In this situation we can just hope
> that the chip (and the connected USB device) don't send more data
> than requested.
>
> With that in mind, I think we should stick with the current
> scheme (ie only allocate a new buffer if the provided buffer is
> unaligned) unless Boris comes back and tells us that it doesn't
> work.

I dunno.  I'd rather see correctness over performance.  Certainly we'd
only need to do the extra bounce buffer for input buffers at least.

Although I don't love the idea, is this something where we want to
introduce a config option (either runtime or through KConfig),
something like:

CONFIG_DWC2_FAST_AND_LOOSE - Avoid bounce buffers and thus run faster
at the risk of a bad USB device being able to clobber some of your
memory.  Only do this if you really care about speed and have some
trust in the USB devices connected to your system.


-Doug
