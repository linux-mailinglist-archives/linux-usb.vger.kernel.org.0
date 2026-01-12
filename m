Return-Path: <linux-usb+bounces-32196-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF29D1397F
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 16:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10F833011756
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 15:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68ABB2DD5E2;
	Mon, 12 Jan 2026 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IC1g49w/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2382DC77A
	for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 15:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230379; cv=none; b=UE4mAySJX3ddcBENUm34nPI6AM1KFju3GKN/lf7suCz5JErXjHFhCDd+WsxVNI3LxFNzyrJf8hghUWSsbO5DTYuWh/+YRacl4fZSkVc9UgTFL3AhQo3tv7CVcFXPXPmS5C4vGlX3IYlhh6lEVEQokFSwlQ43+dXyHASPIa24ufY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230379; c=relaxed/simple;
	bh=m3sDGYbP4LAiAlRA4t1gwzx9rw2TEXSCqunZ4l6sYNI=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=twG3MECHmM/lp2gIY/+kafKA+K9rhv1zQOXcE/oCSvtmcqe8M0RCdUmwgRpas6W7FAxQlOuwfF11J1MaZ4sajfDLsGO1CQOPhdd3Wr3+1+yet9lzMQszXvk9H5d6Fg2CSLEbi6atESujTNBY4D2caW+DC8rJ2g6zLFMN5Ya4En0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IC1g49w/; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47796a837c7so45083425e9.0
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 07:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768230376; x=1768835176; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oVLSKY8KXoL9o1nEkRxlA9lFOUXRreqt0ImO+n3Uis=;
        b=IC1g49w/6TisoEg/sV+0oTexVCIgtGZ7cts3gce2GiJLAEZulo2NNUdMhQEIrA3jbU
         GEsP5Jklv0XLBeY8Ea1y1E2jzNldO4qRJcV8LG9O2ACUgPIgbYJzWaWUxu3vX/AmJEXK
         X0RJHsB4emR8wSHM77d/8X+k2F5a9YBuOOnOrgQTe17MAF9ParT2eAWW9HNkttJtXHyr
         K5afK33s0s9HEaucREqXxeMudUiiP8ZHPxCwPzkWNsuvWmN+xyDC00TO7+tMuew1YZwp
         +w3eavu/vNjC0j1B5nHeqNadAV8NpCRW5Ace33XzPnqm7hw7glwLVjEwyb0NbHjLuGR6
         YxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768230376; x=1768835176;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oVLSKY8KXoL9o1nEkRxlA9lFOUXRreqt0ImO+n3Uis=;
        b=rjdQIbCnbh7D8gk+WhJC+0nqUipwmfxLeVHywmiY8FtmLL5WpYekmWyOJyZdhB69tT
         +QVU7oE2nM9pNZD3IiYtpj6eoxlKJylKGyUr+tEA+QHMoUwFchPslquTQuRzTF7DHCK+
         HsRb6cqF2m8tDm/3meecBkzf8lIyuOe2mIR5X7UwYYfdxhGS6P6rh6lO4fvtpxcJydJ0
         ITQTB1jxmBMc9E+p/a3kYqWy02Y1NiR/HZBGRjKJfFBz7MoVEtMB05QFeVnWEpSPmQtX
         BmhFPR/u+VGxYtqIRYQfFbuE3KCQPV35uo4LpW2LH6TIk6gBO2f4y2jZ5SWPvQtcJYLH
         2dBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7algMFmePC+DVyRqV6sllwx/0NFwJ5BuRv4/wrhtaYWl2cBm5OKJ2tply4C0wbAOCX950cfOhse0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0NgXZwSL1bCbf9LK6dpCEhkI14IpF487k/vdb8QhORCuuyU61
	jAvhngmLvytOgsBaGwSl24pdHQVrJixoqk0ppJ9yIBLodrtDUmVcLY1bN6j39+QkUNQ=
