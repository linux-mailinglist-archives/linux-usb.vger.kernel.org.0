Return-Path: <linux-usb+bounces-30656-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D12B4C6883C
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 10:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 916822A5B3
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 09:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4F330FC1C;
	Tue, 18 Nov 2025 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RRBqZ1VU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C760143C61
	for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457959; cv=none; b=cmPGMGPtW1AVhDj34BYU5xJ71U9ehy/W6E+iN1W/6rj1mDjVz+yma1SD66x2oBunRZEOOenyUwlpuh3N6RgJNW4MvB4FTKMq8XEdgtDS2ZihZnN1htGH+ZgN5CZxB9+RABDaHBm0mfTeEll/HoDk0QZGArCL4DWzkjDvtnAsD10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457959; c=relaxed/simple;
	bh=dH8EdpnR2i16jftT1azcGeU6nyFTjX9mdLB8VTapQ8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oEQBOWtEXz/Vg/koqIEzURvRcHIhev2B9kQ8j7QmHxSoy2REXE/BMMnixNY4V2ClY/Rwoy9jQRrZaxW5c0CY9FU0hrJnBN3H1pCQtJToNNj1gGf+WoqEph8r51q6x1srogReVZR88JXnqzz8KoCyTggqqsfG+1S9jv3ahXzNYSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RRBqZ1VU; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-594330147efso5109499e87.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 01:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763457956; x=1764062756; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+yae1MALCGHKV7TgqqaWxc3cR1A5oospqJfHNyVOwSU=;
        b=RRBqZ1VUOhHN3aj6M+UvvGeuomb7oucGz8GzKQyyPAb0lHB4yAQc0jQ9HRLVbndU3S
         8H/GvLEitzDVA0aMWDom6T4BikrP2bHPUlo+qJHg9/9rfi3dImB3gPnnV9h/f0Obbaal
         +lZ0PMfRaUli7rNxv+V8ITTOxmiwCp9kn16lU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763457956; x=1764062756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yae1MALCGHKV7TgqqaWxc3cR1A5oospqJfHNyVOwSU=;
        b=VHc+J9kfsNLIlqhBuibeMrIEwXB34n1VqBi7eywu6ki5yVYcRVduKfM7XXlbIqawzt
         0jTMKC9Fwq5K9b2Z15Jn3Ja4mLofZseCTAj6F0kGZUgaBy/iQ1KlDqTVFHaSfojmZALc
         YSDencPit3SKTqIAImRHFFauS6Kza6lRMcQGgUEfNh69ZpmBrcpay66y9a90qgqC6tof
         NtLa/2CxNPVzAK6CWvn9aNQ9WIFeEyy59iJMxpvzao/ZaexFaxzc8a/4/aTMWnkyxdDg
         cjp2CCUGRsSbqwPVQUsAy8mL+rIwbLkIMr9AK8oJuEPz001JL1MaaheGb8THXM7Ut6RP
         XXyA==
X-Forwarded-Encrypted: i=1; AJvYcCUGKbgzOc2NLasgBb7pct7hP/7Wh5Ys2OHA8FKNfsHchwxCokXn/JFEOApS1kTQelsJB4pDMLyNw78=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqTfWK8zcDaI67fIXZhgHY5Nms/P795DK0i2Jcao5gQnAPpvhk
	TcICdLDFf69Tz3azcUpU2z/iO4emDEijmAmWcV0u0AuCvM3IYXni+JTqIDtUIbCqe/Y68C0ENsS
	BbGvyrg==
X-Gm-Gg: ASbGncuFPr+PeBETfonXk+1f0H2cQhCdQ6DCpB9c0WHcgX5nhSYUlDrmnQf+RcXxNc+
	uogLzzxU4/ZZHWEB9PdxMUS1x7gJMM8EvelJkEEKUn5NySxY8xtoG2ze6T/XwpzLCjW/4kv4ENA
	bUcYjpxhE2m2ouxItOvPxOyJt5OOE0DTdWlmkHtWjLYCh6eVQgnlFjhBBqkkBMC81pvHSD/yB63
	tERtAKEpmBdSLc3X628dGVXI3msdTFHdo9OzGNsIY6KI+XxjFny1gAcOt3HWQHOCGmTLSmn7aoK
	JpWWAXMRk1GMQckgwnIjJs0GMVI9MK+WJePsNozw0PaR6Ay8MQ3znVmKncmXQSmwIGmXPbT4pr1
	WMd7wF7v/bB7pToWbnT5lGD4VJ2NlIls01sUAE5i8BdVUs4/aWZ2JmUHaubf7sjcRXivqN6AQtb
	K4tdlG4Um/H/6ynjHg7b1nJu758dRC1xIuoCczechnC15r7Evzqf5y
