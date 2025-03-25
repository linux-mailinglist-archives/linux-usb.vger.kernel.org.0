Return-Path: <linux-usb+bounces-22137-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECFDA70BB5
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 21:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C4B61739AF
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 20:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF3A266B7F;
	Tue, 25 Mar 2025 20:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gJLnPXyP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA0F265CCF
	for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 20:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742935314; cv=none; b=K92S9FDydBQlUurHi7hx/+/apoPD+6o9tlC7QGqyf7qoiQZfSFyMUopwpsZcXji7SHDPJXaNLFDWRjzWl1lvpp9vtjIyPCvWViV2/1FNeVheRdfKiUXBHxGh3XE5nPVT5F+QXddbBcEirpHLaY/9KubTp2iRiCLDPBSqiTVdVTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742935314; c=relaxed/simple;
	bh=GCAhGVtueceq1ubCUXU7aIifbCxnCpAKEuI8oUAtt/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fr0cadRGLQrY+s2qm8adJKsLwlt3erWFKpPqvw4HunCbxqeKAc3eg8KDS4i5wtBHGkRu0BDPzIMWunM4XyFK9AHZhc/jgbGcIePt9fVG2YgUkWG+tK0fRDWofLKdcsfq6GycDTVFuO3BkEF1pM3KIZtZ3CsyxF+FZEHA9ZDx/9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gJLnPXyP; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2963dc379so1025708466b.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 13:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1742935310; x=1743540110; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K52xAWNW5IEkY2W6yv56tbrXz/O78EY3OFwe6Kmcp1A=;
        b=gJLnPXyPnQB7ZVnoOIqfsF73CVu7Wk9KYRSN88W+g3ut2tSfgIcSdkR4+dWnsZLhOH
         +j0uR3S0qYCPdpZQJUCCPYLPGdnQPINNsJ2AQ8/q1PxBkPyWIi3M5Afu2/QfbBvQYwe8
         eEMOvejESYXokDwaVV2Rv2kDvyBLkzbYmO/7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742935310; x=1743540110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K52xAWNW5IEkY2W6yv56tbrXz/O78EY3OFwe6Kmcp1A=;
        b=czjOQXekGaN9Wgbfa7jLhSg5kqLcTYSJWbnuQ/IWylwKAl3a1+S4eMI3Erf147IQTb
         FO71SSAB9IABntB6VtLyftFKj3ADBGk2hTMVe5XuWPH7KKIOdL+THO2SlTLnmPPfHn4M
         0nB5Y+WcQR5MXWmUvAOx+SSqjTh2CbwB9o8p8dCoALcD7XA3FOJNSyK/r82hiE14isN/
         6AyS3KaveBbT8OD1M4sTnSCYkjQ5XlYUu0f4QMbZv7LziE2gm+hV50Rc97sIR62/kwhh
         GAAoLGEb4fw51WIuqpp/iX7BglvfjhQisaaYe5ztqbNQLnvGZX9/w9za9riNZORCfDwG
         NS+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXor120CBiz8eWApi5iVl+unGd92Fgo4cur4CrT9VPJzIIai/PvHlsXDrGmXKhzD8aTkXUVae7p9BM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY7LyWjfFrfHp0TKj0Tlci2ezm74cUSH0qA90XkjBkPTYfJurp
	OusDxeEDskyqlVGFhjc56WWrH31QKO3gdIb9JXsD08hlbH6FzEk+EEs4GS5RAR1P64CwBF1ANbt
	teRQ=
X-Gm-Gg: ASbGnctfrOn2W6m6RYM7abAocGzlQ+Ty/wzPMAKKCu6/jcWCy1kjdbSw3LMR9VzKmzs
	BcF7qXVuNfi419BImZeg8rFaaEEhog91NQuBmenqNAIblVxcVvkCK2n2EmlwNQ/X8zmBYZhVoKR
	N7XYo/sz2Jsl/QtC13PDf7HjZ0mhfzllQ7g6EB8XN+8GqGts18FaTGZiQPfTfN2PN8vlmeU7BHl
	LMxRPVuBiX70RtVI6rRfbfKqpr6Duvjta9vmo9b7Odm7tuMtFiXmiM4wxTpYPhx2MJ+JLj2ZIU7
	qlZXkKotYUTgmtTfY2Bk0rUYxirFaMs/ejNVetcsxKvxTZzwXUzypKCv5icXx6mKaf5k0CjQ+AM
	Nx860b7jgXhsdfjZxNUA=