X-Gm-Gg: AY/fxX4Kcrf4dRQi33TzBHiFxt40YMEarDJRXXP6XCIO5xPvs5nzymfDTiG8ozJc4dD
	81vDkxI5BehVCHqCrnlKsaUpSaBu8AvYkOj+hPY8ciFa/KwkTDUC8OJs03qs4AIH1CPxaZS6Dpc
	bcQtpU7XK2bZ75es+rvBaCsMp9dcckp1fqZ927LGebg2BUKqVPghwWYBtAEOvb6WXBv6FXDOunk
	o/Il4fqkpTpuJTWP2b/uk+IDkzJsZqtdPzCyrFF1vhh/pM0zzpmWXqOBOK18SmMT/GUz9uPvbsc
	Fuc+JL5bF4/JgK5cUs1U2g1mvu3XfWs5jFg0J3LFn/WHaJBZfaLmBeFw0Vh4M65ON6ssMlSpik7
	dgpBxQ/dN3xGTv8KSRMqtj4KPJce990FTEgXxbsx3uBLG4BRfsEQFFxlIB+NZeWoNm+U3DdkZ+o
	sxZGyhcC9wiIzjcOsrWslK3Jg67nWb1j2WyG+Ke9ZOTiyVkqMpdYPdX70=
X-Google-Smtp-Source: AGHT+IEUOcRXJTyyHVFBsIhIVqrCAX0vCU4CanCSSanlmc2WcaLdcAnoXfKE/LAHCL9P0UjtYoRreQ==
X-Received: by 2002:a05:600c:4752:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-47d84b54c47mr180869745e9.18.1768230376219;
        Mon, 12 Jan 2026 07:06:16 -0800 (PST)
