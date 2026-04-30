Return-Path: <linux-usb+bounces-36801-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEAVOSPB82mw6gEAu9opvQ
	(envelope-from <linux-usb+bounces-36801-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 22:52:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FD84A7F1F
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 22:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE29B300D150
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 20:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B233AEF29;
	Thu, 30 Apr 2026 20:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIYlj4AI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9992D0C82
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 20:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777582138; cv=none; b=eCMnOYRRUqKXPtBL/K/Cc5MkTnE7V6tvZCE8jXnfSfrjQivEIGu+8uidHUbewQlu1ZHSYjftIBtg9P2DgnuOXECj5s6mHMdSplUgoICzQYkc/NN/c9pS7hAeY3Y8diLNcbxyIHsAfqlI8v3LvBhmIWnhwHckXcd5YUBKhc9N16s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777582138; c=relaxed/simple;
	bh=0aYvI5HJx2a7Ye/kV+wVSKCdA0MdaGoGJgH54BhO0Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mFJuKnahk67KUgHU0mSjXMHca3eKsY9kJMsEaKOH33FryNC0R82eSKyXlwXnQZ59lZJFh9HpbFipTi5BQMI8rs0fOCMvS1+eGGryPNBYeBdAPB0rtAVgP862+u3p5BZzdREq/L8wo7s7E5UBf4Jx9ppv9s7ys0PiaH0oyY3vpIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIYlj4AI; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38be5e86918so15214421fa.3
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 13:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777582135; x=1778186935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rC73R2jno3BsE6Xg9/1+V+UkWHqOyAMiHRyysx7QLyw=;
        b=tIYlj4AIR1na9BZ9ZXYo30nuKAAFofpUbDBpBFPI9KJiqasZtvhq1GtCmctoXAUQjU
         c4Oen961tgYBfWhgTINhpAnZji3T9KIdbmk5k3cY4TRgDSACLZGdncdPi8ynvGZxmXfu
         bs0GNEw6nnceDdYn6KYjyZhNzz9wY02Pws4S7V7l7eWqEuAwYPXlaNHpFNZ+gg+eFwP8
         B+Rac9kzr0wGx9cLSrV6a9Ns1Hn2hw1kQEbEZzWw7jEJNZew8n/lLiga27lQpLEQoLvg
         jW3MsYPbYbnlV5COHPqxuJpvxhIkctA+akjtqbpKdsPYOiz+neGXbfaldR57/M16BFur
         dn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777582135; x=1778186935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rC73R2jno3BsE6Xg9/1+V+UkWHqOyAMiHRyysx7QLyw=;
        b=Arm9p9vA/ohP5RhsUCk6wF7WF4N02IywWQWtGkMBQCjRwd1KXYK7iYrnhpVppNMEjW
         14pKyJV3nthdxkb/xNbUyuEEFQ+x+IrUz8YfSJyYd0Zag0ntThvnpXjzI+uX3Z2+W+Uf
         nX501m6fbFimphGWjCAbNd0GAudOtpHwLD9ZgcC7e/yGEWg/XiFz6GdbobCnr//30gtE
         4WYIAizLRmh0ELPwbuK/A+ySVG8MnwG2Mp+D41Ie2MQytTOcFjdmZz2nUjhSzch61vMb
         12Zqvv8LrmTt/LPEXVjX3s5g552EGKu6Jo8xWCHmI59SzMag5XbRlmoGF5ph+PoEtzAJ
         8t7g==
X-Forwarded-Encrypted: i=1; AFNElJ98b6qBgDvJxa/76KHSlBE5bbKFu+N24AX9O+w9RtQeqOGxNpEL7r4ns8FJy4s0wmkBI9383KNtSQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1gtx9CTVrAE8t+XtAWIgppJtBTMoXh6a89tUA7e+OkTWwweFh
	isl0tGeI5k9JLJwgYPv55/TX3O7IBKaynO796z/Lnv8ifrNyMv03oGIL
X-Gm-Gg: AeBDietjmCHqZ0doi86H02CinVAG4K76A/qjxvFAE1dPtf05xq/HgKkeBpXNHiZXxV1
	ikVn1Xvl+b7IXOTTPCHLtJgN9SA0OaYoeSUzJ668sjNu5SZaOUmdAx3nhpEV7xfP3ANGBAMBhe0
	OgzbvURzfJQkT2xJKEe2UPn4MSF7N53KnrBx9xyqd4dUnSxM14RPEjYMUcfY+6AmQPax6n0ENrL
	ddMqm6ee5Sg22C3KQ4x4kgNcHzZMvGmPBYhpEsTLutI0MD4vviQgpJfg/uTRtO1KQZDAvAo/GeT
	yftHzLcrIFEBy7vscXcSvVJ9OQkv2iMaNeKASbCDjk8ew3xdxwiyzDeJs85BZTCG1+CN717JV1X
	OtwNpRh+5/ALVG5ALGUQR1maeTP4Xo2KzPUn5h/9/Nogn6Dj7i1gHc/kjtsWeslh3QYCQyhQKTi
	g8J9G4BffNFPbxigKqSr3B/JXtItzrLbz8qYF2SD9kY6w=
X-Received: by 2002:a2e:a54c:0:b0:38d:e977:5533 with SMTP id 38308e7fff4ca-3934e26fe64mr16249081fa.26.1777582134864;
        Thu, 30 Apr 2026 13:48:54 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3936108fb80sm2811171fa.6.2026.04.30.13.48.52
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 30 Apr 2026 13:48:54 -0700 (PDT)
Date: Thu, 30 Apr 2026 22:48:49 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Heitor Alves de Siqueira" <halves@igalia.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel-dev@igalia.com>,
 <syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com>,
 <stable@kernel.org>
Subject: Re: [PATCH v2] usb: usbtmc: reject invalid interrupt endpoints
Message-ID: <20260430224849.3322afb0.michal.pecio@gmail.com>
In-Reply-To: <DI6PD3MOZAXW.RNUBKGQG1O6M@igalia.com>
References: <20260423-usbtmc-iin-size-v2-1-31afa4874f71@igalia.com>
	<20260424002839.5ad25517.michal.pecio@gmail.com>
	<DI51WD2C7TJF.1X6B12NO0OO4@igalia.com>
	<20260429001626.2f08b991.michal.pecio@gmail.com>
	<DI6PD3MOZAXW.RNUBKGQG1O6M@igalia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 52FD84A7F1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36801-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,abbfd103085885cf16a2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Thu, 30 Apr 2026 15:31:55 -0300, Heitor Alves de Siqueira wrote:
> > I think a minimal fix which mostly preserves existing behavior would
> > be adding "urb->actual_length == 2" as a requirement for all USB488
> > notifications. Then any truncated message will be ignored and logged.  
> 
> Yes, that's my understanding as well! Although I don't think bNotify2
> would ever be zero in practice, this sounds like a good approach. I'll
> submit a v3 with this change plus the endpoint check from v2, hopefully
> that'll improve things for these edge cases.

With actual_length check, wMaxPacketSize check isn't critical anymore
because actual_length won't exceed URB buffer size.

> > wMaxPacketSize is a separate issue indeed and it seems that a USB488
> > device could legally set it to 1, though it would be crazy. Your v1
> > patch would probably make such devices work, if anyone cares.  
> 
> Honestly, I'm also more inclined to just reject endpoints with this
> configuration. This seems like a very niche edge-case, I'd be surprised
> if real hardware operated like this (famous last words? heh). I'm not
> sure if this would even be valid/legal, given your previous point on
> bNotify2 being one byte.

USBTMC spec refers to USB 2.0 section 5.7.3, which states that an
interrupt transfer may take multiple packets until either the IRP (URB)
is filled or a packet shorter than wMaxPacketSize (possibly 0) is sent.

So slow, inefficient and unlikely to exist - yes.
But illegal - not really. Such endpoint can deliver 2 byte messages.

Also, a non-USB488 device may be sending different, very simple 1 byte
messages, perhaps vendor specific ones. None of them are recognized by
the driver, but other functionality of such device could still work, so
rejecting it is overkill.

> Considering these devices do not work at all currently, checking if
> wMaxPacketSize and urb->actual_length are big enough seems like a
> saner approach and won't require bigger changes to the driver.

The only change to support USB488 devices with wMaxPacketSize == 1
should be increasing URB size to at least 2 bytes. But I wouldn't
bother when no such HW is known to exist, and surely not as part of
a barely related bugfix patch.

Regards,
Michal

