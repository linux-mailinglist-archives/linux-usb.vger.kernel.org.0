Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48C5263C44
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 06:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgIJEva (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 00:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgIJEvB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Sep 2020 00:51:01 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80983C061756
        for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2020 21:50:54 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id x2so4534939ilm.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2020 21:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ler6cwhC+bPlDZ0L9iMrjU1fMV3A+cOIplrZzyj8U6U=;
        b=EkZYGz4U1NpCNkyZntVk+QKKDUQC+omU+Nd0WSfJFpDrm8QmQzS2SbHidvyOxMSTnb
         CtwOGUg3ku/fDl+nFBcfgjAhnrcjS70X5TvzsrIto9pms9ulu6CugEEwjI8xdDpNxHNu
         u5f/N0pzifZmQgJPEeXtGHIwbaLiGjC6iKPucERmnTf74hOZj77LCZr0lLp4ydQyo2bf
         tnMV6Z3iEqNgH2LwHAWXkXboTq5qQLTHyw5MWEdB5J99XXVJKFZrq+FJ8xpCWQC6vPek
         5kEHBOhihV+Sd2YMT0Wc637GV6xngP0fWBHjyq9AGwD4qDu2GSFBixodJlwD6yq3ntYc
         uNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ler6cwhC+bPlDZ0L9iMrjU1fMV3A+cOIplrZzyj8U6U=;
        b=SNm87d1xOMQlhZ/cykpPFCu22zif/xAZfVv9hUVlqIfyjWuIVnQPkC+CcAnDXtopUb
         YAicZITXzno4l10FbrCkc/BgmD6AeUZZYHjVnIMEEpeIlg2KK/cmBNSOs0ikEkXh+L6+
         z94SCpimPB0PxZD22tItfUWIZ/pKWKhjEIZ77uiLOKpPO+b6RnaBniQkpf2CLFxbKhug
         WPEiUI1EtOX7frwD4J33QGjOxA0q9X/2+TV+XxPj/NkcWThlA7LwZY4DZgJ8e7Hfvqe/
         GFzxbTuK7qWDNcm8f9q2wYfeDvG7HaPmupwWq8FNHNKDZvK3bKajj6nvSOvswhiA7g/7
         iLSA==
X-Gm-Message-State: AOAM533w1Iw+1XMhzfoIU2ozZeyqWCwnkHbLCNR8/LksAfZwiAGJzpwI
        8Btr59Gi28c10Iqcx5t0BogAzGE3M84OOkAjxy/UgdaR
X-Google-Smtp-Source: ABdhPJy/xhAhO8UB6TmDI4tOSDE3pHp7ALAa+2J9JYBFWlc/nOi+jPxNkXBVlIsr3CWrMGrn6QHbt5WaRx2efjxQqU8=
X-Received: by 2002:a05:6e02:f91:: with SMTP id v17mr6921496ilo.82.1599713453651;
 Wed, 09 Sep 2020 21:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAEt1Rjq+Fz85KU-aKO+boNE5yL7GiwdopmRd3-FxEL+mzEui-g@mail.gmail.com>
 <20200907155052.2450-1-yazzep@gmail.com> <20200907155052.2450-2-yazzep@gmail.com>
 <20200908190402.GA797206@rowland.harvard.edu>
In-Reply-To: <20200908190402.GA797206@rowland.harvard.edu>
From:   yasushi asano <yazzep@gmail.com>
Date:   Thu, 10 Sep 2020 13:49:59 +0900
Message-ID: <CAEt1RjquJZzTctN6dNQSDbUZ9YG2FnEtzTZsoA3a9RtXHxwUmA@mail.gmail.com>
Subject: Re: [PATCH v3] USB: hub.c: decrease the number of attempts of
 enumeration scheme
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        "Rosca, Eugeniu (ADITG/ESM1)" <erosca@de.adit-jv.com>,
        andrew_gabbasov@mentor.com, Baxter Jim <jim_baxter@mentor.com>,
        "Natsume, Wataru (ADITJ/SWG)" <wnatsume@jp.adit-jv.com>,
        "Nishiguchi, Naohiro (ADITJ/SWG)" <nnishiguchi@jp.adit-jv.com>,
        =?UTF-8?B?5rWF6YeO5oGt5Y+y?= <yasano@jp.adit-jv.com>,
        kernel test robot <rong.a.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Alan
Thank you for your kindness.
I tried to minimize the amount of change so as not to affect other
processing, but I understood that my fix was not appropriate.
I'm testing the patch you offered using PET tool.
Please wait a while.

2020=E5=B9=B49=E6=9C=889=E6=97=A5(=E6=B0=B4) 4:04 Alan Stern <stern@rowland=
.harvard.edu>:
>
> On Tue, Sep 08, 2020 at 12:50:52AM +0900, Yasushi Asano wrote:
> > From: Yasushi Asano <yasano@jp.adit-jv.com>
> >
> > According to 6.7.22 A-UUT "Device No Response" for connection timeout
> > of USB OTG and EH automated compliance plan v1.2, the enumeration
> > failure has to be detected within 30 seconds. However, the old and new
> > enumeration schemes made a total of 16 attempts, and each attempt can
> > take 5 seconds to timeout, so it failed with PET test. Modify it to
> > reduce the number of attempts to 5 and pass PET test.
> >
> > in case of old_schene_first=3DN and use_both_schemes=3DY
> > attempt 3 * new scheme, then 2 * old scheme
> > in case of old_schene_first=3DY and use_both_schemes=3DY
> > attempt 2 * old scheme, then 3 * new scheme
>
> There are several issues this patch does not take into account, such as
> resets between retries and port-power cycling.  Also, you did not
> restructure the code appropriately.
>
> Please review and test the patch below.  Does it do what you think it
> should?
>
> Alan Stern
>
>
> Index: usb-devel/drivers/usb/core/hub.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/core/hub.c
> +++ usb-devel/drivers/usb/core/hub.c
> @@ -2707,9 +2707,7 @@ static unsigned hub_is_wusb(struct usb_h
>
>  #define PORT_RESET_TRIES       5
>  #define SET_ADDRESS_TRIES      2
> -#define GET_DESCRIPTOR_TRIES   2
> -#define SET_CONFIG_TRIES       (2 * (use_both_schemes + 1))
> -#define USE_NEW_SCHEME(i, scheme)      ((i) / 2 =3D=3D (int)(scheme))
> +#define PORT_INIT_TRIES                5
>
>  #define HUB_ROOT_RESET_TIME    60      /* times are in msec */
>  #define HUB_SHORT_RESET_TIME   10
> @@ -2717,23 +2715,31 @@ static unsigned hub_is_wusb(struct usb_h
>  #define HUB_LONG_RESET_TIME    200
>  #define HUB_RESET_TIMEOUT      800
>
> -/*
> - * "New scheme" enumeration causes an extra state transition to be
> - * exposed to an xhci host and causes USB3 devices to receive control
> - * commands in the default state.  This has been seen to cause
> - * enumeration failures, so disable this enumeration scheme for USB3
> - * devices.
> - */
>  static bool use_new_scheme(struct usb_device *udev, int retry,
>                            struct usb_port *port_dev)
>  {
>         int old_scheme_first_port =3D
> -               port_dev->quirks & USB_PORT_QUIRK_OLD_SCHEME;
> +               (port_dev->quirks & USB_PORT_QUIRK_OLD_SCHEME) ||
> +               old_scheme_first;
>
> +       /*
> +        * "New scheme" enumeration causes an extra state transition to b=
e
> +        * exposed to an xhci host and causes USB3 devices to receive con=
trol
> +        * commands in the default state.  This has been seen to cause
> +        * enumeration failures, so disable this enumeration scheme for U=
SB3
> +        * devices.
> +        */
>         if (udev->speed >=3D USB_SPEED_SUPER)
>                 return false;
>
> -       return USE_NEW_SCHEME(retry, old_scheme_first_port || old_scheme_=
first);
> +       /*
> +        * If use_both_schemes is set, use the first scheme (whichever
> +        * it is) for the larger half of the retries, then use the other
> +        * scheme.  Otherwise, use the first scheme for all the retries.
> +        */
> +       if (use_both_schemes && retry >=3D (PORT_INIT_TRIES + 1) / 2)
> +               return old_scheme_first_port;   /* Second half */
> +       return !old_scheme_first_port;          /* First half or all */
>  }
>
>  /* Is a USB 3.0 port in the Inactive or Compliance Mode state?
> @@ -4539,12 +4545,13 @@ hub_port_init(struct usb_hub *hub, struc
>         struct usb_device       *hdev =3D hub->hdev;
>         struct usb_hcd          *hcd =3D bus_to_hcd(hdev->bus);
>         struct usb_port         *port_dev =3D hub->ports[port1 - 1];
> -       int                     retries, operations, retval, i;
> +       int                     operations, retval, i;
>         unsigned                delay =3D HUB_SHORT_RESET_TIME;
>         enum usb_device_speed   oldspeed =3D udev->speed;
>         const char              *speed;
>         int                     devnum =3D udev->devnum;
>         const char              *driver_name;
> +       bool                    do_new_scheme;
>
>         /* root hub ports have a slightly longer reset period
>          * (from USB 2.0 spec, section 7.1.7.5)
> @@ -4657,130 +4664,106 @@ hub_port_init(struct usb_hub *hub, struc
>          * first 8 bytes of the device descriptor to get the ep0 maxpacke=
t
>          * value.
>          */
> -       for (retries =3D 0; retries < GET_DESCRIPTOR_TRIES; (++retries, m=
sleep(100))) {
> -               bool did_new_scheme =3D false;
> -
> -               if (use_new_scheme(udev, retry_counter, port_dev)) {
> -                       struct usb_device_descriptor *buf;
> -                       int r =3D 0;
> +       do_new_scheme =3D use_new_scheme(udev, retry_counter, port_dev);
>
> -                       did_new_scheme =3D true;
> -                       retval =3D hub_enable_device(udev);
> -                       if (retval < 0) {
> -                               dev_err(&udev->dev,
> -                                       "hub failed to enable device, err=
or %d\n",
> -                                       retval);
> -                               goto fail;
> -                       }
> +       if (do_new_scheme) {
> +               struct usb_device_descriptor *buf;
> +               int r =3D 0;
> +
> +               retval =3D hub_enable_device(udev);
> +               if (retval < 0) {
> +                       dev_err(&udev->dev,
> +                               "hub failed to enable device, error %d\n"=
,
> +                               retval);
> +                       goto fail;
> +               }
>
>  #define GET_DESCRIPTOR_BUFSIZE 64
> -                       buf =3D kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO)=
;
> -                       if (!buf) {
> -                               retval =3D -ENOMEM;
> -                               continue;
> -                       }
> +               buf =3D kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
> +               if (!buf) {
> +                       retval =3D -ENOMEM;
> +                       goto fail;
> +               }
>
> -                       /* Retry on all errors; some devices are flakey.
> -                        * 255 is for WUSB devices, we actually need to u=
se
> -                        * 512 (WUSB1.0[4.8.1]).
> -                        */
> -                       for (operations =3D 0; operations < 3; ++operatio=
ns) {
> -                               buf->bMaxPacketSize0 =3D 0;
> -                               r =3D usb_control_msg(udev, usb_rcvaddr0p=
ipe(),
> -                                       USB_REQ_GET_DESCRIPTOR, USB_DIR_I=
N,
> -                                       USB_DT_DEVICE << 8, 0,
> -                                       buf, GET_DESCRIPTOR_BUFSIZE,
> -                                       initial_descriptor_timeout);
> -                               switch (buf->bMaxPacketSize0) {
> -                               case 8: case 16: case 32: case 64: case 2=
55:
> -                                       if (buf->bDescriptorType =3D=3D
> -                                                       USB_DT_DEVICE) {
> -                                               r =3D 0;
> -                                               break;
> -                                       }
> -                                       fallthrough;
> -                               default:
> -                                       if (r =3D=3D 0)
> -                                               r =3D -EPROTO;
> -                                       break;
> -                               }
> -                               /*
> -                                * Some devices time out if they are powe=
red on
> -                                * when already connected. They need a se=
cond
> -                                * reset. But only on the first attempt,
> -                                * lest we get into a time out/reset loop
> -                                */
> -                               if (r =3D=3D 0 || (r =3D=3D -ETIMEDOUT &&
> -                                               retries =3D=3D 0 &&
> -                                               udev->speed > USB_SPEED_F=
ULL))
> -                                       break;
> +               /*
> +                * 255 is for WUSB devices, we actually need to use
> +                * 512 (WUSB1.0[4.8.1]).
> +                */
> +               buf->bMaxPacketSize0 =3D 0;
> +               r =3D usb_control_msg(udev, usb_rcvaddr0pipe(),
> +                       USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
> +                       USB_DT_DEVICE << 8, 0,
> +                       buf, GET_DESCRIPTOR_BUFSIZE,
> +                       initial_descriptor_timeout);
> +               switch (buf->bMaxPacketSize0) {
> +               case 8: case 16: case 32: case 64: case 255:
> +                       if (buf->bDescriptorType =3D=3D USB_DT_DEVICE) {
> +                               r =3D 0;
> +                               break;
>                         }
> -                       udev->descriptor.bMaxPacketSize0 =3D
> -                                       buf->bMaxPacketSize0;
> +                       fallthrough;
> +               default:
> +                       if (r =3D=3D 0)
> +                               r =3D -EPROTO;
> +                       if (r !=3D -ENODEV)
> +                               dev_err(&udev->dev, "device descriptor re=
ad/64, error %d\n", r);
> +                       retval =3D r;
>                         kfree(buf);
> +                       goto fail;
> +               }
> +               udev->descriptor.bMaxPacketSize0 =3D buf->bMaxPacketSize0=
;
> +               kfree(buf);
>
> -                       retval =3D hub_port_reset(hub, port1, udev, delay=
, false);
> -                       if (retval < 0)         /* error or disconnect */
> -                               goto fail;
> -                       if (oldspeed !=3D udev->speed) {
> -                               dev_dbg(&udev->dev,
> -                                       "device reset changed speed!\n");
> -                               retval =3D -ENODEV;
> -                               goto fail;
> -                       }
> -                       if (r) {
> -                               if (r !=3D -ENODEV)
> -                                       dev_err(&udev->dev, "device descr=
iptor read/64, error %d\n",
> -                                                       r);
> -                               retval =3D -EMSGSIZE;
> -                               continue;
> -                       }
> +               retval =3D hub_port_reset(hub, port1, udev, delay, false)=
;
> +               if (retval < 0)         /* error or disconnect */
> +                       goto fail;
> +               if (oldspeed !=3D udev->speed) {
> +                       dev_dbg(&udev->dev, "device reset changed speed!\=
n");
> +                       retval =3D -ENODEV;
> +                       goto fail;
> +               }
>  #undef GET_DESCRIPTOR_BUFSIZE
> +       }
> +
> +       /*
> +        * If device is WUSB, we already assigned an
> +        * unauthorized address in the Connect Ack sequence;
> +        * authorization will assign the final address.
> +        */
> +       if (udev->wusb =3D=3D 0) {
> +               for (operations =3D 0; operations < SET_ADDRESS_TRIES; ++=
operations) {
> +                       retval =3D hub_set_address(udev, devnum);
> +                       if (retval >=3D 0)
> +                               break;
> +                       msleep(200);
> +               }
> +               if (retval < 0) {
> +                       if (retval !=3D -ENODEV)
> +                               dev_err(&udev->dev, "device not accepting=
 address %d, error %d\n",
> +                                               devnum, retval);
> +                       goto fail;
> +               }
> +               if (udev->speed >=3D USB_SPEED_SUPER) {
> +                       devnum =3D udev->devnum;
> +                       dev_info(&udev->dev,
> +                                       "%s SuperSpeed%s%s USB device num=
ber %d using %s\n",
> +                                       (udev->config) ? "reset" : "new",
> +                                (udev->speed =3D=3D USB_SPEED_SUPER_PLUS=
) ?
> +                                               "Plus Gen 2" : " Gen 1",
> +                                (udev->rx_lanes =3D=3D 2 && udev->tx_lan=
es =3D=3D 2) ?
> +                                               "x2" : "",
> +                                devnum, driver_name);
>                 }
>
>                 /*
> -                * If device is WUSB, we already assigned an
> -                * unauthorized address in the Connect Ack sequence;
> -                * authorization will assign the final address.
> +                * cope with hardware quirkiness:
> +                *  - let SET_ADDRESS settle, some device hardware wants =
it
> +                *  - read ep0 maxpacket even for high and low speed,
>                  */
> -               if (udev->wusb =3D=3D 0) {
> -                       for (operations =3D 0; operations < SET_ADDRESS_T=
RIES; ++operations) {
> -                               retval =3D hub_set_address(udev, devnum);
> -                               if (retval >=3D 0)
> -                                       break;
> -                               msleep(200);
> -                       }
> -                       if (retval < 0) {
> -                               if (retval !=3D -ENODEV)
> -                                       dev_err(&udev->dev, "device not a=
ccepting address %d, error %d\n",
> -                                                       devnum, retval);
> -                               goto fail;
> -                       }
> -                       if (udev->speed >=3D USB_SPEED_SUPER) {
> -                               devnum =3D udev->devnum;
> -                               dev_info(&udev->dev,
> -                                               "%s SuperSpeed%s%s USB de=
vice number %d using %s\n",
> -                                               (udev->config) ? "reset" =
: "new",
> -                                        (udev->speed =3D=3D USB_SPEED_SU=
PER_PLUS) ?
> -                                                       "Plus Gen 2" : " =
Gen 1",
> -                                        (udev->rx_lanes =3D=3D 2 && udev=
->tx_lanes =3D=3D 2) ?
> -                                                       "x2" : "",
> -                                        devnum, driver_name);
> -                       }
> -
> -                       /* cope with hardware quirkiness:
> -                        *  - let SET_ADDRESS settle, some device hardwar=
e wants it
> -                        *  - read ep0 maxpacket even for high and low sp=
eed,
> -                        */
> -                       msleep(10);
> -                       /* use_new_scheme() checks the speed which may ha=
ve
> -                        * changed since the initial look so we cache the=
 result
> -                        * in did_new_scheme
> -                        */
> -                       if (did_new_scheme)
> -                               break;
> -               }
> +               msleep(10);
> +       }
>
> +       if (!do_new_scheme) {
>                 retval =3D usb_get_device_descriptor(udev, 8);
>                 if (retval < 8) {
>                         if (retval !=3D -ENODEV)
> @@ -4804,7 +4787,6 @@ hub_port_init(struct usb_hub *hub, struc
>                                         retval);
>                                 retval =3D 0;
>                         }
> -                       break;
>                 }
>         }
>         if (retval)
> @@ -5106,7 +5088,7 @@ static void hub_port_connect(struct usb_
>                 unit_load =3D 100;
>
>         status =3D 0;
> -       for (i =3D 0; i < SET_CONFIG_TRIES; i++) {
> +       for (i =3D 0; i < PORT_INIT_TRIES; i++) {
>
>                 /* reallocate for each attempt, since references
>                  * to the previous one can escape in various ways
> @@ -5239,7 +5221,7 @@ loop:
>                         break;
>
>                 /* When halfway through our retry count, power-cycle the =
port */
> -               if (i =3D=3D (SET_CONFIG_TRIES / 2) - 1) {
> +               if (i =3D=3D (PORT_INIT_TRIES / 2) - 1) {
>                         dev_info(&port_dev->dev, "attempt power cycle\n")=
;
>                         usb_hub_set_port_power(hdev, hub, port1, false);
>                         msleep(2 * hub_power_on_good_delay(hub));
> @@ -5770,7 +5752,7 @@ static int usb_reset_and_verify_device(s
>         bos =3D udev->bos;
>         udev->bos =3D NULL;
>
> -       for (i =3D 0; i < SET_CONFIG_TRIES; ++i) {
> +       for (i =3D 0; i < PORT_INIT_TRIES; ++i) {
>
>                 /* ep0 maxpacket size may change; let the HCD know about =
it.
>                  * Other endpoints will be handled by re-enumeration. */
>