Received: from ?IPV6:2001:a61:1384:5201:596d:baf2:9af9:9ecc? ([2001:a61:1384:5201:596d:baf2:9af9:9ecc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f7053f5sm354498565e9.14.2026.01.12.07.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 07:06:15 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------XEcuyIL7xgatR37yyvk7tGDd"
Message-ID: <04184aa1-0a74-4247-b618-0390108558cc@suse.com>
Date: Mon, 12 Jan 2026 16:06:15 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] memory leak in es58x_open
To: syzbot <syzbot+e8cb6691a7cf68256cb8@syzkaller.appspotmail.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6948d6c3.a70a0220.25eec0.0084.GAE@google.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <6948d6c3.a70a0220.25eec0.0084.GAE@google.com>

This is a multi-part message in MIME format.
--------------XEcuyIL7xgatR37yyvk7tGDd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

#syz test: upstream ea1013c15392

On 22.12.25 06:27, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    ea1013c15392 Merge tag 'bpf-fixes' of git://git.kernel.org..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1607bdc2580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d60836e327fd6756
> dashboard link: https://syzkaller.appspot.com/bug?extid=e8cb6691a7cf68256cb8
> compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=131add92580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/5ee91238d53c/disk-ea1013c1.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/b8eb70b8203f/vmlinux-ea1013c1.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/3aed81c1b1c5/bzImage-ea1013c1.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+e8cb6691a7cf68256cb8@syzkaller.appspotmail.com
> 
> BUG: memory leak
> unreferenced object 0xffff88812623e000 (size 512):
>    comm "dhcpcd", pid 5478, jiffies 4294946142
>    hex dump (first 32 bytes):
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace (crc 0):
>      kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
>      slab_post_alloc_hook mm/slub.c:4958 [inline]
>      slab_alloc_node mm/slub.c:5263 [inline]
>      __do_kmalloc_node mm/slub.c:5656 [inline]
>      __kmalloc_noprof+0x3e0/0x660 mm/slub.c:5669
>      kmalloc_noprof include/linux/slab.h:961 [inline]
>      hcd_buffer_alloc+0x151/0x190 drivers/usb/core/buffer.c:134
>      usb_alloc_coherent+0x44/0x70 drivers/usb/core/usb.c:1010
>      es58x_alloc_urb+0x4c/0xc0 drivers/net/can/usb/etas_es58x/es58x_core.c:1553
>      es58x_alloc_rx_urbs drivers/net/can/usb/etas_es58x/es58x_core.c:1711 [inline]
>      es58x_open+0x1b3/0x470 drivers/net/can/usb/etas_es58x/es58x_core.c:1785
>      __dev_open+0x1be/0x3c0 net/core/dev.c:1683
>      __dev_change_flags+0x30c/0x380 net/core/dev.c:9734
>      netif_change_flags+0x35/0x90 net/core/dev.c:9797
>      dev_change_flags+0x64/0xf0 net/core/dev_api.c:68
>      devinet_ioctl+0x5bf/0xd30 net/ipv4/devinet.c:1199
>      inet_ioctl+0x27c/0x2b0 net/ipv4/af_inet.c:1009
>      sock_do_ioctl+0x84/0x1a0 net/socket.c:1254
>      sock_ioctl+0x149/0x480 net/socket.c:1375
>      vfs_ioctl fs/ioctl.c:51 [inline]
>      __do_sys_ioctl fs/ioctl.c:597 [inline]
>      __se_sys_ioctl fs/ioctl.c:583 [inline]
>      __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
>      do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>      do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> BUG: memory leak
> unreferenced object 0xffff888126112200 (size 512):
>    comm "dhcpcd", pid 5478, jiffies 4294946373
>    hex dump (first 32 bytes):
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace (crc 0):
>      kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
>      slab_post_alloc_hook mm/slub.c:4958 [inline]
>      slab_alloc_node mm/slub.c:5263 [inline]
>      __do_kmalloc_node mm/slub.c:5656 [inline]
>      __kmalloc_noprof+0x3e0/0x660 mm/slub.c:5669
>      kmalloc_noprof include/linux/slab.h:961 [inline]
>      hcd_buffer_alloc+0x151/0x190 drivers/usb/core/buffer.c:134
>      usb_alloc_coherent+0x44/0x70 drivers/usb/core/usb.c:1010
>      es58x_alloc_urb+0x4c/0xc0 drivers/net/can/usb/etas_es58x/es58x_core.c:1553
>      es58x_alloc_rx_urbs drivers/net/can/usb/etas_es58x/es58x_core.c:1711 [inline]
>      es58x_open+0x1b3/0x470 drivers/net/can/usb/etas_es58x/es58x_core.c:1785
>      __dev_open+0x1be/0x3c0 net/core/dev.c:1683
>      __dev_change_flags+0x30c/0x380 net/core/dev.c:9734
>      netif_change_flags+0x35/0x90 net/core/dev.c:9797
>      dev_change_flags+0x64/0xf0 net/core/dev_api.c:68
>      devinet_ioctl+0x5bf/0xd30 net/ipv4/devinet.c:1199
>      inet_ioctl+0x27c/0x2b0 net/ipv4/af_inet.c:1009
>      sock_do_ioctl+0x84/0x1a0 net/socket.c:1254
>      sock_ioctl+0x149/0x480 net/socket.c:1375
>      vfs_ioctl fs/ioctl.c:51 [inline]
>      __do_sys_ioctl fs/ioctl.c:597 [inline]
>      __se_sys_ioctl fs/ioctl.c:583 [inline]
>      __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
>      do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>      do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> BUG: memory leak
> unreferenced object 0xffff888126188800 (size 512):
>    comm "dhcpcd", pid 5478, jiffies 4294946404
>    hex dump (first 32 bytes):
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace (crc 0):
>      kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
>      slab_post_alloc_hook mm/slub.c:4958 [inline]
>      slab_alloc_node mm/slub.c:5263 [inline]
>      __do_kmalloc_node mm/slub.c:5656 [inline]
>      __kmalloc_noprof+0x3e0/0x660 mm/slub.c:5669
>      kmalloc_noprof include/linux/slab.h:961 [inline]
>      hcd_buffer_alloc+0x151/0x190 drivers/usb/core/buffer.c:134
>      usb_alloc_coherent+0x44/0x70 drivers/usb/core/usb.c:1010
>      es58x_alloc_urb+0x4c/0xc0 drivers/net/can/usb/etas_es58x/es58x_core.c:1553
>      es58x_alloc_rx_urbs drivers/net/can/usb/etas_es58x/es58x_core.c:1711 [inline]
>      es58x_open+0x1b3/0x470 drivers/net/can/usb/etas_es58x/es58x_core.c:1785
>      __dev_open+0x1be/0x3c0 net/core/dev.c:1683
>      __dev_change_flags+0x30c/0x380 net/core/dev.c:9734
>      netif_change_flags+0x35/0x90 net/core/dev.c:9797
>      dev_change_flags+0x64/0xf0 net/core/dev_api.c:68
>      devinet_ioctl+0x5bf/0xd30 net/ipv4/devinet.c:1199
>      inet_ioctl+0x27c/0x2b0 net/ipv4/af_inet.c:1009
>      sock_do_ioctl+0x84/0x1a0 net/socket.c:1254
>      sock_ioctl+0x149/0x480 net/socket.c:1375
>      vfs_ioctl fs/ioctl.c:51 [inline]
>      __do_sys_ioctl fs/ioctl.c:597 [inline]
>      __se_sys_ioctl fs/ioctl.c:583 [inline]
>      __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
>      do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>      do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF
--------------XEcuyIL7xgatR37yyvk7tGDd
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-net-can-etas_es58x-full-cleanup-in-the-error-case.patch"
Content-Disposition: attachment;
 filename*0="0001-net-can-etas_es58x-full-cleanup-in-the-error-case.patch"
Content-Transfer-Encoding: base64

RnJvbSAyYzcyMzliOGM4NmRmOTFmYWQ4MTYzNjVmNWFlNzk4MDY3MjY3ODBmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBNb24sIDEyIEphbiAyMDI2IDE2OjAxOjM5ICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gbmV0OiBjYW46IGV0YXNfZXM1OHg6IGZ1bGwgY2xlYW51cCBpbiB0aGUgZXJyb3IgY2Fz
ZQoKTWVtb3J5IGFsbG9jYXRpb24gY2FuIGZhaWwgaW4gdGhlIG1pZGRsZS4gSGVuY2UgdGhl
IGNsZWFudXAKbmVlZHMgdG8gYmUgY2FsbGVkIGluIGV2ZXJ5IGNhc2UuCgpTaWduZWQtb2Zm
LWJ5OiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvbmV0
L2Nhbi91c2IvZXRhc19lczU4eC9lczU4eF9jb3JlLmMgfCAzICsrLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbmV0L2Nhbi91c2IvZXRhc19lczU4eC9lczU4eF9jb3JlLmMgYi9kcml2ZXJzL25ldC9j
YW4vdXNiL2V0YXNfZXM1OHgvZXM1OHhfY29yZS5jCmluZGV4IGY3OTkyMzNjMmI3Mi4uOGE4
NzY0Mzc0NzEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9jYW4vdXNiL2V0YXNfZXM1OHgv
ZXM1OHhfY29yZS5jCisrKyBiL2RyaXZlcnMvbmV0L2Nhbi91c2IvZXRhc19lczU4eC9lczU4
eF9jb3JlLmMKQEAgLTE3ODMsOCArMTc4Myw5IEBAIHN0YXRpYyBpbnQgZXM1OHhfb3Blbihz
dHJ1Y3QgbmV0X2RldmljZSAqbmV0ZGV2KQogCiAJaWYgKCFlczU4eF9kZXYtPm9wZW5lZF9j
aGFubmVsX2NudCkgewogCQlyZXQgPSBlczU4eF9hbGxvY19yeF91cmJzKGVzNTh4X2Rldik7
CisJCS8qIGNhbiBmYWlsIHBhcnRpYWxseSAqLwogCQlpZiAocmV0KQotCQkJcmV0dXJuIHJl
dDsKKwkJCWdvdG8gZnJlZV91cmJzOwogCiAJCXJldCA9IGVzNTh4X3NldF9yZWFsdGltZV9k
aWZmX25zKGVzNTh4X2Rldik7CiAJCWlmIChyZXQpCi0tIAoyLjUyLjAKCg==

--------------XEcuyIL7xgatR37yyvk7tGDd--

