Return-Path: <linux-usb+bounces-16843-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BA29B5700
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2024 00:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EC1C282D26
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 23:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D535720B213;
	Tue, 29 Oct 2024 23:33:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209162076C0
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 23:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730244811; cv=none; b=h5Nthc+ip84cnTBlcjY0SkSOBQwicQFpcjjPXp+/+UbosIgse15VdFIbTzRMwHB5PNL4oh2CJtS0tL8P2d27ujsOU0jOl+HasFu8XSyDJNDdLMJWGMEmsoWjYEEQAf/9/dU2QDPL01H26915/sdrWOoiEXtlOaSAYQKrholq+uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730244811; c=relaxed/simple;
	bh=lkGFz66Izmi1TwdOfObxU/3HwWsi+KmWRZv5/Wwjws8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DHGNRZFe2oj2SsHVbxuxx8xmyJO0NTCa5rwt4CBwWBtoEVUWlThcgeSXkctXyAxU5vOA9pAxol+01Kme7A6/1i2+CjWwfmbnGXQPjK9kZWiftRlzQemsud9YvS5TZQ8sJxtFeyyF+qwrQz6s5G3yih7mRzeYhUnSSaYpulbuYoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a4e94ac5e9so38650245ab.2
        for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 16:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730244808; x=1730849608;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0K3qxZIjQsyUM9E4K+xe2W1RC/TsuCHPYquESVj5rOk=;
        b=E60UKTF5f4Aoddq3ifvMVLXf2Ti2fglwOCieAjrcXlTxVIy1DPP9yqaoApNjvOC2oI
         dXHjRi2UcyZCby7F3CicNjMH+C0YcGyLvDYBQ7zR6XDiVjLOz++rAzyrXDU3DgyqBgzP
         jXesbxQ5EinV0MCNHgQ7ksl1aU8YOZ1z8ETZt8mRV+0UU72SzFxYIUqkApjhvSFX8tJf
         HSH6mvyEQvSltKY920/gmc9f6IhPEFB7WyQ7pofaHCT+RFuhKQjyIvfslW/wfC1UOoU/
         cCUXFNMOzDTLGVt2hcyDZA938ouiew2vua1BvcunxhTleHNGq3uA74n+w5MsmqzFoCqh
         PuOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuJWmD2m6B4URMR9dazcOnpm9XKhzRkzyAt1st5U8UVaitWfLzZgXEQWRGx26hCkMk9YvTloQldZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0fybSdDIS5jFGZxDrSAs16hKPUKHAquicmfCG/VUakAi7oka/
	GO1z6Kptm0VIyUkad1pNJiUdgMx02Ng8figpfpKfHyAvWA9bNywQYNnDOSYVXWt4od03VsQHt/G
	WcOoys2eTRJJ0ooyCbbMxhbJJre/SPYrAoe5lQ8zEfHLunaTS4xJvqvc=
X-Google-Smtp-Source: AGHT+IFHXvRvSi/wbqVbYgwQWCe+DpQurNEz08PBFbkRm71LC6vYmdCBqjkwQVgPqlorUxvZTXQmo6a+dQxdcZZNcXcUF954UsGc
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16c9:b0:3a0:4250:165f with SMTP id
 e9e14a558f8ab-3a4ed1ba55emr135378245ab.0.1730244808264; Tue, 29 Oct 2024
 16:33:28 -0700 (PDT)
Date: Tue, 29 Oct 2024 16:33:28 -0700
In-Reply-To: <000000000000869803061fb207d1@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <672170c8.050a0220.24951d.007d.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING: ODEBUG bug in get_taint
From: syzbot <syzbot+ffe5c7db7c30a0fbb165@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, andrew@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, oneukum@suse.com, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    e42b1a9a2557 Merge tag 'spi-fix-v6.12-rc5' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16fb4540580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=59c645aba1a913f
dashboard link: https://syzkaller.appspot.com/bug?extid=ffe5c7db7c30a0fbb165
compiler:       arm-linux-gnueabi-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16f7ee40580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12953687980000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/8ead8862021c/non_bootable_disk-e42b1a9a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/58af25eb211f/vmlinux-e42b1a9a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7c1b9c1d3d1b/zImage-e42b1a9a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ffe5c7db7c30a0fbb165@syzkaller.appspotmail.com

