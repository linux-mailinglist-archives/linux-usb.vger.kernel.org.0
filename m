Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65A80E1D62
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 15:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406104AbfJWNyK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 09:54:10 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:46263 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405399AbfJWNyJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 09:54:09 -0400
Received: by mail-il1-f193.google.com with SMTP id m16so12561479iln.13
        for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2019 06:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R+nJtR75en6J8QICL+v2OuPcehUh1r6wrpSxbTyEcbA=;
        b=WWK8cR0zHz8FGV/wc4wJ9hmOqra/qh/+amrwLQvSsYZau0P+11uhje7JdBrJ9bRQbD
         Vo5dTbkbhYSjs4xyZsvfTTeqBc8IzWquLKw1jJ2upAa7NiBc2CSxPQfN2xozteDsGYtp
         4TIpGu3gXEB0zGAL6sWgWsuJCUhHY2kkQ8gpYO/G18fWkKj+i54mhfWleNZjRbziJto3
         8Gt5+FShiQBE/vNY258/UYHOX+XVniN7CDvVd9z4ItFFWXlwERfQDPoogWVm7Qhu9V2f
         i9GxOFypUy3TwUPZ1/KB4bw9iJ/3CAm1QGc3Z6l9Y30VBGu+It1RB5A7iQRzkLeR85qg
         2SNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R+nJtR75en6J8QICL+v2OuPcehUh1r6wrpSxbTyEcbA=;
        b=BY2m8HdEHgetDT1Nh4HaFQ49OnZCrM4nhCdYHFFuxHRZJocTnS9JL7Y29o9WgVuBTL
         jFzxbWFc71Z1rlFpO3w0QFcC3zYxa4kFn0R+o6QMnpSSqZla87X/U15Hl9F9V0Q14K20
         YWSq/E0Um0mMfGCsE3q9wAprZcNj32hgEA6Qdc22xVd1p9SIy+YMabNEYy4wgGwC7QSh
         2VEjbF13a6pPYyBbeeLzK5QwH6sI/8mTuqopa1Q2uXh0w7aqSB3VRWLvacg1nNP8Joi8
         ZABP0hmcV4tUPvFTOz06zZ/lE4TCKB8rzBQgKwA94wT/q1UIPf7xcjD8f8L5oRfmkSz1
         yclQ==
X-Gm-Message-State: APjAAAU+7x/VnQSVVyzMnOzHcNBdttwRHD8X6FmoVsnMTHhemnOWkGFt
        WWzn2SQsXxJwG3K4CUPW6hlKz26doRMUVGeRwY8OmA==
X-Google-Smtp-Source: APXvYqyT6FIp6SoplgW2Lesof8PsJ7DRgg7IC7ob3I+RDguYiq6ow8XKNR5npNfjaWsQIvd7K8GdxzWKuWfFZ+s4Vp4=
X-Received: by 2002:a92:c509:: with SMTP id r9mr34257778ilg.79.1571838848426;
 Wed, 23 Oct 2019 06:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191022085924.92783-1-pumahsu@google.com> <20191023083221.GB8828@kuha.fi.intel.com>
 <644d890b-86e8-f05a-cd4c-32937d971a45@roeck-us.net>
In-Reply-To: <644d890b-86e8-f05a-cd4c-32937d971a45@roeck-us.net>
From:   Puma Hsu <pumahsu@google.com>
Date:   Wed, 23 Oct 2019 21:53:32 +0800
Message-ID: <CAGCq0La+sM2wtgVzj3WWq0yPUeX1irWY=LpSf7ny71HY3_T23A@mail.gmail.com>
Subject: Re: [PATCH V2] usb: typec: Add sysfs node to show connector orientation
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        gregkh@linuxfoundation.org,
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

Hi Guenter,

I think "unknown" here means that the USB port is disconnected in real usage.

Thanks in advance.
Puma Hsu







On Wed, Oct 23, 2019 at 9:44 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/23/19 1:32 AM, Heikki Krogerus wrote:
> > +Guenter
> >
> > On Tue, Oct 22, 2019 at 04:59:24PM +0800, Puma Hsu wrote:
> >> Export the Type-C connector orientation so that user space
> >> can get this information.
> >>
> >> Signed-off-by: Puma Hsu <pumahsu@google.com>
> >> ---
> >>   Documentation/ABI/testing/sysfs-class-typec | 11 +++++++++++
> >>   drivers/usb/typec/class.c                   | 18 ++++++++++++++++++
> >>   2 files changed, 29 insertions(+)
> >>
> >> diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
> >> index d7647b258c3c..b22f71801671 100644
> >> --- a/Documentation/ABI/testing/sysfs-class-typec
> >> +++ b/Documentation/ABI/testing/sysfs-class-typec
> >> @@ -108,6 +108,17 @@ Contact:        Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >>   Description:
> >>              Revision number of the supported USB Type-C specification.
> >>
> >> +What:               /sys/class/typec/<port>/connector_orientation
> >> +Date:               October 2019
> >> +Contact:    Puma Hsu <pumahsu@google.com>
> >> +Description:
> >> +            Indicates which typec connector orientation is configured now.
> >> +            cc1 is defined as "normal" and cc2 is defined as "reversed".
> >> +
> >> +            Valid value:
> >> +            - unknown (nothing configured)
> >
> > "unknown" means we do not know the orientation.
> >
> >> +            - normal (configured in cc1 side)
> >> +            - reversed (configured in cc2 side)
> >
> > Guenter, do you think "connector_orientation" OK. I proposed it, but
> > I'm now wondering if something like "polarity" would be better?
> >
>
> Yes, or just "orientation". I don't see the value in the "connector_" prefix.
> I also wonder if "unknown" is really correct. Is it really unknown, or
> does it mean that the port is disconnected ?
>
> Guenter
>
> >>   USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
> >>
> >> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> >> index 94a3eda62add..911d06676aeb 100644
> >> --- a/drivers/usb/typec/class.c
> >> +++ b/drivers/usb/typec/class.c >> @@ -1245,6 +1245,23 @@ static ssize_t usb_power_delivery_revision_show(struct device *dev,
> >>   }
> >>   static DEVICE_ATTR_RO(usb_power_delivery_revision);
> >>
> >> +static const char * const typec_connector_orientation[] = {
> >> +    [TYPEC_ORIENTATION_NONE]                = "unknown",
> >> +    [TYPEC_ORIENTATION_NORMAL]              = "normal",
> >> +    [TYPEC_ORIENTATION_REVERSE]             = "reversed",
> >> +};
> >> +
> >> +static ssize_t connector_orientation_show(struct device *dev,
> >> +                                            struct device_attribute *attr,
> >> +                                            char *buf)
> >> +{
> >> +    struct typec_port *p = to_typec_port(dev);
> >> +
> >> +    return sprintf(buf, "%s\n",
> >> +                   typec_connector_orientation[p->orientation]);
> >> +}
> >> +static DEVICE_ATTR_RO(connector_orientation);
> >> +
> >>   static struct attribute *typec_attrs[] = {
> >>      &dev_attr_data_role.attr,
> >>      &dev_attr_power_operation_mode.attr,
> >> @@ -1255,6 +1272,7 @@ static struct attribute *typec_attrs[] = {
> >>      &dev_attr_usb_typec_revision.attr,
> >>      &dev_attr_vconn_source.attr,
> >>      &dev_attr_port_type.attr,
> >> +    &dev_attr_connector_orientation.attr,
> >>      NULL,
> >>   };
> >>   ATTRIBUTE_GROUPS(typec);
> >
> > thanks,
> >
>
