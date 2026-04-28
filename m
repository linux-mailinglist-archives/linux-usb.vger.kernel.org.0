Return-Path: <linux-usb+bounces-36610-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFonEv6A8Gn6UAEAu9opvQ
	(envelope-from <linux-usb+bounces-36610-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 11:42:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EF6481B45
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 11:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C3C030A5EE4
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 09:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DE53A9615;
	Tue, 28 Apr 2026 09:33:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2953A5E63
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368813; cv=none; b=IT2ypac+6mrTxiN39R0TrYdtmaTn9uIykjquOkWrEMu0okgfBYzscNkwnvDng4elTqoj3elczM585HkJ+JXtaJZ9Ke6evxwn2XDvcBbZXsu80M68CeoR9WDpBhVbZdmiQ02ghgXvJaEs59tp6rxHszByEJFGGYV/VwqlmIiopjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368813; c=relaxed/simple;
	bh=WZ0dv++aH+AeLwkvbNXxLqu7wJ3mA6GpS63WG1N27Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwbMj6kqGDvc0ufgsSMVdD4wwS2h13qKQlgfNwen3QlWhKYtzxFvzePf8Ralpxys8maQjJzYgale42l+vgXHVAACbWHXom/UaeMHCOYhJbtq8lU+3SdieFkzh82Cec5FMUdXkztaSC3cMmXe2ZCrO1d4tHMIZ+CTKkD87j/N578=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-678adefbd26so6419611a12.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 02:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368810; x=1777973610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=F1T0PPMZ2zbijIxweuiUIv5VCwQSulbDaFbiISojSRmcNtLvBqKHCkdCxaCUTkEdV2
         6aQLYqPyr12S5Hf+H+R5YXody8fgxTCrad7WXF+9MsFwAHOuWY4CfKoCQ3oa4vI1SaZ1
         qgE/w9dMXXT33NAgdQT2FD+1TAuCGauu+U0veGgfl7+vVR7T4rgA8s542khILkOQqKuy
         3dfJ6u4y4bmZR6rkQh3kGTzrC5GuPZGm8ueTA04LWxNDW8g4KmuAhjkYqoItsIGx5vf7
         Ku8UPmW4d9tn3xcpin736e2PazNCgO55V055+pf+/2UVe9qrQkxVMPjfurzGvvaqvnia
         09FQ==
X-Forwarded-Encrypted: i=1; AFNElJ8aYtFZcApEqWEAJ4udISqHbqyWPrRUhhQtJ8Sao6+7qDT2k0wXgeLq+tc0A2z5Th1yK6/QLc0JFPE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8NqNib+QmHWtW0hYLSR1ZgKjjaHTp2JdWqyed4jWg1/TrpS2I
	Gcdm7BI25k4IvhtmZvmoST9EQB5gg26SiF8q7sLfKrWUZaWbUsmmacCX4wXd/L4zTi8=
X-Gm-Gg: AeBDiesgIFQDv36ToSL/dxSsMs3F7SIjbQwFTTpB5xymaAmR46tXuEM7APKEwfpnC5J
	Xjq+4S2fBKSF/Nnx65R9fjOhjcIap02wnR+6iLSRUKgWPlihe+mxDICT3ykIowMn3QMByQcLlSu
	ntFm/ochgpghgfGlsuZU9zQXIstQH0UVHmyt+SWYkWaw6NQsXqaj0CWthAqisndPVBn+gBO1dE7
	znbMDtKpcWBIIPO0m5iq8Mr+aGs2SUp+uQMeumU9r9clVCueryqPVGoPTtPgbJFKSp0cW/E7jeE
	yoyInhZqZEGswygzrfJTiV77Oaw0AP9yGedbbHNrMtZTa+l4t2NuiQg0RKPDSX0cmT++PZNAVeB
	wQrMNC/l1QR3ZruGNyaXGR+sv07r2toJelFUtSHXZxyj3JGtv6N/DlNTeHRGFFyZp7KWToq9541
	bfNhzRxUMqZDVDxYg0gIRFFhdyxEqAdGdGAK4Xkc8Goox4FpZHJeW3fgwyHNKsHfYYwfQA7zw=
X-Received: by 2002:a17:906:f588:b0:baa:1d9:66ff with SMTP id a640c23a62f3a-bb802da69dbmr155541266b.20.1777368810020;
        Tue, 28 Apr 2026 02:33:30 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb809022020sm73605966b.25.2026.04.28.02.33.29
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:33:29 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-678adefbd26so6419573a12.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 02:33:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Re97VE2LF5vGtUOrLHdCm6fPgKYLaENoDiqkR74AsBtSH1GpPIzzv9KreGHSSSDZ5j5y+wZJxFWU=@vger.kernel.org
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
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
X-Rspamd-Queue-Id: B5EF6481B45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,linux-foundation.org,gmail.com,linutronix.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.xenproject.org,googlegroups.com,kvack.org,alsa-project.org,lists.linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-36610-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-usb];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

