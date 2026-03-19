Return-Path: <linux-usb+bounces-35132-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NhcCprau2k6pAIAu9opvQ
	(envelope-from <linux-usb+bounces-35132-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 12:14:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A79822CA1FD
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 12:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6593631DDE33
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 11:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7A03C6A2A;
	Thu, 19 Mar 2026 11:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4ObFGlR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE4E3C3435
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 11:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918544; cv=none; b=c9vaIs6j9JHCnIG6LWxKmijrNpVjkIxKBh4PBjVxh+5Ks7kOf5sRcwavsHS47CKdfCosVpT2ZgnK5GvAPmoHA9fj/sKvCuw6+j8xtHvgKXCfAC44UIhWQ+wXN2iLGC1663Jum//Li6O/dPMyLg8W7yx0zGirmIXMfDBm8MpgrDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918544; c=relaxed/simple;
	bh=5upsHrtLRI0mBKjKLI5yL6bcYwkktIIBzTewjQcRaOw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f8SW9t/HAAzQ5ddM9f0ANyuUM7hQBR58wknE3GQPw0cI3tQsndPCD8l0qKgAZ81M23Rw3bj9wNcPRsRWkhPLBrd7yJiSMYYESxgy2LFiFXyG1fqbf6tFETnn9FA9VR+CNp3uxcEt/yk8JD00fr5PJ8pCCOiW+5052KLMZOfvbd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4ObFGlR; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-667de793310so1476353a12.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773918541; x=1774523341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JRXc+Q5SYxlCa27iykSk4XXCHPIaQz6hns7kejM0Po=;
        b=b4ObFGlRPMtG1Q9Y4B1W5oLBqI6NVyX/N3xEUZmC2ZuIOq5q89OVuCbdelnAu7+4DJ
         2rGWEETN5EpsT1M5ab4nn0Rz55ZHJxuALdZw5q4qP7s7usIeK3Cwli4qLQEEsv45kjGg
         6jmBfHGehwSl2LSXlxPzk0tltyGmLyMBlcdabC+UO7wAgYiFxL0Rb92u7+Pipi9mLPqy
         VIm8BWmDpVF+V9OtED+7BTcfd5z5op2zMzPmx+rL48+mDMjoGvsBE7fXd3opWMyklxkq
         yCctd37xGxTlR79VElS/t/moZR4uzMEX/LsDMIHd3wNkmy7KsO73+0g4Pn+oxMafVObr
         L6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773918541; x=1774523341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0JRXc+Q5SYxlCa27iykSk4XXCHPIaQz6hns7kejM0Po=;
        b=To2M167Tq89DMzWyF2eqyaoO58GOVDiiuptt0XBf/eI8/6sl1+/LOcNXxYuPQyxi74
         h7aJ4dfjlfEIJCdw0zh7AFq+xWRqjflYrXuwmLogGSdj7SzCEfFyJEHyUWjqFkSwbMhS
         4NvgVtcQWXkDhQWPFshQ4Wkn2qifz9rFo0G/0AOq0BEkNcEWj3bgNICWDt5pQFjb99KT
         1bqnrUEbqSZJ4ivnNceikYoEbZyboAvQJC4hfqwIj7/fwFGPoLuX9EUOwaT4Y4oie3Jp
         pbbNcBJjt2LjNcPO1h449Y1mP0YuztKIbvgImqW06r2CKKEvCpqc1kE/LH9bNJkBoWq+
         c5ag==
X-Forwarded-Encrypted: i=1; AJvYcCV8wnxWOCnyO7iU0iEFy30HOI0+laRMGMz3dCfqg326a7wIQ6zc68oT2XlfAmULFdihHF9EJ5h3KEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXZ0zITXsvRiNbogLtEus9DhMNAw0sGH5ZZ68a2vEChonKVglR
	c7Iy3QOVGjIhKU5E/2Ur4wY5t06O9wTTizhj2O4KEhj2aSFMVWokEDtL
X-Gm-Gg: ATEYQzyB4BaGE5gcD5i50VrwQm76OXi7++Q1e30mxX/wb7p6bWLwY1X1w5TKzAosNiz
	GhFK2HajuIGjRXw43tCZspAoq9bkifjcKgXp1vuX1gcLZ0Gym/di/l63RV/YASfBwVoRR6CBU/R
	B/kGt1ITfpduiAkxSXB1Gb3m2rNAx7On5Mjmo1B+0ju6rdIW8Pvt4FomNv/5gEQSCuXz4BkXzRM
	nkauA7rU9OpDTs+rdDVi/PKxJrPPxQg4B5nlJHpEtV3t7f1JTMRV9aGlleOXvbgnqaO4YbqSKEa
	0nTiMsCh85yWVAxkP5HtmeVS8yH6neqZ+Z/vmXRNNZYrH+/TRrZYHpC06P72YrHjleWwvsKCc4d
	cJvxFcc/8+r3wNX/7tMR2d/mcQaOE9OdzNvH2//Jrsj9zStnZ6/kR3EWMyIcSBmswp4hPM8zIjP
	UQXyvE/q2VujuS1iwYhuO6makCjn2IS/2lQ4c=
X-Received: by 2002:a05:6402:13d1:b0:665:1c94:320d with SMTP id 4fb4d7f45d1cf-667b2733215mr4466539a12.18.1773918541213;
        Thu, 19 Mar 2026 04:09:01 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9849sm3367540a12.16.2026.03.19.04.09.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 19 Mar 2026 04:09:01 -0700 (PDT)
Date: Thu, 19 Mar 2026 12:08:56 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/4] media: uvcvideo: Introduce
 allow_privacy_override module parameter
Message-ID: <20260319120856.09f2f15a.michal.pecio@gmail.com>
In-Reply-To: <CANiDSCsBjgZL0MGFgkDzbTaJ03hE0gZbV3tu3fKo7k6KaAcMZw@mail.gmail.com>
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
	<20260316-uvcdynctrl-v3-3-19cd4657e1f3@chromium.org>
	<20260319013657.155efeb0.michal.pecio@gmail.com>
	<CANiDSCsBjgZL0MGFgkDzbTaJ03hE0gZbV3tu3fKo7k6KaAcMZw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35132-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.976];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A79822CA1FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026 10:56:59 +0100, Ricardo Ribalda wrote:
> The goal of the deprecation period is exactly this: to trigger a
> conversation before a permanent block.

Most users will just curse and edit their /etc/modprobe.conf. They may
post a rant on some distro forum. I suspect no one will monitor this.

> We can then decide if we need a specialized API for their use case or
> a Kconfig option, rather than leaving the current "anyone can turn
> off the privacy LED" status quo.

Why not just add the specialized API right away?

I believe users affected by this regression are already known,
ISTR some negative response to previous iterations of this patch.

Kconfig option sounds crazy, who would want to rebuild the kernel
for this? Depending on BROKEN is double crazy.

> The attack vector is that an app with camera access, like your
> browser, can record you when you don't want to be recorded.
> The LED will be a signal that something is happening.
> 
> Imagine that you install a Flatpak for live streaming. Assuming the
> Flatpak is properly sandboxed, remote code execution is less worrisome
> than the app spying on you.

Theoretically yes. But also nobody should rely on those LEDs.
People who care ask HW vendors for physical switches or disconnect
the camera while not in use. I have seen black tape on laptop lids.

Are there more owners of affected hardware who want this code than
those who don't? Maybe it could be a Kconfig option for them :)

Most of my USB cameras don't even have activity LEDs.

> > So it's not removal of some controversial feature, but 3KB of extra
> > code in everybody's kernel (I just applied this patch) and a forever
> > game of whack-a-mole with HW vendors? They will win...  
> 
> Maybe I meassured it wrong. But I can only account for 1.3 KiB

I simply ran stat uvcvideo.ko and calculated difference.
Could be a matter of different kernel configs.

> I see no need for vendors to hide these features, they simply added
> them because an OEM thought it was a nice feature to have, or because
> they left them as hardware debug features.

But how will the kernel know about those random debug backdoors?
It just seems that whatever is discovered by users and becomes popular
enough to reach linux-media, will be getting blacklisted and broken.


