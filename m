Return-Path: <linux-usb+bounces-32889-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL14JslQemnk5AEAu9opvQ
	(envelope-from <linux-usb+bounces-32889-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 19:09:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6C9A77F9
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 19:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9BAE030329B7
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 18:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30886376BDC;
	Wed, 28 Jan 2026 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HJhUIF9w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D18A376471
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 18:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769623562; cv=none; b=kjS56olVdbHU6lc267acmUImnu9k4i4bJaVEI9kbv/PTT83P9gK9v+FAzhZ50tpWh2L15+Cdm1L2JLET9iTBTHaxGBWiJQCDkH1VWena12WhAgIpAKjtWuxgY6ryasGVreJAcTDvqhrgbQ1jGQEDm8dIzQvxpnHgiz4LadgRt6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769623562; c=relaxed/simple;
	bh=KHMadrBICa5jNV71gIOsQxbjwE3VFwiNBVK3CQ6z4MI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnI12BhgOe5Fnx/cD8co5WylSRnjpXdxS4X2O129q9sDWvQSlG0vl0617HvkDOap/RDY2cuzGQGrBx1quxZKHwF/xMSsJMcc69Kgy8MljkEaMVQ4TB8jWekMu7SgL82j1Yo/4ii71NY1T47wHRR7wiFRB+TYn6LH4bVni4AufaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HJhUIF9w; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65814266b08so324370a12.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 10:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769623556; x=1770228356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+ilxlBZQu+Hua0zGnNmXXFBnz3Ws1A+X7KICF47R5o=;
        b=HJhUIF9wroUQVAiUX9S2dbuvlW9qnEbK/WNxUktQPlTrYGnpzoLct4PUtzv9yLSlYw
         1tS6ACM30QJgZDt4TxlHHl0wnYGAkUI3FlIZPTGMwvevCwbq3thSqvLdx/GBNXso0Vb/
         7L/wgyUoO2jVJ5MitXb5D8ZAWgyFKEIDQku9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769623556; x=1770228356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d+ilxlBZQu+Hua0zGnNmXXFBnz3Ws1A+X7KICF47R5o=;
        b=HqPu0niU3sjGY5s6f9JmK18u4hhXKMp++vN7Ke+S/pYOEZlZ2XrG0F59UvU6/VUxZm
         Fdt9VVhDtOOR6AfN0WapksKQWk4DiDVwNQeH77sJiQksDZ5I7jaH7ll0C+o6v252Js6A
         JmfdaFQLFxSf1ysymDdj+kzUHT47CcOs3ttm5+ediIkVUoR6wBdEWwQgr9HsXVqBxtgr
         Nb9zEvXzOwEUo9g8ZA51R6LItTLcrB8/TtI7PDOUWbHLVKjq67dNnlN36NXTdqEyPdrU
         UDKpn44QlXU0nzMGzfMWcUlbst6B7fSNvxRwUElPR8FaB6BH5IqwXSaj45D50P/nc8p3
         I1KA==
X-Forwarded-Encrypted: i=1; AJvYcCUsPgnvYDMgj0k7YcDNR6lawcCx/B2vGHnxBg/b6f2HusqTICfqeEUvB+s1sPzDGz+UJT/UkUZMBrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX5EB/xpLq6IcP14g5zdZg+qC98QA7gguaFQ/5bY8AfiR5Sb5C
	+2HR55ZFhBitgaaXwk1a4bmGU9GqG9uRY+rmsl4dphXP1r0g2+HH3yOsAJmDX3aAKgeNercwD6M
	OqxW+dUCk
X-Gm-Gg: AZuq6aLl8pKGcKF/N0mQn5YwINUCg6MKMwx2QPNebHeidCDkyUveFYbKCt5myL75L8q
	jlTJjcnVLzhoP+BgA9ZOUB8Jy/wGhWi/dwhanxBZOEdBacDxloVT6kntR2zLtrk/CW5qwGFXQzp
	nlR3nNU+p0aYvVqfGfk9hJ9sBa6QvVmd6zsFqmcEbgABlVByb1DWAlyVGBp432yPNdF+OSuplQp
	fUfyMiXWQoXZhgU1oaTTYfLTU/4bSR9LfYJjkVanGJzA9e0LTZVFQoXL6nbtA4unonzr2rR8cio
	UR9RcerWkw2Yr0kAQ+R/4LFNulOgpLCOWlvfaBsYwrDrYU6FH9p68fngfskfvb1+CGDFPdJm5fm
	3z+wz3Faqg2Fbh99gStxHEb4sSttcBrwu2+HLlDjmdIkWCErt9gu9Sz8pgWSiE+EubZLGNi4/DB
	pd3bftg8pT69eLrkXXOfnwa26kdDVrcg0mXjPf1UNMk1kAZT/ceg==
X-Received: by 2002:a05:6402:348d:b0:658:1025:32cb with SMTP id 4fb4d7f45d1cf-658a60eaaf6mr4133365a12.33.1769623555852;
        Wed, 28 Jan 2026 10:05:55 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691e53sm1783831a12.21.2026.01.28.10.05.52
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 10:05:54 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbc305882so132539f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 10:05:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzDFLJh43LJJRqtTdFxaho4Sc1S+1YIHF+rOjmgJDUoJTuiuyXKQiFAoqw8qRkis7FNcujdBkbYGs=@vger.kernel.org
X-Received: by 2002:a05:6000:2401:b0:435:97b2:a9b with SMTP id
 ffacd0b85a97d-435dd1c0cb9mr8604361f8f.37.1769623551963; Wed, 28 Jan 2026
 10:05:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128070222.3393746-1-senozhatsky@chromium.org>
In-Reply-To: <20260128070222.3393746-1-senozhatsky@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Jan 2026 10:05:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WLj0fG6CqN2GwK5DntaRwQP1K4Sm-b-uwtON=-ByJfcQ@mail.gmail.com>
X-Gm-Features: AZwV_QhpWQJIZXZ_fAiJrxwycfOYe1_jmGHjkGRzqMN5ggQBM6eca6RUR66J2Cs
Message-ID: <CAD=FV=WLj0fG6CqN2GwK5DntaRwQP1K4Sm-b-uwtON=-ByJfcQ@mail.gmail.com>
Subject: Re: [PATCH] net: usb: r8152: fix resume reset deadlock
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Tomasz Figa <tfiga@chromium.org>, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	George-Daniel Matei <danielgeorgem@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32889-lists,linux-usb=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5E6C9A77F9
X-Rspamd-Action: no action

Hi,

On Tue, Jan 27, 2026 at 11:02=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> rtl8152 can trigger device reset during reset which
> potentially can result in a deadlock:
>
>  **** DPM device timeout after 10 seconds; 15 seconds until panic ****
>  Call Trace:
>  <TASK>
>  schedule+0x483/0x1370
>  schedule_preempt_disabled+0x15/0x30
>  __mutex_lock_common+0x1fd/0x470
>  __rtl8152_set_mac_address+0x80/0x1f0
>  dev_set_mac_address+0x7f/0x150
>  rtl8152_post_reset+0x72/0x150
>  usb_reset_device+0x1d0/0x220
>  rtl8152_resume+0x99/0xc0
>  usb_resume_interface+0x3e/0xc0
>  usb_resume_both+0x104/0x150
>  usb_resume+0x22/0x110
>
> The problem is that rtl8152 resume calls reset under
> tp->control mutex while reset basically re-enters rtl8152
> and attempts to acquire the same tp->control lock once
> again.
>
> Reset INACCESSIBLE device outside of tp->control mutex
> scope to avoid recursive mutex_lock() deadlock.
>
> Fixes: 4933b066fefb ("r8152: If inaccessible at resume time, issue a rese=
t")
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/net/usb/r8152.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)

This is effectively v2 of:

https://lore.kernel.org/r/20241018141337.316807-1-danielgeorgem@chromium.or=
g/

...and you've incorporated my feedback there. Thanks! :-)


> @@ -8674,6 +8662,19 @@ static int rtl8152_resume(struct usb_interface *in=
tf)
>
>         mutex_unlock(&tp->control);
>
> +       /* If the device is RTL8152_INACCESSIBLE here then we should do a
> +        * reset. This is important because the usb_lock_device_for_reset=
()
> +        * that happens as a result of usb_queue_reset_device() will sile=
ntly
> +        * fail if the device was suspended or if too much time passed.
> +        *
> +        * NOTE: The device is locked here so we can directly do the rese=
t.
> +        * We don't need usb_lock_device_for_reset() because that's just =
a
> +        * wrapper over device_lock() and device_resume() (which calls us=
)
> +        * does that for us.
> +        */
> +       if (system_resume && test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +               ret =3D usb_reset_device(tp->udev);
> +
>         return ret;

Question when looking at the above again: have you thought about the
consequences of clobbering `ret` above? I guess it's fine since
rtl8152_system_resume() always returns 0, but it looks a little
awkward. It's been long enough since I thought through all this code
that I'm not 100% sure what it _should_ do if rtl8152_system_resume()
was ever changed to return an error. Shouldn't it honor the existing
error instead of trying to reset the device and clearing the error?

Also: I guess you've added the `system_resume` variable here, which is
different than the earlier patch. It seems fine to me, though maybe
you want to consistently use the `system_resume` variable earlier in
the function too?

In any case, both of the above are pretty nitty, so I'm OK with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

