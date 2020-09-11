Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49BAD265BAF
	for <lists+linux-usb@lfdr.de>; Fri, 11 Sep 2020 10:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbgIKIeT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Sep 2020 04:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgIKIeN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Sep 2020 04:34:13 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7EF7C061573
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2020 01:34:13 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id a19so3709401ilq.10
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2020 01:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D3qZEwNPIZHgIwmmdgzoKMHEXjywlscnQJ9Rg5O/N94=;
        b=jr1m0lWFe8mGcOQYeSd5p9BussF7vh2jW4f85EvrrXEQS24FCT1Z7Lz9G8RwoOj6si
         z7TjpeA1I/gSJTseJarZt/NNiJmep1gk/3MH4aB6iPChc0goqKGYHCtKNszcmYtpHELF
         yENWpr9jBd0pemJSh49WKGdmD9gib16BPCEepElVMXSpbnU2NdF99ILHqLZl1jGrPJIR
         miSOXqtCvsDM+oXMZ5a1AX/uvrwPzh2cfMPYgJmIlribb+KDGBFs9vw3miNakkBOiTZl
         Ht+llHLZXN+oTGsp7DFarpt4uIiuSgW/BiyCNLHj2hrawqnyGiLgbl2OX5XRtN/oB7P8
         b6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D3qZEwNPIZHgIwmmdgzoKMHEXjywlscnQJ9Rg5O/N94=;
        b=IYKhegCh59UnlkXa4fbQbb9UPpEduhUBs4GCYloynDWQ8DWEhSMp6Ff1cUkHJv0Jwg
         9IuH2DK8FhNfnSd8CudEYjEeJb8AuIFOlbjfywmucyn0V+MEfyJBBvUVNz5AYaRSq44p
         RcutwH4KT50rg3tZWcY9lb2x/F+46OZvPcj9pjqlgx6PR4/ykmG+yjwX+8uDtt9G7HQw
         XCsDvltiUoY0b+oOLIXkR+FRMgs4ijXkFfisIFhZdq8XQLV0BZs4MDjgvJkujjSA/q2U
         Stw7XjCOGPGYSnAlgJnWMby/kUE+X96zQaKv+PU9s4sTHnZL4/IpcE2dnAu9cAVKU/U1
         9MCQ==
X-Gm-Message-State: AOAM531ehHcIsbjbvUbcyco5+cx6Ety1fTYeEgd6Ks7/kNB3L/+c2fJl
        +Fhbj9HszhqG/VdpXRI6VDx4xaF1Upv+qr66O3xUxjDwlBQ=
X-Google-Smtp-Source: ABdhPJwpUbeD8uYU1vxXUcnUCutiU3apS3UaoA+2RTAYW/szz+lZ34MJDjy6g2VWYoORxs5oVEBQM/ZLMZpHdegVJwE=
X-Received: by 2002:a92:35d0:: with SMTP id c77mr827698ilf.183.1599813252776;
 Fri, 11 Sep 2020 01:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAEt1Rjq+Fz85KU-aKO+boNE5yL7GiwdopmRd3-FxEL+mzEui-g@mail.gmail.com>
 <20200907155052.2450-1-yazzep@gmail.com> <20200907155052.2450-2-yazzep@gmail.com>
 <20200908190402.GA797206@rowland.harvard.edu> <CAEt1RjquJZzTctN6dNQSDbUZ9YG2FnEtzTZsoA3a9RtXHxwUmA@mail.gmail.com>
In-Reply-To: <CAEt1RjquJZzTctN6dNQSDbUZ9YG2FnEtzTZsoA3a9RtXHxwUmA@mail.gmail.com>
From:   yasushi asano <yazzep@gmail.com>
Date:   Fri, 11 Sep 2020 17:33:18 +0900
Message-ID: <CAEt1RjpGcZ4T70tr83pmcD--PzAMboBkbv55qFcRfMz11ZUggw@mail.gmail.com>
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

