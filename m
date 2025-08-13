Return-Path: <linux-usb+bounces-26801-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B35B24C14
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 16:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64292887B84
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 14:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78456157493;
	Wed, 13 Aug 2025 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ZVIq3Ojb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC852EBDC7
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755095558; cv=none; b=s0pWjeALMwA4lRrw1P1i/cu0HCO09DqJYQO1wBcQ0445vOWeJlrT7R44cckSMP81/r3rlb2uX5VcNSgbhkFHubUMWc1Zl0Hb4Hk41VdsSq2dPtLiFWI/AOBB2rLdox+zHXt1Oo3m55G8ZVjIAZmVI0X7Zm3q5kLT/it6oj3Fip8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755095558; c=relaxed/simple;
	bh=Exf4btHuprNxpDW6oisd/Rf9kU0o5gUUgwDICx6yXuU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TkKqfaZP/NZFMHPvg5B74HVjPFcF/gKw11v52WBFZz62g5RNV41d/cuLZAPC5HCokbbwX+TLACfucem25hrikChGf4C2wLHt5DqQkSuA4HIHtpWZ+LtZfl8Y7NKU3ATePvrHihj9V3eytEjWHvRKJ1L/D9Me7xXGn3KxMoz1PHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ZVIq3Ojb; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76bc68cc9e4so6864205b3a.2
        for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 07:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1755095555; x=1755700355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vonMbyN3zuj6Ng851sh/21UsclUyhq+uD32xK3WNSvc=;
        b=ZVIq3Ojbj4G4Fy0Q/ZOA9boXeF+IvF8N5JKN3pz4to7pIDKPuWVfmVp5iMtN9aRlkm
         Q5OF1nNLFNZjGeU4Q2WR54auuNej9E/PDavp96PFS9xq7JKXfiCJ5OVfYwqCa7am+ibX
         8ZxtybOQwQZg/+rspguK1mURoR7eeue5yNho9ZkgfhKKo9DCPpgrWpFRjiQVqzD2uBFt
         +wsKli1hdGosBApjBKrvhDNJndjF2BIR9fT6bUytUej2eJimFtGV0NmtWA1h4Y1VCchP
         zRU/zeTth3VBjEQWAXDyjPD6yq5JVd2XxlVQkQIRDyq1u7ivKl5axPK9KucbSUyTygRp
         vhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755095555; x=1755700355;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vonMbyN3zuj6Ng851sh/21UsclUyhq+uD32xK3WNSvc=;
        b=GqcjLuwxFnxs51QStZHW8p96sOldVs1HBSutJdkHgbTCrpCI2N7o8QjwDPB3OM1Euc
         i4Zvg03/6KwsrNa+kZw2FAktB2g9v7QpkGWfTvH4JAeCLni+Dl0pZH/Lcalh1JHvdFXw
         gpVhznjP294fi5ykX8GYESvnd9seEuCq1/2cK8acB4CdYBfeFhO6DWM5ZpM7ctwyb5ie
         qpNrcFfcE7yWbgrHEh7du6mgMf+WHdXxwpwdwAfXuPwcHIo26UtcvtjhjcCPg9ZkpMFP
         6fhgOF6+JPIEGpNn0e04aZ3r/X+cq3veLrmyAb6xk9NodFXXCg85a6DHyMOb4Aw1cpqW
         oaKw==
X-Forwarded-Encrypted: i=1; AJvYcCUwfMr0R4xxcb9Eu0sEjPyCbOcKbeQUOEcdbyKHX/dJXVDc6nD7xTMcdui8ROvcSCfILoa/p0zNH2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ3Za8KMyyq2QILnBHXkWVEtSyQDt3QfY393JamvVziI9UvUWt
	lMhqLIAWRrXElOl+IqPt76jcgNbt1huMMNFVJzeoGM43MsPYQFXeSsl3K4SjwBQ4pFI=
X-Gm-Gg: ASbGncsIhdt6gyjMjKi5+9PtpyRnq21q33BGckEiqHkpgHh4pcL/nUvTZayOx+zKwZC
	vH8OxRzc+IbzuqW5ytnHAJ+4rrzxMSg0LbOrnncf2ZOIDjLO2AkWbJjoeTG/oRQO630H/ztoAIZ
	sOPGpPzx5wqUpw9vWPOztLMo1OMJAZx8y+cEzY6p5Cep6/caMTvezaQ6zReiWfZ9kX8O1Rdq/pq
	BkeN9kbdmo6kbuS/TQBUEj2I7gvp84p2m9SO1A39UCmJn06DlRdGFHpjXkAQdVdvJ8W7KjhN93a
	vTJzFdXLUJ1aEXgJk8BMtbSDavVxGbcer6d0pAw+RdIG3urxrkoVgQBkqFQeLniNsv96UQK59+4
	wLK5F0ipQuZsFQLhCuTnEZSyMLxPmCJg=
