Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6F6BE0022
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 10:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731255AbfJVI60 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 04:58:26 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34471 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbfJVI60 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Oct 2019 04:58:26 -0400
Received: by mail-io1-f65.google.com with SMTP id q1so19491880ion.1
        for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2019 01:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wye5vGXRuYRiMPZ/tPYkf/iAK8lEXsHfViBkeAiYynE=;
        b=YL0jsQx99lqhGpzwfacLgIT7Rla9043jyd3Pjz6wDOuT9azSRNF1Vd8PuIiNCod4tw
         AH1QyZj7vZ0ugxJ0qe7p4thdD4g5mUbphTJupou5ddTSQsO6UQ+W4AslDC4mxgmm9omK
         L6Qho3xH0hKHe7JQo01oOqfo9QKyoDgndFdJhMSaXFu1wEs05FkqntYkCSmSL7S0p0do
         lE6pwOlpzD58w9gcCJm/G/L/2Hk5vVbewLY/fEwLjJrQkpBdWYyyPJPxIx2RtG3IRVKJ
         Z/0C2TG5/WgEdV0Rn6Zo1dVjYLoylDJk+bSNx4GinViccE/F1vdmBZ+FHyCWeNaLihMA
         EszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wye5vGXRuYRiMPZ/tPYkf/iAK8lEXsHfViBkeAiYynE=;
        b=ZyLQouPD/6Q8AADxRPN+T4vhFiLeQf13Z8HI3HUQ9JZB9cickGRcHv12DLU6+7fVD5
         I2yTIVZZu6AK2y2dJfkmxBR8m+eCrOcnWhQ1doSUjdtemfBcbrMU+em/W2l+ainaCjVi
         pAQLUQ/+pXdKn0B8eAQV8uApUkmDtM4HePCqeKV4nhcbtXdC3bWSnArXXA4EE5BKt+G8
         xPYGd4AiIbCMlbX3/T/iYK09ysk+U04i2TfGf81FOYzGPF+KpqMbVmf47D3EX2fGNn0Y
         7AWIIE8wx3nSnLY7TCdnJDP5KtdN5XT1uZhurWQMffz5envkllc0xXfi95fU9nQSruOj
         O8Vw==
X-Gm-Message-State: APjAAAWVKBNJ9yokTIQe8JcIln2xJIRxDfItVHAA/BcSVYknpxoK0BM+
        c+qbiGV2S2IQdP2CQNzhmaPtTP2u7lya4SPomJg1Cg==
X-Google-Smtp-Source: APXvYqzeGivYRZSXK379NXaLWs8Mp4o8QNT96sNShAleNKxZ9K+N3Nm80TMBS7JW5/m7DPxQJmF7NShq7hPBDHaiLog=
X-Received: by 2002:a05:6638:503:: with SMTP id i3mr2713102jar.137.1571734704164;
 Tue, 22 Oct 2019 01:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191016034314.231363-1-pumahsu@google.com> <20191016125846.GC17542@kuha.fi.intel.com>
 <20191016130954.GD17542@kuha.fi.intel.com>
In-Reply-To: <20191016130954.GD17542@kuha.fi.intel.com>
From:   Puma Hsu <pumahsu@google.com>
Date:   Tue, 22 Oct 2019 16:57:47 +0800
Message-ID: <CAGCq0LZ3S2KHdavaTSc_q7qA76sYpPNT-hD72Rm82GQP8h37NQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: Add sysfs node to show cc orientation
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     gregkh@linuxfoundation.org,
        Badhri Jagan Sridharan <badhri@google.com>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

It=E2=80=99s not necessary to know the cable orientation for a normal user,
but we can have statistical analysis at Application layer. For example,
it may help investigating user behavior in the future if we can have the
count of plugging direction.

Besides, we also want to make the unified way to provide the connector
and connection information to user space. For the manufacturers, they
can easily record both orientations of the USB connector have been
verified working by an application tool. For a product, it=E2=80=99s system=
 application
can diagnose itself that one orientation of the USB connector cannot work
anymore when there is hardware damage.

For the coding algorithm, I will upload the patch version 2 for reviewing.

Thanks in advance.
Puma Hsu






Thanks in advance.




  =E2=80=A2  Puma Hsu =E8=A8=B1=E8=AA=8C=E5=AE=8F
  =E2=80=A2  Software Engineer, Pixel Phone
  =E2=80=A2  Tel: +886 2 8729 0870
  =E2=80=A2  pumahsu@google.com





On Wed, Oct 16, 2019 at 9:10 PM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Oct 16, 2019 at 03:58:50PM +0300, Heikki Krogerus wrote:
> > On Wed, Oct 16, 2019 at 11:43:14AM +0800, pumahsu wrote:
> > > Export the Type-C cc orientation so that user space can
> > > get this information.
> >
> > For what do you need this information in user space? I'm guessing you
> > have something else in mind besides exposing this as just generic
> > information, or debugging purposes, no?
> >
> > Please keep in mind that we do not always know the cable orientation.
> > UCSI for example does not give any clues about which way the cable
> > plug was connected to the connector. That means this sysfs file will
> > most likely need to be hidden in those cases, which I guess is
> > acceptable, but definitely not ideal.
> >
> > > Signed-off-by: pumahsu <pumahsu@google.com>
> > > ---
> > >  Documentation/ABI/testing/sysfs-class-typec |  7 +++++++
> > >  drivers/usb/typec/class.c                   | 11 +++++++++++
> > >  2 files changed, 18 insertions(+)
> > >
> > > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentat=
ion/ABI/testing/sysfs-class-typec
> > > index d7647b258c3c..419f952c991d 100644
> > > --- a/Documentation/ABI/testing/sysfs-class-typec
> > > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > > @@ -108,6 +108,13 @@ Contact:       Heikki Krogerus <heikki.krogerus@=
linux.intel.com>
> > >  Description:
> > >             Revision number of the supported USB Type-C specification=
.
> > >
> > > +What:              /sys/class/typec/<port>/cc_orientation
> > > +Date:              September 2019
> > > +Contact:   Puma Hsu <pumahsu@google.com>
> > > +Description:
> > > +           Indicates which cc orientation is active now, or 0 when
> > > +           nothing is connected.
> >
> > cc_orientation is a bit cryptic. I think if this is part of the port
> > ABI, then we should talk about something like "connector_orientation".
> >
> > >  USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
> > >
> > > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > > index 7d8805d9bf37..00edae63da8e 100644
> > > --- a/drivers/usb/typec/class.c
> > > +++ b/drivers/usb/typec/class.c
> > > @@ -1238,6 +1238,16 @@ static ssize_t usb_power_delivery_revision_sho=
w(struct device *dev,
> > >  }
> > >  static DEVICE_ATTR_RO(usb_power_delivery_revision);
> > >
> > > +static ssize_t cc_orientation_show(struct device *dev,
> > > +                                           struct device_attribute *=
attr,
> > > +                                           char *buf)
> > > +{
> > > +   struct typec_port *p =3D to_typec_port(dev);
> > > +
> > > +   return sprintf(buf, "%d\n", typec_get_orientation(p));
> > > +}
> > > +static DEVICE_ATTR_RO(cc_orientation);
> >
> > Now you are returning 0, 1 or 2 which to me is not ideal. This really
> > should return a string, something like "normal" / "reversed", and in
> > case the orientation is TYPEC_ORIENTATION_NONE, empty string.
>
> Or maybe TYPEC_ORIENTATION_NONE could be handle with "unknown" string.
> That way we may not need to hide the file.
>
> thanks,
>
> --
> heikki