X-Google-Smtp-Source: AGHT+IFAxM0gPdZuc0pTB76pl7Gwiz7xk5rf0BgkTCeaianM8c7oBMxPlLmn2PU1JJ5PfJwMhMcTBg==
X-Received: by 2002:a17:907:a58c:b0:ac1:e332:b1e7 with SMTP id a640c23a62f3a-ac3f24164e1mr1998138366b.4.1742935310355;
        Tue, 25 Mar 2025 13:41:50 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbde68dsm895078666b.139.2025.03.25.13.41.48
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 13:41:48 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2963dc379so1025699966b.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 13:41:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwq5bKlCsuTx7xaHLdugKwi3yb0bRgndbHRVPIgkPwl4CMbwmdPNSbJwrS1X9zgCi/Z8XepsGdaxA=@vger.kernel.org
X-Received: by 2002:a17:907:95a4:b0:ac3:48e4:f8bc with SMTP id
 a640c23a62f3a-ac3f27fd3b3mr1859596466b.48.1742935307883; Tue, 25 Mar 2025
 13:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325121624.523258-1-guoren@kernel.org> <20250325121624.523258-2-guoren@kernel.org>
In-Reply-To: <20250325121624.523258-2-guoren@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Mar 2025 13:41:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiVgTJpSxrQbEi28pUOmuWXrox45vV9kPhe9q5CcRxEbw@mail.gmail.com>
X-Gm-Features: AQ5f1JpwFc7ifwGuAhyrs4E5qPgHx1McCR38KFycRhkLFRMKTveHrmoaWi4zba4
Message-ID: <CAHk-=wiVgTJpSxrQbEi28pUOmuWXrox45vV9kPhe9q5CcRxEbw@mail.gmail.com>
Subject: Re: [RFC PATCH V3 01/43] rv64ilp32_abi: uapi: Reuse lp64 ABI interface
To: guoren@kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org, 
	oleg@redhat.com, kees@kernel.org, tglx@linutronix.de, will@kernel.org, 
	mark.rutland@arm.com, brauner@kernel.org, akpm@linux-foundation.org, 
	rostedt@goodmis.org, edumazet@google.com, unicorn_wang@outlook.com, 
	inochiama@outlook.com, gaohan@iscas.ac.cn, shihua@iscas.ac.cn, 
	jiawei@iscas.ac.cn, wuwei2016@iscas.ac.cn, drew@pdp7.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, ctsai390@andestech.com, 
	wefu@redhat.com, kuba@kernel.org, pabeni@redhat.com, josef@toxicpanda.com, 
	dsterba@suse.com, mingo@redhat.com, peterz@infradead.org, 
	boqun.feng@gmail.com, xiao.w.wang@intel.com, qingfang.deng@siflower.com.cn, 
	leobras@redhat.com, jszhang@kernel.org, conor.dooley@microchip.com, 
	samuel.holland@sifive.com, yongxuan.wang@sifive.com, 
	luxu.kernel@bytedance.com, david@redhat.com, ruanjinjie@huawei.com, 
	cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com, qiaozhe@iscas.ac.cn, 
	ardb@kernel.org, ast@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, bpf@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Mar 2025 at 05:17, <guoren@kernel.org> wrote:
>
> The rv64ilp32 abi kernel accommodates the lp64 abi userspace and
> leverages the lp64 abi Linux interface. Hence, unify the
> BITS_PER_LONG = 32 memory layout to match BITS_PER_LONG = 64.

No.

This isn't happening.

You can't do crazy things in the RISC-V code and then expect the rest
of the kernel to just go "ok, we'll do crazy things".

We're not doing crazy __riscv_xlen hackery with random structures
containing 64-bit values that the kernel then only looks at the low 32
bits. That's wrong on *so* many levels.

I'm willing to say "big-endian is dead", but I'm not willing to accept
this kind of crazy hackery.

Not today, not ever.

If you want to run a ilp32 kernel on 64-bit hardware (and support
64-bit ABI just in a 32-bit virtual memory size), I would suggest you

 (a) treat the kernel as natively 32-bit (obviously you can then tell
the compiler to use the rv64 instructions, which I presume you're
already doing - I didn't look)

 (b) look at making the compat stuff do the conversion the "wrong way".

And btw, that (b) implies *not* just ignoring the high bits. If
user-space gives 64-bit pointer, you don't just treat it as a 32-bit
one by dropping the high bits. You add some logic to convert it to an
invalid pointer so that user space gets -EFAULT.

            Linus

