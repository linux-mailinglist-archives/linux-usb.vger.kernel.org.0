Return-Path: <linux-usb+bounces-15962-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2586997859
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 00:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 114F0B22423
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 22:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33071E283C;
	Wed,  9 Oct 2024 22:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GABqVh/Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4560E17A584
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 22:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728512209; cv=none; b=DvyzGBg3O9fVwkzLAa3MpgP/HIYmWzxWUXHTfT8OzRffeUzhQWEGGUnEN30Fy3gQbZyQ+pdbgOn+fN+Zr05omucK+ZoWM9nCo0yEj5FbE2537D5Kug1DzGeY7bygFDG1X5CH0UBUEMKX7F2atmFx6u9wVG8HJVqJxpI0QHe4Tkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728512209; c=relaxed/simple;
	bh=6Fy21HDXPF12ql5oFq1ahU/CQ9//HQA6tMLw+2EXNew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3bQhaCpuEs0fKiBqJap3mJ5b6fMCBjRrsfedsJ9HEnSnf1X1IPW3hJhIHU2fpZo8MvB/f50GjAhi9y6KMjUYlONgqCzw6TtjTw413QIFCnbiHJv1jQ/xO4fsVOBAX/WQom2qGchcoXSWHo2+KCRO+ppcKRs3q1gy51jgQmYOUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GABqVh/Z; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e25d164854dso244850276.2
        for <linux-usb@vger.kernel.org>; Wed, 09 Oct 2024 15:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728512205; x=1729117005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T00Ts4P5hBA6ZiHJHjOLgm66qyl5ylu7UukIPZRahNU=;
        b=GABqVh/ZlR83J8dZTF6ap/xj5uoobngqiIvUNl0AgrhQt47twowrExdFRfc48zdKr3
         yZC8OeXGTDP5c8m0qm9pLPXo8BV2lLzOrNxNI5TkzFIqhmAh301TahGfBob0DmQeXdhg
         R7LiFF1QU5Kp+qQGUWTsanHAgs0n14gvyW60M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728512205; x=1729117005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T00Ts4P5hBA6ZiHJHjOLgm66qyl5ylu7UukIPZRahNU=;
        b=HVo2sCifCoTcIqIhLPqJicx92HjiX/lhX4YD1fGG8xpf3t+hrd2kUSGfxDAWs19Xs7
         hBo5ujUxUp/uoNm2KGkGlYwCZtHBBdjTWCuJ30gkuPvRKnytsZIGVvDX3M2LsKo/Lcs3
         qq8XuN+87ktf3H39nguIEE2viGGneOxGSvbsvBdXDkA0Q7KGzoUzd28nLQCXCflOtUbp
         7JQ9NwnyiCCQFhf3Tm0B7SHgKzqOku10Ks3UxE+w+Y2j8h++S9pFDK1afRtxgM79OZuB
         fkJKGU+XEvAwq0FTBVti/gUg8fj6ofFE0uTS7LaYS4lEONRow2zcMTg294P3YCyJ4H39
         Di8A==
X-Forwarded-Encrypted: i=1; AJvYcCVtYEgC6YvBh36ibYf2ZEeZMdXJFMPD00FlxRZUNmVtcopnbRWxiksSFh41S91BdC1QvpiY77+zIPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT/dIwVj2G3hj+p2uhYAQhINWsKcYbP02MPjj+DBkR/+yBPeyK
	atWhF534LZYrDlLHP509ilp7a5EmvIZk0Xldp8Nq1KLE+gbJEmrxpNp2M2JSHSQtlZSeA9QYwpb
	Vo44iUf1uMUtHCQoBQPhqQDO7OGXs/mUnTNvC
X-Google-Smtp-Source: AGHT+IE8SAN7n9ce8DTD6bs8V19l4Rc35+8GA7PSwVonlqNx38AHIucbRarOwWVz6IKhEiFPIQrm+hravVJLxCHLqRs=
X-Received: by 2002:a05:690c:768c:b0:6dd:bb05:3137 with SMTP id
 00721157ae682-6e322121867mr38438977b3.12.1728512205080; Wed, 09 Oct 2024
 15:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009154557.2836656-1-heikki.krogerus@linux.intel.com> <20241009154557.2836656-3-heikki.krogerus@linux.intel.com>
