Return-Path: <linux-usb+bounces-35133-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHpYI87hu2lXpQIAu9opvQ
	(envelope-from <linux-usb+bounces-35133-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 12:45:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A4D2CA888
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 12:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A25BE303EB8E
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 11:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4713A3E6F;
	Thu, 19 Mar 2026 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bJfpLnO+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3775A371D0D
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920621; cv=none; b=Eu1eY9v5UkBA/k9ZskkhY5M9E3jNWTZNXvtCE/d44oC5iR3MrgJRldLSi2JPL7ayij3dMA9ijP68myfN/Z1cmDKp46cH1qUzUlWsj8SR38TaGmWbNtrViqrO+Fs+s2BKTlGYnhYpTvYE8vy1QhTkxAJMGXcL598pFeRH3EmKwg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920621; c=relaxed/simple;
	bh=O/B5jor0vW8cADLMNtBhxa0dR3u2UgKsCIxB8/6vI4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MoJFipyNk8upxVBN4Ep84c5N/Wp0DNoBNdqLYgcxKbq9aVSzuF697RiMIeOOqzsWcfPqXUs9gTjW3xRfQc7t2beFk65G2+TobL7TPwn9lVHXoyVWNVtHPMMoGY+COMAxwgdFonDKmnPYwvplUrLB+OH3wbteAKIUolZ2gYb3+Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bJfpLnO+; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9358dd7f79so128089266b.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773920618; x=1774525418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/B5jor0vW8cADLMNtBhxa0dR3u2UgKsCIxB8/6vI4o=;
        b=bJfpLnO+mOovyLzD+C3L68uBq1QK+cVif4YLZOLqIyQlmwDAzyPdtW89xc/gtvxwtZ
         NqbABf8grcbQyxSWZdIlLF+T/wuH5H5k4dm2RM4FxeFsXtkHtqqPx4M1mOg534WivgdH
         buDTLRHRx4AnGLug6YzCYIjBzlpyc0thpkz/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773920618; x=1774525418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O/B5jor0vW8cADLMNtBhxa0dR3u2UgKsCIxB8/6vI4o=;
        b=jsflIud7JsvI5/kdGXzAxzT6q7mMzBumRel9y4iB10ZIVcG75Ka0lNvouzjCtdCuxk
         9yHRpmHkwUr/MUKMxq2ZAGVrjg8vQ/bVjSfam8xG7I31wnGltK0UtTBBfIJH7kXNQpcn
         iva4/cK0pwPo3/1d8UUzB+ZKRAp0w/20F5Zkj/ilGlPvtZedqZDOtGHe5BUwg5hUKyEH
         Z5DCcHEM6siiJu8ClMzY2nDeOwUyIFrJxvCCmNQfGGSfGpPpunVIc2r0S9JmRh4+HPaX
         4Eqq1O5o6YLeQtBRtBzUSWE6gJYfr4a+Yr/Y+Zx9DkeJp2mqcnAojyG/VSoLhFSbgDHK
         aysQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH6NZDJX87Nb7WQrlB+AH3uvb4am304M0cKir1OWR+Xpv3l/9DOOfRnfqeSiEslebKMF65XevUGRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YziYz1iMuxqmsnTCUbQUgVSYHltV2PJ5JRoJW3e5BEwot4W76i8
	mSJrYbK/+Kc4mfnV5fnVV1C0JAJvlzBcVcpfg+0ePxNbWn62y295+OSL/TQTEm7BLWJ0NPWlETx
	xRwUe34nL
X-Gm-Gg: ATEYQzziQCwjTLNQpPpgm68iZYdqJrUrOuxFXC1SQShhpXKT30ygJiMBYsW5RLL4kN1
	sMz/fHQJM0SBTQj+6OZjSeCgSZoRkeio+vpA2yTJKD560ZqwUl1yTNVCZF+3+JEcdUlSkj8Ia0o
	Y/MxDPMEnZOKYpdJ1587N9oyzdrBXsjPOhpmy4MmYprMhnqV9dxwH0VODHXIa5YtdqtDJtP2lkI
	+mLRbat6s/wWQ124A9OT5KwISU9WAJ1AjyDFIsDuLvSJ8YwpIUpCEpwiikwwJHrLATJp/qV+Z4e
	mvH1rz7g5scvu69Wm8+/Cw2PVGAs7KH08lfJIX3+gfoGH01gRd7UStQ7NGVoPLPHKHKk3/nqfcI
	gCXNABGXaNbxv+i4Dup01cmybtEg1/e3CxitmnbkoZSxP1pLxQgIBZRbQKHcXSE/WeV2f7nggMC
	hoPkGLmWvC9ekYozHUkTv/QSM1L54G1XGwu5n/UDq40xM1S6sWLRNcLIXs+ofGdDDp3kA1618=
X-Received: by 2002:a17:907:6e9e:b0:b98:baf:638e with SMTP id a640c23a62f3a-b980baf7362mr277505066b.13.1773920617828;
        Thu, 19 Mar 2026 04:43:37 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f168162bsm425362866b.37.2026.03.19.04.43.36
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:43:36 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b97ed4ad579so136444666b.3
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 04:43:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOfUGSzT/v9PsW+fbFf3BPoeVs7EwFLhFq0Xoe5h51WrNjQiwO37DAtDjVzrS97CWwkwdWOgYlg1k=@vger.kernel.org
X-Received: by 2002:a17:906:4fcd:b0:b96:f6f1:e7af with SMTP id
 a640c23a62f3a-b97f486043dmr440383366b.9.1773920615674; Thu, 19 Mar 2026
 04:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
 <20260316-uvcdynctrl-v3-3-19cd4657e1f3@chromium.org> <20260319013657.155efeb0.michal.pecio@gmail.com>
 <CANiDSCsBjgZL0MGFgkDzbTaJ03hE0gZbV3tu3fKo7k6KaAcMZw@mail.gmail.com> <20260319120856.09f2f15a.michal.pecio@gmail.com>
In-Reply-To: <20260319120856.09f2f15a.michal.pecio@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Mar 2026 12:43:21 +0100
X-Gmail-Original-Message-ID: <CANiDSCvw8+KAbrqqSr76eLpdyMoG_o6miy_nGEyS6bRqR4j0PA@mail.gmail.com>
X-Gm-Features: AaiRm50updStBLTHuXRztGog45v-kDkDlKyItK_AbBGnHajIvbj1i2TpZNuiD84
Message-ID: <CANiDSCvw8+KAbrqqSr76eLpdyMoG_o6miy_nGEyS6bRqR4j0PA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] media: uvcvideo: Introduce allow_privacy_override
 module parameter
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35133-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,chromium.org:dkim]
X-Rspamd-Queue-Id: 09A4D2CA888
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal

