Return-Path: <linux-usb+bounces-25791-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E70B0486E
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 22:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DDB84A6464
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 20:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4100F24EA81;
	Mon, 14 Jul 2025 20:28:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5941023A57F
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 20:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524886; cv=none; b=X9mKQG7OoRYvFWQgrUXg0LsktmkRkHP3HSjBcRY9Exofn3FbYjLze4j6jbtmT3uramGh+lbWUm7Y7XWl3g4CsdaMxUgVQqpveDLcd9BdMbm8FPfDI+gkbclyM6aZ1UeU0QuYEPPWZ4MLGGDWPR+/7jrLLagkoNNymX55ULOI9A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524886; c=relaxed/simple;
	bh=ZnJqAflWsKEdHGKvLIrAEjR5k0Dz87YTYYrBO4IKE9M=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=boU7hAbblgPwBYjt6SWxkgM+WfVySnZUH5pjLRnS/nRxyqVSCUD4V0CtttlkDjnaphtgSvsuf6eqe5kFLTmSArMsOcxl5c5TyXTI30QNEJ2bAjpyumK3r62gLJDkUZp/v9IBRTTBZBtoiBZCF1fYtEtKyK6Erg8523AweCtchtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86cff1087deso953841539f.2
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 13:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752524884; x=1753129684;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=98TjZeXG3VE4MdrIythBGYUD0Adr8lYuykO6pNqgAAk=;
        b=XdZqbRtruhUgrRw7MQe3jnhpmoa/Z0eSZv/fmccaXrRgxBH4oL52n7rqyHSv5sx2jt
         IHQ75Qn6/XF544UM8ik2CTDRejk5gJ82TUY9r6aK9XNftO39K9ztDwKnFFxb/3SKlCE7
         qxgooRkM9Q/CCHYMLF+AADLNkgqI+ph/S2wkwPBAZ2eH+KviyLw9WluCn6tPphzJZZwF
         4S8cPP0qYHXjgg/a8Aaj6xmxP8yF4NtNSMc4x3KtH5pPnafeu1GCWqHkT55cYzg90v4o
         0CQPXKQLQfERrGDlK83z4NBiiYydEjG0USV4e2YQ4yCzyQ9ehKqBmfAcMan0zH0DqHh+
         kRlA==
X-Forwarded-Encrypted: i=1; AJvYcCVVN9yjSerg3MBveq/IvUXv+lQX0jvv4RYp+ruU+ThBHEjdYFW0Hjf7ng7cMCAPEEbL1tF9yBTiBwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6JI9ijstmCJbIDZ0bLmdAOBFzSYii58yj9bC/Nv3zuddCAV86
	J9f+bUsed9/KGA7MNADbuJXx8tQgP3MnzRUHg5rje++04pU9XmRxGZkLBxsTF3ez8mPNj4N7KjF
	OXaArO8f9krzMTv4GS+3Yc4CdhAac1bghjXg3Q7MMVo3IKeYhcrXSsXS/+bg=
X-Google-Smtp-Source: AGHT+IETJ3Eh3fLrx3bfKYNlCDoQT5BYHUHjrKZI9YXhHuqPW571tOuI3xtdagEQrmLTlU/irxwABmkZ2nGV+BkVLn4aW+bZAji1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:15c6:b0:875:d450:9297 with SMTP id
 ca18e2360f4ac-87977f735e1mr1598853339f.5.1752524884484; Mon, 14 Jul 2025
 13:28:04 -0700 (PDT)
Date: Mon, 14 Jul 2025 13:28:04 -0700
In-Reply-To: <ea7f1f42-273b-4c07-8bf2-769992dd9ced@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68756854.a70a0220.18f9d4.0007.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
From: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
UBSAN: shift-out-of-bounds in s32ton

usb 4-1: config 0 interface 0 altsetting 0 has 1 endpoint descriptor, different from the interface descriptor's value: 9
usb 4-1: New USB device found, idVendor=045e, idProduct=07da, bcdDevice= 0.00
usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 4-1: config 0 descriptor??
microsoft 0003:045E:07DA.0001: ignoring exceeding usage max
microsoft 0003:045E:07DA.0001: unsupported Resolution Multiplier 0
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in drivers/hid/hid-core.c:69:16
shift exponent 4294967295 is too large for 32-bit type 'int'
CPU: 1 UID: 0 PID: 2803 Comm: kworker/1:2 Not tainted 6.15.0-syzkaller-11339-gc2ca42f190b6 #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:233 [inline]
 __ubsan_handle_shift_out_of_bounds+0x27f/0x420 lib/ubsan.c:494
 s32ton.cold+0x37/0x9c drivers/hid/hid-core.c:69
 hid_output_field drivers/hid/hid-core.c:1841 [inline]
 hid_output_report+0x36f/0x4a0 drivers/hid/hid-core.c:1874
 __hid_request+0x2b4/0x3c0 drivers/hid/hid-core.c:1997
 hidinput_change_resolution_multipliers drivers/hid/hid-input.c:1950 [inline]
 hidinput_connect+0x1ada/0x2bd0 drivers/hid/hid-input.c:2327
 hid_connect+0x13f3/0x1a60 drivers/hid/hid-core.c:2248
 hid_hw_start drivers/hid/hid-core.c:2363 [inline]
 hid_hw_start+0xaa/0x140 drivers/hid/hid-core.c:2354
 ms_probe+0x195/0x500 drivers/hid/hid-microsoft.c:391
 __hid_device_probe drivers/hid/hid-core.c:2733 [inline]
 hid_device_probe+0x363/0x720 drivers/hid/hid-core.c:2770
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 hid_add_device+0x373/0xa60 drivers/hid/hid-core.c:2916
 usbhid_probe+0xd38/0x13f0 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0x303/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 usb_set_configuration+0x1187/0x1e20 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 usb_new_device+0xd07/0x1a20 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5531 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x2f85/0x5030 drivers/usb/core/hub.c:5913
 process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c5/0x780 kernel/kthread.c:464
 ret_from_fork+0x5b6/0x6c0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
---[ end trace ]---


Tested on:

commit:         c2ca42f1 HID: core: do not bypass hid_hw_raw_request
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16ecc7d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=255f64b90a60c429
dashboard link: https://syzkaller.appspot.com/bug?extid=b63d677d63bcac06cf90
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.