Dear Alan,
I tested the patch you provided.
Unfortunately, it takes about 40 seconds to reach the detection of
enumeration failure. so the PET test failed.
Now I'm checking which procedure took time.
                     :
[   77.469035] hrtimer: interrupt took 23800 ns
[  737.812782] *** Connect  PET       ***
[  759.854355] *** Exec PET App       ***
[  763.300951] usb 1-1.1: new full-speed USB device number 4 using ehci-pla=
tform
[  763.301248] usb 1-1.1: device descriptor read/64, error -32
[  763.383966] usb 1-1.1: new full-speed USB device number 5 using ehci-pla=
tform
[  763.384256] usb 1-1.1: device descriptor read/64, error -32
[  763.390282] usb 1-1-port1: attempt power cycle
[  765.586566] usb 1-1-port1: unable to enumerate USB device [-107]
[  816.850692] *** Setting Test Suite ***
[  835.593181] *** Ready OK Test Start***
[  838.822953] usb 1-1.1: new full-speed USB device number 7 using
ehci-platform [1]---start---------
[  844.037032] usb 1-1.1: device descriptor read/64, error -110
          [2]....... [2]-[1] =3D 5.2 second
[  844.121947] usb 1-1.1: new full-speed USB device number 8 using ehci-pla=
tform
[  849.156628] usb 1-1.1: device descriptor read/64, error -110
          [3]....... [3]-[2] =3D 5.1 second
[  849.163971] usb 1-1-port1: attempt power cycle
[  851.102959] usb 1-1.1: new full-speed USB device number 9 using ehci-pla=
tform
[  856.325028] usb 1-1.1: device descriptor read/64, error -110
          [4]....... [4]-[3] =3D 7.2 second
[  856.409962] usb 1-1.1: new full-speed USB device number 10 using
ehci-platform
[  867.281957] usb 1-1.1: device not accepting address 10, error -110
          [5]....... [5]-[4] =3D 10.9 second
[  867.365954] usb 1-1.1: new full-speed USB device number 11 using
ehci-platform
[  878.545941] usb 1-1.1: device not accepting address 11, error -110
          [6]....... [6]-[5] =3D 11.2 second
[  878.552808] usb 1-1-port1: unable to enumerate USB device
          [7]  total [7]-[1] =3D 39.7 second
[  899.489808] *** End of Test        ***

