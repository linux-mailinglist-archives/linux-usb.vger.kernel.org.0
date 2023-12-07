Return-Path: <linux-usb+bounces-3834-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EE98086D2
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 12:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCE0F1F22765
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 11:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A6E381A4;
	Thu,  7 Dec 2023 11:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EHLDLMuv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08B0A3
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 03:38:31 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-54c77d011acso7537a12.1
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 03:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701949110; x=1702553910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buHSrtnCXGU16RoXErejV9+uPleVy0Ct6fWZIPdIcJ8=;
        b=EHLDLMuv+pEa50Eb6wTNN1wDw49tOYzbAcR1FYCjTXtVg5lMXcMSjZRyfFmx2mrXpv
         JI+JHN2LXb5exMR3geCiLsR3u8yquGT+/PMpedBuboBDCSiKUkbJ0AU7X1falT41+nGJ
         YZVuxJVghTe7plhBweBVIsP3Fn3DDEZZjxQjn6aT9syZ6xUphMmSmgB8Z35Y0JVWq9el
         vJlFu5+dicLlPF3P+AgzmXwlGyyBzBjMbd315w217I9BQ3a9iUMUGuoBAiTmC1Gq1YqR
         1jpNgXGRFB5OJZ0uzuipFDR8eTTPlC69dnPgEeiwSsFjqQHwmjvGDijStsq0cdkWlKDK
         Acng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701949110; x=1702553910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buHSrtnCXGU16RoXErejV9+uPleVy0Ct6fWZIPdIcJ8=;
        b=jByiq4MhYJQEIm3GfwlaPq4/O0Bbc4l+DNHivLKJAnbvbQ4qT22WR+jbK1tyUDwP5M
         uEnt4HSe7WqSpQcfogfUUwKPRfSsmXnGuItunhFi5kLRZo9pxXN61lYuk56Y/1eqtA9s
         vGSqjG8q897HdB3rgcQoOFa+TW7CLoCtZBlBSb/BANUuYrileHrbNFqxgnypUV/mhH+M
         jMEJjWCF1TsyaPNB2TIcORJriUcDyG+1DUEmSt6sR2LWkAa6uKO6m5/sniy1cB7IHJkR
         0E3kDhLx0sYdiqnO22GQRSflNu3x/se9csJneBV++LslHspXKqLbjkKUbEfR1LSVk8h2
         yjqg==
X-Gm-Message-State: AOJu0YzGxv7saMi2usfYHce3k+3Di1xGrzzkBNr96Kb/ddZ9pWPZgOFI
	5Ab+sQRcPUG/9fCs6ITvMOUdE7HtBj6vF2alzh+8wQ==
X-Google-Smtp-Source: AGHT+IGD8ZAPzxpsLplKi6u2hK3pwdxYiTPSmWwSXcIIKue/G7xt+zGStuD36XeaZSU7TvOpp2WcuGtQFsfKU8w4b4E=
X-Received: by 2002:a50:aacf:0:b0:54b:321:ef1a with SMTP id
 r15-20020a50aacf000000b0054b0321ef1amr215796edc.6.1701949109981; Thu, 07 Dec
 2023 03:38:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2ce653b3-c553-457f-bcbf-9fce36f82dff@suse.com>
 <20231206162353.53767-1-hiagofranco@gmail.com> <c2ee0ecf-993e-4736-b005-588fa6ef51a3@suse.com>
 <ZXGYgfFhVhlprqco@francesco-nb.int.toradex.com> <604fb326-61d5-4d67-b009-649ece32a1e9@suse.com>
In-Reply-To: <604fb326-61d5-4d67-b009-649ece32a1e9@suse.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Thu, 7 Dec 2023 12:38:18 +0100
Message-ID: <CANP3RGdr+snVzp2exMEzcd2PPQy8rOEL5PzpfXAEztdpZ8NK0g@mail.gmail.com>
Subject: Re: Question regarding CDC NCM and VNC performance issue
To: Oliver Neukum <oneukum@suse.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Hiago De Franco <hiagofranco@gmail.com>, davem@davemloft.net, 
	edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org, 
	linux-usb@vger.kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 12:07=E2=80=AFPM Oliver Neukum <oneukum@suse.com> wr=
ote:
> On 07.12.23 11:03, Francesco Dolcini wrote:
> > Hello Oliver and Maciej
> >
> > On Thu, Dec 07, 2023 at 10:41:51AM +0100, Oliver Neukum wrote:
>
> >> OK, you are using Linux on _both_ sides. Interesting, far from obvious=
, though.
> >> (Putting Maciej into CC)
> >
> > One more data point. If the USB host side is Windows and not Linux it
> > works fine.
>
> That suggests, but does not prove that the issue is on the host side.
> Could you post the result of "ethtool -S" after a test run? We should
> get statistics on the reasons for transmissions that way.

An every 1s (the default) ping is too rare to be of help I'd assume...
Try ping with various intervals (-i).  All the way down to a flood ping (-f=
).
Most likely -i 0.01 would be enough to make things work better...

Also which specific versions of the kernel are involved on both sides
of the connection.

There was a pretty recent fix related to packet aggregation recently
that could be either the fix or the cause.
  "usb: gadget: ncm: Handle decoding of multiple NTB's in unwrap call"
Though I doubt it - I believe that was specific to how windows packs things=
.

Also Krishna Kurapati has a (afaik still not merged) patch "usb:
gadget: ncm: Add support to configure wMaxSegmentSize"
that could be of use - though again, doubt it.

Another thing that comes to mind, is that perhaps the device in
question does not have sufficiently high res timers?
There might be something in the kernel boot log / dmesg about hrtimer
resolution...
Maybe this just needs to be configurable...  Or pick a smaller value
with broken hrtimer (if that's the issue),
or just disable aggregation if lowres hrtimers... etc...

#define TX_TIMEOUT_NSECS 300000
300 us is too small to be noticeable by VNC imho, so I think something
*must* be misbehaving.
Perhaps timer resolution is bad and this 300us ends up being much larger...=
???

I wonder if the hrtimer_init() call should be with CLOCK_BOOTTIME
instead of CLOCK_MONOTONIC.
There could potentially be an issue with suspend, though I really doubt it.

Another idea would be to add a gadget setting to disable tx
aggregation entirely...
(note that reducing from 8000 to 2000 doesn't actually turn off aggregation=
...)

Have you tried reducing from 8000 to 4000 or 3500 or 3000?
Maybe there's some funkiness with page sizes??

