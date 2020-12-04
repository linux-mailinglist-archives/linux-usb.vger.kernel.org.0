Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7AE2CF482
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 20:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgLDTHA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 14:07:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgLDTHA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Dec 2020 14:07:00 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F5BC0613D1
        for <linux-usb@vger.kernel.org>; Fri,  4 Dec 2020 11:06:14 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id y74so7275002oia.11
        for <linux-usb@vger.kernel.org>; Fri, 04 Dec 2020 11:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9SSxKWxjnwfp6dFu5W8jyF2oszJ3ecRrLvGt3qF45uk=;
        b=AAj6uX7dLhJArLrZqzoIS4gSWJ0zqnhnymIIpGVGEx+Z8LeBqZWVI4vZ/D6xtf/1Z6
         qf0p9/nnHVMwvNOr+nK9ER1/POhdL5jX9YVTfaYUr8U8StgTh4AIVXQ0zvPpQRrrrAhV
         LIkrlay2JVaxCfIjnaAgfM0qbWO7P1mwwLUmWfD4d6FGsAv6ByNPHvHApm3kTg2AmJXc
         FWaHmxLt7+cRkZdEQQayFYQ9QN4nrR95RnAEt+XmXbScH+61VlzdYU1ilx58J0RGl2ON
         MMas+2g9/kNVLq391dC/pKfhB1VrOaoiKQOyiEBmxx+17LTCBSNt0X/ITTdCqQ9xp1Q4
         eOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9SSxKWxjnwfp6dFu5W8jyF2oszJ3ecRrLvGt3qF45uk=;
        b=Cmey0KrBQNp6dUiL01aKOdMUbA8xQm9w5FcKT0GTIWVMjB6pryj/4VOEzjsGdhh9z1
         1ACYi8n6Nob15OEKf8tyyOP8FT4MZ665dBDUMv+xfJFhlsz3PPnWwP2ibG0k+Wp5UBMx
         eGBq/RWuwh1QS+9MJLbzh1Vt0b6mtZbm7odZrYntxRb0uTQAhS04nrKG5Tj+B+TB+Aig
         1aY2s62XKQLNtpyUBqNs12FeUs1AvvVMCM+ze/uacrrsZ/XInIuUSrde7I19u2xspx78
         aiL8WbvRkfFi9BkRFH74MjcYtf1WuuL4e1kEj1Qa5c15EmITgux0MXsxjm36TcTBxVfX
         s3Dw==
X-Gm-Message-State: AOAM530RMY4V8FLF+M3aFDQjAPS9+If+6m0h7hnzECPeb0hvOOm1S04q
        g7utZehSDN98MkOOoZZKWw34n7wce164LOUIXw0=
X-Google-Smtp-Source: ABdhPJx8OCr1XmyQ/MaPO23/w2Ar8mjkrNhVQS1ZEr24uEJD4tHHRjEOQDVQF6QAAIwcbCP5iwBy60LlRfw5VacLg1I=
X-Received: by 2002:aca:3305:: with SMTP id z5mr4174797oiz.34.1607108773383;
 Fri, 04 Dec 2020 11:06:13 -0800 (PST)
MIME-Version: 1.0
References: <1605220482-28487-1-git-send-email-ruslan.bilovol@gmail.com> <1j360vyx9h.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j360vyx9h.fsf@starbuckisacylon.baylibre.com>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Fri, 4 Dec 2020 21:06:00 +0200
Message-ID: <CAB=otbRXPa7572jacacsWpTsiemBUc1BgDUT3Qx751Uwg4qUOA@mail.gmail.com>
Subject: Re: [PATCH] [RFC] alsaloop: add feedback frequency control support
 for UAC2 gadgets
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        Linux USB <linux-usb@vger.kernel.org>,
        Glenn Schmottlach <gschmottlach@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 27, 2020 at 11:17 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Thu 12 Nov 2020 at 23:34, Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
>
> > Add support of special "PCM Feedback Frequency Hz"
> > UAC2 Gadget mixer control that is designed to notify
> > host about real sampling frequency of the gadget so
> > it can adjust number of samples that hosts sends to
> > the gadget.
> >
> > This is useful if both host and gadget has its own
> > internal freerunning clock, so host can adjust
> > number of samples sent, preventing overrun/underrun
> > conditions.
> >
> > This patch reuses logic of the "PCM Rate Shift 100000"
> > control used in case of in-kernel ALSA loopback
> > driver. The only difference is alsaloop reports not
> > rate shift but frequency in Hz
> >
> > Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> > ---
> >  alsaloop/alsaloop.h |  1 +
> >  alsaloop/pcmjob.c   | 35 +++++++++++++++++++++++++----------
> >  2 files changed, 26 insertions(+), 10 deletions(-)
> >
> > diff --git a/alsaloop/alsaloop.h b/alsaloop/alsaloop.h
> > index c4aa618..9a50a42 100644
> > --- a/alsaloop/alsaloop.h
> > +++ b/alsaloop/alsaloop.h
> > @@ -122,6 +122,7 @@ struct loopback_handle {
> >       unsigned int ctl_pollfd_count;
> >       snd_ctl_elem_value_t *ctl_notify;
> >       snd_ctl_elem_value_t *ctl_rate_shift;
> > +     snd_ctl_elem_value_t *ctl_fback_freq;
> >       snd_ctl_elem_value_t *ctl_active;
> >       snd_ctl_elem_value_t *ctl_format;
> >       snd_ctl_elem_value_t *ctl_rate;
> > diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
> > index 6a9aff4..b3802a8 100644
> > --- a/alsaloop/pcmjob.c
> > +++ b/alsaloop/pcmjob.c
> > @@ -1058,15 +1058,22 @@ static int set_notify(struct loopback_handle *lhandle, int enable)
> >
> >  static int set_rate_shift(struct loopback_handle *lhandle, double pitch)
> >  {
> > -     int err;
> > +     int err = 0;
> >
> > -     if (lhandle->ctl_rate_shift == NULL)
> > -             return 0;
> > -     snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift, 0, pitch * 100000);
> > -     err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_rate_shift);
> > -     if (err < 0) {
> > -             logit(LOG_CRIT, "Cannot set PCM Rate Shift element for %s: %s\n", lhandle->id, snd_strerror(err));
> > -             return err;
> > +     if (lhandle->ctl_rate_shift) {
> > +             snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift, 0, pitch * 100000);
> > +             err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_rate_shift);
> > +             if (err < 0) {
> > +                     logit(LOG_CRIT, "Cannot set PCM Rate Shift element for %s: %s\n", lhandle->id, snd_strerror(err));
> > +                     return err;
> > +             }
> > +     } else if (lhandle->ctl_fback_freq) {
> > +             snd_ctl_elem_value_set_integer(lhandle->ctl_fback_freq, 0, lhandle->rate * (2.0 - pitch));
> > +             err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_fback_freq);
> > +             if (err < 0) {
> > +                     logit(LOG_CRIT, "Cannot set PCM Feedback Frequency element for %s: %s\n", lhandle->id, snd_strerror(err));
> > +                     return err;
> > +             }
>
> Hi Ruslan,
>
> I wonder why bother adding a control of another type for the audio
> gadget ? Why not give the gadget a "Rate Shift" control, instead "Feedback
> Frequency" and let the driver deal with shift as necessary ?
>
> It would be easier for the applications to re-use the same logic.

