Return-Path: <linux-usb+bounces-35505-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eC0xONkexWnr6QQAu9opvQ
	(envelope-from <linux-usb+bounces-35505-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 12:56:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B36D334C65
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 12:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2705630154A8
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 11:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AB63EDAA5;
	Thu, 26 Mar 2026 11:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fpy7/WFm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA283EF678
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 11:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774526162; cv=none; b=aISRwMPZ9jIMNVQ3trR1jlU28ZLi/C8W3PMfWqEETCzPHxXFzU9ucDFpqgUUizViYEhTWR2VPf81c0K1HYK9wHUReo03K5PWLR0G5RJg5Ykmg3wdyxOlSSV3b0cigckvMp2mj/kKaG9nDzPuORgFLJi04fP0pcnoNo0vgVhdsaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774526162; c=relaxed/simple;
	bh=wzmkPOH/ul+d5N3kQuPZg3oGSHed9O4SRuzSBsbfMn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XapwprzMlVUwTM1bH9DGUqYSWzDkj/wFpN2TBcoUxNrCXm0VxYNqwGMo9M1N6ehIkHIlaolOEjMzagET0W5xZ63elVVey94d4gwTDDwy8p4kLggkUtzXK9T9Px45eeo4vv7VWiPe2dF+NiXNtVV6eTuC5Q6YO1zlrSaPrp2v/kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fpy7/WFm; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b97ba4c2be2so113207666b.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 04:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774526156; x=1775130956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TnPTTZ8zwBCkkhVfsAo6JxPxFtZTUAsnPoPyWZufs8s=;
        b=Fpy7/WFmbMzYAbtr95GqmYOrPnYQvR73ZkUMfPKjkVe76x6PV1pdPCgywzzkiBSFjR
         Vk30fiQA9xx2MzH5jEkIJ4B21zXKmYR9hDtFn/qrhQsgoDFY8shIE4fr28lzUQ0Vo14L
         yDGdTE61aNDd9T2KBA4pkffq3AmlQJU2g+qZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774526156; x=1775130956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnPTTZ8zwBCkkhVfsAo6JxPxFtZTUAsnPoPyWZufs8s=;
        b=OAuwF670J6hc7FHh7iD0PO/sBD9a7GNyFnezmFYAaMyFq7xQNP10X2phgzX/xzDXJ+
         p0PkhK0JTO17y/Jp6isOUQ/RWcFLrivKpcxvbqq4MCcHe+k31RjZFqoxazyW534VY7mP
         nVegPrNT4f01OvzxoWLQEMGfv01fCfAlLZHcofK6lZSfQ89SYoZyaHjpn6Xalwk0T3AK
         kAz72N1TsQwvXFFipL1aS5/mArjPVR0J4NBkLTAvAx/N+V3u0+jmKUKLFXdKsXbtdzuW
         ME4NwEXB4h+4OkiGxJGEXBzL1Ep//g34eH8WfyUmol7v8xGQKD+WOe3mUxNFx6CZMCUV
         roAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa51mNWtHYYrgT5TsEK5xohSQ1hIpwKGIzxYHNffN2gvByIkVb9YpraPmLbq/W9HI0T2pNB4t37KI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf0snjddwa7x59HYs/yRnABCUV25CrICWQU9Xl4RF7atJBhZUH
	Z8638Fi/bhiQrujYmdFuYgVdhm5OwxbOMB4o2RQW0mNGSgIo2aKFzjPt93pqkJaIeqA0dMti3wr
	UrvtvEA==
X-Gm-Gg: ATEYQzxMJvWd5+IQY3Ms6sE2C7suSp7FevsLiyaLgS9yGP3auOPPaRp6Eg90HQS2lW5
	bH5ORag0JCdWqRicB379/vlLt0MvZJ5p8QQTtARCnM4NCp6RgmDCE4qRaDqvmmEkia0MnN/ugkh
	nDMWrcv/jrpQi5Bw8p31iUQxNpI+0JXOXKWZ7ycipvBeWP6uT0WixHD7lAZ5FfijFJDgvlzuPf4
	DirfEncEamDAxMldvx4/7fbkLYafPDYkeCkCzsHmTwW0N8khHNTT9+RysNyop2bE7U1Ab3rJR8Y
	JbpRoMLQb8LRdb8DIgPde9VH2VE57R0JZUOy24clMNuPopZ3Q/J5NVR7xLKnpUoXMhNo+z3pPES
	1mf3bM2BTCFItIz/clS8K8iO3KZruZ1y4ebqjaGM18qBkHU+ofu9hOXSIbeWxFKWkGQUCU9joW3
	e78inVXQcyDZB4j0258TXfSC99/7paQXS1l96DZ3pbm2yCSaA6mEc6DZoOAElD
X-Received: by 2002:a17:907:7286:b0:b98:5030:5792 with SMTP id a640c23a62f3a-b9a54221633mr476961866b.29.1774526156206;
        Thu, 26 Mar 2026 04:55:56 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20445a6fsm101766366b.60.2026.03.26.04.55.54
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 04:55:54 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b97ba4c2be2so113200866b.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 04:55:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULqwGLfDyuAIi1xmpz0DV3P8JWYvShSwCz3DWlH+L8VsqZRel2jnZwcQGvbwluDyexrSaQaHKTmtw=@vger.kernel.org
X-Received: by 2002:a17:907:1b1a:b0:b97:f2b3:49b8 with SMTP id
 a640c23a62f3a-b9a542719cemr461688266b.47.1774526153378; Thu, 26 Mar 2026
 04:55:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
 <20260316-uvcdynctrl-v3-3-19cd4657e1f3@chromium.org> <20260319013657.155efeb0.michal.pecio@gmail.com>
 <CANiDSCsBjgZL0MGFgkDzbTaJ03hE0gZbV3tu3fKo7k6KaAcMZw@mail.gmail.com>
 <20260319120856.09f2f15a.michal.pecio@gmail.com> <CANiDSCvw8+KAbrqqSr76eLpdyMoG_o6miy_nGEyS6bRqR4j0PA@mail.gmail.com>
 <20260324130713.5c9c3633.michal.pecio@gmail.com>
In-Reply-To: <20260324130713.5c9c3633.michal.pecio@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 26 Mar 2026 12:55:41 +0100
X-Gmail-Original-Message-ID: <CANiDSCtG5GBX6JL-OxpviD8vVdf+3q8TvsvHRRh2MVha4sVJxg@mail.gmail.com>
X-Gm-Features: AQROBzCcT3XECU5Iu-CGqCzk6rLSclQQSyag8sP-mWZa943uBv1mFIp1bJCElxM
Message-ID: <CANiDSCtG5GBX6JL-OxpviD8vVdf+3q8TvsvHRRh2MVha4sVJxg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] media: uvcvideo: Introduce allow_privacy_override
 module parameter
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35505-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5B36D334C65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal

