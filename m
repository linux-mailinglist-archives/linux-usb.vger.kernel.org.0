Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C05A41516E4
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2020 09:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgBDIRb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Feb 2020 03:17:31 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25456 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726763AbgBDIRb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Feb 2020 03:17:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580804250;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+FYfNRtUohHmVazhCUWaHs/bP1B6+JdFa92vhI6uTJY=;
        b=Kz7Gsccyo12ozKcCoQdXEXf6gJ5kKYSQIjuI2z5S4hDDYWZ4V6sAJr6rYq7I5toIAfgyQV
        YWizNp0PkZe4U0ZMArjpCZDAnXX53VPgo4jb+TQp76jdu1Q4mmI0ijB8U/egUsXc8ZpNC0
        dZpeF+OKHBY5VakWCd6d3d7iyXftTAc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-jBXfiXcKNDuouXTV_vkNfQ-1; Tue, 04 Feb 2020 03:17:28 -0500
X-MC-Unique: jBXfiXcKNDuouXTV_vkNfQ-1
Received: by mail-qv1-f72.google.com with SMTP id d7so11185648qvq.12
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2020 00:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+FYfNRtUohHmVazhCUWaHs/bP1B6+JdFa92vhI6uTJY=;
        b=In9OxLW3Prwf1u8IHBU5o5WurJmbOpbXbwRwAwalF8SpIAM3qkxzuYgEQyoHvpEQvx
         tipi3aMTGEFxly5th59jKyTA1v19L/42FCT2/V6aLVpMEwzOcfvfi+ML8ttXD8k6pp2H
         GHZ6YkubQsDK/f3jvhDo063HGs/HSNHqJ1pBJdE8g4FUmMcugxCGt/qaTYFjfdLUns5y
         fFHak+ggx6wdArs7wSs9kY3xG2nBsX6p5zmiyTnC168NtpAAr1VWBcEVBsfqYrFx2LFs
         K5RjCXlp5XWisyv91T697+atzotDG0a0A/Cg8e0RLpKUpPEk627SHIXxjUPnbuBRDKkh
         F19w==
X-Gm-Message-State: APjAAAWuGBHB6Q3JVesz4SNvzjddW/sMsAaIem+v8HjO5GpZRTIuV9Dk
        Gm1m+j2Z7OXjRC50P/EqfmA36gds7jX6yVArxSiAgW/IpSagHDP7Dx6fqcjTvgBy2SkEGap4wL/
        lxmt+bX/kYhY5ApceKfHhPZsnB4W+E5LCwRw5
X-Received: by 2002:a0c:fac7:: with SMTP id p7mr26824686qvo.46.1580804247656;
        Tue, 04 Feb 2020 00:17:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqzjKwMwjxavu7NYEJjE1m0Q0ek71T0gHQF4aw6iSTCDbCwPr7eWRME0OuH8bnHqlWTp1ooYu+RR4JG6sn8rQjc=
X-Received: by 2002:a0c:fac7:: with SMTP id p7mr26824675qvo.46.1580804247330;
 Tue, 04 Feb 2020 00:17:27 -0800 (PST)
MIME-Version: 1.0
References: <9cf20b6f-5bfa-2346-ca9f-5ca81245bfff@pp.inet.fi>
In-Reply-To: <9cf20b6f-5bfa-2346-ca9f-5ca81245bfff@pp.inet.fi>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 4 Feb 2020 09:17:16 +0100
Message-ID: <CAO-hwJJDkFh+ZS7pCZLhfuoXeAByFLzKbPW8mHtF=N_e-hn+Dg@mail.gmail.com>
Subject: Re: USB HID fix: Retry sending timedout device commands 20 times
To:     Lauri Jakku <lauri.jakku@pp.inet.fi>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Lauri,

On Tue, Feb 4, 2020 at 3:21 AM Lauri Jakku <lauri.jakku@pp.inet.fi> wrote:
>
> Hi,
> I made possible fix for USB HID devices randomly fail to operate correctly.

Can you tell us a little bit more of which devices are failing, and on
which platform? I never had such failure, so I guess it must be device
specific.

>
> Fix: If device reports timedout operation, try re-send command 20 times, 10ms apart,
> before giving up. I got 5.5-series kernel running with 5 times resending and it seems
> to be quite good, i made the patch of 20 times resending. That should be enough for
> most cases.

Ouch, very much ouch. Resending 20 times on a generic path when the
timeout can be several seconds is pretty much a bad thing. Again, this
should be limited to the device you are talking to, and not be
generic. Or maybe you are encountering a usb controller issue.

>
> Code for drivers/usb/core/message.c include error definitions with adding include:
>
> #include <linux/errno.h>
>
>
> Code for drivers/usb/core/message.c function usb_control_msg:

This code / idea should be sent to linux-usb@vger.kernel.org (Cc-ed),
not just linux-input. This code touches the USB part, and we have no
control of it in the HID or input tree.

Cheers,
Benjamin

>
> int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
>    __u8 requesttype, __u16 value, __u16 index, void *data,
>    __u16 size, int timeout)
> {
>     struct usb_ctrlrequest *dr;
>     int ret = -ETIMEDOUT;
>     int retry_cnt = 20;
>
> dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_NOIO);
> if (!dr)
> return -ENOMEM;
>
> dr->bRequestType = requesttype;
> dr->bRequest = request;
> dr->wValue = cpu_to_le16(value);
> dr->wIndex = cpu_to_le16(index);
> dr->wLength = cpu_to_le16(size);
>
>     do
>     {
>         ret = usb_internal_control_msg(dev, pipe, dr, data, size, timeout);
>
>         /*
>          * Linger a bit, prior to the next control message or if return
>          * value is timeout, but do try few times before quitting.
>          */
>         if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
>             msleep(200);
>         else if (ret == -ETIMEDOUT) {
>             dev_dbg(dev,
>                     "timed out, trying %d times more.\n",
>                     retry_cnt);
>             msleep(10);
>         }
>
>     } while ( (retry_cnt-- > 0)
>                 &&
>               (ret == -ETIMEDOUT));
>
>
> kfree(dr);
>
> return ret;
> }
> EXPORT_SYMBOL_GPL(usb_control_msg);
>
>
> --
> Br,
> Lauri J.