2020=E5=B9=B49=E6=9C=8810=E6=97=A5(=E6=9C=A8) 13:49 yasushi asano <yazzep@g=
mail.com>:
>
> Dear Alan
> Thank you for your kindness.
> I tried to minimize the amount of change so as not to affect other
> processing, but I understood that my fix was not appropriate.
> I'm testing the patch you offered using PET tool.
> Please wait a while.
>
> 2020=E5=B9=B49=E6=9C=889=E6=97=A5(=E6=B0=B4) 4:04 Alan Stern <stern@rowla=
nd.harvard.edu>:
> >
> > On Tue, Sep 08, 2020 at 12:50:52AM +0900, Yasushi Asano wrote:
> > > From: Yasushi Asano <yasano@jp.adit-jv.com>
> > >
> > > According to 6.7.22 A-UUT "Device No Response" for connection timeout
> > > of USB OTG and EH automated compliance plan v1.2, the enumeration
> > > failure has to be detected within 30 seconds. However, the old and ne=
w
> > > enumeration schemes made a total of 16 attempts, and each attempt can
> > > take 5 seconds to timeout, so it failed with PET test. Modify it to
> > > reduce the number of attempts to 5 and pass PET test.
> > >
> > > in case of old_schene_first=3DN and use_both_schemes=3DY
> > > attempt 3 * new scheme, then 2 * old scheme
> > > in case of old_schene_first=3DY and use_both_schemes=3DY
> > > attempt 2 * old scheme, then 3 * new scheme
> >
> > There are several issues this patch does not take into account, such as
> > resets between retries and port-power cycling.  Also, you did not
> > restructure the code appropriately.
> >
> > Please review and test the patch below.  Does it do what you think it
> > should?
> >
> > Alan Stern
> >
> >
> > Index: usb-devel/drivers/usb/core/hub.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- usb-devel.orig/drivers/usb/core/hub.c
> > +++ usb-devel/drivers/usb/core/hub.c
> > @@ -2707,9 +2707,7 @@ static unsigned hub_is_wusb(struct usb_h
> >
> >  #define PORT_RESET_TRIES       5
> >  #define SET_ADDRESS_TRIES      2
> > -#define GET_DESCRIPTOR_TRIES   2
> > -#define SET_CONFIG_TRIES       (2 * (use_both_schemes + 1))
> > -#define USE_NEW_SCHEME(i, scheme)      ((i) / 2 =3D=3D (int)(scheme))
> > +#define PORT_INIT_TRIES                5
> >
> >  #define HUB_ROOT_RESET_TIME    60      /* times are in msec */
> >  #define HUB_SHORT_RESET_TIME   10
> > @@ -2717,23 +2715,31 @@ static unsigned hub_is_wusb(struct usb_h
> >  #define HUB_LONG_RESET_TIME    200
> >  #define HUB_RESET_TIMEOUT      800
> >
> > -/*
> > - * "New scheme" enumeration causes an extra state transition to be
> > - * exposed to an xhci host and causes USB3 devices to receive control
> > - * commands in the default state.  This has been seen to cause
> > - * enumeration failures, so disable this enumeration scheme for USB3
> > - * devices.
> > - */
> >  static bool use_new_scheme(struct usb_device *udev, int retry,
> >                            struct usb_port *port_dev)
> >  {
> >         int old_scheme_first_port =3D
> > -               port_dev->quirks & USB_PORT_QUIRK_OLD_SCHEME;
> > +               (port_dev->quirks & USB_PORT_QUIRK_OLD_SCHEME) ||
> > +               old_scheme_first;
> >
> > +       /*
> > +        * "New scheme" enumeration causes an extra state transition to=
 be
> > +        * exposed to an xhci host and causes USB3 devices to receive c=
ontrol
> > +        * commands in the default state.  This has been seen to cause
> > +        * enumeration failures, so disable this enumeration scheme for=
 USB3
> > +        * devices.
> > +        */
> >         if (udev->speed >=3D USB_SPEED_SUPER)
> >                 return false;
> >
> > -       return USE_NEW_SCHEME(retry, old_scheme_first_port || old_schem=
e_first);
> > +       /*
> > +        * If use_both_schemes is set, use the first scheme (whichever
> > +        * it is) for the larger half of the retries, then use the othe=
r
> > +        * scheme.  Otherwise, use the first scheme for all the retries=
.
> > +        */
> > +       if (use_both_schemes && retry >=3D (PORT_INIT_TRIES + 1) / 2)
> > +               return old_scheme_first_port;   /* Second half */
> > +       return !old_scheme_first_port;          /* First half or all */
> >  }
> >
> >  /* Is a USB 3.0 port in the Inactive or Compliance Mode state?
> > @@ -4539,12 +4545,13 @@ hub_port_init(struct usb_hub *hub, struc
> >         struct usb_device       *hdev =3D hub->hdev;
> >         struct usb_hcd          *hcd =3D bus_to_hcd(hdev->bus);
> >         struct usb_port         *port_dev =3D hub->ports[port1 - 1];
> > -       int                     retries, operations, retval, i;
> > +       int                     operations, retval, i;
> >         unsigned                delay =3D HUB_SHORT_RESET_TIME;
> >         enum usb_device_speed   oldspeed =3D udev->speed;
> >         const char              *speed;
> >         int                     devnum =3D udev->devnum;
> >         const char              *driver_name;
> > +       bool                    do_new_scheme;
> >
> >         /* root hub ports have a slightly longer reset period
> >          * (from USB 2.0 spec, section 7.1.7.5)
> > @@ -4657,130 +4664,106 @@ hub_port_init(struct usb_hub *hub, struc
> >          * first 8 bytes of the device descriptor to get the ep0 maxpac=
ket
> >          * value.
> >          */
> > -       for (retries =3D 0; retries < GET_DESCRIPTOR_TRIES; (++retries,=
 msleep(100))) {
> > -               bool did_new_scheme =3D false;
> > -
> > -               if (use_new_scheme(udev, retry_counter, port_dev)) {
> > -                       struct usb_device_descriptor *buf;
> > -                       int r =3D 0;
> > +       do_new_scheme =3D use_new_scheme(udev, retry_counter, port_dev)=
;
> >
> > -                       did_new_scheme =3D true;
> > -                       retval =3D hub_enable_device(udev);
> > -                       if (retval < 0) {
> > -                               dev_err(&udev->dev,
> > -                                       "hub failed to enable device, e=
rror %d\n",
> > -                                       retval);
> > -                               goto fail;
> > -                       }
> > +       if (do_new_scheme) {
> > +               struct usb_device_descriptor *buf;
> > +               int r =3D 0;
> > +
> > +               retval =3D hub_enable_device(udev);
> > +               if (retval < 0) {
> > +                       dev_err(&udev->dev,
> > +                               "hub failed to enable device, error %d\=
n",
> > +                               retval);
> > +                       goto fail;
> > +               }
> >
> >  #define GET_DESCRIPTOR_BUFSIZE 64
> > -                       buf =3D kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOI=
O);
> > -                       if (!buf) {
> > -                               retval =3D -ENOMEM;
> > -                               continue;
> > -                       }
> > +               buf =3D kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
> > +               if (!buf) {
> > +                       retval =3D -ENOMEM;
> > +                       goto fail;
> > +               }
> >
> > -                       /* Retry on all errors; some devices are flakey=
.
> > -                        * 255 is for WUSB devices, we actually need to=
 use
> > -                        * 512 (WUSB1.0[4.8.1]).
> > -                        */
> > -                       for (operations =3D 0; operations < 3; ++operat=
ions) {
> > -                               buf->bMaxPacketSize0 =3D 0;
> > -                               r =3D usb_control_msg(udev, usb_rcvaddr=
0pipe(),
> > -                                       USB_REQ_GET_DESCRIPTOR, USB_DIR=
_IN,
> > -                                       USB_DT_DEVICE << 8, 0,
> > -                                       buf, GET_DESCRIPTOR_BUFSIZE,
> > -                                       initial_descriptor_timeout);
> > -                               switch (buf->bMaxPacketSize0) {
> > -                               case 8: case 16: case 32: case 64: case=
 255:
> > -                                       if (buf->bDescriptorType =3D=3D
> > -                                                       USB_DT_DEVICE) =
{
> > -                                               r =3D 0;
> > -                                               break;
> > -                                       }
> > -                                       fallthrough;
> > -                               default:
> > -                                       if (r =3D=3D 0)
> > -                                               r =3D -EPROTO;
> > -                                       break;
> > -                               }
> > -                               /*
> > -                                * Some devices time out if they are po=
wered on
> > -                                * when already connected. They need a =
second
> > -                                * reset. But only on the first attempt=
,
> > -                                * lest we get into a time out/reset lo=
op
> > -                                */
> > -                               if (r =3D=3D 0 || (r =3D=3D -ETIMEDOUT =
&&
> > -                                               retries =3D=3D 0 &&
> > -                                               udev->speed > USB_SPEED=
_FULL))
> > -                                       break;
> > +               /*
> > +                * 255 is for WUSB devices, we actually need to use
> > +                * 512 (WUSB1.0[4.8.1]).
> > +                */
> > +               buf->bMaxPacketSize0 =3D 0;
> > +               r =3D usb_control_msg(udev, usb_rcvaddr0pipe(),
> > +                       USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
> > +                       USB_DT_DEVICE << 8, 0,
> > +                       buf, GET_DESCRIPTOR_BUFSIZE,
> > +                       initial_descriptor_timeout);
> > +               switch (buf->bMaxPacketSize0) {
> > +               case 8: case 16: case 32: case 64: case 255:
> > +                       if (buf->bDescriptorType =3D=3D USB_DT_DEVICE) =
{
> > +                               r =3D 0;
> > +                               break;
> >                         }
> > -                       udev->descriptor.bMaxPacketSize0 =3D
> > -                                       buf->bMaxPacketSize0;
> > +                       fallthrough;
> > +               default:
> > +                       if (r =3D=3D 0)
> > +                               r =3D -EPROTO;
> > +                       if (r !=3D -ENODEV)
> > +                               dev_err(&udev->dev, "device descriptor =
read/64, error %d\n", r);
> > +                       retval =3D r;
> >                         kfree(buf);
> > +                       goto fail;
> > +               }
> > +               udev->descriptor.bMaxPacketSize0 =3D buf->bMaxPacketSiz=
e0;
> > +               kfree(buf);
> >
> > -                       retval =3D hub_port_reset(hub, port1, udev, del=
ay, false);
> > -                       if (retval < 0)         /* error or disconnect =
*/
> > -                               goto fail;
> > -                       if (oldspeed !=3D udev->speed) {
> > -                               dev_dbg(&udev->dev,
> > -                                       "device reset changed speed!\n"=
);
> > -                               retval =3D -ENODEV;
> > -                               goto fail;
> > -                       }
> > -                       if (r) {
> > -                               if (r !=3D -ENODEV)
> > -                                       dev_err(&udev->dev, "device des=
criptor read/64, error %d\n",
> > -                                                       r);
> > -                               retval =3D -EMSGSIZE;
> > -                               continue;
> > -                       }
> > +               retval =3D hub_port_reset(hub, port1, udev, delay, fals=
e);
> > +               if (retval < 0)         /* error or disconnect */
> > +                       goto fail;
> > +               if (oldspeed !=3D udev->speed) {
> > +                       dev_dbg(&udev->dev, "device reset changed speed=
!\n");
> > +                       retval =3D -ENODEV;
> > +                       goto fail;
> > +               }
> >  #undef GET_DESCRIPTOR_BUFSIZE
> > +       }
> > +
> > +       /*
> > +        * If device is WUSB, we already assigned an
> > +        * unauthorized address in the Connect Ack sequence;
> > +        * authorization will assign the final address.
> > +        */
> > +       if (udev->wusb =3D=3D 0) {
> > +               for (operations =3D 0; operations < SET_ADDRESS_TRIES; =
++operations) {
> > +                       retval =3D hub_set_address(udev, devnum);
> > +                       if (retval >=3D 0)
> > +                               break;
> > +                       msleep(200);
> > +               }
> > +               if (retval < 0) {
> > +                       if (retval !=3D -ENODEV)
> > +                               dev_err(&udev->dev, "device not accepti=
ng address %d, error %d\n",
> > +                                               devnum, retval);
> > +                       goto fail;
> > +               }
> > +               if (udev->speed >=3D USB_SPEED_SUPER) {
> > +                       devnum =3D udev->devnum;
> > +                       dev_info(&udev->dev,
> > +                                       "%s SuperSpeed%s%s USB device n=
umber %d using %s\n",
> > +                                       (udev->config) ? "reset" : "new=
",
> > +                                (udev->speed =3D=3D USB_SPEED_SUPER_PL=
US) ?
> > +                                               "Plus Gen 2" : " Gen 1"=
,
> > +                                (udev->rx_lanes =3D=3D 2 && udev->tx_l=
anes =3D=3D 2) ?
> > +                                               "x2" : "",
> > +                                devnum, driver_name);
> >                 }
> >
> >                 /*
> > -                * If device is WUSB, we already assigned an
> > -                * unauthorized address in the Connect Ack sequence;
> > -                * authorization will assign the final address.
> > +                * cope with hardware quirkiness:
> > +                *  - let SET_ADDRESS settle, some device hardware want=
s it
> > +                *  - read ep0 maxpacket even for high and low speed,
> >                  */
> > -               if (udev->wusb =3D=3D 0) {
> > -                       for (operations =3D 0; operations < SET_ADDRESS=
_TRIES; ++operations) {
> > -                               retval =3D hub_set_address(udev, devnum=
);
> > -                               if (retval >=3D 0)
> > -                                       break;
> > -                               msleep(200);
> > -                       }
> > -                       if (retval < 0) {
> > -                               if (retval !=3D -ENODEV)
> > -                                       dev_err(&udev->dev, "device not=
 accepting address %d, error %d\n",
> > -                                                       devnum, retval)=
;
> > -                               goto fail;
> > -                       }
> > -                       if (udev->speed >=3D USB_SPEED_SUPER) {
> > -                               devnum =3D udev->devnum;
> > -                               dev_info(&udev->dev,
> > -                                               "%s SuperSpeed%s%s USB =
device number %d using %s\n",
> > -                                               (udev->config) ? "reset=
" : "new",
> > -                                        (udev->speed =3D=3D USB_SPEED_=
SUPER_PLUS) ?
> > -                                                       "Plus Gen 2" : =
" Gen 1",
> > -                                        (udev->rx_lanes =3D=3D 2 && ud=
ev->tx_lanes =3D=3D 2) ?
> > -                                                       "x2" : "",
> > -                                        devnum, driver_name);
> > -                       }
> > -
> > -                       /* cope with hardware quirkiness:
> > -                        *  - let SET_ADDRESS settle, some device hardw=
are wants it
> > -                        *  - read ep0 maxpacket even for high and low =
speed,
> > -                        */
> > -                       msleep(10);
> > -                       /* use_new_scheme() checks the speed which may =
have
> > -                        * changed since the initial look so we cache t=
he result
> > -                        * in did_new_scheme
> > -                        */
> > -                       if (did_new_scheme)
> > -                               break;
> > -               }
> > +               msleep(10);
> > +       }
> >
> > +       if (!do_new_scheme) {
> >                 retval =3D usb_get_device_descriptor(udev, 8);
> >                 if (retval < 8) {
> >                         if (retval !=3D -ENODEV)
> > @@ -4804,7 +4787,6 @@ hub_port_init(struct usb_hub *hub, struc
> >                                         retval);
> >                                 retval =3D 0;
> >                         }
> > -                       break;
> >                 }
> >         }
> >         if (retval)
> > @@ -5106,7 +5088,7 @@ static void hub_port_connect(struct usb_
> >                 unit_load =3D 100;
> >
> >         status =3D 0;
> > -       for (i =3D 0; i < SET_CONFIG_TRIES; i++) {
> > +       for (i =3D 0; i < PORT_INIT_TRIES; i++) {
> >
> >                 /* reallocate for each attempt, since references
> >                  * to the previous one can escape in various ways
> > @@ -5239,7 +5221,7 @@ loop:
> >                         break;
> >
> >                 /* When halfway through our retry count, power-cycle th=
e port */
> > -               if (i =3D=3D (SET_CONFIG_TRIES / 2) - 1) {
> > +               if (i =3D=3D (PORT_INIT_TRIES / 2) - 1) {
> >                         dev_info(&port_dev->dev, "attempt power cycle\n=
");
> >                         usb_hub_set_port_power(hdev, hub, port1, false)=
;
> >                         msleep(2 * hub_power_on_good_delay(hub));
> > @@ -5770,7 +5752,7 @@ static int usb_reset_and_verify_device(s
> >         bos =3D udev->bos;
> >         udev->bos =3D NULL;
> >
> > -       for (i =3D 0; i < SET_CONFIG_TRIES; ++i) {
> > +       for (i =3D 0; i < PORT_INIT_TRIES; ++i) {
> >
> >                 /* ep0 maxpacket size may change; let the HCD know abou=
t it.
> >                  * Other endpoints will be handled by re-enumeration. *=
/
> >