On Tue, 24 Mar 2026 at 13:07, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> On Thu, 19 Mar 2026 12:43:21 +0100, Ricardo Ribalda wrote:
> > > > We can then decide if we need a specialized API for their use
> > > > case or a Kconfig option, rather than leaving the current "anyone
> > > > can turn off the privacy LED" status quo.
> > >
> > > Why not just add the specialized API right away?
> >
> > We don't know the exact use cases yet, and I do not want to design
> > an API without understanding the users for it.
> >
> > At this moment, we have only identified these usecases:
> >
> > - Disabling the LED to avoid reflections in glasses. (This is
> >   generally a non-issue with modern hardware).
> > - Baby monitors. (I would argue that physical tape is the correct
> >   solution for a sleep-disturbing light).
>
> Indeed it was a rhetorical question, I suspect this won't go anywhere
> beyond the module parameter for lack of interest from users. Apparently
> it's a niche thing and it already works well enough for those who care.
>
> Kconfig could make more sense to exclude this whole "filtering" logic
> for those who don't care and may not appreciate bloat, e.g. embedded.
>
> > I rely on my LEDs. I know they are wired to the sensor power supply,
> > so the LED is definitely on when the camera is in use.
> > I want all users to be able to trust their LEDs like I do.
>
> This is objectively impossible without a soldering iron, and trust in
> something that's not even real is ralely a good thing.
>
> Ultimately it's just a software controllable LED. Anyone can drive it
> through USBFS. You have a point that restricting this in uvcvideo may
> keep some sandboxed applications on some HW from behaving in a manner
> unexpected by some users, but that's about the limit of it.

Just one clarification. Not every user has permission to unbind the
uvcdriver and use ubsfs. Only priviledged users can do that.

From my point of view it is similar to the filesystem. "Anyone" can
read/write files (if they have permission) but just priviledge users
can `dd of=/dev/sda`

>
> And I wish that you enjoyed the same flexibility as those Logitech
> camera owners. But you wouldn't want me to try make it happen ;)
>
> Regards,
> Michal



-- 
Ricardo Ribalda

