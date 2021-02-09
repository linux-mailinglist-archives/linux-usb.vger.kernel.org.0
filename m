Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495903153A4
	for <lists+linux-usb@lfdr.de>; Tue,  9 Feb 2021 17:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbhBIQRq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Feb 2021 11:17:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232631AbhBIQRm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Feb 2021 11:17:42 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32DBBC06174A
        for <linux-usb@vger.kernel.org>; Tue,  9 Feb 2021 08:16:59 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id z22so24442194edb.9
        for <linux-usb@vger.kernel.org>; Tue, 09 Feb 2021 08:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=swNALngYdwOuNx4vZ9eAzHp+fh8bc5uzWMdX//wsBkM=;
        b=n2lm8mrHjD3xo1ZMQOHe3dDQjfmH0Yew0IRVq6Nj5+4DkHXe8TzVy7SKvNmUaIwdfU
         02mgYNgaHlp3cDjCJ4UsobA5Jpd6bEBgcgLiK+BxsOtfvyNCGWjAScQzHrQzUFdwEGXm
         kJ42iNMBAJZKGwpFvRND0udaxCM6kKCPxZ+NfkmdWj4+MdQ3I1GKooD54htGAg/U7Svl
         Wg1iEEa5uXUk6pDuftDNlI74owWhALkUjcIyku1fQ1Xb/U68tu5TYL6poOCjkcUGy344
         Cvn0s9sUgbLh/h2bm6TRPgHlWa3gjls558iLLo2aZ/KaEpOOotZUSZWgFXfX4jQwC8BH
         fKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=swNALngYdwOuNx4vZ9eAzHp+fh8bc5uzWMdX//wsBkM=;
        b=YwPOT4sCBWkDCE3QCtbi74FXybQ+Dp4prucKfJTKPpq/LcOZd0OJm1qLuG4kqgLij0
         PA0jukfaBBNwAXb057+0lcjJ6p6q8j/HE9vzuRcGqJbU2s6MkcEF5LLF5PPv8xryNR8j
         bmJxr0NKR4BZB5VqtyHPLGmvSoUPwPBPTk2N+0eqf3DPWMCf8IE+ytkJ0A1eslMdwre4
         ggOAZ97Iarzn1gIVeSsJvNq6UH675gsI+H8Tfg5KLUcKBvZ25yTWP7EUwJlX8dFaIS3G
         PBKwx9DueyGj2SPwUzTjA/Pf6bFtGdOmA1G6ryDo4CHNQ3oJmd5Kf4GUv36pqDLCSiq+
         ZZvg==
X-Gm-Message-State: AOAM533tQY7G+RipkI7KIDUrExce8JhGSpr/xKRTSG/3SFgUL0NEogjf
        0yWzQsymVEdWDG8SGPLTcjCtI73RefuIAU/5URo=
X-Google-Smtp-Source: ABdhPJzCWohcGV92aSDfyvSkAyZi+VoXBGhiuAwTHJT+pnwhwn8w87h9hzivduI0brM80ze8zsQLxsVSfABWdiwvVL8=
X-Received: by 2002:a05:6402:17a6:: with SMTP id j6mr24335733edy.305.1612887417902;
 Tue, 09 Feb 2021 08:16:57 -0800 (PST)
MIME-Version: 1.0
References: <20210128081259.20940-1-sylvain.pelissier@gmail.com>
 <YBJ0SQaTSM5PxZom@kroah.com> <CAOkUe-CJNg2iCZu3528TvsQXTT5-STRauiiDciB_AnbwE8qrHQ@mail.gmail.com>
In-Reply-To: <CAOkUe-CJNg2iCZu3528TvsQXTT5-STRauiiDciB_AnbwE8qrHQ@mail.gmail.com>
From:   Sylvain Pelissier <sylvain.pelissier@gmail.com>
Date:   Tue, 9 Feb 2021 17:16:45 +0100
Message-ID: <CAOkUe-AV22j07eAY6N0_2x3_9Ogo3GSX=UW0p1qbXTsyf=oV9w@mail.gmail.com>
Subject: Re: [PATCH] usb: video: fix descriptor structures macros
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     kopiga.rasiah@epfl.ch, linux-usb@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 28 Jan 2021 at 18:17, Sylvain Pelissier
<sylvain.pelissier@gmail.com> wrote:
>
> On Thu, 28 Jan 2021 at 09:22, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Jan 28, 2021 at 09:12:59AM +0100, Sylvain Pelissier wrote:
> > > The macros defining structures for descriptors use token
> > > pasting incorrectly. For example, the macro
> > > UVC_EXTENSION_UNIT_DESCRIPTOR(1, 2) defines a structure named
> > > uvc_extension_unit_descriptor_p_2 which should be
> > > uvc_extension_unit_descriptor_1_2 instead.
> > >
> > > Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
> > > ---
> > >  include/uapi/linux/usb/video.h | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
> > > index d854cb19c42c..1eb982df87a0 100644
> > > --- a/include/uapi/linux/usb/video.h
> > > +++ b/include/uapi/linux/usb/video.h
> > > @@ -324,7 +324,7 @@ struct uvc_extension_unit_descriptor {
> > >  #define UVC_DT_EXTENSION_UNIT_SIZE(p, n)             (24+(p)+(n))
> > >
> > >  #define UVC_EXTENSION_UNIT_DESCRIPTOR(p, n) \
> > > -     uvc_extension_unit_descriptor_##p_##n
> > > +     uvc_extension_unit_descriptor_##p##_##n
> > >
> > >  #define DECLARE_UVC_EXTENSION_UNIT_DESCRIPTOR(p, n)  \
> > >  struct UVC_EXTENSION_UNIT_DESCRIPTOR(p, n) {         \
> > > @@ -371,7 +371,7 @@ struct uvc_input_header_descriptor {
> > >  #define UVC_DT_INPUT_HEADER_SIZE(n, p)                       (13+(n*p))
> > >
> > >  #define UVC_INPUT_HEADER_DESCRIPTOR(n, p) \
> > > -     uvc_input_header_descriptor_##n_##p
> > > +     uvc_input_header_descriptor_##n##_##p
> > >
> > >  #define DECLARE_UVC_INPUT_HEADER_DESCRIPTOR(n, p)    \
> > >  struct UVC_INPUT_HEADER_DESCRIPTOR(n, p) {           \
> > > @@ -406,7 +406,7 @@ struct uvc_output_header_descriptor {
> > >  #define UVC_DT_OUTPUT_HEADER_SIZE(n, p)                      (9+(n*p))
> > >
> > >  #define UVC_OUTPUT_HEADER_DESCRIPTOR(n, p) \
> > > -     uvc_output_header_descriptor_##n_##p
> > > +     uvc_output_header_descriptor_##n##_##p
> > >
> > >  #define DECLARE_UVC_OUTPUT_HEADER_DESCRIPTOR(n, p)   \
> > >  struct UVC_OUTPUT_HEADER_DESCRIPTOR(n, p) {          \
> > > --
> > > 2.25.1
> > >
> >
> > And no one noticed this?  If not, then why do we have these defines at
> > all, as obviously they are not used :)
>
> The problem is not detected if you have descriptors with the second
> argument different each time since the structure name will change. It
> is maybe why it was not noticed. Nevertheless, the extension unit, the
> input header and the output header descriptors are part of the USB
> video class specification and are often used by devices. We have
> detected the problem while implementing a usb gadget having such
> descriptors.
>
Hi,
Do I need to change something for this patch ?
Thanks,

Sylvain
> >
> > thanks,
> >
> > greg k-h