dm9601 1-1:47.0 eth1: unregister 'dm9601' usb-dummy_hcd.0-1, Davicom DM96xx USB 10/100 Ethernet
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1781 at lib/debugobjects.c:514 debug_print_object+0xc4/0xd8 lib/debugobjects.c:514
ODEBUG: free active (active state 0) object: 8436afcc object type: work_struct hint: usbnet_deferred_kevent+0x0/0x394 drivers/net/usb/usbnet.c:633
Modules linked in:
Kernel panic - not syncing: kernel: panic_on_warn set ...
CPU: 0 UID: 0 PID: 1781 Comm: kworker/0:3 Not tainted 6.12.0-rc5-syzkaller #0
Hardware name: ARM-Versatile Express
Workqueue: usb_hub_wq hub_event
Call trace: 
[<8199a4d8>] (dump_backtrace) from [<8199a5d4>] (show_stack+0x18/0x1c arch/arm/kernel/traps.c:257)
 r7:00000000 r6:82622f44 r5:00000000 r4:8203d914
[<8199a5bc>] (show_stack) from [<819b8a70>] (__dump_stack lib/dump_stack.c:94 [inline])
[<8199a5bc>] (show_stack) from [<819b8a70>] (dump_stack_lvl+0x54/0x7c lib/dump_stack.c:120)
[<819b8a1c>] (dump_stack_lvl) from [<819b8ab0>] (dump_stack+0x18/0x1c lib/dump_stack.c:129)
 r5:00000000 r4:82870d18
[<819b8a98>] (dump_stack) from [<8199b100>] (panic+0x120/0x374 kernel/panic.c:354)
[<8199afe0>] (panic) from [<802420e0>] (check_panic_on_warn kernel/panic.c:243 [inline])
[<8199afe0>] (panic) from [<802420e0>] (get_taint+0x0/0x1c kernel/panic.c:238)
 r3:8260c5c4 r2:00000001 r1:82025ce8 r0:8202d750
 r7:808547a0
[<8024206c>] (check_panic_on_warn) from [<80242244>] (__warn+0x80/0x188 kernel/panic.c:748)
[<802421c4>] (__warn) from [<80242534>] (warn_slowpath_fmt+0x1e8/0x1f4 kernel/panic.c:783)
 r8:00000009 r7:8208ca38 r6:eb0b9a8c r5:8357b000 r4:00000000
[<80242350>] (warn_slowpath_fmt) from [<808547a0>] (debug_print_object+0xc4/0xd8 lib/debugobjects.c:514)
 r10:00000005 r9:8436a800 r8:81a01c24 r7:820b7828 r6:828dd084 r5:eb0b9b34
 r4:8260cda4
[<808546dc>] (debug_print_object) from [<80856030>] (__debug_check_no_obj_freed lib/debugobjects.c:989 [inline])
[<808546dc>] (debug_print_object) from [<80856030>] (debug_check_no_obj_freed+0x254/0x2a0 lib/debugobjects.c:1019)
 r8:8436b000 r7:8436afcc r6:00000100 r5:00000003 r4:00000000
[<80855ddc>] (debug_check_no_obj_freed) from [<804c91c4>] (slab_free_hook mm/slub.c:2273 [inline])
[<80855ddc>] (debug_check_no_obj_freed) from [<804c91c4>] (slab_free mm/slub.c:4579 [inline])
[<80855ddc>] (debug_check_no_obj_freed) from [<804c91c4>] (kfree+0x190/0x394 mm/slub.c:4727)
 r10:8277dc60 r9:844b0c80 r8:8436a800 r7:8046d198 r6:82c023c0 r5:dde90aa0
 r4:8436a800
[<804c9034>] (kfree) from [<8046d198>] (kvfree+0x2c/0x30 mm/util.c:701)
 r10:8277dc60 r9:844b0c80 r8:8436a800 r7:00000000 r6:845e6200 r5:84745e80
 r4:8436a800
[<8046d16c>] (kvfree) from [<814fc658>] (netdev_release+0x2c/0x34 net/core/net-sysfs.c:2034)
 r5:84745e80 r4:8436a800
[<814fc62c>] (netdev_release) from [<80aa3b24>] (device_release+0x38/0xa8 drivers/base/core.c:2575)
 r5:84745e80 r4:8436abc0
[<80aa3aec>] (device_release) from [<8197432c>] (kobject_cleanup lib/kobject.c:689 [inline])
[<80aa3aec>] (device_release) from [<8197432c>] (kobject_release lib/kobject.c:720 [inline])
[<80aa3aec>] (device_release) from [<8197432c>] (kref_put include/linux/kref.h:65 [inline])
[<80aa3aec>] (device_release) from [<8197432c>] (kobject_put+0xa0/0x1f4 lib/kobject.c:737)
 r5:81b4c9c4 r4:8436abc0
[<8197428c>] (kobject_put) from [<80aa3d50>] (put_device+0x18/0x1c drivers/base/core.c:3783)
 r7:844b3800 r6:00000000 r5:8436a800 r4:00000000