X-Google-Smtp-Source: AGHT+IGP7t4gKoK33NW5a71YQeMbQF2JlVgUraDLYIweWjqznJaFv1cj5dG3dQ6AYGr4FaUeoTQzgg==
X-Received: by 2002:a05:6512:6d1:b0:594:2654:5e65 with SMTP id 2adb3069b0e04-595841f0e00mr4432772e87.26.1763457956197;
        Tue, 18 Nov 2025 01:25:56 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040583asm3827879e87.92.2025.11.18.01.25.55
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:25:55 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37a56a475e8so48808971fa.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 01:25:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbF+RMMVvLrb0batPMF6yzVt+nVEUpD/Tk+DJYMlpMLkADTDTcbSibavMy7Sl2f4Vp/mVkJXRATC8=@vger.kernel.org
X-Received: by 2002:a05:6512:12c9:b0:579:8bbb:d61b with SMTP id
 2adb3069b0e04-5958420949amr4940858e87.46.1763457954653; Tue, 18 Nov 2025
 01:25:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org> <f922a8271624a6ae765abbf9894867007a29c8e7.camel@irl.hu>
 <CANiDSCs7mdMmCxho+u=DC53kCaUTq05htzpV2=_NEkvq0U0pOw@mail.gmail.com> <fd65b83abc22587e592a565dd2b326e8eb63f34c.camel@irl.hu>
In-Reply-To: <fd65b83abc22587e592a565dd2b326e8eb63f34c.camel@irl.hu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Nov 2025 10:25:42 +0100
X-Gmail-Original-Message-ID: <CANiDSCudzTj0QZMWNnE0gUPFh5heQWRC8z8NOmDHnVXCdqi96A@mail.gmail.com>
X-Gm-Features: AWmQ_bloIqP2zjmmqvyZS2koEN_byM0aGR6YqFlokGP3PeXDJPTGOygBffnBb84
Message-ID: <CANiDSCudzTj0QZMWNnE0gUPFh5heQWRC8z8NOmDHnVXCdqi96A@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
To: Gergo Koteles <soyer@irl.hu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Gergo

On Tue, 18 Nov 2025 at 09:48, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Ricardo,
>
> On Tue, 2025-11-18 at 07:21 +0100, Ricardo Ribalda wrote:
> >
> > Most users expect that the led is always on when the camera is active.
> > I think the usecases where the led should not be turned on are spooky
> > or very limited.
> >
>
> Or do most users expect that if a piece of hardware has a setting, they
> can set it without module parameters?

A piece of hardware that has a non-standard, undocumented setting.

Do you have a compelling use-case for turning off the privacy LED?

>
> > Even if you use open-source software, when it parses user generated
> > data, there is a risk for bugs. If there is a bug the only thing
> > protecting the security of the camera is the membership of the video
> > group which is a very low barrier. And once you manage to change the
> > LED behaviour will persist in other unrelated apps.
> >
>
> So this is about what if an attacker accessed my passwords, private
> keys, OTP tokens, emails, pictures and then couldn't take a fresh
> picture of me in the dark without an LED? I'm smart as hell and I use a
> privacy tape anyway ;)

My core goal is simple: if the camera is in use, the privacy LED must
be ON. If the LED is ON unexpectedly, it serves as a clear indication
that something unusual is happening.

Gaining access to the video node does not automatically grant access
to sensitive data like browser information; there are sandboxes in
place for that. Also open source does not equate to secure or
non-malicious code.

>
> I think freedom is worth more than this kind of fear.

No freedom is lost. This change simply increases the
trustworthiness/reliability of your device.

On ChromeOS, I don't use a privacy tape, but that's because I know how
the LED is wired :). I want to achieve a similar level of
trust/reliability for everyone else.

In other words, I want to know if someone has seen me without t-shirt,
eating ice-cream and crying while I am re-watching Coco.

>
>
> Gergo



-- 
Ricardo Ribalda

