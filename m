Return-Path: <linux-usb+bounces-22246-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BACD5A736B0
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 17:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49068189EF8C
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 16:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B683218580;
	Thu, 27 Mar 2025 16:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="kYpVbHXO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70B4189919
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 16:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092416; cv=none; b=Mn66IsqoNHBZnjjoXVfW5xvVNcT6Lkr2Cb3cWWYe4sWoBVXuqO0CQLyWUNJ2/OWWfLKCp+jDkBuALIf1er0YFWWVJDvSStwAkt1eqh0mfyFQlcZ2F6Lmo5raF+kh3fHtbx5w9BYBdxKxhw4nSKKhnit6tYpQxCF4IdN55j6XwxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092416; c=relaxed/simple;
	bh=NVwNdpFq+nrFVf9YMmHiCb/6V19g4IwZkEMgGwL2onM=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=S6ouRGhExQO39a66hxeaCp21af3BYaMamaXlWeO1+QfPytMRAYE2Yjuyx8SehNTMjVMRCufGqcnBrmmwFyKl+b0cCZ5lR1kbNPp8fvpzSMzKr41dh8Uf0frBf2Bd0vxrrQJikJTlzeAEsON8QixrrM6uaKKKbCRh7vhjETqdT1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=kYpVbHXO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227b828de00so23294495ad.1
        for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 09:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1743092412; x=1743697212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kX05jx75Xb8+ENPYRjK+Gc3Ht1e9kjVMOGIod7/HdTg=;
        b=kYpVbHXOgUpLRMTokda7b4lmD2DDWFPI2/1xILmmVtvv2Uw2c425hHMb6Mh3XvOHcy
         nP8Sil2DtAmwEzSGosSFOLRmQxPK0h32eU2gWjNMDVPHCiA1hN9BeUxBlsKxkGufn3G3
         TcU/USq5mdFBfH0YQ84YyaDyymgPlO23ua3WuznzjPqV//xHsgEpA/FAqpZZiXhxdgRb
         dM7o2SRY3KiDdmyuRpL0DXg5EldGGr7oEX4+yMoTg1p2xyBHS0DPepwNmXiT2Elk7/6w
         gzIfRy2jc5Y2IQle7KV3aoz4JzA3VybBDskwGHOBLoZbb2KnEXpw4TivDslOd9+I6MHq
         GV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092412; x=1743697212;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX05jx75Xb8+ENPYRjK+Gc3Ht1e9kjVMOGIod7/HdTg=;
        b=N+UvD+siTyBUn5w0UQ/G4ms+vzHSatQ4Te0tdOgoOJhVshUm4HBLmNf2ZEFG6SBh/N
         G287CAmN0FcpidtDoakgjwwe/JPnNxGpFJvbLqT/F1mjuXfbx2ZZ5mRXxL44gFRo34vF
         sM/LMT+8KsDQ3l3zkx7KnEQ9iD9tInXZl5O8fOwRg5Pfvs1he8krhOofFtcRJKB4DnQw
         oJPZqpgRLkdWEcqutjq/Z+zQc9h9uoh3fTtVDKayKhYq68RuxVFUmxfcgQS0rSynQBQC
         OonTZwSumfcVTNUORGwr8uC4MEpBGxAdSSIHAtQtaB2HUur3ef4CUeGJqjYhzn+m/dsT
         nAOw==
X-Forwarded-Encrypted: i=1; AJvYcCWpZ25ggtn1dv5iJ0U8+rlg7n2N+CAf6KV7w/JOH+wddkN5L3N3FnT7pwelPhdzQUJgBSrKhf810L4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJo/BN2zoeo0KC8ga4H2t5288BDZo+kId4LnlrVpmfu6p6VXQg
	cSqIhW3ir0A+rqbBdEMJGi0DEqUU4rJvYBUF5CVULCqQ2rvFCB03Qptl20PCLlA=
X-Gm-Gg: ASbGnct1L4Z9FRSbGMvKvHQniTVRK+547uDaZ522Eo8FJUvB/ZpZxC0iCH3PAF6QUTa
	ODvfRIwIWey2Xajgp+OBI8e0m49XCbr2cdrCHT8w4UHLpMWImgo9P507+N6srcVOpEXK8ZFOBjj
	+ebUV8FwIkbFR09UxLvdx6TOLGxGCti1jAkhdmB6uKtvQBYnXKltWDj2jgoZhvEyp0uQvgD12Cy
	CvGVKxg9aaWDxgFyKDbVTyPgMbwbqfo0Qqmiknvaz9QOj0+O+XUXOYbQlzUC/+nkAcoX2yvHHBP
	LHsADhm5bCJJjkPqHqrYb91o4wM2EE+Ar27TnA==