On Thu, 19 Mar 2026 at 12:09, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> On Thu, 19 Mar 2026 10:56:59 +0100, Ricardo Ribalda wrote:
> > The goal of the deprecation period is exactly this: to trigger a
> > conversation before a permanent block.
>
> Most users will just curse and edit their /etc/modprobe.conf. They may
> post a rant on some distro forum. I suspect no one will monitor this.
>
> > We can then decide if we need a specialized API for their use case or
> > a Kconfig option, rather than leaving the current "anyone can turn
> > off the privacy LED" status quo.
>
> Why not just add the specialized API right away?

We don't know the exact use cases yet, and I do not want to design an
API without understanding the users for it.

At this moment, we have only identified these usecases:

- Disabling the LED to avoid reflections in glasses. (This is
generally a non-issue with modern hardware).
- Baby monitors. (I would argue that physical tape is the correct
solution for a sleep-disturbing light).

>
> I believe users affected by this regression are already known,
> ISTR some negative response to previous iterations of this patch.
>
> Kconfig option sounds crazy, who would want to rebuild the kernel
> for this? Depending on BROKEN is double crazy.

I am not set on the final implementation yet; it is exactly the kind
of topic we should discuss at a media summit.

>
> > The attack vector is that an app with camera access, like your
> > browser, can record you when you don't want to be recorded.
> > The LED will be a signal that something is happening.
> >
> > Imagine that you install a Flatpak for live streaming. Assuming the
> > Flatpak is properly sandboxed, remote code execution is less worrisome
> > than the app spying on you.
>
> Theoretically yes. But also nobody should rely on those LEDs.
> People who care ask HW vendors for physical switches or disconnect
> the camera while not in use. I have seen black tape on laptop lids.

I rely on my LEDs. I know they are wired to the sensor power supply,
so the LED is definitely on when the camera is in use.
I want all users to be able to trust their LEDs like I do.

>
> Are there more owners of affected hardware who want this code than
> those who don't? Maybe it could be a Kconfig option for them :)

I believe the majority of users prefer a system that is "secure by
default." Most people expect that if the LED is off, the camera is
off.

>
> Most of my USB cameras don't even have activity LEDs.
>
> > > So it's not removal of some controversial feature, but 3KB of extra
> > > code in everybody's kernel (I just applied this patch) and a forever
> > > game of whack-a-mole with HW vendors? They will win...
> >
> > Maybe I meassured it wrong. But I can only account for 1.3 KiB
>
> I simply ran stat uvcvideo.ko and calculated difference.
> Could be a matter of different kernel configs.
>
> > I see no need for vendors to hide these features, they simply added
> > them because an OEM thought it was a nice feature to have, or because
> > they left them as hardware debug features.
>
> But how will the kernel know about those random debug backdoors?
> It just seems that whatever is discovered by users and becomes popular
> enough to reach linux-media, will be getting blacklisted and broken.
>

I prefer to say "filtered" rather than "broken." It=E2=80=99s a matter of
perspective: we are filtering out non-standard controls that undermine
user privacy. While we might not catch every debug backdoor
immediately, setting a policy and blocking known overrides is a
significant step and also sends a strong message to vendors.

Best regards!


--=20
Ricardo Ribalda

