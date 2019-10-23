Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC55E108B
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 05:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732972AbfJWD0m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 23:26:42 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:32965 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732895AbfJWD0m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Oct 2019 23:26:42 -0400
Received: by mail-io1-f66.google.com with SMTP id z19so23209178ior.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2019 20:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+j4esZlyAn6Jj0G1LuKplgHe+Pu/B4eUeGKka5Wc1Q=;
        b=sRquuot576k5OEV69QqANCFmPKRu3I8HEHwtE8bDIFH4iTCUZFiLXeKrWFsOe2azT7
         z55TK3jLnrH5cNizZ4FnrfShy2c+Skof/p3Fjzbf57m1Z2iP+8JbrODlmxvF/JsuvUzG
         a8vHa9Ger6Fvv0eLHXW6gloXznk5lgiClj6OV02Vr7TQrGfnltuNNyNXH0xlQf9Bu+2h
         Qk+vocBSIP4uz9zkzPmQKi2cE1dBci4362Q9JG00tv7dfrFuUg5yEGOZ77QioaHuV+8X
         Ey6mdQTEv9fE41eHFQ14hHHeqf67oGHfke+tU1cla+f9Jl0vJsz1j07hZL/z+Eyc7AU6
         Mzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+j4esZlyAn6Jj0G1LuKplgHe+Pu/B4eUeGKka5Wc1Q=;
        b=M6On6i8e9ADmyRF7dbx7vYu3bHqMB79ziad0VO5OWbuvQjG4XqCwjRnrdC4zp98Cqh
         nHLU3OzGtLTS23bORzWRyoJSBpYbsGTp4aMWxHBkoIzx6wn4VlSNkO5lqrP8phvVF06Z
         T3soeCkmw+IT2MHVeHkVzA9rRsUUPR9inlhMjJ9dReXazUw7DXDpuw00SjHNzpCdnLN0
         Ev2GnnFC71XTKGEka+CBat4waQ7DS1Mp9LarwiH3rbV0k3C7I3VCkWAIxGo+8+YRhfve
         yNyJu9nVahD5GifVbTr6ih1fbFCe3nxWsLp1V0zJ88F3WfHp8I7YM/NchrQWBV+5p//w
         O7Xw==
X-Gm-Message-State: APjAAAWg/RX+WOssV7vFEom5JEymEk3KK5btMUNqtL+64bvlARJhz3gl
        T/0/ZMyQkKwOqhhMOTHMxu4CmInFimYt2M+UDORQnA==
X-Google-Smtp-Source: APXvYqygqvKfL7Ykw3boZKQwFYF5duCex0GHhqhb/QKexuQBFeBJm0daroKda/Sx6MKbPCAfONIR6Gg+O6waKr/5XBg=
X-Received: by 2002:a6b:c701:: with SMTP id x1mr1239496iof.162.1571801199435;
 Tue, 22 Oct 2019 20:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191022085924.92783-1-pumahsu@google.com> <20191022172731.GA230934@kroah.com>
In-Reply-To: <20191022172731.GA230934@kroah.com>
From:   Puma Hsu <pumahsu@google.com>
Date:   Wed, 23 Oct 2019 11:26:03 +0800
Message-ID: <CAGCq0LYp4Ua052nSwuZwZBAqCMZcLyt9UMsCPThGg27P=YSjNA@mail.gmail.com>
Subject: Re: [PATCH V2] usb: typec: Add sysfs node to show connector orientation
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Kyle Tso <kyletso@google.com>,
        Albert Wang <albertccwang@google.com>,
        Chien Kun Niu <rickyniu@google.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,


On Wed, Oct 23, 2019 at 1:27 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 22, 2019 at 04:59:24PM +0800, Puma Hsu wrote:
> > Export the Type-C connector orientation so that user space
> > can get this information.
> >
> > Signed-off-by: Puma Hsu <pumahsu@google.com>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec | 11 +++++++++++
> >  drivers/usb/typec/class.c                   | 18 ++++++++++++++++++
> >  2 files changed, 29 insertions(+)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
> > index d7647b258c3c..b22f71801671 100644
> > --- a/Documentation/ABI/testing/sysfs-class-typec
> > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > @@ -108,6 +108,17 @@ Contact: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >  Description:
> >               Revision number of the supported USB Type-C specification.
> >
> > +What:                /sys/class/typec/<port>/connector_orientation
> > +Date:                October 2019
> > +Contact:     Puma Hsu <pumahsu@google.com>
> > +Description:
> > +             Indicates which typec connector orientation is configured now.
> > +             cc1 is defined as "normal" and cc2 is defined as "reversed".
>
> Why the blank line after "Description:"?  Shouldn't "Indicates..." be
> right after it?

I checked the coding style for sysfs-class-*, all of them put the
description at the next line behind "Description:"
Should I change it?

> > +
> > +             Valid value:
> > +             - unknown (nothing configured)
> > +             - normal (configured in cc1 side)
> > +             - reversed (configured in cc2 side)
> >
> >  USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
> >
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 94a3eda62add..911d06676aeb 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -1245,6 +1245,23 @@ static ssize_t usb_power_delivery_revision_show(struct device *dev,
> >  }
> >  static DEVICE_ATTR_RO(usb_power_delivery_revision);
> >
> > +static const char * const typec_connector_orientation[] = {
> > +     [TYPEC_ORIENTATION_NONE]                = "unknown",
> > +     [TYPEC_ORIENTATION_NORMAL]              = "normal",
> > +     [TYPEC_ORIENTATION_REVERSE]             = "reversed",
> > +};
> > +
> > +static ssize_t connector_orientation_show(struct device *dev,
> > +                                             struct device_attribute *attr,
> > +                                             char *buf)
>
> Can you line this up properly?

Yes, I will update it in version3 once the previous problem is confirmed.

>
> thanks,
>
> greg k-h


Thanks in advance.
Puma Hsu
