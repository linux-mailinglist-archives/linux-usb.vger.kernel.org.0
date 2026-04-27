Return-Path: <linux-usb+bounces-36578-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EI7lEq3a72mvGwEAu9opvQ
	(envelope-from <linux-usb+bounces-36578-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 23:52:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D4A47AF78
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 23:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8341B306AFEA
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 21:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171E239184B;
	Mon, 27 Apr 2026 21:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NH0RQa3n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D19D2750ED
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 21:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326747; cv=none; b=ny27GlbZHirrsftpU+AwXIyAmyN764y5epUV9tMWHzU0v0SLbMVBuIaxGtNgjkSaksnFoMs5mXwdfDfE+SHfgn2zyLqxRwD3LyVmIWUI0b/6tVOngrLIRcaNoZyLnwpxV5Uxtbz6VJ7HFUdQz19PmqfnavrchVAR6LnqpU4yR6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326747; c=relaxed/simple;
	bh=7P7VU36hQu4iMsGekLZKiPL3rBFQOW0TOaXA+fXfycA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KUg+bkNz3PNsID+LqtvEoHE2Sur0aNQjrJ7Tb7hwgiHTv/0J9D0srlCj/pcrFuOtmyuCZYrW5Tfwvhhryc9xwNG8nMPoevANjUco6/UoLFgbVsasF8SicespU6qE4UUG3QB+a/n7+XDeoDsr5nGtPh3IMm3/VYsojazh6nd8Fys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NH0RQa3n; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66e8cf72a93so13200550a12.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 14:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777326745; x=1777931545; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=NH0RQa3nQ3uyg+gIj38iYhfkKJaXQXJd5JtEjohwNyEHHtzQsZRivXRovcFpjLAbR/
         vuRfqvXSP9QgTautbAAy4/9EiRxlqgwlBI1gcfbW/aJ7PGSFInfhd1uXrmqJpGryeQlE
         chSY3nb59T2h8Yu3Rk8snYN2NzExsmuU1D7kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326745; x=1777931545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=O6a6vPQBRShAEH7nhPfkjKjppbrk6/2nBdrhr1RZxzRZD3tXW8HKSSnLuQi0PepZJK
         MFHk7vbSlBJwZHVEU+J01FLzvW6uWa2cFW29soMIxgtnbPwIOkf7pw/nOTwJY9TsmjaB
         jrC0E+yInmPMgIKxUDtfhNgNWf+5hk0Qtzb7QkEt/O9mGYsYR/zYl/0aKgu/2KLoka2m
         xBkNi/qaYf/3hcy18Ejp8jOX1Ij615GMy357aLclS99F/FWO6x+zREeSnErpcFAOkL8m
         utjn53/P0qPfn30nMXkCKk/XbnhSc3/3NTqsGMsNr5PHam/G8y7AFbaWAhBW/QPtf2Dt
         5pcg==
X-Forwarded-Encrypted: i=1; AFNElJ/CfRds1XVJJN3TTfvIcJIiI5Lhh0ZyVBlTAjBWglisc3CHiiWkeCtVfd3LLlEDY1SPxpTuB0yQYjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Erh/WwH1bWi+vRb2S8CaSot/VGHgBxql1J/+LOkIY4Li6Qpy
	OrA+dZwFfo/BD4WTHN516549WjRiXb2k+epQFW2H247Gsm09e7LaxLNXa16pQi+GcQr0jlrMMLe
	8l86yqrUpEQ==
X-Gm-Gg: AeBDievCjr6ijcC/UwknKDvbpNO2aX/UUw7Uw1nziqbk7qgRyGB4onAaDy8+f8Pt1qd
	miA+yd+0RxC695F4cBLp3TySKeXKq/PKdgIGoPoZN1Oagme0rFfCr9jJCkz0Hcr3vO+B0SmUwfB
	bzXno/QT+RqXidkBjhLieHhmlOcSaGP2pryMn1LfkIrDzgs8N5NIWS5oRPJ2Ni/mjbGYG5F4K62
	zE32hAVjuZswRpDGSg7JFGW87oNP5pwuOExCBgAnahfid8aE43PJTBpiumh5nz8mTdgGYics8X1
	Q0TlI6g8m2/N0e1N6tUmrC/nN0/73n9ly4odWJB8tqsP3GOITFdWFDGoVi97jiF3K0FJfCunFzI
	7MFGGiqlwVaSl6QPDuXceTYpd/JigmEysnnV5EyZU7G9vEi3v4hAtnSP8wvr1lgi8UQ1C9OdWAG
	gDhQNPN3ZVgCfXNDWRCh8woszWRc/sZ5x7cqAp7NlSqC6Gr3fjmppgtx8Rpg6/Wpn29YR8hDYut
	pUb6+hRP3k=
X-Received: by 2002:a05:6402:2114:b0:66b:aa56:ee5c with SMTP id 4fb4d7f45d1cf-679bb09ac88mr184476a12.28.1777326744611;
        Mon, 27 Apr 2026 14:52:24 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b6843097sm149184a12.19.2026.04.27.14.52.22
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:52:23 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so16193140a12.3
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 14:52:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/pCc24UgDFV6vU/sOOPw6XxFtnGVyLznRfP3kMqBAQmwmEs9NIORqQwQFCQNWE+m+bhnpKl1xUpuI=@vger.kernel.org
X-Received: by 2002:a05:6402:35c2:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-679bb04a8a7mr185115a12.1.1777326742385; Mon, 27 Apr 2026
 14:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury> <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org> <ae-2yLWSGnfeTvh1@yury>
In-Reply-To: <ae-2yLWSGnfeTvh1@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:52:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
X-Gm-Features: AVHnY4LQUFWo9ODz4M3q2vZC9Gn8nsdYr95Nd4ky5ERVHHxIyN_9ZXY5zjebfdc
Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E8D4A47AF78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36578-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gmail.com,linutronix.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.xenproject.org,googlegroups.com,kvack.org,alsa-project.org,lists.linux-m68k.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-foundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]

On Mon, 27 Apr 2026 at 12:19, Yury Norov <ynorov@nvidia.com> wrote:
>
> This is what Linus said when added x86 implementation for copy_from_user()
> in c512c69187197:

Note that some things have happily changed in the six+ years since...

>   That's partly because we have no current users of it, but also partly
>   because the copy_from_user() case is slightly different and cannot
>   efficiently be implemented in terms of a unsafe_get_user() loop (because
>   gcc can't do asm goto with outputs).

now everybody can do asm goto with outputs.

Yes, it's disabled on older versions, so it's not *always* available,
but all modern versions do it. And if you care about performance, you
won't be using an old compiler.

             Linus

