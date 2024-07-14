Return-Path: <linux-usb+bounces-12209-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB6D930BEF
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 00:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0486EB21E80
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 22:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B8F13D28F;
	Sun, 14 Jul 2024 22:15:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7425C136982
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 22:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720995328; cv=none; b=WoFGJrWQaXDUzEujXEOYEY6dLC/AYTawlb7mOHLQV5j9/yYoShM8yMjcFk71JdNPbFNreFsm4X/lJOU79vOUoI24lafu5OeyRUuJILnEsJ4sCthlsQac+4V8nZQCMCeW8lRRCSVEsJrPSO2t+mgj0cL9SS+FzCBV3WQvvP9DeiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720995328; c=relaxed/simple;
	bh=7idKCQDyaVmGGpKerW3fWIteTtJ4r7+0APXynq1GelY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=YAUPy3FYUbtZyWymRLtvBqz/vM1htpWGl1KzPRt/fxxT+AYfoNyqNkoxFsN0pVUNBD866bsTuZv+f0PbKy2Cp7tR5Vf1palk3pC2DsjK9f0gchYmi9kNgpgWvRVkE45uM3s37hM8+LtrgrT09ukYkPqjAtF80agxy4aWbQAb5M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7fb15d52c5cso443450939f.3
        for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 15:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720995325; x=1721600125;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J8sCT2cJV+XOpFgesSioFHlQ/OWh8ETytiWFJgIjX/Q=;
        b=cRq0GW92TIH1UP2a1zQuvqn8PjFtMgM4Zn6BdN+tZVOm0e2vOoYUaKDrUW8vsCdrDY
         x6F0ZGAXSgVN+UjJgFrMmKyoyEVzj7L6fMKGS7NqwkIolsYawiiEtZUrK//Or2qKPZac
         4SRXb74IQemvsLLIaWd6TCejGyu5i/HnoU+MpczuXRonUoLrMdfNVEvBstLDJ40GpABO
         jWLCkppLdvaM25OeJFl6tD9NjPxZDpGZcusCCdZMadydg9PRzZW/HWHuwlNRhUwQ4MSb
         /kcdkVt7cAi7T3rxh2afPr+79rh3e5ypWRVyfc49kLmPpAp48SkBwTB0+Q0N18hVRSmN
         2TTg==
X-Forwarded-Encrypted: i=1; AJvYcCXv1rYdPcXFjQqdnDiGFk6rKytFv4bug8uCCrGUwDS8W7yCC7fNd9SEMMrQ7MGI96O7sPZs9xc7SH6ZplmlbT5MI99JkQL2yOUS
X-Gm-Message-State: AOJu0YwCZnQKPiuHw66VtGxJVjkWe85TDCU0pvm9HLdpa06hhXOg/ReU
	Iy1NVtwtrYlpurM+8Em9l480NYOU4tILG96sFlI8sfzZVpYTzCSEtw30lYZ/rAN9JzzFy+ZgB8h
	k6xV62STU/h3E1NY01vsZ1dp/Wd/ImuarwGTL7W9eWmUzwsvunMlymYI=
X-Google-Smtp-Source: AGHT+IH2Pf3MxqpHgT8sMBN7bPpDIiuAofWil9b7h+GNiZ9dk8JKY8jg+VDIRVbK8n94H71RqdrVCOy+ZhKsIIJaPvIQqodzGxmO
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:870a:b0:4c0:9a3e:c24b with SMTP id
 8926c6da1cb9f-4c0b250a17amr1269033173.0.1720995325591; Sun, 14 Jul 2024
 15:15:25 -0700 (PDT)
Date: Sun, 14 Jul 2024 15:15:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000adac5061d3c7355@google.com>
Subject: [syzbot] [sound?] [usb?] UBSAN: shift-out-of-bounds in parse_audio_unit
From: syzbot <syzbot+78d5b129a762182225aa@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
	tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a19ea421490d Merge tag 'platform-drivers-x86-v6.10-6' of g..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=173c2e9e980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b63b35269462a0e0
dashboard link: https://syzkaller.appspot.com/bug?extid=78d5b129a762182225aa
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15773776980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1373427e980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ea993841f842/disk-a19ea421.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/eef900c478c0/vmlinux-a19ea421.xz
kernel image: https://storage.googleapis.com/syzbot-assets/deecea0553fd/bzImage-a19ea421.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+78d5b129a762182225aa@syzkaller.appspotmail.com

usb 1-1: 0:2 : does not exist
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in sound/usb/mixer.c:2057:20
shift exponent 42 is too large for 32-bit type 'int'
CPU: 1 PID: 45 Comm: kworker/1:1 Not tainted 6.10.0-rc7-syzkaller-00025-ga19ea421490d #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/07/2024
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_shift_out_of_bounds+0x3c8/0x420 lib/ubsan.c:468
 parse_audio_feature_unit sound/usb/mixer.c:2057 [inline]
 parse_audio_unit+0x277d/0x3f10 sound/usb/mixer.c:2907
 snd_usb_mixer_controls sound/usb/mixer.c:3252 [inline]
 snd_usb_create_mixer+0x1365/0x2fa0 sound/usb/mixer.c:3599
 usb_audio_probe+0x1688/0x2100 sound/usb/card.c:888
 usb_probe_interface+0x645/0xbb0 drivers/usb/core/driver.c:399
 really_probe+0x2b8/0xad0 drivers/base/dd.c:656
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
 driver_probe_device+0x50/0x430 drivers/base/dd.c:828
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:956
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:457
 __device_attach+0x333/0x520 drivers/base/dd.c:1028
 bus_probe_device+0x189/0x260 drivers/base/bus.c:532
 device_add+0x856/0xbf0 drivers/base/core.c:3679
 usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:254
 usb_probe_device+0x1b8/0x380 drivers/usb/core/driver.c:294
 really_probe+0x2b8/0xad0 drivers/base/dd.c:656
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
 driver_probe_device+0x50/0x430 drivers/base/dd.c:828
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:956
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:457
 __device_attach+0x333/0x520 drivers/base/dd.c:1028
 bus_probe_device+0x189/0x260 drivers/base/bus.c:532
 device_add+0x856/0xbf0 drivers/base/core.c:3679
 usb_new_device+0x104a/0x19a0 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2d6a/0x5150 drivers/usb/core/hub.c:5903
 process_one_work kernel/workqueue.c:3248 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3329
 worker_thread+0x86d/0xd50 kernel/workqueue.c:3409
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
---[ end trace ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