In-Reply-To: <20241009154557.2836656-3-heikki.krogerus@linux.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Wed, 9 Oct 2024 15:16:34 -0700
Message-ID: <CANFp7mVuGabGvLd5M5WYK60sMMnkS1sD3noiVYc=k0Q=Vg4rdg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] usb: typec: Add attribute file showing the USB
 Modes of the partner
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 8:46=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> This attribute file shows the supported USB modes (USB 2.0,
> USB 3.0 and USB4) of the partner, and the currently active
> mode.
>
> The active mode is determined primarily by checking the
> speed of the enumerated USB device. When USB Power Delivery
> is supported, the active USB mode should be always the mode
> that was used with the Enter_USB Message, regardless of the
> result of the USB enumeration. The port drivers can
> separately assign the mode with a dedicated API.
>
> If USB Power Delivery Identity is supplied for the partner
> device, the supported modes are extracted from it.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  Documentation/ABI/testing/sysfs-class-typec |  14 +++
>  drivers/usb/typec/class.c                   | 123 +++++++++++++++++++-
>  drivers/usb/typec/class.h                   |   2 +
>  include/linux/usb/typec.h                   |   5 +
>  4 files changed, 140 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/=
ABI/testing/sysfs-class-typec
> index 7c307f02d99e..866865ffeb66 100644
> --- a/Documentation/ABI/testing/sysfs-class-typec
> +++ b/Documentation/ABI/testing/sysfs-class-typec
> @@ -233,6 +233,20 @@ Description:
>                 directory exists, it will have an attribute file for ever=
y VDO
>                 in Discover Identity command result.
>
> +What:          /sys/class/typec/<port>-partner/usb_mode
> +Date:          February 2024
> +Contact:       Heikki Krogerus <heikki.krogerus@linux.intel.com>
> +Description:   The USB Modes that the partner device supports. The activ=
e mode
> +               is disaplayed in brackets. The active USB mode can be cha=
nged by
spelling: displayed

> +               writing to this file when the port driver is able to send=
 Data
