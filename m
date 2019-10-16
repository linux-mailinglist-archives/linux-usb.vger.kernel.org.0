Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C84F9D8C06
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 11:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391855AbfJPJAJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 05:00:09 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:46555 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391846AbfJPJAI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 05:00:08 -0400
Received: by mail-il1-f194.google.com with SMTP id c4so1811077ilq.13
        for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2019 02:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TZutJZLGF0s525Qo74hWUBEFtHjd5fY3wVdzlXrrh2g=;
        b=ZhDjZILuy3YhF2gSkbfiMnpR25Ut8GlVy3dzCgggDUq1Rl2yWFe7s6IUT85L+YoCtX
         zNav7Nkq4uWki/D5pvlMY3/clN8kIEcVEPdQNYkEunUcUKGes46sxszFRcTUfeRp27lh
         eTaeH407eXkavgtu8N5lihIVyrMoTHh22lV99W0RjYBC4zJgIbKELBPX5Z/eRtoiigye
         +1PzXL3KQ700Ccbo/PfV2hFAB5rj0TlZUMQw6DOtJgprAqnFFFmzG6mcdSv7RXaHKGg+
         lestp3pIU39bMzGAZM0yi9eU3GjA6uxwemlic7PkKXBD5WiV5dmadmIqCf12Z/Od4ov8
         G1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TZutJZLGF0s525Qo74hWUBEFtHjd5fY3wVdzlXrrh2g=;
        b=Zy+TFN6PwPmHiDDqd4CtxSYEBHhbAtzW719uEKbyTYad4RjXwMcruqZR2UvX8skagC
         LJ2r7jNXBBgUxZtVIsA7VAzFbPR50WtxhCNkCGJTQTyJvrw29yh29m8wv0Ki11X6+3Z8
         FBl/73boy3YO+K2XE8vPi9Qor/Mji13YdE2FQzzu9wBcM10u1VKsKo7MAAFQuMVrypZJ
         FieAJ+mkZPaVmnRV7OLsGwfgZZwUwkwH3AGV0pRPWIUSjgcNXuIzlIkoN/Jzml1jWith
         Ykx3ErRroKOeNEQMbYeWSzX7Q0wrd21DoeB5uyGK6rHQkoAwrWpEQfythy1qFoaOgZ5a
         JFTA==
X-Gm-Message-State: APjAAAWCswomCq+pB33De7AoOBkqddniiBa3GgN/2OKka2G8BAGOyn1c
        sQQ3hkutzt1MHEFla6DVxJwjOa8IwlgODeJcagOw8g==
X-Google-Smtp-Source: APXvYqwJg57R7T7Y4R5Atp4LSTftEMxw9GTS82UTA6BSFSYXKdQ99EAqMtb6dSOBmHCC17Yr2KZ85giWiH60Bot35T4=
X-Received: by 2002:a92:c10c:: with SMTP id p12mr10520194ile.32.1571216406838;
 Wed, 16 Oct 2019 02:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191016034314.231363-1-pumahsu@google.com> <577ac2f6-f073-1bd0-0adb-33fa8243773c@infradead.org>
In-Reply-To: <577ac2f6-f073-1bd0-0adb-33fa8243773c@infradead.org>
From:   Puma Hsu <pumahsu@google.com>
Date:   Wed, 16 Oct 2019 16:59:30 +0800
Message-ID: <CAGCq0La71bzMKcRw-+QmnMtOH_eeA-5t0qYAq3fSrLgBToyUrw@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: Add sysfs node to show cc orientation
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        Badhri Jagan Sridharan <badhri@google.com>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Albert Wang <albertccwang@google.com>,
        Puma Hsu <pumahsu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Randy,

According to include/linux/usb/typec.h, The value of
/sys/class/typec/<port>/cc_orientation is usually =E2=80=9C1=E2=80=9D, =E2=
=80=9C2=E2=80=9D, or =E2=80=9C0=E2=80=9D
corresponding to =E2=80=9Cconfigured in NORMAL side=E2=80=9D, =E2=80=9Cconf=
igured in REVERSE
side=E2=80=9D, or =E2=80=9Cnothing configured=E2=80=9D.
Refer to the usage in tcpm.c, it claims CC1 is NORMAL and CC2 is REVERSE.
I will update this into Documentation description.

enum typec_orientation {
        TYPEC_ORIENTATION_NONE,
        TYPEC_ORIENTATION_NORMAL,
        TYPEC_ORIENTATION_REVERSE,
};

Thanks in advance.



  =E2=80=A2  Puma Hsu =E8=A8=B1=E8=AA=8C=E5=AE=8F
  =E2=80=A2  Software Engineer, Pixel Phone
  =E2=80=A2  Tel: +886 2 8729 0870
  =E2=80=A2  pumahsu@google.com


Thanks in advance.




  =E2=80=A2  Puma Hsu =E8=A8=B1=E8=AA=8C=E5=AE=8F
  =E2=80=A2  Software Engineer, Pixel Phone
  =E2=80=A2  Tel: +886 2 8729 0870
  =E2=80=A2  pumahsu@google.com





On Wed, Oct 16, 2019 at 11:47 AM Randy Dunlap <rdunlap@infradead.org> wrote=
:
>
> On 10/15/19 8:43 PM, pumahsu wrote:
> > Export the Type-C cc orientation so that user space can
> > get this information.
> >
> > Signed-off-by: pumahsu <pumahsu@google.com>
>
> Hi,
> what the * is cc orientation?
>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec |  7 +++++++
> >  drivers/usb/typec/class.c                   | 11 +++++++++++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentatio=
n/ABI/testing/sysfs-class-typec
> > index d7647b258c3c..419f952c991d 100644
> > --- a/Documentation/ABI/testing/sysfs-class-typec
> > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > @@ -108,6 +108,13 @@ Contact: Heikki Krogerus <heikki.krogerus@linux.in=
tel.com>
> >  Description:
> >               Revision number of the supported USB Type-C specification=
.
> >
> > +What:                /sys/class/typec/<port>/cc_orientation
> > +Date:                September 2019
> > +Contact:     Puma Hsu <pumahsu@google.com>
> > +Description:
> > +             Indicates which cc orientation is active now, or 0 when
> > +             nothing is connected.
> > +
> >
> >  USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
> >
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 7d8805d9bf37..00edae63da8e 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -1238,6 +1238,16 @@ static ssize_t usb_power_delivery_revision_show(=
struct device *dev,
> >  }
> >  static DEVICE_ATTR_RO(usb_power_delivery_revision);
> >
> > +static ssize_t cc_orientation_show(struct device *dev,
> > +                                             struct device_attribute *=
attr,
> > +                                             char *buf)
> > +{
> > +     struct typec_port *p =3D to_typec_port(dev);
> > +
> > +     return sprintf(buf, "%d\n", typec_get_orientation(p));
> > +}
> > +static DEVICE_ATTR_RO(cc_orientation);
> > +
> >  static struct attribute *typec_attrs[] =3D {
> >       &dev_attr_data_role.attr,
> >       &dev_attr_power_operation_mode.attr,
> > @@ -1248,6 +1258,7 @@ static struct attribute *typec_attrs[] =3D {
> >       &dev_attr_usb_typec_revision.attr,
> >       &dev_attr_vconn_source.attr,
> >       &dev_attr_port_type.attr,
> > +     &dev_attr_cc_orientation.attr,
> >       NULL,
> >  };
> >  ATTRIBUTE_GROUPS(typec);
> >
>
>
> --
> ~Randy
