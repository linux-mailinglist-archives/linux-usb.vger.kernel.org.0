Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63F52CEF55
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 15:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbgLDOE0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 09:04:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgLDOEZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Dec 2020 09:04:25 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B4FC061A4F
        for <linux-usb@vger.kernel.org>; Fri,  4 Dec 2020 06:03:45 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id f12so5208433oto.10
        for <linux-usb@vger.kernel.org>; Fri, 04 Dec 2020 06:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kaE+jlZY8FQL+vbtYbB/kLFChObikmo26T0im4iCT9w=;
        b=NDbzCU7DZMjfRrsO0aCp43kDzlMc56qqE8SFsFNjYQpwbYAFpz+dGhEApVWTzJtRbm
         kNYlpNJ+96YJAJgkQGKpWfoYHvVWCzXb3ir0l7gszZd6EY8wW8Tuq6akTyEISSSx6bWf
         FUcmVuZ2jpjC+0qdAExErg640ifm6ZHGfxbtl7xraSiSAKDr4gOhVik50C/2q5NS07wy
         /hNWbedn8e+bR0y/OCxJeVDFwZRtoIAFQvVqLvAnv1oulWWUfrSXOXCtPWmVebDzU8y/
         0Q3AYlEOqWS2DThW4Dnls5s7lS5gOyVZc4EX7M941BCg0CeAf62ZaTWzx/WycYWh53Eh
         jHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kaE+jlZY8FQL+vbtYbB/kLFChObikmo26T0im4iCT9w=;
        b=O4Re4PTAp+i+xWMXSESEryuUNuhCz9cI4SMSSlKoYlojR2Q0MlPAyvKRt0o5QD8DRo
         kM/dGLST8+cY3lYl6ETqjEPkG1dMfVAcGJ26nLGmACk/r+QMarHYS2P/ZQ9OtgBuu3Cj
         W8qZgpX6rmA4oXWwGvfBCzNHLqcGciBZzN2afKHUrnTOuLDBKx9bNSSA8PouKZSHslPl
         3PoafsU6h0/fBL25hbrYz2sPly/JPAjcIHTgdBOFJmXhJpa4P7Tukk7gNT1wkumT7XHW
         HnUn+iYrWhPnhKGJjonOxFLv1WvIZUHHYXyhkoGBv4V6/kUhXBzgqdI9Z2vt8U2czY6/
         7G4A==
X-Gm-Message-State: AOAM531YBS9UJlCgrUA5ElUIn5plGgLFygGkKWBU5ycbX+RJdd378Q5m
        ML9QHxHbHPlf2kobOyYx7WJnW6KuqLeOLtFISuA=
X-Google-Smtp-Source: ABdhPJwZqVHhpyQufo5DXRb9NPJVPcKQSiox0WgQpT+QFcgQ7BfY/237+WPQDAq4+XpgnnzgTLJDFIuCLgyKiyY+5Og=
X-Received: by 2002:a05:6830:1d7b:: with SMTP id l27mr3803872oti.197.1607090623529;
 Fri, 04 Dec 2020 06:03:43 -0800 (PST)
MIME-Version: 1.0
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <1604794711-8661-3-git-send-email-ruslan.bilovol@gmail.com> <1jeekg8j76.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jeekg8j76.fsf@starbuckisacylon.baylibre.com>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Fri, 4 Dec 2020 16:03:31 +0200
Message-ID: <CAB=otbRrieg4kkpi=w8pqD-fs=1PxA17iQgJMm3Hf=QE_3bOng@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: gadget: f_uac2: add adaptive sync support for capture
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Linux USB <linux-usb@vger.kernel.org>,
        Glenn Schmottlach <gschmottlach@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 26, 2020 at 1:13 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Sun 08 Nov 2020 at 01:18, Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