I actually initially implemented "Rate Shift" control which simplified
brignup of UAC2 feedback support.

However, there is an issue with it.
The way how it's supposed to work is next - userspace calculates
real sampling frequency at which it consumes samples (usually it's
some internal clock frequency) then tells the real sampling frequency
to UAC2 gadget drivers which notifies the host which can adjust the
number of samples it sends to the gadget.

With "Rate Shift" control userspace has to convert measured absolute clock
frequency to relative 100000 format, then write this to UAC2 gadget which has
to convert it back from relative 100000 format to absolute frequency in Hz,
so it does a lot of unneeded conversions here.
Another issue with this approach is userspace can't know at which resolution
works feedback endpoint, so it continuously updates UAC's feedback frequency
"Rate Shift" control without any effect (because current feedback implementation
works with 1Hz resolution)

So what was designed to work with in-kernel alsaloop 'aloop' loopback, doesn't
fit well in the UAC2 case.

However, I want to improve resolution of feedback frequency, it can be better as
per USB spec, so this interface may be changed in next versions of
this patch set

Thanks,
Ruslan

>
> >       }
> >       return 0;
> >  }
> > @@ -1195,6 +1202,7 @@ static int openctl(struct loopback_handle *lhandle, int device, int subdevice)
> >       int err;
> >
> >       lhandle->ctl_rate_shift = NULL;
> > +     lhandle->ctl_fback_freq = NULL;
> >       if (lhandle->loopback->play == lhandle) {
> >               if (lhandle->loopback->controls)
> >                       goto __events;
> > @@ -1204,6 +1212,8 @@ static int openctl(struct loopback_handle *lhandle, int device, int subdevice)
> >                       &lhandle->ctl_notify);
> >       openctl_elem(lhandle, device, subdevice, "PCM Rate Shift 100000",
> >                       &lhandle->ctl_rate_shift);
> > +     openctl_elem(lhandle, device, subdevice, "PCM Feedback Frequency Hz",
> > +                     &lhandle->ctl_fback_freq);
> >       set_rate_shift(lhandle, 1);
> >       openctl_elem(lhandle, device, subdevice, "PCM Slave Active",
> >                       &lhandle->ctl_active);
> > @@ -1289,6 +1299,9 @@ static int closeit(struct loopback_handle *lhandle)
> >       if (lhandle->ctl_rate_shift)
> >               snd_ctl_elem_value_free(lhandle->ctl_rate_shift);
> >       lhandle->ctl_rate_shift = NULL;
> > +     if (lhandle->ctl_fback_freq)
> > +             snd_ctl_elem_value_free(lhandle->ctl_fback_freq);
> > +     lhandle->ctl_fback_freq = NULL;
> >       if (lhandle->ctl)
> >               err = snd_ctl_close(lhandle->ctl);
> >       lhandle->ctl = NULL;
> > @@ -1334,9 +1347,11 @@ int pcmjob_init(struct loopback *loop)
> >       snprintf(id, sizeof(id), "%s/%s", loop->play->id, loop->capt->id);
> >       id[sizeof(id)-1] = '\0';
> >       loop->id = strdup(id);
> > -     if (loop->sync == SYNC_TYPE_AUTO && loop->capt->ctl_rate_shift)
> > +     if (loop->sync == SYNC_TYPE_AUTO && (loop->capt->ctl_rate_shift ||
> > +                     loop->capt->ctl_fback_freq))
> >               loop->sync = SYNC_TYPE_CAPTRATESHIFT;
> > -     if (loop->sync == SYNC_TYPE_AUTO && loop->play->ctl_rate_shift)
> > +     if (loop->sync == SYNC_TYPE_AUTO && (loop->play->ctl_rate_shift ||
> > +                     loop->play->ctl_fback_freq))
> >               loop->sync = SYNC_TYPE_PLAYRATESHIFT;
> >  #ifdef USE_SAMPLERATE
> >       if (loop->sync == SYNC_TYPE_AUTO && loop->src_enable)
>
