Return-Path: <linux-usb+bounces-35388-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOpIEH2BwmlneQQAu9opvQ
	(envelope-from <linux-usb+bounces-35388-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 13:20:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C198308117
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 13:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80828304196D
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 12:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262683F20EE;
	Tue, 24 Mar 2026 12:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZR90S3Rz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9561C3F1646
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354045; cv=none; b=piKSTo7JbkniXbpTGYjox8jJZOgpyoSZD6D+KEpZquJ1JLcMFNLoqIlyuBYzBepEOgG2J/dk0Oz6n88fnSFO9lTJIqtnYdsEZoB37c0sA4TgqnwrC91G94WYX15tMddSbfc4tDOmK90AjkjpozKFHqdOWX74y9o2oDYKOelbDKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354045; c=relaxed/simple;
	bh=2G2a51QCI8K6f2AwRf56MeFUJ5650ustP3qdsf8Veo8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ehw4kEsTkocgzzpMY5cfPg2scp4ttNU9jUvW5R8wdJHn2IkjLbRAIv9+L6AWh/QkzBqSGCnQhxsMlzXbLTm0lnYTQA4+v72EML4qo+5v4YODzIr/9eaETTOikCrjBZUtSWdgdT9fYvMn7kbI8mHLMPSznziZeJpMYMelfvuBwes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZR90S3Rz; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b979d16dd0cso773610366b.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 05:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774354039; x=1774958839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wv+DLyB0PVqSatPGWYmQ5Ga0Kax66FYWMD7mQDfKzI=;
        b=ZR90S3RzL0FuGJmBbP13CsLxglC+mh+PAWa0BlVIv39dZ2ZNo3jqwXgoDYCPtV9vJy
         k2UEKn82B0qgYDOursZFN15cZbQvjJzT8TtcOQPBTrFI7+vR8k8Cdg/CDcb67avvPvjI
         KQ6IEKc5xokmhKlJGKXGKLZWM6Tq9vOaOQvjMdRf9InizGaR8k6ID0uXyqchw+aulotG
         pML5Wx5TgB9UuCLYtM01z5DCq8xxkNjvtaD8JfbfjkkOnaNxOGz/SWnSjqEDtMt9dMMN
         MqF9K21/H5KgyVjauxA2aZPCgHbU09RKASKPb6tBCeD8BivBVV2QN5zvAVDwcl6p78lA
         Xz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354039; x=1774958839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1wv+DLyB0PVqSatPGWYmQ5Ga0Kax66FYWMD7mQDfKzI=;
        b=h/wuCdrFUL5Pdc4jUmnAwNEZuSQzAj/RPZ0Ql3tZr5Q7bmNGPxM4Ldt0qd4JoeWGxp
         gPXrsx55tgD+EH0YBTTXOeki8knck7PasGIH7YIZd9N89J9+HBxjQQ7CfOMHmxI+we61
         HpgWm+UeI8D+DR18vcBnFMrFgl5QnG8dfPcj8vKaha4681qjr8p6Mhi+0/cbY+K32nvi
         PTnxyi1iRkwzqLbF7D5C7S5DgmQibQHtFivmCX1O6FVo2ozK8IRIxgUhv/EFF3UbbaXU
         v52c/+kLOQceiJ+UB3HCKHoPA97Lw3t/4WRwDvGm7CXl5MyLiwH5cCsGEvQdJjDiDEDf
         6Xjw==
X-Forwarded-Encrypted: i=1; AJvYcCV2M4mItLcP3c4iwcSgm55R7aDGs3q4klnw620p/cG51axZ4TqANReFU48iYMcspB9LJlQu+u/HDys=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUR/8DDACj6ooTvjzV09VaaDvf1OzEAEda0Gos14be5fRxkzhf
	fqK1JCW+rEEaVznbeZmP/rUJgnWFscAdAGsoLBFCpu/z+SxGcJ1EpSiC7ZmIlg==
X-Gm-Gg: ATEYQzyDAfBZES7NaBD/4KSQ/1iuvEiXNn8c/fkCdOu6pedkTtY92uz/t89lw6txomI
	je2cFPORfOWu8ELi1bAtZum5iL4XIPi4m+B0FhQJXv0Nr3Ghb3kBjOGvg2vDM8iF1V4NBcx0LWx
	v9RvKd2pbjpPmLGxcuNHyGE8Giichi4Mo+7fXAKldy3NXCr6sw8a9aZ3T5mz12hTwLJWchNHHg/
	nhvv86+p/3NmQQzJ5GQnTSgH5++s7HogX21UemzQYpNuTwMLbtvb/ZNdt/7Wv2492igkKZY3Az2
	0azivo5FFDki3cXgEqepgPW6jeO/c6oNDk3LjPp33zkwjRB1WoG+SvfSAwzFzQ9LaX4oqJ8nUEO
	O2IwmfisGyQgPW8gbIH88Jit3ojT3qHN52Rbu40P5oNdxSHMxQI1oJ9FbgkfjxLRdLfaOLXARoD
	KtCYiOIA7yUx6X7/wFmW7jrgd2Y0rjyi0lmtw=
X-Received: by 2002:a17:906:6da:b0:b8f:a174:3186 with SMTP id a640c23a62f3a-b982f3e783dmr947383166b.57.1774354038059;
        Tue, 24 Mar 2026 05:07:18 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de16csm643772766b.41.2026.03.24.05.07.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 24 Mar 2026 05:07:17 -0700 (PDT)
Date: Tue, 24 Mar 2026 13:07:13 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/4] media: uvcvideo: Introduce
 allow_privacy_override module parameter
