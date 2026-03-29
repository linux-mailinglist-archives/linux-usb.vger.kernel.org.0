Return-Path: <linux-usb+bounces-35626-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AU5ZGGA/yWk7wgUAu9opvQ
	(envelope-from <linux-usb+bounces-35626-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 17:04:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5FD352844
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 17:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DEAE300C811
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 15:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF0A37CD53;
	Sun, 29 Mar 2026 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="PYJM/xmG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F9279DCC
	for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2026 15:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774796636; cv=pass; b=JMNlBCgXIPM+Bprq3iWNaT/LM6od25vHLLx8dZYImSOYbwkfubSuRdvUGva03TEedbNKVT80k3xkeUN7bR9C8RwDT0pDycDhUKqtldZhJi4d+4V6n5eXTCWLtHyUxhkFQ9yiR09X6LAPvIYmJH8n1nu74Q+efagarYmPoux3Lqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774796636; c=relaxed/simple;
	bh=7fn3Z+2dnye8ym96U8WpPLIEbXEMZnKCkPCfscZBs5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GFBNgq9UoMaXQ9+eMxrMFleGR9pYXyMOB3CCkq2d5nmZkTRt5vhivPC2w+I2NaC7N1oTRIVZRa14vC4HjULMZkAK68DhtQKZZ3cnJKl9oggfbR1Dj1xzmqT6vSgHmdZ+QhRwLCkwE+u39h5souJoOlk6ilQLKKf5yopUM+d5hzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=PYJM/xmG; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-650158138d9so620192d50.3
        for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2026 08:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774796634; cv=none;
        d=google.com; s=arc-20240605;
        b=EHR6Yqh8RTRUZx/HFiweERKhWS+3xKKuMyUp90XxNJwjuTidxOqixckrxHn/WcDs4o
         M37OXxhkH6EL9yLPFaR5YQx3xNUbCeKzbJO1uQy8WPGvBuxtATPygXxTjOez67En4Z3+
         uUbK75ibwSuT30UtyiHdODXCJWZ+aa4iyykFG59+0XL8NQZQ9ynr8I/ooIiZ74IfIqfE
         /K7sQT5Rtb8Vy81Vxwn8JzHJ6ERyp8/rkfKJ8qWMiaVBTPSeRLP2pEB/oXKyNTpnyW7c
         YB23M42lEhEJOLEpIHeDLNEqIPwnWGvbkRRJTN4oGYVjy54MPBGwSPEy3TwKgCOkiVd3
         EgAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fkpr6x8ZyyJkz5iE6Uzz9ElyoBGLMbtXkFG8ALfJ6/c=;
        fh=X7gwTjO57Iu1hC9uVzKyfvABgwy/4y8Rb04isNIyqMk=;
        b=KrsiZ/FmjQAk82DDKteMWP1ARwIxKU1COXddJW48g4rfeI3ctZY293COge8LgVWCQ6
         mtl9N77XPgwpRFsdEM8gz8aCABkcquuJ/oP+x2nEuhoMZSlohpbLfPqLWzdd/fUBewV+
         oY2o4kXBKcKn07g97puFu7WlCoaSq1dVmCctS/QpnUuD2dqTRG7/VUNzxMUo6JsQqtqX
         cWg8WR+wX/URmJ0fryUfktb+1JR5FWPox8AcnnuqymJcbP7AgGzT/BKs7RCU0Ja+ZOAJ
         K5greujD3wS2MyI1TMNouQKDqv6mJXCcYTeyQv9CSnO9efDwUvSvQGXl0B5ey9qIUXMR
         gSpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774796634; x=1775401434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fkpr6x8ZyyJkz5iE6Uzz9ElyoBGLMbtXkFG8ALfJ6/c=;
        b=PYJM/xmGj4WlXxJz3E7rYM16yoPekuH/t0vpGv5havGLAAuo2ANVyVZH0dGqwKF811
         uvv4SBd1KoUdDAKyQUHplWJPyqJPzRBvMqIh96SQSb9+A3HO0hvUIfaiRR3Puxe3WJSd
         zQEf1N1d6EM1d1BHTCCQFiTP5L5gHggivWmvrIBJta2mM5pcfen2BrPwLCxoIn1wTRYN
         SiPaEduwkeHBadCioL3rHyF3Ua9BzIc5yuZCgHZ0skXyUjn2uRaElvHwesHIpUXBKCi+
         USKp4nO1XPhRIIoCqVcK/o3CCYws0zx+GZKig0YnQgRjuqVNaFlX55tWeKD0asZLAwq4
         SIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774796634; x=1775401434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fkpr6x8ZyyJkz5iE6Uzz9ElyoBGLMbtXkFG8ALfJ6/c=;
        b=DtPHCBCTgEHwlROsKFZXzoCkPR84qWtW4oGmReydNK4SdchBgi5e8L/1+0a1qhuBMb
         AkGlm5fILTDuz+fzxkH95N2dGsTjr6Ox5j/TdYl9gHggQUFvDGRCrOOpU7r0O8JsV94v
         b5m5sd8X9aCUXXyVJulxe3Ig2rQBzBHiKJDZ3hbaxSjbn8vsaAehIBsQXIztNM901wQj
         U17EfgK4GInpV9Alogo1kGZjaerDqViQfgt3EjXNxeunkrsdSkm5K0vBf9nAGwLjUAnU
         Gx4GgEUJDWpWK4UCZ8MC8mjNT1BPOVxDGynEtJEc3KB4LJFSU9QjBsGcYjQHenwdHj2l
         6CJg==
X-Forwarded-Encrypted: i=1; AJvYcCXHkzrPSsIHPrTSpR/K+m73VNB+W7rr4uAnj23grf0+DN4inUcPi1wu8K5uPNTc/uv8FdZifwxbynI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0jz8ReV0cPud0M9YAJJ3o4WEL+6TCUiRaoAmJCVV/H6efxTVD
	Pnbns4jTTzLWBB5cF6LqAhlqn44KNRuH2gljRMINBIARn5eS3ldRPymD2Yi2TuX2xyTL9nnzxB/
	wCsMBBxAuISs1/yn8Z4EayLrNqfRuAtN2PRh0J8tv
X-Gm-Gg: ATEYQzw2V24+S0V2rxv7GrG/VoFNJ79sRcaPxS7N16k4tHHCbO/gXjH4ubNenD9EgV1
	TBVeUfc2THARj07y4hFy5rXYkGor2B5QG5SbjBl5lToKst40nfkgDVNYgE9xURH0sWUjJnsWyaO
	yCBV4pRCzBEvTbD/Htcep+/GtojAnzk5Of4kELdn5yndsVDZgj57awcjKIlBzgIb9GpB8+wliW6
	xuJiQ7/4aX9NUAPK4WRWpwdLFjHA9cW0PrITVfaJBGBTyoTgSQl5S8iDfSIYH85O0ZuPIRE3iKD
	LSxFC2dyZypnS9Y=
X-Received: by 2002:a05:690e:1c08:b0:64c:9ec3:d710 with SMTP id
 956f58d0204a3-64ff73acdb5mr9325664d50.41.1774796633749; Sun, 29 Mar 2026
 08:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321223713.1219297-1-jp@jphein.com> <20260322055354.03399a32.michal.pecio@gmail.com>
 <CAD5VvzBE8Oq80EhFZnZ7kNrRC_rpoR25Ct5-Fg62yDZUHVtWzw@mail.gmail.com> <20260323085845.6bf57b3b.michal.pecio@gmail.com>
In-Reply-To: <20260323085845.6bf57b3b.michal.pecio@gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Sun, 29 Mar 2026 08:03:42 -0700
X-Gm-Features: AQROBzD7GC_TrwPeTrvW3mp5jNE4JvirNKJp_EKtrLyJ9BYIvabbB9bj_SkkwFk
Message-ID: <CAD5VvzDWF7SO0Aytp3K_uXV6ZYoqEqN1dhfv7VtMAHSpHP+qTA@mail.gmail.com>
Subject: Re: [PATCH 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI
 cascade failure
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35626-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,techempower.org:url]
X-Rspamd-Queue-Id: BF5FD352844
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

I have now tested on 6.17.0-19-generic (Ubuntu 25.04) with dynamic
debug enabled for xhci_hcd and usbcore, and without any of my proposed
patches or workarounds applied. No udev quirks, no LPM disable, no
control throttle -- completely stock kernel.

Results: the stress test passes 50/50 rounds with 0ms delay. On
6.8.0-106-generic the same test crashed consistently around round 25.

The xHCI error handling changes between 6.8 and 6.17 appear to have
resolved the cascade failure. The controller no longer escalates to
hc_died() when the device firmware stalls.

The UVC probe control EPIPE (-32) still occurs at device init:

    uvcvideo 2-3.4:1.1: Failed to set UVC probe control : -32 (exp. 26).

And with dynamic debug enabled, the kernel logs show it dynamically
disabling U1 LPM when the device responds slowly:

    usb 2-3.4: Hub-initiated U1 disabled due to long timeout 16800us

So the kernel is now handling both the LPM issues and the error
recovery gracefully without needing the quirks I proposed.

I have not tested on non-Intel hardware. The firmware is already at
the latest version (1.5.0.1) per Razer's standalone updater.

Full debug log from the stress test is available at:

    https://github.com/jphein/kiyo-xhci-fix

Given these results, it seems like the patch series may no longer be
needed for current kernels. Happy to provide any additional testing or
logs.

JP


On Mon, Mar 23, 2026 at 12:58=E2=80=AFAM Michal Pecio <michal.pecio@gmail.c=
om> wrote:
>
> On Sun, 22 Mar 2026 15:10:28 -0700, Jeffrey Hein wrote:
> > Both failure modes are in the device firmware (version 8.21), not the
> > kernel, so they exist on any kernel version.  On 6.8.0-106-generic
> > (where I tested), the TRB_STOP_RING case in
> > xhci_handle_command_timeout() goes straight to xhci_halt() +
> > xhci_hc_died() without attempting per-device recovery.
>
> Command timeout is a failure of the xHCI controller, not the device,
> and as Alan said, it's generally not supposed to happen so we are
> curious how it happens and if it can be prevented in xhci-hcd.
>
> Device behavior may be a contributing factor, as can be a kernel bug
> or controller HW bug. It would be helpful if somebody tried this on
> non-Intel hardware and on current kernels, because there were various
> changes to xHCI error handling over the last two years.
>
> > The stress test script is in the series repository:
> >
> >     https://github.com/jphein/kiyo-xhci-fix
> >
> > stress-test-kiyo.sh exercises UVC controls via v4l2-ctl at maximum
> > rate -- brightness, contrast, saturation, white balance, exposure,
> > focus, pan/tilt/zoom -- cycling through their full ranges each round.
> > With 0ms delay between controls, the crash consistently occurs around
> > round 25 of 50 (~5-10 seconds of sustained rapid SET_CUR).
>
> OK, I will see if it does anything interesting on my hardware, but it
> may be nothing because I don't have this camera.
>
> Did you try it on a different camera in the same USB port?
>
> > That said, the firmware lockup itself is controller-independent -- the
> > device stops responding to USB control transfers regardless of the
> > host controller.  What varies is the host controller's response to the
> > resulting stop-endpoint timeout.  On 6.8, xhci-hcd takes the
> > TRB_STOP_RING timeout straight to hc_died()
>
> Nope, this is controller dependent because Stop Endpoint is a command
> to the controller and it has no reason to fail. Something is broken.
>
> Could you boot a newer kernel (compile 7.0-rc5 yourself or at least get
> latest release (or beta) of your distribution), enable dynamic debug
>
> echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
> echo 'module usbcore +p' >/proc/dynamic_debug/control
>
> then connect the camera, crash it again and send dmesg output?
>
> Regards,
> Michal



--=20
Jeffrey Pine Hein
Just plain helpful.
jphein.com =E2=98=80=EF=B8=8F techempower.org
(530) 798-4099