> +               Reset Message to the partner. That requires USB Power Del=
ivery
> +               contract between the partner and the port.
> +
> +               Valid values:
> +               - usb2 (USB 2.0)
> +               - usb3 (USB 3.2)
> +               - usb4 (USB4)
> +
>  USB Type-C cable devices (eg. /sys/class/typec/port0-cable/)
>
>  Note: Electronically Marked Cables will have a device also for one cable=
 plug
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 9c26d2ad40df..f25cc20a2024 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -618,6 +618,74 @@ EXPORT_SYMBOL_GPL(typec_unregister_altmode);
>  /* ---------------------------------------------------------------------=
---- */
>  /* Type-C Partners */
>
> +/**
> + * typec_partner_set_usb_mode - Assign active USB Mode for the partner
> + * @partner: USB Type-C partner
> + * @mode: USB Mode (USB2, USB3 or USB4)
> + *
> + * The port drivers can use this function to assign the active USB Mode =
to
> + * @partner. The USB Mode can change for example due to Data Reset.
> + */
> +void typec_partner_set_usb_mode(struct typec_partner *partner, enum usb_=
mode mode)
> +{
> +       if (!partner || partner->usb_mode =3D=3D mode)
> +               return;
> +
> +       partner->usb_capability |=3D BIT(mode - 1);
> +       partner->usb_mode =3D mode;
> +       sysfs_notify(&partner->dev.kobj, NULL, "usb_mode");
> +}
> +EXPORT_SYMBOL_GPL(typec_partner_set_usb_mode);
> +
> +static ssize_t
> +usb_mode_show(struct device *dev, struct device_attribute *attr, char *b=
uf)
> +{
> +       struct typec_partner *partner =3D to_typec_partner(dev);
> +       int len =3D 0;
> +       int i;
> +
> +       for (i =3D USB_MODE_USB2; i < USB_MODE_USB4 + 1; i++) {
> +               if (!(BIT(i - 1) & partner->usb_capability))
> +                       continue;
> +
> +               if (i =3D=3D partner->usb_mode)
> +                       len +=3D sysfs_emit_at(buf, len, "[%s] ", usb_mod=
es[i]);
> +               else
> +                       len +=3D sysfs_emit_at(buf, len, "%s ", usb_modes=
[i]);
> +       }
> +
> +       buf[len - 1] =3D '\n';
> +       return len;
> +}
> +
> +static ssize_t usb_mode_store(struct device *dev, struct device_attribut=
e *attr,
> +                             const char *buf, size_t size)
> +{
> +       struct typec_partner *partner =3D to_typec_partner(dev);
> +       struct typec_port *port =3D to_typec_port(dev->parent);
> +       int mode;
> +       int ret;
> +
> +       if (!port->ops || !port->ops->data_reset)
> +               return -EOPNOTSUPP;
> +
> +       mode =3D sysfs_match_string(usb_modes, buf);
> +       if (mode < 0)
> +               return mode;
> +
> +       if (mode =3D=3D partner->usb_mode)
> +               return size;
> +
> +       ret =3D port->ops->data_reset(port, mode);
> +       if (ret)
> +               return ret;
> +
> +       typec_partner_set_usb_mode(partner, mode);
> +
> +       return size;
> +}
> +static DEVICE_ATTR_RW(usb_mode);
> +
>  static ssize_t accessory_mode_show(struct device *dev,
>                                    struct device_attribute *attr,
>                                    char *buf)
> @@ -664,6 +732,7 @@ static struct attribute *typec_partner_attrs[] =3D {
>         &dev_attr_supports_usb_power_delivery.attr,
>         &dev_attr_number_of_alternate_modes.attr,
>         &dev_attr_type.attr,
> +       &dev_attr_usb_mode.attr,
>         &dev_attr_usb_power_delivery_revision.attr,
>         NULL
>  };
> @@ -671,6 +740,14 @@ static struct attribute *typec_partner_attrs[] =3D {
>  static umode_t typec_partner_attr_is_visible(struct kobject *kobj, struc=
t attribute *attr, int n)
>  {
>         struct typec_partner *partner =3D to_typec_partner(kobj_to_dev(ko=
bj));
> +       struct typec_port *port =3D to_typec_port(partner->dev.parent);
> +
> +       if (attr =3D=3D &dev_attr_usb_mode.attr) {
> +               if (!partner->usb_capability)
> +                       return 0;
> +               if (!port->ops || !port->ops->data_reset)
> +                       return 0444;
> +       }
>
>         if (attr =3D=3D &dev_attr_number_of_alternate_modes.attr) {
>                 if (partner->num_altmodes < 0)
> @@ -744,10 +821,33 @@ static void typec_partner_unlink_device(struct type=
c_partner *partner, struct de
>   */
>  int typec_partner_set_identity(struct typec_partner *partner)
>  {
> -       if (!partner->identity)
> +       u8 usb_capability =3D partner->usb_capability;
> +       struct device *dev =3D &partner->dev;
> +       struct usb_pd_identity *id;
> +
> +       id =3D get_pd_identity(dev);
> +       if (!id)
>                 return -EINVAL;
>
> -       typec_report_identity(&partner->dev);
> +       if (to_typec_port(dev->parent)->data_role =3D=3D TYPEC_HOST)  {
> +               u32 devcap =3D PD_VDO_UFP_DEVCAP(id->vdo[0]);
> +
> +               if (devcap & (DEV_USB2_CAPABLE | DEV_USB2_BILLBOARD))
> +                       usb_capability |=3D USB_CAPABILITY_USB2;
> +               if (devcap & DEV_USB3_CAPABLE)
> +                       usb_capability |=3D USB_CAPABILITY_USB3;
> +               if (devcap & DEV_USB4_CAPABLE)
> +                       usb_capability |=3D USB_CAPABILITY_USB4;
> +       } else {
> +               usb_capability =3D PD_VDO_DFP_HOSTCAP(id->vdo[0]);
> +       }
> +
> +       if (partner->usb_capability !=3D usb_capability) {
> +               partner->usb_capability =3D usb_capability;
> +               sysfs_notify(&dev->kobj, NULL, "usb_mode");
> +       }
> +
> +       typec_report_identity(dev);
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(typec_partner_set_identity);
> @@ -917,6 +1017,7 @@ struct typec_partner *typec_register_partner(struct =
typec_port *port,
>         partner->usb_pd =3D desc->usb_pd;
>         partner->accessory =3D desc->accessory;
>         partner->num_altmodes =3D -1;
> +       partner->usb_capability =3D desc->usb_capability;
>         partner->pd_revision =3D desc->pd_revision;
>         partner->svdm_version =3D port->cap->svdm_version;
>         partner->attach =3D desc->attach;
> @@ -936,6 +1037,15 @@ struct typec_partner *typec_register_partner(struct=
 typec_port *port,
>         partner->dev.type =3D &typec_partner_dev_type;
>         dev_set_name(&partner->dev, "%s-partner", dev_name(&port->dev));
>
> +       if (port->usb2_dev) {
> +               partner->usb_capability |=3D USB_CAPABILITY_USB2;
> +               partner->usb_mode =3D USB_MODE_USB2;
> +       }
> +       if (port->usb3_dev) {
> +               partner->usb_capability |=3D USB_CAPABILITY_USB2 | USB_CA=
PABILITY_USB3;
> +               partner->usb_mode =3D USB_MODE_USB3;
> +       }
> +
>         ret =3D device_register(&partner->dev);
>         if (ret) {
>                 dev_err(&port->dev, "failed to register partner (%d)\n", =
ret);
> @@ -1935,13 +2045,18 @@ static void typec_partner_attach(struct typec_con=
nector *con, struct device *dev
>         struct typec_port *port =3D container_of(con, struct typec_port, =
con);
>         struct typec_partner *partner =3D typec_get_partner(port);
>         struct usb_device *udev =3D to_usb_device(dev);
> +       enum usb_mode usb_mode;
>
> -       if (udev->speed < USB_SPEED_SUPER)
> +       if (udev->speed < USB_SPEED_SUPER) {
> +               usb_mode =3D USB_MODE_USB2;
>                 port->usb2_dev =3D dev;
> -       else
> +       } else {
> +               usb_mode =3D USB_MODE_USB3;
>                 port->usb3_dev =3D dev;
> +       }
>
>         if (partner) {
> +               typec_partner_set_usb_mode(partner, usb_mode);
>                 typec_partner_link_device(partner, dev);
>                 put_device(&partner->dev);
>         }
> diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> index 85bc50aa54f7..b3076a24ad2e 100644
> --- a/drivers/usb/typec/class.h
> +++ b/drivers/usb/typec/class.h
> @@ -35,6 +35,8 @@ struct typec_partner {
>         int                             num_altmodes;
>         u16                             pd_revision; /* 0300H =3D "3.0" *=
/
>         enum usb_pd_svdm_ver            svdm_version;
> +       enum usb_mode                   usb_mode;
> +       u8                              usb_capability;
>
>         struct usb_power_delivery       *pd;
>
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index d8999472212d..c35221b0e164 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -220,6 +220,7 @@ struct typec_cable_desc {
>   * @accessory: Audio, Debug or none.
>   * @identity: Discover Identity command data
>   * @pd_revision: USB Power Delivery Specification Revision if supported
> + * @usb_capability: Supported USB Modes
>   * @attach: Notification about attached USB device
>   * @deattach: Notification about removed USB device
>   *
> @@ -237,6 +238,7 @@ struct typec_partner_desc {
>         enum typec_accessory    accessory;
>         struct usb_pd_identity  *identity;
>         u16                     pd_revision; /* 0300H =3D "3.0" */
> +       u8                      usb_capability;
>
>         void (*attach)(struct typec_partner *partner, struct device *dev)=
;
>         void (*deattach)(struct typec_partner *partner, struct device *de=
v);
> @@ -252,6 +254,7 @@ struct typec_partner_desc {
>   * @pd_get: Get available USB Power Delivery Capabilities.
>   * @pd_set: Set USB Power Delivery Capabilities.
>   * @usb_mode_set: Set the USB Mode to be used with Enter_USB message
> + * @data_reset: Set new USB mode by using the Data Reset message
>   */
>  struct typec_operations {
>         int (*try_role)(struct typec_port *port, int role);
> @@ -263,6 +266,7 @@ struct typec_operations {
>         struct usb_power_delivery **(*pd_get)(struct typec_port *port);
>         int (*pd_set)(struct typec_port *port, struct usb_power_delivery =
*pd);
>         int (*usb_mode_set)(struct typec_port *port, enum usb_mode mode);
> +       int (*data_reset)(struct typec_port *port, enum usb_mode mode);

I have a problem with the naming of these two functions,
"usb_mode_set" and "data_reset".

The former, usb_mode_set, seems to exist to set the default USB mode
on data reset. The latter, data_reset, seems to really be Data Reset +
Enter_USB.

The former, "usb_mode_set", seems mostly useful to in-kernel TCPM to
be able to set the default USB response after a data reset. UCSI (and
cros_ec_typec on ChromeOS) doesn't expose this level of control.

A better declaration may be:
* int (*default_usb_mode_set)(struct typec_port *port, enum usb_mode mode);
* int (*enter_usb_mode)(struct typec_port *port, enum usb_mode mode);

>  };
>
>  enum usb_pd_svdm_ver {
> @@ -365,6 +369,7 @@ int typec_port_set_usb_power_delivery(struct typec_po=
rt *port, struct usb_power_
>  int typec_partner_set_usb_power_delivery(struct typec_partner *partner,
>                                          struct usb_power_delivery *pd);
>
> +void typec_partner_set_usb_mode(struct typec_partner *partner, enum usb_=
mode usb_mode);
>  void typec_port_set_usb_mode(struct typec_port *port, enum usb_mode mode=
);
>
>  /**
> --
> 2.45.2
>

Thanks,
Abhishek

