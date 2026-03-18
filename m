Return-Path: <linux-usb+bounces-35062-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJ1sBF7DumkGbgIAu9opvQ
	(envelope-from <linux-usb+bounces-35062-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 16:23:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DED1C2BE1CF
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 16:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A7BF3079927
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 14:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA713DB64F;
	Wed, 18 Mar 2026 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JHinPUxO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445D83DB62B
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773845839; cv=none; b=JyUTCwEOGhwm6GWGq3v0BJPz24a0NnJf9rG7MrlvHLTlg7wJT3+azLKsod4ic09S2BAbz19A7OdIF/w2mcDrFIZjzoW11ffMjZqi0f//78OxEgkTpTa5t9EnPooZCLcgjHvIOX/e0GSKyQ64r/d0TE3YJpbzjbVBYNdaLMp2nWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773845839; c=relaxed/simple;
	bh=FcjBU8GVSxFCjPQMaDcgyNV5vpEZggBw7xuLnKblMyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KNM3IHMi1zehh5I6aiSgI+gKoOf0p93NHRyx5yINhZuR/ly5qHLx5wLgyk+naJ43WIvjGdWX00goG4oIo3tKHlgUkFDgAsPCsPYh82Q4EeS+cpMYMWdzsxLMnsPuErar+knKJ8U9BkirmqKln3g8Tys7PZrhOCmW1nLSEeg9yhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JHinPUxO; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a27a90a7b6so882015e87.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 07:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773845836; x=1774450636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdcMTRS1SNtqx4ecaOtDgv0cjA07u+A8EvWQZc3FLag=;
        b=JHinPUxOu85YS6bMJ0uxCVDSbVG5FGR+cJhd/K+ps2pupaupCk8jGfOu5lY5ird77z
         1y01dSgDZZNPsLrnhtnJgr5AsBhfHhbMlUFP8VgVdFEDM0UiVAHnKav23aprfZ97bf6w
         7qnbAHa+D4fXvUUHF1EG86KsEI4nR4uhf19Gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773845836; x=1774450636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MdcMTRS1SNtqx4ecaOtDgv0cjA07u+A8EvWQZc3FLag=;
        b=jH59LXsat/W1mawXECGNFPA/Q7toA/3sHIh/doUGCdx9xg1lL7j57LWOMd9JUqioiE
         e7vPFsy+suZ7NpEaKs9Qmqw7rtXuK7H1UewqAA8r9smLTfBIexGZj9v5IWQvxgGGoL9U
         Ob66QBjGc7wYPLKu4gN/Stc6rEwVoOlapIMdFwOInqUZhJPI1v7wPN6H9VpiTdnKepek
         HQ+JArQm5XZyueFQtLKhrnpQNRfW0ydK+wdDHfXLqf9t5r7T1i7xX0LI243cdaZiaeAr
         +dGVW9SnExN+0X5S7WQ+M3MMel0i8+hAs16mlKqxSVcwcCM+4yo1R8F/Qkn4TQtRbk9X
         PvuA==
X-Forwarded-Encrypted: i=1; AJvYcCW7RFQBgAagHG2xVzN6V7oIxRxyzS4HZ0cZXphpQXE9pxYtkxVcFv/2Ka3RWhH7qPXiYur3RqzTPpI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5A0SFSiWR53/MGi2qC4OcmZb7buQog57j8rZqsbdu00WBqxEx
	P9L6/fY4Y6KbktnpBeAF0LK+VIeMN439LiykHkryYQPjHe4i9wwj+DfNMcL8m+xeMzn/yi/XbTh
	88Yg0FbWA
X-Gm-Gg: ATEYQzwhIFlqBM+EcPjinLePoRsNUBbhW3Pj+W/Dwtf3SGjpxBEx0CHmcorF9WDu9Iv
	xLVtyF4u7pH33QxUWdFMWdSFKFafJHQw3U12bWu20Jn8SU7OXPvQLf2GOWFAZvoYvdtSC+RWz4q
	KeF5j2nbXyeYNel2oewChkm7FEdk31DtsoDje9QwTgqqey3lImKpdZPL+hpEw3ZogA3AbNtWiaF
	nwZKmnuY46mXQexiKH1oOGaOyc/HHkQxc0Fh4Zzfbh9MkRseCpj5gEZBbe40dBJTJ4uokEe2KW/
	vIARADJv75YPDwRqqusDfVjVMo9ULTbqUiwk/hk+7ruBlVKdmM2t9ZqZa8bUrADYPSaYQueEpMJ
	Iy7jPT3QkKr40GykRQ+ZXodFGxqDQmP/7+AFKbficlLZitR+Ws++GmgsuEmHR69S2ec70cbO3/n
	wPkT2GY5ZqcTE7s74HeRIIZmK5d0O+RB+OAgDTo4cbi5T6SsQtnKhVBqqqAadBspZLQtFl5tw=
X-Received: by 2002:a05:6512:1193:b0:5a2:7c1c:74c with SMTP id 2adb3069b0e04-5a27c1c08a5mr893846e87.21.1773845836015;
        Wed, 18 Mar 2026 07:57:16 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c2737bsm603950e87.4.2026.03.18.07.57.14
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:57:15 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so9822565a12.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 07:57:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNop9+ErTjtiQEhzvYf0t1eLk1j2ok5+cZp2FytM/5lW/nbKDTm7kdeE9lb/OE/3KAP7xszjvcDmA=@vger.kernel.org
X-Received: by 2002:a17:906:2295:b0:b97:85b1:d96d with SMTP id
 a640c23a62f3a-b97f4979cbdmr170423066b.28.1773845833640; Wed, 18 Mar 2026
 07:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
 <20260316-uvcdynctrl-v3-4-19cd4657e1f3@chromium.org> <2026031852-unplowed-ocelot-142a@gregkh>
In-Reply-To: <2026031852-unplowed-ocelot-142a@gregkh>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Mar 2026 15:57:00 +0100
X-Gmail-Original-Message-ID: <CANiDSCvJnwGix2fZU7KygM8zC1sizkgrW-BVyESnMcmXhGE+zw@mail.gmail.com>
X-Gm-Features: AaiRm51hrhY4O3Nox32PNSRdYJEegEO1R7XoT6QCYK7UNC9YdU9PbmB0EZ4tmSo
Message-ID: <CANiDSCvJnwGix2fZU7KygM8zC1sizkgrW-BVyESnMcmXhGE+zw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] media: uvcvideo: RFC: Convert allow_privacy_override
 into Kconfig
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35062-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,linuxfoundation.org:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DED1C2BE1CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Greg

