Return-Path: <linux-usb+bounces-27336-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA5DB38F48
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 01:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F7809819A7
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 23:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E8D2F83B4;
	Wed, 27 Aug 2025 23:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z8nAv8ai"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7761D4C97
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 23:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756337473; cv=none; b=syLjskYJ3ywQU+Rk4Uy6Q/y5a6glWR7E+xizCML3xB8Fp2KkwoJjJ1qNs9TfHl9n1NC6bjZQsalbW27yiEQ/TWV29LXe89ipMqzEGoKJv/xtg7OZ1E5FxwGVElLmtn7CsuOYy9qKuB3LIOUNCYChwxeAx4jV+T8cNXyi6oKNqXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756337473; c=relaxed/simple;
	bh=Byw9Dnp30jSEyJNdFDlLzahQ++KBrK2kDvEy1gGi5rA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SCoP2ACTyHSWG7rY7hOz47f8PJc3dV9cx07999pSwj2cBzjriam6F+alot603hIywryGT1lQeFnZK6/OzsmWePMjpT/qfIqIDARLVUYdMOp2uxtMvpehZHRScgtsSQ7eEI3C66TXwfvhFG/EAVA60ZPqeKt4S5EQ1hzVuuuEouQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z8nAv8ai; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-246cf6af2f4so6634225ad.1
        for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 16:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756337472; x=1756942272; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q9sIkDhgq9p9pCTpid4QFeocCB0duJomdSWUT63zQx8=;
        b=Z8nAv8aifQAX8Y7/Epfmwm1DMi9e42m6eoQ3PCwKfqytAGYW5hg8I1aM7AoLjrr4/V
         8TFHbE4OI/AbJ1Bc7ZnsX9ywAj6oFwX2bnpoKFhp02ZWl4lJZZY2l5AoxMrLqFbVk3F7
         Ckb0QgEVN5dN8XOh2y4zixbZ1tPRv9HW/goHQide/mzYPE4uCiz0wC7GTJNf82xsIQKN
         7WGFkVSJIc7t/msfKzY50LJECnhxiSs/Lz+2bBVmK+ZMEqxAXSgTx6YVwfYQibkEGtNZ
         TBb44Y8mWLgpnV22Qv/iAmCBfw2YUxqJWn4BuCXYhH/hC9pkgz7kN4G+0Cn031NqMh6a
         UVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756337472; x=1756942272;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q9sIkDhgq9p9pCTpid4QFeocCB0duJomdSWUT63zQx8=;
        b=lhgBe0+LVe/2qIwloTC8fCWQLXF+BMqHis7P3QjIjy5gT7NU9eLonVxA6pz0DTwMwW
         7otmye49/+Uof0L42tTRog5IigBuPDslivR6QqUZumfJw4lIg/veybCVHLlPW6p4xg/B
         nPdXHq/W0yKipPx9MmZ9m3d1RYeta+YLOQcrhfOxdr4B9IZ1wH49MlaZw3x49JsSdWRg
         mihyHmR0TPQFXbG0CdmNgqzPl87CmidI3HLX74BE9LTWHjor121NBbYvo2gNZzfFKEaG
         LAXlstIrN+QB3es3/5F7kELxRKqlXmu8xDDChPkPfJPFJel1HAV8P3kccoywEUudcsh9
         2FTg==
X-Forwarded-Encrypted: i=1; AJvYcCXzPLISPxsQOrr+SraylAmpd+k/i/nLqhA4NSQ4CP6yF4lfTUKiZHC0zdt7f4W/i8yhCKhCoYnquGA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmt4rEzklBTsspwHM9uaOUr6gQnX+E3yQoIWGIAsz+k66LW417
	P9qpvirgKHXbKPaG2tbFtpIaEx2a0g7SdWUDI4YyDz2l1Bx9OxNX6Hjm8I8lv5orOYaLsCzWSoO
	je2HhAg==
X-Google-Smtp-Source: AGHT+IHzqj1pkC4T6V8SanqfJBwogADnr64SibdgTF27Uzg3ELtWkUN0yPnLosvQEqRX4CxeMeC6TXyxxP4=
X-Received: from plpe13.prod.google.com ([2002:a17:903:3c2d:b0:248:7db1:3800])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:320e:b0:248:9669:a405
 with SMTP id d9443c01a7336-2489669a618mr61077255ad.3.1756337471851; Wed, 27
 Aug 2025 16:31:11 -0700 (PDT)
Date: Wed, 27 Aug 2025 23:31:02 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.268.g9569e192d0-goog
Message-ID: <20250827233108.3768855-1-kuniyu@google.com>
Subject: [PATCH v1 net] net: usb: rtl8150: Fix uninit-value access in set_carrier().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Petko Manolov <petkan@nucleusys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	syzbot+b4d5d8faea6996fd55e3@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot reported set_carrier() accesses an uninitialised local var. [0]

get_registers() is a wrapper of usb_control_msg_recv(), which copies
data to the passed buffer only when it returns 0.

Let's check the retval before accessing tmp in set_carrier().

[0]:
BUG: KMSAN: uninit-value in set_carrier drivers/net/usb/rtl8150.c:721 [inline]
BUG: KMSAN: uninit-value in rtl8150_open+0x1131/0x1360 drivers/net/usb/rtl8150.c:758
 set_carrier drivers/net/usb/rtl8150.c:721 [inline]
 rtl8150_open+0x1131/0x1360 drivers/net/usb/rtl8150.c:758
 __dev_open+0x7e9/0xc60 net/core/dev.c:1682
 __dev_change_flags+0x3a8/0x9f0 net/core/dev.c:9549
 netif_change_flags+0x8d/0x1e0 net/core/dev.c:9612
 dev_change_flags+0x18c/0x320 net/core/dev_api.c:68
 devinet_ioctl+0x1186/0x2500 net/ipv4/devinet.c:1200
 inet_ioctl+0x4c0/0x6f0 net/ipv4/af_inet.c:1001
 sock_do_ioctl+0x9c/0x480 net/socket.c:1238
 sock_ioctl+0x70b/0xd60 net/socket.c:1359
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl+0x23c/0x400 fs/ioctl.c:584
 __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:584
 x64_sys_call+0x1cbc/0x3e20 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable tmp created at:
 number+0x8a/0x2200 lib/vsprintf.c:469
 vsnprintf+0xd21/0x1bd0 lib/vsprintf.c:2890

CPU: 1 UID: 0 PID: 5461 Comm: dhcpcd Not tainted syzkaller #0 PREEMPT(none)
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+b4d5d8faea6996fd55e3@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/68af933a.a00a0220.2929dc.0007.GAE@google.com/
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 drivers/net/usb/rtl8150.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index ddff6f19ff98..0f45627f6a00 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -717,8 +717,8 @@ static void set_carrier(struct net_device *netdev)
 	rtl8150_t *dev = netdev_priv(netdev);
 	short tmp;
 
-	get_registers(dev, CSCR, 2, &tmp);
-	if (tmp & CSCR_LINK_STATUS)
+	if (!get_registers(dev, CSCR, 2, &tmp) &&
+	    (tmp & CSCR_LINK_STATUS))
 		netif_carrier_on(netdev);
 	else
 		netif_carrier_off(netdev);
-- 
2.51.0.268.g9569e192d0-goog


