Return-Path: <linux-usb+bounces-35424-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIejJV5Lw2m5pwQAu9opvQ
	(envelope-from <linux-usb+bounces-35424-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 03:41:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0665231EC55
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 03:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E16830500C0
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 02:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3398928F948;
	Wed, 25 Mar 2026 02:40:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f80.google.com (mail-ot1-f80.google.com [209.85.210.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1DE283FCF
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 02:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406430; cv=none; b=oVZsXD8hB+zFMKlroyt/1fZ783htbg4Cy31sprhYMRZpaRAfIREeRkTJFllgsY2Z9EYlDK6ASrGIBr9r8FjhtS8PuBZArb3akvrnbEzEqKhJvB07x1N0i9guvsSyppcPW0xh8lpvzyPlv/UzqCgEkDQE++6MfLgXsTE8GVoESBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406430; c=relaxed/simple;
	bh=r2/SqIjLIWy0EUSMP3v29DKK68YqLCchwQbERUhn2nM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=B9WSRL4I14HCOIR8/BiynC+3DYGI4sH98Ca+1rAU9CC41xmG8tf8tG6DtktJy+BtPtHBSgFlF71sQSXwdq97nNNd8Lmrba+cuSj5m7OKulHjBkz8POQYU7Ht9AKf7LNmLY7IVlHwCLnn0EVB0D+jn24ldbJu4pwuBkIJ/r9dtA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f80.google.com with SMTP id 46e09a7af769-7d74211ff80so15813000a34.3
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 19:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774406428; x=1775011228;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=06ZkxdPmjXJHAdYiuofRx86KOCd4GJenDBvOMPL3C0A=;
        b=O2ziBZoSYs7HM/TvLU6dMOiMxykNaTyhdz3bKhHgeeHOFPdVEQvCEqFddlZd3fG4CY
         PttKuhFd6PXK2NOoxYmVavs/o6ucClsgDlUdHlbiRTg7ZzNOlk0vSWFO7SKuSLVTD5Sm
         hTC6RZxRGe99LdMq3vkArY1Vtpp2vWv0LIv04BHa4TLN+OpkylN7D8nkuZ/QMC83Rv+Q
         ReyuilVxvcPFjNL6MtS/s1AAbMfqflqRo0/2+TvbXyF3Z/fa+cT9mdlCFpeMq02vfeN3
         1FnEX5QTH6C9ingsSDNDAn5BJGGl/VamsEluL1jo8q81hP8BrKTFp1dKkyTrLSnIo3yj
         NaZw==
X-Forwarded-Encrypted: i=1; AJvYcCUhzcCuDi0LvQPer5c0sAfivYDKWwdanbiw1PyWQfr55ITZVWm4rKTAZGt67FRwIWLBNEiPTG0jFIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyaK2FqpHr8pnxfyYAu5NpKZH8S/5daRsR6xtq9E5NuBjA+WJ0
	LzU3Y32dxlpg9uTS5h7mtOIj40morCCUyuek2sPjfMjzrRK2Z3f8NYgFSEicm8t86rvWOJQ0kOx
	HbR971Jr0Ju6e6J4tRSE1MfWQTaxkD+qcaKzy8ilMPF+b8BZn66DU8Pe0V0o=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:61a:b0:67d:e836:2e35 with SMTP id
 006d021491bc7-67dff534a70mr1160458eaf.47.1774406428462; Tue, 24 Mar 2026
 19:40:28 -0700 (PDT)
Date: Tue, 24 Mar 2026 19:40:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69c34b1c.050a0220.abc16.000b.GAE@google.com>
Subject: [syzbot] [usb?] [net?] KMSAN: uninit-value in rtl8150_open (2)
From: syzbot <syzbot+9db6c624635564ad813c@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, petkan@nucleusys.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=963de479f54c6dbb];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_FROM(0.00)[bounces-35424-lists,linux-usb=lfdr.de,9db6c624635564ad813c];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goo.gl:url,googlegroups.com:email,appspotmail.com:email,storage.googleapis.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 0665231EC55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    c612261bedd6 Merge tag 'io_uring-7.0-20260320' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=155801d6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=963de479f54c6dbb
dashboard link: https://syzkaller.appspot.com/bug?extid=9db6c624635564ad813c
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/aa2bdf537bf6/disk-c612261b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8fcd98072431/vmlinux-c612261b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/737b94c52155/bzImage-c612261b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9db6c624635564ad813c@syzkaller.appspotmail.com

usb 2-1: device reset failed
=====================================================
BUG: KMSAN: uninit-value in set_carrier drivers/net/usb/rtl8150.c:726 [inline]
BUG: KMSAN: uninit-value in rtl8150_open+0x1131/0x1360 drivers/net/usb/rtl8150.c:763
 set_carrier drivers/net/usb/rtl8150.c:726 [inline]
 rtl8150_open+0x1131/0x1360 drivers/net/usb/rtl8150.c:763
 __dev_open+0x8e3/0xd40 net/core/dev.c:1702
 __dev_change_flags+0x32f/0x950 net/core/dev.c:9764
 netif_change_flags+0x8d/0x1e0 net/core/dev.c:9827
 dev_change_flags+0x18c/0x320 net/core/dev_api.c:68
 devinet_ioctl+0x10dd/0x25a0 net/ipv4/devinet.c:1199
 inet_ioctl+0x4c0/0x6f0 net/ipv4/af_inet.c:1015
 sock_do_ioctl net/socket.c:1254 [inline]
 sock_ioctl+0x769/0x1140 net/socket.c:1375
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0x23c/0x400 fs/ioctl.c:583
 __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:583
 x64_sys_call+0x1975/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x134/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable tmp.i created at:
 set_carrier drivers/net/usb/rtl8150.c:723 [inline]
 rtl8150_open+0xc26/0x1360 drivers/net/usb/rtl8150.c:763
 __dev_open+0x8e3/0xd40 net/core/dev.c:1702

CPU: 1 UID: 0 PID: 5428 Comm: dhcpcd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

