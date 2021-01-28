Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD12307C23
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 18:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232982AbhA1RUy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 12:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232731AbhA1RSp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 12:18:45 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECE1C061756
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 09:18:04 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id l9so8946051ejx.3
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 09:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=plyFjtBhFXFrgELoxz/FHnkMaLH3qrT6mDYclcTh7k0=;
        b=k+kGgKrLyR04Frv44dbTUsM1YuqhHN9J9mDamP4AjxQa6kD1HY1zQImmECU0xO/xiv
         6Pm6fUhd9j3J+GUwjGXACpUN/AyMA3FhVAmrNmrhzSsA+BqpCWM+Uk+lS5X2afMuNPRw
         3LxZMSBIj180IXWhLJ3JKVIScU3GxgTAZZOcUHDT6QGhb6Tml2WHLkLapSIF3K1REa76
         oeA+o4hJlZ22yBegVbo2mEtkChLdKhwBmwHHxMJ77WDVu0KThHZSbd3SW/ns7I2HtYEU
         5vtJNlZtyWI+Nxb1AyJIy9KbM6x0UMSk4HRWJErtLAR1iT7uSVkf3R3j28bZPuxVhME9
         0bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=plyFjtBhFXFrgELoxz/FHnkMaLH3qrT6mDYclcTh7k0=;
        b=fRj7OjLY1lAUtouu/EKVR/rj4A8c1tn1GmQNnVoueddujT2OPNvSkth4DYN/j1jcc0
         fxjA+q1sFgcUGI8RUKjn96xgWO2wB4oDdni+rltu8H6HHlrES7tL0elDHRskpAUJGubS
         hasc8g1qtEgKBqx9ZpEu7tBfb6byW4qq2m+q/k/RqVAy+N3IpcUN3nifgEoFnZ5XuzZ8
         TFVF+zrdxP/2R+n16vFmunc2FvZBCSBdWuEuj3JKaglmkz93I3WD/+MJ8G9yaHtfgMEa
         5FGSzgJCdOmWpqU0sUwekKhdkiAAJWAZao5UWQHgbZeCB7StrSd52/Ldv6firpB8TDoW
         v/SQ==
X-Gm-Message-State: AOAM5327C0+hWzuRhy82O+9A/8bDdJcpySrmP0DdLr4E/bD7WWjHaqtT
        hyAejkuszsapYfjd1FCSthSjxCM7s4tbcSL9OoDXuGQMrH10tA==
X-Google-Smtp-Source: ABdhPJyKXvpzpdvfHv7mb6Qhz0AcCbG68n5n35NAeJEmziV+cC2i0V9kzmkx05oEUC63BvLBjjpqxKG+/M9iNea8sjo=
X-Received: by 2002:a17:906:f988:: with SMTP id li8mr443808ejb.84.1611854283487;
 Thu, 28 Jan 2021 09:18:03 -0800 (PST)
MIME-Version: 1.0
References: <20210128081259.20940-1-sylvain.pelissier@gmail.com> <YBJ0SQaTSM5PxZom@kroah.com>
In-Reply-To: <YBJ0SQaTSM5PxZom@kroah.com>
From:   Sylvain Pelissier <sylvain.pelissier@gmail.com>
Date:   Thu, 28 Jan 2021 18:17:52 +0100
Message-ID: <CAOkUe-CJNg2iCZu3528TvsQXTT5-STRauiiDciB_AnbwE8qrHQ@mail.gmail.com>
Subject: Re: [PATCH] usb: video: fix descriptor structures macros
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     laurent.pinchart@skynet.be, kopiga.rasiah@epfl.ch,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 28 Jan 2021 at 09:22, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jan 28, 2021 at 09:12:59AM +0100, Sylvain Pelissier wrote:
> > The macros defining structures for descriptors use token
> > pasting incorrectly. For example, the macro
> > UVC_EXTENSION_UNIT_DESCRIPTOR(1, 2) defines a structure named
> > uvc_extension_unit_descriptor_p_2 which should be
> > uvc_extension_unit_descriptor_1_2 instead.
> >
> > Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
> > ---
> >  include/uapi/linux/usb/video.h | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
> > index d854cb19c42c..1eb982df87a0 100644
> > --- a/include/uapi/linux/usb/video.h
> > +++ b/include/uapi/linux/usb/video.h
> > @@ -324,7 +324,7 @@ struct uvc_extension_unit_descriptor {
> >  #define UVC_DT_EXTENSION_UNIT_SIZE(p, n)             (24+(p)+(n))
> >
> >  #define UVC_EXTENSION_UNIT_DESCRIPTOR(p, n) \
> > -     uvc_extension_unit_descriptor_##p_##n
> > +     uvc_extension_unit_descriptor_##p##_##n
> >
> >  #define DECLARE_UVC_EXTENSION_UNIT_DESCRIPTOR(p, n)  \
> >  struct UVC_EXTENSION_UNIT_DESCRIPTOR(p, n) {         \
> > @@ -371,7 +371,7 @@ struct uvc_input_header_descriptor {
> >  #define UVC_DT_INPUT_HEADER_SIZE(n, p)                       (13+(n*p))
> >
> >  #define UVC_INPUT_HEADER_DESCRIPTOR(n, p) \
> > -     uvc_input_header_descriptor_##n_##p
> > +     uvc_input_header_descriptor_##n##_##p
> >
> >  #define DECLARE_UVC_INPUT_HEADER_DESCRIPTOR(n, p)    \
> >  struct UVC_INPUT_HEADER_DESCRIPTOR(n, p) {           \
> > @@ -406,7 +406,7 @@ struct uvc_output_header_descriptor {
> >  #define UVC_DT_OUTPUT_HEADER_SIZE(n, p)                      (9+(n*p))
> >
> >  #define UVC_OUTPUT_HEADER_DESCRIPTOR(n, p) \
> > -     uvc_output_header_descriptor_##n_##p
> > +     uvc_output_header_descriptor_##n##_##p
> >
> >  #define DECLARE_UVC_OUTPUT_HEADER_DESCRIPTOR(n, p)   \
> >  struct UVC_OUTPUT_HEADER_DESCRIPTOR(n, p) {          \
> > --
> > 2.25.1
> >
>
> And no one noticed this?  If not, then why do we have these defines at
> all, as obviously they are not used :)

The problem is not detected if you have descriptors with the second
argument different each time since the structure name will change. It
is maybe why it was not noticed. Nevertheless, the extension unit, the
input header and the output header descriptors are part of the USB
video class specification and are often used by devices. We have
detected the problem while implementing a usb gadget having such
descriptors.

>
> thanks,
>
> greg k-h
