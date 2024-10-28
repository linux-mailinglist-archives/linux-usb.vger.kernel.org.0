Return-Path: <linux-usb+bounces-16760-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF3F9B2906
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 08:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D36AD28247E
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 07:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8AC1CDA17;
	Mon, 28 Oct 2024 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B47eAuC+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D969F1CC8BD
	for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 07:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730100842; cv=none; b=We+vONiei8mneDQsEWyveiT2fyJ7lDp5xIAvhe4F6TR48E3YDBI2V8876ss1ImI4NqmzDXTHlD86Kby3hTX3ifXcbLMlp9osVs+JrU77CiNSF4+2S/0ntW0fi4NYgGXP4/AmKxz1a0pYhw6s9ioqDlW4bfIyU/sAeDUoe5+c6mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730100842; c=relaxed/simple;
	bh=e4023iuyEreTqRfpqvBKHPMCQJ8IRDCxOmi1L0EASxA=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oNtHitFAlTyBvRcIxdtPy/zUohN7CAYc3D5QKnHlLkCmVlRTL4SyVdC6BVRg2M4mohQ7AVuV3ilAdT2V2mMbLCwkFpQWjHQqHE0D/WMGPt+L4ViUCk8Y/Lc7qCtXzE4xOC8q0yVWNJIqCrcmOfdEmqAIz/DQu1XGNTjaJFpIR2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B47eAuC+; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so33286041fa.1
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 00:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730100839; x=1730705639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4023iuyEreTqRfpqvBKHPMCQJ8IRDCxOmi1L0EASxA=;
        b=B47eAuC+o4NtZwfpTUqH4UyrNSRaz3ObaR/TwEkmQWqorBwBOIncUoZe0Yb1/BwERS
         3dFCd2tTkT/dIa8uOuj6/D/OU9jME8HNMhRyK5L87YPKTGsd+xc2yaFaBL150Bs5WEXQ
         i7fMuYWNBYWYh6os2rhKuGaeHegM9BfB9xzsolsHFOXI1TdxEOldUSeCHxkx85UmwGtX
         RSUbVXSnryukHtIy7URR0gBu5ItGPi2CetZD0xyBf0EoFhbF6MZmy7KPz0I8MhX5bj/M
         +E2Xb1saowjyFieb8RKcTa5ojKVV1vPBR87BM6zNPAZ8/ZGvvOhnRagjNC4Enxh+7gTy
         OzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730100839; x=1730705639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4023iuyEreTqRfpqvBKHPMCQJ8IRDCxOmi1L0EASxA=;
        b=vPYdzyGFaeDGFXOJLaXaCQaWGo7Wnzb5Ug8UTqV4615tekGahTMw8f7JIkCRiM3pQK
         Uk/aeuCafcDa2Ee8/qHlQOEvjOQMe82IJcVVcqFalUTpxuwp7WvskiNZYLthQ7qW/TrY
         ECVjvTyuPg5yc0scqits5RLoBxhmc1a8Yxokv7BMOogczCsmsCW0ijFB3UBLO2EUvaom
         rNdTBOA/qITD5pc8rIGU1rYt4lSKAUZGpQrpah2Ab+BqWXWEa38injSFS5vkvIEnL3vF
         PBCcGbqqRtV0TjsmWIQ95ko1OrXrczK8uEcBKccVOelp5f7loaUzHLjg3F35iMAQuh0n
         yXuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdKwxPvoTl5Le1c/KZSMLZPRDJ8uDkcjfI0MV4blPk/WOyHnOxqdICRBBHEqXGZOc6R9xYs/qvEhw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi9JFO5U9+A3frIYxT+yRiMGkNnIpVVMnE7ao42KzpxzgdDH15
	U1PKyKk2bB0z7uZZx1KqJ7+ZMWUyAERxbck36NRBe65Qe1JSnTrh
X-Google-Smtp-Source: AGHT+IFcZK2WIklXECYhhw/fsNzOtOpit5qX/uXDjS07LXt+o6XU3x6ScBi8nW150JaLz72l6OQu7A==
X-Received: by 2002:a05:651c:2114:b0:2fb:5035:11da with SMTP id 38308e7fff4ca-2fcbe07881fmr25103481fa.33.1730100838558;
        Mon, 28 Oct 2024 00:33:58 -0700 (PDT)
Received: from foxbook (bhd254.neoplus.adsl.tpnet.pl. [83.28.93.254])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb451a2adsm10860881fa.49.2024.10.28.00.33.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 28 Oct 2024 00:33:56 -0700 (PDT)
Date: Mon, 28 Oct 2024 08:33:51 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] xhci: Fix the NEC stop bug workaround
Message-ID: <20241028083351.655d54cf@foxbook>
In-Reply-To: <20241025121806.628e32c0@foxbook>
References: <20241025121806.628e32c0@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Mathias,

I would be grateful if you could take a look at patch 2/2 and tell if
there is anything obviously wrong with this approach. As far as I see,
it should be OK to just call those invalidation and giveback functions
directly from xhci_urb_dequeue(), and it works for me in practice.

Regarding the probem with xhci_invalidate_cancelled_tds() being called
while Set TR Dequeue is already pending, I found that it is much easier
to handle it by looking at SET_DEQ_PENDING and simply setting all TDs
to TD_CLEARING_CACHE_DEFERRED if that's the case. So this is solved.


However, these patches still don't solve the issue of infinite retries
completely. There is one more annoying case caused by halts. It is very
poorly defined what happens when a halted EP is hard-reset. Usually Set
TR Dequeue executes afterwards and it restarts the EP when done. But if
it doesn't, the EP stays stopped until a new URB is submitted, if ever.

There is the EP_HARD_CLEAR_TOGGLE flag which is set until the class
driver calls usb_clear_halt(), but it's neither the case that the EP is
guaranteed to be stopped until usb_clear_halt() is called nor that it
is guaranteed to restart afterwards.

Actually, I think it might be a bug? What if Set TR Dequeue restarts an
EP before the class driver clears the device side of the halt?


I'm starting to think that it may not be realistic to quickly solve all
those (and possibly other not known yet) problems now. Maybe just slap
a 100ms timeout on those retries, add quirks for ASMedia/Intel and call
it a day for now?

Regards,
Michal