Message-ID: <20260324130713.5c9c3633.michal.pecio@gmail.com>
In-Reply-To: <CANiDSCvw8+KAbrqqSr76eLpdyMoG_o6miy_nGEyS6bRqR4j0PA@mail.gmail.com>
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
	<20260316-uvcdynctrl-v3-3-19cd4657e1f3@chromium.org>
	<20260319013657.155efeb0.michal.pecio@gmail.com>
	<CANiDSCsBjgZL0MGFgkDzbTaJ03hE0gZbV3tu3fKo7k6KaAcMZw@mail.gmail.com>
	<20260319120856.09f2f15a.michal.pecio@gmail.com>
	<CANiDSCvw8+KAbrqqSr76eLpdyMoG_o6miy_nGEyS6bRqR4j0PA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35388-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7C198308117
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026 12:43:21 +0100, Ricardo Ribalda wrote:
> > > We can then decide if we need a specialized API for their use
> > > case or a Kconfig option, rather than leaving the current "anyone
> > > can turn off the privacy LED" status quo.  
> >
> > Why not just add the specialized API right away?  
> 
> We don't know the exact use cases yet, and I do not want to design
> an API without understanding the users for it.
> 
> At this moment, we have only identified these usecases:
> 
> - Disabling the LED to avoid reflections in glasses. (This is
>   generally a non-issue with modern hardware).
> - Baby monitors. (I would argue that physical tape is the correct
>   solution for a sleep-disturbing light).

Indeed it was a rhetorical question, I suspect this won't go anywhere
beyond the module parameter for lack of interest from users. Apparently
it's a niche thing and it already works well enough for those who care.

Kconfig could make more sense to exclude this whole "filtering" logic
for those who don't care and may not appreciate bloat, e.g. embedded.

> I rely on my LEDs. I know they are wired to the sensor power supply,
> so the LED is definitely on when the camera is in use.
> I want all users to be able to trust their LEDs like I do.

This is objectively impossible without a soldering iron, and trust in
something that's not even real is ralely a good thing.

Ultimately it's just a software controllable LED. Anyone can drive it
through USBFS. You have a point that restricting this in uvcvideo may
keep some sandboxed applications on some HW from behaving in a manner
unexpected by some users, but that's about the limit of it.

And I wish that you enjoyed the same flexibility as those Logitech
camera owners. But you wouldn't want me to try make it happen ;)

Regards,
Michal

