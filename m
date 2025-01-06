Return-Path: <linux-usb+bounces-19021-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 760D3A02179
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2025 10:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 062C93A33EB
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2025 09:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467C21D7E4B;
	Mon,  6 Jan 2025 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMecGvn4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1954073451;
	Mon,  6 Jan 2025 09:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736154536; cv=none; b=Yv40Vt8klD0YWsuJvDWnZaxdFKG9fbkd7lb2gxFcH//rDcHKPNTwvvVihhW4IUrgSaZ5s2nO7ndMuy7IK1jX1wSjfx5oEopIEQQcVQ2tznoDGFemVMxMsLRRMpuP8RXSA3w64npoTiUcEGGrbqZ44TJAu8HFR/kqXmZ5uheZWQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736154536; c=relaxed/simple;
	bh=hvZNOwGZJ21qeNNKf6nQPOMf109+f5fh5i5hh9xciNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FssVrQ8GfG22WPHNurmFTOXr/jnuoaweCcMP8VbLID7Xb/PmLvbCb8d4WnTbhRJgRGwu9TshQ3Bf1KkfIv5rNsODtQs10Tq+nrDfrx8UHUeEeLB9PcB8m1iOzvijSqeSLvcpgj1RTp57OPjeU000tCNZRDbdNM4B1pTpVcA/8GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMecGvn4; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso15942693a91.3;
        Mon, 06 Jan 2025 01:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736154534; x=1736759334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pk+dVXtsYBDLpZ6jqdyBrS616aBZpJR9bND5hlYoJrs=;
        b=aMecGvn4uk2hfjdm84vpY6l9Kw6OJLq6rY1Ng7wocSCwkxneAKcObSTyEm3lTwaTsm
         o28js7Q3aKvrVVweqVSz137pqvVx8BRzl0AyHzHbwUfTP7a5/ch95i723VBfjwmgZO/l
         o9gw6BjtwgAG8WBGyxaHUSwoAtzy1OT3vA6bFETtpMSgzZkJ93DlzTtfqYAz0CQlCJsT
         DqiRF2ZTQIGEKiKRBP/wCI0pmpQAMsvIHJ2GGvsjvVQ1cV+V7kMPPyCQMvOsSm0VDyUL
         ehIo4mZzKwHdzIUbVKWiH00K23OrFhNQVUs71ZNPkkmz9F9K0Tql5+aNtIVkUE7WGNXP
         WHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736154534; x=1736759334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pk+dVXtsYBDLpZ6jqdyBrS616aBZpJR9bND5hlYoJrs=;
        b=KHezm8L+XnPatBBW7z5R0H++eARanQpvHRM4zHzawli2u6HZfP0P3w/GWHkqQbsy7R
         t0QI4raLSnztNh+IUQcwIWC3HKdurd4osvMRvV3vG319IIk58auIZL3FFK0X5G8zsxpr
         BxlhP2NWDp4ku+WuHCPrx9KxxuBNktSceIEk74f7Ymou2utgm1GJQFzWGJFfrP7c0Hp3
         wVOEn2edWzHdlCiRSV5CiOZoxDyws+aaS+Lewbz/hanCY3Dlqp4p4Qe5rySSBZ7yhgd9
         cazISJQC/QiHKw/+5aPJpGR/5TrwXXbHR/Gr+mAZ5mBS3pTG30PRkeDtAb4AvXH974qG
         Qr1w==
X-Forwarded-Encrypted: i=1; AJvYcCUIpVGLnWE9BvaxF1RSi6G2JC//NznyiY57BtL2mOtwpW602Cf5k+zhDucogYWuzXxUh43e3uRSBFmN@vger.kernel.org, AJvYcCUgGla3MkbpvPZZIFerbHKB2c5rdiwFcC68CBo/RApfQh+QOpTEW7tQzUuiNEla5/p+cn6TNxsPKj+hk5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcTjdL7tUUtIXbVEloCoDgsg4bWFGPqz9KrL6Yb365O4mbeHq8
	pA3GFb5R31UsRLObTK28zDVOTs0peg+mqC3ez4L6+YcneCfugKUZKbBoxb7F0/wccgRUKigkXX9
	qZd+tUaCPbX0rkr0BFb6Qao/cqcI=