>
> > Current f_uac2 USB OUT (aka 'capture') synchronization
> > implements 'ASYNC' scenario which means USB Gadget has
> > it's own freerunning clock and can update Host about
> > real clock frequency through feedback endpoint so Host
> > can align number of samples sent to the USB gadget to
> > prevent overruns/underruns
> >
> > In case if Gadget can has no it's internal clock and
> > can consume audio samples at any rate (for example,
> > on the Gadget side someone records audio directly to
> > a file, or audio samples are played through an
> > external DAC as soon as they arrive), UAC2 spec
> > suggests 'ADAPTIVE' synchronization type.
> >
> > Change UAC2 driver to make it configurable through
> > additional 'c_sync' configfs file.
> >
> > Default remains 'asynchronous' with possibility to
> > switch it to 'adaptive'
> >
> > Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> > ---
> >  Documentation/ABI/testing/configfs-usb-gadget-uac2 |  1 +
> >  Documentation/usb/gadget-testing.rst               |  1 +
> >  drivers/usb/gadget/function/f_uac2.c               | 96 ++++++++++++++++++++--
> >  drivers/usb/gadget/function/u_uac2.h               |  2 +
> >  4 files changed, 91 insertions(+), 9 deletions(-)
> >
> > diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
> > index 2bfdd4e..4fbff96 100644
> > --- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
> > +++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
> > @@ -7,6 +7,7 @@ Description:
> >               c_chmask - capture channel mask
> >               c_srate - capture sampling rate
> >               c_ssize - capture sample size (bytes)
> > +             c_sync - capture synchronization type (async/adaptive)
> >               p_chmask - playback channel mask
> >               p_srate - playback sampling rate
> >               p_ssize - playback sample size (bytes)
> > diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
> > index 2eeb3e9..360a7ca 100644
> > --- a/Documentation/usb/gadget-testing.rst
> > +++ b/Documentation/usb/gadget-testing.rst
> > @@ -728,6 +728,7 @@ The uac2 function provides these attributes in its function directory:
> >       c_chmask        capture channel mask
> >       c_srate         capture sampling rate
> >       c_ssize         capture sample size (bytes)
> > +     c_sync          capture synchronization type (async/adaptive)
> >       p_chmask        playback channel mask
> >       p_srate         playback sampling rate
> >       p_ssize         playback sample size (bytes)
> > diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
> > index a57bf77..3187ad3 100644
> > --- a/drivers/usb/gadget/function/f_uac2.c
> > +++ b/drivers/usb/gadget/function/f_uac2.c
> > @@ -41,6 +41,7 @@
> >
> >  #define EPIN_EN(_opts) ((_opts)->p_chmask != 0)
> >  #define EPOUT_EN(_opts) ((_opts)->c_chmask != 0)
> > +#define EPOUT_FBACK_IN_EN(_opts) ((_opts)->c_sync == USB_ENDPOINT_SYNC_ASYNC)
> >
> >  struct f_uac2 {
> >       struct g_audio g_audio;
> > @@ -237,7 +238,7 @@ enum {
> >       .bDescriptorType = USB_DT_INTERFACE,
> >
> >       .bAlternateSetting = 1,
> > -     .bNumEndpoints = 2,
> > +     .bNumEndpoints = 1,
> >       .bInterfaceClass = USB_CLASS_AUDIO,
> >       .bInterfaceSubClass = USB_SUBCLASS_AUDIOSTREAMING,
> >       .bInterfaceProtocol = UAC_VERSION_2,
> > @@ -270,7 +271,7 @@ enum {
> >       .bDescriptorType = USB_DT_ENDPOINT,
> >
> >       .bEndpointAddress = USB_DIR_OUT,
> > -     .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
> > +     .bmAttributes = USB_ENDPOINT_XFER_ISOC,
> >       .wMaxPacketSize = cpu_to_le16(1023),
> >       .bInterval = 1,
> >  };
> > @@ -279,7 +280,7 @@ enum {
> >       .bLength = USB_DT_ENDPOINT_SIZE,
> >       .bDescriptorType = USB_DT_ENDPOINT,
> >
> > -     .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
> > +     .bmAttributes = USB_ENDPOINT_XFER_ISOC,
> >       .wMaxPacketSize = cpu_to_le16(1024),
> >       .bInterval = 1,
> >  };
> > @@ -540,6 +541,19 @@ static void setup_descriptor(struct f_uac2_opts *opts)
> >               len += sizeof(io_out_ot_desc);
> >               ac_hdr_desc.wTotalLength = cpu_to_le16(len);
> >               iad_desc.bInterfaceCount++;
> > +
> > +             if (EPOUT_FBACK_IN_EN(opts)) {
> > +                     fs_epout_desc.bmAttributes |=
> > +                                             USB_ENDPOINT_SYNC_ASYNC;
> > +                     hs_epout_desc.bmAttributes |=
> > +                                             USB_ENDPOINT_SYNC_ASYNC;
> > +                     std_as_out_if1_desc.bNumEndpoints++;
> > +             } else {
> > +                     fs_epout_desc.bmAttributes |=
> > +                                             USB_ENDPOINT_SYNC_ADAPTIVE;
> > +                     hs_epout_desc.bmAttributes |=
> > +                                             USB_ENDPOINT_SYNC_ADAPTIVE;
> > +             }
>
> Hi Ruslan,
>
> First, thanks a lot for this series, it is very helpful
>
> Instead of amending the descriptors, could you consider using comments like
>
> /* .bNumEndpoints = DYNAMIC */
>
> or
>
> /* .bmAttributes = DYNAMIC */

Agree, I just forgot to do that

>
> It would help understand that the actual value of these parameters will be
> determine at runtime, making the code easier to follow and maintain.
>
> Also, I wonder if it would be difficult to add implicit feedback support
> while at it ?
>
> I'm asking this now because it could (possibly) change the driver params
> (implicit is async as well)

It seems it should be quite easy to add it, so at least worth a try.
Will experiment this in next patch set

Thanks,
Ruslan


>
> >       }
> >
> >       i = 0;
> > @@ -564,7 +578,8 @@ static void setup_descriptor(struct f_uac2_opts *opts)
> >               fs_audio_desc[i++] = USBDHDR(&as_out_fmt1_desc);
> >               fs_audio_desc[i++] = USBDHDR(&fs_epout_desc);
> >               fs_audio_desc[i++] = USBDHDR(&as_iso_out_desc);
> > -             fs_audio_desc[i++] = USBDHDR(&fs_epin_fback_desc);
> > +             if (EPOUT_FBACK_IN_EN(opts))
> > +                     fs_audio_desc[i++] = USBDHDR(&fs_epin_fback_desc);
> >       }
> >       if (EPIN_EN(opts)) {
> >               fs_audio_desc[i++] = USBDHDR(&std_as_in_if0_desc);
> > @@ -598,7 +613,8 @@ static void setup_descriptor(struct f_uac2_opts *opts)
> >               hs_audio_desc[i++] = USBDHDR(&as_out_fmt1_desc);
> >               hs_audio_desc[i++] = USBDHDR(&hs_epout_desc);
> >               hs_audio_desc[i++] = USBDHDR(&as_iso_out_desc);
> > -             hs_audio_desc[i++] = USBDHDR(&hs_epin_fback_desc);
> > +             if (EPOUT_FBACK_IN_EN(opts))
> > +                     hs_audio_desc[i++] = USBDHDR(&hs_epin_fback_desc);
> >       }
> >       if (EPIN_EN(opts)) {
> >               hs_audio_desc[i++] = USBDHDR(&std_as_in_if0_desc);
> > @@ -706,11 +722,14 @@ static void setup_descriptor(struct f_uac2_opts *opts)
> >                       dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
> >                       return -ENODEV;
> >               }
> > -             agdev->in_ep_fback = usb_ep_autoconfig(gadget,
> > +             if (EPOUT_FBACK_IN_EN(uac2_opts)) {
> > +                     agdev->in_ep_fback = usb_ep_autoconfig(gadget,
> >                                                      &fs_epin_fback_desc);
> > -             if (!agdev->in_ep_fback) {
> > -                     dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
> > -                     return -ENODEV;
> > +                     if (!agdev->in_ep_fback) {
> > +                             dev_err(dev, "%s:%d Error!\n",
> > +                                     __func__, __LINE__);
> > +                             return -ENODEV;
> > +                     }
> >               }
> >       }
> >
> > @@ -1057,11 +1076,68 @@ static void f_uac2_attr_release(struct config_item *item)
> >                                                                       \
> >  CONFIGFS_ATTR(f_uac2_opts_, name)
> >
> > +#define UAC2_ATTRIBUTE_SYNC(name)                                    \
> > +static ssize_t f_uac2_opts_##name##_show(struct config_item *item,   \
> > +                                      char *page)                    \
> > +{                                                                    \
> > +     struct f_uac2_opts *opts = to_f_uac2_opts(item);                \
> > +     int result;                                                     \
> > +     char *str;                                                      \
> > +                                                                     \
> > +     mutex_lock(&opts->lock);                                        \
> > +     switch (opts->name) {                                           \
> > +     case USB_ENDPOINT_SYNC_ASYNC:                                   \
> > +             str = "async";                                          \
> > +             break;                                                  \
> > +     case USB_ENDPOINT_SYNC_ADAPTIVE:                                \
> > +             str = "adaptive";                                       \
> > +             break;                                                  \
> > +     default:                                                        \
> > +             str = "unknown";                                        \
> > +             break;                                                  \
> > +     }                                                               \
> > +     result = sprintf(page, "%s\n", str);                            \
> > +     mutex_unlock(&opts->lock);                                      \
> > +                                                                     \
> > +     return result;                                                  \
> > +}                                                                    \
> > +                                                                     \
> > +static ssize_t f_uac2_opts_##name##_store(struct config_item *item,  \
> > +                                       const char *page, size_t len) \
> > +{                                                                    \
> > +     struct f_uac2_opts *opts = to_f_uac2_opts(item);                \
> > +     int ret = 0;                                                    \
> > +                                                                     \
> > +     mutex_lock(&opts->lock);                                        \
> > +     if (opts->refcnt) {                                             \
> > +             ret = -EBUSY;                                           \
> > +             goto end;                                               \
> > +     }                                                               \
> > +                                                                     \
> > +     if (!strncmp(page, "async", 5))                                 \
> > +             opts->name = USB_ENDPOINT_SYNC_ASYNC;                   \
> > +     else if (!strncmp(page, "adaptive", 8))                         \
> > +             opts->name = USB_ENDPOINT_SYNC_ADAPTIVE;                \
> > +     else {                                                          \
> > +             ret = -EINVAL;                                          \
> > +             goto end;                                               \
> > +     }                                                               \
> > +                                                                     \
> > +     ret = len;                                                      \
> > +                                                                     \
> > +end:                                                                 \
> > +     mutex_unlock(&opts->lock);                                      \
> > +     return ret;                                                     \
> > +}                                                                    \
> > +                                                                     \
> > +CONFIGFS_ATTR(f_uac2_opts_, name)
> > +
> >  UAC2_ATTRIBUTE(p_chmask);
> >  UAC2_ATTRIBUTE(p_srate);
> >  UAC2_ATTRIBUTE(p_ssize);
> >  UAC2_ATTRIBUTE(c_chmask);
> >  UAC2_ATTRIBUTE(c_srate);
> > +UAC2_ATTRIBUTE_SYNC(c_sync);
> >  UAC2_ATTRIBUTE(c_ssize);
> >  UAC2_ATTRIBUTE(req_number);
> >
> > @@ -1072,6 +1148,7 @@ static void f_uac2_attr_release(struct config_item *item)
> >       &f_uac2_opts_attr_c_chmask,
> >       &f_uac2_opts_attr_c_srate,
> >       &f_uac2_opts_attr_c_ssize,
> > +     &f_uac2_opts_attr_c_sync,
> >       &f_uac2_opts_attr_req_number,
> >       NULL,
> >  };
> > @@ -1110,6 +1187,7 @@ static struct usb_function_instance *afunc_alloc_inst(void)
> >       opts->c_chmask = UAC2_DEF_CCHMASK;
> >       opts->c_srate = UAC2_DEF_CSRATE;
> >       opts->c_ssize = UAC2_DEF_CSSIZE;
> > +     opts->c_sync = UAC2_DEF_CSYNC;
> >       opts->req_number = UAC2_DEF_REQ_NUM;
> >       return &opts->func_inst;
> >  }
> > diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
> > index b503571..13589c3 100644
> > --- a/drivers/usb/gadget/function/u_uac2.h
> > +++ b/drivers/usb/gadget/function/u_uac2.h
> > @@ -21,6 +21,7 @@
> >  #define UAC2_DEF_CCHMASK 0x3
> >  #define UAC2_DEF_CSRATE 64000
> >  #define UAC2_DEF_CSSIZE 2
> > +#define UAC2_DEF_CSYNC               USB_ENDPOINT_SYNC_ASYNC
> >  #define UAC2_DEF_REQ_NUM 2
> >
> >  struct f_uac2_opts {
> > @@ -31,6 +32,7 @@ struct f_uac2_opts {
> >       int                             c_chmask;
> >       int                             c_srate;
> >       int                             c_ssize;
> > +     int                             c_sync;
> >       int                             req_number;
> >       bool                            bound;
>