On Wed, 18 Mar 2026 at 15:17, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Mar 16, 2026 at 01:34:47PM +0000, Ricardo Ribalda wrote:
> > This patch is just shared for discussion purposes! Do not land.
> >
> > In a perfect world, after a deprecation process, we will be able to
> > remove allow_privacy_override and block all privacy related controls.
>
> Why add something you are only going to remove in the future?  What has
> changed to require this now, and will change in the future to make it
> not needed?

Currently, any application with camera access can manipulate the
privacy LED. I believe this is a security flaw; ideally, the kernel
should block all such controls by default.

However, blocking these controls immediately might be seen as a
regression for certain users. I added allow_privacy_override to:
- Prevent breaking existing workflows immediately upon a kernel update.
- Give users time to report why they still need manual LED control.

The goal is to gather these use cases over the next 1=E2=80=932 years. Once=
 we
understand the legitimate needs, we can either implement a proper
specialized mechanism for them or move the toggle to a Kconfig option
for those who explicitly need to opt-in to the old behavior or simply
remove the toggle altogether.

For the record, identified use cases so far:
- Old hardware with red LEDs that reflect on glasses. (Likely a dying niche=
).
- Using cameras as baby monitors where the LED disturbs sleep.
(Arguably solvable with a piece of tape on the LED, but still a
reported use case).

>
> > If there is any usecase out in the field that resists, we shall move it
> > into a Kconfig.
>
> What does this mean?  How will anyone know to "resist"?

My phrasing was poor, sorry about that. What I mean is: if, after a
deprecation period, we find there are still legitimate reasons to
allow LED overrides, we will move the functionality behind a Kconfig
option (e.g., USB_VIDEO_CLASS_ALLOW_PRIVACY_OVERRIDE) or other option.
If no one reports a need for it, we simply remove the override
capability entirely.

>
> > This patch shows how the transition to Kconfig can look.
>
> I'm confused as to what you want to do here...

This patch is just a RFC to demonstrate the final state if we decide a
Kconfig option is necessary. The actual plan is to land patches 1-3
first, wait for feedback, and only then decide if we need the Kconfig
transition or a full removal or something else.

>
> greg k-h



--
Ricardo Ribalda

