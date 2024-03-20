Return-Path: <linux-usb+bounces-8110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB79881362
	for <lists+linux-usb@lfdr.de>; Wed, 20 Mar 2024 15:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D02551C21867
	for <lists+linux-usb@lfdr.de>; Wed, 20 Mar 2024 14:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA602481A2;
	Wed, 20 Mar 2024 14:34:36 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1229D433A6
	for <linux-usb@vger.kernel.org>; Wed, 20 Mar 2024 14:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710945276; cv=none; b=a15IHLdr9twODTNEn5XgpQzVNpHi7q1Lq46ET22A5aHi4Qhk/lYBVBDOAr5KW6OstQFhoSG4SNlIXK6ZLwAJdMgGIQBJ4ssyNFQeM3k2xBFoDz4AmccJVwtZP+l0LVCoXrXuGCjEOBQDnajLmMKMiiJ6pxMxSNJEaCzAGQ6UT/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710945276; c=relaxed/simple;
	bh=7hu9ZVSc8l53UBO4uyM282N7T1rYQJki/LduGx1yOF0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Hock8vyv5MVcNcTcBcQwL/gM5bG/yd7jmmIt++NS5OkYMukhmJJf/jhipDTdIdjRUnrQemcySTwD1SDs9u6rlInsJCY5zIqYKb5uZLy6SMLystZ8/rte9JiuY9tgiCf8qPt2+vTCCFI9OO2D+muwg+z45A+4+d6guiesOfhtHUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7cf179c3da4so101763439f.2
        for <linux-usb@vger.kernel.org>; Wed, 20 Mar 2024 07:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710945274; x=1711550074;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=khYNXymsT+E8p0FjZwJDp71uipc4zclpoWCWnK64qRY=;
        b=YySsRlbLXIuPMBxJ6u7cJRwSQAjmTiJ9AM/ucNX7kpBbKly8fiOK57X7mkF2jS2HQZ
         y9AET90YIlxKwDaCbnAmYod1IeC4S/jSpEz+ZZ1J5K3J68uGpKkDYOZOGPt0rMPNFBn5
         nvuW3Eflm2GmBY1ynVFjGmASQnI49p9P6vjYI46r+nK8zjMKsJC78DnfjwMJHOF2LBJI
         AIHuY59ete7sqV0RLtGtw/OfxNNG7nubjvhtdqoSm9aZnvOzlraOeslREx+/hW2mCuuS
         aI/6F852hNJMr8Hu8/u2YCsi+OoldjlKYqAzWibM4SUp8j/iuybFuY6WX2P9384WZw7Z
         QKHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJaXXdxW/4RT1LsNRfCT6FEHPC+8UKupi+kllqZqmR6Hw8zuv6AXLuWyS7s+RQZcaBRSPLMfdaBrLX1SMCCw6IPLSX8K26/Yva
X-Gm-Message-State: AOJu0Yy1St6TrFw0AYSR+LgP48BkMExLWtlgjcV6VJpspXardpFLMZcv
	8a5UwM1QV1g24VJBgj01DRPsLXRcAGUeVIp6wjYLPtn7MTmjNgjzJEZ92KwDQGQdjtYaloc/UHZ
	kLTsKIV/uirzPRdBbA1lYiRGx6/MhvOX6Ie8IcxVuSCw90yiiMwLRNF4=
X-Google-Smtp-Source: AGHT+IEwUt5CmmdyfyrxTdDCrWQb6XdC90azZ1N1oTcLzD7kppA3xheYUiF6BoxPXSNq/r0ALn1COjuDtKRDzVOD8Ttg/7hxXo6Y
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3424:b0:7cc:70b6:4379 with SMTP id
 n36-20020a056602342400b007cc70b64379mr265593ioz.1.1710945274309; Wed, 20 Mar
 2024 07:34:34 -0700 (PDT)
Date: Wed, 20 Mar 2024 07:34:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004e41110614187d35@google.com>
Subject: [syzbot] [wireless?] [usb?] UBSAN: array-index-out-of-bounds in htc_issue_send
From: syzbot <syzbot+93cbd5fbb85814306ba1@syzkaller.appspotmail.com>
To: kvalo@kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, toke@toke.dk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a788e53c05ae usb: usb-acpi: Fix oops due to freeing uninit..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1324bffa180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dd8c589043bc2b49
dashboard link: https://syzkaller.appspot.com/bug?extid=93cbd5fbb85814306ba1
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11c95c6e180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1734b9f1180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/070d17d2f510/disk-a788e53c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/13f35a4bb3f0/vmlinux-a788e53c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6825f1cdc918/bzImage-a788e53c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+93cbd5fbb85814306ba1@syzkaller.appspotmail.com

usb 1-1: ath9k_htc: Transferred FW: ath9k_htc/htc_9271-1.4.0.fw, size: 51008
ath9k_htc 1-1:1.0: ath9k_htc: HTC initialized with 33 credits
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in drivers/net/wireless/ath/ath9k/htc_hst.c:26:51
index 255 is out of range for type 'htc_endpoint [22]'
CPU: 1 PID: 2494 Comm: kworker/1:2 Not tainted 6.8.0-rc6-syzkaller-00190-ga788e53c05ae #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/29/2024
Workqueue: events request_firmware_work_func
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x125/0x1b0 lib/dump_stack.c:106
 ubsan_epilogue lib/ubsan.c:217 [inline]
 __ubsan_handle_out_of_bounds+0x111/0x150 lib/ubsan.c:347
 htc_issue_send.constprop.0+0x209/0x230 drivers/net/wireless/ath/ath9k/htc_hst.c:26
 ath9k_wmi_cmd_issue drivers/net/wireless/ath/ath9k/wmi.c:305 [inline]
 ath9k_wmi_cmd+0x424/0x630 drivers/net/wireless/ath/ath9k/wmi.c:342
 ath9k_regread+0xdb/0x160 drivers/net/wireless/ath/ath9k/htc_drv_init.c:242
 ath9k_hw_read_revisions drivers/net/wireless/ath/ath9k/hw.c:287 [inline]
 __ath9k_hw_init drivers/net/wireless/ath/ath9k/hw.c:572 [inline]
 ath9k_hw_init+0xf02/0x2b30 drivers/net/wireless/ath/ath9k/hw.c:700
 ath9k_init_priv drivers/net/wireless/ath/ath9k/htc_drv_init.c:662 [inline]
 ath9k_init_device drivers/net/wireless/ath/ath9k/htc_drv_init.c:839 [inline]
 ath9k_htc_probe_device+0xb37/0x25f0 drivers/net/wireless/ath/ath9k/htc_drv_init.c:963
 ath9k_htc_hw_init+0x33/0x70 drivers/net/wireless/ath/ath9k/htc_hst.c:529
 ath9k_hif_usb_firmware_cb+0x272/0x620 drivers/net/wireless/ath/ath9k/hif_usb.c:1273
 request_firmware_work_func+0x13a/0x240 drivers/base/firmware_loader/main.c:1163
 process_one_work+0x886/0x15d0 kernel/workqueue.c:2633
 process_scheduled_works kernel/workqueue.c:2706 [inline]
 worker_thread+0x8b9/0x1290 kernel/workqueue.c:2787
 kthread+0x2c6/0x3a0 kernel/kthread.c:388
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:243
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

