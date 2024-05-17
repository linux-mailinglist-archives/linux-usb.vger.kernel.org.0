Return-Path: <linux-usb+bounces-10325-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF88C8D9A
	for <lists+linux-usb@lfdr.de>; Fri, 17 May 2024 23:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C2801F22BF0
	for <lists+linux-usb@lfdr.de>; Fri, 17 May 2024 21:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D85812FB10;
	Fri, 17 May 2024 21:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuSus0Qp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8540C393
	for <linux-usb@vger.kernel.org>; Fri, 17 May 2024 21:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715980606; cv=none; b=metySzkP/x8P0VhNiiRGHYyn1hpQNqelL03jwSkwhxW2KK/pZgZdXp0qyXDY2q/jObILbcS6WJyTZZsb46SKg343HtnFT8aRMPD+CZwLEtmaU1MffVd5GGLP16iKSHrcphMRQvopsqEBK/8SG1tlP0K3+jFI8Jq77yJGC6W/3bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715980606; c=relaxed/simple;
	bh=b6WetkV0oDJT1ER9VHvvFveXf1fWHmMf570THSiawzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9moDb0S3EZ+VfqXVhvjRC3qSU3jebhHgHA/wXUNgfgTRjJIArfOPKNniomfL+7efgS6luqxhWfbt/mucevcb54LH9CSNMHHfyW3HBBUX2owGruxcZaigOtjnDUZSSyhD7glw5LDxK5Iu7V16K/81byI2Y6H4w4c1/kuHisDQAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuSus0Qp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-34dc8d3fbf1so448684f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 17 May 2024 14:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715980603; x=1716585403; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IGZFNc1qlbU8b5+aQ2tz2mHsgW8j9auH2lZv+jNngXY=;
        b=kuSus0QpzSUaSiJbvCJUtXLaBwqaF7UuKtpveUd72l7Hv05FQ02FjwiegmavMdHArw
         6yO/Adj+JDHFCUgCEJPX+zu/+om/XIBo/7qzlRm4hd/QzEPcNFjFPaktqzwYDWEY8qQ3
         cU/wtkQ+Bv4+hTcJr+IZzjTHO82bBtVj/z5rsdQhiEGZT8sK5nNp2cnOq7P4B7wsUJU1
         JIHqpDlO5Yx58Dko9eBsnhYV7JLBo2z4Q8wuRi0CBRPY+OlUvcD36j86FEAWlC6/Kq7P
         UjKc29r9VJQs7zLkk8yyfXg/jHakUCy4A7sdGp/wD+04Zq1nqHKCqDMMpOZ5Epw92OcG
         h/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715980603; x=1716585403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGZFNc1qlbU8b5+aQ2tz2mHsgW8j9auH2lZv+jNngXY=;
        b=VhnBrCw4j3xCLh/3QlLW8cOUWpOsPeFm7MVtuo8uDX/lvC3JRHBFk5qtRJ5T7bG463
         Og8M+ARmneQX0yzpRhcw4NWlRIxZPHF8gW0FTpEbxKTxJ81m+5J237pWd2sXPt04cXIB
         GpARfmpIVJ68jKonQvD6UJDH8Ct/t3RjCx4mCZcVmw3JwpvX/+8p+8t+3z0J+WHeZNTL
         S8b+SA948WrYQBh5WoKnbAB8EAXemBG1VJmRD6MYVatDcGXz6+JAvYRVgki4ZajDLCzt
         ETn3f5xHvs8frY5Cjl4oCJwabvH0KQddSDRa9LXiQjohVHIYcHfRLpuUvaht9mLqL52w
         B18g==
X-Forwarded-Encrypted: i=1; AJvYcCUWZTy5NOSr4RwRJe7T9C/sy1uvXs2/sycYbh/zSd5rjt5uP2xwNKRPRJvZJSSFgGa/Gb/6/pM5HW32je/z74oneJuKenmCvFRj
X-Gm-Message-State: AOJu0YwTAI8sEWqBgtlgF3zVi3JIXMM5ClGi3MyD9GcifvLIA/dk4OB2
	2O7DRG+9Gcy/atAmxSTg5vpwDHtH45hsKZiiaJ8qMmsv7UVylVhEVNmyK3quOBMCh+icBjPRv0y
	a2DO4NFZLcA48IIoxayDIieDmqyg=
X-Google-Smtp-Source: AGHT+IGIGp5nVtjBYLaqSVYlOnqh190QtjzuleAruvZi5uBsiPNbfzhnXyvkydj2wzEgfL4UhgQ0ea0zlUGvaK7PNt8=
X-Received: by 2002:a5d:6350:0:b0:351:dea5:f808 with SMTP id
 ffacd0b85a97d-351dea6093bmr3919231f8f.26.1715980602740; Fri, 17 May 2024
 14:16:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0f4d1964-7397-485b-bc48-11c01e2fcbca@I-love.SAKURA.ne.jp> <4e8b9f94-326b-4370-9d69-94ee10b644f8@I-love.SAKURA.ne.jp>
In-Reply-To: <4e8b9f94-326b-4370-9d69-94ee10b644f8@I-love.SAKURA.ne.jp>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 17 May 2024 23:16:31 +0200
Message-ID: <CA+fCnZdymR9NiVW=XTWD-45rv+QGRdCkDo8X3odSsVqqD9-9Kw@mail.gmail.com>
Subject: Re: [syzbot] [wireless?] WARNING in kcov_remote_start (3)
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
	Alan Stern <stern@rowland.harvard.edu>