X-Google-Smtp-Source: AGHT+IGClNJzmnXOK1L/PFNFl5ogZb2gMU/Eqg4X3l9WVxApkZth9g72YE2t9vJ4dK3KZhjxhfYK+Q==
X-Received: by 2002:a17:903:228c:b0:224:216e:332f with SMTP id d9443c01a7336-22804968a3cmr61064755ad.48.1743092411962;
        Thu, 27 Mar 2025 09:20:11 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec780bsm1682245ad.19.2025.03.27.09.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:20:11 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:20:11 -0700 (PDT)
X-Google-Original-Date: Thu, 27 Mar 2025 09:20:02 PDT (-0700)
Subject:     Re: [RFC PATCH V3 01/43] rv64ilp32_abi: uapi: Reuse lp64 ABI interface
In-Reply-To: <CAHk-=wiVgTJpSxrQbEi28pUOmuWXrox45vV9kPhe9q5CcRxEbw@mail.gmail.com>
CC: guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>,
  Greg KH <gregkh@linuxfoundation.org>, Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org,
  atishp@atishpatra.org, oleg@redhat.com, kees@kernel.org, tglx@linutronix.de,
  Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, brauner@kernel.org,
  akpm@linux-foundation.org, rostedt@goodmis.org, edumazet@google.com, unicorn_wang@outlook.com,
  inochiama@outlook.com, gaohan@iscas.ac.cn, shihua@iscas.ac.cn, jiawei@iscas.ac.cn,
  wuwei2016@iscas.ac.cn, drew@pdp7.com, prabhakar.mahadev-lad.rj@bp.renesas.com, ctsai390@andestech.com,
  wefu@redhat.com, kuba@kernel.org, pabeni@redhat.com, josef@toxicpanda.com, dsterba@suse.com,
  mingo@redhat.com, peterz@infradead.org, boqun.feng@gmail.com, xiao.w.wang@intel.com,
  qingfang.deng@siflower.com.cn, leobras@redhat.com, jszhang@kernel.org,
  Conor Dooley <conor.dooley@microchip.com>, samuel.holland@sifive.com, yongxuan.wang@sifive.com, luxu.kernel@bytedance.com,
  david@redhat.com, ruanjinjie@huawei.com, cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com,
  qiaozhe@iscas.ac.cn, Ard Biesheuvel <ardb@kernel.org>, ast@kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-mm@kvack.org,
  linux-crypto@vger.kernel.org, bpf@vger.kernel.org, linux-input@vger.kernel.org,
  linux-perf-users@vger.kernel.org, linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org,
  linux-arch@vger.kernel.org, maple-tree@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
  netdev@vger.kernel.org, linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
  netfilter-devel@vger.kernel.org, coreteam@netfilter.org, linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org,
  linux-usb@vger.kernel.org, linux-media@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-16d3c75b-cf60-499e-98b0-098d630874b4@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 25 Mar 2025 13:41:30 PDT (-0700), Linus Torvalds wrote:
> On Tue, 25 Mar 2025 at 05:17, <guoren@kernel.org> wrote:
>>
>> The rv64ilp32 abi kernel accommodates the lp64 abi userspace and
>> leverages the lp64 abi Linux interface. Hence, unify the
>> BITS_PER_LONG = 32 memory layout to match BITS_PER_LONG = 64.
>
> No.
>
> This isn't happening.
>
> You can't do crazy things in the RISC-V code and then expect the rest
> of the kernel to just go "ok, we'll do crazy things".
>
> We're not doing crazy __riscv_xlen hackery with random structures
> containing 64-bit values that the kernel then only looks at the low 32
> bits. That's wrong on *so* many levels.

FWIW: this has come up a few times and we've generally said "nobody 
wants this", but that doesn't seem to stick...

> I'm willing to say "big-endian is dead", but I'm not willing to accept
> this kind of crazy hackery.
>
> Not today, not ever.

OK, maybe that will stick ;)

> If you want to run a ilp32 kernel on 64-bit hardware (and support
> 64-bit ABI just in a 32-bit virtual memory size), I would suggest you
>
>  (a) treat the kernel as natively 32-bit (obviously you can then tell
> the compiler to use the rv64 instructions, which I presume you're
> already doing - I didn't look)
>
>  (b) look at making the compat stuff do the conversion the "wrong way".
>
> And btw, that (b) implies *not* just ignoring the high bits. If
> user-space gives 64-bit pointer, you don't just treat it as a 32-bit
> one by dropping the high bits. You add some logic to convert it to an
> invalid pointer so that user space gets -EFAULT.
>
>             Linus