X-Google-Smtp-Source: AGHT+IEKVGksUTn/P4PCbTZE2Q3bQNd/qyDqB+7cmLKbmowflZwZJQ0cWv0AHk7rWBSOOeKrHN6jUg==
X-Received: by 2002:a05:6a00:2d88:b0:76b:ef44:1fa4 with SMTP id d2e1a72fcca58-76e20f77be0mr4770773b3a.14.1755095555141;
        Wed, 13 Aug 2025 07:32:35 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f319sm32219338b3a.18.2025.08.13.07.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 07:32:34 -0700 (PDT)
Message-ID: <4a32f6c1-8d81-4a51-beed-caf8bc52fcc2@kernel.dk>
Date: Wed, 13 Aug 2025 08:32:33 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [syzbot] [input?] [usb?] [io-uring?] INFO: task hung in
 io_wq_put_and_exit (5)
To: syzbot <syzbot+e328767eafd849df0a78@syzkaller.appspotmail.com>
Cc: anna-maria@linutronix.de, asml.silence@gmail.com, frederic@kernel.org,
 io-uring@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, tglx@linutronix.de
References: <6880f54c.050a0220.248954.0000.GAE@google.com>
Content-Language: en-US
In-Reply-To: <6880f54c.050a0220.248954.0000.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, Jul 23, 2025 at 8:44?AM syzbot <syzbot+e328767eafd849df0a78@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    bf61759db409 Merge tag 'sched_ext-for-6.16-rc6-fixes' of g..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=12b877d4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=415e83411fefd73f
> dashboard link: https://syzkaller.appspot.com/bug?extid=e328767eafd849df0a78
> compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=110b938c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1622a38c580000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/22c5f1286a72/disk-bf61759d.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/cc79af4d966c/vmlinux-bf61759d.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/b2e6d621f424/bzImage-bf61759d.xz
>
> The issue was bisected to:
>
> commit e5598d6ae62626d261b046a2f19347c38681ff51
> Author: Pavel Begunkov <asml.silence@gmail.com>
> Date:   Thu Aug 24 22:53:31 2023 +0000
>
>     io_uring: compact SQ/CQ heads/tails
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12c92b82580000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=11c92b82580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=16c92b82580000
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+e328767eafd849df0a78@syzkaller.appspotmail.com
> Fixes: e5598d6ae626 ("io_uring: compact SQ/CQ heads/tails")
>
> INFO: task syz-executor971:5849 blocked for more than 143 seconds.
>       Not tainted 6.16.0-rc6-syzkaller-00279-gbf61759db409 #0
>       Blocked by coredump.
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor971 state:D stack:26488 pid:5849  tgid:5849  ppid:5844   task_flags:0x400148 flags:0x00024002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5397 [inline]
>  __schedule+0x116a/0x5de0 kernel/sched/core.c:6786
>  __schedule_loop kernel/sched/core.c:6864 [inline]
>  schedule+0xe7/0x3a0 kernel/sched/core.c:6879
>  schedule_timeout+0x257/0x290 kernel/time/sleep_timeout.c:75
>  do_wait_for_common kernel/sched/completion.c:95 [inline]
>  __wait_for_common+0x2ff/0x4e0 kernel/sched/completion.c:116
>  io_wq_exit_workers io_uring/io-wq.c:1319 [inline]
>  io_wq_put_and_exit+0x271/0x8d0 io_uring/io-wq.c:1347
>  io_uring_clean_tctx+0x10d/0x190 io_uring/tctx.c:203
>  io_uring_cancel_generic+0x69c/0x9a0 io_uring/io_uring.c:3212
>  io_uring_files_cancel include/linux/io_uring.h:19 [inline]
>  do_exit+0x2ce/0x2bd0 kernel/exit.c:911
>  do_group_exit+0xd3/0x2a0 kernel/exit.c:1105
>  __do_sys_exit_group kernel/exit.c:1116 [inline]
>  __se_sys_exit_group kernel/exit.c:1114 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1114
>  x64_sys_call+0x1530/0x1730 arch/x86/include/generated/asm/syscalls_64.h:232
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f141ec08e39
> RSP: 002b:00007ffcd1b0b6e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f141ec08e39
> RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
> RBP: 00007f141ec843b0 R08: ffffffffffffffb8 R09: 0000000000000000
> R10: 000000000000000e R11: 0000000000000246 R12: 00007f141ec843b0
> R13: 0000000000000000 R14: 00007f141ec880c0 R15: 00007f141ebd7020
>  </TASK>
> INFO: task syz-executor971:5850 blocked for more than 143 seconds.
>       Not tainted 6.16.0-rc6-syzkaller-00279-gbf61759db409 #0
>       Blocked by coredump.

I took a look at this one, and it's simply waiting on nullb0 timeouts
that it's flooded the queue with. Since it's flooding the nullb0 device
which has been configured to time out IO, we'll have a lot of io-wq
workers that are sitting blocked waiting on making progress. That can
obviously take a long time, which then in turn triggers the io_uring
cancelation/exit warning because of that. It all seems to be working as
it should.

I don't think there's a bug here because of that, the only thing that's
"stuck" is because each timeout takes 30s to trigger and there are tons
of them.

#syz invalid

-- 
Jens Axboe


