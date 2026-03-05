Return-Path: <linux-usb+bounces-34038-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eD/vA0YDqWlW0QAAu9opvQ
	(envelope-from <linux-usb+bounces-34038-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 05:15:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9630E20AB4F
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 05:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B11AB3059806
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 04:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A13C277818;
	Thu,  5 Mar 2026 04:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wx2HB8S0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED012222D0
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 04:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772684098; cv=none; b=Zd+AuOHpIWybzmBkrsAZLKmV10CEuAD8Gizu6RXiv650zCY2VLC8m1PBRCu0nwco3v7T6Yn2yOSsHRVCuG/LHlnYuJdBzOOZXmgIZNoZkZHZWVz4gnYjyPr2GwGhM89Sl6i06KRZe9K1b2QkWV3hDRKUQwHh2n8url8iANuDpcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772684098; c=relaxed/simple;
	bh=PbjHTwrWY0E4cnWo2pGmkWXHJVjIxFzRV3NIR8PPUwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I84LVly2OGww6Qh1nPQE5ESovYEOEqmu2tYu4Ra9J9vIv/bEjXK9yKa1eqd202AM5J21NReiIpfNFfubW8azAphEsap+rAHtgS4mnXC7GTrmMZ+3+ENqTCaakMUoRgO3Py8vEb0E7azcUs0ImraBh4XSrIT58JRGvyzrfypBTns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wx2HB8S0; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5688c221fd3so3426479e0c.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 20:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772684096; x=1773288896; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7XVJmgMFfGy7rnDyOtBDHB7aEliuxFeOISS+j/pH0oI=;
        b=Wx2HB8S0eSBjdhyEqGQNN6G+je67fpY8zkiWiH+kWDbadi096INGrxoaeOO/FFggnb
         Ps0dWwCtCVKP/09jFGbHrrC+8onjWCqdDf4R3XLjObMEzHe6PRRf7g8+aHBAKlmoBKLM
         06Snc0JjEIQ3tSQ4fF7cqtzjLJ8eW3b/CPxTVhT/toAZw1m1B6ApS2TRFR9b4mfroPqY
         XAipD2sIKwRA9pSGfyu8bRak0Ay7T0k/6RPYNpztzrsE7WDpMKh4r2Pkmt/khAAN5xp9
         hN6qiG7vzEe/t2hRsmAx/WlOaYL99Vdp+YnRyAHN1Px7EuxUSu0FR0VATbeAc97Eqqen
         TLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772684096; x=1773288896;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7XVJmgMFfGy7rnDyOtBDHB7aEliuxFeOISS+j/pH0oI=;
        b=dvgiBpXmuPyuJKaEWr9tJVfiA6liBJwWpurlWWibW/DETXxocKX8ShmqoOUTO8L7Dz
         bYxvAX3xlYA7Lw1dqj45Dm05RACO0N7anWRL/D7zBck91OiXwDGgL4Gzvlob9x5fQ9Et
         eDao5iK7henI5zwvvsZH5sCDRlg0gSzzO9fu7l2DKh9NzaMlnciganzNRxZpRJ3iyLgo
         tQWJ44hB+umm2F6ykTu/uNMAicBUbo44sgBX9W6XOoa49pUIlybkfPnLQSrJzF9yksqw
         4XSH1+YzKBOSJNmsJeWyz7bcQBskOyTubQ4RHtD7yXKH3iNM2jzKoyj6obAMrJCZdgwH
         Gr4w==
X-Forwarded-Encrypted: i=1; AJvYcCVhTu3lkCi90ogK0e7u0wpuvzT3Wd7JhTySTTPDao0IpyjDxjpUwuLHOoECLqMT7ce5cQRzR/9rewo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOQgommMXEDaIh5LxdhvZrGg2GpQjKCJdO2i9nFKqP/Caiu3H8
	tMAX8532tP/m1jbhWfju/HqBIeqaYGhXfQuJMR8nxUhzus0LR/9sL7bulTpvMw==
X-Gm-Gg: ATEYQzy9suTe3hUsSB/y271E35q/3Bk0LZpzBp81ynMEGOkKVEea101qKFjazHUy6sB
	twiWSF45ZWZwseIb9C0lq1+QUiWH0zGaW67scQ6mHazvL82iPkJH5Mxz61ktJGEoS+hdAGA8vTZ
	WFHgdIQFgU3mzpyUJ8ciw+327fB9x7MCKs+GDa9UHShzYG9KpXu01fKCvY8LsUQRtA4lNOw666O
	hXWVI29sL7XEnB2JyXjR5smqy7QA+m3hHx1rqP3cHH0TyC5BC8mSLIVjk4vNbjPa4SQPbpa7mly
	dvKdTeQUCOVq+122dS6XdaiVAyMmuTcLwyw/+IBGo1zYWYIiLMS9Wi5+1rQEV0dC3XImtlE8jBH
	yB4m4SPwUie2NwwZuY5DC2pyanZiOiwS5iyBbDHR4kxV9GFofutlTLkksrV/nI24A8Mzqxytnwy
	s=
X-Received: by 2002:a05:6122:d13:b0:56a:f979:a9d1 with SMTP id 71dfb90a1353d-56af979b07emr54559e0c.1.1772684096328;
        Wed, 04 Mar 2026 20:14:56 -0800 (PST)
Received: from geday ([2804:7f2:8080:fd2e::1])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56aeee6eab5sm3099953e0c.8.2026.03.04.20.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 20:14:55 -0800 (PST)
Date: Thu, 5 Mar 2026 01:14:50 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Federico Beffa <federico.beffa@fbengineering.ch>
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
Subject: Re: USB Audio: AlphaTheta / Pioneer DJM-S11 (2b73:0037) fails UAC2
 clock enumeration
Message-ID: <aakDOsBgrsyL6ujD@geday>
References: <b59edf1e-3735-4d16-84d7-631bc0ad81da@fbengineering.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b59edf1e-3735-4d16-84d7-631bc0ad81da@fbengineering.ch>
X-Rspamd-Queue-Id: 9630E20AB4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34038-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geraldogabriel@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Dec 23, 2025 at 08:48:49PM +0100, Federico Beffa wrote:
> Hello ALSA developers,

Hi Federico!

> 
> I am investigating Linux support for the AlphaTheta / Pioneer DJM-S11 
> mixer and would like to report the current behavior and ask for guidance 
> on possible driver or quirk development.
> 
> Device:
> Vendor ID: 2b73 (AlphaTheta Corporation)
> Product ID: 0037 (DJM-S11)
> Firmware: bcdDevice 1.05
> USB speed: High Speed (480 Mbps)
> 
> Environment:
> NixOS 25.11
> Kernel: Linux 6.12.62
> Driver: snd-usb-audio
> 
> Summary of the issue:
> The DJM-S11 enumerates correctly on USB and exposes AudioControl, 
> AudioStreaming, MIDI, and HID interfaces. However, ALSA fails to create 
> any PCM devices, and the mixer does not appear in aplay -l.
> 
> Kernel log shows the following errors during enumeration:
> 
> parse_audio_format_rates_v2v3(): unable to retrieve number of sample 
> rates (clock 1)
> Quirk or no altset; falling back to MIDI 1.0
> 
> As a result, only MIDI and HID interfaces are exposed; audio streaming 
> is disabled.
> 
> Descriptor observations:
> 
> - The device advertises itself as USB Audio Class 2.0 (bcdADC 2.00, 
> InterfaceProtocol 32).
> - A CLOCK_SOURCE descriptor is present (ClockID 1) with Clock Frequency 
> Control marked as read/write.
> - No valid clock rate list can be retrieved by the driver (GET_RANGE 
> appears to fail).
> - Audio streaming endpoints do exist:
> - Playback: 14 channels, 24-bit PCM, isochronous async OUT
> - Capture: 10 channels, 24-bit PCM, isochronous async IN (implicit feedback)
> 
>  From inspection of lsusb -vv, this appears to be a case where the 
> device advertises UAC2 but requires vendor-specific clock initialization 
> before audio streaming becomes usable. Without that, snd-usb-audio 
> correctly refuses to expose PCM devices.
> 
> I can provide the full lsusb -vv output and additional logs if helpful.
> 
> Questions:
> 
> 1. Is this a known pattern for newer Pioneer/AlphaTheta mixers, and has 
> similar hardware been handled via ALSA quirks in the past?

see sound/usb/quirks-table.h

> 2. Would it be acceptable to experiment with a quirk that forces a fixed 
> sample rate (e.g. 48 kHz) and bypasses clock queries, for 
> development/testing purposes?

Actually, for production.

It shouldn't be too hard to produce a quirk from the datasheet of the
Pioneer DJM-S11, and even if you're unlucky to be missing a few details,
trial and error will be your best friend.

Thanks,
Geraldo Nascimento

> 3. Or does this class of device realistically require vendor-specific 
> control handling beyond what snd-usb-audio quirks can support?
> 
> I am interested in starting development work on this (initially 
> out-of-tree) and would appreciate any guidance on the most appropriate 
> direction.
> 
> Thank you for your time and for ALSA’s continued work.
> 
> Best regards,
> Federico