X-Gm-Gg: ASbGncskcJp3+tPEiHHFk9RNaOasI1/wuCk+NXuBVhA6DmdXqVhrlsrJYS9gdTCnoAu
	MQdNV5UyPxLbOqPg/qbGaYmXXfXSfvuCFFTGrcw==
X-Google-Smtp-Source: AGHT+IEpWeRHM1RrAABrf7y6aPAowyVflDMSFn2Q83YhOQsxl2ApIVOXEx9ekNAPGNXD6yr1EWaIEB/EIFNLK1tEf1E=
X-Received: by 2002:a17:90b:1f92:b0:2f5:63a:449c with SMTP id
 98e67ed59e1d1-2f5063a45f6mr19054082a91.28.1736154534214; Mon, 06 Jan 2025
 01:08:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250104-usb-choose-config-full-uac3-v1-1-f8bf8760ae90@gmail.com> <2025010402-audacity-flounder-d8df@gregkh>
In-Reply-To: <2025010402-audacity-flounder-d8df@gregkh>
From: Will Mortensen <willmo@gmail.com>
Date: Mon, 6 Jan 2025 01:08:43 -0800
Message-ID: <CAFCitJ8cLi1Tqk47fhr-F2PBHxxtu_9kr4sSHwdN6XWYmC=2cg@mail.gmail.com>
Subject: Re: [PATCH] usb: core: prefer only full UAC3 config, not BADD
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nikolay Yakimov <root@livid.pp.ru>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, AT <kernel@twinhelix.com>, 
	Ruslan Bilovol <ruslan.bilovol@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
	Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, Saranya Gopal <saranya.gopal@intel.com>, 
	Felipe Balbi <felipe.balbi@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

(For new CCs, see [1] for full context)

Thanks for the feedback! Replies below:

On Sat, Jan 4, 2025 at 12:53=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sat, Jan 04, 2025 at 07:45:29AM +0000, Will Mortensen wrote:
> > Previously, usb_choose_configuration() chose the first config whose
> > first interface was UAC3 (if there was such a config), which could mean
> > choosing UAC3 BADD over full UAC3, potentially losing most of the
> > device's functionality. With this patch, we check the config's first IA=
D
> > and only prefer the config if it's full UAC3, not BADD.
> >
> > Note that if the device complies with the UAC3 spec, then the device's
> > first config is UAC1/2. With this patch, if the device also has a UAC3
> > BADD config but no full UAC3 config (which is allowed by the spec),
> > then we'll select the first, UAC1/2 config, *not* the BADD config.
> >
> > That might be undesirable (?), so we could instead try to implement a
> > priority scheme like: full UAC3 > UAC3 BADD > UAC1/2. But unless we als=
o
> > enhance this function to look at more than one IAD and interface per
> > config, we could incorrectly select the BADD config over more fully-
> > featured UAC1/2/3 configs if the full UAC3 IAD is not first in its
> > config(s). I don't know enough about UAC3 devices to know what's
> > preferable, and I'm not sure how simple vs. correct the heuristics in
> > this function should be. :-) This patch errs on the side of simple.
> >
> > For some history, the preference for the first UAC3 config (instead of
> > the first config, which should be UAC1/2) originated a bit before the
> > Fixes commit, in commit f13912d3f014 ("usbcore: Select UAC3
> > configuration for audio if present") and commit ff2a8c532c14 ("usbcore:
> > Select only first configuration for non-UAC3 compliant devices"). Also,
> > the Fixes commit's message is a bit wrong in one place since the UAC3
> > spec prohibits a device's first configuration from being UAC3.
> >
> > I tested only with an Apple USB-C headphone adapter (as in the linked
> > bug), which has three configs in the following order: UAC2, UAC3 BADD,
> > full UAC3. Previously the UAC3 BADD config was selected; with this patc=
h
> > the full UAC3 config is selected.
> >
> > Reported-by: AT <kernel@twinhelix.com>
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D217501
> > Fixes: 25b016145036 ("USB: Fix configuration selection issues introduce=
d in v4.20.0")
> > Cc: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> > Cc: Takashi Iwai <tiwai@suse.com>
> > Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
> > Cc: Saranya Gopal <saranya.gopal@intel.com>
> > Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
> > Cc: Nikolay Yakimov <root@livid.pp.ru>
> > Signed-off-by: Will Mortensen <willmo@gmail.com>
> > ---
> >  drivers/usb/core/generic.c | 25 +++++++++++++++++--------
> >  1 file changed, 17 insertions(+), 8 deletions(-)
> > @@ -48,9 +49,11 @@ static bool is_audio(struct usb_interface_descriptor=
 *desc)
> >       return desc->bInterfaceClass =3D=3D USB_CLASS_AUDIO;
> >  }
> >
> > -static bool is_uac3_config(struct usb_interface_descriptor *desc)
> > +static bool is_full_uac3(struct usb_interface_assoc_descriptor *assoc)
> >  {
> > -     return desc->bInterfaceProtocol =3D=3D UAC_VERSION_3;
> > +     return assoc->bFunctionClass =3D=3D USB_CLASS_AUDIO
> > +             && assoc->bFunctionSubClass =3D=3D UAC3_FUNCTION_SUBCLASS=
_FULL_ADC_3_0
> > +             && assoc->bFunctionProtocol =3D=3D UAC_VERSION_3;
>
> Nit, the "&&" should go on the previous lines, right?

Sorry, I copied that style from the functions a few lines above. It
seems this file isn't consistent. :-) I'm happy to change it.

Answering your other points in reverse order:

> In other words, I'm really worried about regressions here, what devices
> has this change been tested on and how can we be assured nothing that
> works today is suddenly going to break?

The only audio device I tested on was the Apple headphone adapter. :-)
I can try to test on a few more audio devices, and find some
descriptor dumps online.

I definitely take your point that we should avoid behavior changes
(presumably even at the cost of some code complexity) unless they're
strongly justified. This patch erred on the side of code simplicity at
the cost of unnecessary behavior changes. I'll strike a better balance
going forward.

> And what about your comment above which says it "should" be the first
> config, where is that required?  What about devices that didn't have
> that and now the functionality changes because that assumption isn't
> true, and they weren't a "full UAC3 compliant" device?

Hmm, do you mean this comment?

/*
 * [=E2=80=A6] (If the only UAC3
 * config is a BADD, we will instead select the first config,
 * which should be UAC1/2.)
 */

The UAC3 spec requires the first config to comply with UAC1/2. If the
device violates that then it's more complicated, but anyway, this
comment describes an unnecessary behavior change in the patch. I'll
avoid this going forward unless I can justify it better.

> I feel like this is making the kernel pick a specific policy, when
> userspace might have wanted a different one, right?  Is there anything
> in the USB spec that mandates that this is the correct config to always
> pick "first"?

Good question. I think the UAC3 spec implies that full UAC3 (if
present) is preferred over UAC3 BADD and UAC1/2. But perhaps more to
the point, it says in section 4.1 "Standard Descriptors":

    Because any Device compliant with this specification is required to
    contain multiple Configuration descriptors, it is also required that an=
y
    such device include a Configuration Summary Descriptor as part of
    the standard BOS descriptor.

And the USB 3.2 spec says in section 9.6.2.7 "Configuration Summary Descrip=
tor":

    Configuration Summary Descriptors should be included in the BOS
    descriptor in order of descending preference.

And my Apple headphone adapters do have those descriptors (in the
opposite order of the configuration descriptors: full UAC3, UAC3 BADD,
UAC2). So those descriptors might be the best signal, but AFAICT the
kernel doesn't parse them. It seems the kernel just has
usb_choose_configuration(), which just looks at the first interface of
each configuration, and usb_device_driver.choose_configuration(),
which only one driver implements (r8152, to choose a vendor-specific
configuration sometimes).

As for userspace, at least when it comes to USB audio devices, it
seems like users generally have to write their own scripts or udev
rules that call usb_modeswitch or equivalent. At a quick glance, I
don't see any audio devices in the usb_modeswitch DB, nor any
automatic USB configuration selection in PipeWire/PulseAudio/JACK or
the various ALSA utilities (although I may not have looked in the
right places).

Anyway, if we really just want to delegate this whole issue to
userspace, it's a little funny that the kernel does have a policy of
preferring UAC3, albeit without distinguishing between BADD and full
UAC3. Are we just stuck with that now? :-) Would it ever make sense
for the kernel to try to respect the preference expressed by the
Configuration Summary Descriptors when they exist?


[1] https://lore.kernel.org/linux-usb/20250104-usb-choose-config-full-uac3-=
v1-1-f8bf8760ae90@gmail.com/T/