Cc: Tejun Heo <tj@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrey Konovalov <andreyknvl@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Marco Elver <elver@google.com>, USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Hello.
>
> syzbot is still reporting warning in kcov_remote_start() from
> __usb_hcd_giveback_urb() path. I guess that commit 8fea0c8fda30
> ("usb: core: hcd: Convert from tasklet to BH workqueue") broke
> the in_serving_softirq() workaround explained in commit e89eed02a5f1
> ("kcov, usb: hide in_serving_softirq checks in __usb_hcd_giveback_urb").
>
> How can we fix this workaround?
>
>
> -----------[ cut here ]------------
> WARNING: CPU: 0 PID: 16 at kernel/kcov.c:870 kcov_remote_start+0x5a2/0x7e0 kernel/kcov.c:870
> Modules linked in:
> CPU: 0 PID: 16 Comm: ksoftirqd/0 Not tainted 6.9.0-rc7-next-20240510-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
> RIP: 0010:kcov_remote_start+0x5a2/0x7e0 kernel/kcov.c:870
> Code: 24 00 00 00 00 9c 8f 04 24 f7 04 24 00 02 00 00 0f 85 a6 01 00 00 41 f7 c6 00 02 00 00 0f 84 93 fa ff ff fb e9 8d fa ff ff 90 <0f> 0b 90 e8 26 71 f4 09 89 c0 48 c7 c7 c8 d4 02 00 48 03 3c c5 e0
> RSP: 0018:ffffc900000079c0 EFLAGS: 00010002
> RAX: 0000000080010101 RBX: ffff8880172cda00 RCX: 0000000000000002
> RDX: dffffc0000000000 RSI: ffffffff8bcac680 RDI: ffffffff8c1fdcc0
> RBP: 0100000000000004 R08: ffffffff92fb25f7 R09: 1ffffffff25f64be
> R10: dffffc0000000000 R11: fffffbfff25f64bf R12: ffffffff8196262e
> R13: 00000000ffffffb9 R14: 0000000000000006 R15: ffff8880b942d4c8
> FS:  0000000000000000(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f3793bff800 CR3: 000000001eccc000 CR4: 00000000003506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <IRQ>
>  kcov_remote_start_usb include/linux/kcov.h:53 [inline]
>  kcov_remote_start_usb_softirq include/linux/kcov.h:66 [inline]
>  __usb_hcd_giveback_urb+0x34a/0x530 drivers/usb/core/hcd.c:1647
>  dummy_timer+0x830/0x45d0 drivers/usb/gadget/udc/dummy_hcd.c:1987
>  __run_hrtimer kernel/time/hrtimer.c:1687 [inline]
>  __hrtimer_run_queues+0x5a5/0xd50 kernel/time/hrtimer.c:1751
>  hrtimer_interrupt+0x396/0x990 kernel/time/hrtimer.c:1813
>  local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1032 [inline]
>  __sysvec_apic_timer_interrupt+0x110/0x3f0 arch/x86/kernel/apic/apic.c:1049
>  instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1043 [inline]
>  sysvec_apic_timer_interrupt+0xa1/0xc0 arch/x86/kernel/apic/apic.c:1043
>  </IRQ>
>  <TASK>
>  asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
> RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:152 [inline]
> RIP: 0010:_raw_spin_unlock_irqrestore+0xd8/0x140 kernel/locking/spinlock.c:194
> Code: 9c 8f 44 24 20 42 80 3c 23 00 74 08 4c 89 f7 e8 6e 7a 66 f6 f6 44 24 21 02 75 52 41 f7 c7 00 02 00 00 74 01 fb bf 01 00 00 00 <e8> c3 3a d0 f5 65 8b 05 34 7a 6e 74 85 c0 74 43 48 c7 04 24 0e 36
> RSP: 0018:ffffc900001577c0 EFLAGS: 00000206
> RAX: 51fa7c47925ba500 RBX: 1ffff9200002aefc RCX: ffffffff8172dd7a
> RDX: dffffc0000000000 RSI: ffffffff8bcab500 RDI: 0000000000000001
> RBP: ffffc90000157860 R08: ffffffff92fb25f7 R09: 1ffffffff25f64be
> R10: dffffc0000000000 R11: fffffbfff25f64bf R12: dffffc0000000000
> R13: 1ffff9200002aef8 R14: ffffc900001577e0 R15: 0000000000000246
>  __usb_hcd_giveback_urb+0x373/0x530 drivers/usb/core/hcd.c:1648
>  usb_giveback_urb_bh+0x306/0x4e0 drivers/usb/core/hcd.c:1682
>  process_one_work kernel/workqueue.c:3231 [inline]
>  process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
>  bh_worker+0x2a5/0x620 kernel/workqueue.c:3572
>  tasklet_hi_action+0xf/0x90 kernel/softirq.c:816
>  handle_softirqs+0x2d6/0x990 kernel/softirq.c:554
>  run_ksoftirqd+0xca/0x130 kernel/softirq.c:928
>  smpboot_thread_fn+0x544/0xa30 kernel/smpboot.c:164
>  kthread+0x2f0/0x390 kernel/kthread.c:389
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>  </TASK>

So the problem here is that __usb_hcd_giveback_urb gets called from an
interrupt that comes during a __usb_hcd_giveback_urb call from
usb_giveback_urb_bh. And KCOV annotations don't expect that
__usb_hcd_giveback_urb can be interrupted.

We had a similar issue with USB/IP before, and AFAIU the resolution
was that it's invalid to call usb_giveback_urb with interrupts enabled
[1]. But I'm not sure if the same applies to usb_giveback_urb_bh.

Alan, is this a bug in usb_giveback_urb_bh? Perhaps we need to disable
interrupts before calling __usb_hcd_giveback_urb?

Thank you!

[1] https://lore.kernel.org/linux-usb/20201006012333.GA399825@rowland.harvard.edu/