[<80aa3d38>] (put_device) from [<814b0d24>] (free_netdev+0x134/0x1ac net/core/dev.c:11255)
[<814b0bf0>] (free_netdev) from [<80d88104>] (usbnet_disconnect+0xb8/0xfc drivers/net/usb/usbnet.c:1652)
 r6:8436af94 r5:8436ae80 r4:00000000
[<80d8804c>] (usbnet_disconnect) from [<80df0930>] (usb_unbind_interface+0x84/0x2c4 drivers/usb/core/driver.c:461)
 r8:00000044 r7:844b3830 r6:8277dc60 r5:00000000 r4:844b3800
[<80df08ac>] (usb_unbind_interface) from [<80aabc14>] (device_remove drivers/base/dd.c:569 [inline])
[<80df08ac>] (usb_unbind_interface) from [<80aabc14>] (device_remove+0x64/0x6c drivers/base/dd.c:561)
 r10:00000000 r9:844b0c80 r8:00000044 r7:844b3874 r6:8277dc60 r5:00000000
 r4:844b3830
[<80aabbb0>] (device_remove) from [<80aad100>] (__device_release_driver drivers/base/dd.c:1273 [inline])
[<80aabbb0>] (device_remove) from [<80aad100>] (device_release_driver_internal+0x18c/0x200 drivers/base/dd.c:1296)
 r5:00000000 r4:844b3830
[<80aacf74>] (device_release_driver_internal) from [<80aad18c>] (device_release_driver+0x18/0x1c drivers/base/dd.c:1319)
 r9:844b0c80 r8:83410140 r7:83410138 r6:8341010c r5:844b3830 r4:83410130
[<80aad174>] (device_release_driver) from [<80aab270>] (bus_remove_device+0xcc/0x120 drivers/base/bus.c:576)
[<80aab1a4>] (bus_remove_device) from [<80aa55ac>] (device_del+0x148/0x38c drivers/base/core.c:3864)
 r9:844b0c80 r8:8357b000 r7:04208060 r6:00000000 r5:844b3830 r4:844b3874
[<80aa5464>] (device_del) from [<80dee34c>] (usb_disable_device+0xdc/0x1f0 drivers/usb/core/message.c:1418)
 r10:00000000 r9:00000000 r8:844b3800 r7:844b0c00 r6:842e7a48 r5:00000002
 r4:00000070
[<80dee270>] (usb_disable_device) from [<80de31b0>] (usb_disconnect+0xec/0x29c drivers/usb/core/hub.c:2304)
 r10:00000001 r9:8450a000 r8:844b0cc4 r7:83d3a800 r6:844b0c80 r5:844b0c00
 r4:60000013
[<80de30c4>] (usb_disconnect) from [<80de5e60>] (hub_port_connect drivers/usb/core/hub.c:5361 [inline])
[<80de30c4>] (usb_disconnect) from [<80de5e60>] (hub_port_connect_change drivers/usb/core/hub.c:5661 [inline])
[<80de30c4>] (usb_disconnect) from [<80de5e60>] (port_event drivers/usb/core/hub.c:5821 [inline])
[<80de30c4>] (usb_disconnect) from [<80de5e60>] (hub_event+0xe78/0x194c drivers/usb/core/hub.c:5903)
 r10:00000001 r9:00000100 r8:83c7f100 r7:844b0c00 r6:83d3a000 r5:83d3aa10
 r4:00000001
[<80de4fe8>] (hub_event) from [<80266034>] (process_one_work+0x1b4/0x4f4 kernel/workqueue.c:3229)
 r10:82fd8405 r9:8357b000 r8:00800000 r7:dddd00c0 r6:82fd8400 r5:83c7f100
 r4:83e18e00
[<80265e80>] (process_one_work) from [<80266c18>] (process_scheduled_works kernel/workqueue.c:3310 [inline])
[<80265e80>] (process_one_work) from [<80266c18>] (worker_thread+0x1ec/0x3bc kernel/workqueue.c:3391)
 r10:8357b000 r9:83e18e2c r8:61c88647 r7:dddd00e0 r6:82604d40 r5:dddd00c0
 r4:83e18e00
[<80266a2c>] (worker_thread) from [<8026fc94>] (kthread+0x104/0x134 kernel/kthread.c:389)
 r10:00000000 r9:df839e78 r8:83e16fc0 r7:83e18e00 r6:80266a2c r5:8357b000
 r4:83e16f40
[<8026fb90>] (kthread) from [<80200114>] (ret_from_fork+0x14/0x20 arch/arm/kernel/entry-common.S:137)
Exception stack(0xeb0b9fb0 to 0xeb0b9ff8)
9fa0:                                     00000000 00000000 00000000 00000000
9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:8026fb90 r4:83e16f40
Rebooting in 86400 seconds..


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

