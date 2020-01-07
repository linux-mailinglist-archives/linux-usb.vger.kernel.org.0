Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A535132E12
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 19:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728484AbgAGSM7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 13:12:59 -0500
Received: from mail-io1-f52.google.com ([209.85.166.52]:41731 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbgAGSM7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 13:12:59 -0500
Received: by mail-io1-f52.google.com with SMTP id c16so276321ioo.8
        for <linux-usb@vger.kernel.org>; Tue, 07 Jan 2020 10:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g2+sO+JkUixho0n7u2iizwj6IjYTzZD6tUtUJv3BIZ8=;
        b=i51s2G6eB6bxcNXPRMI7UqrP4L+eVb2N+2j7aHci3wwlM0ApjtPIdAsUYQeKHrQWSH
         w5p1rZ4BXQ+tKYCuy9oftaO/iFMQgSkrgMj+jYtFMxfXI78EFJ9XgpkwltSAqTepFwv2
         lp0hzObOi7wAjdE+rMoob+xXbq4aoOXZSRmn+gD4i0TMAuvaMpQUGoWdkM2V8AVdGcd/
         yQm7NLNN2NDMEo7qMI+3AYYwXD6pdkOvxaGtS0fFDI0q07GPCIpkN/UzbV97sWv3FKxe
         8+pn29RbuDCjQ/NmbF+x+aVs3l14/hm1/86OoOHoY5iYO1gDOS2w8F7uBV9bGHPxdivK
         yTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g2+sO+JkUixho0n7u2iizwj6IjYTzZD6tUtUJv3BIZ8=;
        b=W1v2HHTCeiYPiyLiHDM/4+zHOxISN9aXGsMhaF31gxlcPm2jqKuITZbqOrDnZOEOO9
         f8AKkg6YMtRrTuwtF1H334I4+q4bTAFzg+DeYhHm0MBZliieu7U/W4ItKg7Tyl8TFtSP
         GmkR+bbutZwPqF1V76XjFZGTm9E2Re3Wfuy2Ah4Ons89gQVTv1Z20iLM738rEsQLDIF3
         knpX8qtTRf+rIWTWSBWW1CItg/ZRo8ca25OFdiNTCYUWDeSwaXqOvnB38FYrTlfUUUqf
         +I7QeUC8+3LUNwouHeFlJbmbAiiIZkc+5GQ27y4mgUmFohdkgwZhhPSwPz3RWN8l5z09
         tfVw==
X-Gm-Message-State: APjAAAXDiCHJMTLQs4AuzlPE+vb1cRFYZSC6tO6B7keP+4wa8lthaPis
        gt/UwZQYVh9EDn6pfO+DlC4cFMCai+zdFyVBtBU=
X-Google-Smtp-Source: APXvYqwumpFFsdnHQAKeF+KTllCA8o303ncYE9l7aAMiqL3kkahK+NupKjl3zEqJl3JkK2clB9OLZ13Nv6fBQZEfTd4=
X-Received: by 2002:a02:cdd9:: with SMTP id m25mr686764jap.123.1578420778382;
 Tue, 07 Jan 2020 10:12:58 -0800 (PST)
MIME-Version: 1.0
References: <CAOHtt39wC1RzRWPi2hb6vS7EZWoVxGGHqeten=3a6M-jYGWkcA@mail.gmail.com>
 <Pine.LNX.4.44L0.2001071234330.1567-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2001071234330.1567-100000@iolanthe.rowland.org>
From:   =?UTF-8?Q?Tomasz_Mo=C5=84?= <desowin@gmail.com>
Date:   Tue, 7 Jan 2020 19:12:47 +0100
Message-ID: <CAOHtt3_3_C36nhqjiNnYHH0DjE5ZM2nxdXXgamzPvQzNH6Co1g@mail.gmail.com>
Subject: Re: Use of address 0 in usbmon
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, Pete Zaitcev <zaitcev@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 7, 2020 at 6:41 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> Before the patch you sent in yesterday, usbmon reported these requests
> as directed to device number 1 (which is the number assigned to root
> hubs since they are the first devices registered on their USB buses),
> not 0.

Thank you for mentioning this.

> > Would it be possible to modify the usbmon format, so the
> > is_root_hub(urb->dev) flag would be somehow available to the
> > user-space tools?
>
> How about using address 255 in the usbmon output to represent root
> hubs?  That wouldn't require any format change at all.

Yes, that's one possibility.

> By the way, there is one bad aspect to your patch.  Although the device
> addresses output by usbmon will now correspond exactly to the physical
> addresses on the bus, they will not correspond to the device numbers
> used everywhere else in the kernel.  For example, someone monitoring
> communcations with /dev/bus/usb/001/005 won't know what device address
> to look for in the usbmon output -- it might not be 005.

Initially I have modified also the drivers/usb/core/devices.c to
change the format_topo to use devaddr instead of devnum. Then I
realised it could cause a snowball effect and decided to limit the
change to usbmon only.

I think the solution to would be to extend usbmon format to include
both devnum and devaddr. This unfortunately would require format
change.
