Return-Path: <linux-usb+bounces-37947-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LfPF9u+EGomdAYAu9opvQ
	(envelope-from <linux-usb+bounces-37947-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 22:38:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F035BA213
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 22:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 976E0300D358
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 20:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23785385D77;
	Fri, 22 May 2026 20:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="Nl4yYuJ5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABA4384CED
	for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 20:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779482325; cv=none; b=cpD/vMM+unswnzARLqzwlt9SFKhY4k/itxPZo7e64+GRBkPsdvFUKqUqHtN/1MzzYm7vN/056Dmo8NFW76vMgMxN/gHv4FXjFs9M4Z87kl5s1TzVWuqa81Upn2fUMx3QMbQD0Zwzue8UCwg3tFhOw3Su0kFzedhdmkQHxV5ZZ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779482325; c=relaxed/simple;
	bh=Y1REeMc4BYfAEr5YUVAB0S5mtYlZ1rxmOxI6c5ZxfRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=it2wEtNl6WlGKbByHB/xi2QWLED6h7EIEzzlIZr8/ldHKc/LkzAsgnyHhdVJt3WMh8E0b0yxKWAG4lRy3/l44NmrDVGSkIzI107P1P5RVOedlCxJlRk5b/5+HL1r9wVogwjMoaxCEERsOyb/3rdGq0hu48Nwy56MigR8A5uLCUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=Nl4yYuJ5; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304545e6c7fso1088920eec.0
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 13:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1779482323; x=1780087123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tmnNaJuuDoyTyVbW9vl7KCS+ErLuN8C01dxUxK8PMhg=;
        b=Nl4yYuJ50/Y5kczS/GpWLTZsaHAtOdV+8QLIdh1mEZ+DAucOcWAW4eOkm6f4PA8RMl
         Zos71bVnbfEuIcSoOXFPUOKbFUw0UeoqUUoQ2MOe18zR8CYSFb/ZbTgmsB2RbKh0EvfF
         VxSQ8lrPEleqOhUkM22V9su5R2yAhJlZtgrAkC7ivbTKdQE715o4UtOZqnDeXP/sQ3Nz
         1P8V5tXRGfhbhoGAL9uwtdLT1GmQ82APPZ5dp58Nxk8jwIUAF1QxksFbW2SRxg4BjV+2
         +mCyXHzO3ohnIcHmhXkwNOQetAZ5rEUamDQx4H6E2MUTMSdli7JJ22V9xYyHWEYv+lIL
         c0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779482323; x=1780087123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmnNaJuuDoyTyVbW9vl7KCS+ErLuN8C01dxUxK8PMhg=;
        b=Yz/rGRzGbDgdCRQ4/Aoqr2OWlxkXKrDZ1RpBIeIEE31mE3TcpcLpVzAQaT5NxdLQOx
         WtrK0YNWYy3b5+u+V7tBj8WdSQ9tu1YjbuETQalS3jNaglqFUKuMbt7lNs/+qpApY4Ux
         ZbBvEvsiWg1xXfn/Ph5QLKPsG+QHN3Bu5wWd2ou1h18pzBIUFHepBZv/xwJVb/fr8pWg
         5svwbYaGglHI4ofT0VivWkMZ/h5vYAhSrMyxdvJXeIjhq9n3FZ2q0oz7P3U94LbquCOn
         bX17+jFBCq/OaHgB+Eg0qXD7AQMQPMGpM2+LdlykaQnAMHqNQfLR7h4uA9vQ+UD04hzS
         Gzjg==
X-Forwarded-Encrypted: i=1; AFNElJ970ucjZjhl93Ex+2FstEPXRoRLkTgnx27AgyqM+I8dRivQNJDIpTecu2T7Y3/JBJiL+fW2OWgYA5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBATvaQP2MkEZ3VX3OGG/CEDFCBKtPWJZNSWZgKaFrs2d/aZNZ
	d6GHgF1G8AWnm3iUZ/O//IWIMP7FXc4W2l4F3xTFPCOqhUy2uda3nGA6je5evIRlYQar2h9ifmi
	0RfYdL3jTdA==
X-Gm-Gg: Acq92OErP69rSd4PP/bkabJQG7qAYK00d+3cflFGXBAJI0qPjcsgHNb0uZcDBcrHRvN
	kupy9v01isf+267H5io4NucrNDyFN44L0dHypLH6/bu9nX1ZgKym507JWI8awaSoGnuKwF802T1
	oKwHfRGzDwsAZNcInSmMRfz1wxYG+Foq0rwmae0PoQnP6HpaySHDNQJ4JcmEyTxuC0jibMGM+Dv
	wgkn43n8f3Zc9JuDi0E5668rsSXrssA0xff67LSin1hEZUA+jt1YmlLJ3JtJYMSRYPUt7UexzY4
	k4bK+mK6ePWzHF+bZCOf5C6ApDawkr2YIQa/IjQupI/gLaR42QPrS0y05/h/M/retJmXiXTjhaV
	Eho/u7jMKsOllxVZIX1atFo/gF8/y5CIfaw7HVDsQLZ5ZlHUC2X3oc8LDEW1oeIpTOIM2Ss2aMs
	UYMHpZ/cudQ2NCPWE/mgtGoscKTJIcKmt5YKuU9kGG3mYg3r3aUeC6Dx12um92C7KXqpUdLEyba
	7Qu07FCrvqgnCar+iZNraORqhq0rllu5VYeKTEvx/K1N7QRgXyHZeNtZMNPljWYILvXgbKd
X-Received: by 2002:a05:7300:238b:b0:2d9:bc8d:f62a with SMTP id 5a478bee46e88-30449052679mr2936277eec.16.1779482322499;
        Fri, 22 May 2026 13:38:42 -0700 (PDT)
Received: from [192.168.1.112] (nat-x096-241.reshsg.uci.edu. [128.195.96.241])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef4af0sm1809003eec.3.2026.05.22.13.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 13:38:41 -0700 (PDT)
Message-ID: <32c79569-8001-48d2-9675-b38b1670f285@uci.edu>
Date: Fri, 22 May 2026 13:38:40 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in
 iowarrior_write_callback (2)
To: syzbot <syzbot+ad2aac2febc3bedf0962@syzkaller.appspotmail.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6a0ce39b.170a0220.39a13.0007.GAE@google.com>
Content-Language: en-US
From: Joseph Bursey <jbursey@uci.edu>
In-Reply-To: <6a0ce39b.170a0220.39a13.0007.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=59da38148f3a3d24];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[uci.edu,none];
	R_DKIM_ALLOW(-0.20)[uci.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[uci.edu:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37947-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[storage.googleapis.com:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,syzkaller.appspot.com:url,googlegroups.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jbursey@uci.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,ad2aac2febc3bedf0962];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 54F035BA213
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello, I believe I have a reproducer for this bug using a combination
of syz-execprog and eBPF programs. There are three artifacts used to
reproduce the bug: prog.syz loader.c and func.bpf.c, which can be
compiled as follows:

bpftool btf dump file linux/vmlinux format c > vmlinux.h
gcc loader.c -o loader -lbpf -lelf -lz -static -lzstd
clang -O2 -g -target bpf -c func.bpf.c -o func.bpf.o

And then run using syz-execprog:

./loader & ./syz-execprog -executor=./syz-executor -enable=usb,close_fds 
-repeat=0 -procs=4 -threaded -collide -slowdown=1 ./prog.syz

The following configs were added to what Syzkaller used:
CONFIG_KPROBES=y
CONFIG_KPROBE_EVENTS=y
CONFIG_FTRACE_SYSCALLS=y
CONFIG_DEBUG_INFO_BTF=y
CONFIG_DEBUG_INFO_BTF_MODULES=y
CONFIG_FUNCTION_TRACER=y
CONFIG_KPROBE_EVENTS_ON_NOTRACE=y

I am interested to know if eBPF based reproducers are helpful during
the debugging process.

Please note, this reproducer was generated primarily using an LLM,
but was confirmed and cleaned up by myself.

prog.syz:
r0 = syz_usb_connect(0x5, 0x46, 
&(0x7f0000000780)=ANY=[@ANYBLOB="12010000e75fcc08c0070515c5b8010203010902340001000080000904ba00038e4ee2000905000000041a06010905010300021207c109050c04400006030f07059acbf5"], 
0x0)
syz_usb_control_io$cdc_ncm(r0, &(0x7f0000000100)={0x14, 0x0, 
&(0x7f00000000c0)={0x0, 0x3, 0x1a, {0x1a}}}, 0x0)
r1 = syz_open_dev$char_usb(0xc, 0xb4, 0x0)
write$char_usb(r1, &(0x7f0000000000)="93", 0xf5)

loader.c:
#include <stdio.h>
#include <bpf/libbpf.h>

int main(void)
{
     const char *path = "func.bpf.o";
     struct bpf_object *obj;
     struct bpf_program *prog;
     struct bpf_link *link;

     obj = bpf_object__open_file(path, NULL);
     if (libbpf_get_error(obj)) return 1;
     if (bpf_object__load(obj)) return 1;

     prog = bpf_object__next_program(obj, NULL);
     if (!prog) return 1;
     link = bpf_program__attach(prog);
     if (libbpf_get_error(link)) return 1;

     printf("loaded"); fflush(stdout);
     while(1);
     return 0;
}

func.bpf.c:
#include "vmlinux.h"
#include <bpf/bpf_helpers.h>

char LICENSE[] SEC("license") = "GPL";

#define DELAY_NS 20000000ULL
#define DELAY_LOOPS 500000

static long spin_until(__u32 i, void *data)
{
     __u64 *start = data;
     return bpf_ktime_get_ns() - *start >= DELAY_NS;
}

SEC("kprobe/iowarrior_write_callback")
int delay_iowarrior_write_callback(void *ctx)
{
     __u64 start = bpf_ktime_get_ns();
     bpf_loop(DELAY_LOOPS, spin_until, &start, 0);
     return 0;
}


On 5/19/26 15:26, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    fcee7d82f27d Merge tag 'net-7.1-rc3' of git://git.kernel.o..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=15792ad2580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=59da38148f3a3d24
> dashboard link: https://syzkaller.appspot.com/bug?extid=ad2aac2febc3bedf0962
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-fcee7d82.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/a5dee9aef2ac/vmlinux-fcee7d82.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/7b1a8dd09a15/bzImage-fcee7d82.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+ad2aac2febc3bedf0962@syzkaller.appspotmail.com
>
> iowarrior 10-1:0.186: iowarrior_callback - usb_submit_urb failed with result -1
> ==================================================================
> BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
> BUG: KASAN: slab-use-after-free in atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
> BUG: KASAN: slab-use-after-free in iowarrior_write_callback+0xdc/0x190 drivers/usb/misc/iowarrior.c:236
> Write of size 4 at addr ffff888050f49168 by task kworker/u32:13/17990
>
> CPU: 0 UID: 0 PID: 17990 Comm: kworker/u32:13 Tainted: G             L      syzkaller #0 PREEMPT(full)
> Tainted: [L]=SOFTLOCKUP
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> Workqueue: bat_events batadv_iv_send_outstanding_bat_ogm_packet
> Call Trace:
>   <IRQ>
>   __dump_stack lib/dump_stack.c:94 [inline]
>   dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
>   print_address_description mm/kasan/report.c:378 [inline]
>   print_report+0x13d/0x4b0 mm/kasan/report.c:482
>   kasan_report+0xdf/0x1d0 mm/kasan/report.c:595
>   check_region_inline mm/kasan/generic.c:186 [inline]
>   kasan_check_range+0x10f/0x1e0 mm/kasan/generic.c:200
>   instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
>   atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
>   iowarrior_write_callback+0xdc/0x190 drivers/usb/misc/iowarrior.c:236
>   __usb_hcd_giveback_urb+0x38d/0x610 drivers/usb/core/hcd.c:1657
>   usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
>   dummy_timer+0xda1/0x36c0 drivers/usb/gadget/udc/dummy_hcd.c:2005
>   __run_hrtimer kernel/time/hrtimer.c:1930 [inline]
>   __hrtimer_run_queues+0x470/0xa00 kernel/time/hrtimer.c:1994
>   hrtimer_run_softirq+0x17d/0x2c0 kernel/time/hrtimer.c:2011
>   handle_softirqs+0x1ea/0xa00 kernel/softirq.c:622
>   __do_softirq kernel/softirq.c:656 [inline]
>   invoke_softirq kernel/softirq.c:496 [inline]
>   __irq_exit_rcu+0x162/0x210 kernel/softirq.c:735
>   irq_exit_rcu+0x9/0x30 kernel/softirq.c:752
>   instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1061 [inline]
>   sysvec_apic_timer_interrupt+0xa3/0xc0 arch/x86/kernel/apic/apic.c:1061
>   </IRQ>
>   <TASK>
>   asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
> RIP: 0010:stackdepot_memcmp lib/stackdepot.c:585 [inline]
> RIP: 0010:find_stack lib/stackdepot.c:618 [inline]
> RIP: 0010:stack_depot_save_flags+0x1b5/0x9d0 lib/stackdepot.c:676
> Code: 00 45 39 4e 10 75 ee 45 3b 6e 14 75 e8 31 c0 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 49 8b 7c c6 20 <49> 39 3c c4 75 c5 48 83 c0 01 48 39 c2 75 ec f6 c3 02 74 26 41 8b
> RSP: 0018:ffffc90006dc7870 EFLAGS: 00000202
> RAX: 0000000000000004 RBX: 0000000000000001 RCX: 000000007b9bc970
> RDX: 000000000000000b RSI: 00000000b68975a0 RDI: ffffffff895a9470
> RBP: 0000000000000820 R08: 0000000000d001a0 R09: 00000000decd001a
> R10: 0000000000000200 R11: 000000000000756b R12: ffffc90006dc78c8
> R13: 000000000000000b R14: ffff88802bfe14c0 R15: ffff88816d7001a0
>   kasan_save_stack+0x3f/0x50 mm/kasan/common.c:58
>   kasan_save_track+0x14/0x30 mm/kasan/common.c:78
>   unpoison_slab_object mm/kasan/common.c:340 [inline]
>   __kasan_slab_alloc+0x89/0x90 mm/kasan/common.c:366
>   kasan_slab_alloc include/linux/kasan.h:253 [inline]
>   slab_post_alloc_hook mm/slub.c:4569 [inline]
>   slab_alloc_node mm/slub.c:4898 [inline]
>   kmem_cache_alloc_noprof+0x241/0x6e0 mm/slub.c:4905
>   skb_clone+0x190/0x400 net/core/skbuff.c:2107
>   batadv_iv_ogm_send_to_if net/batman-adv/bat_iv_ogm.c:386 [inline]
>   batadv_iv_ogm_emit net/batman-adv/bat_iv_ogm.c:419 [inline]
>   batadv_iv_send_outstanding_bat_ogm_packet+0x5e5/0x860 net/batman-adv/bat_iv_ogm.c:1700
>   process_one_work+0xa0e/0x1980 kernel/workqueue.c:3302
>   process_scheduled_works kernel/workqueue.c:3385 [inline]
>   worker_thread+0x5ef/0xe50 kernel/workqueue.c:3466
>   kthread+0x370/0x450 kernel/kthread.c:436
>   ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>   </TASK>
>
> Allocated by task 5926:
>   kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
>   kasan_save_track+0x14/0x30 mm/kasan/common.c:78
>   poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
>   __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
>   kmalloc_noprof include/linux/slab.h:950 [inline]
>   kzalloc_noprof include/linux/slab.h:1188 [inline]
>   iowarrior_probe+0x85/0x1220 drivers/usb/misc/iowarrior.c:766
>   usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
>   call_driver_probe drivers/base/dd.c:631 [inline]
>   really_probe+0x241/0xa60 drivers/base/dd.c:709
>   __driver_probe_device+0x22e/0x480 drivers/base/dd.c:871
>   driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:901
>   __device_attach_driver+0x1df/0x340 drivers/base/dd.c:1029
>   bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
>   __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1101
>   device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1156
>   bus_probe_device+0x64/0x160 drivers/base/bus.c:613
>   device_add+0x1210/0x1950 drivers/base/core.c:3706
>   usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
>   usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
>   usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
>   call_driver_probe drivers/base/dd.c:631 [inline]
>   really_probe+0x241/0xa60 drivers/base/dd.c:709
>   __driver_probe_device+0x22e/0x480 drivers/base/dd.c:871
>   driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:901
>   __device_attach_driver+0x1df/0x340 drivers/base/dd.c:1029
>   bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
>   __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1101
>   device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1156
>   bus_probe_device+0x64/0x160 drivers/base/bus.c:613
>   device_add+0x1210/0x1950 drivers/base/core.c:3706
>   usb_new_device.cold+0x685/0x115c drivers/usb/core/hub.c:2695
>   hub_port_connect drivers/usb/core/hub.c:5567 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
>   port_event drivers/usb/core/hub.c:5871 [inline]
>   hub_event+0x314d/0x4af0 drivers/usb/core/hub.c:5953
>   process_one_work+0xa0e/0x1980 kernel/workqueue.c:3302
>   process_scheduled_works kernel/workqueue.c:3385 [inline]
>   worker_thread+0x5ef/0xe50 kernel/workqueue.c:3466
>   kthread+0x370/0x450 kernel/kthread.c:436
>   ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>
> Freed by task 39:
>   kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
>   kasan_save_track+0x14/0x30 mm/kasan/common.c:78
>   kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
>   poison_slab_object mm/kasan/common.c:253 [inline]
>   __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
>   kasan_slab_free include/linux/kasan.h:235 [inline]
>   slab_free_hook mm/slub.c:2689 [inline]
>   slab_free mm/slub.c:6250 [inline]
>   kfree+0x223/0x6c0 mm/slub.c:6565
>   iowarrior_delete drivers/usb/misc/iowarrior.c:249 [inline]
>   iowarrior_disconnect+0x212/0x270 drivers/usb/misc/iowarrior.c:921
>   usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:458
>   device_remove drivers/base/dd.c:621 [inline]
>   device_remove+0x12a/0x180 drivers/base/dd.c:613
>   __device_release_driver drivers/base/dd.c:1352 [inline]
>   device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1375
>   bus_remove_device+0x2bc/0x560 drivers/base/bus.c:657
>   device_del+0x376/0x9b0 drivers/base/core.c:3895
>   usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1478
>   usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2345
>   hub_port_connect drivers/usb/core/hub.c:5407 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
>   port_event drivers/usb/core/hub.c:5871 [inline]
>   hub_event+0x1d0c/0x4af0 drivers/usb/core/hub.c:5953
>   process_one_work+0xa0e/0x1980 kernel/workqueue.c:3302
>   process_scheduled_works kernel/workqueue.c:3385 [inline]
>   worker_thread+0x5ef/0xe50 kernel/workqueue.c:3466
>   kthread+0x370/0x450 kernel/kthread.c:436
>   ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>
> The buggy address belongs to the object at ffff888050f49000
>   which belongs to the cache kmalloc-1k of size 1024
> The buggy address is located 360 bytes inside of
>   freed 1024-byte region [ffff888050f49000, ffff888050f49400)
>
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888050f4a800 pfn:0x50f48
> head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
> page_type: f5(slab)
> raw: 00fff00000000240 ffff88801b842dc0 ffffea00015f2410 ffffea0000d13c10
> raw: ffff888050f4a800 000000080010000d 00000000f5000000 0000000000000000
> head: 00fff00000000240 ffff88801b842dc0 ffffea00015f2410 ffffea0000d13c10
> head: ffff888050f4a800 000000080010000d 00000000f5000000 0000000000000000
> head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
> head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5753, tgid 5753 (udevd), ts 316157882281, free_ts 314951708929
>   set_page_owner include/linux/page_owner.h:32 [inline]
>   post_alloc_hook+0x153/0x170 mm/page_alloc.c:1858
>   prep_new_page mm/page_alloc.c:1866 [inline]
>   get_page_from_freelist+0x11a6/0x33b0 mm/page_alloc.c:3946
>   __alloc_frozen_pages_noprof+0x27c/0x2bc0 mm/page_alloc.c:5226
>   alloc_slab_page mm/slub.c:3278 [inline]
>   allocate_slab mm/slub.c:3467 [inline]
>   new_slab+0xa6/0x6c0 mm/slub.c:3525
>   refill_objects+0x277/0x420 mm/slub.c:7255
>   refill_sheaf mm/slub.c:2816 [inline]
>   __pcs_replace_empty_main+0x375/0x650 mm/slub.c:4651
>   alloc_from_pcs mm/slub.c:4749 [inline]
>   slab_alloc_node mm/slub.c:4883 [inline]
>   __do_kmalloc_node mm/slub.c:5294 [inline]
>   __kvmalloc_node_noprof+0x7da/0xa00 mm/slub.c:6832
>   bucket_table_alloc.isra.0+0x88/0x460 lib/rhashtable.c:186
>   rhashtable_init_noprof+0x43b/0x890 lib/rhashtable.c:1100
>   simple_xattrs_init fs/xattr.c:1618 [inline]
>   simple_xattrs_alloc+0x5c/0xd0 fs/xattr.c:1641
>   class_simple_xattrs_constructor include/linux/xattr.h:165 [inline]
>   shmem_initxattrs+0x7d/0x6c0 mm/shmem.c:4237
>   security_inode_init_security+0x242/0x370 security/security.c:1370
>   shmem_mknod+0x2ce/0x480 mm/shmem.c:3868
>   lookup_open.isra.0+0xc47/0x11b0 fs/namei.c:4511
>   open_last_lookups fs/namei.c:4611 [inline]
>   path_openat+0x2291/0x31a0 fs/namei.c:4855
>   do_file_open+0x20e/0x430 fs/namei.c:4887
> page last free pid 8872 tgid 8872 stack trace:
>   reset_page_owner include/linux/page_owner.h:25 [inline]
>   __free_pages_prepare mm/page_alloc.c:1402 [inline]
>   __free_frozen_pages+0x747/0x1040 mm/page_alloc.c:2943
>   qlink_free mm/kasan/quarantine.c:163 [inline]
>   qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
>   kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
>   __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:350
>   kasan_slab_alloc include/linux/kasan.h:253 [inline]
>   slab_post_alloc_hook mm/slub.c:4569 [inline]
>   slab_alloc_node mm/slub.c:4898 [inline]
>   kmem_cache_alloc_noprof+0x241/0x6e0 mm/slub.c:4905
>   locks_alloc_lock fs/locks.c:285 [inline]
>   flock_lock_inode+0xcdc/0x11c0 fs/locks.c:1150
>   flock_lock_inode_wait fs/locks.c:2163 [inline]
>   locks_lock_inode_wait+0x119/0x490 fs/locks.c:2190
>   locks_lock_file_wait include/linux/filelock.h:455 [inline]
>   __do_sys_flock+0x462/0x4d0 fs/locks.c:2258
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0x10b/0xf80 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Memory state around the buggy address:
>   ffff888050f49000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff888050f49080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> ffff888050f49100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                            ^
>   ffff888050f49180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff888050f49200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
> ----------------
> Code disassembly (best guess):
>     0:	00 45 39             	add    %al,0x39(%rbp)
>     3:	4e 10 75 ee          	rex.WRX adc %r14b,-0x12(%rbp)
>     7:	45 3b 6e 14          	cmp    0x14(%r14),%r13d
>     b:	75 e8                	jne    0xfffffff5
>     d:	31 c0                	xor    %eax,%eax
>     f:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
>    16:	00 00 00 00
>    1a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
>    21:	00 00 00 00
>    25:	49 8b 7c c6 20       	mov    0x20(%r14,%rax,8),%rdi
> * 2a:	49 39 3c c4          	cmp    %rdi,(%r12,%rax,8) <-- trapping instruction
>    2e:	75 c5                	jne    0xfffffff5
>    30:	48 83 c0 01          	add    $0x1,%rax
>    34:	48 39 c2             	cmp    %rax,%rdx
>    37:	75 ec                	jne    0x25
>    39:	f6 c3 02             	test   $0x2,%bl
>    3c:	74 26                	je     0x64
>    3e:	41                   	rex.B
>    3f:	8b                   	.byte 0x8b
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup

