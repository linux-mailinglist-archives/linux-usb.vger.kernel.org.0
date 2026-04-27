Return-Path: <linux-usb+bounces-36577-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFFjOGrZ72maGwEAu9opvQ
	(envelope-from <linux-usb+bounces-36577-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 23:47:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 845A747AE0C
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 23:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E66C6300D4CA
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 21:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3034039903A;
	Mon, 27 Apr 2026 21:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ny9FeD37"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EFE3845BD
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 21:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326440; cv=none; b=iQo6daKyXykViHn5zgiUzaReaRF7jk/JP9vdu/U0h9Pl31KM5HkIL9Sa8e/HY8fpWpkzPQXormgyDwHHZWjcHjao0Q156jpLxq9umtfns+rcHV9INEgJU4aGip0boKQRag++ZdAwSiVbRtcd6ynqxx6W7reVlSeiD10SG3i3E6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326440; c=relaxed/simple;
	bh=i/k46YQbNxc6jmDhpSrBTZQploRe2hY24KQV/uGHVj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4IhYquakWrRnsTKnUR4oWfx+qjpwh+ZVXpJJizlRkWnelkidI5JB+phXt9zVjODSzH+XmId3sPutupSkEodjmSh9S8tDDJjadoDa4xhE6CC0pqtF5nBvFOA1mZQP1WQuiQd/AKPm0tOXeXVU2021LaPQhlKRDh2XCfoCIr5pYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ny9FeD37; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b886fc047d5so1921144266b.3
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 14:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777326438; x=1777931238; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=Ny9FeD37w/XGLhbfQHUpKNLnJsBHZkxuPx5AoNh/e/Rhw6ZozsBQ0yJNdL/y6rrqAQ
         qSShcpf4WBlsQDLizCFj/EoopprhzXoaXQqXuB5SJ/NCRdGHb8kCT8fp/hESnC7NV9Jc
         8VivAcxpOH1NGJiD2+Rii2myEXwM/fRlQz/yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326438; x=1777931238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=mjQyaPCKn5L8ZegnPtRhU4ZoInRPlQSKNRYffr2bUYG1phe4ioXm+8W4NgHcS5bo6g
         0WQebfPD++tmq8QMjE/nlumH27M2Ra3SmKahPWGB2sm5ZifPpXrh03CZHob8L9oZ8x5P
         fGeWU3XD0wjEnxGf6QWzxPPLZZY/3bQLA5vW+zBdcRb69BUNe+x+DoSjFpzWc1i99KLU
         +tG+PGwsCCLBcGQAV0n3G0YZWCSG5DdXQrkrTjNYDGSIdPyNlymHUMHo7P+hBJ2jtQtW
         1f/sPvMYM8SQarmWhHMyBA+Fhc1i2iR08kZQ0zmsfXmULyZALUPelDNP7Kd6ayaJ2ESo
         WQfA==
X-Forwarded-Encrypted: i=1; AFNElJ/mIB0IyrmKoWANTXeoIISNK3dkgKJL4gWA3d20pWEJdlCOZoypIBtCAHBcgf5uFXxhTRbzZGJa/E4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3k8tjkClHDQk6u49i8CzZ72uvuh5E6Q52C8SuRXb23egEy8Os
	xRfgWCmetE4pg2e+1ZgqlAzUZCyUWT3a0hQ8lVmS1FlccCeUJ/+z3Ki/liMD3PKE+rc2+/6D+E4
	v0EiE7XbAow==
X-Gm-Gg: AeBDievGl2S5mi5X/go+sS/Df9wSUqao7FHDFH7vzjcvAJ3B4PDWJ4aA43SbQ2vW9/f
	ftUocRQ9XZEuwnuPgqRtJMgCs3oaJC9gA8+pIR7FaV2s0kcqfNPT/SEbQgPHOayhtPVZpafVvFT
	20n2IIGCrWI/gCe2gn+xHKLZ416v2SnC/e2X/CGB+9aLvpbCA2wSZalF9UmXbYT/2UmR7xnkRy+
	GGZ+bOCatfXpgfxSTBbwWGUehzk/dWOCAfVuBMa1VLmk8LamAgJbbA+37zyjztoNQ7AeGj0GOqB
	Qn10Tg2+8VnhXpSxPxRHbfCqJSmvgsvpJ4Q6GudxQvkIdzB/mBG0WAhJqOsZr3sj5tK79ljFg55
	OCzanX5gCdqKgTj2PYbHY8Nf0Y3vdh/47jFTPJj8SYgyY2iCrddRgLgcNoC1UF+jiDEozNdiUcD
	6QWkcTNmgMZupauryHVDbsjt98CVT59YXDJ9GfRkTWi5/kRnUOtnK9BN5sqSvstDtrHPmMpCBLJ
	ESmnc/qp9A=
X-Received: by 2002:a17:907:8b95:b0:bad:667f:efa3 with SMTP id a640c23a62f3a-bb8026bcbb7mr22532766b.11.1777326437588;
        Mon, 27 Apr 2026 14:47:17 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b2adcf1sm9624066b.35.2026.04.27.14.47.17
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:47:17 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9c01854477so696813266b.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 14:47:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9cbABhY2fmxKFCblarBk6+Wg2KHb3pqEKUlULSjxVZS6eVfUK6SZBUy/KaXDB+Ia98kYsBHySoiZk=@vger.kernel.org
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com> <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 845A747AE0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-36577-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-foundation.org:dkim,mail.gmail.com:mid]

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus

